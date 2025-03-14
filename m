Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051BA60FB3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914406.1320171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt32s-0003wA-8V; Fri, 14 Mar 2025 11:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914406.1320171; Fri, 14 Mar 2025 11:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt32s-0003uB-5u; Fri, 14 Mar 2025 11:17:42 +0000
Received: by outflank-mailman (input) for mailman id 914406;
 Fri, 14 Mar 2025 11:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt32r-0003u5-KE
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:17:41 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1416b8d-00c5-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 12:17:40 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso18674965e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:17:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb9c0sm5323744f8f.97.2025.03.14.04.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:17:39 -0700 (PDT)
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
X-Inumbo-ID: f1416b8d-00c5-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741951060; x=1742555860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6u5MzcwOd2vfEY6AoYlbvzECFSZBWFWIhH/AyJtzIw0=;
        b=KmuQs5xKxQyOrs3IHzYLODpFFR/2Yf0kixgVBOx8E2LDFHBdt0aFp+VAwGQtftLBpr
         tapSZHooprpM3yBl3SaNvXhJsPaXUdq7gNSsJJHBzT9dE1853nQT0Hx3HErnaBfpej04
         4U8DQiLMWtL6SR3a09+tqOI6nMOTXn88ZpWfSc8VGJCoTtn89f2bpszGC7odaJsdiH0b
         QSiB/N0g/q1kijsT0RE/u5ePpnODc7b8EQ8r4GYM0Sx5lCdoduRH/ffUILbWLAaymzX1
         c15SOoGP0JJmW8fBzioTzf6gAFdzQ8+UZXjOEGKVKk1cx9P/uMRyjBpjZaHn8XiIHBo7
         HMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951060; x=1742555860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u5MzcwOd2vfEY6AoYlbvzECFSZBWFWIhH/AyJtzIw0=;
        b=Jc4ihx1JXVh1875LwyM6i+3Zk1ZSxuiv6Dk6aJtCA+kFAK9NuzMtAPm8NadC8w8kEA
         oORPUyKfKQpWOQJcmNcImUhOntzTP3GDJZ065Xrq3sJGoMdXf4/OBCvhjgndKCDmzJ4g
         7ISU00gVo4npLdT0wmEOyI6IimX3DeRmVBLaXOsZ3qpePQXJR6eRZZCL6No2cS36pDl3
         Byixg609DN41RXeg83qDYhAYtPVT39Vrf8U4cDDa2AN4Xvn2RKa/s/I8nZo1dax5+Iu5
         SXrEtxPr4xUxX8GPeMHUbE5LtlUGmeKeHBjbky/ZK8ReVO1g7TOjE9OAzPZxUl4ru3jq
         xKeA==
X-Forwarded-Encrypted: i=1; AJvYcCWtpEJZ1tTk+wB1/db8ntO8aXHPmJmBaj47+rAUJUGGgmQ2jsxQWbjbRQBi3Vo2TBakwvRz7hmZUno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO06gMChuoRR5AGvdwZcS61LM8lkpB3xX08aO+3tieaWoIJHKg
	Lbk5Qin5BwoJwvIaoDZtVJcAxOCG/YFvlqga9vQ3lFbw2Ut3VJ4qJltdZ6oPig==
X-Gm-Gg: ASbGncs6o0oSX1smWTgta3dkU5CZf8yyW9RGnQ70Y6DFNmBDFNFNWtDuwoiMXU584DW
	Aw8o67Av2c5FpjF2dqy87jsgxFAAH7xZWFCtuf11iZonYIMscJ3VNK2WgysEHgc4FVwAMpe4Wui
	81uWbMBPWLwgsxvTDkVx5w4fYXJ/WNljZKWvbrXNUTvN96uXqwCWTbHMFtG0VT84vWxQORos5AU
	4tyYm4xXxXaEt3irU9nbnAcMPu33WLRetS6r9V2YI7e58xNMezd6j49D9uVs35L0AJWzdkdQxxJ
	rcD3RF+VxZZj17o9FEFJPihGaN91PjHThcvSRMkYAo2PuL+AY2MiFluQ6h+dkp3M8zH8lIOih0K
	WWS/23f/civGWwLZZ3Gc7A3AKjohKXw==
X-Google-Smtp-Source: AGHT+IGOjh43o38WpEJ8FpyWhiqEdrzJPXTsABuCyJL2l6lRvXruQ2CAtzkNRvyHtNSa/nxi06jxKw==
X-Received: by 2002:a05:6000:1564:b0:391:487f:2828 with SMTP id ffacd0b85a97d-3971cd5741emr2734700f8f.10.1741951060113;
        Fri, 14 Mar 2025 04:17:40 -0700 (PDT)
