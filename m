Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC601995EA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 14:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJFZM-0002ao-Fg; Tue, 31 Mar 2020 12:00:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJFZK-0002Zy-BH
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 12:00:34 +0000
X-Inumbo-ID: 3939c10c-7347-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3939c10c-7347-11ea-9e09-bc764e2007e4;
 Tue, 31 Mar 2020 12:00:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C378AAC7;
 Tue, 31 Mar 2020 12:00:32 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/mm: fold PGC_broken into PGC_state bits
To: David Woodhouse <dwmw2@infradead.org>
References: <759b48cc361af1136e3cf1658f3dcb1d2937db9c.camel@infradead.org>
 <20200319212150.2651419-1-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9284027-fa3b-478b-5e2f-b3f4622a38bd@suse.com>
Date: Tue, 31 Mar 2020 14:00:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319212150.2651419-1-dwmw2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, hongyxia@amazon.com,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.03.2020 22:21, David Woodhouse wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -422,7 +422,7 @@ long arch_do_domctl(
>                  if ( page->u.inuse.type_info & PGT_pinned )
>                      type |= XEN_DOMCTL_PFINFO_LPINTAB;
>  
> -                if ( page->count_info & PGC_broken )
> +                if ( page_is_broken(page) )
>                      type = XEN_DOMCTL_PFINFO_BROKEN;

Coming back to an earlier request of mine: There are no locks being
held here afaics, so with

#define page_is_broken(pg)         (pgc_is_broken((pg)->count_info))

and

#define pgc_is_broken(pgc)         (pgc_is(pgc, broken) || \
                                    pgc_is(pgc, broken_offlining))

there's a chance that the page gets transitioned from
broken_offlining to broken (by another CPU) between these two
checks, resulting in wrong returned state. Either the latter macro
uses an intermediate variable and ACCESS_ONCE() or, as suggested
before, enumerators get arranged such that the check can be done
(e.g. using binary masking operations) with a single evaluation of
pgc.

This may or may not also be an issue for the other two pgc_is_*(),
but I think at least for symmetry they should then follow suit. At
the very least all three macros need to be immune to uses like
page_is_offlined(pg++) or similar argument expressions with side
effects.

> @@ -1699,19 +1706,18 @@ unsigned int online_page(mfn_t mfn, uint32_t *status)
>      do {
>          ret = *status = 0;
>  
> -        if ( y & PGC_broken )
> +        if ( pgc_is_broken(y) )
>          {
>              ret = -EINVAL;
> -            *status = PG_ONLINE_FAILED |PG_ONLINE_BROKEN;
> +            *status = PG_ONLINE_FAILED | PG_ONLINE_BROKEN;
>              break;
>          }
> -
> -        if ( (y & PGC_state) == PGC_state_offlined )
> +        else if ( pgc_is(y, offlined) )

At the risk of getting flamed again: Even if it was a matter of
taste in new code whether to use "else" in a case like this one,
this isn't new code, and it is in no way necessary to change what
we have for the purpose of this patch. I.e. without even having
to resort to the question of whether personal taste decisions are
to be accepted, this simply falls under "no unrelated /
unnecessary changes please". (FAOD this includes the deletion of
the blank line then as well.)

> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -67,16 +67,32 @@
>   /* 3-bit PAT/PCD/PWT cache-attribute hint. */
>  #define PGC_cacheattr_base PG_shift(6)
>  #define PGC_cacheattr_mask PG_mask(7, 6)
> - /* Page is broken? */
> -#define _PGC_broken       PG_shift(7)
> -#define PGC_broken        PG_mask(1, 7)
> - /* Mutually-exclusive page states: { inuse, offlining, offlined, free }. */
> -#define PGC_state         PG_mask(3, 9)
> -#define PGC_state_inuse   PG_mask(0, 9)
> -#define PGC_state_offlining PG_mask(1, 9)
> -#define PGC_state_offlined PG_mask(2, 9)
> -#define PGC_state_free    PG_mask(3, 9)
> -#define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
> + /*
> +  * Mutually-exclusive page states:
> +  * { inuse, offlining, offlined, free, broken_offlining, broken }
> +  */
> +#define PGC_state                  PG_mask(7, 9)
> +#define PGC_state_inuse            PG_mask(0, 9)
> +#define PGC_state_offlining        PG_mask(1, 9)
> +#define PGC_state_offlined         PG_mask(2, 9)
> +#define PGC_state_free             PG_mask(3, 9)
> +#define PGC_state_broken_offlining PG_mask(4, 9) /* Broken and offlining */
> +#define PGC_state_broken           PG_mask(5, 9) /* Broken and offlined */
> +
> +#define pgc_is(pgc, st)            (((pgc) & PGC_state) == PGC_state_##st)
> +#define page_state_is(pg, st)       pgc_is((pg)->count_info, st)
> +
> +#define pgc_is_broken(pgc)         (pgc_is(pgc, broken) || \
> +                                    pgc_is(pgc, broken_offlining))
> +#define pgc_is_offlined(pgc)       (pgc_is(pgc, offlined) || \
> +                                    pgc_is(pgc, broken))
> +#define pgc_is_offlining(pgc)      (pgc_is(pgc, offlining) || \
> +                                    pgc_is(pgc, broken_offlining))
> +
> +#define page_is_broken(pg)         (pgc_is_broken((pg)->count_info))
> +#define page_is_offlined(pg)       (pgc_is_broken((pg)->count_info))
> +#define page_is_offlining(pg)      (pgc_is_broken((pg)->count_info))

Copy-and-paste mistake (rhs is the same for all three; same for Arm)?
Also there's no need here for the outer pairs of parentheses.

Also, for the next version, may I ask that you number versions in
the subject's tag and that you provide a brief description of
changes from the previous version (if any, but there ought to be
some in a series for there to be a point to send out)? Thanks.

Jan

