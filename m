Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C556692EAD5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 16:34:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757558.1166572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRura-0000MZ-Fr; Thu, 11 Jul 2024 14:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757558.1166572; Thu, 11 Jul 2024 14:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRura-0000KU-C0; Thu, 11 Jul 2024 14:33:38 +0000
Received: by outflank-mailman (input) for mailman id 757558;
 Thu, 11 Jul 2024 14:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRurY-0000KE-RU
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 14:33:36 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dc017b6-3f92-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 16:33:35 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42565670e20so12472155e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 07:33:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a122a1sm52486145ad.45.2024.07.11.07.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 07:33:33 -0700 (PDT)
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
X-Inumbo-ID: 8dc017b6-3f92-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720708414; x=1721313214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BMwvlBZnkRRQ3eaqzdsDt1wDXDNWJ3MWLuDF6WvDsxc=;
        b=E7B1fxJm3M9TRX1deXcs5IMQ3h1YJMvsqu5u0vDuyPXFFzTe1EXTV3hjxszrt0KDeY
         uW2zioRFRX7H1YqwHLO5p8t57aVk10QAk+t10PiSDS/2PDWGvPKmo1B+kl8Uv1Pk/itZ
         ssilVRDZ8cUDEvEtEYKTPuWgYzY/8tYSKP6UUQlcRfEZ12exGW8d6XKOAZUs2bXkS0mX
         br56XwI2je5dVhHHC4KNKGbbRpKWITLiMCVTkrg8VYe5YsVW6f2Vr8EY3t6bRa4nHHkh
         QqzJ7BXXX4/7TSTxMslhcRD5sN6XWQ1K5OIi2o3sQkeSlpHo3ni3Sd3UsU1f6yJGve+V
         MZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708414; x=1721313214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMwvlBZnkRRQ3eaqzdsDt1wDXDNWJ3MWLuDF6WvDsxc=;
        b=Vc2ZAQqkTSxZPEXFOapJ7CKWCeoWiCplD/rgWDxAgLEr57t496ZNsOYkO96fLGpZhT
         ekbEBg3UUYBeudxbqI3WPAUshYFcq2hiUtjOzRE03PnakMP5+i5Dyadk9p7Lw9Y5Zrx0
         vPCBIUbe/2Q/0O7l8m5AsygRMCdhmZrAU4++h7PpovcjVZmUkvCGH42Ev1TXrR+zhXLY
         7oVfT9IcWXNKlG2plwiEtVj6L501L8AUdw42NwSFnRxuZnCDeDIv3V4klqt08chihkty
         80Yd+5BMfE4FcMF7qFWxieTYolA1nt1SzQLmN+i41lSSUhQjOiLTcetMvTluzhfYuOYa
         3XGw==
X-Forwarded-Encrypted: i=1; AJvYcCV9YGywuhxL8U9H0qfciQ4mvn9Ysz06qIwsOWb8ywKyTFGN2FbIVTWZDTUYSbk3q9C8ogCmLDBIGZS8K09DRFpYYUF0NvNe3jOTY5oCT/I=
X-Gm-Message-State: AOJu0YxgeIHnKc+Yv83pwqdJIZXNvqzFH1tFWRBSfOOTy9a/zNw7SN15
	2HhW/oHZ+lQzFzUpOdKcJaQKoGIHW5ZAVkySPJQ8CHoc6j/nknBAnYe7C3zrKA==
X-Google-Smtp-Source: AGHT+IEMBO0FPp+bdz60j1RxNvI76hvrZ+Ox9bzM+VXK7fjhZJe2Mfj9pA+lELZWo1q3Fhm37BaUgw==
X-Received: by 2002:adf:f386:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-367f04ca2c1mr2808318f8f.9.1720708414349;
        Thu, 11 Jul 2024 07:33:34 -0700 (PDT)
