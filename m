Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A339E2FF504
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 20:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72379.130275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2fw5-0002dp-Ju; Thu, 21 Jan 2021 19:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72379.130275; Thu, 21 Jan 2021 19:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2fw5-0002cz-Gn; Thu, 21 Jan 2021 19:48:05 +0000
Received: by outflank-mailman (input) for mailman id 72379;
 Thu, 21 Jan 2021 19:48:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/JE=GY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2fw4-0002cu-KV
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 19:48:04 +0000
Received: from mail-lj1-x231.google.com (unknown [2a00:1450:4864:20::231])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9226a204-05df-444d-9d9e-41f0e5abcf0a;
 Thu, 21 Jan 2021 19:48:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id f4so3003553ljo.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 11:48:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o12sm625371lfb.49.2021.01.21.11.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:48:01 -0800 (PST)
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
X-Inumbo-ID: 9226a204-05df-444d-9d9e-41f0e5abcf0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GNhAXQGkE/motv+Hxeh1tm7upm/hXVJhnextUAPy1WU=;
        b=TEbSXCGfwAiyoGS1Nc6dP1OEnqW7U9TceuzoCvsGGl2a0SrPJyGdU6vQRf+e/D9YJy
         uPSjr6ikvtH+rsCoTmU19TgjKPWlY7Htw3/GIkwwx8mswJ8csiwhQmAz451FIRuPdFjv
         HyF52JaxzInxE3lycH0tWkxwUKzD4r+rw0DbPbKugsVkpUFeESzn6NQ3H1OXaRmR4Wqx
         fgvf3h3/QOBxX/pYFWhAjwOjyNzHM1jJ327rssmDhSmO/TCNLLfEbJsS2OgyHNaSgGqH
         qrb42bcpz/Z/nXquZzxyOnXroKN+gnwKZAWTSZ+p7/hB2pMpm2dndzh4Zid6dZZ2bATn
         HNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GNhAXQGkE/motv+Hxeh1tm7upm/hXVJhnextUAPy1WU=;
        b=cyKAvFmjBfatsoai86o7cwjd7RuN9KTuhbYB7dCKEPYS0t0dlqC+y72hC64mYPuUJI
         cyE4/fFSaaSy7kR+IreL28nX14UWjEIBEQvLj4VqVz0pxtA9LvJEl7zN/JZxdApmuwSy
         N4S+vbAbUPt9FrOyw9e/99R8XyOU1Eo45NxprS6/cX9o0pdBsgaTYemTdl+BrltnNfME
         XzKEyyE2qQY/45XUx4Iytcxv3xjtvIs1Gpfknx0Y2rGUVXl05NSSADvaL84dv2XA6Uqy
         PLRU51IeJ1ApGDd+BSUF9C74L58oIy0LZKSf/viBXQRVx7RS7b5ZCYn188thFME6bt0I
         UBDA==
X-Gm-Message-State: AOAM533o5vwLyJpuYbu0v2iUGQjYX8f6H3HkNi0CPQSLScKkXM31PYi2
	UBgs5IwNGw67BJemQHbBeUA=
X-Google-Smtp-Source: ABdhPJwHrDyjxjKn+Wd2lZ3CKfBDtRfRVxs3KiiISt/Nd4SCs1CIhZwo+65EgjdQtJKlUeeSx3HVKw==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr468967ljk.83.1611258482001;
        Thu, 21 Jan 2021 11:48:02 -0800 (PST)
Subject: Re: [PATCH V4 22/24] xen/arm: Add mapcache invalidation handling
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Julien Grall <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-23-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2101141803180.31265@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9866af7f-2136-32df-4dae-7c2f879d90ee@gmail.com>
Date: Thu, 21 Jan 2021 21:47:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101141803180.31265@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.01.21 04:11, Stefano Stabellini wrote:

Hi Stefano