Message-ID: <1f11b5f6-923b-4432-a763-45b4d025de60@suse.com>
Date: Fri, 14 Mar 2025 12:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-3-roger.pau@citrix.com>
 <8c58e1d6-b591-4211-9364-fa586a5c6d2e@suse.com>
 <Z9PpI8KQnA_gHy9e@macbook.local>
 <729fe31f-69d2-4b4f-8f2b-ac507a65fa27@suse.com>
 <dd147c79-055e-4a94-bb23-4c59821d520a@citrix.com>
 <3d905488-b3ec-452f-afca-9a7d85484fe9@suse.com>
 <Z9QBIEICQIQH2WD9@macbook.local>
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
In-Reply-To: <Z9QBIEICQIQH2WD9@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2025 11:12, Roger Pau Monné wrote:
> On Fri, Mar 14, 2025 at 10:13:07AM +0100, Jan Beulich wrote:
>> On 14.03.2025 10:05, Andrew Cooper wrote:
>>> On 14/03/2025 8:44 am, Jan Beulich wrote:
>>>> On 14.03.2025 09:30, Roger Pau Monné wrote:
>>>>> On Fri, Mar 14, 2025 at 09:24:09AM +0100, Jan Beulich wrote:
>>>>>> On 13.03.2025 16:30, Roger Pau Monne wrote:
>>>>>>> When enabling UBSAN with clang, the following error is triggered during the
>>>>>>> build:
>>>>>>>
>>>>>>> common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
>>>>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>>>>>       |         ^
>>>>>>> <inline asm>:1:121: note: instantiated into assembly here
>>>>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>>>>>       |                                                                                                                                ^
>>>>>>> common/wait.c:154:9: error: symbol '.L_skip' is already defined
>>>>>>>   154 |         "push %%rbx; push %%rbp; push %%r12;"
>>>>>>>       |         ^
>>>>>>> <inline asm>:1:159: note: instantiated into assembly here
>>>>>>>     1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
>>>>>>>       |                                                                                                                                                                      ^
>>>>>>> 2 errors generated.
>>>>>>>
>>>>>>> The inline assembly block in __prepare_to_wait() is duplicated, thus
>>>>>>> leading to multiple definitions of the otherwise unique labels inside the
>>>>>>> assembly block.  GCC extended-asm documentation notes the possibility of
>>>>>>> duplicating asm blocks:
>>>>>>>
>>>>>>>> Under certain circumstances, GCC may duplicate (or remove duplicates of)
>>>>>>>> your assembly code when optimizing. This can lead to unexpected duplicate
>>>>>>>> symbol errors during compilation if your asm code defines symbols or
>>>>>>>> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.
>>>>>>> Move the assembly blocks that deal with saving and restoring the current
>>>>>>> CPU context into it's own explicitly non-inline functions.  This prevents
>>>>>>> clang from duplicating the assembly blocks.  Just using noinline attribute
>>>>>>> seems to be enough to prevent assembly duplication, in the future noclone
>>>>>>> might also be required if asm block duplication issues arise again.
>>>>>> Wouldn't it be a far easier / less intrusive change to simply append %= to
>>>>>> the label names?
>>>>> That won't work AFAICT, as the inline asm in check_wakeup_from_wait()
>>>>> won't be able to make a jump to the .L_wq_resume label defined in the
>>>>> __prepare_to_wait() assembly block if the label is declared as
>>>>> .L_wq_resume%=.
>>>>>
>>>>> Also we want to make sure there's a single .L_wq_resume seeing how
>>>>> check_wakeup_from_wait() uses it as the restore entry point?
>>>> Hmm, yes on both points; the %= would only work for .Lskip. Have you gained
>>>> understanding why there is this duplication? The breaking out of the asm()
>>>> that you do isn't going to be reliable, as in principle the compiler is
>>>> still permitted to duplicate stuff. Afaict the only reliable way is to move
>>>> the code to a separate assembly file (with the asm() merely JMPing there,
>>>> providing a pseudo-return-address by some custom means). Or to a file-scope
>>>> asm(), as those can't be duplicated.
>>>
>>> See the simplified example in
>>> https://github.com/llvm/llvm-project/issues/92161
>>>
>>> When I debugged this a while back, The multiple uses of wqv->esp (one
>>> explicit after the asm, one as an asm parameter) gain pointer
>>> sanitisation, so the structure looks like:
>>>
>>>     ...
>>>     if ( bad pointer )
>>>         __ubsan_report();
>>>     asm volatile (...);
>>>     if ( bad pointer )
>>>         __ubsan_report();
>>>     ...
>>>
>>> which then got transformed to:
>>>
>>>     if ( bad pointer )
>>>     {
>>>         __ubsan_report();
>>>         asm volatile (...);
>>>         __ubsan_report();
>>>     }
>>>     else
>>>         asm volatile (...);
>>
>> But isn't it then going to be enough to latch &wqv->esp into a local variable,
>> and use that in the asm() and in the subsequent if()?
> 
> I have the following diff which seems to prevent the duplication,
> would you both be OK with this approach?

Yes (with a brief comment added as to the need for the local). And thanks.

Jan

> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -124,6 +124,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>      struct cpu_info *cpu_info = get_cpu_info();
>      struct vcpu *curr = current;
>      unsigned long dummy;
> +    void *esp = NULL;
>  
>      ASSERT(wqv->esp == NULL);
>  
> @@ -166,12 +167,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          ".L_skip:"
>          "pop %%r15; pop %%r14; pop %%r13;"
>          "pop %%r12; pop %%rbp; pop %%rbx"
> -        : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
> +        : "=&S" (esp), "=&c" (dummy), "=&D" (dummy)
>          : "0" (0), "1" (cpu_info), "2" (wqv->stack),
>            [sz] "i" (PAGE_SIZE)
>          : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
>  
> -    if ( unlikely(wqv->esp == NULL) )
> +    if ( unlikely(esp == NULL) )
>      {
>          gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
>          domain_crash(curr->domain);
> @@ -179,6 +180,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          for ( ; ; )
>              do_softirq();
>      }
> +    wqv->esp = esp;
>  }
>  
>  static void __finish_wait(struct waitqueue_vcpu *wqv)
> 


