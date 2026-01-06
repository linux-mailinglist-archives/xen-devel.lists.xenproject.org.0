Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34209CF8C5F
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 15:27:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196240.1514113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd81W-0000aw-Ho; Tue, 06 Jan 2026 14:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196240.1514113; Tue, 06 Jan 2026 14:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd81W-0000YU-FH; Tue, 06 Jan 2026 14:27:02 +0000
Received: by outflank-mailman (input) for mailman id 1196240;
 Tue, 06 Jan 2026 14:27:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd81V-0000YO-8A
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 14:27:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c30e81a5-eb0b-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 15:26:59 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso11652865e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 06:26:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb4c451sm20761295e9.5.2026.01.06.06.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 06:26:58 -0800 (PST)
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
X-Inumbo-ID: c30e81a5-eb0b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767709619; x=1768314419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XBhMQhGjjHpc1gSwBSjL22wDqF6Zt+gMzS49c7NEUgI=;
        b=fOomjP4xsfgWtSad+/KbgBdOKnkMlUm1co3JLqFtqrHEqH7By1AKvwdFDbo9vWSUTJ
         1RQ9nT/Ui+CGGCZxW/7xjrJLxrX0uPMpI6U/9WIzn/TtygL8dMqu3V5c3o+mcuiJQLHs
         Y4SdzLsbqREBjwe8SDkm2Whc6U9IdjFzc7rcaRJ21GIPrf78SCKlKqB7j1b21hQxLqHl
         UsjUTbePYJDynjOR9ZiHhUovazHpNIhKUbjE3zFFSK7G/e2XqsDMZ7Xespru6g99G99N
         vWeTKG/ascm8jm3wGiWVtf1QsJ5wfKINlMyTxsdUbtdWPfXq1oSEMDncT927rzI0Wz1p
         SxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767709619; x=1768314419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBhMQhGjjHpc1gSwBSjL22wDqF6Zt+gMzS49c7NEUgI=;
        b=rqfFlbd9GoaPXpqX1+dJf+jaYkPKlPNW4sRfF1cEMsFYi4QVToj/ZUIJFMBBHMsU8l
         6VAf47PYUpA5C6fjFr9BEq/2+Q3dpQuZBLWIngFjq4QIkEv5F8nI9YMtlBv+VLrq3X6e
         Q1DDuOr67HuipQTRdJkb3yTfWSXixeCcpNpk+VR/rvpQ87TqOHAI6Z/B42fsN/Z9A+Eg
         1bg6PZqa+tfAG5tY5fmK8bHq0repWE84uVEHyKSwaHHvKe/nOMcXPR5agpcS9AVS+c9E
         IWAoK0cftqLAXlcf4UAPWrfmV3k1+TXB8RkL+9UH8rlXZ1pLh3fVUXE/XU8KHW700+m8
         AS3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMIYi+IXzpWDtAcoW0DNLRS9YGhBdtEwvBYMwsOAJ6ppf5HnMB20aasB9g8ZAnlkG1yrhVM01ijiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze98B5M8MY4S0HOjZU8Roy4nFQCKER8+p1re399iv4ADMXfp+n
	/SwnDjWUy2Cb+nF/cmwXVQl1LfQB7nGQ08pkUQN103O6+kk3d+57EmTjokdpJhTRrA==
X-Gm-Gg: AY/fxX524wfgsKNpqlN2j+WqQWqPIURLEfQ0cIuxOG1LJYzZysL+ZjQZma+OiEb7+lY
	2C67UC5YXpJh95Gyopdi0st6TuXtrwwGYABO3ahfAWqH4fxfX4tL0FnKRCPRqNHqm147oPEUC9y
	PzC9pykL/yf0WAKA+B7khVG4WV5wL8WpSViKBsArZ2zomb/NXwGviqB5KSkrvQa+RZ2sQAct0Pf
	EjhX1l4MjByMyBO0MOaA8o+znGBYUK5uD0Tm8jcZ2313cnrzl6wPN/MXTZTORNwqe3dCTHuVzOv
	v60x/fOtus8JuVKoMIOLzg8tEzZvd8MX4iXtuWQeyXvt4AKYcfceRX0wAKEw7W5l3woWJjHk8I6
	Xj+1tZNOw1S70xHMWkf3url2wm8HxvAjhaSZm044GetQmygBtAWhRykeYtqSO3h92fLc3tSbZ4H
	9M4/oK7nFihY1x34I0uLtPYc+nZgDIaOkRnSWJUYYbSoJed6FeR5imhk/7tYxsRgQIMEGkILpTq
	r8=
X-Google-Smtp-Source: AGHT+IFeruKI6obClXDY0ylLJ/PyJv1B+rtSUo6HuhDyw9oohvpIgH5yNzEwilzDTvoaG2aHONUrTg==
X-Received: by 2002:a05:600c:8485:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-47d7f0975e8mr38719265e9.21.1767709619292;
        Tue, 06 Jan 2026 06:26:59 -0800 (PST)
