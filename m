Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B126BDC6
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 09:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRgf-0001AJ-2A; Wed, 16 Sep 2020 07:17:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIRge-0001AE-5Y
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 07:17:04 +0000
X-Inumbo-ID: 3d1daee1-8d46-412b-b613-43d8bd9189bc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d1daee1-8d46-412b-b613-43d8bd9189bc;
 Wed, 16 Sep 2020 07:17:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EBB6AC4D;
 Wed, 16 Sep 2020 07:17:16 +0000 (UTC)
Subject: Re: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <110c648d-581c-fd42-5180-7d32653227af@suse.com>
Date: Wed, 16 Sep 2020 09:17:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1155,6 +1155,7 @@ static int acquire_resource(
>          xen_pfn_t gfn_list[ARRAY_SIZE(mfn_list)];
>          unsigned int i;
>  
> +#ifndef CONFIG_ARM
>          /*
>           * FIXME: Until foreign pages inserted into the P2M are properly
>           *        reference counted, it is unsafe to allow mapping of
> @@ -1162,13 +1163,14 @@ static int acquire_resource(
>           */
>          if ( !is_hardware_domain(currd) )
>              return -EACCES;
> +#endif

Instead of #ifdef, may I ask that a predicate like arch_refcounts_p2m()
be used?

>          if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
>              rc = -EFAULT;
>  
>          for ( i = 0; !rc && i < xmar.nr_frames; i++ )
>          {
> -            rc = set_foreign_p2m_entry(currd, gfn_list[i],
> +            rc = set_foreign_p2m_entry(currd, d, gfn_list[i],
>                                         _mfn(mfn_list[i]));

Is it going to lead to proper behavior when d == currd, specifically
for Arm but also in the abstract model? If you expose this to other
than Dom0, this case needs at least considering (and hence mentioning
in the description of why it's safe to permit if you don't reject
such attempts). Personally I'd view it as wrong to use
p2m_map_foreign_rw in this case, even in the event that it can be
shown that nothing breaks in such a case. But I'm open to be
convinced of the opposite.

> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -381,15 +381,8 @@ static inline gfn_t gfn_next_boundary(gfn_t gfn, unsigned int order)
>      return gfn_add(gfn, 1UL << order);
>  }
>  
> -static inline int set_foreign_p2m_entry(struct domain *d, unsigned long gfn,
> -                                        mfn_t mfn)
> -{
> -    /*
> -     * NOTE: If this is implemented then proper reference counting of
> -     *       foreign entries will need to be implemented.
> -     */
> -    return -EOPNOTSUPP;
> -}
> +int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
> +                          unsigned long gfn,  mfn_t mfn);

With this and ...

> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -635,7 +635,8 @@ int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
>                            unsigned long end);
>  
>  /* Set foreign entry in the p2m table (for priv-mapping) */
> -int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
> +int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn);

... this now being identical (and as a result it being expected
that future ports would also want to implement a proper function)
except for the stray blank in the Arm variant, I'd like it to be
at least considered to move the declaration to xen/p2m-common.h.

Jan

