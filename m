Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61723D02E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 21:31:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3P7T-00073n-Hz; Wed, 05 Aug 2020 19:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3P7R-00073i-Q3
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 19:30:33 +0000
X-Inumbo-ID: 49caa562-2e20-4179-ad6b-5b0ae0a276b3
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49caa562-2e20-4179-ad6b-5b0ae0a276b3;
 Wed, 05 Aug 2020 19:30:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v15so20337003lfg.6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 12:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kv3aU3j6jANp5On1k4mOlf1qgiZKGerRAvM7osri8vo=;
 b=bC8ge7oysmtSVVS2yJGwPT22hbdD+lf4N8tio2YlroXhEmPTdh136kHkNK5HjAJnAC
 4neDZMCGLw2YUrzgWrDgY8Yu22ajR4Cu5KGcRRL7tfsgAHLN4rztfIBjOwvIqHqbzZqj
 iJy/njxUqxC2IJfh7OQX0pEzn/rdRUcHs6jzrX7ukpgOSg/tlfW41PINyxYB8xfF/rxf
 8GhaBm/u4lryS2jy6D4OSgbyF5m5XBJ3gT0Sj2+t65rWJ8AKR8gHN0zlyNLSpU9Lw6Cg
 GkQmtqqtfS+NgQW3e40huRdYOzVqEGcVhIpvyyFkn4ZhtdCKO0V34ZfjTKNmqN8BdsXp
 eTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kv3aU3j6jANp5On1k4mOlf1qgiZKGerRAvM7osri8vo=;
 b=TmuywoS487VdEDZQ4Mx1IzllSSdjq192UDC4hB97iUnpbOyg6OaVEdu+JAa3IWUOZl
 DaGpYUFKPmA028uCRZAItyyXxxEoZxb4v6EUNx6ou0IVhD+132tt63Psjb4QlpCRwjO4
 /1bKPIeMFk7YTQIztjbm10kPnWdu99Jxwitrqi8vZN1u61BFdp5JfnVKgdrmfzr8ph25
 3JyU7k8ETAS5G/kVQjQ7kfBzRyjdGq56XtbBY7iplg250qbgFdH/z4mi9NmCIYd/XiDU
 F8jZUp6J997APkHLeGEjLSZjSS9bM5K5XxxfOvfehLyMfqSSqwJto+zBzqkoHYY7rR7i
 bnXA==
X-Gm-Message-State: AOAM532oCrbRvO1g65u734eTiZkGSNOjMkwQy6Nzk2geE4A8mN3Sv80O
 /GFKbH1BJGDHXkzP9y53Jm0=
X-Google-Smtp-Source: ABdhPJy/tKLuIMuoNWj3Jq2Kfc3/XIBNypmZkIO4uwCqD65vnTyH1/0W/taTYnWn1b5T3aDP56FvZg==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr2314916lfl.176.1596655829662; 
 Wed, 05 Aug 2020 12:30:29 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s9sm1261145ljh.46.2020.08.05.12.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 12:30:29 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
Date: Wed, 5 Aug 2020 22:30:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 17:12, Julien Grall wrote:
> Hi,

Hi Julien


