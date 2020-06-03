Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83501ECB77
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 10:28:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgOlI-0007Av-Dn; Wed, 03 Jun 2020 08:28:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZjh=7Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jgOlH-0007Aq-Ai
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 08:28:35 +0000
X-Inumbo-ID: 354fc758-a574-11ea-acc2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 354fc758-a574-11ea-acc2-12813bfff9fa;
 Wed, 03 Jun 2020 08:28:32 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5Pfd5EA0FO29FX/5b5K50PyQN2pKtRGvcejWlONWK1Ob81Dtm2wlUUXtbTIPTJ/TZ09a0RgERK
 wlTcfTJdI2gomLzUalE5WXNoWHTFt+X+ZAvmGoS9ajHgmFn9jtWefkdWLR6G5Fv2cMdAB8Is9Q
 GwPXa4xLDW3uuPJBuap0X7HieuAXwjaB2psBGZYmDdfXifGYQAgIRNRYNQhachE63eE7KOtHky
 nkDHChw0ACKXaaotL84cDkO1326bi71w/M0mlzmCkijAhm1l7ubaauLBUMewOjCAah5CsEbqfk
 37c=
X-SBRS: 2.7
X-MesageID: 19093770
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19093770"
Date: Wed, 3 Jun 2020 10:28:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 for-4.14] x86/monitor: revert default behavior when
 monitoring register  write events
Message-ID: <20200603082824.GC1195@Air-de-Roger>
References: <20200602134909.66581-1-tamas@tklengyel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200602134909.66581-1-tamas@tklengyel.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 07:49:09AM -0600, Tamas K Lengyel wrote:
> For the last couple years we have received numerous reports from users of
> monitor vm_events of spurious guest crashes when using events. In particular,
> it has observed that the problem occurs when vm_events are being disabled. The
> nature of the guest crash varied widely and has only occured occasionally. This
> made debugging the issue particularly hard. We had discussions about this issue
> even here on the xen-devel mailinglist with no luck figuring it out.
> 
> The bug has now been identified as a race-condition between register event
> handling and disabling the monitor vm_event interface.
> 
> Patch 96760e2fba100d694300a81baddb5740e0f8c0ee, "vm_event: deny register writes
> if refused by  vm_event reply" is the patch that introduced the error. In this

FWIW, we use the 'Fixes:' tag in order to make it easier for
maintainers of stable trees to know which bugfixes to pick. This
should have:

Fixes: 96760e2fba10 ('vm_event: deny register writes if refused by vm_event reply')

Before the SoB.

> patch the default behavior regarding emulation of register write events is
> changed so that they get postponed until the corresponding vm_event handler
> decides whether to allow such write to take place. Unfortunately this can only
> be implemented by performing the deny/allow step when the vCPU gets scheduled.
> Due to that postponed emulation of the event if the user decides to pause the
> VM in the vm_event handler and then disable events, the entire emulation step
> is skipped the next time the vCPU is resumed. Even if the user doesn't pause
> during the vm_event handling but exits immediately and disables vm_event, the
> situation becomes racey as disabling vm_event may succeed before the guest's
> vCPUs get scheduled with the pending emulation task. This has been particularly
> the case with VMS that have several vCPUs as after the VM is unpaused it may
> actually take a long time before all vCPUs get scheduled.
> 
> In this patch we are reverting the default behavior to always perform emulation
> of register write events when the event occurs. To postpone them can be turned
> on as an option. In that case the user of the interface still has to take care
> of only disabling the interface when its safe as it remains buggy.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Thanks for taking care of this!

> ---
>  xen/arch/x86/hvm/hvm.c            | 14 ++++++++------
>  xen/arch/x86/hvm/monitor.c        | 13 ++++++++-----
>  xen/arch/x86/monitor.c            | 10 +++++++++-
>  xen/include/asm-x86/domain.h      |  1 +
>  xen/include/asm-x86/hvm/monitor.h |  7 +++----
>  xen/include/public/domctl.h       |  1 +
>  6 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 74c9f84462..5bb47583b3 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3601,13 +3601,15 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>  
>          ASSERT(v->arch.vm_event);
>  
> -        /* The actual write will occur in hvm_do_resume() (if permitted). */
> -        v->arch.vm_event->write_data.do_write.msr = 1;
> -        v->arch.vm_event->write_data.msr = msr;
> -        v->arch.vm_event->write_data.value = msr_content;
> +        if ( hvm_monitor_msr(msr, msr_content, msr_old_content) )
> +        {
> +            /* The actual write will occur in hvm_do_resume(), if permitted. */
> +            v->arch.vm_event->write_data.do_write.msr = 1;
> +            v->arch.vm_event->write_data.msr = msr;
> +            v->arch.vm_event->write_data.value = msr_content;
>  
> -        hvm_monitor_msr(msr, msr_content, msr_old_content);
> -        return X86EMUL_OKAY;
> +            return X86EMUL_OKAY;
> +        }
>      }
>  
>      if ( (ret = guest_wrmsr(v, msr, msr_content)) != X86EMUL_UNHANDLEABLE )
> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> index 8aa14137e2..36894b33a4 100644
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -53,11 +53,11 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value, unsigned long old)
>              .u.write_ctrlreg.old_value = old
>          };
>  
> -        if ( monitor_traps(curr, sync, &req) >= 0 )
> -            return 1;
> +        return monitor_traps(curr, sync, &req) >= 0 &&
> +            curr->domain->arch.monitor.control_register_values;