Message-ID: <95ab6441-5aad-4536-ae1b-034dcd1a69ea@suse.com>
Date: Thu, 11 Jul 2024 16:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
 <c51c485bac43b7589961aabec8af1b82d4673b94.1719918148.git.oleksii.kurochko@gmail.com>
 <ca373d42-22f1-41a2-bdbb-4733145c635a@suse.com>
 <a1224198ef6845f8f81baaaebe1d436726460c0e.camel@gmail.com>
 <bff4f1e4-9242-4a1c-bbca-ba3d609db03f@suse.com>
 <df82de5d4dcf5224f58d8595ff5ad03429e9cad9.camel@gmail.com>
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
In-Reply-To: <df82de5d4dcf5224f58d8595ff5ad03429e9cad9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2024 14:14, Oleksii wrote:
> On Thu, 2024-07-11 at 11:25 +0200, Jan Beulich wrote:
>> On 11.07.2024 10:50, Oleksii wrote:
>>> On Wed, 2024-07-10 at 12:01 +0200, Jan Beulich wrote:
>>>> On 02.07.2024 13:23, Oleksii Kurochko wrote:
>>>>> @@ -101,8 +102,38 @@ static void do_unexpected_trap(const
>>>>> struct
>>>>> cpu_user_regs *regs)
>>>>>      die();
>>>>>  }
>>>>>  
>>>>> +static bool is_valid_bug_insn(uint32_t insn)
>>>>> +{
>>>>> +    return insn == BUG_INSN_32 ||
>>>>> +           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
>>>>> +}
>>>>> +
>>>>> +/* Should be used only on Xen code */
>>>>> +static uint32_t read_instr(unsigned long pc)
>>>>> +{
>>>>> +    uint16_t instr16 = *(uint16_t *)pc;
>>>>> +
>>>>> +    ASSERT(is_kernel_text(pc + 1) || is_kernel_inittext(pc +
>>>>> 1));
>>>>> +
>>>>> +    if ( GET_INSN_LENGTH(instr16) == 2 )
>>>>> +        return instr16;
>>>>> +
>>>>> +    ASSERT(is_kernel_text(pc + 3) || is_kernel_inittext(pc +
>>>>> 3));
>>>>> +
>>>>> +    return *(uint32_t *)pc;
>>>>> +}
>>>>
>>>> Related to the point made further down: If either of these
>>>> assertions
>>>> fails,
>>>> won't we come back again right here? If either of the
>>>> is_kernel_*text()
>>>> wasn't working quite right, wouldn't we be at risk of entering an
>>>> infinite
>>>> loop (presumably not quite infinite because of the stack
>>>> overflowing
>>>> at some
>>>> point)?
>>> It is really possible to have infinite loop here so it should be
>>> better
>>> to use 'if' with die() or panic().
>>>
>>>>
>>>>>  void do_trap(struct cpu_user_regs *cpu_regs)
>>>>>  {
>>>>> +    register_t pc = cpu_regs->sepc;
>>>>> +    uint32_t instr = read_instr(pc);
>>>>> +
>>>>> +    if ( ( is_valid_bug_insn(instr) ) && (
>>>>> do_bug_frame(cpu_regs,
>>>>> pc) >= 0 ) )
>>>>
>>>> No consideration of the kind of exception? I'd expect it is one
>>>> very
>>>> specific one which the BUG insn would raise, and then there's no
>>>> point
>>>> fetching the insn when it's a different kind of exception.
>>> Good point.
>>>
>>> We should have 0x3 ( breakpoint exception ) in scause register. We
>>> can
>>> just check that without reading instruction and then also
>>> is_valid_bug_insn could be dropped too.
>>
>> Just that then you'll also lose the is_kernel_*text() checking, which
>> I
>> understand is there to remind you/us that one this becomes reachable
>> from non-Xen code, adjustments are going to be needed.
> One thing I wrote incorrectly is that we still need fetch instruction
> or at least 16 bits to identify the length of instruction to set proper
> sepc:
>     cpu_regs->sepc += GET_INSN_LENGTH(instr);
> 
> We could write that in the following way:
>     cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
> Would it be okay?

I think so, as long as you retain the assertion in some way, ahead of the
deref of pc.

Jan

