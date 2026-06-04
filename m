Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RcfICrJhIWrSFQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:29:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7214063F6D7
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 13:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="joR/KMsB";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327711.1592506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV6GI-0001Rb-G7; Thu, 04 Jun 2026 11:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327711.1592506; Thu, 04 Jun 2026 11:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV6GI-0001Pd-DV; Thu, 04 Jun 2026 11:29:22 +0000
Received: by outflank-mailman (input) for mailman id 1327711;
 Thu, 04 Jun 2026 11:29:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV6GG-0001PX-BJ
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 11:29:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV6GF-001IF4-OA
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:29:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a21618c-5cb7-0a2a0a5109dd-0a2a450c8532-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:29:19 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a21618f-62f1-0a2a450c0019-d155802ac5a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 13:29:19 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso5712585e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 04:29:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fcf5bsm70077435e9.9.2026.06.04.04.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 04:29:18 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780572559; x=1781177359; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ID6JKyMUNPL/ECqnymnBxx0HS8ODT4/GCXco0GdkFTE=;
        b=joR/KMsBx80QpbZ9bvXwlwBwUV2vYEslTjbRVGwAs13W7VpTyGSiIbNTSucZUBY3nF
         g/T8jMQYh4/txSingp8OTbNQ86GBHcsryJoBo31ukKtmy/GAYs1vZRou1lgGYJdD9UVM
         lUBGn/MsWX10ewjI6meLy8cU7LB50hc60qGVgf7w29quJ6J70sFCEpu49FG2HWBnOgVd
         VZAldHHD/074Sebn8/2yf2dN0v+RROrmD34Fiu2jB9F1xI3CoppJTDm6bH5334Iankjs
         i3BLieYyOBKf6EY7cD9sn6NEybXIad0RP82PhZqll3lWbitU/GUIY3r2efKTufRcQPtu
         VKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572559; x=1781177359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ID6JKyMUNPL/ECqnymnBxx0HS8ODT4/GCXco0GdkFTE=;
        b=Gr0nA7R/7ZCsA8FOzzAj1E6dp1wQ9KSouMsWNItbXttAGm8Z1UBOGhZnU2X7XrNMeb
         6QFEcGbBFniyzeO7KVeqltcVdIcw3J50DY8KCfp8vupedJ0s4w+1FCBPwsfVcTNIf6Zj
         WyuS+7SZXxgzCGreTtlI7queukBhkSyK6IcnWmJWVXSjco5NlWI3Ye8ZJFMXob5PJi4y
         drC7mgE11nu5oWWRtu+0BlEb3AY34Mx6IrYMyabIn7D5H2F695ihgHVvH978pYhnEl56
         lfKG7XYWPZp7oSvXMp9nV8oG/N9nS/wLdyZDFtXVSOnzCFUC65AQQ5jzmC0NNjyZSI3D
         D8PA==
X-Forwarded-Encrypted: i=1; AFNElJ+0W8+6DlW25NdBfKITYM6sic5cLUUfsGHsVVg2rdIATvsdYNZG4i5jXiiewpr34VST0V95OnP4V/8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2sssGH9Mj+nG6z9IGkfySf0TYh8NP48/JfsFBUdx3UXRctviF
	7GJv7uSvYRE/CIhO+OT3sibCClGOcv1a6xadqa3fI2/YoIM/uRSGOTXu
X-Gm-Gg: Acq92OHKUM3lP8NFb4E3kIdWOxQCOpLVxkhHsEh3XkMBeSQqvXjJFksJ3lVzjJTKv6B
	W5ZfVrZQ9rgyGGq4ayBikB5qbzUDdpkZL5cFQinqcAWNDHHx6fmqeYdiXNw4s+0T91TMgKK2Xi6
	cj5H4Gd6PI/mZcGTJpPXk79AQZmjuMkPIZofyuKZlH0B8dVEOBEoEKOUxHvyl/3NR4LTQLjFmpi
	7Gl1WpbnoresrvTt2z14pjHTPdb3ZaiyJ9m8cUU/HiRPG6bDlJc/Psm4lw8edbaffQCftVTyi6w
	XEFq/hXbuj56NxofDAIKdN0gL5tYNYpmO4QjlcfFfyk7czsWm5cxYJBvADoNzHuEgFtf8/CWKl3
	Wgcd268aQP2HCWHXMHBZ1i1U7swh4HxAf4BeYGsQEkFftKmXaa8C3x21O7cyiIC6EkRuXyRxqy9
	gBN6P6DLPMajHDBuNsWMRngcPeul2Zmz/cgcp5Jm3v/Ox13gT8TsZKPDdxzXear71vmASLeZlfI
	oef/eceYCrVJh6E
X-Received: by 2002:a05:600c:8b64:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-490b642ce7cmr131738305e9.2.1780572558820;
        Thu, 04 Jun 2026 04:29:18 -0700 (PDT)
