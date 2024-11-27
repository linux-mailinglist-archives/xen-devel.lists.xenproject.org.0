Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F72F9DA597
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:18:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844606.1260096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGF7M-00040j-6t; Wed, 27 Nov 2024 10:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844606.1260096; Wed, 27 Nov 2024 10:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGF7M-0003xa-3Z; Wed, 27 Nov 2024 10:17:56 +0000
Received: by outflank-mailman (input) for mailman id 844606;
 Wed, 27 Nov 2024 10:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGF7L-0003xU-6w
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:17:55 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc14a17c-aca8-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 11:17:52 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4349fd77b33so25854785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 02:17:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7cfb40sm16006435e9.27.2024.11.27.02.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 02:17:51 -0800 (PST)
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
X-Inumbo-ID: dc14a17c-aca8-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzQiLCJoZWxvIjoibWFpbC13bTEteDMzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRjMTRhMTdjLWFjYTgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzAyNjcyLjEwMjAwNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732702671; x=1733307471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7e7T4p59YwSRHDoVgOvnbiH4M0w1C6gfOek2eTGu2pw=;
        b=U+VLFFayalPTL0wX8bSD8W0z/lXkIILK3SEcZzdyYrtpaWGvVSsy4lsyGfqgHzQ13l
         lLlcOCCUznplVl5VTW83gxep/40ekY8x6l3QjmlGie2x6SEzY6ahLQOQILbPkXRCO1oq
         h4P5NHeFKcHBlajC8C2BgmOf8naDqkAnGiTe9eCnDWY0alYSGgP7FYtQxym65vcxCsWO
         7JuBeM60Phn1U+hwoNcsNByYx2BaDGmgFeA4aw1UK0vVVnrA5ebFeMREJ5d04aWO/MRo
         ZAMD/6ViD57YZFccznRalZ8IczxNCbrWK2xLRGEtUk79YqyuEUUJ2uK8Cd1xEfMdM4aq
         azzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702671; x=1733307471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e7T4p59YwSRHDoVgOvnbiH4M0w1C6gfOek2eTGu2pw=;
        b=aJc3W5uf97aRUHBJIDKcqFqXiDiWBgAobtMgm2LOn0E2Ke/VSaY9zUowmaM3FgmCWV
         /53rJH+67EuuNTC8okhen5VlBfBfF8M6/wCsTiIFsjKaT/Sx319OJlJK/8ABgfCKXVaR
         8zH2H9zE4QSrc28KhAgfKIW1l+PhVBdvKMdJRkz3vlY5q4w8X7HulHzaSju+w0TJFkDY
         0vMYKbnB8J7+ik86KwKCUb6DciF+bVj5BITFTe2vwURiJJ2XNxem8bPE/xC6axpLJ3/D
         iVczdjBQfybhmsRtHc031FseIOCjQTWBXL2fyTcnoD34cfha2rLKN7JUYRlKHySSmZGw
         ZsaA==
X-Forwarded-Encrypted: i=1; AJvYcCWmSUd3CsznkmMItHAx2iGjcDa+MrGKd53vW6zXzwJ2geaca4xzy9KcL/fEW78YO83LMLGF+a8+jc0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSP0UMpcV8sTbd5bQqA/sbVtLXaTUPsrBNake1Y4h+R8gYhupd
	WCYhaIrZkGXdF3O5Is90RgtrtOfs3lYxUq0PIaHuUHrjUvI99TcLrQ4xhi3Efw==
X-Gm-Gg: ASbGncsYGuI4yAnXrXOJASibU50bK7ijKTsajpA3S42YAocOYQXnbtNj8XDxcjZQEs3
	ZK7j2l+DEXymfktK6bUw2lgS2vmDJEFhkK7jNjR5wfSZncJPoJtU8sxg3EQAtB7WwuOpm6FNp4l
	E85ZrSd6rkTzGsENc1J8xj7NIw/OHdNX/rGzlfgmN0MiBapMEzm846HFI21aufRQYVyHcA/Pcju
	1GrWwFEemF6ykyK32+NvuhSzT24Qfk4ZIeK/fTXFpF8u1cBgJSKv8iu2qyciMr2+YKgiNOm8z2A
	3qlBghM9Nxj1MuJ1TFSD8cnsdEMKEQ1IVjg=
X-Google-Smtp-Source: AGHT+IF4Cu0XteCz7KZPtdtOGIGoQ/CP2WwJv+0AKhd2iEQBs5irmnKuowRqf4YlPJN313cnFOdinw==
X-Received: by 2002:a05:600c:4f08:b0:434:a39b:5e46 with SMTP id 5b1f17b1804b1-434a9dbbba1mr20170265e9.7.1732702671302;
        Wed, 27 Nov 2024 02:17:51 -0800 (PST)
