Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5132F9418
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 18:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69293.123974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Baf-0005EI-7f; Sun, 17 Jan 2021 17:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69293.123974; Sun, 17 Jan 2021 17:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Baf-0005Dt-47; Sun, 17 Jan 2021 17:11:49 +0000
Received: by outflank-mailman (input) for mailman id 69293;
 Sun, 17 Jan 2021 17:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i0Xk=GU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1Bae-0005Do-46
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 17:11:48 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ad81e1d-dc04-49a5-9441-f789c04ecbce;
 Sun, 17 Jan 2021 17:11:45 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id w26so15813219ljo.4
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 09:11:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s25sm1407630ljo.106.2021.01.17.09.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 09:11:43 -0800 (PST)
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
X-Inumbo-ID: 2ad81e1d-dc04-49a5-9441-f789c04ecbce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oXhYJqZz0HlpMt4WY4aHgi8PudDi1UNYwwnCvN6rHIM=;
        b=LKT4GK2FkAoiBMnJRQ1B74uQBtBn5rRamGfSgRI4CGuwK0puxpvyfLIdXcPRf0keb7
         VsekFlZgLf1Z51Zb73OSiBafh5jFjM9I+UZ/PBgRCSbQ3RySohwueE94wrKG3F8S9ubO
         JE6LfUTdSZ+ZD3wtrnfF1mUnnrx3exqNJFKkKiuFEBmHStcuEmMpKPUsm2BZza+mpl/w
         I5cn4fe/yY+Q9rQIG5uq1OKgV+QHqeIsmo46aszv5TI+yKOWvx2cFnY5PBUg1pR0T0iU
         mtRU5vmGGVGQ93tNj4prNGBX9qQ2u8+X2HSsAA9CGxkdm7B9jaGNu6r/U4lMyasR7YBm
         XcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oXhYJqZz0HlpMt4WY4aHgi8PudDi1UNYwwnCvN6rHIM=;
        b=pu1jZci5ekS70bO1VLuLVN1T0FsmVNtAxhJ4MdsxveKBZNyGJtf2uqHw8Vs11fsweW
         prv1hkV7/EzVkAA0BRGCRqEVsetsfK/rl09pb67W1mIq5Ia5njW0gn2F/cuRdLgZVHc4
         JrUAVs8qSQHEIJ/mlydE8QQWmEiLRk5fmx3K4uAnAeZUANoRLINqHJQfCQG+s6/7DgSC
         lG/iXbbwybFb9yncrN475AMConv1Ii6FNGrth/6otbbgzbI7B/91EsRjks+2ZmOuCaZY
         t9SkV+QfgMrWEK0fP63MFvLAbn1XxjtnrIXIez3Qt6yFB0NsCmMmCDbGNmMldTmBNvak
         WqWg==
X-Gm-Message-State: AOAM531JZZFUum15axNr2MKkPIUEQMfqeMF33UIm2Y95E1ssWK8DHh7c
	b9Co2b69vM7ZBArNUpIWrdTDXc7T5KwAOQ==
X-Google-Smtp-Source: ABdhPJzzxlgNEsZE66VfN/DHUWv8UwBaB2PYZtAOBkkbvtOk18Hh4m9aEHDaaSHAwjC1UwAjlsBeNQ==
X-Received: by 2002:a2e:9654:: with SMTP id z20mr9579810ljh.54.1610903504469;
        Sun, 17 Jan 2021 09:11:44 -0800 (PST)
Subject: Re: [PATCH V4 14/24] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-15-git-send-email-olekstysh@gmail.com>
 <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d54a9ef4-b707-1887-a7f7-b33c6f0f97d9@gmail.com>
Date: Sun, 17 Jan 2021 19:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <355e613a-3c9d-7978-62cd-a35df057e5cd@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.01.21 22:26, Julien Grall wrote:

Hi Julien

