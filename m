Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ECA27FFB1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 15:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272.4273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNyGN-0006KI-VR; Thu, 01 Oct 2020 13:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272.4273; Thu, 01 Oct 2020 13:04:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNyGN-0006Jt-S1; Thu, 01 Oct 2020 13:04:47 +0000
Received: by outflank-mailman (input) for mailman id 1272;
 Thu, 01 Oct 2020 13:04:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNyGM-0006Jo-U1
 for xen-devel@lists.xen.org; Thu, 01 Oct 2020 13:04:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14da7d49-6b15-4817-99d1-30dbf6edc49d;
 Thu, 01 Oct 2020 13:04:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8648AAFA9;
 Thu,  1 Oct 2020 13:04:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bOcq=DI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNyGM-0006Jo-U1
	for xen-devel@lists.xen.org; Thu, 01 Oct 2020 13:04:46 +0000
X-Inumbo-ID: 14da7d49-6b15-4817-99d1-30dbf6edc49d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 14da7d49-6b15-4817-99d1-30dbf6edc49d;
	Thu, 01 Oct 2020 13:04:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601557483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOCFfrREEMYYyFsM+7JREQAW///aGVj3cvAR5WZfCjQ=;
	b=rrr6gfJLKznionkoyvJCCPXYloRaw/QT5Qu5PbDGFFaylNQFqO23iOlISq3JWIf3g1CayO
	69QZejwr6GOqyBNzctF2n9D/7DcLRiiSSsOVggA5U0ApPrLbda73LmpVLlJxUVEswv+dhA
	kbuYTY73axkyi9Ls/vU+c9G+P5pt1Fw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8648AAFA9;
	Thu,  1 Oct 2020 13:04:43 +0000 (UTC)
Subject: Re: [XEN PATCH v14 5/8] xen: Add vmware_port support
To: Don Slutz <don.slutz@gmail.com>
Cc: xen-devel@lists.xen.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <cover.1597854907.git.don.slutz@gmail.com>
 <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9131ac71-e7e8-3a73-10fa-46d7bb5b60ca@suse.com>
