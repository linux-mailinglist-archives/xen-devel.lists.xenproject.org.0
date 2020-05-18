Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7F1D7FB5
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 19:09:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jajGM-0005Az-1n; Mon, 18 May 2020 17:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGN6=7A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jajGK-0005Au-QZ
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 17:09:12 +0000
X-Inumbo-ID: 4b1f4064-992a-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b1f4064-992a-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 17:09:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: H6g83SbejvVrH02O1Q9+qv7KYhczYNrhMvY/kE0e8jTXHP6oEKbpD0Dai7myDthVZv7bNSc+Sc
 lC+ie3J2O9ywlXqRof5Xdx1RWCvuAcwMOYvI9UQBUl7/wYfQUa3bU+mGhwiGRt81GT6iSKYUAC
 FdScaDROyf4ZRxO22RPmqOAEUs8rfOpdrX8tCL/9B2Fx9/XY/wqqcPVVjE9BN9x4xTF7tRy0HL
 rvxbvzCYdHYWmfnMLHJAPENgJG4LbKF7C9N9+j8DwgTAtJa1zopEOi0paFzGKPZPI5zTYOCs0k
 Pxg=
X-SBRS: 2.7
X-MesageID: 18176202
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18176202"
Date: Mon, 18 May 2020 19:09:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/5] x86: suppress XPTI-related TLB flushes when
 possible
Message-ID: <20200518170904.GY54375@Air-de-Roger>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 25, 2019 at 05:23:11PM +0200, Jan Beulich wrote:
> When there's no XPTI-enabled PV domain at all, there's no need to issue
> respective TLB flushes. Hardwire opt_xpti_* to false when !PV, and
> record the creation of PV domains by bumping opt_xpti_* accordingly.
> 
> As to the sticky opt_xpti_domu vs increment/decrement of opt_xpti_hwdom,
> this is done this way to avoid
> (a) widening the former variable,
> (b) any risk of a missed flush, which would result in an XSA if a DomU
>     was able to exercise it, and
> (c) any races updating the variable.
> Fundamentally the TLB flush done when context switching out the domain's
> vCPU-s the last time before destroying the domain ought to be
> sufficient, so in principle DomU handling could be made match hwdom's.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Re-base.
> v2: Add comment to spec_ctrl.h. Explain difference in accounting of DomU
>     and hwdom.
> ---
> TBD: The hardwiring to false could be extended to opt_pv_l1tf_* and (for
>      !HVM) opt_l1d_flush as well.
> 
> ---
>  xen/arch/x86/flushtlb.c         |    2 +-
>  xen/arch/x86/pv/domain.c        |   14 +++++++++++++-
>  xen/arch/x86/spec_ctrl.c        |    6 ++++++
>  xen/include/asm-x86/spec_ctrl.h |   11 +++++++++++
>  4 files changed, 31 insertions(+), 2 deletions(-)
> 
> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -207,7 +207,7 @@ unsigned int flush_area_local(const void
>                   */
>                  invpcid_flush_one(PCID_PV_PRIV, addr);
>                  invpcid_flush_one(PCID_PV_USER, addr);
> -                if ( opt_xpti_hwdom || opt_xpti_domu )
> +                if ( opt_xpti_hwdom > 1 || opt_xpti_domu > 1 )
>                  {
>                      invpcid_flush_one(PCID_PV_PRIV | PCID_PV_XPTI, addr);
>                      invpcid_flush_one(PCID_PV_USER | PCID_PV_XPTI, addr);
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -272,6 +272,9 @@ void pv_domain_destroy(struct domain *d)
>      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
>                                GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
>  
> +    opt_xpti_hwdom -= IS_ENABLED(CONFIG_LATE_HWDOM) &&
> +                      !d->domain_id && opt_xpti_hwdom;
> +
>      XFREE(d->arch.pv.cpuidmasks);
>  
>      FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
> @@ -310,7 +313,16 @@ int pv_domain_initialise(struct domain *
>      /* 64-bit PV guest by default. */
>      d->arch.is_32bit_pv = d->arch.has_32bit_shinfo = 0;
>  
> -    d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
> +    if ( is_hardware_domain(d) && opt_xpti_hwdom )
> +    {
> +        d->arch.pv.xpti = true;
> +        ++opt_xpti_hwdom;
> +    }
> +    if ( !is_hardware_domain(d) && opt_xpti_domu )
> +    {
> +        d->arch.pv.xpti = true;
> +        opt_xpti_domu = 2;

I wonder whether a store fence is needed here in order to guarantee
that opt_xpti_domu is visible to flush_area_local before proceeding
any further with domain creation.

Thanks, Roger.

