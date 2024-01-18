Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0708F831825
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 12:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668721.1041116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQHM-0002Az-JM; Thu, 18 Jan 2024 11:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668721.1041116; Thu, 18 Jan 2024 11:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQQHM-00028y-Gd; Thu, 18 Jan 2024 11:09:48 +0000
Received: by outflank-mailman (input) for mailman id 668721;
 Thu, 18 Jan 2024 11:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQQHK-00028s-Uf
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 11:09:46 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 165aa1f2-b5f2-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 12:09:45 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-337c4f0f9daso1219178f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 03:09:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfe601000000b00337bf461385sm3779221wrm.26.2024.01.18.03.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 03:09:45 -0800 (PST)
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
X-Inumbo-ID: 165aa1f2-b5f2-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705576185; x=1706180985; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t24q2dGv8D4mt+0CWbsTggaWqxqHdc3rGp3CpBewU0Q=;
        b=BLz22xV1mITGJzPsRW86cCzwU0rIJucYc0vmbu44TPVvtjWSCdXhqQNLqrR3uOLgs6
         cnaa3kTy1K6XwFKCS83iqsPue7Jocr1GEJKmPyLm0tTg/kb5neIbTPNWVZ8nMNOGUqMM
         tL3x1DN2wqApOPLMniwQHQgTbi4wm8EX1kN6kb1Y83PTneYf7X5JXhey8GtuQJ8S9040
         Fsm5ZGbyaM6Ndmm4NcbC6Do7yxEmO1c1o6//JlOCZZym6AZcJmQqML6KwnOYCSn6YGve
         txIKBS9bBUz5cJMLYWU354R/oTUDud/PjYAKfEKRLIESrDp1HeotSYzbtL1Mb+3Gehez
         XQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705576185; x=1706180985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t24q2dGv8D4mt+0CWbsTggaWqxqHdc3rGp3CpBewU0Q=;
        b=HGJZxc7M3JLRT2ZcuBPQ/rz8RvGHnf0OWd9ZaWSHYwz7DLSsaVKdDlgQWy97mLIzAb
         qIP58/tgHr/8qa/wMHApBfbUZXFZrAgHChS74jlI4g7w4HyqoQyupTTXUmFfhLoYDwQB
         bLXgF7Qfl/CUL0KXReAA+BWa2FyxjgcMBwyydPTurFFnwR5hIWUuoNkXUppY4SPSn5O+
         fEuOtB961ZTflci4/WfzrqHiqIS+i6huVFzIANcfxpqKVy5+/hOMTvk/K7jz8SJKS6Xa
         ns9g7cwFhJNWKPakKv5KFTybKZe+ODzN51Otqqz32xGTzi9xMCE65R0Jwd4l2SFOZ/aI
         cv3A==
X-Gm-Message-State: AOJu0YxMTCOFIZ3+r5NhZjhfGCSisvrIQtsooOnkYGwVo5nt5WUXLcNo
	ZdwpAXPU5iw03jkN9lZrlyiPD8/BWrSEx4cVmUbChctFselLVtbTM70+kMatykt18tOFEDJwMKo
	=
X-Google-Smtp-Source: AGHT+IEH27CKN613KjSl8Jj3UeqWVxCKNep/FZRab8RyL/q2OkyqPWsW8HyU/FwARD96M9eKHw336A==
X-Received: by 2002:adf:edca:0:b0:337:c61c:71b8 with SMTP id v10-20020adfedca000000b00337c61c71b8mr398865wro.7.1705576185281;
        Thu, 18 Jan 2024 03:09:45 -0800 (PST)
Message-ID: <b62bd658-6c84-40af-9518-57d88857479b@suse.com>
Date: Thu, 18 Jan 2024 12:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/PV: avoid indirect call for I/O emulation quirk
 hook
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <28b46611-ff98-45cd-a2b0-ffe36b8f0ccf@suse.com>
 <9ea43cac-e1f2-4585-b1e0-a64ac6952df9@citrix.com>
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
In-Reply-To: <9ea43cac-e1f2-4585-b1e0-a64ac6952df9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.01.2024 12:04, Andrew Cooper wrote:
> On 17/01/2024 9:37 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/ioport_emulate.c
>> +++ b/xen/arch/x86/ioport_emulate.c
>> @@ -8,11 +8,10 @@
>>  #include <xen/sched.h>
>>  #include <xen/dmi.h>
>>  
>> -unsigned int (*__read_mostly ioemul_handle_quirk)(
>> -    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
>> +bool __ro_after_init ioemul_handle_quirk;
>>  
>> -static unsigned int cf_check ioemul_handle_proliant_quirk(
>> -    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
>> +unsigned int ioemul_handle_proliant_quirk(
>> +    uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
>>  {
>>      static const char stub[] = {
>>          0x9c,       /*    pushf           */
> 
> Something occurred to me.
> 
> diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
> index 23cba842b22e..70f94febe255 100644
> --- a/xen/arch/x86/ioport_emulate.c
> +++ b/xen/arch/x86/ioport_emulate.c
> @@ -13,7 +13,7 @@ bool __ro_after_init ioemul_handle_quirk;
>  unsigned int ioemul_handle_proliant_quirk(
>      uint8_t opcode, char *io_emul_stub, const struct cpu_user_regs *regs)
>  {
> -    static const char stub[] = {
> +    const char stub[] = {
>          0x9c,       /*    pushf           */
>          0xfa,       /*    cli             */
>          0xee,       /*    out %al, %dx    */
> 
> is an improvement, confirmed by bloat-o-meter:
> 
> add/remove: 0/1 grow/shrink: 1/0 up/down: 1/-9 (-8)
> Function                                     old     new   delta
> ioemul_handle_proliant_quirk                  58      59      +1
> stub                                           9       -      -9
> 
> The reason is that we've got a 9 byte object that's decomposed into two
> rip-relative accesses.  i.e. we've got more pointer than data in this case.

I wouldn't mind this as a separate change, but I don't see how it would
fit right here.

> But this adjustment seems to tickle a GCC bug.  With that change in
> place, GCC emits:
> 
> <ioemul_handle_proliant_quirk>:
>        48 83 ec 10             sub    $0x10,%rsp
>        ...
>        48 83 c4 10             add    $0x10,%rsp
>        c3                      retq
> 
> i.e. we get a stack frame (space at least, no initialisation) despite
> the object having been converted entirely to instruction immediates.
> 
> Or in other words, there's a further 12 byte saving available when GCC
> can be persuaded to not even emit the stack frame.
> 
> What is even more weird is that I see this GCC-10, and a build of gcc
> master from last week, but not when I try to reproduce in
> https://godbolt.org/z/PnachbznW so there's probably some other setting
> used by Xen which tickles this bug.

Yeah, I've observed such pointless frame allocation elsewhere as well,
so far without being able what exactly triggers it.

Jan

