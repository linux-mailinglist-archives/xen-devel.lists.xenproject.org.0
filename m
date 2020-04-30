Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8031BFFE2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:16:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAug-0007Mr-S3; Thu, 30 Apr 2020 15:15:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jUAuf-0007Mm-UP
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:15:45 +0000
X-Inumbo-ID: 764d5bb0-8af5-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 764d5bb0-8af5-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 15:15:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CF933ABB2;
 Thu, 30 Apr 2020 15:15:42 +0000 (UTC)
Subject: Re: [PATCH v6 12/15] x86/smpboot: switch pl*e to use new APIs in
 clone_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <a1c29e58a5d40748413e8088ad88ba4319a328d4.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88709097-661e-ce7b-1a46-1dcecf029428@suse.com>
Date: Thu, 30 Apr 2020 17:15:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1c29e58a5d40748413e8088ad88ba4319a328d4.1587735799.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 16:09, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>

Nit: Why the emphasis on pl*e in the title? Is there anything left
unconverted in the function? IOW how about "switch clone_mapping()
to new page table APIs"?

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -672,9 +672,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>  {
>      unsigned long linear = (unsigned long)ptr, pfn;
>      unsigned int flags;
> -    l3_pgentry_t *pl3e;
> -    l2_pgentry_t *pl2e;
> -    l1_pgentry_t *pl1e;
> +    l3_pgentry_t *pl3e = NULL;
> +    l2_pgentry_t *pl2e = NULL;
> +    l1_pgentry_t *pl1e = NULL;

The latter two need initializers, yes, but why pl3e?

> @@ -689,8 +689,8 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>           (linear >= XEN_VIRT_END && linear < DIRECTMAP_VIRT_START) )
>          return -EINVAL;
>  
> -    pl3e = l4e_to_l3e(idle_pg_table[root_table_offset(linear)]) +
> -        l3_table_offset(linear);
> +    pl3e = map_l3t_from_l4e(idle_pg_table[root_table_offset(linear)]);
> +    pl3e += l3_table_offset(linear);

By keeping original style (a single assignment) you'd have slightly
less of a diff, and I think keeping original style where it's not
colliding with any of our rules is generally a good idea. Doing so
won't even make you hit the slightly flawed definition of
map_l3t_from_l4e() at al (missing outer parentheses). I notice you
do so ...

> @@ -702,7 +702,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>      }
>      else
>      {
> -        pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(linear);
> +        pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(linear);
>          flags = l2e_get_flags(*pl2e);
>          ASSERT(flags & _PAGE_PRESENT);
>          if ( flags & _PAGE_PSE )
> @@ -713,7 +713,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>          }
>          else
>          {
> -            pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
> +            pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(linear);

... in both of these cases.

> @@ -724,48 +724,61 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>          }
>      }
>  
> +    UNMAP_DOMAIN_PAGE(pl1e);
> +    UNMAP_DOMAIN_PAGE(pl2e);
> +    UNMAP_DOMAIN_PAGE(pl3e);
> +
>      if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
>      {
> -        pl3e = alloc_xen_pagetable();
> -        if ( !pl3e )
> +        mfn_t l3mfn = alloc_xen_pagetable_new();
> +
> +        if ( mfn_eq(l3mfn, INVALID_MFN) )
>              goto out;
> +
> +        pl3e = map_domain_page(l3mfn);

Seeing this recur (from other patches) I wonder whether we wouldn't
better make map_domain_page() accept INVALID_MFN and return NULL in
this case. In cases like the one here it would eliminate the need
for several local variables. Of course the downside of this is that
then we'll have to start checking map_domain_page()'s return value.
A middle ground could be to have

void *alloc_mapped_pagetable(mfn_t *mfn);

allowing to pass in NULL if the MFN is of no interest.

> @@ -781,6 +794,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
>  
>      rc = 0;
>   out:
> +    UNMAP_DOMAIN_PAGE(pl1e);
> +    UNMAP_DOMAIN_PAGE(pl2e);
> +    UNMAP_DOMAIN_PAGE(pl3e);
>      return rc;
>  }

I don't think the writing of NULL into the variables is necessary
here. And if the needed if()-s are of concern, then perhaps we
should consider making unmap_domain_page() finally accept NULL as
input?

Jan