>
>
> On 12/01/2021 21:52, Oleksandr Tyshchenko wrote:
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 18cafcd..8f55aba 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -15,6 +15,7 @@
>>   #include <xen/guest_access.h>
>>   #include <xen/hypercall.h>
>>   #include <xen/init.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/lib.h>
>>   #include <xen/livepatch.h>
>>   #include <xen/sched.h>
>> @@ -696,6 +697,10 @@ int arch_domain_create(struct domain *d,
>>         ASSERT(config != NULL);
>>   +#ifdef CONFIG_IOREQ_SERVER
>> +    ioreq_domain_init(d);
>> +#endif
>> +
>>       /* p2m_init relies on some value initialized by the IOMMU 
>> subsystem */
>>       if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
>>           goto fail;
>> @@ -1014,6 +1019,10 @@ int domain_relinquish_resources(struct domain *d)
>>           if (ret )
>>               return ret;
>>   +#ifdef CONFIG_IOREQ_SERVER
>> +        ioreq_server_destroy_all(d);
>> +#endif
>
> The placement of this call feels quite odd. Shouldn't this moved in 
> case 0?

Indeed it is odd to call it here, will move.



>
>> +
>>       PROGRESS(xen):
>>           ret = relinquish_memory(d, &d->xenpage_list);
>>           if ( ret )
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index ae7ef96..9814481 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -16,6 +16,7 @@
>>    * GNU General Public License for more details.
>>    */
>>   +#include <xen/ioreq.h>
>>   #include <xen/lib.h>
>>   #include <xen/spinlock.h>
>>   #include <xen/sched.h>
>> @@ -23,6 +24,7 @@
>>   #include <asm/cpuerrata.h>
>>   #include <asm/current.h>
>>   #include <asm/mmio.h>
>> +#include <asm/hvm/ioreq.h>
>
> Shouldn't this have been included by "xen/ioreq.h"?
Well, for V1 asm/hvm/ioreq.h was included by xen/ioreq.h. But, it turned 
out that there was nothing inside common header required arch one to be 
included and
I was asked to include arch header where it was indeed needed (several 
*.c files).


>
>
>>     #include "decode.h"
>>   @@ -123,7 +125,15 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>         handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>> -        return IO_UNHANDLED;
>> +    {
>> +        int rc;
>> +
>> +        rc = try_fwd_ioserv(regs, v, &info);
>> +        if ( rc == IO_HANDLED )
>> +            return handle_ioserv(regs, v);
>> +
>> +        return rc;
>> +    }
>>         /* All the instructions used on emulated MMIO region should 
>> be valid */
>>       if ( !dabt.valid )
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> new file mode 100644
>> index 0000000..3c4a24d
>> --- /dev/null
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -0,0 +1,213 @@
>> +/*
>> + * arm/ioreq.c: hardware virtual machine I/O emulation
>> + *
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or 
>> modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but 
>> WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of 
>> MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
>> License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License 
>> along with
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
>> +    const union hsr hsr = { .bits = regs->hsr };
>> +    const struct hsr_dabt dabt = hsr.dabt;
>> +    /* Code is similar to handle_read */
>> +    uint8_t size = (1 << dabt.size) * 8;
>> +    register_t r = v->io.req.data;
>> +
>> +    /* We are done with the IO */
>> +    v->io.req.state = STATE_IOREQ_NONE;
>> +
>> +    if ( dabt.write )
>> +        return IO_HANDLED;
>> +
>> +    /*
>> +     * Sign extend if required.
>> +     * Note that we expect the read handler to have zeroed the bits
>> +     * outside the requested access size.
>> +     */
>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>> +    {
>> +        /*
>> +         * We are relying on register_t using the same as
>> +         * an unsigned long in order to keep the 32-bit assembly
>> +         * code smaller.
>> +         */
>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>> +        r |= (~0UL) << size;
>> +    }
>
> Looking at the rest of the series, this code is going to be refactored 
> in patch #19 and then hardened. It would have been better to do the 
> refactoring first and then use it.
>
> This helps a lot for the review and to reduce what I would call churn 
> in the series.

Agree, it would be better.


>
>
> I am OK to keep it like that for this series.

Thank you, this saves me some time.


>
>
>> +
>> +    set_user_reg(regs, dabt.reg, r);
>> +
>> +    return IO_HANDLED;
>> +}
>> +
>> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                             struct vcpu *v, mmio_info_t *info)
>> +{
>> +    struct vcpu_io *vio = &v->io;
>> +    ioreq_t p = {
>> +        .type = IOREQ_TYPE_COPY,
>> +        .addr = info->gpa,
>> +        .size = 1 << info->dabt.size,
>> +        .count = 1,
>> +        .dir = !info->dabt.write,
>> +        /*
>> +         * On x86, df is used by 'rep' instruction to tell the 
>> direction
>> +         * to iterate (forward or backward).
>> +         * On Arm, all the accesses to MMIO region will do a single
>> +         * memory access. So for now, we can safely always set to 0.
>> +         */
>> +        .df = 0,
>> +        .data = get_user_reg(regs, info->dabt.reg),
>> +        .state = STATE_IOREQ_READY,
>> +    };
>> +    struct ioreq_server *s = NULL;
>> +    enum io_state rc;
>> +
>> +    switch ( vio->req.state )
>> +    {
>> +    case STATE_IOREQ_NONE:
>> +        break;
>> +
>> +    case STATE_IORESP_READY:
>> +        return IO_HANDLED;
>
> With the Arm code in mind, I am a bit confused with this check. If 
> vio->req.state == STATE_IORESP_READY, then it would imply that the 
> previous I/O emulation was somehow not completed (from Xen PoV).

Agree


>
> If you return IO_HANDLED here, then it means the we will take care of 
> previous I/O but the current one is going to be ignored. 
Which current one? As I understand, if try_fwd_ioserv() gets called with 
vio->req.state == STATE_IORESP_READY then this is a second round after 
emulator completes the emulation (the first round was when
we returned IO_RETRY down the function and claimed that we would need a 
completion), so we are still dealing with previous I/O.
vcpu_ioreq_handle_completion() -> arch_ioreq_complete_mmio() -> 
try_handle_mmio() -> try_fwd_ioserv() -> handle_ioserv()
And after we return IO_HANDLED here, handle_ioserv() will be called to 
complete the handling of this previous I/O emulation.
Or I really missed something?


> So shouldn't we use the default path here as well?

I am afraid, I don't entirely get the suggestion.


>
>
>> +
>> +    default:
>> +        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
>> +        return IO_ABORT;
>> +    }
>> +
>> +    s = ioreq_server_select(v->domain, &p);
>> +    if ( !s )
>> +        return IO_UNHANDLED;
>> +
>> +    if ( !info->dabt.valid )
>> +        return IO_ABORT;
>> +
>> +    vio->req = p;
>> +
>> +    rc = ioreq_send(s, &p, 0);
>> +    if ( rc != IO_RETRY || v->domain->is_shutting_down )
>> +        vio->req.state = STATE_IOREQ_NONE;
>> +    else if ( !ioreq_needs_completion(&vio->req) )
>> +        rc = IO_HANDLED;
>> +    else
>> +        vio->completion = VIO_mmio_completion;
>> +
>> +    return rc;
>> +}
>> +
>> +bool arch_ioreq_complete_mmio(void)
>> +{
>> +    struct vcpu *v = current;
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    const union hsr hsr = { .bits = regs->hsr };
>> +    paddr_t addr = v->io.req.addr;
>> +
>> +    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
>> +    {
>> +        advance_pc(regs, hsr);
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +    return true;
>> +}
>> +
>> +/*
>> + * The "legacy" mechanism of mapping magic pages for the IOREQ servers
>> + * is x86 specific, so the following hooks don't need to be 
>> implemented on Arm:
>> + * - arch_ioreq_server_map_pages
>> + * - arch_ioreq_server_unmap_pages
>> + * - arch_ioreq_server_enable
>> + * - arch_ioreq_server_disable
>> + */
>> +int arch_ioreq_server_map_pages(struct ioreq_server *s)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +void arch_ioreq_server_unmap_pages(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +void arch_ioreq_server_enable(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +void arch_ioreq_server_disable(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +void arch_ioreq_server_destroy(struct ioreq_server *s)
>> +{
>> +}
>> +
>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>> +                                   struct ioreq_server *s,
>> +                                   uint32_t flags)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +void arch_ioreq_server_map_mem_type_completed(struct domain *d,
>> +                                              struct ioreq_server *s,
>> +                                              uint32_t flags)
>> +{
>> +}
>> +
>> +bool arch_ioreq_server_destroy_all(struct domain *d)
>> +{
>> +    return true;
>> +}
>> +
>> +bool arch_ioreq_server_get_type_addr(const struct domain *d,
>> +                                     const ioreq_t *p,
>> +                                     uint8_t *type,
>> +                                     uint64_t *addr)
>> +{
>> +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
>> +        return false;
>> +
>> +    *type = (p->type == IOREQ_TYPE_PIO) ?
>> +             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
>> +    *addr = p->addr;
>> +
>> +    return true;
>> +}
>> +
>> +void arch_ioreq_domain_init(struct domain *d)
>> +{
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
>>   #include <xen/hypercall.h>
>>   #include <xen/init.h>
>>   #include <xen/iocap.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/irq.h>
>>   #include <xen/lib.h>
>>   #include <xen/mem_access.h>
>> @@ -1385,6 +1386,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
>>   #ifdef CONFIG_HYPFS
>>       HYPERCALL(hypfs_op, 5),
>>   #endif
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    HYPERCALL(dm_op, 3),
>> +#endif
>>   };
>>     #ifndef NDEBUG
>> @@ -1956,6 +1960,9 @@ static void do_trap_stage2_abort_guest(struct 
>> cpu_user_regs *regs,
>>               case IO_HANDLED:
>>                   advance_pc(regs, hsr);
>>                   return;
>> +            case IO_RETRY:
>> +                /* finish later */
>> +                return;
>>               case IO_UNHANDLED:
>>                   /* IO unhandled, try another way to handle it. */
>>                   break;
>> @@ -2254,6 +2261,12 @@ static void check_for_vcpu_work(void)
>>   {
>>       struct vcpu *v = current;
>>   +#ifdef CONFIG_IOREQ_SERVER
>> +    local_irq_enable();
>> +    vcpu_ioreq_handle_completion(v);
>> +    local_irq_disable();
>> +#endif
>> +
>>       if ( likely(!v->arch.need_flush_to_ram) )
>>           return;
>>   diff --git a/xen/include/asm-arm/domain.h 
>> b/xen/include/asm-arm/domain.h
>> index 6819a3b..c235e5b 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -10,6 +10,7 @@
>>   #include <asm/gic.h>
>>   #include <asm/vgic.h>
>>   #include <asm/vpl011.h>
>> +#include <public/hvm/dm_op.h>
>
> May I ask, why do you need to include dm_op.h here?
I needed to include that header to make some bits visible 
(XEN_DMOP_IO_RANGE_PCI, struct xen_dm_op_buf, etc). Why here - is a 
really good question.
I don't remember exactly, probably I followed x86's domain.h which also 
included it.
So, trying to remove the inclusion here, I get several build failures on 
Arm which could be fixed if I include that header from dm.h and ioreq.h:

Shall I do this way?


diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6bd2d85..9de7c4e 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -10,7 +10,6 @@
  #include <asm/gic.h>
  #include <asm/vgic.h>
  #include <asm/vpl011.h>
-#include <public/hvm/dm_op.h>
  #include <public/hvm/params.h>

  struct hvm_domain
diff --git a/xen/include/xen/dm.h b/xen/include/xen/dm.h
index 2c9952d..4ce6655 100644
--- a/xen/include/xen/dm.h
+++ b/xen/include/xen/dm.h
@@ -19,6 +19,8 @@

  #include <xen/sched.h>

+#include <public/hvm/dm_op.h>
+
  struct dmop_args {
      domid_t domid;
      unsigned int nr_bufs;
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index dc47ec7..7b74983 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -21,6 +21,8 @@

  #include <xen/sched.h>

+#include <public/hvm/dm_op.h>
+
  struct ioreq_page {
      gfn_t gfn;
      struct page_info *page;
(END)


>
>
>>   #include <public/hvm/params.h>
>>     struct hvm_domain
>> @@ -262,6 +263,8 @@ static inline void arch_vcpu_block(struct vcpu 
>> *v) {}
>>     #define arch_vm_assist_valid_mask(d) (1UL << 
>> VMASST_TYPE_runstate_update_flag)
>>   +#define has_vpci(d)    ({ (void)(d); false; })
>> +
>>   #endif /* __ASM_DOMAIN_H__ */
>>     /*
>> diff --git a/xen/include/asm-arm/hvm/ioreq.h 
>> b/xen/include/asm-arm/hvm/ioreq.h
>> new file mode 100644
>> index 0000000..19e1247
>> --- /dev/null
>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>
> Shouldn't this directly be under asm-arm/ rather than asm-arm/hvm/ as 
> the IOREQ is now meant to be agnostic?
Good question... The _common_ IOREQ code is indeed arch-agnostic. But, 
can the _arch_ IOREQ code be treated as really subarch-agnostic?
I think, on Arm it can and it is most likely ok to keep it in 
"asm-arm/", but how it would be correlated with x86's IOREQ code which 
is HVM specific and located
in "hvm" subdir?



>
>> @@ -0,0 +1,72 @@
>> +/*
>> + * hvm.h: Hardware virtual machine assist interface definitions.
>> + *
>> + * Copyright (c) 2016 Citrix Systems Inc.
>> + * Copyright (c) 2019 Arm ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or 
>> modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but 
>> WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of 
>> MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
>> License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License 
>> along with
>> + * this program; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __ASM_ARM_HVM_IOREQ_H__
>> +#define __ASM_ARM_HVM_IOREQ_H__
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu 
>> *v);
>> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                             struct vcpu *v, mmio_info_t *info);
>> +#else
>> +static inline enum io_state handle_ioserv(struct cpu_user_regs *regs,
>> +                                          struct vcpu *v)
>> +{
>> +    return IO_UNHANDLED;
>> +}
>> +
>> +static inline enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                                           struct vcpu *v, 
>> mmio_info_t *info)
>> +{
>> +    return IO_UNHANDLED;
>> +}
>> +#endif
>> +
>> +bool ioreq_complete_mmio(void);
>> +
>> +static inline bool handle_pio(uint16_t port, unsigned int size, int 
>> dir)
>> +{
>> +    /*
>> +     * TODO: For Arm64, the main user will be PCI. So this should be
>> +     * implemented when we add support for vPCI.
>> +     */
>> +    ASSERT_UNREACHABLE();
>> +    return true;
>> +}
>> +
>> +static inline void msix_write_completion(struct vcpu *v)
>> +{
>> +}
>> +
>> +/* This correlation must not be altered */
>> +#define IOREQ_STATUS_HANDLED     IO_HANDLED
>> +#define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
>> +#define IOREQ_STATUS_RETRY       IO_RETRY
>> +
>> +#endif /* __ASM_ARM_HVM_IOREQ_H__ */
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
>> diff --git a/xen/include/asm-arm/mmio.h b/xen/include/asm-arm/mmio.h
>> index 8dbfb27..7ab873c 100644
>> --- a/xen/include/asm-arm/mmio.h
>> +++ b/xen/include/asm-arm/mmio.h
>> @@ -37,6 +37,7 @@ enum io_state
>>       IO_ABORT,       /* The IO was handled by the helper and led to 
>> an abort. */
>>       IO_HANDLED,     /* The IO was successfully handled by the 
>> helper. */
>>       IO_UNHANDLED,   /* The IO was not handled by the helper. */
>> +    IO_RETRY,       /* Retry the emulation for some reason */
>>   };
>>     typedef int (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
>>
>
-- 
Regards,

Oleksandr Tyshchenko