> On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to send mapcache invalidation request to qemu/demu everytime
>> the page gets removed from a guest.
>>
>> At the moment, the Arm code doesn't explicitely remove the existing
>> mapping before inserting the new mapping. Instead, this is done
>> implicitely by __p2m_set_entry().
>>
>> So we need to recognize a case when old entry is a RAM page *and*
>> the new MFN is different in order to set the corresponding flag.
>> The most suitable place to do this is p2m_free_entry(), there
>> we can find the correct leaf type. The invalidation request
>> will be sent in do_trap_hypercall() later on.
>>
>> Taking into the account the following the do_trap_hypercall()
>> is the best place to send invalidation request:
>>   - The only way a guest can modify its P2M on Arm is via an hypercall
>>   - When sending the invalidation request, the vCPU will be blocked
>>     until all the IOREQ servers have acknowledged the invalidation
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> Please note, this patch depends on the following which is
>> on review:
>> https://patchwork.kernel.org/patch/11803383/
>>
>> This patch is on par with x86 code (whether it is buggy or not).
>> If there is a need to improve/harden something, this can be done on
>> a follow-up.
>> ***
>>
>> Changes V1 -> V2:
>>     - new patch, some changes were derived from (+ new explanation):
>>       xen/ioreq: Make x86's invalidate qemu mapcache handling common
>>     - put setting of the flag into __p2m_set_entry()
>>     - clarify the conditions when the flag should be set
>>     - use domain_has_ioreq_server()
>>     - update do_trap_hypercall() by adding local variable
>>
>> Changes V2 -> V3:
>>     - update patch description
>>     - move check to p2m_free_entry()
>>     - add a comment
>>     - use "curr" instead of "v" in do_trap_hypercall()
>>
>> Changes V3 -> V4:
>>     - update patch description
>>     - re-order check in p2m_free_entry() to call domain_has_ioreq_server()
>>       only if p2m->domain == current->domain
>>     - add a comment in do_trap_hypercall()
>> ---
>>   xen/arch/arm/p2m.c   | 25 +++++++++++++++++--------
>>   xen/arch/arm/traps.c | 20 +++++++++++++++++---
>>   2 files changed, 34 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index d41c4fa..26acb95d 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -1,6 +1,7 @@
>>   #include <xen/cpu.h>
>>   #include <xen/domain_page.h>
>>   #include <xen/iocap.h>
>> +#include <xen/ioreq.h>
>>   #include <xen/lib.h>
>>   #include <xen/sched.h>
>>   #include <xen/softirq.h>
>> @@ -749,17 +750,25 @@ static void p2m_free_entry(struct p2m_domain *p2m,
>>       if ( !p2m_is_valid(entry) )
>>           return;
>>   
>> -    /* Nothing to do but updating the stats if the entry is a super-page. */
>> -    if ( p2m_is_superpage(entry, level) )
>> +    if ( p2m_is_superpage(entry, level) || (level == 3) )
>>       {
>> -        p2m->stats.mappings[level]--;
>> -        return;
>> -    }
>> +#ifdef CONFIG_IOREQ_SERVER
>> +        /*
>> +         * If this gets called (non-recursively) then either the entry
>> +         * was replaced by an entry with a different base (valid case) or
>> +         * the shattering of a superpage was failed (error case).
>> +         * So, at worst, the spurious mapcache invalidation might be sent.
>> +         */
>> +        if ( (p2m->domain == current->domain) &&
>> +              domain_has_ioreq_server(p2m->domain) &&
>> +              p2m_is_ram(entry.p2m.type) )
>> +            p2m->domain->mapcache_invalidate = true;
>> +#endif
>>   
>> -    if ( level == 3 )
>> -    {
>>           p2m->stats.mappings[level]--;
>> -        p2m_put_l3_page(entry);
>> +        /* Nothing to do if the entry is a super-page. */
>> +        if ( level == 3 )
>> +            p2m_put_l3_page(entry);
>>           return;
>>       }
>>   
>> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>> index 35094d8..1070d1b 100644
>> --- a/xen/arch/arm/traps.c
>> +++ b/xen/arch/arm/traps.c
>> @@ -1443,6 +1443,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>>                                 const union hsr hsr)
>>   {
>>       arm_hypercall_fn_t call = NULL;
>> +    struct vcpu *curr = current;
>>   
>>       BUILD_BUG_ON(NR_hypercalls < ARRAY_SIZE(arm_hypercall_table) );
>>   
>> @@ -1459,7 +1460,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>>           return;
>>       }
>>   
>> -    current->hcall_preempted = false;
>> +    curr->hcall_preempted = false;
>>   
>>       perfc_incra(hypercalls, *nr);
>>       call = arm_hypercall_table[*nr].fn;
>> @@ -1472,7 +1473,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>>       HYPERCALL_RESULT_REG(regs) = call(HYPERCALL_ARGS(regs));
>>   
>>   #ifndef NDEBUG
>> -    if ( !current->hcall_preempted )
>> +    if ( !curr->hcall_preempted )
>>       {
>>           /* Deliberately corrupt parameter regs used by this hypercall. */
>>           switch ( arm_hypercall_table[*nr].nr_args ) {
>> @@ -1489,8 +1490,21 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
>>   #endif
>>   
>>       /* Ensure the hypercall trap instruction is re-executed. */
>> -    if ( current->hcall_preempted )
>> +    if ( curr->hcall_preempted )
>>           regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
>> +
>> +#ifdef CONFIG_IOREQ_SERVER
>> +    /*
>> +     * Taking into the account the following the do_trap_hypercall()
>> +     * is the best place to send invalidation request:
>> +     * - The only way a guest can modify its P2M on Arm is via an hypercall
>> +     * - When sending the invalidation request, the vCPU will be blocked
>> +     *   until all the IOREQ servers have acknowledged the invalidation
> NIT: I suggest to reword it as follows to make it sound better.
>
> We call ioreq_signal_mapcache_invalidate from do_trap_hypercall()
> because the only way a guest can modify its P2M on Arm is via an
> hypercall. Note that sending the invalidation request causes the vCPU to
> block until all the IOREQ servers have acknowledged the invalidation.

Agree


>
>
> Could be done on commit.

Thank you, I am preparing V5, so will update.


>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.


>
>
>> +     */
>> +    if ( unlikely(curr->domain->mapcache_invalidate) &&
>> +         test_and_clear_bool(curr->domain->mapcache_invalidate) )
>> +        ioreq_signal_mapcache_invalidate();
>> +#endif
>>   }
>>   
>>   void arch_hypercall_tasklet_result(struct vcpu *v, long res)
>> -- 
>> 2.7.4
>>
-- 
Regards,

Oleksandr Tyshchenko


