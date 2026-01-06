Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68186CF7A31
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 10:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195968.1513841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3ms-0005mI-5g; Tue, 06 Jan 2026 09:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195968.1513841; Tue, 06 Jan 2026 09:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3ms-0005k5-2i; Tue, 06 Jan 2026 09:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1195968;
 Tue, 06 Jan 2026 09:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd3mq-0005jz-9S
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 09:55:36 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7c39dcc-eae5-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 10:55:33 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so4809945e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 01:55:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb5b246sm13959195e9.18.2026.01.06.01.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 01:55:32 -0800 (PST)
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
X-Inumbo-ID: d7c39dcc-eae5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767693333; x=1768298133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gpvm82FPEXt9e5XX+Tq+esnYxOTnUKZ6E3gFo+R7kjI=;
        b=b0VVdWyAsblawRvHakhdtREG0pae9JLz1R3izTqjjRcVynOjL11WZod7knAm+7Kj5k
         dKCWVuz7jWGovPW6i7h06a3egOb2n8KLatGaYM5LdXKrRXskjHfwp60+gaEoOqgTACju
         OEWV9A5lZQnGwwGWLSXVyrCNQUVqbChg6DcpGq2J3cih5qQIYXlNH1u3V3fJflBIt7ti
         ei1Niayy4QTFQRJi5nVivQpCvkZzTkMYgzl2RbnyJAQfTjWkvlULQ7bpC+WkzZpZjytV
         F06MgxvreEkdUQk451pd0BckuVl96gC0K6qWQclyDkcY0AHCABVYuewR0YfhtqYJCOxn
         rn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767693333; x=1768298133;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gpvm82FPEXt9e5XX+Tq+esnYxOTnUKZ6E3gFo+R7kjI=;
        b=jMTLBzOwJ7sGyO+jZuXvhC1s3ZYmoH9wyb5rHC6BESFWAw/Z5PSQPdY8GkERWv1i/A
         Ac8Y1LAy380frEWZznGByA6S4ijEQllsXy+FwgQqTn3HzYBguRxOfbHfjqwfq6NdAAWy
         EzPd+PBl00zz/C3a5yYuvQWxmo1ItW5Cpvcfn7N6r7gTtzB2Zv9XlxKAfXjnVSkQn19p
         K1AsLWj/EKym6XFTuFmeMeHhRTQDOA/wz9llS+pfvUKFeHp34ujLsSW4owpMzbo4WNRp
         l9H6GbDw2FD05Gb9R7dUdOooFoBEKXMvZ4hcxa2rja9qRhMmiJSUuFmnPwGdYUBKp0E3
         KR7A==
X-Forwarded-Encrypted: i=1; AJvYcCWBdAEfuAyQEYutKiuel3rVurxD85AfVDbkebdolcduF3C3lR8v/CD5SEuy7aZUVz6Wkrzp7iuoBMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw42xPh0xLAopJ8B9SSTbBohwKicqhFBIPxLIv+EpoNXALYUxpr
	YW4w8CbyuR8XhDj5DrZBhWrDqZYvi2PF/xCZwDsAQk0iLv44O9DsdFdoo8/OGN0bLw==
X-Gm-Gg: AY/fxX6IDiX3sh2O88CHKZA8WT4Ud2uKe0z+XCGKY2ec5vEd1DA572gg7RgAS75o3Ew
	NH51d0SybfcaOPc+MCGp3vZ+arD1pmDc/kUbbStN3G9sCYlmVTSeWxbJ8FwB2eIpoEx01nkB6/v
	N77cLV046NyEgDix6+e7V6LQ+aP0eH8cVosEdErlL5mBrbo9ZC6IOJUewnsHNYuEAi9WcgobtrQ
	9bghDn6tnuRDEZdDnV6+PNjLOfP913c4T4RfXOE2pUrEAn+h8ByhdQV0mWzzYPBJMMtELENf7yP
	Sa0p/x+JW/+3XY+FgPMLv8GixjqR0CVzmE8srywH8iXCWVAH2yejw9Lfy1ZL3cXXPXKst6rOjVu
	DpVLFnei1DSl8iDPD1oYATE73o6EK/zenv+MowHjfxhGjnJbVg6Rflz0NMa5NltRSie0W3Qpe6Z
	F4dsUGqNtBwzq7/v5SPI4tbMU1uaHR7jAPGOnD35HKU6m6obTaWQoWOb3fh9r+ozBnyN5qsUIHE
	Ds=
X-Google-Smtp-Source: AGHT+IHdV8x8zlhDAqO0qJm6N0sa0i81lW9i5VSx/iLSJI+kd+D91uHMyzTXoV+dvhBYNKX+5VTEwg==
X-Received: by 2002:a05:600c:3f14:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-47d7f09ffcbmr31724265e9.31.1767693333134;
        Tue, 06 Jan 2026 01:55:33 -0800 (PST)
