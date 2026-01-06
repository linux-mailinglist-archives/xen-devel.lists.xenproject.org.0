Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C326CF8F4C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 16:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196264.1514135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd8cs-0006oD-Fl; Tue, 06 Jan 2026 15:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196264.1514135; Tue, 06 Jan 2026 15:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd8cs-0006l6-Cf; Tue, 06 Jan 2026 15:05:38 +0000
Received: by outflank-mailman (input) for mailman id 1196264;
 Tue, 06 Jan 2026 15:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd8cq-0006l0-4d
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 15:05:36 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f0a724-eb11-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 16:05:35 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so218921866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 07:05:35 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a2338cbsm245955266b.14.2026.01.06.07.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 07:05:33 -0800 (PST)
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
X-Inumbo-ID: 26f0a724-eb11-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767711934; x=1768316734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GNJ13SsOIzHp4IQ6BEQpZefQKZX3cYAvERa/uKn8OKo=;
        b=bGgzn+JrFR74n89yK9jo0QCsnWPXS8T5YjGutBq+QRr9AWS65qSqfCpGNtN4q4m/WP
         AGcKiGcBB5x93P28OthqpNA43+/qIi6aZrH1SbzZItwgHVefxwbET5KvYvAs+8Uy5X36
         I+HckOQkB4WQZOL/igsqc9w1CBBc5Dq+/u2gwK8ORUYqLERDo7EAEWAkoPCRRMO/otyG
         81guLGx3rgDTt57pNNzziHvCh5DPHUz+/gnWpcPh8tsWBVVPjBFPB5dk0Zgqj6RyE3Zs
         p7vYJTe1t1d3QomF7OaJyUPgri7L3b9qbDgq/wkgfwXT4Y1mvyhwEIotRmLQseo9ygtq
         ZsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767711934; x=1768316734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNJ13SsOIzHp4IQ6BEQpZefQKZX3cYAvERa/uKn8OKo=;
        b=aJ/S7duWVyWmhbUIV/wzOBIJ+enm6qST/EJeUrf1TUfy1Wy3RwRHSQOsKw3iOjsirt
         DSuk4qX0yOIznOFgXEncOvVpPu5IdvpnJs+cR932nyhEBRbUrjDipavU/dJ6pIqud/6V
         kbaVbkf7NjlGs6SyP3lNneW64qGvokVIuVVemdARP5OjSGGYASVgNihci5pfAUnviKvM
         LunJzUmF7MDF8LSTTA+GW8jrpQqStDczokM5BiXc3Zefc1+oL4/e2Lnrh6mX8LKpOShE
         dm6mm6dpY9grurE4GU1aCQsAt2SWvILPeYD05Z5XKLVx+orXfCYsuL4lmpdvYsaNMUvr
         O+/g==
X-Forwarded-Encrypted: i=1; AJvYcCXxyLpZdLISScQqC1GVo4zX+YooK6/D3AAuBKXU3Zu0uECKY9rIBBGpNvOkJzvm8KHxqTKXnKLnjIo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqydur47YXC75Y5exHfwckCWSw0qJ3flXAh8ZNmctzhh0uoPnr
	x52Hnr7AkgkSxtRaO5CCVXCYzEIzmLSazmqknLCoW5Hc14h+fDeRMbPa
X-Gm-Gg: AY/fxX7rbTl+eA6hFH0XZiXHAboD73fItZ37akv5ES9vlpe/9nQUde1G/AEpbiHadlp
	ZcOokwfwNg0V0CJlppCs5Kq1gh6axRPnQaACxLjf7fywJlylgKJrGW8yfKgk97+W+j6MBNDM8ze
	FruaUJU8XOwCf2LXI4rS3s/vQRmD5cZBkEH5KWyjp0nRJQT8pnasJ33w1jBIxuBHec31DqmDMZf
	P20ZBf7Flupy1ai41ddp7VLD9B6NztNx9M/ct0J1NppZVKW4aW88e0emFtTs087pEW20+ENH1tN
	/f7CzsSK+q1NC0rNwtSGWiBNqLPAmzrkFo+xxeNUcV3lNAfn/7Qq3Pjf1Jm+Zg9lzFEQz/UVeZp
	MvM0U0Yrtqmh36kIYnN9Zr10UCVDZM0Nlypt2DMgK0xueEj/dT+/2LjojyTfQtxtRyP6emn9PQV
	KlNcbsM9V2VuuiuYuEs5h4BqVRYzDptWI+eDeP/FNXs+U6iXML7E7MhQM+ISVk+Bs=
X-Google-Smtp-Source: AGHT+IGYK+WEoPRAHxOHnIIb0CLeLLcg3Iy48zqa02RkIG3yyrBgQUm8cFy9189dwJHSQag4jpBTAg==
X-Received: by 2002:a17:907:989:b0:b83:972a:cb85 with SMTP id a640c23a62f3a-b8426a684e8mr370184466b.21.1767711934020;
        Tue, 06 Jan 2026 07:05:34 -0800 (PST)
Message-ID: <839c06a2-dbd2-44c5-abe6-905a1f3ffefd@gmail.com>
Date: Tue, 6 Jan 2026 16:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/15] xen/riscv: introduce struct arch_vcpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <3b531dff3755da010664111cf7d936ccba7c1f5d.1766595589.git.oleksii.kurochko@gmail.com>
 <41b7b388-6c10-4cbe-a4af-a25baba64e2a@suse.com>
 <89629a0d-de6e-46e2-8517-a4b2fdd52183@gmail.com>
 <2253f28f-07af-46db-9116-e9b5427953a9@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2253f28f-07af-46db-9116-e9b5427953a9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/26 3:26 PM, Jan Beulich wrote:
