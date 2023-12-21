Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F281B001
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658557.1027769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE72-000278-Kw; Thu, 21 Dec 2023 08:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658557.1027769; Thu, 21 Dec 2023 08:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE72-000242-Gu; Thu, 21 Dec 2023 08:09:00 +0000
Received: by outflank-mailman (input) for mailman id 658557;
 Thu, 21 Dec 2023 08:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGE71-00023w-4o
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:08:59 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fc1f226-9fd8-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 09:08:56 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso420425f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:08:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4d07000000b00336759019a5sm1405551wrt.42.2023.12.21.00.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:08:55 -0800 (PST)
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
X-Inumbo-ID: 2fc1f226-9fd8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703146135; x=1703750935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLwfVvfuZvc2ynbbwFO4N5Uc5sQntJzsWveY3KeXoaA=;
        b=Gip0xX4rZiqMA4UNODOS7uMX3xTGGvO311iUE8bA/PxgnHjeMBqDN1FN2eN9yrIGdv
         aCdcVTkueNATK09y9zDB+LWnHEEZUrVcw778KBIft2bP2RvREchkXCQGT1+4oCPjSgS+
         QTVLsgWPOzJ+wHJf5oT2pKwpyTb9eVk3sLqkNV5CS9/ckJ8DeHUNTmtkA/VN1sB05KxS
         b89STwWEiIZJ2yhveU51w32LbkdLMgz04ZpJ52mBZE0uev2HOsiNZ/FkMLD23CHtxcBj
         Hukq/LbgsTVllEmI+JysZjoRsWx7S+a/TW4LUs9fzVVbMtIA1LiNRfXHfYp5ori/GQ0N
         05AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703146135; x=1703750935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLwfVvfuZvc2ynbbwFO4N5Uc5sQntJzsWveY3KeXoaA=;
        b=KNO/P28CDx8CJ77yghDJM6D0BHTm4t4YKgIBmQo9EyDBhf0pRpBLkNyDm/zBkI35Ek
         rtX5YnIazHT4qHDb29334skf9Sy1tRkBSwdMNfEV6zlUqi+1M7uhcsxaOxoyc1fUSlnC
         3D8o4vi9rJpUXWTwocnWxEBkDPLYAe9n74jHL5uKFO4ajPjEy0BUkbFp8UBbV2mMLu2X
         ksLeY+n/eEOizI90BhXsKn6pWUaA3D/JCHbQDUMCYWBu0a1CAwpECyHctT8OFOsPfP1K
         u9uZWAdGV6wRXLKTdaKcYM6Yw7Eu7A/Dv7FcMdMRsDzgi5NN5DkmY9oZf8aW2Y1+tZ6S
         Zmuw==
X-Gm-Message-State: AOJu0YyrSKVe/t9/2Rh5f920TdfaHOSiZ44ANCmQJmfEtkvRUP3HZwhC
	nEnLFLrVVf2GmRRwICqZ8hqn
X-Google-Smtp-Source: AGHT+IE1KT8ZVmOb/1x9hrQDLlSIbfoDvlShPfxvStXhhKMH5Em3Rs+1A38PSzUBEnIHCd5y5gLNKQ==
X-Received: by 2002:a5d:4d8b:0:b0:336:68f5:a999 with SMTP id b11-20020a5d4d8b000000b0033668f5a999mr426485wru.36.1703146135396;
        Thu, 21 Dec 2023 00:08:55 -0800 (PST)
Message-ID: <5810703d-7ade-4b85-961c-e0c50f9aab34@suse.com>
Date: Thu, 21 Dec 2023 09:08:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/7] xen/arm: address violations of MISRA C:2012 Rule
 16.3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <d847830f-7071-4141-bab7-8b8c55ec3ae8@citrix.com>
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
In-Reply-To: <d847830f-7071-4141-bab7-8b8c55ec3ae8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.12.2023 22:35, Andrew Cooper wrote:
> On 20/12/2023 11:03 am, Federico Serafini wrote:
>> This patch series addresses violations of MISRA C:2012 Rule 16.3 on the Arm
>> code. No fucntional changes are introduced.
>>
>> Federico Serafini (7):
>>   xen/arm: gic-v3: address violations of MISRA C:2012 Rule 16.3
>>   xen/arm: traps: address violations of MISRA C:2012 Rule 16.3
>>   xen/arm: guest_walk: address violations of MISRA C:2012 Rule 16.3
>>   xen/arm: mem_access: address violations of MISRA C:2012 Rule 16.3
>>   xen/arm: v{cp,sys}reg: address violations of MISRA C:2012 Rule 16.3
>>   xen/arm: mmu: address a violations of MISRA C:2012 Rule 16.3
>>   xen/arm: smmu-v3: address violations of MISRA C:2012 Rule 16.3
>>
>>  xen/arch/arm/arm64/vsysreg.c          |  4 ++--
>>  xen/arch/arm/gic-v3.c                 | 30 +++++++++++++++++++++++++++
>>  xen/arch/arm/guest_walk.c             |  4 ++++
>>  xen/arch/arm/mem_access.c             | 12 +++++------
>>  xen/arch/arm/mmu/p2m.c                |  1 +
>>  xen/arch/arm/traps.c                  | 18 ++++++++++++----
>>  xen/arch/arm/vcpreg.c                 |  4 ++--
>>  xen/drivers/passthrough/arm/smmu-v3.c |  2 ++
>>  8 files changed, 61 insertions(+), 14 deletions(-)
>>
> 
> Just a couple of notes on style.  This isn't a request to change
> anything in this series, particularly as most is already committed, but
> bear it in mind for what I expect will be similar patches in other areas.
> 
> We explicitly permit tabulation when it aids readibility, so patch 2
> could have been written:
> 
>         switch ( hypercall_args[*nr] ) {
>         case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEFU; fallthrough;
>         case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEFU; fallthrough;
>         case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEFU; fallthrough;
>         case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEFU; fallthrough;
>         case 1: /* Don't clobber x0/r0 -- it's the return value */
>         case 0: /* -ENOSYS case */
>             break;
>         default: BUG();
>         }
> 
> (give or take the brace placement other style issue)  We also have cases
> where a break before a new case statement is preferred, i.e.:

Did you mean "blank line" here, seeing ...

>         ...
>         break;
> 
>     case ...:
> 
> This is to prevent larger switch statements from being a straight wall
> of text.

... this as the further explanation?

Jan

