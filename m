Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2118A1D7D17
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:41:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jahsp-0005VZ-Sr; Mon, 18 May 2020 15:40:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ws3m=7A=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jahsn-0005VT-Nu
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:40:49 +0000
X-Inumbo-ID: f1e07380-991d-11ea-a872-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1e07380-991d-11ea-a872-12813bfff9fa;
 Mon, 18 May 2020 15:40:48 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: MOb2nie1M6IwKbYYf4DS0pS2LH1JcVC+SZf9s+wWZPLPmRyoIgZcHT+heFRF+Ozs+YIEvY0SC7
 orpLa/eJBMaTCcMVEBMSJSBw2Qu5XhwUavdXZE3VxX3Ge61JPbFvapU1XKCbqwQDh1XNhrLJGK
 Ib86cpyl0kxaGgqHWmpVcYZ41RhF5HahwIKpeMZ2FHmDreNExY6wc54jNo9Ln9fuNge55ATs7L
 Af78ABlGPJEdc9+V7LEQMtDaiVmSw9q2GMgbkZOuroorxcAaCmW3E9vdu6+LexS34d7/CKcdHH
 kJU=
X-SBRS: 2.7
X-MesageID: 17831024
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="17831024"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <baf42a0a-0da5-74d6-aaf6-0377af7a8888@citrix.com>
Date: Mon, 18 May 2020 16:40:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518153820.18170-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/05/2020 16:38, Andrew Cooper wrote:
> The reserved_bit_page_fault() paths effectively turn reserved bit faults into
> a warning, but in the light of L1TF, the real impact is far more serious.
>
> Xen does not have any reserved bits set in its pagetables, nor do we permit PV
> guests to write any.  An HVM shadow guest may have reserved bits via the MMIO
> fastpath, but those faults are handled in the VMExit #PF intercept, rather
> than Xen's #PF handler.
>
> There is no need to disable interrupts (in spurious_page_fault()) for
> __page_fault_type() to look at the rsvd bit, nor should extable fixup be
> tolerated.
>
> Make #PF[Rsvd] a hard error, irrespective of mode.  Any new panic() caused by
> this constitutes an L1TF gadget needing fixing.
>
> Additionally, drop the comment for do_page_fault().  It is inaccurate (bit 0
> being set isn't always a protection violation) and stale (missing bits
> 5,6,15,31).
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/traps.c | 39 +++++++++++++--------------------------
>  1 file changed, 13 insertions(+), 26 deletions(-)
>
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 73c6218660..4f8e3c7a32 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1137,15 +1137,6 @@ void do_int3(struct cpu_user_regs *regs)
>      pv_inject_hw_exception(TRAP_int3, X86_EVENT_NO_EC);
>  }
>  
> -static void reserved_bit_page_fault(unsigned long addr,
> -                                    struct cpu_user_regs *regs)
> -{
> -    printk("%pv: reserved bit in page table (ec=%04X)\n",
> -           current, regs->error_code);
> -    show_page_walk(addr);
> -    show_execution_state(regs);
> -}
> -
>  #ifdef CONFIG_PV
>  static int handle_ldt_mapping_fault(unsigned int offset,
>                                      struct cpu_user_regs *regs)
> @@ -1248,10 +1239,6 @@ static enum pf_type __page_fault_type(unsigned long addr,
>      if ( in_irq() )
>          return real_fault;
>  
> -    /* Reserved bit violations are never spurious faults. */
> -    if ( error_code & PFEC_reserved_bit )
> -        return real_fault;
> -
>      required_flags  = _PAGE_PRESENT;
>      if ( error_code & PFEC_write_access )
>          required_flags |= _PAGE_RW;
> @@ -1413,14 +1400,6 @@ static int fixup_page_fault(unsigned long addr, struct cpu_user_regs *regs)
>      return 0;
>  }
>  
> -/*
> - * #PF error code:
> - *  Bit 0: Protection violation (=1) ; Page not present (=0)
> - *  Bit 1: Write access
> - *  Bit 2: User mode (=1) ; Supervisor mode (=0)
> - *  Bit 3: Reserved bit violation
> - *  Bit 4: Instruction fetch
> - */
>  void do_page_fault(struct cpu_user_regs *regs)
>  {
>      unsigned long addr, fixup;
> @@ -1439,6 +1418,18 @@ void do_page_fault(struct cpu_user_regs *regs)
>      if ( unlikely(fixup_page_fault(addr, regs) != 0) )
>          return;
>  
> +    /*
> +     * Xen have reserved bits in its pagetables, nor do we permit PV guests to

This should read "Xen doesn't have"

~Andrew

> +     * write any.  Such entries would be vulnerable to the L1TF sidechannel.
> +     *
> +     * The only logic which intentionally sets reserved bits is the shadow
> +     * MMIO fastpath (SH_L1E_MMIO_*), which is careful not to be
> +     * L1TF-vulnerable, and handled via the VMExit #PF intercept path, rather
> +     * than here.
> +     */
> +    if ( error_code & PFEC_reserved_bit )
> +        goto fatal;
> +
>      if ( unlikely(!guest_mode(regs)) )
>      {
>          enum pf_type pf_type = spurious_page_fault(addr, regs);
> @@ -1457,13 +1448,12 @@ void do_page_fault(struct cpu_user_regs *regs)
>          if ( likely((fixup = search_exception_table(regs)) != 0) )
>          {
>              perfc_incr(copy_user_faults);
> -            if ( unlikely(regs->error_code & PFEC_reserved_bit) )
> -                reserved_bit_page_fault(addr, regs);
>              this_cpu(last_extable_addr) = regs->rip;
>              regs->rip = fixup;
>              return;
>          }
>  
> +    fatal:
>          if ( debugger_trap_fatal(TRAP_page_fault, regs) )
>              return;
>  
> @@ -1475,9 +1465,6 @@ void do_page_fault(struct cpu_user_regs *regs)
>                error_code, _p(addr));
>      }
>  
> -    if ( unlikely(regs->error_code & PFEC_reserved_bit) )
> -        reserved_bit_page_fault(addr, regs);
> -
>      pv_inject_page_fault(regs->error_code, addr);
>  }
>  


