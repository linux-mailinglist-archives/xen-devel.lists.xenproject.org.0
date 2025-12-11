Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CBCB597D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 12:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183881.1506460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTeR9-00007H-Mu; Thu, 11 Dec 2025 11:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183881.1506460; Thu, 11 Dec 2025 11:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTeR9-00005O-KM; Thu, 11 Dec 2025 11:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1183881;
 Thu, 11 Dec 2025 11:02:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTeR8-00005I-Dx
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 11:02:18 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa0a1da-d680-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 12:02:16 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so6552035e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 03:02:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d0e34fsm11675465e9.0.2025.12.11.03.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 03:02:15 -0800 (PST)
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
X-Inumbo-ID: daa0a1da-d680-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765450935; x=1766055735; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IZWMqVWenxDjosYfCNhiES1QudgsN2fStVx6QKswj+s=;
        b=aZPbIXFMO+AjbGJJcD04Q4TY8IZXB94CKRkU9BFsk9PtAzca5upiZUPlGnUeIK4FWh
         gZswoPgLtRfzeR46eJ/zQ9IlEbA7cWoYJogrjLPql6HceggfHB/GNjazwHon8fGxRdUB
         OV/QTIlGv1TxSH1S7CV4xHzSNOfs5vEXSWNhyXZdvK3/jKg+3ANlXET3bkQmVY8VrV6o
         htC1vNYcZU0IeTO22Sdv0eGvdFd50xJ925FnnAG1RzskPgObqkx50pmV0XPj58Mp9Bal
         BRz4mMx97mAJ6GcLMVaM//vLg0NcKiUzbMepTYHCnVbuDlllqHXjyQgnoC3fapTZL/b4
         9cRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765450935; x=1766055735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZWMqVWenxDjosYfCNhiES1QudgsN2fStVx6QKswj+s=;
        b=hPTWMZ11fCLB+/4/VpMQNlNma0C56Ce3FzvHUYq5HXfa1aBR/3Ht9Y6/5Bwien8yj6
         2twBdMv+qzXBKYlGNJIS2H0ux6bW0kzFjrY+HjqQzSHKTlseKNKmrebovl69RqhotCXU
         njKrfie8Ha5FCv7fxTy63zG7EB9RWZUM/qfk6WyUG97InRwJ+P0GmxC+zddpeX/XVFVS
         zseuRn24bUB7abSIjE4IwMQxdJQbBkvtnS0g/Wt7d7fUbMFGorx1H3+y79sJ+szXVJCC
         NGW8QMm9FM+pN9EiYNBQ35abYbqZZ4Obox4pSFaYntLyBX6LVBGSJBSoDSJJEARXLnL7
         Yt4w==
X-Forwarded-Encrypted: i=1; AJvYcCUYwuq3Pf9ZXOJMhKCaXRESdXEFv2VVMOoiVUPRVq0HUJXuySToO/1iOTInXjLu8Nn3A6GZtApr69c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZy4BpeJiig3u2Nazw9UWWPJSO8U6EO3Jw+Cu06jeTObITtANP
	QsBY0pQ8jdSIaw0Ae47k/cGBv5Dnmm9xR8CV+i1mD9VWGMRZHTcRmXnNhBKia96SZg==
X-Gm-Gg: AY/fxX7dGANWIdJnhu9XcyT+iknyonLl3OwskV9sN5k9JjfTapub1+zzBIMkEA3PZpH
	yAMPEtesIeupqj6EnY2gK9jozGqJlba51blOGsadg08biaSvhVz9Ua0FyHyQI7EBpWss/N7sH2V
	9UGZhuFKZgANeJYHym0a4hhrYxxhFBX1/X1Xl0qJQhc7qTRhieWjIwSn+y5F6iV/iuEU0q/69mc
	Rbl5At1QH7PJjaAWVJdZ5yJVRTrUJ1OIy3PcXzZNakz2W2dAOaVFx/NBFVVmKm7mG/q4o2Ajem7
	BMrT5SMdbGR8gzr33H2of6KBWo5m/8M4YKWnypqJf3v7U0I6RWkqySbfh1ORPHciH8x64+8x/dh
	IfvZ/oIReoFzN0qIu61oqrrmXJc/KN4Dlqo3Oio1aEf1g9nOz0KCxeV4yIi4ahTeSxGQpYlc79N
	GvwUAumZnvSePFx0LLzuPkl6F/ypwr2KBY0FLuGuJBE//ksXpBczIdiDfLdEFQVV8ohtYNt1Tb3
	04=
X-Google-Smtp-Source: AGHT+IFpHD5cdhCp8Z81Rz2Yd7LTHOUGi9B9EUgPqfN4ck7wysCwHzahm6gMJAQG+basb8hgxEigFQ==
X-Received: by 2002:a05:600c:45c4:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-47a837eec21mr56833495e9.35.1765450935467;
        Thu, 11 Dec 2025 03:02:15 -0800 (PST)
Message-ID: <2c84660b-4333-42f9-b178-aab72be9a40d@suse.com>
Date: Thu, 11 Dec 2025 12:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: add RISC-V legacy SBI extension support
 for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <f4e4dc9beef4618ffaabe1c6caec3e10cf78fd5d.1764582112.git.oleksii.kurochko@gmail.com>
 <c3d2a4c4-f591-4bff-b978-18b8c09cf512@suse.com>
 <c1ca8efb-3e17-45e2-ba90-a6f49616bb51@gmail.com>
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
In-Reply-To: <c1ca8efb-3e17-45e2-ba90-a6f49616bb51@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 11:29, Oleksii Kurochko wrote:
> On 12/8/25 4:05 PM, Jan Beulich wrote:
>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vsbi/vsbi-legacy-extension.c
>>> @@ -0,0 +1,37 @@
>>> +
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/processor.h>
>>> +#include <asm/vsbi.h>
>>> +
>>> +static int vsbi_legacy_ecall_handler(struct vcpu *vcpu, unsigned long eid,
>>> +                                     unsigned long fid,
>>> +                                     struct cpu_user_regs *regs)
>>> +{
>>> +    int ret = 0;
>>> +
>>> +    switch ( eid )
>>> +    {
>>> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
>>> +        printk("%c", (char)regs->a0);
>> This is guest output, so shouldn't use plain printk().
> 
> I think that I don't know what should be used instead. Could you suggest me something
> or point to the code in other arch-s?
> 
> Or do you mean that guest_printk() should be used?

No direct replacement will do what you want, as they all prefix something to the
string passed (which isn't what you want). You may need to buffer characters and
emit them in batches (full lines unless overly long). For x86 see hvm_print_line(),
but I think Arm also has something like this.

>>> +    default:
>>> +        panic("%s: Unsupported ecall: FID: #%lx, EID: #%lx\n",
>>> +              __func__, fid, eid);
>> Please don't. domain_crash() may be okay to use here, but crashing the hypervisor
>> because of unexpected guest input isn't okay.
> 
> |domain_crash()| is better. I also considered just returning|SBI_ERR_NOT_SUPPORTED|,
> but it wasn’t too convenient for debugging which FID/EID the guest was called,
> so I started using|panic()| instead.

FTAOD - domain_crash() is acceptable here while things are still under development.
It shouldn't stay like this in the end though: Guests should not be punished like
this for something Xen hasn't implemented.

Jan

