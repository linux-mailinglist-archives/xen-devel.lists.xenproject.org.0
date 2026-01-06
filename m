Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587ECCF9386
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 17:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196307.1514165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd9Tp-0007S7-UG; Tue, 06 Jan 2026 16:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196307.1514165; Tue, 06 Jan 2026 16:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd9Tp-0007P0-RE; Tue, 06 Jan 2026 16:00:21 +0000
Received: by outflank-mailman (input) for mailman id 1196307;
 Tue, 06 Jan 2026 16:00:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8PS=7L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vd9To-0007Ou-9n
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 16:00:20 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc6cd723-eb18-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 17:00:19 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7277324054so205902466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 08:00:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a23433asm265070766b.3.2026.01.06.08.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 08:00:17 -0800 (PST)
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
X-Inumbo-ID: cc6cd723-eb18-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715218; x=1768320018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXzgotMMoAFsrtHUndWOcVA3dD1wQQgYXVKnrLhYyn4=;
        b=TOUPPS4C+q4EWZshIqnckI9WB4vsolWX0lN15o/tXItvKsqfEpQXZ9nA+mWvFC2/fe
         eFaHHjijpJD5qegcfBEkDBzV/1wAF+k9WatiquUrZNn+08YO0EYehkQ4X3acNn8X4vOh
         o4pK5zE0sKZnGiqkIV6z6Bhr4J6SpD7clfXfk4OCYwz7cNAq7qp7TgW9yp4/3oW2Ajye
         1fNfurKGFcRBBStlSsaOpo76EtV/r9SgJCEGKCqfMduevZH1/jKESCo/iVpVFXkpbwyu
         49VFqD4+pD1Iil6LH+Cc0CrQ0iXDwRhF2YY75YuU8Xe2NH6DaOUsf4/6HwWN4J8Ox0D0
         2ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715218; x=1768320018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXzgotMMoAFsrtHUndWOcVA3dD1wQQgYXVKnrLhYyn4=;
        b=AuS5zW09Vd0saIKb2rkkMG+sp1J1SxmDvStRzhnOK9rvvzZUusGK62V0CDL+sRZDGa
         49BJrY5etPPKNl9RJABrP/sDByrAkBxInN5wovX4DGoNKOoglqc8jHw0Q1Bmx+certo2
         +nJGrAFu++zcVPi9Bf4N6/PIDEVUd0AyOOOj3BBh6mZ74OweLbqrlO0zif0lhxT62qIg
         +yIy6JJ65o1FZqwk0kjz3/sqRYhRDNvFQAqVFrpTazMCtLOW14E/9zNY/UWK037gRWb1
         xE4OihAoyArHyNb8lk9hOIqwkO1ir1fWDy4P7uc4rI2wsBbxo8odC3Nb9qTsH8YQhk4M
         n7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV0T8fgPV+S0y/y3eP9tnMWjbdUIfvkxoF2+X9rQQwxPgk9Yqil9v+Sl7sWMDq+h0DkeF5YWPyRREI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjBbYO3MZ/UV1+v5y+9oSzm6Gq58n7Wq1q3T2w2IjS2JQLt5pr
	1t9P0KKMZGZ4CZ+cb8F3qW1uUZ+OGlGHhqdozRthtMYjnyXWOEl+Gr8/
X-Gm-Gg: AY/fxX5Q0LBLylveaYPES90nPjydrpDWNqTkk/EDmOhop5mI7aXiAZgrJwREuD0Oifg
	oG9LI0gIhSj6pKNiAvU9zE5gsnmjpC4d1VOFbll6F/CV5pLO7KzLjqZxNVNFQ1juSQvAoQBnitc
	j6YEQn8lLwFj2XnmwWjZ2wb1gjLPklPsyfLhDQ63/azjCluQNIMxb0xu0EjSJxioL/WfZUeeYrn
	eEccLiHLih/b9UqqOglT5opHJPakbLkC5XUzsrTuaFSRi4JLQd/Bgv0N2iD2hRxbwrqiZic+lc1
	yPKILyZukYJTUgRk8O21rCoaQ1UwB8VHmkxgSeuT3ctRCkAqmcIzbqgxjBEk3YCXtL8Zmsi4DwH
	sPlh3AeDI1PbWKgM6ZmICRveL0HIxi247EoY7RhOvMq0RpHipAVQrfVXMvgULiIe3rFfQb6U2lK
	j5eRt08bTp8Z13oYaQJb4Pv6R9s7wqMl+/V5aqcQfijhOTYZig34DMEk7xlEfwZ9c=
X-Google-Smtp-Source: AGHT+IGYiWtL2mzfcJjYIj/lQRLe2q1dB3h9umdIT1pjm3drjpprFqVbwfeFZp/61e1z1tOFDCmx4A==
X-Received: by 2002:a17:907:970a:b0:b76:da45:e3d6 with SMTP id a640c23a62f3a-b8426a6bc17mr374828966b.16.1767715218120;
        Tue, 06 Jan 2026 08:00:18 -0800 (PST)