Nit (it can be fixed while committing IMO): curr should be aligned to
monitor.

>      }
>  
> -    return 0;
> +    return false;
>  }
>  
>  bool hvm_monitor_emul_unimplemented(void)
> @@ -77,7 +77,7 @@ bool hvm_monitor_emul_unimplemented(void)
>          monitor_traps(curr, true, &req) == 1;
>  }
>  
> -void hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
> +bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
>  {
>      struct vcpu *curr = current;
>  
> @@ -92,8 +92,11 @@ void hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value)
>              .u.mov_to_msr.old_value = old_value
>          };
>  
> -        monitor_traps(curr, 1, &req);
> +        return monitor_traps(curr, 1, &req) >= 0 &&
> +            curr->domain->arch.monitor.control_register_values;

Same here.

>      }
> +
> +    return false;
>  }
>  
>  void hvm_monitor_descriptor_access(uint64_t exit_info,
> diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> index bbcb7536c7..1517a97f50 100644
> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -144,7 +144,15 @@ int arch_monitor_domctl_event(struct domain *d,
>                                struct xen_domctl_monitor_op *mop)
>  {
>      struct arch_domain *ad = &d->arch;
> -    bool requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
> +    bool requested_status;
> +
> +    if ( XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS == mop->op )
> +    {
> +        ad->monitor.control_register_values = true;
> +        return 0;

I think this would be better implemented in arch_monitor_domctl_op
which already handles other XEN_DOMCTL_MONITOR_OP_* options, and also
skips the arch_monitor_domctl_event call?

> +    }
> +
> +    requested_status = (XEN_DOMCTL_MONITOR_OP_ENABLE == mop->op);
>  
>      switch ( mop->event )
>      {
> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
> index e8cee3d5e5..6fd94c2e14 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -418,6 +418,7 @@ struct arch_domain
>           * This is used to filter out pagefaults.
>           */
>          unsigned int inguest_pagefault_disabled                            : 1;
> +        unsigned int control_register_values                               : 1;
>          struct monitor_msr_bitmap *msr_bitmap;
>          uint64_t write_ctrlreg_mask[4];
>      } monitor;
> diff --git a/xen/include/asm-x86/hvm/monitor.h b/xen/include/asm-x86/hvm/monitor.h
> index 66de24cb75..a75cd8545c 100644
> --- a/xen/include/asm-x86/hvm/monitor.h
> +++ b/xen/include/asm-x86/hvm/monitor.h
> @@ -29,15 +29,14 @@ enum hvm_monitor_debug_type
>  };
>  
>  /*
> - * Called for current VCPU on crX/MSR changes by guest.
> - * The event might not fire if the client has subscribed to it in onchangeonly
> - * mode, hence the bool return type for control register write events.
> + * Called for current VCPU on crX/MSR changes by guest. Bool return signals
> + * whether emulation should be postponed.
>   */
>  bool hvm_monitor_cr(unsigned int index, unsigned long value,
>                      unsigned long old);
>  #define hvm_monitor_crX(cr, new, old) \
>                          hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
> -void hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
> +bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
>  void hvm_monitor_descriptor_access(uint64_t exit_info,
>                                     uint64_t vmx_exit_qualification,
>                                     uint8_t descriptor, bool is_write);
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 1ad34c35eb..cbcd25f12c 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1025,6 +1025,7 @@ struct xen_domctl_psr_cmt_op {
>  #define XEN_DOMCTL_MONITOR_OP_DISABLE           1
>  #define XEN_DOMCTL_MONITOR_OP_GET_CAPABILITIES  2
>  #define XEN_DOMCTL_MONITOR_OP_EMULATE_EACH_REP  3
> +#define XEN_DOMCTL_MONITOR_OP_CONTROL_REGISTERS 4

Could you please add a note that this is broken?

Thanks, Roger.

