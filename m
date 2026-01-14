Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5644D1ED50
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 13:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203022.1518364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg0BS-0001sH-BK; Wed, 14 Jan 2026 12:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203022.1518364; Wed, 14 Jan 2026 12:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg0BS-0001pD-84; Wed, 14 Jan 2026 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1203022;
 Wed, 14 Jan 2026 12:41:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vg0BQ-0001p7-TJ
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 12:41:08 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b6897d3-f146-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 13:41:06 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b86f69bbe60so501586766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 04:41:06 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8724197145sm760383566b.11.2026.01.14.04.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 04:41:05 -0800 (PST)
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
X-Inumbo-ID: 4b6897d3-f146-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768394466; x=1768999266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueYzrlq5f6o6Qg9JN81RVR2RMsGpdW8chZWBb2RnORY=;
        b=g0zxI1gHsKlg0vOoRBvMbNuzS5uxZ7ryR4bdESWo8eMbY0MIzEBuwho5MXTr6vknj3
         7dBZbvbv8HupBd86e6dyFb3FEkkHszp1XpmEB8MTNK56jiRzJLQXQ/yNZfEYVPQkQoXh
         XdGHJm6dvRAmYpdEiWdDF+fot0v95xfsXTh9XxWh09AbD85cm4JgUcdl78mQVmCawbw6
         X73WnSkug/QGZzjBnty+ZMwKPWyteihwjJ11dlqhZ6+insw4QPUWqguxjNRwmCRCDowl
         uNO7vlHF1gfLO16IcRamIsl5N2J0DecSdbzUUEX+1cxXnzcA3CRo3seLcg54dWIeDzTc
         +Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768394466; x=1768999266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ueYzrlq5f6o6Qg9JN81RVR2RMsGpdW8chZWBb2RnORY=;
        b=sF+C7q0b50pgSzhwIKqRLIV3FuRCTsy7qS9vIXXWglF5CEtOGnMashjINFqmbQkY7w
         rP9Zi2l5aVv18r07a8JCPBfB83AHyMz/Ya48q9KsJQPHK3o8FAfLRQx54fgWmsCMQ58E
         4AD+kvywhitx/x9Yo/Shpminc3jP6yUhE1VPDpZpk/OiX7RAPMEXZTFYoAAyFhxEkXBC
         Ga9wxEBJA5ndboeJmTiIEjmhEJOAYtDtaQcY8uQTOe79GkKok0TQ7Fe6dFA/5Lo8cYAO
         Tnfb08c9C8jp8IvaHYhokkdnMcuWzRQmhEtQOJB4vkWyNbo/N++qjZImcMUi8wBivTcO
         GJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwvSdeYFLb7UwZlmMT0cy3VG95viJP7Xn1hVEiYpYCrfE4eACLKxxvKxExNDgqQrGeT5vCNuouYEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWZQscIYWiUNyi20K2SQ/Goy3ikf7gw38IyJKInjEM/PtC31Gr
	/ofp51iX4bcX2QxilY++aZf7nyaLU+oNCSkL2Vcd6xI8XOHlMFnZpMt9
X-Gm-Gg: AY/fxX7qb4fvs5TlRDNYndL301W06qD+mXq8Ye+bba2Y2PT9uTewWXVq6RSfe4zm0Ke
	WNnqU2CzjhBCuxGy6U3dJYl5Scsomc+NwfZEtr17+TMLTLkNzd0RxUjft8ixcgauyOjaGzmfWg1
	cHxLKyrP0kUe8QBdgACM/JMchRD4/jH0wizwAJ9gjXiYZanUQ79AM8ytRsQ/di62m2Wo4dobDpC
	FnTHLfdTofV3076N9kvi9ugQ+oBzW/qGTIRKQGAEhqORmLMBftqgdUTZf8onpVQo6hsfjVE9T6N
	5oOykTL2fufkQlSx0P80+stSQdFvm/A2dhRiJOCzJ8p4nfR5b3+DkMgoM/7jqVLQMkxs41q1vev
	8nwMlgY+KzcfkNqEImq0g9ugDrgE05G+W4ksgc0V34vEf+WvwvS8zCITcgDw8eTE52K1FxO4phB
	8YZwmvHWUpulMxVSPJg4U/W55bmXoHf9ERd+Z7BZmWqj50IhxW1nD39JWQdT2yUtk=
X-Received: by 2002:a17:907:2da8:b0:b87:2b61:b03e with SMTP id a640c23a62f3a-b8761021a6amr212998966b.14.1768394465673;
        Wed, 14 Jan 2026 04:41:05 -0800 (PST)