Message-ID: <bc275f4f-4138-4120-9e85-3bf298efb276@suse.com>
Date: Tue, 6 Jan 2026 10:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] xen/riscv: add RISC-V virtual SBI base extension
 support for guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1767108625.git.oleksii.kurochko@gmail.com>
 <d49e5b9555d4f04d569e20d9c9feb23b298c7ee1.1767108625.git.oleksii.kurochko@gmail.com>
 <63a1aa58-f609-4bfe-b827-90c59e40a02d@suse.com>
 <6bbe1965-ff08-46dc-9e9c-215ca73f9f16@gmail.com>
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
In-Reply-To: <6bbe1965-ff08-46dc-9e9c-215ca73f9f16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 10:30, Oleksii Kurochko wrote:
> On 1/5/26 5:26 PM, Jan Beulich wrote:
>> On 30.12.2025 16:50, Oleksii Kurochko wrote:
>>> Add support of virtual SBI base extension calls for RISC-V guests, delegating
>>> hardware-specific queries to the underlying SBI and handling version and
>>> firmware ID queries directly.
>>>
>>> The changes include:
>>> 1. Define new SBI base extension function IDs (SBI_EXT_BASE_GET_MVENDORID,
>>>     SBI_EXT_BASE_GET_MARCHID, SBI_EXT_BASE_GET_MIMPID).
>>> 2. Introduce XEN_SBI_VER_MAJOR, XEN_SBI_VER_MINOR for imeplenataion of
>>>     SBI_EXT_BASE_GET_SPEC_VERSION.
>>> 4. Introduce SBI_XEN_IMPID to implement SBI_EXT_BASE_GET_IMP_ID.
>>> 5. Implement handling of SBI base extension functions, including version,
>>>     firmware ID, and machine-specific queries.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
>> Albeit with a question:
>>
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vsbi/base-extension.c
>>> @@ -0,0 +1,82 @@
>>> +
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/lib.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/version.h>
>>> +
>>> +#include <asm/processor.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/vsbi.h>
>>> +
>>> +/* Xen-controlled SBI version reported to guests */
>>> +#define XEN_SBI_VER_MAJOR 0
>>> +#define XEN_SBI_VER_MINOR 2
>> Is it clear from whatever spec it is that is ...
>>
>>> +static int vsbi_base_ecall_handler(unsigned long eid, unsigned long fid,
>>> +                                   struct cpu_user_regs *regs)
>>> +{
>>> +    int ret = 0;
>>> +    struct sbiret sbi_ret;
>>> +
>>> +    ASSERT(eid == SBI_EXT_BASE);
>>> +
>>> +    switch ( fid )
>>> +    {
>>> +    case SBI_EXT_BASE_GET_SPEC_VERSION:
>>> +        regs->a1 = MASK_INSR(XEN_SBI_VER_MAJOR, SBI_SPEC_VERSION_MAJOR_MASK) |
>>> +                   XEN_SBI_VER_MINOR;
>>> +        break;
>> ... implied here (it's ..._SPEC_VERSION after all) under what conditions the
>> version would need bumping and what effects this would have on existing (e.g.
>> migrating-in) guests? Recall that ...
> 
> For example, sooner or later we will want to use the SBI DBCN (Debug Console
> Extension) for early debug output for guests, as it provides an API to work with
> strings instead of single characters. This will require bumping the SBI version
> to 2.0.

I fear there's a misunderstanding here, likely on my side: Why would it be 2.0?
Didn't you say the version is Xen controlled? If so, why not 0.3 or 1.0?

Contrary to what you said previously, it now looks to me as if the version
wasn't "Xen-controlled", but instead what we pick reflects functionality
required by a particular spec version of a spec we do not control. That's
"SBI version implemented by Xen" to me though, not really a "Xen-controlled"
version.

Jan

> I don’t think this should cause any migration issues. If a guest was fully booted
> and running with Xen SBI version 0.2, it would continue to use the legacy extension
> for early console output (or for hvc console which is using SBI calls in Linux for
> the moment). If the guest was still in the initialization stage (before SBI
> extensions were probed), it would simply use the newer SBI DBCN extension instead
> of the Legacy one.
> 
> ~ Oleksii
> 
>>
>>> +    case SBI_EXT_BASE_GET_IMP_ID:
>>> +        regs->a1 = SBI_XEN_IMPID;
>>> +        break;
>>> +
>>> +    case SBI_EXT_BASE_GET_IMP_VERSION:
>>> +        regs->a1 = (xen_major_version() << 16) | xen_minor_version();
>>> +        break;
>>> +
>>> +    case SBI_EXT_BASE_GET_MVENDORID:
>>> +    case SBI_EXT_BASE_GET_MARCHID:
>>> +    case SBI_EXT_BASE_GET_MIMPID:
>>> +        if ( is_hardware_domain(current->domain) )
>>> +        {
>>> +            sbi_ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
>>> +            ret = sbi_ret.error;
>>> +            regs->a1 = sbi_ret.value;
>>> +        }
>>> +        else
>>> +            /*
>>> +             * vSBI should present a consistent, virtualized view to guests.
>>> +             * In particular, DomU-visible data must remain stable across
>>> +             * migration and must not expose hardware-specific details.
>> ... what is being said here applies to other sub-functions as well. IOW it
>> looks to me as if the version reported needs to be a per-guest property.
>>
>> Jan


