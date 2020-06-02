Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913611EBA10
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 13:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg4mL-0007B4-Aa; Tue, 02 Jun 2020 11:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg4mJ-0007Ax-TT
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 11:08:19 +0000
X-Inumbo-ID: 5c66761a-a4c1-11ea-8993-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c66761a-a4c1-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 11:08:17 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: CA6JXN5taPJIG5chtMC3k/73aTWN226RsB1rFfHpGv4KZ/MhlIPozAKeYMftYN+ZF2T/HgQ1fC
 8pEJgZqpUdqqERGNhKrxdFcib4FSl15h/tey1hxjI1H/1DESSDbotM5LoH+/Z5eQFM1axKbD08
 MOcTsFSncQRMVr4xCkH69zpVEkudx1pJamUSZ8Mt+Lx9koZavCtCqSjO2BcoxGdpbI3MClf+s9
 HdGOsZ/idZQtkGQjJ6/XNT6VZQmhUUTXloE9yv4EFvsVJLwcwYoMdUDPYkewubfhpkevERZ0mQ
 KOE=
X-SBRS: 2.7
X-MesageID: 19356099
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,464,1583211600"; d="scan'208";a="19356099"
Date: Tue, 2 Jun 2020 13:08:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
Message-ID: <20200602110223.GW1195@Air-de-Roger>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
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

On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> Extend the monitor_op domctl to include option that enables
> controlling what values certain registers are permitted to hold
> by a monitor subscriber.

I think the change could benefit for some more detail commit message
here. Why is this useful?

There already seems to be some support for gating MSR writes, which
seems to be expanded by this commit?

Is it solving some kind of bug reported?

> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  xen/arch/x86/hvm/hvm.c       | 25 ++++++++++++++++---------
>  xen/arch/x86/monitor.c       | 10 +++++++++-
>  xen/include/asm-x86/domain.h |  1 +
>  xen/include/public/domctl.h  |  1 +
>  4 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 09ee299bc7..e6780c685b 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2263,7 +2263,8 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>      {
>          ASSERT(v->arch.vm_event);
>  
> -        if ( hvm_monitor_crX(CR0, value, old_value) )
> +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> +             v->domain->arch.monitor.control_register_values )
>          {
>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>              v->arch.vm_event->write_data.do_write.cr0 = 1;
> @@ -2362,7 +2363,8 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
>      {
>          ASSERT(v->arch.vm_event);
>  
> -        if ( hvm_monitor_crX(CR3, value, old) )
> +        if ( hvm_monitor_crX(CR3, value, old) &&
> +             v->domain->arch.monitor.control_register_values )
>          {
>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>              v->arch.vm_event->write_data.do_write.cr3 = 1;
> @@ -2443,7 +2445,8 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
>      {
>          ASSERT(v->arch.vm_event);
>  
> -        if ( hvm_monitor_crX(CR4, value, old_cr) )
> +        if ( hvm_monitor_crX(CR4, value, old_cr) &&
> +             v->domain->arch.monitor.control_register_values )

I think you could return control_register_values in hvm_monitor_crX
instead of having to add the check to each caller?

>          {
>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>              v->arch.vm_event->write_data.do_write.cr4 = 1;
> @@ -3587,13 +3590,17 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
>  
>          ASSERT(v->arch.vm_event);
>  
> -        /* The actual write will occur in hvm_do_resume() (if permitted). */
> -        v->arch.vm_event->write_data.do_write.msr = 1;
> -        v->arch.vm_event->write_data.msr = msr;
> -        v->arch.vm_event->write_data.value = msr_content;
> -
>          hvm_monitor_msr(msr, msr_content, msr_old_content);
> -        return X86EMUL_OKAY;
> +
> +        if ( v->domain->arch.monitor.control_register_values )

Is there any value in limiting control_register_values to MSR that
represent control registers, like EFER and XSS?

> +        {
> +            /* The actual write will occur in hvm_do_resume(), if permitted. */
> +            v->arch.vm_event->write_data.do_write.msr = 1;
> +            v->arch.vm_event->write_data.msr = msr;
> +            v->arch.vm_event->write_data.value = msr_content;
> +
> +            return X86EMUL_OKAY;
> +        }

You seem to change the previous flow of the function here, that would
just call hvm_monitor_msr and return previously.

Don't you need to move the return from outside the added if condition
in order to keep previous behavior? Or else the write is committed
straight away.

>      }
>  
>      if ( (ret = guest_wrmsr(v, msr, msr_content)) != X86EMUL_UNHANDLEABLE )
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

I think strictly speaking you need to use 1 here, since this variable
is not a boolean.

Thanks, Roger.

