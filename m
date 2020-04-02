Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA219BD2C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 09:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJuiz-00054a-J4; Thu, 02 Apr 2020 07:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJuiy-00054T-7F
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 07:57:16 +0000
X-Inumbo-ID: 90ac5e56-74b7-11ea-bb88-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90ac5e56-74b7-11ea-bb88-12813bfff9fa;
 Thu, 02 Apr 2020 07:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10BC8ADB3;
 Thu,  2 Apr 2020 07:57:14 +0000 (UTC)
Subject: Ping: [PATCH v2] x86/PV: remove unnecessary toggle_guest_pt() overhead
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <47cf43bb-9643-011f-45c2-7cb63c422c3f@suse.com>
Message-ID: <e76ebb11-94c7-9d81-1a1a-9a563bd750a1@suse.com>
Date: Thu, 2 Apr 2020 09:57:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <47cf43bb-9643-011f-45c2-7cb63c422c3f@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.12.2019 15:06, Jan Beulich wrote:
> While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
> expensive (but still needed only for the toggle_guest_mode() path), the
> effect of the latter on the exit-to-guest path is not insignificant.
> Move the logic into toggle_guest_mode(), on the basis that
> toggle_guest_pt() will always be invoked in pairs, yet we can't safely
> undo the setting of root_pgt_changed during the second of these
> invocations.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Extend description.

Ping?

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
>  void toggle_guest_pt(struct vcpu *v)
> 