Message-ID: <2253f28f-07af-46db-9116-e9b5427953a9@suse.com>
Date: Tue, 6 Jan 2026 15:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/15] xen/riscv: introduce struct arch_vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <89629a0d-de6e-46e2-8517-a4b2fdd52183@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 15:19, Oleksii Kurochko wrote:
> On 1/5/26 5:58 PM, Jan Beulich wrote:
>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>> Introduce structure with VCPU's registers which describes its state.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Since none of this is being used for the time being, I think the description
>> wants to be a little less terse. Coming from the x86 (rather then the Arm)
>> side, I find the arrangements irritating. And even when comparing to Arm, ...
>>
>>> --- a/xen/arch/riscv/include/asm/domain.h
>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>> @@ -22,9 +22,63 @@ struct hvm_domain
>>>   struct arch_vcpu_io {
>>>   };
>>>   
>>> -struct arch_vcpu {
>>> +struct arch_vcpu
>>> +{
>>>       struct vcpu_vmid vmid;
>>> -};
>>> +
>>> +    /* Xen's state: Callee-saved registers and tp, gp, ra */
>> ... I don't think the following structure describes "Xen's state". On Arm
>> it's guest controlled register values which are being saved afaict. I
>> would then expect the same to become the case for RISC-V.
> 
> I think this is not fully correct, because guest-controlled registers on
> Arm are allocated on the stack [1][2].

I'll admit that I should have said "possibly guest-controlled". Callee-
saved registers may or may not be used in functions, and if one isn't
used throughout the call-stack reaching __context_switch(), it would
still hold whatever the guest had put there.

> Regarding|xen_saved_context| (or|saved_context| on Arm, which I used as a base),
> I think|xen_saved_context| is a slightly better name. Looking at how the
> |saved_context| structure is used on Arm [3], it can be concluded that
> |__context_switch()| switches only Xen’s internal context. What actually happens is
> that|__context_switch()| is called while running on the previous vCPU’s stack
> and returns on the next vCPU’s stack. Therefore, it is necessary to have
> the correct register values stored in the|saved_context| structure in order
> to continue Xen’s execution when it later returns to the previous stack.

For this and ...

> Probably I need to introduce|__context_switch()| in this patch series for RISC-V
> now; I hope this will clarify things better. At the moment, it looks like [4].
> 
> [1] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/include/asm/arm64/processor.h#L14
> [2] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/domain.c#L547
> 
> [3] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/arm64/entry.S#L650
> 
> [4] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/entry.S?ref_type=heads#L153
> 
>>
>>> +    struct
>>> +    {
>>> +        register_t s0;
>>> +        register_t s1;
>>> +        register_t s2;
>>> +        register_t s3;
>>> +        register_t s4;
>>> +        register_t s5;
>>> +        register_t s6;
>>> +        register_t s7;
>>> +        register_t s8;
>>> +        register_t s9;
>>> +        register_t s10;
>>> +        register_t s11;
>>> +
>>> +        register_t sp;
>>> +        register_t gp;
>>> +
>>> +        /* ra is used to jump to guest when creating new vcpu */
>>> +        register_t ra;
>>> +    } xen_saved_context;
>> The xen_ prefix here also doesn't exist in Arm code.
> 
> I think it should be added for Arm too. I can send a patch.

... this, to reword my comment: What value does the xen_ prefix add?

>> Nor is there a
>> similar, partly potentially misleading comment on "pc" there
>> comparable to the one that you added for "ra". ("Potentially
>> misleading" because what is being described is, aiui, not the only
>> and not even the main purpose of the field.)
> 
> Yes, the purpose of|ra| here is not just to jump to the new vCPU code
> (|continue_new_vcpu()|). It is used that way only the first time;
> afterwards,|ra| will simply point to the next instruction after the
> call to|__context_switch()| in|context_switch()| [5].
> 
> [5] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/domain.c?ref_type=heads#L463
> 
>>
>>> +    /* CSRs */
>>> +    register_t hstatus;
>>> +    register_t hedeleg;
>>> +    register_t hideleg;
>>> +    register_t hvip;
>>> +    register_t hip;
>>> +    register_t hie;
>>> +    register_t hgeie;
>>> +    register_t henvcfg;
>>> +    register_t hcounteren;
>>> +    register_t htimedelta;
>>> +    register_t htval;
>>> +    register_t htinst;
>>> +    register_t hstateen0;
>>> +#ifdef CONFIG_RISCV_32
>>> +    register_t henvcfgh;
>>> +    register_t htimedeltah;
>>> +#endif
>>> +
>>> +    /* VCSRs */
>>> +    register_t vsstatus;
>>> +    register_t vsip;
>>> +    register_t vsie;
>>> +    register_t vstvec;
>>> +    register_t vsscratch;
>>> +    register_t vscause;
>>> +    register_t vstval;
>>> +    register_t vsatp;
>>> +    register_t vsepc;
>>> +}  __cacheline_aligned;
>> Why this attribute?
> 
> As arch_vcpu structure is accessed pretty often I thought it would
> be nice to have it cache-aligned so some accesses would be faster
> and something like false sharing won't happen.

I think you would want to prove that this actually makes a difference.
I notice Arm has such an attribute (and maybe indeed you merely copied
it), but x86 doesn't.

Jan

