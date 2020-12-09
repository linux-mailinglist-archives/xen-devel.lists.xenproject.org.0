Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00732D4E52
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 23:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48809.86340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8HO-0004f8-Rp; Wed, 09 Dec 2020 22:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48809.86340; Wed, 09 Dec 2020 22:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8HO-0004ej-OC; Wed, 09 Dec 2020 22:49:50 +0000
Received: by outflank-mailman (input) for mailman id 48809;
 Wed, 09 Dec 2020 22:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GmJG=FN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kn8HM-0004ee-Ne
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 22:49:48 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92daae74-1023-4065-8e8a-4d700e7b8f53;
 Wed, 09 Dec 2020 22:49:46 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l11so5447112lfg.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Dec 2020 14:49:46 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d1sm306839lfs.216.2020.12.09.14.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 14:49:44 -0800 (PST)
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
X-Inumbo-ID: 92daae74-1023-4065-8e8a-4d700e7b8f53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eSrfHixI8CRkmO34CVpc+ZRZhqn7TykEpy53kp85QiA=;
        b=N+WYWQ0LLEhlNld8J5Fl/gsIEOhO3z+dEIFqNTthPUI2eaov5LVY4usqY997A5tqzm
         6kwZ2GU+W+oVYfq9YshNO9WrXFYLXEslDFfCNldkNvUorbqcZ2FAGRleAekubW7PBQqA
         BqZmy7Fxop6jrLR6gEoEAhvF5OWNwAc9RGVmwIOaNsAj4JrLVj/lG0e0AhACsq+EQ4Wq
         YG5C0710Ga0ZAkAlzwrZ0aE6RTs8Ybirzz7wQO8AYrNGTAg66WXXeOdSHuKG+MVtlfRp
         WW8/6hTckm02ibLJF5Mmwrtez0sJYaf2XnNge9SklbCyvNw5JHQOKyKNAXVqBpnKLywK
         a0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eSrfHixI8CRkmO34CVpc+ZRZhqn7TykEpy53kp85QiA=;
        b=tPdbO140e9H1ZykBSdOS1sQFcQliw1yX7WsoNtW5P8mE58BkjN0MQmegfcT7QoYkL0
         dlRwtMWcqt63XC1BLm8mbpOWTjmD4skQO1M91lxWxOeDMhnTfllZXb45kSJk1/nz/LPV
         DuqnT7v5/+LCncc5c3SL+fvSjkeIm4qSq4Su+YGIVKN0bI7dRftwzLSG/CCvw2UhQkgt
         MI9JgZVHF6yyfTjLchUMzRWn30vB8zSP5UdyOIED6N0vswokzK9lpLptaRlrw+YVcPpy
         bNMpsDzFTfgFdJsCrGgSOQeMActsaJUOq0xCPSF4Vz2dqkeVzqpfYL73jnre+7hjRlVq
         de4w==
X-Gm-Message-State: AOAM532WqNEdSX5myR5hooVsQc7OWgBPMPtGpTwlnpD941l1PNq/2pD2
	f0/grLCakIBxjPUdQunyp80=
X-Google-Smtp-Source: ABdhPJwOGO2pFef1l1LzMAhYURGFX6N0dKB995JVawqAKJ/up+SBjA54KSr/99C0K4P6g1kC8lNIfg==
X-Received: by 2002:ac2:4ec1:: with SMTP id p1mr1707877lfr.394.1607554185331;
        Wed, 09 Dec 2020 14:49:45 -0800 (PST)
Subject: Re: [PATCH V3 14/23] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-15-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091357430.20986@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <31e35f5d-5ab4-19bf-e36b-8e7c0b7bf7d4@gmail.com>
Date: Thu, 10 Dec 2020 00:49:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091357430.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.12.20 00:04, Stefano Stabellini wrote:

Hi Stefano

> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch adds basic IOREQ/DM support on Arm. The subsequent
>> patches will improve functionality and add remaining bits.
>>
>> The IOREQ/DM features are supposed to be built with IOREQ_SERVER
>> option enabled, which is disabled by default on Arm for now.
>>
>> Please note, the "PIO handling" TODO is expected to left unaddressed
>> for the current series. It is not an big issue for now while Xen
>> doesn't have support for vPCI on Arm. On Arm64 they are only used
>> for PCI IO Bar and we would probably want to expose them to emulator
>> as PIO access to make a DM completely arch-agnostic. So "PIO handling"
>> should be implemented when we add support for vPCI.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Changes RFC -> V1:
>>     - was split into:
>>       - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>       - xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>>     - update patch description
>>     - update asm-arm/hvm/ioreq.h according to the newly introduced arch functions:
>>       - arch_hvm_destroy_ioreq_server()
>>       - arch_handle_hvm_io_completion()
>>     - update arch files to include xen/ioreq.h
>>     - remove HVMOP plumbing
>>     - rewrite a logic to handle properly case when hvm_send_ioreq() returns IO_RETRY
>>     - add a logic to handle properly handle_hvm_io_completion() return value
>>     - rename handle_mmio() to ioreq_handle_complete_mmio()
>>     - move paging_mark_pfn_dirty() to asm-arm/paging.h
>>     - remove forward declaration for hvm_ioreq_server in asm-arm/paging.h
>>     - move try_fwd_ioserv() to ioreq.c, provide stubs if !CONFIG_IOREQ_SERVER
>>     - do not remove #ifdef CONFIG_IOREQ_SERVER in memory.c for guarding xen/ioreq.h
>>     - use gdprintk in try_fwd_ioserv(), remove unneeded prints
>>     - update list of #include-s
>>     - move has_vpci() to asm-arm/domain.h
>>     - add a comment (TODO) to unimplemented yet handle_pio()
>>     - remove hvm_mmio_first(last)_byte() and hvm_ioreq_(page/vcpu/server) structs
>>       from the arch files, they were already moved to the common code
>>     - remove set_foreign_p2m_entry() changes, they will be properly implemented
>>       in the follow-up patch
>>     - select IOREQ_SERVER for Arm instead of Arm64 in Kconfig
>>     - remove x86's realmode and other unneeded stubs from xen/ioreq.h
>>     - clafify ioreq_t p.df usage in try_fwd_ioserv()
>>     - set ioreq_t p.count to 1 in try_fwd_ioserv()
>>
>> Changes V1 -> V2:
>>     - was split into:
>>       - arm/ioreq: Introduce arch specific bits for IOREQ/DM features
>>       - xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed
>>     - update the author of a patch
>>     - update patch description
>>     - move a loop in leave_hypervisor_to_guest() to a separate patch
>>     - set IOREQ_SERVER disabled by default
>>     - remove already clarified /* XXX */
>>     - replace BUG() by ASSERT_UNREACHABLE() in handle_pio()
>>     - remove default case for handling the return value of try_handle_mmio()
>>     - remove struct hvm_domain, enum hvm_io_completion, struct hvm_vcpu_io,
>>       struct hvm_vcpu from asm-arm/domain.h, these are common materials now
>>     - update everything according to the recent changes (IOREQ related function
>>       names don't contain "hvm" prefixes/infixes anymore, IOREQ related fields
>>       are part of common struct vcpu/domain now, etc)
>>
>> Changes V2 -> V3:
>>     - update patch according the "legacy interface" is x86 specific
>>     - add dummy arch hooks
>>     - remove dummy paging_mark_pfn_dirty()
>>     - don’t include <xen/domain_page.h> in common ioreq.c
>>     - don’t include <public/hvm/ioreq.h> in arch ioreq.h
>>     - remove #define ioreq_params(d, i)
>> ---
>> ---
>>   xen/arch/arm/Makefile           |   2 +
>>   xen/arch/arm/dm.c               |  34 ++++++++++
>>   xen/arch/arm/domain.c           |   9 +++
>>   xen/arch/arm/io.c               |  11 +++-
>>   xen/arch/arm/ioreq.c            | 141 ++++++++++++++++++++++++++++++++++++++++
>>   xen/arch/arm/traps.c            |  13 ++++
>>   xen/include/asm-arm/domain.h    |   3 +
>>   xen/include/asm-arm/hvm/ioreq.h | 139 +++++++++++++++++++++++++++++++++++++++
>>   xen/include/asm-arm/mmio.h      |   1 +
>>   9 files changed, 352 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/dm.c
>>   create mode 100644 xen/arch/arm/ioreq.c
>>   create mode 100644 xen/include/asm-arm/hvm/ioreq.h
>>
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 296c5e6..c3ff454 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -13,6 +13,7 @@ obj-y += cpuerrata.o
>>   obj-y += cpufeature.o
>>   obj-y += decode.o
>>   obj-y += device.o
>> +obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>   obj-y += domain.o
>>   obj-y += domain_build.init.o
>>   obj-y += domctl.o
>> @@ -27,6 +28,7 @@ obj-y += guest_atomics.o
>>   obj-y += guest_walk.o
>>   obj-y += hvm.o
>>   obj-y += io.o
>> +obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>>   obj-y += irq.o
>>   obj-y += kernel.init.o
>>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
>> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
>> new file mode 100644
>> index 0000000..5d3da37
>> --- /dev/null
>> +++ b/xen/arch/arm/dm.c
>> @@ -0,0 +1,34 @@
>> +/*
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <xen/dm.h>
>> +#include <xen/hypercall.h>
>> +
>> +int arch_dm_op(struct xen_dm_op *op, struct domain *d,
>> +               const struct dmop_args *op_args, bool *const_op)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 18cafcd..8f55aba 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -15,6 +15,7 @@
>>   #include <xen/guest_access.h>
>>   #include <xen/hypercall.h>
>>   #include <xen/init.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/lib.h>
>>   #include <xen/livepatch.h>
>>   #include <xen/sched.h>
>> @@ -696,6 +697,10 @@ int arch_domain_create(struct domain *d,
>>   
>>       ASSERT(config != NULL);
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    ioreq_domain_init(d);
>> +#endif
>> +
>>       /* p2m_init relies on some value initialized by the IOMMU subsystem */
>>       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>>           goto fail;
>> @@ -1014,6 +1019,10 @@ int domain_relinquish_resources(struct domain *d)
>>           if (ret )
>>               return ret;
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        ioreq_server_destroy_all(d);
>> +#endif
>> +
>>       PROGRESS(xen):
>>           ret = relinquish_memory(d, &d->xenpage_list);
>>           if ( ret )
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index ae7ef96..f44cfd4 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -23,6 +23,7 @@
>>   #include <asm/cpuerrata.h>
>>   #include <asm/current.h>
>>   #include <asm/mmio.h>
>> +#include <asm/hvm/ioreq.h>
>>   
>>   #include "decode.h"
>>   
>> @@ -123,7 +124,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>   
>>       handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>> -        return IO_UNHANDLED;
>> +    {
>> +        int rc;
>> +
>> +        rc = try_fwd_ioserv(regs, v, &info);
>> +        if ( rc == IO_HANDLED )
>> +            return handle_ioserv(regs, v);
>> +
>> +        return rc;
>> +    }
>>   
>>       /* All the instructions used on emulated MMIO region should be valid */
>>       if ( !dabt.valid )
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> new file mode 100644
>> index 0000000..f08190c
>> --- /dev/null
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -0,0 +1,141 @@
>> +/*
>> + * arm/ioreq.c: hardware virtual machine I/O emulation
>> + *
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <xen/domain.h>
>> +#include <xen/ioreq.h>
>> +
>> +#include <asm/traps.h>
>> +
>> +#include <public/hvm/ioreq.h>
>> +
>> +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>> +{
>> +    const union hsr hsr = { .bits = regs->hsr };
>> +    const struct hsr_dabt dabt = hsr.dabt;
>> +    /* Code is similar to handle_read */
>> +    uint8_t size = (1 << dabt.size) * 8;
>> +    register_t r = v->io.req.data;
>> +
>> +    /* We are done with the IO */
>> +    v->io.req.state = STATE_IOREQ_NONE;
>> +
>> +    if ( dabt.write )
>> +        return IO_HANDLED;
>> +
>> +    /*
>> +     * Sign extend if required.
>> +     * Note that we expect the read handler to have zeroed the bits
>> +     * outside the requested access size.
>> +     */
>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>> +    {
>> +        /*
>> +         * We are relying on register_t using the same as
>> +         * an unsigned long in order to keep the 32-bit assembly
>> +         * code smaller.
>> +         */
>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>> +        r |= (~0UL) << size;
>> +    }
>> +
>> +    set_user_reg(regs, dabt.reg, r);
> Could you introduce a set_user_reg_signextend static inline function
> that can be used both here and in handle_read?
Yes, already done (this was requested by Julien). Please see
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg86986.html