Message-ID: <702af594-17ce-4e64-8f02-37ad5785c6a4@gmail.com>
Date: Thu, 4 Jun 2026 13:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/26] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
 <6ec9620d-7224-49d4-860c-6e447e0534e3@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6ec9620d-7224-49d4-860c-6e447e0534e3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780572559-E377ECF5-2192E12B/10/73395122804
X-purgate-type: spam
X-purgate-size: 8518
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7214063F6D7



On 6/3/26 4:54 PM, Jan Beulich wrote:
> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/aplic.c
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -295,6 +295,11 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
>>       spin_unlock(&aplic.lock);
>>   }
>>   
>> +static unsigned int cf_check aplic_irq_num(void)
>> +{
>> +    return aplic_info.num_irqs;
>> +}
>> +
>>   static const hw_irq_controller aplic_xen_irq_type = {
>>       .typename     = "aplic",
>>       .startup      = aplic_irq_startup,
>> @@ -309,6 +314,7 @@ static const struct intc_hw_operations aplic_ops = {
>>       .host_irq_type       = &aplic_xen_irq_type,
>>       .handle_interrupt    = aplic_handle_interrupt,
>>       .set_irq_type        = aplic_set_irq_type,
>> +    .irq_nums            = aplic_irq_num,
> 
> Hook handler names and respective field names would preferably match up. It's
> unclear why the field uses some kind of plural(?), while the function uses
> singular.

I will do s/aplic_irq_num/aplic_irq_nums.

> 
>> --- a/xen/arch/riscv/domain.c
>> +++ b/xen/arch/riscv/domain.c
>> @@ -11,6 +11,7 @@
>>   #include <asm/bitops.h>
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>> +#include <asm/intc.h>
>>   #include <asm/riscv_encoding.h>
>>   #include <asm/vtimer.h>
>>   
>> @@ -155,14 +156,10 @@ int arch_vcpu_create(struct vcpu *v)
>>       if ( (rc = vcpu_vtimer_init(v)) )
>>           goto fail;
>>   
>> -    /*
>> -     * As interrupt controller (IC) is not yet implemented,
>> -     * return an error.
>> -     *
>> -     * TODO: Drop this once IC is implemented.
>> -     */
>> -    rc = -EOPNOTSUPP;
>> -    goto fail;
>> +    ASSERT(v->domain->arch.vintc->ops->vcpu_init);
>> +
>> +    if ( (rc = v->domain->arch.vintc->ops->vcpu_init(v)) )
> 
> I don't understand this model of the use of ASSERT(). As previously said
> (more than once) - you'll crash anyway if any of the involved pointers is
> NULL. If you really think an up-front check is better, then why would you
> check only the leaf of the pointer chain, and not also vintc and ops?
> (Once you do you'll then likely notice that there are more assertions
> than actual code.)

Let me show an example. For the test I will comment ASSERT() here + make 
->vcpu_init = NULL. Then the following dump will be occurred because of 
NULL pointer dereference:

(XEN) scause    : 000000000000000c Unhandled exception[Instruction Page 
Fault]
(XEN) htval     : 0000000000000000 htinst    : 0000000000000000
(XEN) hedeleg   : 0000000000000000 hideleg   : 0000000000000000
(XEN) hstatus   : 0000000200000000 [ ]
(XEN) hgatp     : 0000000000000000
(XEN) hstateen0 : 0000000000000000
(XEN) stvec     : ffffffffc00397f0 vstvec    : 0000000000000000
(XEN) sepc      : 0000000000000000 vsepc     : 0000000000000000
(XEN) stval     : 0000000000000000 vstval    : 0000000000000000
(XEN) status    : 0000000200000120 vsstatus  : 0000000a00000000
(XEN) satp      : 80000000000806c5
(XEN) vscause   : 0000000000000000 [Instruction Address Misaligned]
(XEN) ra  : ffffffffc0038f92 sp  : ffffffffc00a6580
(XEN) gp  : 0000000000000000 tp  : ffffffffc005e9c0
(XEN) t0  : ffffffffc04c9f78 t1  : 0000000052464e43
(XEN) t2  : 0000000000000000 s0  : ffffffffc00a65a0
(XEN) s1  : 000000323feaa000 a0  : 000000323feaa000
(XEN) a1  : 000000321a0010a8 a2  : 0000000000000000
(XEN) a3  : ffffffffc005c978 a4  : 0000000000000000
(XEN) a5  : 0000000000000000 a6  : 0000000000000000
(XEN) a7  : 000000321a0010a0 s2  : 0000000000000000
(XEN) s3  : 0000000000000000 s4  : 0000000000000000
(XEN) s5  : 0000000000000000 s6  : ffffffffc00a6638
(XEN) s7  : ffffffffc00a6638 s8  : ffffffffc00a6658
(XEN) s9  : ffffffffffffe000 s10 : 00000032105f4328
(XEN) s11 : 0000000000000000 t3  : 0000000000000001
(XEN) t4  : 0000000000000000 t5  : 0000000000080000
(XEN) t6  : 0000000000000001

So sepc = 0x0 => the CPU attempted to fetch and execute an instruction 
at address NULL.

stval = 0x0 => Faulting address = 0x0 (confirms null fetch).

During writing of that I reliased that I have also ra register which 
will tell where the bad call came from and then using 
addr2line/nm/objdump/whatever it still could be recoverable a place 
where NULL dereference happened in this case:

$ addr2line -e xen/xen-syms 0xffffffffc0038f92
/build/xen/arch/riscv/domain.c:218

So I agree now that such ASSERT should be dropped and shouldn't be used 
in such cases. I will drop it here and in the similar places where I 
added ASSERT for the reason as it is hard to identify a place where 
fault happened.

>> +unsigned int intc_irq_nums(void)
>> +{
>> +    ASSERT(intc_hw_ops && intc_hw_ops->irq_nums);
>> +
>> +    return intc_hw_ops->irq_nums();
>> +}
> 
> You use this to set domains' properties. As indicated before, I view it as
> wrong to do so for any domain, besides perhaps Dom0 / hwdom. If you want to
> do so nevertheless, at the very least I'd expect something to be said about
> such a decision in the description.

If you could explain how this is expected to work for non-Dom0/hwdom 
domains, I would consider reworking it.

Basically, I don't understand how the following scenario is supposed to 
work. Let's say the host interrupt controller can manage 15 interrupts, 
while the guest interrupt controller supports only 7. If we want to pass 
through 8 devices to the guest, what should happen in that case? Should 
Xen simply report that the 8th device cannot be passed through because 
the guest supports only 7 IRQs?

Another concern is related to 1:1 IRQ mapping. Suppose I want to pass 
through a UART device whose IRQ number is typically greater than 10. In 
that case, it seems Xen would again have to report that the device 
cannot be passed through because its interrupt number exceeds the number 
of IRQs supported by the guest interrupt controller. This could be 
addressed by introducing a non-1:1 IRQ mapping between the host and 
guest, but the current dom0less codebase appears to assume a 1:1 IRQ 
mapping (unless I am mistaken).

Considering that virtual interrupt controllers use the maximum possible 
number of interrupts supported by the interrupt controller, the concerns 
mentioned above are unlikely to arise for a long time, if ever, unless 
support for features such as migration is introduced. Therefore, I think 
it would be reasonable to remove intc_irq_nums() and avoid using it to 
initialize virtual interrupts or domain properties.

>> +
>> +static const struct vintc_ops vintc_ops = {
>> +    .vcpu_init = vcpu_vaplic_init,
>> +};
>> +
>> +int __init domain_vaplic_init(struct domain *d)
> 
> Why __init, and why is there no caller? 

The caller is in follow-up patch. I will add that to commit message.

Considering that domain_vintc_init() isn't __init from where 
domain_vaplic_init() is called then __init should be dropped here. I 
will do that.

Plus why is the vCPU-init a hook,
> but the domain init is not? Either you mean to allow for other ICs, or
> you you don't.

IIUC your question domain_vaplic_init() ins't a hook because vaplic 
structure is allocated dynamically so vintc, vintc->ops and/or 
vintc->init_ops aren't initialized at the moment when vintc->{ops or 
init_ops}->domain_vaplic_init() is used in domain_vintc_init() (which is 
introduced in the follow up patch).

> 
>> +{
>> +    struct vaplic *vaplic = xvzalloc(struct vaplic);
>> +
>> +    if ( !vaplic )
>> +        return -ENOMEM;
>> +
>> +    d->arch.vintc = &vaplic->vintc;
>> +    d->arch.vintc->ops = &vintc_ops;
>> +
>> +    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
>> +
>> +    d->arch.vintc->irq_nums = min(intc_irq_nums(),
>> +                                  VAPLIC_NUM_SOURCES + 0U);
>> +
>> +
>> +    return 0;
>> +}
>> +
>> +void __init domain_vaplic_deinit(struct domain *d)
>> +{
>> +    struct vaplic *vaplic = to_vaplic(d);
>> +
>> +    xvfree(vaplic);
>> +}
> 
> And d->arch.vintc turns into a dangling pointer. The way you arrange data
> types, you can't use XVFREE() here, but imo you really want to make sure
> the function is idempotent.

I will do then:

void domain_vaplic_deinit(struct domain *d)
{
     struct vaplic *vaplic;

     if ( !d->arch.vintc )
         return;

     vaplic = to_vaplic(d);
     d->arch.vintc = NULL;
     xvfree(vaplic);
}

Thanks.

~ Oleksii