>
> On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch makes possible to forward Guest MMIO accesses
>> to a device emulator on Arm and enables that support for
>> Arm64.
>>
>> Also update XSM code a bit to let DM op be used on Arm.
>> New arch DM op will be introduced in the follow-up patch.
>>
>> Please note, at the moment build on Arm32 is broken
>> (see cmpxchg usage in hvm_send_buffered_ioreq()) if someone
>> wants to enable CONFIG_IOREQ_SERVER due to the lack of
>> cmpxchg_64 support on Arm32.
>>
>> Please note, this is a split/cleanup of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   tools/libxc/xc_dom_arm.c        |  25 +++++++---
>>   xen/arch/arm/Kconfig            |   1 +
>>   xen/arch/arm/Makefile           |   2 +
>>   xen/arch/arm/dm.c               |  34 +++++++++++++
>>   xen/arch/arm/domain.c           |   9 ++++
>>   xen/arch/arm/hvm.c              |  46 +++++++++++++++++-
>>   xen/arch/arm/io.c               |  67 +++++++++++++++++++++++++-
>>   xen/arch/arm/ioreq.c            |  86 
>> +++++++++++++++++++++++++++++++++
>>   xen/arch/arm/traps.c            |  17 +++++++
>>   xen/common/memory.c             |   5 +-
>>   xen/include/asm-arm/domain.h    |  80 +++++++++++++++++++++++++++++++
>>   xen/include/asm-arm/hvm/ioreq.h | 103 
>> ++++++++++++++++++++++++++++++++++++++++
>>   xen/include/asm-arm/mmio.h      |   1 +
>>   xen/include/asm-arm/p2m.h       |   7 +--
>>   xen/include/xsm/dummy.h         |   4 +-
>>   xen/include/xsm/xsm.h           |   6 +--
>>   xen/xsm/dummy.c                 |   2 +-
>>   xen/xsm/flask/hooks.c           |   5 +-
>>   18 files changed, 476 insertions(+), 24 deletions(-)
>>   create mode 100644 xen/arch/arm/dm.c
>>   create mode 100644 xen/arch/arm/ioreq.c
>>   create mode 100644 xen/include/asm-arm/hvm/ioreq.h
>
> It feels to me the patch is doing quite a few things that are 
> indirectly related. Can this be split to make the review easier?
>
> I would like at least the following split from the series:
>    - The tools changes
>    - The P2M changes
>    - The HVMOP plumbing (if we still require them)
Sure, will split.
However, I don't quite understand where we should leave HVMOP plumbing.
If I understand correctly the suggestion was to switch to acquire 
interface instead (which requires a Linux version to be v4.17 at least)?
I suspect, this is all about "xen/privcmd: add 
IOCTL_PRIVCMD_MMAP_RESOURCE" support for Linux?
Sorry, if asking a lot of questions, my developing environment is based 
on Vendor's BSP which uses v4.14 currently.


>
> [...]
>
>> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
>> new file mode 100644
>> index 0000000..2437099
>> --- /dev/null
>> +++ b/xen/arch/arm/dm.c
>> @@ -0,0 +1,34 @@
>> +/*
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
>> +#include <xen/hypercall.h>
>> +#include <asm/vgic.h>
>
> The list of includes sounds strange. Can we make sure to include only 
> necessary headers and add the others when they are required?

Sure, I moved arch_dm_op internals to the next patch in this series, but 
forgot to move corresponding headers as well.


>
>
>> +
>> +int arch_dm_op(struct xen_dm_op *op, struct domain *d,
>> +               const struct dmop_args *op_args, bool *const_op)
>> +{
>> +    return -EOPNOTSUPP;
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
>
>>   long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>>   {
>>       long rc = 0;
>> @@ -111,7 +155,7 @@ long do_hvm_op(unsigned long op, 
>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>               if ( rc )
>>                   goto param_fail;
>>   -            d->arch.hvm.params[a.index] = a.value;
>> +            rc = hvmop_set_param(d, &a);
>>           }
>>           else
>>           {
>> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
>> index ae7ef96..436f669 100644
>> --- a/xen/arch/arm/io.c
>> +++ b/xen/arch/arm/io.c
>> @@ -16,6 +16,7 @@
>>    * GNU General Public License for more details.
>>    */
>>   +#include <xen/hvm/ioreq.h>
>>   #include <xen/lib.h>
>>   #include <xen/spinlock.h>
>>   #include <xen/sched.h>
>> @@ -107,6 +108,62 @@ static const struct mmio_handler 
>> *find_mmio_handler(struct domain *d,
>>       return handler;
>>   }
>>   +#ifdef CONFIG_IOREQ_SERVER
>
> Can we just implement this function in ioreq.c and provide a stub when 
> !CONFIG_IOREQ_SERVER?

Sure


