Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 699FB92E363
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 11:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757217.1165995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRq42-00080Z-AW; Thu, 11 Jul 2024 09:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757217.1165995; Thu, 11 Jul 2024 09:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRq42-0007yQ-7o; Thu, 11 Jul 2024 09:26:10 +0000
Received: by outflank-mailman (input) for mailman id 757217;
 Thu, 11 Jul 2024 09:26:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRq40-0007yK-Vi
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 09:26:08 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a66ece2-3f67-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 11:26:07 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-58b447c51bfso739321a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 02:26:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ca34e89eefsm5175265a91.31.2024.07.11.02.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 02:26:06 -0700 (PDT)
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
X-Inumbo-ID: 9a66ece2-3f67-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720689967; x=1721294767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=36B1OmI3mUY03WUHSxrGe4AwhodhCfas6L3RbhjZ9gk=;
        b=I850sg9UNmWwyfThpgJHvucHRYuAFXiW4xSlcG+HE1uKqMN9qUinNufizeJQ31r8ze
         Z3HjkJ2UtbFgiGVkgzqPA+L4WZFemgVLrBypn11ytO6MZG5J1A5raA7QicS/rEZOtIKN
         VTNKQft/uTfk7Nx4xDTshMuLmv1yPL+hvLVXy6+L00YzZiBqR/hGdNzUfTAZG7g4rwPo
         2TJm9pUWyoz+S69q5TY2hgvp6ODufoiz/8IPnNOC+MiJkpkPn8OXkUJcZ2Dq0m0mKa88
         tDsYwVLN0ykSzB9wu0HZBBHChGHhPVj7JkgxN4tohCeZ7pUc5qy7Qo8NAS6kHvcPIdPu
         XOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720689967; x=1721294767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36B1OmI3mUY03WUHSxrGe4AwhodhCfas6L3RbhjZ9gk=;
        b=pvsbYwBdrwFWC0a3qsxGB9KMsqwBmVqaS4/sYu6W+l9vHjjdwBGs8RQT/xdEigccbY
         ogUvpDXRfkYRNhNMubLnUjXuMKnhONnVn3OijatLPASlXidq+71suTcnNl3BWPnqRcv9
         UINFgI9IKqhb6uDousXrcZksoDDlGzALO7Se+RdbZ942Jqrmi6NCO67j/AJpNjm6HUzm
         MC6R56ctJ9kJWCF/lKRye6h2Ct24UN+awhc1qFakLdRgTXswS5Fv+VV+Hm8ymTqiG8Ii
         tqPrnnMLq37z2I+2+X+FodpV36vdN6xSRxGR7ZFSdvJf348SV+9Bq3hXCf+mWNyYB3NH
         hQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUF/ZbXCLMygKVNe6m1Tqhlak9JYKONlzuPR0CJBvBhqH5IL41+jVsw+R7p8SY0kVkRzmuej6RMMARYAs2TuDx52y74UCyezuAR7IsgBEk=
X-Gm-Message-State: AOJu0YzA+4cOtc39GYvyDg53X9dj1d2PT0LlZNiULbAHEPgz2aIZFG8v
	RygKteXqmopAOS8j2ewkR49Vm/qVY76LQqUcBXFs0gILYhc9VOlITyANlTamOA==
X-Google-Smtp-Source: AGHT+IF8lFgYKqSgkaOZ6H866ywqAgCNjCN7OF030pYn7jIpi1Kt+uF78p1c5tdckmVREC6/rhg3Dg==
X-Received: by 2002:a05:6402:33ce:b0:58e:dbd:65cd with SMTP id 4fb4d7f45d1cf-594bc7c7e1amr4818506a12.26.1720689967334;
        Thu, 11 Jul 2024 02:26:07 -0700 (PDT)
Message-ID: <bff4f1e4-9242-4a1c-bbca-ba3d609db03f@suse.com>
Date: Thu, 11 Jul 2024 11:25:59 +0200
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
In-Reply-To: <a1224198ef6845f8f81baaaebe1d436726460c0e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2024 10:50, Oleksii wrote:
> On Wed, 2024-07-10 at 12:01 +0200, Jan Beulich wrote:
>> On 02.07.2024 13:23, Oleksii Kurochko wrote:
>>> @@ -101,8 +102,38 @@ static void do_unexpected_trap(const struct
>>> cpu_user_regs *regs)
>>>      die();
>>>  }
>>>  
>>> +static bool is_valid_bug_insn(uint32_t insn)
>>> +{
>>> +    return insn == BUG_INSN_32 ||
>>> +           (insn & COMPRESSED_INSN_MASK) == BUG_INSN_16;
>>> +}
>>> +
>>> +/* Should be used only on Xen code */
>>> +static uint32_t read_instr(unsigned long pc)
>>> +{
>>> +    uint16_t instr16 = *(uint16_t *)pc;
>>> +
>>> +    ASSERT(is_kernel_text(pc + 1) || is_kernel_inittext(pc + 1));
>>> +
>>> +    if ( GET_INSN_LENGTH(instr16) == 2 )
>>> +        return instr16;
>>> +
>>> +    ASSERT(is_kernel_text(pc + 3) || is_kernel_inittext(pc + 3));
>>> +
>>> +    return *(uint32_t *)pc;
>>> +}
>>
>> Related to the point made further down: If either of these assertions
>> fails,
>> won't we come back again right here? If either of the
>> is_kernel_*text()
>> wasn't working quite right, wouldn't we be at risk of entering an
>> infinite
>> loop (presumably not quite infinite because of the stack overflowing
>> at some
>> point)?
> It is really possible to have infinite loop here so it should be better
> to use 'if' with die() or panic().
> 
>>
>>>  void do_trap(struct cpu_user_regs *cpu_regs)
>>>  {
>>> +    register_t pc = cpu_regs->sepc;
>>> +    uint32_t instr = read_instr(pc);
>>> +
>>> +    if ( ( is_valid_bug_insn(instr) ) && ( do_bug_frame(cpu_regs,
>>> pc) >= 0 ) )
>>
>> No consideration of the kind of exception? I'd expect it is one very
>> specific one which the BUG insn would raise, and then there's no
>> point
>> fetching the insn when it's a different kind of exception.
> Good point.
> 
> We should have 0x3 ( breakpoint exception ) in scause register. We can
> just check that without reading instruction and then also
> is_valid_bug_insn could be dropped too.

Just that then you'll also lose the is_kernel_*text() checking, which I
understand is there to remind you/us that one this becomes reachable
from non-Xen code, adjustments are going to be needed.

Jan

