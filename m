Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E8B277875
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 20:23:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLVt2-0002fM-2j; Thu, 24 Sep 2020 18:22:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOGg=DB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLVt0-0002fH-IL
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 18:22:30 +0000
X-Inumbo-ID: 750e5834-cc72-44ec-b62b-6ee4d2028c49
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 750e5834-cc72-44ec-b62b-6ee4d2028c49;
 Thu, 24 Sep 2020 18:22:28 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z19so5022092lfr.4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PDFVLKcskeFgTuIB3AJsQo6anGx3d66s/34TtD5MJaw=;
 b=eonV/5gvBiWpGN9obUSsA+8zVkf+K8Fp18Zs9/AMqJkSc8tYVfmAiUR1z+78xe95OQ
 RKK0z8I8Iupe/5WlY0sptkfhQOV/J9ciBzXM2THswHeEYc26wD8NOigFR/nGOm3s9fUh
 4j3ezMySaz6VUrBXNDTJJGjlxX/lRMRNlXXzx4H7vURugALz83Z5C54HH6JgJHolrAYI
 LfXPeoyeJXT2mPt1bVMnGISBlPJ0AcKOczuqTX+zoG+IH5xjqFtAeG9YkY0atOi9Veeq
 WOyEviemkaGT66NTA4HmHZzFMti9u2xOk2jrIRZ67ZNoDorkxiWNGXPi2GUpdiGojHgY
 Ht5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PDFVLKcskeFgTuIB3AJsQo6anGx3d66s/34TtD5MJaw=;
 b=WenGuMzTrUrc/Bjg3K5nF0wvthBBwAsc3LhdJhKtQ4IKoHBV1zBIOpAcLi5vFX08YR
 6i8Dh1lzmR11Ir5J7xT14I9d2dT++W0D6n6RGOCBA+hrF6vIybmAKzWKoj/drjM0aLGt
 YbyfRfwPhEJcloJ22XTiH0g1+W7BwwkMRq2MZEwPF9i/6nDwZoNUw2Uzuqj+3ApelGgj
 NZEyVESO3a3K58qol+Ya+AkGeXyysO8I91crz4tqaJmgszk6ud3CaXTEuuddUzi0CPGV
 mth6Q9zhtJKSJ5c4FJAV9O/AUMdwyQ4PH3YRFB78tZhC0VBuNFOJXvgDfjlldtSqI3NH
 RvSw==
X-Gm-Message-State: AOAM532qH22SToK49c0MatqxpzGMf21EIrmvkZWvpikNXE+e24fDC9T4
 Kw8CrjkmDydwdqh7szk5zc0=
X-Google-Smtp-Source: ABdhPJykEtQQBQ+jwdm5z2OA9e0ZOv0wthsRKgfLBCHeyp+qjHpaz3Z6ngxUoww2+q4jDJjDM9zZsw==
X-Received: by 2002:a19:c7d7:: with SMTP id x206mr47743lff.540.1600971747456; 
 Thu, 24 Sep 2020 11:22:27 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k15sm19854lfc.261.2020.09.24.11.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 11:22:26 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <e4009c0f-1057-f031-c3bb-6b7c850a0aa1@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fcb40929-9487-1d20-3990-09c79cab8df8@gmail.com>
Date: Thu, 24 Sep 2020 21:22:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e4009c0f-1057-f031-c3bb-6b7c850a0aa1@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 24.09.20 20:25, Julien Grall wrote:

Hi Julien.