Message-ID: <8004e261-0ce5-427e-abdb-0cd18121dc6e@suse.com>
Date: Wed, 27 Nov 2024 11:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] x86: control memset() and memcpy() inlining
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <1c935aba-a185-43de-9806-6781b1a7fcf9@suse.com>
 <3fa4555a-f66f-47c0-ada2-3a5591536432@citrix.com>
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
In-Reply-To: <3fa4555a-f66f-47c0-ada2-3a5591536432@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2024 20:58, Andrew Cooper wrote:
> On 25/11/2024 2:29 pm, Jan Beulich wrote:
>> Stop the compiler from inlining non-trivial memset() and memcpy() (for
>> memset() see e.g. map_vcpu_info() or kimage_load_segments() for
>> examples). This way we even keep the compiler from using REP STOSQ /
>> REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
>> available).
>>
>> With gcc10 this yields a modest .text size reduction (release build) of
>> around 2k.

With this, ...

>> Unfortunately these options aren't understood by the clang versions I
>> have readily available for testing with; I'm unaware of equivalents.
>>
>> Note also that using cc-option-add is not an option here, or at least I
>> couldn't make things work with it (in case the option was not supported
>> by the compiler): The embedded comma in the option looks to be getting
>> in the way.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3: Re-base.
>> v2: New.
>> ---
>> The boundary values are of course up for discussion - I wasn't really
>> certain whether to use 16 or 32; I'd be less certain about using yet
>> larger values.
>>
>> Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
>> for known size, properly aligned blocks is up for discussion.
> 
> I didn't realise there were any options like this.
> 
> The result is very different on GCC-12, with the following extremes:
> 
> add/remove: 0/0 grow/shrink: 83/71 up/down: 8764/-3913 (4851)
> Function                                     old     new   delta
> x86_emulate                               136966  139990   +3024
> ptwr_emulated_cmpxchg                        555    1058    +503
> hvm_emulate_cmpxchg                         1178    1648    +470
> hvmemul_do_io                               1605    2059    +454
> hvmemul_linear_mmio_access                  1060    1324    +264
> hvmemul_write_cache                          655     890    +235
> ...
> do_console_io                               1293    1170    -123
> arch_get_info_guest                         2200    2072    -128
> avtab_read_item                              821     692    -129
> acpi_tb_create_local_fadt                    866     714    -152
> xz_dec_lzma2_run                            2573    2272    -301
> __hvm_copy                                  1085     737    -348
> Total: Before=3902769, After=3907620, chg +0.12%
> 
> So there is a mix, but it's in a distinctly upward direction.

... was this a release or a debug build? Of course I'm not surprised of
there being differences between compiler versions, but the overall change
being clearly in the opposite direction is still a little worrying.

> As a possibly-related tangent, something I did notice when playing with
> -fanalyzer was that even attr(alloc_size/align) helped the code
> generation for an inlined memcpy().
> 
> e.g. with _xmalloc() only getting
> __attribute__((alloc_size(1),alloc_align(2))), functions like
> init_domain_cpu_policy() go from:
> 
> 48 8b 13                 mov    (%rbx),%rdx
> 48 8d 78 08              lea    0x8(%rax),%rdi
> 48 89 c1                 mov    %rax,%rcx
> 48 89 de                 mov    %rbx,%rsi
> 48 83 e7 f8              and    $0xfffffffffffffff8,%rdi
> 48 89 10                 mov    %rdx,(%rax)
> 48 29 f9                 sub    %rdi,%rcx
> 48 8b 93 b0 07 00 00     mov    0x7b0(%rbx),%rdx
> 48 29 ce                 sub    %rcx,%rsi
> 81 c1 b8 07 00 00        add    $0x7b8,%ecx
> 48 89 90 b0 07 00 00     mov    %rdx,0x7b0(%rax)
> c1 e9 03                 shr    $0x3,%ecx
> f3 48 a5                 rep movsq %ds:(%rsi),%es:(%rdi)
> 
> down to simply
> 
> 48 89 c7                 mov    %rax,%rdi
> b9 f7 00 00 00           mov    $0xf7,%ecx
> 48 89 ee                 mov    %rbp,%rsi
> f3 48 a5                 rep movsq %ds:(%rsi),%es:(%rdi)
> 
> which is removing the logic to cope with a misaligned destination pointer.
> 
> 
> As a possibly unrelated tangent, even __attribute__((malloc)) seems to
> have some code gen changes.
> 
> In xenctl_bitmap_to_cpumask(), the change is simply to not align the
> -ENOMEM basic block, saving 8 bytes.  This is quite reasonable because
> xmalloc() genuinely failing is 0% of the time to many significant figures.
> 
> Mostly though, it's just basic block churn, which seems to be giving a
> "likely not NULL" on the return value, therefore shuffling the error paths.

Could you clarify for me what of the above is the actionable part, for me
to take care of?

Jan

