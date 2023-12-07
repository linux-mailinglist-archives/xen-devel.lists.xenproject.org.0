Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B608084EA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:45:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649682.1014507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAwh-0008Sj-0Y; Thu, 07 Dec 2023 09:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649682.1014507; Thu, 07 Dec 2023 09:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBAwg-0008Q5-Tt; Thu, 07 Dec 2023 09:45:26 +0000
Received: by outflank-mailman (input) for mailman id 649682;
 Thu, 07 Dec 2023 09:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBAwe-0008Px-OJ
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:45:24 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57702135-94e5-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 10:45:23 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c0a074e71so7699305e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 01:45:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b0040596352951sm1411995wmb.5.2023.12.07.01.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 01:45:23 -0800 (PST)
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
X-Inumbo-ID: 57702135-94e5-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701942323; x=1702547123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyKSCf2aLl680/7Wqis3i4rZw9x7ArfIUp262TxDEUk=;
        b=PuEq9DucF5Xoj5AoR4uDNcnNZ7/Uw97gjzhILUn2IrDIbl370M4JEpch2zYhtuemfl
         nyxS5GF/pybKaF1lhh3eOmsvTUFeLW0wXDHXUbQ0X2Dge3V8thrCkJFM5KXy4aBpd4jf
         GT9DFaKTzZzKA+jAE2zfKcRk4dfmUJE5ctM2stwl9Q7ahabtGUGep/3wbLmPiqetVsaJ
         UF5wbraBUtt/lhpO8Epe00tMLoK5+snuDxUmtaMoSD3gGdS5R/kgl9akNurJ97nCRBXn
         EQqcX0kF+m7hDasGY5u0KSIh5S519FdYN1isu1flDIB2+uGi1zHw3CJl0f7/qNqeW88C
         xL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942323; x=1702547123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyKSCf2aLl680/7Wqis3i4rZw9x7ArfIUp262TxDEUk=;
        b=q9wOBaBdGrhhSS10OsNSUSIOv6+zAm1yfjpRkoSwDZOzu0XWw9UsPnQ8+TIW2X8OOD
         dP7jPvqvq9D2lJlYHDLen/zKLNmxN0D8btAsw4Tl4UWNTUsto6dxhJMl2ArYVcVHaPUE
         I+jFiuDQIgjumCh94xFMy/yvPNm21g6SJrfnnHSusnyt5PK7IJDMqTBRCujOZ05rfRLx
         wf7eDEAEbp4JNxmmaVL8+JVyt9+rTksgz0muYeECxo3peZ5W8k0mnjC+cfkZY0PLyKrM
         ufdtGcoT7jisD+E3fK+jDYbv4xxBK0/nex3V8Lq09efIe9sMv3fjRNVy4R/E1uVKdBup
         NCGw==
X-Gm-Message-State: AOJu0Yz5fkN9LJWEBVu2khGk3GB7jVNkN8NifVcvPHSNQ59BieIyIDHb
	7BfzlZtPCMFBa6JbQpATs6M2
X-Google-Smtp-Source: AGHT+IEcnATdGiWKlmwcDuBSMHxRghgIdiGfOM1I5spnkabClexZJAWnACIYHSAcHPny+pvM6qPQUg==
X-Received: by 2002:a05:600c:2d4b:b0:40c:2a71:404e with SMTP id a11-20020a05600c2d4b00b0040c2a71404emr399746wmg.118.1701942323228;
        Thu, 07 Dec 2023 01:45:23 -0800 (PST)
Message-ID: <0d52a08e-04cd-450e-9b16-75b65fa46368@suse.com>
Date: Thu, 7 Dec 2023 10:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/39] xen/riscv: introduce fence.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <225f7c6eac811dfd6afbb188c869557c5465ecca.1700761381.git.oleksii.kurochko@gmail.com>
 <902146c4-8f36-446b-8332-78858186986c@suse.com>
 <306915687362f916b11a78d7a74ee817c8d2ec16.camel@gmail.com>
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
In-Reply-To: <306915687362f916b11a78d7a74ee817c8d2ec16.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.12.2023 10:42, Oleksii wrote:
> On Tue, 2023-12-05 at 16:56 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/fence.h
>>> @@ -0,0 +1,12 @@
>>> +#ifndef _ASM_RISCV_FENCE_H
>>> +#define _ASM_RISCV_FENCE_H
>>> +
>>> +#ifdef CONFIG_SMP
>>> +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
>>> +#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
>>> +#else
>>> +#define RISCV_ACQUIRE_BARRIER
>>> +#define RISCV_RELEASE_BARRIER
>>> +#endif
>>> +
>>> +#endif	/* _ASM_RISCV_FENCE_H */
>>
>> Imo such a header would be better to introduce once a use for the
>> constructs appears. Otherwise at the very least it wants explaining
>> in the description what this is going to be needed for. I can't
>> find items of these names in other architectures so far, so this
>> must be something RISC-V-specific.
> It is going to be used only in RISC-V. The things that use these
> definitions are introduced in the patches of this patch series:
> * [PATCH v2 18/39] xen/riscv: introduce cmpxchg.h
> * [PATCH v2 17/39] xen/riscv: introduce asm/atomic.h

Then perhaps fold this patch into patch 17?

Jan

