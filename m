Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACE9391DB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762214.1172335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVv1B-0002SS-LC; Mon, 22 Jul 2024 15:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762214.1172335; Mon, 22 Jul 2024 15:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVv1B-0002Pi-Hg; Mon, 22 Jul 2024 15:32:05 +0000
Received: by outflank-mailman (input) for mailman id 762214;
 Mon, 22 Jul 2024 15:32:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVv1A-0002Pc-Me
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:32:04 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b3174dd-483f-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 17:32:02 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52f00ad303aso1929124e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 08:32:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30af837e5sm6280515a12.43.2024.07.22.08.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 08:32:01 -0700 (PDT)
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
X-Inumbo-ID: 8b3174dd-483f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721662322; x=1722267122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SOIZAqBEbDi9h0PwNo+bs4UheO9DVZgDsoH+Y10LPAQ=;
        b=FZRiSsRnHM93KpGQJzHdaU0qt4njPwHPn2xqr1I0QE1pAfaOb/f5LriI2exOUxpVRK
         aSNqeBxo9Eth4KtUdru9lly2jUghCmKNMXOZjyEiWKXfQMnOKcOJHxZLjthhX2/Toy9J
         BhypqFQA+JSqKbE2Lvp7z5v8peSeU3OzOGZ5hlPYMI41Sd7OtvisiOy1UE+/pvQjTzdy
         Zjlr4YgopzNvGTcxz+ufgrbhpkmmkaTnws4ejjehpLYfijapXw/IYYYgMBJlU4m14tpV
         wIZYQ4G8HcMh1KJv6VZmpYqDaqjcDDDL6W2mi4I6ZGlKyj11APmWRZu2gzCDzmT6fuMT
         E4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721662322; x=1722267122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOIZAqBEbDi9h0PwNo+bs4UheO9DVZgDsoH+Y10LPAQ=;
        b=DMabAenmKjEYoXWF+k7THjBKjU2M3sk66jJT1G6ML09oYq/A2+rO21dFz3Euo9xnRH
         YRET/S/7voJHrInS1MzW0JDyPzrPJsWmliViLIWV0rMUCx94amvr/S5HIP2501xvRlWp
         dR7JGCK6is2J1jfEhKlVwobCWTXjDIeibDWYcR4EkDsO41jQHUzWm/Ju5siKbQDmVgMC
         HbbxcwAKio/Ht8jPR2EVDFO5FGV558pmNkqIhmx5niPtoUciDkpXGeb4RiS8RyZSupQ3
         7TpVKhOeaHBJavAbajHCXK4zJGgpJL7tQ9C2RlhnUyb3b99Zr64mrG7ZlOo6LQCN7KsQ
         z17w==
X-Forwarded-Encrypted: i=1; AJvYcCVc9yuZHx8WdTCfJtWPmHzZWp8p2I675Lh/WdHYPFiWCben5/NbrXJ/kVsWwTnbgZ9/JVUo72O+C4gBn9dB3gR5SFtQKGhN0Aja8IoGG30=
X-Gm-Message-State: AOJu0Yyey4nFPTlbE5YqyZm0v5c/YPdggRulhAH1sY2a1x78w6g6xmJh
	yWN5PCs6mBFFYx6etJPekznwnbGTXwjF0Xe9jP45lIbUCB/Ziou/tg0ia1A8Hg==
X-Google-Smtp-Source: AGHT+IGa+O7tfjLNlXzYyu0VuL/INd4vUsW8KKGD5bgHfkTac1dPvfKCieayTn49cONUW8x9dNG9Ww==
X-Received: by 2002:a05:6512:3b27:b0:52c:df5f:7b4e with SMTP id 2adb3069b0e04-52fc406f75emr167485e87.38.1721662322180;
        Mon, 22 Jul 2024 08:32:02 -0700 (PDT)
Message-ID: <6036a48e-f2ae-4629-ba73-2c78f46234fb@suse.com>
Date: Mon, 22 Jul 2024 17:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
 <c2bbbe2ac9f41c19f746418df324212b2e4684a5.1720799487.git.oleksii.kurochko@gmail.com>
 <5e3be451-188f-4092-a84e-1c40a5ad6b44@suse.com>
 <16b92dc23daf98d2c55ab42f0d941d9b8888064e.camel@gmail.com>
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
In-Reply-To: <16b92dc23daf98d2c55ab42f0d941d9b8888064e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 16:09, Oleksii wrote:
> On Mon, 2024-07-22 at 13:02 +0200, Jan Beulich wrote:
>> On 12.07.2024 18:18, Oleksii Kurochko wrote:
>>> ---
>>> Changes in V10:
>>>  - put 'select GENERIC_BUG_FRAME' in "Config RISCV".
>>>  - rework do_trap() to not fetch an instruction in case when the
>>> cause of trap
>>>    is BUG_insn.
>>
>> It's BUG_insn here, but then ...
>>
>>> @@ -103,7 +104,29 @@ static void do_unexpected_trap(const struct
>>> cpu_user_regs *regs)
>>>  
>>>  void do_trap(struct cpu_user_regs *cpu_regs)
>>>  {
>>> -    do_unexpected_trap(cpu_regs);
>>> +    register_t pc = cpu_regs->sepc;
>>> +    unsigned long cause = csr_read(CSR_SCAUSE);
>>> +
>>> +    switch ( cause )
>>> +    {
>>> +    case CAUSE_BREAKPOINT:
>>
>> ... BREAKPOINT here? Generally I'd deem something named "breakpoint"
>> as
>> debugging related (and hence continuable). I'd have expected
>> CAUSE_ILLEGAL_INSTRUCTION here, but likely I'm missing something.
> Agree, that is is confusing, but BUG_insn is defined as ebreak
> instruction ( Linux kernel uses also ebreak ) and it generates
> CAUSE_BREAKPOINT.

I'm curious: How do you / does a debugger tell a breakpoint set on
such an EBREAK insn (e.g. as a result of a use of WARN_ON()) from
the original, unmodified insn? If there's a breakpoint, you want
to forward to the debugger. Whereas if there's no breakpoint, you
want to process the WARN_ON() normally.

Jan

