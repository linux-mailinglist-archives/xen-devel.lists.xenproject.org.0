Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE995874FE9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689909.1075375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDjl-0006bv-NJ; Thu, 07 Mar 2024 13:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689909.1075375; Thu, 07 Mar 2024 13:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riDjl-0006aR-Kj; Thu, 07 Mar 2024 13:24:41 +0000
Received: by outflank-mailman (input) for mailman id 689909;
 Thu, 07 Mar 2024 13:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riDjk-0006aL-91
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:24:40 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c921d39-dc86-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 14:24:39 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d28051376eso12498341fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 05:24:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y6-20020a056402358600b005645961ad39sm7947077edc.47.2024.03.07.05.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 05:24:38 -0800 (PST)
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
X-Inumbo-ID: 0c921d39-dc86-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709817878; x=1710422678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enFu7DIqss8P1zQJNCZ0yqSNnMex2W4vkY8dXDd8McQ=;
        b=RCLgShVGWC+UzNtRrgFQ2ZHerwfGLQ9H9042mKulXt9daAykBPRbgQIAy6NA+Ilt8p
         7Z4mvNRet6ayWp/ZB3on1itGIy3sNePyrwdKT1XoNwT/0ypYmda53IK/JMvpg1t1wiV+
         7q1si75zvBlComMV+PgkNEZaWwth0IkVVo9lj7OijdiG6xDl3+bksM9ePu1AS3sk5/5Z
         f4ZtacMMWnjBA1AHSClk588pOIzMaUQM6j6iPcvWCIljxyR2rvMBpPLJtTEe2xSLyUMV
         XqtoyI01UuqdVPLRtaYSG/VJOi67jCAVJgEigBgCn5eudRTRtlaJyJ4nJqTlxi7kqeOf
         nNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709817878; x=1710422678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enFu7DIqss8P1zQJNCZ0yqSNnMex2W4vkY8dXDd8McQ=;
        b=RDApmRaKIj75PwTxixlJ9dE4Yhe+iJLegHi3pH5o87X6GF+O1ZHEeiQRazfExaJk9U
         eg2+5I4+OYK+U9XuiMhPhphiDqWzs5J5DjvegbTPCcxDMtW5X/iIeC0g0IMF0f4w+Jqy
         wDPNQhOax/3Gy6HM5bTltmUHOLZfkpq3d4qm1Th1gje5gnhdsQ0kq/uGVCDcln0wJb3r
         ic4WIctyzl0K6HPIiFEXjO/YD0Q7zQNpVSdjCh5mXzCLnE5NuBzXwWknzALj7OqhEZXn
         PSsZ7Rq+8P5bZ4xqXhk02Pn4oVXtysH4sznxwwRyHBpzEFMGWVbKHmV/mt91OcRRhZDI
         I6qA==
X-Forwarded-Encrypted: i=1; AJvYcCXufP74WVF4DrwmDIdZ6Y5pYZJpAHQqUK9li9aHOs+TLI7n0DY2PxJ83FF4niMh8p+0SJtvHq2petulTv0kpTiYrkvkCfpaeqCDx7rSTQ8=
X-Gm-Message-State: AOJu0YyriTCobQ3f/NNPZj+VR1uS4IC8AvkbUj6QQY1vOwIzwlOvKI9b
	rjUVKcFBnWhncTDtWz8iOW+AvYo1ThFK3KnLa81oRIeQieIKGMnIHK64EzvTIw==
X-Google-Smtp-Source: AGHT+IGhWfMvNwIpz3mwR9dY8f2oBNG/WCaTnCX5r1o1egGqC4ZUJNkPcrMpGh19IBEoDKmuP6Ns6A==
X-Received: by 2002:a2e:a7c5:0:b0:2d4:874:24df with SMTP id x5-20020a2ea7c5000000b002d4087424dfmr1499833ljp.49.1709817878493;
        Thu, 07 Mar 2024 05:24:38 -0800 (PST)
Message-ID: <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
Date: Thu, 7 Mar 2024 14:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
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
In-Reply-To: <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 14:01, Oleksii wrote:
> On Wed, 2024-03-06 at 15:13 +0100, Jan Beulich wrote:
>>> +/* Generic IO read/write.  These perform native-endian accesses.
>>> */
>>> +static inline void __raw_writeb(uint8_t val, volatile void __iomem
>>> *addr)
>>> +{
>>> +    asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r" (addr) );
>>> +}
>>
>> I realize this is like Linux has it, but how is the compiler to know
>> that
>> *addr is being access here? 
> Assembler syntax told compiler that. 0(%1) - means that the memory
> location pointed to by the address in register %1.

No, the compiler doesn't decompose the string to figure how operands
are used. That's what the constraints are for. The only two things the
compiler does with the string is replace % operators and count line
separators.

>> If the omission of respective constraints here
>> and below is intentional, I think a comment (covering all instances)
>> is
>> needed. Note that while supposedly cloned from Arm code, Arm variants
>> do
>> have such constraints in Linux.
>>
> It uses this constains only in arm32:
> #define __raw_writeb __raw_writeb
> static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
> {
> 	asm volatile("strb %1, %0"
> 		     : : "Qo" (*(volatile u8 __force *)addr), "r"
> (val));
> }
> 
> But in case of arm64:
> 
> #define __raw_writeb __raw_writeb
> static __always_inline void __raw_writeb(u8 val, volatile void __iomem
> *addr)
> {
> 	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
> }
> 
> And again looking at the defintion they use different option of strb
> instruction, and in case of strb they use [%1] which tells compiler
> that %1 is addressed which should be dereferenced.

Same bug here then; I happened to look at Arm32 only. As mentioned in
the other patch using what's provided here, the problem becomes more
than latent only there. And I can't spot such use in Arm64 code, so it
is likely only a latent bug there.

Jan