> On 06.01.2026 15:19, Oleksii Kurochko wrote:
>> On 1/5/26 5:58 PM, Jan Beulich wrote:
>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>> Introduce structure with VCPU's registers which describes its state.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Since none of this is being used for the time being, I think the description
>>> wants to be a little less terse. Coming from the x86 (rather then the Arm)
>>> side, I find the arrangements irritating. And even when comparing to Arm, ...
>>>
>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>> @@ -22,9 +22,63 @@ struct hvm_domain
>>>>    struct arch_vcpu_io {
>>>>    };
>>>>    
>>>> -struct arch_vcpu {
>>>> +struct arch_vcpu
>>>> +{
>>>>        struct vcpu_vmid vmid;
>>>> -};
>>>> +
>>>> +    /* Xen's state: Callee-saved registers and tp, gp, ra */
>>> ... I don't think the following structure describes "Xen's state". On Arm
>>> it's guest controlled register values which are being saved afaict. I
>>> would then expect the same to become the case for RISC-V.
>> I think this is not fully correct, because guest-controlled registers on
>> Arm are allocated on the stack [1][2].
> I'll admit that I should have said "possibly guest-controlled". Callee-
> saved registers may or may not be used in functions, and if one isn't
> used throughout the call-stack reaching __context_switch(), it would
> still hold whatever the guest had put there.

But the guest doesn't put there nothing, only Xen does that and it is a reason
why I am trying to call it Xen state. Guest works only with what is stored in
struct cpu_info->guest_cpu_user_regs.* ...


>
>> Regarding|xen_saved_context| (or|saved_context| on Arm, which I used as a base),
>> I think|xen_saved_context| is a slightly better name. Looking at how the
>> |saved_context| structure is used on Arm [3], it can be concluded that
>> |__context_switch()| switches only Xen’s internal context. What actually happens is
>> that|__context_switch()| is called while running on the previous vCPU’s stack
>> and returns on the next vCPU’s stack. Therefore, it is necessary to have
>> the correct register values stored in the|saved_context| structure in order
>> to continue Xen’s execution when it later returns to the previous stack.
> For this and ...
>
>> Probably I need to introduce|__context_switch()| in this patch series for RISC-V
>> now; I hope this will clarify things better. At the moment, it looks like [4].
>>
>> [1] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/include/asm/arm64/processor.h#L14
>> [2] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/domain.c#L547
>>
>> [3] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/arm64/entry.S#L650
>>
>> [4] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/entry.S?ref_type=heads#L153
>>
>>>> +    struct
>>>> +    {
>>>> +        register_t s0;
>>>> +        register_t s1;
>>>> +        register_t s2;
>>>> +        register_t s3;
>>>> +        register_t s4;
>>>> +        register_t s5;
>>>> +        register_t s6;
>>>> +        register_t s7;
>>>> +        register_t s8;
>>>> +        register_t s9;
>>>> +        register_t s10;
>>>> +        register_t s11;
>>>> +
>>>> +        register_t sp;
>>>> +        register_t gp;
>>>> +
>>>> +        /* ra is used to jump to guest when creating new vcpu */
>>>> +        register_t ra;
>>>> +    } xen_saved_context;
>>> The xen_ prefix here also doesn't exist in Arm code.
>> I think it should be added for Arm too. I can send a patch.
> ... this, to reword my comment: What value does the xen_ prefix add?

... because guest doesn't access saved_context and as I mentioned above
guest has "access" only to struct cpu_info->guest_cpu_user_regs.*.

>
>>> Nor is there a
>>> similar, partly potentially misleading comment on "pc" there
>>> comparable to the one that you added for "ra". ("Potentially
>>> misleading" because what is being described is, aiui, not the only
>>> and not even the main purpose of the field.)
>> Yes, the purpose of|ra| here is not just to jump to the new vCPU code
>> (|continue_new_vcpu()|). It is used that way only the first time;
>> afterwards,|ra| will simply point to the next instruction after the
>> call to|__context_switch()| in|context_switch()| [5].
>>
>> [5] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/domain.c?ref_type=heads#L463
>>
>>>> +    /* CSRs */
>>>> +    register_t hstatus;
>>>> +    register_t hedeleg;
>>>> +    register_t hideleg;
>>>> +    register_t hvip;
>>>> +    register_t hip;
>>>> +    register_t hie;
>>>> +    register_t hgeie;
>>>> +    register_t henvcfg;
>>>> +    register_t hcounteren;
>>>> +    register_t htimedelta;
>>>> +    register_t htval;
>>>> +    register_t htinst;
>>>> +    register_t hstateen0;
>>>> +#ifdef CONFIG_RISCV_32
>>>> +    register_t henvcfgh;
>>>> +    register_t htimedeltah;
>>>> +#endif
>>>> +
>>>> +    /* VCSRs */
>>>> +    register_t vsstatus;
>>>> +    register_t vsip;
>>>> +    register_t vsie;
>>>> +    register_t vstvec;
>>>> +    register_t vsscratch;
>>>> +    register_t vscause;
>>>> +    register_t vstval;
>>>> +    register_t vsatp;
>>>> +    register_t vsepc;
>>>> +}  __cacheline_aligned;
>>> Why this attribute?
>> As arch_vcpu structure is accessed pretty often I thought it would
>> be nice to have it cache-aligned so some accesses would be faster
>> and something like false sharing won't happen.
> I think you would want to prove that this actually makes a difference.
> I notice Arm has such an attribute (and maybe indeed you merely copied
> it), but x86 doesn't.

I haven't measured, but I saw that Arm has and it was my explanation to
myself to put it for RISC-V too.

~ Oleksii


