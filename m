Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3118182413B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 13:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661693.1031384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMRA-0007VL-NA; Thu, 04 Jan 2024 12:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661693.1031384; Thu, 04 Jan 2024 12:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMRA-0007TK-KR; Thu, 04 Jan 2024 12:03:00 +0000
Received: by outflank-mailman (input) for mailman id 661693;
 Thu, 04 Jan 2024 12:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLMR9-0007Rf-KD
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 12:02:59 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33e82129-aaf9-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 13:02:59 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd08f0c12aso4539421fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 04:02:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cn18-20020a056e02389200b0036018f3d804sm5611388ilb.12.2024.01.04.04.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 04:02:58 -0800 (PST)
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
X-Inumbo-ID: 33e82129-aaf9-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704369778; x=1704974578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMcRZwiT2VQupCjWaouJ0LnuvYoSrPvQbo+lK8q9mO4=;
        b=J6zBHc3qFJ+VsLOyykTzAk2Z30iT3M4VMq2ndRzb+C78WxlFOOLcZnkwRERYO1TXTs
         IOK3TSTim/xtjMcN7/rMDhxA2fRgGZcQaTpGxHGCnzWG/mdKIkgXXqgybQurVug6zpMO
         JzehkFsbOoNmVTN2bq2K46Ek7VU8VvBX7k2WJrbITzqSADC3NUzSMgI6t/T+VVsPjvQo
         jbcqIDp1vpANCUBc9LVTIvrMbmDvM7jyExWyfz2UwXDv5y9hVOmEgOqjFb1IWdWySngw
         aRCgIrMLLOarfGKEG3ebkBH6Lhqpgbw2BpRNOwcBq6O79fWT2yGtAwU/Q0dMTWF6aDad
         XiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704369778; x=1704974578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMcRZwiT2VQupCjWaouJ0LnuvYoSrPvQbo+lK8q9mO4=;
        b=BI/4cVaywp8y6XCkFirk4uvtLJMDTN15n9kLahzF2G+PoB1unrZ4BhkCHbhuwlGnpe
         XVvDMBzCKWbVSDMKRNPx4r06NkmPXaWLJGv6/gg2p9I/Kau38fo/zPwLS2mKlUWGphBe
         nB06WuGzRr1szcBKgexr1ReuN7N9e66Ahp6fUaidImrn1V/65ohMkb7JMbVPmZWDP9WO
         ygtvJ4L3JWhm0+mVxOTD+LToGjGdm7g3bPSSDZ/vs5tC9Cf1/O7aw9jvm3gZl63EB2YX
         64PXlmNKJ2C0ZhKkD3UZ5qBa3huOnPtisqBqfuwlN1nfqMHmgHsbDx0wva2Z/azvglam
         MHDw==
X-Gm-Message-State: AOJu0YwHxjb7GWTbG9s/N+4oBdrQeFxjW5MhOJlYqBCq4pjJK32rFxq/
	vwek/WkNuWOnDpzgSBy6edaof1t0TIP9
X-Google-Smtp-Source: AGHT+IHeUyD1le7SHFKK+YkXhn9A8O83ppsXzUzPZuQSC5DWi45ZGU2GUNEdzs0iJ5f3+qf6MI0KOg==
X-Received: by 2002:a05:651c:2203:b0:2cd:11c3:fe5e with SMTP id y3-20020a05651c220300b002cd11c3fe5emr232927ljq.80.1704369778605;
        Thu, 04 Jan 2024 04:02:58 -0800 (PST)
Message-ID: <120fd76c-7a16-4b22-bb3e-69013d58388b@suse.com>
Date: Thu, 4 Jan 2024 13:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/34] xen/asm-generic: introdure nospec.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
 <d096f14c-96ae-46a6-81fc-55ff8fcaaf39@suse.com>
 <a429369f-a4b1-44f7-86c2-c8afdee13e1b@citrix.com>
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
In-Reply-To: <a429369f-a4b1-44f7-86c2-c8afdee13e1b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2024 12:13, Andrew Cooper wrote:
> On 04/01/2024 11:06 am, Jan Beulich wrote:
>> On 22.12.2023 16:12, Oleksii Kurochko wrote:
>>> The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
>>> so it has been moved to asm-generic.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> A word may want saying though on ...
>>
>>> --- a/xen/arch/arm/include/asm/nospec.h
>>> +++ b/xen/include/asm-generic/nospec.h
>>> @@ -1,8 +1,8 @@
>>> -/* SPDX-License-Identifier: GPL-2.0 */
>>> -/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef _ASM_GENERIC_NOSPEC_H
>>> +#define _ASM_GENERIC_NOSPEC_H
>> ... the removal of the copyright line.
> 
> That isn't a removal of ARM's copyright line.
> 
> The two files are similar enough to trigger git-diff's "this was a
> rename" logic (see the a vs b paths), despite not being a rename.
> 
> It's unfortunate rendering in this case.

Hmm, well, might be. If I had done such a change, I surely wouldn't have
created the file anew, but rather moved one of the existing instances.
Even if it was PPC's that was moved, that was (likely) cloned from Arm's
as well.

Jan

