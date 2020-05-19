Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369481D924A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:43:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxpu-0005xC-NJ; Tue, 19 May 2020 08:42:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jaxpt-0005x7-HG
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:42:53 +0000
X-Inumbo-ID: b9fe6226-99ac-11ea-a8e6-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9fe6226-99ac-11ea-a8e6-12813bfff9fa;
 Tue, 19 May 2020 08:42:52 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3mLq1r6D77oju2SHbs9YkPn3FbFuz7bJ9mfmUKCQ0Vu8auB+BGUkl32gGXyIzkLsyorpKDqWNa
 b2e6xAoD8pW49shMm32KbXJwWLAjjkEM+qWkEGNfsA1t/Mw2X3gujQvFcVf2UViwSvXk4b6lal
 qx98L5uUI50CxUq/yxAqfwdrp1om5M6iYLR8jKOqxd3ZpMEXlbcoGv+elPaPUKrcLD9M9DrDhs
 KRr0xZ5jXim1c7BDJETH9I7Qm8+yv1dUMzDCZ/IHV1Gs2UxQ++etZ0aYxoTijlwncSQ83yLz9B
 JVE=
X-SBRS: 2.7
X-MesageID: 17890476
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="17890476"
Date: Tue, 19 May 2020 10:42:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/3] x86: relax GDT check in arch_set_info_guest()
Message-ID: <20200519084242.GZ54375@Air-de-Roger>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <3f78d1dc-720d-6bf3-0911-c19da1a2ddbb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <3f78d1dc-720d-6bf3-0911-c19da1a2ddbb@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Dec 20, 2019 at 02:49:48PM +0100, Jan Beulich wrote:
> It is wrong for us to check frames beyond the guest specified limit
> (in the native case, other than in the compat one).

Wouldn't this result in arch_set_info_guest failing if gdt_ents was
smaller than the maximum? Or all callers always pass gdt_ents set to
the maximum?

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -840,6 +840,7 @@ int arch_set_info_guest(
>  #ifdef CONFIG_PV
>      mfn_t cr3_mfn;
>      struct page_info *cr3_page = NULL;
> +    unsigned int nr_gdt_frames;
>      int rc = 0;
>  #endif
>  
> @@ -951,6 +952,8 @@ int arch_set_info_guest(
>      /* Ensure real hardware interrupts are enabled. */
>      v->arch.user_regs.eflags |= X86_EFLAGS_IF;
>  
> +    nr_gdt_frames = DIV_ROUND_UP(c(gdt_ents), 512);
> +
>      if ( !v->is_initialised )
>      {
>          if ( !compat && !(flags & VGCF_in_kernel) && !c.nat->ctrlreg[1] )
> @@ -982,9 +985,9 @@ int arch_set_info_guest(
>              fail = compat_pfn_to_cr3(pfn) != c.cmp->ctrlreg[3];
>          }
>  
> -        for ( i = 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); ++i )
> -            fail |= v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);
>          fail |= v->arch.pv.gdt_ents != c(gdt_ents);
> +        for ( i = 0; !fail && i < nr_gdt_frames; ++i )
> +            fail |= v->arch.pv.gdt_frames[i] != c(gdt_frames[i]);

fail doesn't need to be OR'ed anymore here, since you check for it in
the loop condition.

>  
>          fail |= v->arch.pv.ldt_base != c(ldt_base);
>          fail |= v->arch.pv.ldt_ents != c(ldt_ents);
> @@ -1089,12 +1092,11 @@ int arch_set_info_guest(
>      else
>      {
>          unsigned long gdt_frames[ARRAY_SIZE(v->arch.pv.gdt_frames)];
> -        unsigned int nr_frames = DIV_ROUND_UP(c.cmp->gdt_ents, 512);
>  
> -        if ( nr_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
> +        if ( nr_gdt_frames > ARRAY_SIZE(v->arch.pv.gdt_frames) )
>              return -EINVAL;

Shouldn't this check be performed when nr_gdt_frames is initialized
instead of here? (as nr_gdt_frames is already used as a limit to
iterate over gdt_frames).

Thanks, Roger.

