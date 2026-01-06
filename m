Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37210CF8BCD
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 15:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196227.1514088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7uR-0007Cg-ND; Tue, 06 Jan 2026 14:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196227.1514088; Tue, 06 Jan 2026 14:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7uR-0007BF-KL; Tue, 06 Jan 2026 14:19:43 +0000
Received: by outflank-mailman (input) for mailman id 1196227;
 Tue, 06 Jan 2026 14:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd7uQ-0007B4-80
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 14:19:42 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf9b1b8-eb0a-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 15:19:40 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so195459066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 06:19:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a27cac3sm239882266b.20.2026.01.06.06.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 06:19:38 -0800 (PST)
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
X-Inumbo-ID: bcf9b1b8-eb0a-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767709180; x=1768313980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYMcvm2DTbFlTmVaCqRaa8/IZM6wMLkLwGv3atb4HpA=;
        b=C4h6N5XC3EiOORhzsVAxEuaTKtJeINve9C+tFHoEWQ/9PQt4FJcje1w9X6YYG6yKJY
         pPb9tySqMqFIbGA7811s5CzpKcxMIXpqehjnr1ZkopnntTz70zmLTOox0rC6DZbkOcqz
         pQW+g0lI/Q99m+c3VB72F9rjwXsMeSUNF/d4WNcpXLqrR1bvOc2v8gSt5T5ehZxdVhDG
         RLI2YNyU5483lifihTU6lkPC/FhCKtw7A5zlwq9qAIOSRssOXcxeFpEu/O+T5/ngxMXA
         t01jvQHjktC6oMZ+CG0jsgzWEdmg5KXhzigJYqHw/wfvl6GvmEG8GJfn+C8T4Y5aZ17F
         OpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709180; x=1768313980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYMcvm2DTbFlTmVaCqRaa8/IZM6wMLkLwGv3atb4HpA=;
        b=eq+kTMY4foWhflKdEU/9hFnhbMmzXbcdeioRuJyKClcMIrZbYzy0O2HjnbNRjtKzsk
         qkt9yruictvg3AeixTx/gLLaAoHlbR9tV00MrOaKk6thBryHe1MwkeE0J1/EIt0D2vah
         2v5Xg0+pJTjxpKDyakGGJ16msqcB9ViqH+l8EzRUJ5LraTQ7c9Oc+G4IRbL5v4SsHpk/
         AqUIURPMxbRmgsv6jPlZZyG22QZkXhwHMOqKZ9saYuoNd1g2W2HEbP4I+ARDWMZqs9Ur
         MgSwartCatHn+CNIe81H809Vln6L3chuecMhoA+jInme6XC694rJ2Wx0flTsprX+NViW
         O6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWAhpgFJhhXTqARMyGnqP6byYDPD8j87AzIzQk8NP3a5pItoQILO9729C2A2JNjv5upK/Bv2+9eKSo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI3a6+sFHumU/BTXFMXGa6hpgDDXdQrd+MUN18axY1o1P9FXZg
	L3ADSmurQzUm1Zm/o+Iv3XBdXX40zJiFTrWFaXwRpfeIRZtP8c2tpD3i
X-Gm-Gg: AY/fxX5SaO6ngt/xcJ+zBW8MshQbfYBMtsuh5gKHwgpKkJ4hQdQG+tKsFRmrMNkP0rj
	GPezCFo3Rv0qtYoLcqqy4JQ72MGZhJ+1WJsSm4EnvVd89vL4OKIPfGxS5nR8hKGwylcaAae6S4v
	V8LmhOSh/HO9naQ57MXI3JT27YcpjF1T6UidugsfG97p0beaKA/i+uMvkotxSyCysA1+O+4KLJ1
	eA1VW/FyNgRa83+6RDmKfIgg2vL64pUy5MftD1HenE0mI1BpE5S6r6r3GDnsUuRMW/beBUM8aET
	Gr66u7dDxRs7bCkmo87vbWw9sfJ3ZDGyAqR3Fnb7+hFaPYqSTANGTZtumXachhwl9vdq0Lkj46S
	yYmsV0bu6G6/Hw6ICOFWc+tWXIpZLKVjlh0+Yf26nd+OrUEkMTKCMwKL4PmaKxuVLknU2TZZk3a
	u49vvFkB3emnFQomCAYf2Cq6+ykHlmCQPs4jykQXiqDkQqz+TklTJBPglml92/wXQ=
X-Google-Smtp-Source: AGHT+IFx0bipXXXz+5Ry5eSLrud01hvIVvn1RQX0Nl5R1CkYinUPrBL9vdsc2VSeralaVRONvHvWcA==
X-Received: by 2002:a17:907:944f:b0:b7f:e709:d447 with SMTP id a640c23a62f3a-b8426da94c0mr306214166b.33.1767709179178;
        Tue, 06 Jan 2026 06:19:39 -0800 (PST)
