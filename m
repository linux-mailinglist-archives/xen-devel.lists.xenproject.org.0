Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00994816A9D
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:11:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655782.1023571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAaO-0002nE-Un; Mon, 18 Dec 2023 10:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655782.1023571; Mon, 18 Dec 2023 10:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAaO-0002kn-R0; Mon, 18 Dec 2023 10:10:56 +0000
Received: by outflank-mailman (input) for mailman id 655782;
 Mon, 18 Dec 2023 10:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFAaN-0002UG-Aj
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:10:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9fa6d22-9d8d-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 11:10:53 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33663adf953so766297f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 02:10:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d5912000000b003365e7f35f4sm6165150wrd.46.2023.12.18.02.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 02:10:52 -0800 (PST)
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
X-Inumbo-ID: b9fa6d22-9d8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702894253; x=1703499053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HxjJnl32ZClJfNFczB7mo7VhiixqzK9x9AgIPcO6AGQ=;
        b=FYLgmHkQ5Y2yclVwzfY/Ru7feP7FhbOTCXCQpqj+qLSb8tXQH8BA1jvpngOBlYQU5o
         7V045XOM9vPjZMf1rOrK0W8yhSgMR3sf8rQIIXhQg2Caic6FQTqB+ZIsY2fm/XDCXww2
         jtov8gFbNUSdGfFqvcRTn1+wSH6v98iVna/+o4g5OxlCHBSAEXV8desy0DqynN1YMi+E
         zSGshEfoa8yswYzY7CHLTjx91GIpXNANgOB7dDbAQdXNL5QXNOVtIHcp0L1xmUTGPMtN
         p8tErVmqnyf6v3wMSWqR89PcBRLa1FyY0xQdQ4Mvtj/NznR6fSvCgtGvAoni102/G40u
         og8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894253; x=1703499053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HxjJnl32ZClJfNFczB7mo7VhiixqzK9x9AgIPcO6AGQ=;
        b=fa/UMW395LBA+f7Zo1x5o5Q1TNmLrqpiZbuEnb2g/+btsfFC4jRVcM1n352/0ikfVi
         rwflSiXxGduOpNGmsx0AOhe9gkcZwnf8X93MnUEzF6k3N5uKNK/qE3HxgUK7wfFcrnAe
         rAhUtman2NauDWLfj1/rRRUSP8tx4mnO/jnN+ENum+/BV22YDbEcF9aRFxAvXlDl2K5M
         WJyPt+vK7GDpdRunDBDfffHXutKqO5zkLAfxkdxOcaoYp4rb+3pulfdqUhwEJjDJY70Y
         7+q7WjCarUUuIr1TK1J2WF6h6ZWPloLbyH/IV4iq/T7Mkbd4BpProPN7jkDJB8JbuBM4
         q87g==
X-Gm-Message-State: AOJu0YxTNMtStr2nhvvETsMOx/OmY7YwNwy/zxttQblMRTzAgzShfK99
	idGKfonl56jb793pDAnAGjdR
X-Google-Smtp-Source: AGHT+IHoUVD44ERA8at3G/zI17Qf5OnO8UWvxuCGRjGiy+sTgtftEVUmIBHwfN+5IELQnttfNcVSlQ==
X-Received: by 2002:a05:6000:1863:b0:336:60ea:319d with SMTP id d3-20020a056000186300b0033660ea319dmr1542471wri.63.1702894252801;
        Mon, 18 Dec 2023 02:10:52 -0800 (PST)
Message-ID: <f53d964e-8df5-42eb-9582-41f6b8b5740a@suse.com>
Date: Mon, 18 Dec 2023 11:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/39] xen/riscv: introduce asm/guest_access.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <7dda759b846003fcb453f1118cefbfd2eeb804d7.1700761381.git.oleksii.kurochko@gmail.com>
 <e08e2f49-5ed5-40ec-8db4-e2dd597c8046@suse.com>
 <406a8425dc711725d3575b4c06d7bcaaff05992b.camel@gmail.com>
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
In-Reply-To: <406a8425dc711725d3575b4c06d7bcaaff05992b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2023 11:02, Oleksii wrote:
> On Thu, 2023-12-14 at 15:06 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/guest_access.h
>>> @@ -0,0 +1,29 @@
>>> +#ifndef __ASM_RISCV_GUEST_ACCESS_H__
>>> +#define __ASM_RISCV_GUEST_ACCESS_H__
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +unsigned long raw_copy_to_guest(void *to, const void *from,
>>> unsigned len);
>>> +unsigned long raw_copy_from_guest(void *to, const void *from,
>>> unsigned len);
>>
>> For the full build to work, you will need to implement these
>> somewhere.
>> From the titles of further patches I can't guess where that would be.
>> Note how PPC has decided to have these be inline dummies for the time
>> being. It also looks as if you would also need raw_clear_guest()?
> It is implemented in xen/arch/riscv/stubs.c:362,367.

Ah, that's patch 37, which I didn't get to yet.

Jan

> Regarding raw_clear_guest() I'll double check. I don't have a
> compilation issue with it, so I ignored this macros.