>
>
> On 23/09/2020 21:16, Oleksandr wrote:
>>
>> On 23.09.20 21:03, Julien Grall wrote:
>>> Hi,
>>
>> Hi Julien
>>
>>
>>>
>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> I believe I am the originally author of this code...
>>
>> Sorry, will fix
>>
>>
>>>
>>>> This patch adds basic IOREQ/DM support on Arm. The subsequent
>>>> patches will improve functionality, add remaining bits as well as
>>>> address several TODOs.
>>>
>>> Find a bit weird to add code with TODOs that are handled in the same 
>>> series? Can't we just split this patch in smaller one where 
>>> everything is addressed from start?
>> Sorry if I wasn't clear in description. Let me please clarify.
>> Corresponding RFC patch had 3 major TODOs:
>> 1. Handle properly when hvm_send_ioreq() returns IO_RETRY
>> 2. Proper ref-counting for the foreign entries in 
>> set_foreign_p2m_entry()
>> 3. Check the return value of handle_hvm_io_completion() *and* avoid 
>> calling handle_hvm_io_completion() on every return.
>>
>> TODO #1 was fixed in current patch
>> TODO #2 was fixed in "xen/mm: Handle properly reference in 
>> set_foreign_p2m_entry() on Arm"
>> TODO #3 was partially fixed in current patch (check the return value 
>> of handle_hvm_io_completion()).
>> The second part of TODO #3 (avoid calling handle_hvm_io_completion() 
>> on every return) was moved to a separate patch "xen/ioreq: Introduce 
>> hvm_domain_has_ioreq_server()"
>> and fixed (or probably improved is a better word) there along with 
>> introducing a mechanism to actually improve.
>
> Right, none of those TODOs are described in the code. So it makes more 
> difficult to know what you are actually referring to.
>
> I would suggest to reshuffle the series so the TODOs are addressed 
> before when possible.

ok, I will try to prepare something.


>
>>
>> Could you please clarify how this patch could be split in smaller one?
>
> This patch is going to be reduced a fair bit if you make some of the 
> structure common. The next steps would be to move anything that is not 
> directly related to IOREQ out.


Thank you for the clarification.
Yes, however, I believed everything in this patch is directly related to 
IOREQ...


>
>
> From a quick look, there are few things that can be moved in separate 
> patches:
>    - The addition of the ASSERT_UNREACHABLE()

Did you mean the addition of the ASSERT_UNREACHABLE() to 
arch_handle_hvm_io_completion/handle_pio can moved to separate patches?
Sorry, I don't quite understand, for what benefit?


>    - The addition of the loop in leave_hypervisor_to_guest() as I 
> think it deserve some explanation.

Agree that loop in leave_hypervisor_to_guest() needs explanation. Will 
move to separate patch. But, this way I need to return corresponding 
TODO back to this patch.


>    - The sign extension in handle_ioserv() can possibly be abstracted. 
> Actually the code is quite similar to handle_read().

Ok, will consider that.


>
>>
>>>
>>>>
>>>> Please note, the "PIO handling" TODO is expected to left unaddressed
>>>> for the current series. It is not an big issue for now while Xen
>>>> doesn't have support for vPCI on Arm. On Arm64 they are only used
>>>> for PCI IO Bar and we would probably want to expose them to emulator
>>>> as PIO access to make a DM completely arch-agnostic. So "PIO handling"
>>>> should be implemented when we add support for vPCI.
>>>>
>>>> Please note, at the moment build on Arm32 is broken (see cmpxchg
>>>> usage in hvm_send_buffered_ioreq()) due to the lack of cmpxchg_64
>>>> support on Arm32. There is a patch on review to address this issue:
>>>> https://patchwork.kernel.org/patch/11715559/
>>>
>>> This has been committed.
>>
>> Thank you for the patch, will remove a notice.
>
> For future reference, I think such notice would be better after --- as 
> they don't need to be part of the commit message.

Got it.