Message-ID: <89629a0d-de6e-46e2-8517-a4b2fdd52183@gmail.com>
Date: Tue, 6 Jan 2026 15:19:37 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <41b7b388-6c10-4cbe-a4af-a25baba64e2a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/5/26 5:58 PM, Jan Beulich wrote:
> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>> Introduce structure with VCPU's registers which describes its state.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Since none of this is being used for the time being, I think the description
> wants to be a little less terse. Coming from the x86 (rather then the Arm)
> side, I find the arrangements irritating. And even when comparing to Arm, ...
>
>> --- a/xen/arch/riscv/include/asm/domain.h
>> +++ b/xen/arch/riscv/include/asm/domain.h
>> @@ -22,9 +22,63 @@ struct hvm_domain
>>   struct arch_vcpu_io {
>>   };
>>   
>> -struct arch_vcpu {
>> +struct arch_vcpu
>> +{
>>       struct vcpu_vmid vmid;
>> -};
>> +
>> +    /* Xen's state: Callee-saved registers and tp, gp, ra */
> ... I don't think the following structure describes "Xen's state". On Arm
> it's guest controlled register values which are being saved afaict. I
> would then expect the same to become the case for RISC-V.

I think this is not fully correct, because guest-controlled registers on
Arm are allocated on the stack [1][2].

Regarding|xen_saved_context| (or|saved_context| on Arm, which I used as a base),
I think|xen_saved_context| is a slightly better name. Looking at how the
|saved_context| structure is used on Arm [3], it can be concluded that
|__context_switch()| switches only Xen’s internal context. What actually happens is
that|__context_switch()| is called while running on the previous vCPU’s stack
and returns on the next vCPU’s stack. Therefore, it is necessary to have
the correct register values stored in the|saved_context| structure in order
to continue Xen’s execution when it later returns to the previous stack.

Probably I need to introduce|__context_switch()| in this patch series for RISC-V
now; I hope this will clarify things better. At the moment, it looks like [4].

[1] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/include/asm/arm64/processor.h#L14
[2] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/domain.c#L547

[3] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/arm64/entry.S#L650

[4] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/entry.S?ref_type=heads#L153

>
>> +    struct
>> +    {
>> +        register_t s0;
>> +        register_t s1;
>> +        register_t s2;
>> +        register_t s3;
>> +        register_t s4;
>> +        register_t s5;
>> +        register_t s6;
>> +        register_t s7;
>> +        register_t s8;
>> +        register_t s9;
>> +        register_t s10;
>> +        register_t s11;
>> +
>> +        register_t sp;
>> +        register_t gp;
>> +
>> +        /* ra is used to jump to guest when creating new vcpu */
>> +        register_t ra;
>> +    } xen_saved_context;
> The xen_ prefix here also doesn't exist in Arm code.

I think it should be added for Arm too. I can send a patch.

> Nor is there a
> similar, partly potentially misleading comment on "pc" there
> comparable to the one that you added for "ra". ("Potentially
> misleading" because what is being described is, aiui, not the only
> and not even the main purpose of the field.)

Yes, the purpose of|ra| here is not just to jump to the new vCPU code
(|continue_new_vcpu()|). It is used that way only the first time;
afterwards,|ra| will simply point to the next instruction after the
call to|__context_switch()| in|context_switch()| [5].

[5] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/domain.c?ref_type=heads#L463

>
>> +    /* CSRs */
>> +    register_t hstatus;
>> +    register_t hedeleg;
>> +    register_t hideleg;
>> +    register_t hvip;
>> +    register_t hip;
>> +    register_t hie;
>> +    register_t hgeie;
>> +    register_t henvcfg;
>> +    register_t hcounteren;
>> +    register_t htimedelta;
>> +    register_t htval;
>> +    register_t htinst;
>> +    register_t hstateen0;
>> +#ifdef CONFIG_RISCV_32
>> +    register_t henvcfgh;
>> +    register_t htimedeltah;
>> +#endif
>> +
>> +    /* VCSRs */
>> +    register_t vsstatus;
>> +    register_t vsip;
>> +    register_t vsie;
>> +    register_t vstvec;
>> +    register_t vsscratch;
>> +    register_t vscause;
>> +    register_t vstval;
>> +    register_t vsatp;
>> +    register_t vsepc;
>> +}  __cacheline_aligned;
> Why this attribute?

As arch_vcpu structure is accessed pretty often I thought it would
be nice to have it cache-aligned so some accesses would be faster
and something like false sharing won't happen.

~ Oleksii


