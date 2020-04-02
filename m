Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02C19C9FD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 21:28:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK5Uu-0006uO-AB; Thu, 02 Apr 2020 19:27:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jK5Ut-0006uF-A2
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 19:27:27 +0000
X-Inumbo-ID: fb3fae0c-7517-11ea-bc40-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb3fae0c-7517-11ea-bc40-12813bfff9fa;
 Thu, 02 Apr 2020 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585855646;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0/KDRRY/GU4JbKbe1mxyU/E+8AEPozxZ5HNKB69pRC4=;
 b=fnxU6cn6mxnAwB+Z1wOPDlzUT8nSSEz1CLQqJFaj2X4CPnZuUUSyJ94u
 Fo9bYpuGotgLoYNvOhv8gJFGG8fFuuBgi6QWxRmt1F2BINFFTSmr8TXTS
 dJQrG45nOz82NF+Kn71VnuCrFXgHjo3QgTGIlVOSfteiQEtbRBNXN5RYF E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Th6MFBVPi4reJpgwgDy4jIl3tdZUdSm90d6A04M+n2rtNDZnYhyfTyHG7NRFOabABi2n6T0N87
 kdPfinoDRNw0ES+Qyh/Yz0Ej1eNnD/e6UcjcTCpF8XxIfZDqEeNrmjakjmikAGABauj4a0jSpG
 7pGtO/do74wG+WBc+0zkWYgvWC8jTUD5yqQ/TIVLMSyy4j4B8pJgGjTNDFsI+0dOrfd52pyLxa
 YLgzeFlI8FXh7P7Gm9Bc5nF2yzFNR3zSGetKZc3hbCeVBlPtJ+RjMXca/xSDcHN7wKoKF0DeqG
 yUE=
X-SBRS: 2.7
X-MesageID: 15313881
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,336,1580792400"; d="scan'208";a="15313881"
Subject: Re: [PATCH v2] x86/PV: remove unnecessary toggle_guest_pt() overhead
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <47cf43bb-9643-011f-45c2-7cb63c422c3f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <61b00d2c-f862-2500-d958-7ff8e8823409@citrix.com>
Date: Thu, 2 Apr 2020 20:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <47cf43bb-9643-011f-45c2-7cb63c422c3f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/12/2019 14:06, Jan Beulich wrote:
> While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
> expensive (but still needed only for the toggle_guest_mode() path), the
> effect of the latter on the exit-to-guest path is not insignificant.
> Move the logic into toggle_guest_mode(), on the basis that
> toggle_guest_pt() will always be invoked in pairs, yet we can't safely
> undo the setting of root_pgt_changed during the second of these
> invocations.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Ohhhhh.

I think this is the first time I've actually understood the "overhead"
you're talking about here, but honestly, I still had to work very hard
to figure it out.

If I were writing the commit message, it would be something like this:

Logic such as guest_io_okay() and guest_get_eff_kern_l1e() calls
toggle_guest_pt() in pairs to pull a value out of guest kernel memory,
then return to the previous pagetable context.

This is transparent and doesn't modify the pagetables, so there is no
need to undergo an expensive resync on the return-to-guest path
triggered by setting cpu_info->root_pgt_changed.

Move the logic from _toggle_guest_pt() to toggle_guest_mode(), which is
intending to return to guest context in a different pagetable context.

> ---
> v2: Extend description.
>
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -365,18 +365,10 @@ bool __init xpti_pcid_enabled(void)
>  
>  static void _toggle_guest_pt(struct vcpu *v)
>  {
> -    const struct domain *d = v->domain;
> -    struct cpu_info *cpu_info = get_cpu_info();
>      unsigned long cr3;
>  
>      v->arch.flags ^= TF_kernel_mode;
>      update_cr3(v);
> -    if ( d->arch.pv.xpti )
> -    {
> -        cpu_info->root_pgt_changed = true;
> -        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
> -                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
> -    }
>  
>      /*
>       * Don't flush user global mappings from the TLB. Don't tick TLB clock.
> @@ -384,15 +376,11 @@ static void _toggle_guest_pt(struct vcpu
>       * In shadow mode, though, update_cr3() may need to be accompanied by a
>       * TLB flush (for just the incoming PCID), as the top level page table may
>       * have changed behind our backs. To be on the safe side, suppress the
> -     * no-flush unconditionally in this case. The XPTI CR3 write, if enabled,
> -     * will then need to be a flushing one too.
> +     * no-flush unconditionally in this case.
>       */
>      cr3 = v->arch.cr3;
> -    if ( shadow_mode_enabled(d) )
> -    {
> +    if ( shadow_mode_enabled(v->domain) )
>          cr3 &= ~X86_CR3_NOFLUSH;
> -        cpu_info->pv_cr3 &= ~X86_CR3_NOFLUSH;
> -    }
>      write_cr3(cr3);
>  
>      if ( !(v->arch.flags & TF_kernel_mode) )
> @@ -408,6 +396,8 @@ static void _toggle_guest_pt(struct vcpu
>  
>  void toggle_guest_mode(struct vcpu *v)
>  {
> +    const struct domain *d = v->domain;
> +
>      ASSERT(!is_pv_32bit_vcpu(v));
>  
>      /* %fs/%gs bases can only be stale if WR{FS,GS}BASE are usable. */
> @@ -421,6 +411,21 @@ void toggle_guest_mode(struct vcpu *v)
>      asm volatile ( "swapgs" );
>  
>      _toggle_guest_pt(v);
> +
> +    if ( d->arch.pv.xpti )
> +    {
> +        struct cpu_info *cpu_info = get_cpu_info();
> +
> +        cpu_info->root_pgt_changed = true;
> +        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
> +                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
> +        /*
> +         * As in _toggle_guest_pt() the XPTI CR3 write needs to be a TLB-
> +         * flushing one too for shadow mode guests.
> +         */
> +        if ( shadow_mode_enabled(d) )
> +            cpu_info->pv_cr3 &= ~X86_CR3_NOFLUSH;
> +    }
>  }
>  

I think this wants a note for anyone trying to follow the logic.

/* Must be called in matching pairs without returning to guest context
inbetween. */

>  void toggle_guest_pt(struct vcpu *v)

If the callers were more complicated than they are, or we might credibly
gain more users, I would suggest it would be worth trying to assert the
"called in pairs" aspect.

However, I can't think of any trivial way to check this, and I don't
think it is worth a complicated check.

~Andrew

