Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D964945C2A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 12:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770943.1181528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpYG-0005gi-3C; Fri, 02 Aug 2024 10:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770943.1181528; Fri, 02 Aug 2024 10:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpYG-0005eR-0S; Fri, 02 Aug 2024 10:30:24 +0000
Received: by outflank-mailman (input) for mailman id 770943;
 Fri, 02 Aug 2024 10:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZpYF-0005eL-0q
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 10:30:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3869ed2a-50ba-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 12:30:21 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so876594266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 03:30:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d4dd45sm82391366b.104.2024.08.02.03.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 03:30:20 -0700 (PDT)
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
X-Inumbo-ID: 3869ed2a-50ba-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722594621; x=1723199421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F22XMe4vty8J1P+rIV7UcvVeYo+tLPb7wD4NewjtCto=;
        b=cvjjeVrtB4NJuf0cVOIChLj2gLoxlaoW1Oq9O2dY5592nBlp678dYu3FJgqq7dcNaA
         GvK2GmrezfSANnqF0XgjdOxUuJ03GGj1REFVlHUAcvXuz/L0Ufi0DstSFQwbbWXkT4Ll
         4J/2ir8/v4pupakQ5CDtDX9XhSiMUF+m+rYh+4ejigEz58cSGJ4kgd1s9mxX6ILXkJqS
         QGpRUI/es3AYenTc0fXspjTJOAlEo8vOfmD2hqnyf5d7E+UJDGU8P/+XDYbKpB0hd3ji
         Uz7vfdWAMSrAnjtLRksH39vyjwVfDFAnVGlMJUpYzJyGzZCOGCpuMSkY11zc2ifTc5fZ
         blvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722594621; x=1723199421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F22XMe4vty8J1P+rIV7UcvVeYo+tLPb7wD4NewjtCto=;
        b=Cx0s4LMu/vcCvhTbtGZKCtFKjycnq0stCo20qEAu5haP163tGmEbFMytkAF3TnRRGY
         sPeIL7lMMSJpkqxBIeVaw5utHy54ItdqYnu14lc3oRSHK3Q+rtFbWv9WYvIDRhsBmYJc
         OKVIqEbTIVt5oXIxcyu1wUb8J3pHm6Xs5ZmCiWdJDSdDAKTIBzoJtQSRaOc7a0m+Bnqb
         nAT48gMlF8QsKOFSdvRTs1wVVkaydv6OHkSr2uArcq+aGfAxWdG+lZcJnYBiCnquFKu9
         3RQoY/ZLQPDXg8gkApTowny0jrEBctGDKzEf1B5PZbIjslB2su6aXnYwmln0p105zXFv
         BKPA==
X-Gm-Message-State: AOJu0Yxq9kZh+HkS+Jj1dzWFHbXpqCdADEhyvXPwheQTEE3C5T+8rYVn
	M7aZtAJRBxgeoeNFy44p3dsDWwohNoGA27GN7XCtlqJ9oJimRbbmO7jyX+cM/w==
X-Google-Smtp-Source: AGHT+IGqaaXcyfeWsiDk9FWXE2tjerza4uMCaAmuGD0hGWRFJKx49bmLKlGcDmLvSqq3zb2TvoXprw==
X-Received: by 2002:a17:907:3da4:b0:a7a:a3f7:38a2 with SMTP id a640c23a62f3a-a7dc4fefd18mr282784266b.41.1722594620590;
        Fri, 02 Aug 2024 03:30:20 -0700 (PDT)
Message-ID: <1d3ef706-fa3d-4dee-818c-83904012ca35@suse.com>
Date: Fri, 2 Aug 2024 12:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
To: oleksii.kurochko@gmail.com
Cc: xen-devel@lists.xenproject.org
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
 <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
 <83e20f26-ae59-4191-a12d-f31f779c91e2@suse.com>
 <a16ac4cd3fe0143e40f8b5ec993cd6049d41ea3d.camel@gmail.com>
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
In-Reply-To: <a16ac4cd3fe0143e40f8b5ec993cd6049d41ea3d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.08.2024 12:22, oleksii.kurochko@gmail.com wrote:
> On Fri, 2024-08-02 at 11:21 +0200, Jan Beulich wrote:
>> On 02.08.2024 11:14, oleksii.kurochko@gmail.com wrote:
>>> On Mon, 2024-07-29 at 15:00 +0200, Jan Beulich wrote:
>>>>> To have working BUG(), WARN(), ASSERT,
>>>>> run_in_exception_handler()
>>>>> it is needed to enable GENERIC_BUG_FRAME.
>>>>>
>>>>> ebreak is used as BUG_insn so when macros from <xen/bug.h> are
>>>>> used, an exception with BREAKPOINT cause will be generated.
>>>>>
>>>>> ebreak triggers a debug trap, which starts in debug mode and is
>>>>> then filtered by every mode. A debugger will first handle the
>>>>> debug trap and check if ebreak was set by it or not. If not,
>>>>> CAUSE_BREAKPOINT will be generated for the mode where the
>>>>> ebreak
>>>>> instruction was executed.
>>>>
>>>> Here and in the similar code comment you talk about an external
>>>> debugger, requiring debug mode, which is an optional feature. In
>>>> my earlier comments what I was referring to was pure software
>>>> debugging. I continue to fail to see how properly distinguishing
>>>> ebreak uses for breakpoints from ebreak uses for e.g. BUG() and
>>>> WARN() is going to be feasible.
>>> GDB keeps track of what addresses it has breakpoints at.
>>
>> Of course it does. But in Xen how do you decide whether to trigger
>> the debugger when you've hit an ebreak? (Just to repeat, my question
>> is about the purely software debugging case; no hardware debugging
>> extensions. In such a case, aiui, Xen gains control first and then
>> decides whether to trigger the debugger, or whether to handle the
>> exception internally. Sure, none of this infrastructure is in place
>> right now, but imo it wants taking into consideration.)
> Well, then something like KGDB is needed for Xen and mechanism to
> notify guests to something similar to:
> 
> Right now Xen detects that 'ebreak' is inserted by using the function
> do_bug_frame():
> ```
>     case CAUSE_BREAKPOINT:
>         if ( do_bug_frame(cpu_regs, pc) >= 0 )
>         {
>             if ( !(is_kernel_text(pc) || is_kernel_inittext(pc)) )
>             {
>                 printk("Something wrong with PC: %#lx\n", pc);
>                 die();
>             }
> 
>             cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
>         }
> ```
> 
> So if do_bug_frame() return < 0 then it should be ebreak inserted by
> the debugger so need to notify GDB that he should handle that.
> At the moment I think we can add():
> ```
>         if ( do_bug_frame(cpu_regs, pc) >= 0 )
>         {
> 		...
> 
>             cpu_regs->sepc += GET_INSN_LENGTH(*(uint16_t *)pc);
>         }
> 	else
> 	{
> 	    printk("this is not Xen's ebreak\n");
>             die();
>         }
> ```

Except that, as previously said, this will break if the debugger inserted
a breakpoint where Xen already has an ebreak. That's where we started from
in this discussion. Recall that my question was how the use of ebreak can
be correct / reliable here. It is for a reason that on x86 we do not use
the shorter INT3 instruction, but the longer UD2 one for BUG() etc.

Jan

