Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6642B22082
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078395.1439379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkBf-0003Lw-2w; Tue, 12 Aug 2025 08:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078395.1439379; Tue, 12 Aug 2025 08:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkBe-0003KS-VE; Tue, 12 Aug 2025 08:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1078395;
 Tue, 12 Aug 2025 08:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulkBc-0003KM-Vv
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:16:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0dd72b0-7754-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 10:16:47 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61813e2fc73so4379082a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:16:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f26cc6sm20013871a12.23.2025.08.12.01.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:16:46 -0700 (PDT)
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
X-Inumbo-ID: b0dd72b0-7754-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754986607; x=1755591407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a9Sdpei199qArdIZIPSdSS9mEvz4I5hLa6skdBubxAg=;
        b=JOyTIzNVfY9y/4ahPEYGJjIOgOPviB//ULCaUCuFFLqN/PnCAIT5G1bnFJmDJSKAIz
         DTrUePfSdXEQVTOSEgXaEAkGmJdY8oLeF+hpUQheORzUqfIZ8Czkx2grxdj7PzgO5Q7n
         UAzmB+3k0fbSbrWwUm3uoW8rqeoOqV4buOcbGg8ao5lzsJ5thyfoDGCvlFZeXqgkYAZ9
         GWJRZpuLav2VXQ0dG7xnf9k9LvmuIHo7jOeuh5r4/FDjtUWBE/fibSldKDSKv109qZ7A
         MejJ0CpuM0/Lx/dIrb1/GhC3ORYfEMstnFoVTN4NniPBEYKxvvK+jm5ORztaSeSoWftL
         tMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986607; x=1755591407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9Sdpei199qArdIZIPSdSS9mEvz4I5hLa6skdBubxAg=;
        b=cxGXjC5giBd5dtQBJZBKWDV+dRekWot6NdnpmryhESPvV5WQ57+DcLocOfczvSCB35
         VuLdJqgV/tIAQWdltg/5pYaL9ynfkKD8LnESZPW8FxHmeAWd+G1xVbd2/sW9ejUCJYGQ
         kbriK1dkgCPX+2ZcKkiwWxIsIhK/WpO7l8nzuWfZxN+OsofLpFWExZZrn+lsVQnl9x/8
         YUIC8L+KzT6DrZzcPxWtIWWw0yQl4/z6N2kl8qkLKnWmXLZWV1J81CM/u5MJK4+JkSMV
         3BIGLxPy++Nv/QyXWuVVS1W6mbY/KF7Yg0gzBz2oTUgaBhhz89Kpecb3mFkuXiSLeZMz
         8VZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYjiCmAikKeFBSjaaE/1k1ptod1AN2cndaRFOTRYobK07eySNwTBGRMZ+48LDDPwRyQPnqezed2b0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLGg4GiIK/AAEIqqzyv1XNUMPENbNCEIpQZVUUojXKRgoC8AOM
	UOwCSw1bFm9/r+mjGpwr/CfBEsw9WE+Mj932qs3AeGadLR5R+53fLKowvEDna7FUV50gBpKOCPu
	vcQA=
X-Gm-Gg: ASbGncu4VEp2l0bNgaGbI4WWCyHJz8m2vbM7pwzo3+KrWuGdGxRRZKJCo1IWmYLWCEh
	Sz9IWzMStc28X1gdNGuGv7/bWOR+tWKm81AG/ZaSWATusDROQFKF0kSqDO5E0qUzzpEWG00hnSE
	CPXnZnZ+GZYhDjLamKJ4l2wq6eYinBcvfTqAclaeJAIO9ujR9L1uAY4isWzrBe+UoqM1aZDcOj6
	wF4xTmVepko6pPbEsFsj1Toz87MBS5R8NH5wkzu0eRu4+1YbnsCvJTAtXWcFGrmYNpcy6EUtjgj
	V2ceBXKJAJky4AW7IXT3JiLb+91b+H+iIcu6ZfWAmrKGaA9BuN/FZCWePwKbluYJo5TxNK0LW6y
	qpcp6LjsghfMuWDRP+25lNMWG0j9NhI3BwuYZiEXq/jhJiluT+z5zSh9b94xJ1yI5qO8E5io4NC
	W4y4kIjY1GKEB0IiHrxA==
X-Google-Smtp-Source: AGHT+IG8KJ+Rmz3fqwMYL5Kdlo93hEK8mGTetYV8t21e0qMBJkHZ1KOp2n1gUrTc49wJNfcX7IzVCQ==
X-Received: by 2002:a05:6402:4313:b0:617:cd9d:e26a with SMTP id 4fb4d7f45d1cf-6184ea1171emr1679528a12.6.1754986607118;
        Tue, 12 Aug 2025 01:16:47 -0700 (PDT)
Message-ID: <44c9a7ba-8e01-41cc-8c93-32b022885439@suse.com>
Date: Tue, 12 Aug 2025 10:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] x86/idt: Minor improvements to
 _update_gate_addr_lower()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:22, Andrew Cooper wrote:
> After some experimentation, using .a/.b makes far better logic than using the
> named fields, as both Clang and GCC spill idte to the stack when named fields
> are used.
> 
> GCC seems to do something very daft for the addr1 field.  It takes addr,
> shifts it by 32, then ANDs with 0xffff0000000000000UL, which requires
> manifesting a MOVABS.
> 
> Clang follows the C, whereby it ANDs with $imm32, then shifts, avoiding the
> MOVABS entirely.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I have to admit that I'm not quite happy about ...

> --- a/xen/arch/x86/include/asm/idt.h
> +++ b/xen/arch/x86/include/asm/idt.h
> @@ -92,15 +92,16 @@ static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
>   * Update the lower half handler of an IDT entry, without changing any other
>   * configuration.
>   */
> -static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *_addr)
>  {
> +    unsigned long addr = (unsigned long)_addr;
> +    unsigned int addr1 = addr & 0xffff0000U; /* GCC force better codegen. */
>      idt_entry_t idte;
> -    idte.a = gate->a;
>  
> -    idte.b = ((unsigned long)(addr) >> 32);
> -    idte.a &= 0x0000FFFFFFFF0000ULL;
> -    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
> -        ((unsigned long)(addr) & 0xFFFFUL);
> +    idte.b = addr >> 32;
> +    idte.a = gate->a & 0x0000ffffffff0000UL;
> +    idte.a |= (unsigned long)addr1 << 32;

... the cast here. Yet perhaps gcc still generates a MOVABS when you make
addr1 unsigned long?

As to the comment next to the variable declaration: Could I talk you into
adding a colon after "GCC"? Without one, the comment reads somewhat
ambiguously to me.

Jan