>
>
>> +static enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                                    struct vcpu *v, mmio_info_t *info)
>> +{
>> +    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>> +    ioreq_t p = {
>> +        .type = IOREQ_TYPE_COPY,
>> +        .addr = info->gpa,
>> +        .size = 1 << info->dabt.size,
>> +        .count = 0,
>> +        .dir = !info->dabt.write,
>> +        .df = 0,         /* XXX: What's for? */
>> +        .data = get_user_reg(regs, info->dabt.reg),
>> +        .state = STATE_IOREQ_READY,
>> +    };
>> +    struct hvm_ioreq_server *s = NULL;
>> +    enum io_state rc;
>> +
>> +    switch ( vio->io_req.state )
>> +    {
>> +    case STATE_IOREQ_NONE:
>> +        break;
>> +    default:
>> +        printk("d%u wrong state %u\n", v->domain->domain_id,
>> +               vio->io_req.state);
>
> This will likely want to be a gprintk() or gdprintk() to avoid a guest 
> spamming Xen.

ok


>
>> +        return IO_ABORT;
>> +    }
>> +
>> +    s = hvm_select_ioreq_server(v->domain, &p);
>> +    if ( !s )
>> +        return IO_UNHANDLED;
>> +
>> +    if ( !info->dabt.valid )
>> +    {
>> +        printk("Valid bit not set\n");
>
> Same here. However, I am not convinced this is a useful message to keep.

ok


>
>> +        return IO_ABORT;
>> +    }
>> +
>> +    vio->io_req = p;
>> +
>> +    rc = hvm_send_ioreq(s, &p, 0);
>> +    if ( rc != IO_RETRY || v->domain->is_shutting_down )
>> +        vio->io_req.state = STATE_IOREQ_NONE;
>> +    else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
>> +        rc = IO_HANDLED;
>> +    else
>> +        vio->io_completion = HVMIO_mmio_completion;
>> +
>> +    /* XXX: Decide what to do */
>
> We want to understand how IO_RETRY can happen on x86 first. With that, 
> we should be able to understand whether this can happen on Arm as well.

Noted


>
>
>> +    if ( rc == IO_RETRY )
>> +        rc = IO_HANDLED;
>> +
>> +    return rc;
>> +}
>> +#endif
>> +
>>   enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>>                                 const union hsr hsr,
>>                                 paddr_t gpa)
>> @@ -123,7 +180,15 @@ enum io_state try_handle_mmio(struct 
>> cpu_user_regs *regs,
>>         handler = find_mmio_handler(v->domain, info.gpa);
>>       if ( !handler )
>> -        return IO_UNHANDLED;
>> +    {
>> +        int rc = IO_UNHANDLED;
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        rc = try_fwd_ioserv(regs, v, &info);
>> +#endif
>> +
>> +        return rc;
>> +    }
>>         /* All the instructions used on emulated MMIO region should 
>> be valid */
>>       if ( !dabt.valid )
>> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
>> new file mode 100644
>> index 0000000..a9cc839
>> --- /dev/null
>> +++ b/xen/arch/arm/ioreq.c
>> @@ -0,0 +1,86 @@
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
>> +#include <xen/ctype.h>
>> +#include <xen/hvm/ioreq.h>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/trace.h>
>> +#include <xen/sched.h>
>> +#include <xen/irq.h>
>> +#include <xen/softirq.h>
>> +#include <xen/domain.h>
>> +#include <xen/domain_page.h>
>> +#include <xen/event.h>
>> +#include <xen/paging.h>
>> +#include <xen/vpci.h>
>> +
>> +#include <public/hvm/dm_op.h>
>> +#include <public/hvm/ioreq.h>
>> +
>> +bool handle_mmio(void)
>
> The name of the function is pretty generic and can be confusing on Arm 
> (we already have a try_handle_mmio()).
>
> What is this function supposed to do?
Agree, sounds confusing a bit. I assume it is supposed to complete Guest 
MMIO access after finishing emulation.

Shall I rename it to something appropriate (maybe by adding ioreq prefix)?


>
>
>> +{
>> +    struct vcpu *v = current;
>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>> +    const union hsr hsr = { .bits = regs->hsr };
>> +    const struct hsr_dabt dabt = hsr.dabt;
>> +    /* Code is similar to handle_read */
>> +    uint8_t size = (1 << dabt.size) * 8;
>> +    register_t r = v->arch.hvm.hvm_io.io_req.data;
>> +
>> +    /* We should only be here on Guest Data Abort */
>> +    ASSERT(dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
>> +
>> +    /* We are done with the IO */
>> +    /* XXX: Is it the right place? */
>> +    v->arch.hvm.hvm_io.io_req.state = STATE_IOREQ_NONE;
>> +
>> +    /* XXX: Do we need to take care of write here ? */
>> +    if ( dabt.write )
>> +        return true;
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
>> +
>> +    set_user_reg(regs, dabt.reg, r);
>> +
>> +    return true;
>> +}
>
> [...]
>
>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>> index 9283e5e..0000477 100644
>> --- a/xen/common/memory.c
>> +++ b/xen/common/memory.c
>> @@ -8,6 +8,7 @@
>>    */
>>     #include <xen/domain_page.h>
>> +#include <xen/hvm/ioreq.h>
>>   #include <xen/types.h>
>>   #include <xen/lib.h>
>>   #include <xen/mm.h>
>> @@ -30,10 +31,6 @@
>>   #include <public/memory.h>
>>   #include <xsm/xsm.h>
>>   -#ifdef CONFIG_IOREQ_SERVER
>> -#include <xen/hvm/ioreq.h>
>> -#endif
>> -
>
> Why do you remove something your just introduced?
The reason I guarded that header is to make "xen/mm: Make x86's 
XENMEM_resource_ioreq_server handling common" (previous) patch buildable 
on Arm
without arch IOREQ header added yet. I tried to make sure that the 
result after each patch was buildable to retain bisectability.
As current patch adds Arm IOREQ specific bits (including header), that 
guard could be removed as not needed anymore.


>
>>   #ifdef CONFIG_X86
>>   #include <asm/guest.h>
>>   #endif
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 4e2f582..e060b0a 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -11,12 +11,64 @@
>>   #include <asm/vgic.h>
>>   #include <asm/vpl011.h>
>>   #include <public/hvm/params.h>
>> +#include <public/hvm/dm_op.h>
>> +#include <public/hvm/ioreq.h>
>>   #include <xen/serial.h>
>>   #include <xen/rbtree.h>
>>   +struct hvm_ioreq_page {
>> +    gfn_t gfn;
>> +    struct page_info *page;
>> +    void *va;
>> +};
>
> AFAICT all the structures/define you introduced here are used by the 
> code common. So it feels to me they should be defined in a common header.

Make sense. Probably worth moving. I assume this also applies to x86 ones.


>
>
>> +
>> +struct hvm_ioreq_vcpu {
>> +    struct list_head list_entry;
>> +    struct vcpu      *vcpu;
>> +    evtchn_port_t    ioreq_evtchn;
>> +    bool             pending;
>> +};
>> +
>> +#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
>> +#define MAX_NR_IO_RANGES  256
>> +
>> +#define MAX_NR_IOREQ_SERVERS 8
>> +#define DEFAULT_IOSERVID 0
>> +
>> +struct hvm_ioreq_server {
>> +    struct domain          *target, *emulator;
>> +
>> +    /* Lock to serialize toolstack modifications */
>> +    spinlock_t             lock;
>> +
>> +    struct hvm_ioreq_page  ioreq;
>> +    struct list_head       ioreq_vcpu_list;
>> +    struct hvm_ioreq_page  bufioreq;
>> +
>> +    /* Lock to serialize access to buffered ioreq ring */
>> +    spinlock_t             bufioreq_lock;
>> +    evtchn_port_t          bufioreq_evtchn;
>> +    struct rangeset        *range[NR_IO_RANGE_TYPES];
>> +    bool                   enabled;
>> +    uint8_t                bufioreq_handling;
>> +};
>> +
>>   struct hvm_domain
>>   {
>>       uint64_t              params[HVM_NR_PARAMS];
>> +
>> +    /* Guest page range used for non-default ioreq servers */
>> +    struct {
>> +        unsigned long base;
>> +        unsigned long mask;
>> +        unsigned long legacy_mask; /* indexed by HVM param number */
>> +    } ioreq_gfn;
>> +
>> +    /* Lock protects all other values in the sub-struct and the 
>> default */
>> +    struct {
>> +        spinlock_t              lock;
>> +        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
>> +    } ioreq_server;
>>   };
>>     #ifdef CONFIG_ARM_64
>> @@ -93,6 +145,29 @@ struct arch_domain
>>   #endif
>>   }  __cacheline_aligned;
>>   +enum hvm_io_completion {
>> +    HVMIO_no_completion,
>> +    HVMIO_mmio_completion,
>> +    HVMIO_pio_completion,
>> +    HVMIO_realmode_completion
>> +};
>> +
>> +struct hvm_vcpu_io {
>> +    /* I/O request in flight to device model. */
>> +    enum hvm_io_completion io_completion;
>> +    ioreq_t                io_req;
>> +
>> +    /*
>> +     * HVM emulation:
>> +     *  Linear address @mmio_gla maps to MMIO physical frame 
>> @mmio_gpfn.
>> +     *  The latter is known to be an MMIO frame (not RAM).
>> +     *  This translation is only valid for accesses as per 
>> @mmio_access.
>> +     */
>> +    struct npfec        mmio_access;
>> +    unsigned long       mmio_gla;
>> +    unsigned long       mmio_gpfn;
>> +};
>> +
>>   struct arch_vcpu
>>   {
>>       struct {
>> @@ -206,6 +281,11 @@ struct arch_vcpu
>>        */
>>       bool need_flush_to_ram;
>>   +    struct hvm_vcpu
>> +    {
>> +        struct hvm_vcpu_io hvm_io;
>> +    } hvm;
>> +
>>   }  __cacheline_aligned;
>>     void vcpu_show_execution_state(struct vcpu *);
>> diff --git a/xen/include/asm-arm/hvm/ioreq.h 
>> b/xen/include/asm-arm/hvm/ioreq.h
>> new file mode 100644
>> index 0000000..83a560c
>> --- /dev/null
>> +++ b/xen/include/asm-arm/hvm/ioreq.h
>> @@ -0,0 +1,103 @@
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
>> +#include <public/hvm/ioreq.h>
>> +#include <public/hvm/dm_op.h>
>> +
>> +#define has_vpci(d) (false)
>
> It feels to me this wants to be defined in vcpi.h.

ok, will move.


>
>
>> +
>> +bool handle_mmio(void);
>> +
>> +static inline bool handle_pio(uint16_t port, unsigned int size, int 
>> dir)
>> +{
>> +    /* XXX */
>
> Can you expand this TODO? What do you expect to do?
I didn't expect this to be called on Arm. Sorry, I am not sure l have an 
idea how to handle this properly. I would keep it unimplemented until a 
real reason.
Will expand TODO.


>
>
>> +    BUG();
>> +    return true;
>> +}
>> +
>> +static inline paddr_t hvm_mmio_first_byte(const ioreq_t *p)
>> +{
>> +    return p->addr;
>> +}
>
> I understand that the x86 version is more complex as it check p->df. 
> However, aside reducing the complexity, I am not sure why we would 
> want to diverge it.
>
> After all, IOREQ is now meant to be a common feature.
Well, no objections at all.
Could you please clarify how could 'df' (Direction Flag?) be 
handled/used on Arm? I see that try_fwd_ioserv() always sets it 0. Or I 
need to just reuse x86's helpers as is,
which (together with count = df = 0) will result in what we actually 
have here?


>
>> +
>> +static inline paddr_t hvm_mmio_last_byte(const ioreq_t *p)
>> +{
>> +    unsigned long size = p->size;
>> +
>> +    return p->addr + size - 1;
>> +}
>
> Same.

+


>
>> +
>> +struct hvm_ioreq_server;
>
> Why do we need a forward declaration?

I don't remember exactly, probably this way I temporally solved a build 
issue. Please let me recheck whether we could avoid using it.


>
>
>> +
>> +static inline int p2m_set_ioreq_server(struct domain *d,
>> +                                       unsigned int flags,
>> +                                       struct hvm_ioreq_server *s)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>
> This should be defined in p2m.h. But I am not even sure what it is 
> meant for. Can you expand it?

ok, will move.


In this series I tried to make as much IOREQ code common as possible and 
avoid complicating things, in order to achieve that a few stubs were 
added here. Please note,
that I also considered splitting into arch parts. But some functions 
couldn't be split easily.
This one is called from common hvm_destroy_ioreq_server() with flag 
being 0 (which will result in unmapping ioreq server from p2m type on x86).
I could add a comment describing why this stub is present here.


>
>
>> +
>> +static inline void msix_write_completion(struct vcpu *v)
>> +{
>> +}
>> +
>> +static inline void handle_realmode_completion(void)
>> +{
>> +    ASSERT_UNREACHABLE();
>> +}
>
> realmode is very x86 specific. So I don't think this function should 
> be called from common code. It might be worth considering to split 
> handle_hvm_io_completion() is 2 parts: common and arch specific.

I agree with you that realmode is x86 specific and looks not good in Arm 
header. I was thinking how to split handle_hvm_io_completion() 
gracefully but I failed find a good solution for that, so decided to add 
two stubs (msix_write_completion and handle_realmode_completion) on Arm. 
I could add a comment describing why they are here if appropriate. But 
if you think they shouldn't be called from the common code in any way, I 
will try to split it.


>
>> +
>> +static inline void paging_mark_pfn_dirty(struct domain *d, pfn_t pfn)
>> +{
>> +}
>
> This will want to be stubbed in asm-arm/paging.h.

ok


>
>
>> +
>> +static inline void hvm_get_ioreq_server_range_type(struct domain *d,
>> +                                                   ioreq_t *p,
>> +                                                   uint8_t *type,
>> +                                                   uint64_t *addr)
>> +{
>> +    *type = (p->type == IOREQ_TYPE_PIO) ?
>> +             XEN_DMOP_IO_RANGE_PORT : XEN_DMOP_IO_RANGE_MEMORY;
>> +    *addr = p->addr;
>> +}
>> +
>> +static inline void arch_hvm_ioreq_init(struct domain *d)
>> +{
>> +}
>> +
>> +static inline void arch_hvm_ioreq_destroy(struct domain *d)
>> +{
>> +}
>> +
>> +#define IOREQ_IO_HANDLED     IO_HANDLED
>> +#define IOREQ_IO_UNHANDLED   IO_UNHANDLED
>> +#define IOREQ_IO_RETRY       IO_RETRY
>> +
>> +#endif /* __ASM_X86_HVM_IOREQ_H__ */
>
> s/X86/ARM/

ok


>
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
>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>> index 5fdb6e8..5823f11 100644
>> --- a/xen/include/asm-arm/p2m.h
>> +++ b/xen/include/asm-arm/p2m.h
>> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct 
>> domain *d, unsigned long gfn,
>>                                           mfn_t mfn)
>>   {
>>       /*
>> -     * NOTE: If this is implemented then proper reference counting of
>> -     *       foreign entries will need to be implemented.
>> +     * XXX: handle properly reference. It looks like the page may 
>> not always
>> +     * belong to d.
>>        */
>> -    return -EOPNOTSUPP;
>> +
>> +    return guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_ram_rw);
>
> Treating foreign as p2m_ram_rw is more an hack that a real fix. I have 
> answered to this separately (see my answer on Stefano's e-mail), so we 
> can continue the conversation there.

ok



-- 
Regards,

Oleksandr Tyshchenko