Date: Thu, 1 Oct 2020 15:04:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d2e424a19ea4934be3be962cdbe6a0ec8db9a6c.1597854907.git.don.slutz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.08.2020 18:51, Don Slutz wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -504,6 +504,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  
>  static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>  {
> +    uint32_t all_emflags = emflags & XEN_X86_EMU_ALL;
> +
>  #ifdef CONFIG_HVM
>      /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
>      BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
> @@ -512,14 +514,15 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>      if ( is_hvm_domain(d) )
>      {
>          if ( is_hardware_domain(d) &&
> -             emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
> +             all_emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
>              return false;
>          if ( !is_hardware_domain(d) &&
> -             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
> -             emflags != X86_EMU_LAPIC )
> +             all_emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
> +             all_emflags != X86_EMU_LAPIC )
>              return false;
>      }
> -    else if ( emflags != 0 && emflags != X86_EMU_PIT )
> +    else if ( emflags & XEN_X86_EMU_VMWARE_PORT ||
> +              (all_emflags != 0 && all_emflags != X86_EMU_PIT) )
>      {
>          /* PV or classic PVH. */
>          return false;
> @@ -581,7 +584,7 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && is_pv_domain(d) )
>          emflags |= XEN_X86_EMU_PIT;
>  
> -    if ( emflags & ~XEN_X86_EMU_ALL )
> +    if ( emflags & ~(XEN_X86_EMU_ALL | XEN_X86_EMU_VMWARE_PORT) )
>      {
>          printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
>                 d->domain_id, emflags);

Seeing code churn like this one I'm inclined to suggest this shouldn't
be part of this field. Either take it from the top bits of the field
you add in patch 3, or add yet another field. See how the various
Viridian sub-features also didn't go here.

> @@ -600,6 +603,8 @@ int arch_domain_create(struct domain *d,
>      if ( is_hvm_domain(d) )
>      {
>          d->arch.hvm.vmware_hwver = config->arch.vmware_hwver;
> +        d->arch.hvm.is_vmware_port_enabled =
> +            !!(emflags & XEN_X86_EMU_VMWARE_PORT);

While I expect this to move anyway, as a general remark: No need for
!! when the lvalue is of type bool. But then why have the separate
boolean anyway? With how you have things now, you could as well
look at d->arch.emulation_flags, and with the change suggested above
you'd again have another field where the information is already
present.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -697,6 +697,9 @@ int hvm_domain_initialise(struct domain *d)
>      if ( hvm_tsc_scaling_supported )
>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>  
> +    if ( d->arch.hvm.is_vmware_port_enabled )
> +        vmport_register(d);
> +
>      rc = viridian_domain_init(d);
>      if ( rc )
>          goto fail2;
> @@ -4214,6 +4217,12 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>          rc = xsm_hvm_param_nested(XSM_PRIV, d);
>          if ( rc )
>              break;
> +        /* Prevent nestedhvm enable with vmport */
> +        if ( value && d->arch.hvm.is_vmware_port_enabled )
> +        {
> +            rc = -EOPNOTSUPP;
> +            break;
> +        }

Be aware that this case block is about to disappear.

> --- a/xen/arch/x86/hvm/vmware/Makefile
> +++ b/xen/arch/x86/hvm/vmware/Makefile
> @@ -1 +1,2 @@
>  obj-y += vmware.o
> +obj-y += vmport.o

Alphabetically sorted please, again.

> --- /dev/null
> +++ b/xen/arch/x86/hvm/vmware/vmport.c
> @@ -0,0 +1,148 @@
> +/*
> + * HVM VMPORT emulation
> + *
> + * Copyright (C) 2012 Verizon Corporation
> + *
> + * This file is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License Version 2 (GPLv2)
> + * as published by the Free Software Foundation.
> + *
> + * This file is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details. <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/lib.h>
> +#include <asm/hvm/hvm.h>
> +#include <asm/hvm/support.h>
> +
> +#include "backdoor_def.h"
> +
> +static int vmport_ioport(int dir, uint32_t port, uint32_t bytes, uint32_t *val)
> +{
> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
> +
> +    /*
> +     * While VMware expects only 32-bit in, they do support using
> +     * other sizes and out.  However they do require only the 1 port
> +     * and the correct value in eax.  Since some of the data
> +     * returned in eax is smaller the 32 bits and/or you only need
> +     * the other registers the dir and bytes do not need any
> +     * checking.  The caller will handle the bytes, and dir is
> +     * handled below for eax.
> +     */
> +    if ( port == BDOOR_PORT && regs->eax == BDOOR_MAGIC )
> +    {
> +        uint32_t new_eax = ~0u;
> +        uint64_t value;
> +        struct vcpu *curr = current;
> +        struct domain *currd = curr->domain;

Both of these ought to be possible to gain const.

> +        /*
> +         * VMware changes the other (non eax) registers ignoring dir
> +         * (IN vs OUT).  It also changes only the 32-bit part
> +         * leaving the high 32-bits unchanged, unlike what one would
> +         * expect to happen.
> +         */
> +        switch ( regs->ecx & 0xffff )
> +        {
> +        case BDOOR_CMD_GETMHZ:
> +            new_eax = currd->arch.tsc_khz / 1000;
> +            break;
> +
> +        case BDOOR_CMD_GETVERSION:
> +            /* MAGIC */
> +            regs->ebx = BDOOR_MAGIC;

I don't think the comment is of much use here.

> +            /* VERSION_MAGIC */
> +            new_eax = 6;

Didn't the earlier patch talk about version 7?

> +            /* Claim we are an ESX. VMX_TYPE_SCALABLE_SERVER */
> +            regs->ecx = 2;
> +            break;
> +
> +        case BDOOR_CMD_GETHWVERSION:
> +            /* vmware_hw */
> +            new_eax = currd->arch.hvm.vmware_hwver;
> +            /*
> +             * Returning zero is not the best.  VMware was not at
> +             * all consistent in the handling of this command until
> +             * VMware hardware version 4.  So it is better to claim
> +             * 4 then 0.  This should only happen in strange configs.
> +             */
> +            if ( !new_eax )
> +                new_eax = 4;

Doesn't ->arch.hvm.vmware_hwver == 0 mean "VMware emulation disabled"?
Or are the two setting indeed meant to be entirely independent?

> +            break;
> +
> +        case BDOOR_CMD_GETHZ:
> +        {
> +            struct segment_register sreg;
> +
> +            hvm_get_segment_register(curr, x86_seg_ss, &sreg);
> +            if ( sreg.dpl == 0 )

Do you perhaps mean hvm_get_cpl() here?

> +            {
> +                value = currd->arch.tsc_khz * 1000;

No matter that value is uint64_t, you'll only ever get a 32-bit
value calculated here unless you e.g. use 1000UL.

> +                /* apic-frequency (bus speed) */
> +                regs->ecx = 1000000000ULL / APIC_BUS_CYCLE_NS;
> +                /* High part of tsc-frequency */
> +                regs->ebx = value >> 32;
> +                /* Low part of tsc-frequency */
> +                new_eax = value;
> +            }
> +            break;
> +
> +        }
> +        case BDOOR_CMD_GETTIME:
> +            value = get_localtime_us(currd) -
> +                currd->time_offset.seconds * 1000000ULL;

Whereas I don't see the need for the ULL here - seconds is a 64-bit
type already, and you'll wrongly convert from signed to unsigned.

> +            /* hostUsecs */
> +            regs->ebx = value % 1000000UL;
> +            /* hostSecs */
> +            new_eax = value / 1000000ULL;

Why once UL and once ULL? Neither of the suffixes seems necessary,
but at the very least you want to be consistent (unless there's a
reason not to be). (This, the previous, and the next comment apply
again further down.)

> +            /* maxTimeLag */
> +            regs->ecx = 1000000;

And this value is coming from where? If it can't be calculated,
please have the comment say how it was determined.

> +            /* offset to GMT in minutes */
> +            regs->edx = currd->time_offset.seconds / 60;
> +            break;
> +
> +        case BDOOR_CMD_GETTIMEFULL:
> +            /* BDOOR_MAGIC */
> +            new_eax = BDOOR_MAGIC;

Again, the comment isn't very helpful.

> +            value = get_localtime_us(currd) -
> +                currd->time_offset.seconds * 1000000ULL;
> +            /* hostUsecs */
> +            regs->ebx = value % 1000000UL;
> +            /* hostSecs low 32 bits */
> +            regs->edx = value / 1000000ULL;
> +            /* hostSecs high 32 bits */
> +            regs->esi = (value / 1000000ULL) >> 32;
> +            /* maxTimeLag */
> +            regs->ecx = 1000000;
> +            break;
> +
> +        default:
> +            /* Let backing DM handle */
> +            return X86EMUL_UNHANDLEABLE;

If so here, why not also ...

> +        }
> +        if ( dir == IOREQ_READ )
> +            *val = new_eax;
> +    }
> +    else if ( dir == IOREQ_READ )
> +        *val = ~0u;

... here?

> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -162,6 +162,9 @@ struct hvm_domain {
>      spinlock_t             uc_lock;
>      bool_t                 is_in_uc_mode;
>  
> +    /* VMware backdoor port available */
> +    bool_t                 is_vmware_port_enabled;

While as per above I assume this will go away again, as a general remark:
"bool" please in new additions, or even when just touching existing lines.

Jan

