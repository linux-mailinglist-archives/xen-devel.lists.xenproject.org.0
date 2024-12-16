Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DC9F3352
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858181.1270440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCCs-0006pD-1O; Mon, 16 Dec 2024 14:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858181.1270440; Mon, 16 Dec 2024 14:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCCr-0006nX-Uq; Mon, 16 Dec 2024 14:36:21 +0000
Received: by outflank-mailman (input) for mailman id 858181;
 Mon, 16 Dec 2024 14:36:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNCCq-0006nR-FW
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:36:20 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c817799-bbbb-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:36:18 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so2760710f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:36:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c66sm8241418f8f.69.2024.12.16.06.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:36:17 -0800 (PST)
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
X-Inumbo-ID: 1c817799-bbbb-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734359778; x=1734964578; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aQWmUEXPSsL0/T9L3Z0agw2awoqDGq7jOqPA1hXYkiU=;
        b=X3ufXmF85u4aeCzoVgvy4NMYpX0KkeOge7pNfHIfWEYbtNtueu+CKeeiqHjp1e7ufo
         VRKzOsppWNN3esWI2y8h/JuPWGYHuE2b+V2lGnzh41Z3GMNSXZlOAxjBX51N5uCxh9WD
         fBLf15JoNP/LjR+BdiysM1JMCViWpwk35s7MQ9x/QDOvrDuxTMlYLVa/XqgfK46VaUW6
         U5OSUVhGr+fKAeIpyEzwsRjOx17ZwheZ53Y4SBxz+C0wXhLKRvd9aS7H9BXTMHs9HqcK
         pdCxUErvHGu4tO4cIVyGgcQm0FWNVTuH/kcmJ1PejKdm0mfrdl2J2hZPbWru+evZukhV
         1ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359778; x=1734964578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQWmUEXPSsL0/T9L3Z0agw2awoqDGq7jOqPA1hXYkiU=;
        b=LtxuSViwgKe57kJ/3qT+BU8MHCMa3sn+EuSRh7hkR21ACS7jKUIAaniN9h/4ShzCyO
         6SrgrKvmYTxN43ZLPGNLobhuQh9GI85QClev7YioY+fOTIxfOTP6GH8IludnRqpsEKG1
         Nw710kX+lGfGf602zA5n40QbF+JUhwpb3UijuAy0n2YGHrv1ef7zjUiIXkVKk/FMKFgB
         KXx/SWkZkUWCN2sxP8vYYrMAKEiVcMwVr1IuVoJ1KNMf3iGlfoENDWiiFX5Nwi0DaJup
         kKSosiU7G7y0xEtgJxhzdEal5E83g0F2sp1PeXEcW5xhw/IGUGGT6jfReRJL2f5KW9pE
         4dWw==
X-Gm-Message-State: AOJu0Ywe5FpV7uqO7RfSo+yMDzWK44iGRfNy/xMdnFMxXXiDbzRtqHoC
	lu2fKWDeJX42Z28jExQMyjj1NXo0JVWoyHEPQ8/UAH6o2idamIDjmK1qM60Qqg==
X-Gm-Gg: ASbGncvLj2yDYQMXmhi2BOtfcRADIbdXk5SwD67X+SCUY8Lhy5r5ToflL8nIns9H3Df
	7/GLO25Qx1NMq99xYw6ZuLerZtWqBCk5PIlES0j2UWpo4YozoR7O6KDtQ56+nhO8oZC6jtnzn7p
	m+OkkARujj6hxFjcpCRTgFnoJWzWq/htJp1LArAOUWetS/BxOm+JgPxO7j5AyfQJ6cRPW/4F4Qb
	endFeK0C0nA2Y8/J1Q2Xc6I44L6Kw5nbK15ZT0fPg8CsEgxKKEdQi26xOEUxVbM2LFYSAYKh7wQ
	7FBFk73Un8SbWv6D2K6NTK8VDaxNAB4oMJWte5bxxQ==
X-Google-Smtp-Source: AGHT+IEY0VpDZvXduAjOfQtooLMYPcjzaMEzYuCqznyLAEYH8w1sOuwe9NkKzGHg3oP/gjmB8H8YlA==
X-Received: by 2002:a5d:6c68:0:b0:386:1cd3:8a00 with SMTP id ffacd0b85a97d-3888e0ac341mr11028617f8f.40.1734359777850;
        Mon, 16 Dec 2024 06:36:17 -0800 (PST)
Message-ID: <df0f831f-378f-4fa3-ae4f-b065f2ea566d@suse.com>
Date: Mon, 16 Dec 2024 15:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen
 image
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech,
 marco.solieri@minervasys.tech, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
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
In-Reply-To: <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2024 15:28, Carlo Nonato wrote:
> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>> --- a/xen/arch/arm/arm64/mmu/mm.c
>>> +++ b/xen/arch/arm/arm64/mmu/mm.c
>>> @@ -1,6 +1,7 @@
>>>  /* SPDX-License-Identifier: GPL-2.0-only */
>>>
>>>  #include <xen/init.h>
>>> +#include <xen/llc-coloring.h>
>>>  #include <xen/mm.h>
>>>  #include <xen/pfn.h>
>>>
>>> @@ -138,8 +139,36 @@ void update_boot_mapping(bool enable)
>>>  }
>>>
>>>  extern void switch_ttbr_id(uint64_t ttbr);
>>> +extern void relocate_xen(uint64_t ttbr, void *src, void *dst, size_t len);
>>>
>>>  typedef void (switch_ttbr_fn)(uint64_t ttbr);
>>> +typedef void (relocate_xen_fn)(uint64_t ttbr, void *src, void *dst, size_t len);
>>> +
>>> +void __init relocate_and_switch_ttbr(uint64_t ttbr) {
>> CODING_STYLE: { needs to be on its own line
>>
>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>> be #ifdef protected.
> 
> Here and in other places (patch #8) I'm relying on DCE to remove functions
> that are not called. This was a suggestion from Jan in that patch. Can we
> adopt the same here?

Yet how would the compiler spot that the function is unused? That would only
work with LTO / WPO. DCE (as I did suggest elsewhere) requires the functions
in question to be static (allowing the compiler to see enough of the whole
picture).

Jan

