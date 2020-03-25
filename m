Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B3192B7E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 15:49:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH7J2-0001GI-AB; Wed, 25 Mar 2020 14:46:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH7J0-0001GD-Uo
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 14:46:54 +0000
X-Inumbo-ID: 77669d98-6ea7-11ea-8634-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77669d98-6ea7-11ea-8634-12813bfff9fa;
 Wed, 25 Mar 2020 14:46:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0472AC2C;
 Wed, 25 Mar 2020 14:46:52 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4896eacc-10ce-5db9-3990-d74fb05e2ef0@suse.com>
Date: Wed, 25 Mar 2020 15:46:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 01/17] xen/x86: Introduce helpers to
 generate/convert the CR3 from/to a MFN/GFN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Introduce handy helpers to generate/convert the CR3 from/to a MFN/GFN.
> 
> Note that we are using cr3_pa() rather than xen_cr3_to_pfn() because the
> latter does not ignore the top 12-bits.

I'm afraid this remark of yours points at some issue here:
cr3_pa() is meant to act on (real or virtual) CR3 values, but
not (necessarily) on para-virtual ones. E.g. ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1096,7 +1096,7 @@ int arch_set_info_guest(
>      set_bit(_VPF_in_reset, &v->pause_flags);
>  
>      if ( !compat )
> -        cr3_mfn = _mfn(xen_cr3_to_pfn(c.nat->ctrlreg[3]));
> +        cr3_mfn = cr3_to_mfn(c.nat->ctrlreg[3]);

... you're now losing the top 12 bits here, potentially
making ...

>      else
>          cr3_mfn = _mfn(compat_cr3_to_pfn(c.cmp->ctrlreg[3]));
>      cr3_page = get_page_from_mfn(cr3_mfn, d);

... this succeed when it shouldn't.

> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -524,6 +524,26 @@ extern struct rangeset *mmio_ro_ranges;
>  #define compat_pfn_to_cr3(pfn) (((unsigned)(pfn) << 12) | ((unsigned)(pfn) >> 20))
>  #define compat_cr3_to_pfn(cr3) (((unsigned)(cr3) >> 12) | ((unsigned)(cr3) << 20))
>  
> +static inline unsigned long mfn_to_cr3(mfn_t mfn)
> +{
> +    return xen_pfn_to_cr3(mfn_x(mfn));
> +}
> +
> +static inline mfn_t cr3_to_mfn(unsigned long cr3)
> +{
> +    return maddr_to_mfn(cr3_pa(cr3));
> +}
> +
> +static inline unsigned long gfn_to_cr3(gfn_t gfn)
> +{
> +    return xen_pfn_to_cr3(gfn_x(gfn));
> +}
> +
> +static inline gfn_t cr3_to_gfn(unsigned long cr3)
> +{
> +    return gaddr_to_gfn(cr3_pa(cr3));
> +}

Overall I think that when introducing such helpers we need to be
very clear about their intended uses: Bare underlying hardware,
PV guests, or HVM guests. From this perspective I also think that
having MFN and GFN conversions next to each other may be more
confusing than helpful, the more that there are no uses
introduced here for the latter. When applied to HVM guests,
xen_pfn_to_cr3() also shouldn't be used, as that's a PV construct
in the public headers. Yet I thing conversions to/from GFNs
should first and foremost be applicable to HVM guests.

A possible route to go may be to e.g. accompany
{xen,compat}_pfn_to_cr3() with {xen,compat}_mfn_to_cr3(), and
leave the GFN aspect out until such patch that would actually
use them (which may then make clear that these actually want
to live in a header specifically applicable to translated
guests).

Jan