>
>
>>
>>>
>>>
>>>> +    if ( dabt.write )
>>>> +        return IO_HANDLED;
>>>> +
>>>> +    /*
>>>> +     * Sign extend if required.
>>>> +     * Note that we expect the read handler to have zeroed the bits
>>>> +     * outside the requested access size.
>>>> +     */
>>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>>> +    {
>>>> +        /*
>>>> +         * We are relying on register_t using the same as
>>>> +         * an unsigned long in order to keep the 32-bit assembly
>>>> +         * code smaller.
>>>> +         */
>>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>>> +        r |= (~0UL) << size;
>>>> +    }
>>>> +
>>>> +    set_user_reg(regs, dabt.reg, r);
>>>> +
>>>> +    return IO_HANDLED;
>>>> +}
>>>> +
>>>> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>>>> +                             struct vcpu *v, mmio_info_t *info)
>>>> +{
>>>> +    struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>>>> +    ioreq_t p = {
>>>> +        .type = IOREQ_TYPE_COPY,
>>>> +        .addr = info->gpa,
>>>> +        .size = 1 << info->dabt.size,
>>>> +        .count = 1,
>>>> +        .dir = !info->dabt.write,
>>>> +        /*
>>>> +         * On x86, df is used by 'rep' instruction to tell the 
>>>> direction
>>>> +         * to iterate (forward or backward).
>>>> +         * On Arm, all the accesses to MMIO region will do a single
>>>> +         * memory access. So for now, we can safely always set to 0.
>>>> +         */
>>>> +        .df = 0,
>>>> +        .data = get_user_reg(regs, info->dabt.reg),
>>>> +        .state = STATE_IOREQ_READY,
>>>> +    };
>>>> +    struct hvm_ioreq_server *s = NULL;
>>>> +    enum io_state rc;
>>>> +
>>>> +    switch ( vio->io_req.state )
>>>> +    {
>>>> +    case STATE_IOREQ_NONE:
>>>> +        break;
>>>> +
>>>> +    case STATE_IORESP_READY:
>>>> +        return IO_HANDLED;
>>>> +
>>>> +    default:
>>>> +        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->io_req.state);
>>>> +        return IO_ABORT;
>>>> +    }
>>>> +
>>>> +    s = hvm_select_ioreq_server(v->domain, &p);
>>>> +    if ( !s )
>>>> +        return IO_UNHANDLED;
>>>> +
>>>> +    if ( !info->dabt.valid )
>>>> +        return IO_ABORT;
>>>> +
>>>> +    vio->io_req = p;
>>>> +
>>>> +    rc = hvm_send_ioreq(s, &p, 0);
>>>> +    if ( rc != IO_RETRY || v->domain->is_shutting_down )
>>>> +        vio->io_req.state = STATE_IOREQ_NONE;
>>>> +    else if ( !hvm_ioreq_needs_completion(&vio->io_req) )
>>>> +        rc = IO_HANDLED;
>>>> +    else
>>>> +        vio->io_completion = HVMIO_mmio_completion;
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +bool ioreq_handle_complete_mmio(void)
>>>> +{
>>>> +    struct vcpu *v = current;
>>>> +    struct cpu_user_regs *regs = guest_cpu_user_regs();
>>>> +    const union hsr hsr = { .bits = regs->hsr };
>>>> +    paddr_t addr = v->arch.hvm.hvm_io.io_req.addr;
>>>> +
>>>> +    if ( try_handle_mmio(regs, hsr, addr) == IO_HANDLED )
>>>> +    {
>>>> +        advance_pc(regs, hsr);
>>>> +        return true;
>>>> +    }
>>>> +
>>>> +    return false;
>>>> +}
>>>> +
>>>> +/*
>>>> + * Local variables:
>>>> + * mode: C
>>>> + * c-file-style: "BSD"
>>>> + * c-basic-offset: 4
>>>> + * tab-width: 4
>>>> + * indent-tabs-mode: nil
>>>> + * End:
>>>> + */
>>>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>>> index 8f40d0e..121942c 100644
>>>> --- a/xen/arch/arm/traps.c
>>>> +++ b/xen/arch/arm/traps.c
>>>> @@ -21,6 +21,7 @@
>>>>   #include <xen/hypercall.h>
>>>>   #include <xen/init.h>
>>>>   #include <xen/iocap.h>
>>>> +#include <xen/ioreq.h>
>>>>   #include <xen/irq.h>
>>>>   #include <xen/lib.h>
>>>>   #include <xen/mem_access.h>
>>>> @@ -1384,6 +1385,9 @@ static arm_hypercall_t arm_hypercall_table[] = {
>>>>   #ifdef CONFIG_HYPFS
>>>>       HYPERCALL(hypfs_op, 5),
>>>>   #endif
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    HYPERCALL(dm_op, 3),
>>>> +#endif
>>>>   };
>>>>     #ifndef NDEBUG
>>>> @@ -1955,9 +1959,14 @@ static void 
>>>> do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
>>>>               case IO_HANDLED:
>>>>                   advance_pc(regs, hsr);
>>>>                   return;
>>>> +            case IO_RETRY:
>>>> +                /* finish later */
>>>> +                return;
>>>>               case IO_UNHANDLED:
>>>>                   /* IO unhandled, try another way to handle it. */
>>>>                   break;
>>>> +            default:
>>>> +                ASSERT_UNREACHABLE();
>>>>               }
>>>>           }
>>>>   @@ -2249,12 +2258,23 @@ static void check_for_pcpu_work(void)
>>>>    * Process pending work for the vCPU. Any call should be fast or
>>>>    * implement preemption.
>>>>    */
>>>> -static void check_for_vcpu_work(void)
>>>> +static bool check_for_vcpu_work(void)
>>>>   {
>>>>       struct vcpu *v = current;
>>>>   +#ifdef CONFIG_IOREQ_SERVER
>>>> +    bool handled;
>>>> +
>>>> +    local_irq_enable();
>>>> +    handled = handle_hvm_io_completion(v);
>>>> +    local_irq_disable();
>>>> +
>>>> +    if ( !handled )
>>>> +        return true;
>>>> +#endif
>>>> +
>>>>       if ( likely(!v->arch.need_flush_to_ram) )
>>>> -        return;
>>>> +        return false;
>>>>         /*
>>>>        * Give a chance for the pCPU to process work before handling 
>>>> the vCPU
>>>> @@ -2265,6 +2285,8 @@ static void check_for_vcpu_work(void)
>>>>       local_irq_enable();
>>>>       p2m_flush_vm(v);
>>>>       local_irq_disable();
>>>> +
>>>> +    return false;
>>>>   }
>>>>     /*
>>>> @@ -2277,8 +2299,10 @@ void leave_hypervisor_to_guest(void)
>>>>   {
>>>>       local_irq_disable();
>>>>   -    check_for_vcpu_work();
>>>> -    check_for_pcpu_work();
>>>> +    do
>>>> +    {
>>>> +        check_for_pcpu_work();
>>>> +    } while ( check_for_vcpu_work() );
>>>>         vgic_sync_to_lrs();
>>>>   diff --git a/xen/include/asm-arm/domain.h 
>>>> b/xen/include/asm-arm/domain.h
>>>> index 6819a3b..d1c48d7 100644
>>>> --- a/xen/include/asm-arm/domain.h
>>>> +++ b/xen/include/asm-arm/domain.h
>>>> @@ -11,10 +11,27 @@
>>>>   #include <asm/vgic.h>
>>>>   #include <asm/vpl011.h>
>>>>   #include <public/hvm/params.h>
>>>> +#include <public/hvm/dm_op.h>
>>>> +#include <public/hvm/ioreq.h>
>>>> +
>>>> +#define MAX_NR_IOREQ_SERVERS 8
>>>>     struct hvm_domain
>>>>   {
>>>>       uint64_t              params[HVM_NR_PARAMS];
>>>> +
>>>> +    /* Guest page range used for non-default ioreq servers */
>>>> +    struct {
>>>> +        unsigned long base;
>>>> +        unsigned long mask;
>>>> +        unsigned long legacy_mask; /* indexed by HVM param number */
>>>> +    } ioreq_gfn;
>>>> +
>>>> +    /* Lock protects all other values in the sub-struct and the 
>>>> default */
>>>> +    struct {
>>>> +        spinlock_t              lock;
>>>> +        struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
>>>> +    } ioreq_server;
>>>>   };
>>>>     #ifdef CONFIG_ARM_64
>>>> @@ -91,6 +108,28 @@ struct arch_domain
>>>>   #endif
>>>>   }  __cacheline_aligned;
>>>>   +enum hvm_io_completion {
>>>> +    HVMIO_no_completion,
>>>> +    HVMIO_mmio_completion,
>>>> +    HVMIO_pio_completion
>>>> +};
>>>> +
>>>> +struct hvm_vcpu_io {
>>>> +    /* I/O request in flight to device model. */
>>>> +    enum hvm_io_completion io_completion;
>>>> +    ioreq_t                io_req;
>>>> +
>>>> +    /*
>>>> +     * HVM emulation:
>>>> +     *  Linear address @mmio_gla maps to MMIO physical frame 
>>>> @mmio_gpfn.
>>>> +     *  The latter is known to be an MMIO frame (not RAM).
>>>> +     *  This translation is only valid for accesses as per 
>>>> @mmio_access.
>>>> +     */
>>>> +    struct npfec        mmio_access;
>>>> +    unsigned long       mmio_gla;
>>>> +    unsigned long       mmio_gpfn;
>>>> +};
>>>> +
>>>
>>> Why do we need to re-define most of this? Can't this just be in 
>>> common code?
>>
>> Jan asked almost the similar question in "[PATCH V1 02/16] xen/ioreq: 
>> Make x86's IOREQ feature common".
>> Please see my answer there:
>> https://patchwork.kernel.org/patch/11769105/#23637511
>>
>> Theoretically we could move this to the common code, but the question 
>> is how to be with other struct fields the x86's struct hvm_vcpu_io 
>> has/needs but
>> Arm's seems not, would it be possible to logically split struct 
>> hvm_vcpu_io into common and arch parts?
>>
>> struct hvm_vcpu_io {
>>      /* I/O request in flight to device model. */
>>      enum hvm_io_completion io_completion;
>>      ioreq_t                io_req;
>>
>>      /*
>>       * HVM emulation:
>>       *  Linear address @mmio_gla maps to MMIO physical frame 
>> @mmio_gpfn.
>>       *  The latter is known to be an MMIO frame (not RAM).
>>       *  This translation is only valid for accesses as per 
>> @mmio_access.
>>       */
>>      struct npfec        mmio_access;
>>      unsigned long       mmio_gla;
>>      unsigned long       mmio_gpfn;
>>
>>      /*
>>       * We may need to handle up to 3 distinct memory accesses per
>>       * instruction.
>>       */
>>      struct hvm_mmio_cache mmio_cache[3];
>>      unsigned int mmio_cache_count;
>>
>>      /* For retries we shouldn't re-fetch the instruction. */
>>      unsigned int mmio_insn_bytes;
>>      unsigned char mmio_insn[16];
>>      struct hvmemul_cache *cache;
>>
>>      /*
>>       * For string instruction emulation we need to be able to signal a
>>       * necessary retry through other than function return codes.
>>       */
>>      bool_t mmio_retry;
>>
>>      unsigned long msix_unmask_address;
>>      unsigned long msix_snoop_address;
>>      unsigned long msix_snoop_gpa;
>>
>>      const struct g2m_ioport *g2m_ioport;
>> };
>
> I think Jan made some suggestion today. Let me know if you require 
> more input.


Yes. I am considering this now. I provided my thoughts on that a little 
bit earlier. Could you please clarify there.


-- 
Regards,

Oleksandr Tyshchenko