Message-ID: <f4ffcd85-6091-47e0-8c02-e3e5a8ca1354@gmail.com>
Date: Wed, 14 Jan 2026 13:41:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/15] xen/riscv: implement reprogram_timer() using SBI
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <43249171def325c49541ebdac141fe99d159b60f.1766595589.git.oleksii.kurochko@gmail.com>
 <f14c8b3d-66ce-4ea7-bf50-591a4a48345a@suse.com>
 <90e7fc60-09cc-4b61-ab0a-80037f8ecaf8@gmail.com>
 <f2241dec-a115-41b9-a249-6c5a69114809@suse.com>
 <a7757fd0-7b23-451d-93f7-043cfbb6e684@gmail.com>
 <c6b2f360-5ec5-4299-9eb0-de88bf9f9ad9@suse.com>
 <4141bb71-7aef-4287-aefd-92009977294f@gmail.com>
 <c29d03ec-e83f-4594-9ef6-fcc7b99a318b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c29d03ec-e83f-4594-9ef6-fcc7b99a318b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/26 12:17 PM, Jan Beulich wrote:
> On 14.01.2026 11:33, Oleksii Kurochko wrote:
>> On 1/14/26 10:53 AM, Jan Beulich wrote:
>>> On 14.01.2026 10:41, Oleksii Kurochko wrote:
>>>> On 1/14/26 10:13 AM, Jan Beulich wrote:
>>>>> On 13.01.2026 17:50, Oleksii Kurochko wrote:
>>>>>> On 1/12/26 4:24 PM, Jan Beulich wrote:
>>>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>>>> @@ -39,6 +43,33 @@ static void __init preinit_dt_xen_time(void)
>>>>>>>>          cpu_khz = rate / 1000;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +int reprogram_timer(s_time_t timeout)
>>>>>>>> +{
>>>>>>>> +    uint64_t deadline, now;
>>>>>>>> +    int rc;
>>>>>>>> +
>>>>>>>> +    if ( timeout == 0 )
>>>>>>>> +    {
>>>>>>>> +        /* Disable timers */
>>>>>>>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>>>>> +
>>>>>>>> +        return 1;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>>>>>>>> +    now = get_cycles();
>>>>>>>> +    if ( deadline <= now )
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>> +    /* Enable timer */
>>>>>>>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
>>>>>>> Still learning RISC-V, so question for my understanding: Even if the timeout
>>>>>>> is short enough to expire before the one SIE bit will be set, the interrupt
>>>>>>> will still occur (effectively immediately)? (Else the bit may need setting
>>>>>>> first.)
>>>>>> The interrupt will become pending first (when mtime >= mtimecmp or
>>>>>> mtime >= CSR_STIMECMP in case of SSTC) and then fire immediately once
>>>>>> |SIE.STIE |(and global|SIE|) are enabled.
>>>>>>
>>>>>>>> +    if ( (rc = sbi_set_timer(deadline)) )
>>>>>>>> +        panic("%s: timer wasn't set because: %d\n", __func__, rc);
>>>>>>> Hmm, if this function ends up being used from any guest accessible path (e.g.
>>>>>>> a hypercall), such panic()-ing better shouldn't be there.
>>>>>> I don't have such use cases now and I don't expect that guest should use
>>>>>> this function.
>>>>> How do you envision supporting e.g. VCPUOP_set_singleshot_timer without
>>>>> involving this function?
>>>> Looking at what is in common code for VCPUOP_set_singleshot_timer, it doesn't
>>>> use reprogram_timer(), it is just activate/deactivate timer.
>>> And how would that work without, eventually, using reprogram_timer()? While not
>>> directly on a hypercall path, the use can still be guest-induced.
>> Of course, eventually|reprogram_timer()| will be used. I incorrectly thought
>> that we were talking about its direct use on the hypercall path.
>>
>> I am not really sure what we should do in the case when rc != 0. Looking at the
>> OpenSBI call, it always returns 0, except when sbi_set_timer() is not supported,
>> in which case it returns -SBI_ENOTSUPP. With such a return value, I think it would
>> be acceptable to call domain_crash(current->domain).
> How is current->domain related to a failure in reprogram_timer()?

Agree, it isn't, a failure could happen during a ran of any domain.

>
>> On the other hand, if some
>> other negative error code is returned, it might be better to return 0 and simply
>> allow the timer programming to be retried later.
>> However, if we look at the comments for other architectures, the meaning of a
>> return value of 0 from this function is:
>>    Returns 1 on success; 0 if the timeout is too soon or is in the past.
>> In that case, it becomes difficult to distinguish whether 0 was returned due to
>> an error or because the timeout was too soon or already in the past.
> Well, your problem is that neither Arm nor x86 can actually fail. Hence
> calling code isn't presently prepared for that. With panic() (and hence
> also BUG()) and domain_crash() ruled out, maybe generic infrastructure
> needs touching first (in a different way than making the function's return
> type "bool")?

I think making the function's return still is fine and it is only question to
arch-specific reprogram_timer() what to do when an error happens.

Still doesn't clear to me what should be a reaction on failure of
reprogram_timer().
Considering that SBI spec doesn't specify a list of possible errors and now
the only possible error is -ENOSUPP it seems to me it is fine
to have panic() as we don't have any other mechanism to set a timer
except SBI call (except the case SSTC is supported then we can use just
supervisor timer register directly without SBI call).

~ Oleksii