Message-ID: <5daf24da-0600-4afe-8a20-9f938e2dadaa@gmail.com>
Date: Tue, 6 Jan 2026 17:00:16 +0100
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
 <839c06a2-dbd2-44c5-abe6-905a1f3ffefd@gmail.com>
 <e8a1fc9c-6715-4ac7-acee-754ec29283fe@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e8a1fc9c-6715-4ac7-acee-754ec29283fe@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/6/26 4:33 PM, Jan Beulich wrote:
> On 06.01.2026 16:05, Oleksii Kurochko wrote:
>> On 1/6/26 3:26 PM, Jan Beulich wrote:
>>> On 06.01.2026 15:19, Oleksii Kurochko wrote:
>>>> On 1/5/26 5:58 PM, Jan Beulich wrote:
>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>> Introduce structure with VCPU's registers which describes its state.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> Since none of this is being used for the time being, I think the description
>>>>> wants to be a little less terse. Coming from the x86 (rather then the Arm)
>>>>> side, I find the arrangements irritating. And even when comparing to Arm, ...
>>>>>
>>>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>>>> @@ -22,9 +22,63 @@ struct hvm_domain
>>>>>>     struct arch_vcpu_io {
>>>>>>     };
>>>>>>     
>>>>>> -struct arch_vcpu {
>>>>>> +struct arch_vcpu
>>>>>> +{
>>>>>>         struct vcpu_vmid vmid;
>>>>>> -};
>>>>>> +
>>>>>> +    /* Xen's state: Callee-saved registers and tp, gp, ra */
>>>>> ... I don't think the following structure describes "Xen's state". On Arm
>>>>> it's guest controlled register values which are being saved afaict. I
>>>>> would then expect the same to become the case for RISC-V.
>>>> I think this is not fully correct, because guest-controlled registers on
>>>> Arm are allocated on the stack [1][2].
>>> I'll admit that I should have said "possibly guest-controlled". Callee-
>>> saved registers may or may not be used in functions, and if one isn't
>>> used throughout the call-stack reaching __context_switch(), it would
>>> still hold whatever the guest had put there.
>> But the guest doesn't put there nothing, only Xen does that and it is a reason
>> why I am trying to call it Xen state. Guest works only with what is stored in
>> struct cpu_info->guest_cpu_user_regs.* ...
>>
>>>> Regarding|xen_saved_context| (or|saved_context| on Arm, which I used as a base),
>>>> I think|xen_saved_context| is a slightly better name. Looking at how the
>>>> |saved_context| structure is used on Arm [3], it can be concluded that
>>>> |__context_switch()| switches only Xen’s internal context. What actually happens is
>>>> that|__context_switch()| is called while running on the previous vCPU’s stack
>>>> and returns on the next vCPU’s stack. Therefore, it is necessary to have
>>>> the correct register values stored in the|saved_context| structure in order
>>>> to continue Xen’s execution when it later returns to the previous stack.
>>> For this and ...
>>>
>>>> Probably I need to introduce|__context_switch()| in this patch series for RISC-V
>>>> now; I hope this will clarify things better. At the moment, it looks like [4].
>>>>
>>>> [1] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/include/asm/arm64/processor.h#L14
>>>> [2] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/domain.c#L547
>>>>
>>>> [3] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/arm64/entry.S#L650
>>>>
>>>> [4] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/entry.S?ref_type=heads#L153
>>>>
>>>>>> +    struct
>>>>>> +    {
>>>>>> +        register_t s0;
>>>>>> +        register_t s1;
>>>>>> +        register_t s2;
>>>>>> +        register_t s3;
>>>>>> +        register_t s4;
>>>>>> +        register_t s5;
>>>>>> +        register_t s6;
>>>>>> +        register_t s7;
>>>>>> +        register_t s8;
>>>>>> +        register_t s9;
>>>>>> +        register_t s10;
>>>>>> +        register_t s11;
>>>>>> +
>>>>>> +        register_t sp;
>>>>>> +        register_t gp;
>>>>>> +
>>>>>> +        /* ra is used to jump to guest when creating new vcpu */
>>>>>> +        register_t ra;
>>>>>> +    } xen_saved_context;
>>>>> The xen_ prefix here also doesn't exist in Arm code.
>>>> I think it should be added for Arm too. I can send a patch.
>>> ... this, to reword my comment: What value does the xen_ prefix add?
>> ... because guest doesn't access saved_context and as I mentioned above
>> guest has "access" only to struct cpu_info->guest_cpu_user_regs.*.
> The guest has no access to anything in the hypervisor.

Of course, the guest doesn't have access. By "access" I meant guest context
stored in cpu_info->guest_cpu_user_regs.*.

>   That said, seeing
> that Andrew had asked for this, so be it then (albeit I remain unconvinced).

I will add some extra comments about xen_saved_context to make things more
clear.

~ Oleksii