>
>
>> +    return IO_HANDLED;
>> +}
>> +
>> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                             struct vcpu *v, mmio_info_t *info)
>> +{
>> +    struct vcpu_io *vio = &v->io;
>> +    ioreq_t p = {
>> +        .type = IOREQ_TYPE_COPY,
>> +        .addr = info->gpa,
>> +        .size = 1 << info->dabt.size,
>> +        .count = 1,
>> +        .dir = !info->dabt.write,
>> +        /*
>> +         * On x86, df is used by 'rep' instruction to tell the direction
>> +         * to iterate (forward or backward).
>> +         * On Arm, all the accesses to MMIO region will do a single
>> +         * memory access. So for now, we can safely always set to 0.
>> +         */
>> +        .df = 0,
>> +        .data = get_user_reg(regs, info->dabt.reg),
>> +        .state = STATE_IOREQ_READY,
>> +    };
>> +    struct ioreq_server *s = NULL;
>> +    enum io_state rc;
>> +
>> +    switch ( vio->req.state )
>> +    {
>> +    case STATE_IOREQ_NONE:
>> +        break;
>> +
>> +    case STATE_IORESP_READY:
>> +        return IO_HANDLED;
>> +
>> +    default:
>> +        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
>> +        return IO_ABORT;
>> +    }
>> +
>> +    s = ioreq_server_select(v->domain, &p);
>> +    if ( !s )
>> +        return IO_UNHANDLED;
>> +
>> +    if ( !info->dabt.valid )
>> +        return IO_ABORT;
>> +
>> +    vio->req = p;
>> +
>> +    rc = ioreq_send(s, &p, 0);
>> +    if ( rc != IO_RETRY || v->domain->is_shutting_down )
>> +        vio->req.state = STATE_IOREQ_NONE;
>> +    else if ( !ioreq_needs_completion(&vio->req) )
>> +        rc = IO_HANDLED;
>> +    else
>> +        vio->completion = IO_mmio_completion;
>> +
>> +    return rc;
>> +}
>> +
>> +bool ioreq_complete_mmio(void)
>> +{
>> +    struct vcpu *v = current;
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    const union hsr hsr = { .bits = regs->hsr };
>> +    paddr_t addr = v->io.req.addr;
>> +
>> +    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
>> +    {
>> +        advance_pc(regs, hsr);
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 22bd1bd..036b13f 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -21,6 +21,7 @@
>>   #include <xen/hypercall.h>
>>   #include <xen/init.h>
>>   #include <xen/iocap.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>>   #include <xen/mem_access.h>
>> @@ -1385,6 +1386,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
>>   #ifdef CONFIG_HYPFS
>>       HYPERCALL(hypfs_op, 5),
>>   #endif
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    HYPERCALL(dm_op, 3),
>> +#endif
>>   };
>>   
>>   #ifndef NDEBUG
>> @@ -1956,6 +1960,9 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>>               case IO_HANDLED:
>>                   advance_pc(regs, hsr);
>>                   return;
>> +            case IO_RETRY:
>> +                /* finish later */
>> +                return;
>>               case IO_UNHANDLED:
>>                   /* IO unhandled, try another way to handle it. */
>>                   break;
>> @@ -2254,6 +2261,12 @@ static void check_for_vcpu_work(void)
>>   {
>>       struct vcpu *v = current;
>>   
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    local_irq_enable();
>> +    vcpu_ioreq_handle_completion(v);
>> +    local_irq_disable();
>> +#endif
>> +
>>       if ( likely(!v->arch.need_flush_to_ram) )
>>           return;
>>   
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 6819a3b..c235e5b 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -10,6 +10,7 @@
>>   #include <asm/gic.h>
>>   #include <asm/vgic.h>
>>   #include <asm/vpl011.h>
>> +#include <public/hvm/dm_op.h>
>>   #include <public/hvm/params.h>
>>   
>>   struct hvm_domain
>> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>>   
>>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>>   
>> +#define has_vpci(d)    ({ (void)(d); false; })
>> +
>>   #endif /* __ASM_DOMAIN_H__ */
>>   
>>   /*
>> diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
>> new file mode 100644
>> index 0000000..2bffc7a
>> --- /dev/null
>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>> @@ -0,0 +1,139 @@
>> +/*
>> + * hvm.h: Hardware virtual machine assist interface definitions.
>> + *
>> + * Copyright (c) 2016 Citrix Systems Inc.
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __ASM_ARM_HVM_IOREQ_H__
>> +#define __ASM_ARM_HVM_IOREQ_H__
>> +
>> +#include <xen/ioreq.h>
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v);
>> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                             struct vcpu *v, mmio_info_t *info);
>> +#else
>> +static inline enum io_state handle_ioserv(struct cpu_user_regs *regs,
>> +                                          struct vcpu *v)
>> +{
>> +    return IO_UNHANDLED;
>> +}
>> +
>> +static inline enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                                           struct vcpu *v, mmio_info_t *info)
>> +{
>> +    return IO_UNHANDLED;
>> +}
>> +#endif
> If we are providing stub functions, then we can also provide stub
> functions for:
>
> ioreq_domain_init
> ioreq_server_destroy_all
>
> and avoid the ifdefs.
I got your point. These are common IOREQ interface functions, which 
declarations live in the common header, should I provide
stubs in the common ioreq.h?


>
>
>> +bool ioreq_complete_mmio(void);
>> +
>> +static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
>> +{
>> +    /*
>> +     * TODO: For Arm64, the main user will be PCI. So this should be
>> +     * implemented when we add support for vPCI.
>> +     */
>> +    ASSERT_UNREACHABLE();
>> +    return true;
>> +}
>> +
>> +static inline void msix_write_completion(struct vcpu *v)
>> +{
>> +}
>> +
>> +static inline bool arch_vcpu_ioreq_completion(enum io_completion io_completion)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return true;
>> +}
>> +
>> +/*
>> + * The "legacy" mechanism of mapping magic pages for the IOREQ servers
>> + * is x86 specific, so the following hooks don't need to be implemented on Arm:
>> + * - arch_ioreq_server_map_pages
>> + * - arch_ioreq_server_unmap_pages
>> + * - arch_ioreq_server_enable
>> + * - arch_ioreq_server_disable
>> + */
>> +static inline int arch_ioreq_server_map_pages(struct ioreq_server *s)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void arch_ioreq_server_unmap_pages(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +static inline void arch_ioreq_server_enable(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +static inline void arch_ioreq_server_disable(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +static inline void arch_ioreq_server_destroy(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +static inline int arch_ioreq_server_map_mem_type(struct domain *d,
>> +                                                 struct ioreq_server *s,
>> +                                                 uint32_t flags)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static inline bool arch_ioreq_server_destroy_all(struct domain *d)
>> +{
>> +    return true;
>> +}
>> +
>> +static inline int arch_ioreq_server_get_type_addr(const struct domain *d,
>> +                                                  const ioreq_t *p,
>> +                                                  uint8_t *type,
>> +                                                  uint64_t *addr)
>> +{
>> +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
>> +        return -EINVAL;
>> +
>> +    *type = (p->type == IOREQ_TYPE_PIO) ?
>> +             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
>> +    *addr = p->addr;
> This function is not used in this patch and PIOs are left unimplemented
> according to a few comments, so I am puzzled by this code here. Do we
> need it?
Yes. It is called from ioreq_server_select (common/ioreq.c). I could 
just skip PIO case and use
*type = XEN_DMOP_IO_RANGE_MEMORY, but I didn't want to diverge.


-- 
Regards,

Oleksandr Tyshchenko


