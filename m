Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8BF914432
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746217.1153212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeiF-0001CH-7c; Mon, 24 Jun 2024 08:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746217.1153212; Mon, 24 Jun 2024 08:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLeiF-0001AJ-4w; Mon, 24 Jun 2024 08:06:07 +0000
Received: by outflank-mailman (input) for mailman id 746217;
 Mon, 24 Jun 2024 08:06:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLeiD-00018e-Ov
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:06:05 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ad2e512-3200-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 10:06:05 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso41812481fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:06:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbc8dbcsm56532535ad.307.2024.06.24.01.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:06:04 -0700 (PDT)
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
X-Inumbo-ID: 9ad2e512-3200-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719216365; x=1719821165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Z3W57KUTUmGuAOJd5Ardnn31EKXcqeE4GFzOlAmrY=;
        b=PL0uQ0jlJIIO5LeqNqozuZhLRO34PxIFXaf3rJB4LzsFth7FzSIg4Bmm0Fn0oKQWhh
         1PmyRY+X8y1UAiTtfAvuOiJw0mVOu1rc8tz0c+MKaoLTYt6G7F/MqV9p7fQ+9/8oRv3J
         WmNaP9UW9Q3KeQ8kzS5lpmtUdJ69lYT7Phv8OPmd2VKvw7FIzP+DIvctNUZFk6KzmhL4
         qgp0vtN6XHrMZ1/n4UHJ3x97xpVAeZLXZmh7OMNLBnXxWTLJUAyyTtqpAU6TjDKCpJrr
         fkiP+qON1kExTqgF7nY1HcZMu/cDINYvvX2lkJ5+my2FlGtx2WAVEZrQOWp3LneJp6I1
         mlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216365; x=1719821165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3Z3W57KUTUmGuAOJd5Ardnn31EKXcqeE4GFzOlAmrY=;
        b=lEgSUobtzwX31+++sJtViHjcvX0be9AEpdJPA+SW2JJNJPWEwOXtPPlCCRF0oAar1j
         sBnEg6Y95CvshsHkfDC66L4nsU4lD5zmlpxaK7OrzGTpEgrV+8wiM6UCziUBd+yWvIMK
         xgz6AN2rOVt8M6xvJaiVUKUkEm8Hccq6x0fBqJFmtDrVnOR/OcIUmG+5AhYIu2fP/cdF
         CvASZMBlUuj5iFDEcPsDVITaIusi4o8jKSqfC+I7+xFoXvYfsSBpDsxhPEZE3tBEkQIX
         Ja/Uaf2NkxQSLWQeOvqAjwpEBFCRDBXk6dHjdC1Ce+G6RI+NADgYrvfi/Vl0BUCRf94L
         n+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK8sW43qp4z0dPuD2nPAO+H0cj7FGF5Farva//KbfQCDmCQ9Z386IUbVl5YaoDJTJ8nFdE6/9DuLDRILUKPP/qoQ572nlEn7idSLfmnrI=
X-Gm-Message-State: AOJu0Yymxll3nepqPf5tNLOor62BHqkmEYvY0S/youMN5ziNl28xWP5M
	ZFz3P7X32NXItO5qlsGlSZ1ybz3nqXl/lePj2Mwfg9Qe+c9a64dQHEJAlaFJTw==
X-Google-Smtp-Source: AGHT+IEMCB1ZxtoQoTqD379vNEKWwRIZbv8h8x7Ioc+xIHHFzQ9bipq/yePWWtP7DcLK7ecvdbKxOg==
X-Received: by 2002:a2e:98c4:0:b0:2ec:4df7:8cef with SMTP id 38308e7fff4ca-2ec5b2a00a3mr20188611fa.15.1719216364650;
        Mon, 24 Jun 2024 01:06:04 -0700 (PDT)
Message-ID: <a15da9eb-f93f-4a01-8822-21452b762f53@suse.com>
Date: Mon, 24 Jun 2024 10:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/riscv: Drop legacy __ro_after_init definition
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
 <20240621201928.319293-2-andrew.cooper3@citrix.com>
 <d8b2b01e608c6ddedbb2b46f58e8bd46ecfd5ca9.camel@gmail.com>
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
In-Reply-To: <d8b2b01e608c6ddedbb2b46f58e8bd46ecfd5ca9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2024 10:02, Oleksii wrote:
> On Fri, 2024-06-21 at 21:19 +0100, Andrew Cooper wrote:
>> Hide the legacy __ro_after_init definition in xen/cache.h for RISC-V,
>> to avoid
>> its use creeping in.  Only mm.c needs adjusting as a consequence
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: George Dunlap <George.Dunlap@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342686294
>> ---
>>  xen/arch/riscv/mm.c     | 2 +-
>>  xen/include/xen/cache.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>> index 053f043a3d2a..3ebaf6da01cc 100644
>> --- a/xen/arch/riscv/mm.c
>> +++ b/xen/arch/riscv/mm.c
>> @@ -1,11 +1,11 @@
>>  /* SPDX-License-Identifier: GPL-2.0-only */
>>  
>> -#include <xen/cache.h>
>>  #include <xen/compiler.h>
>>  #include <xen/init.h>
>>  #include <xen/kernel.h>
>>  #include <xen/macros.h>
>>  #include <xen/pfn.h>
>> +#include <xen/sections.h>
>>  
>>  #include <asm/early_printk.h>
>>  #include <asm/csr.h>
>> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
>> index 55456823c543..82a3ba38e3e7 100644
>> --- a/xen/include/xen/cache.h
>> +++ b/xen/include/xen/cache.h
>> @@ -15,7 +15,9 @@
>>  #define __cacheline_aligned
>> __attribute__((__aligned__(SMP_CACHE_BYTES)))
>>  #endif
>>  
>> +#if defined(CONFIG_ARM) || defined(CONFIG_X86) ||
>> defined(CONFIG_PPC64)
>>  /* TODO: Phase out the use of this via cache.h */
>>  #define __ro_after_init __section(".data.ro_after_init")
>> +#endif
> Why "defined(CONFIG_RISCV_64)" is missed?

The TODO is being addressed by this patch for RISC-V. See how a subsequent
patch also drops CONFIG_PPC64.

Jan

