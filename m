Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C8947E8C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 17:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772279.1182728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazwd-0001m4-Oa; Mon, 05 Aug 2024 15:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772279.1182728; Mon, 05 Aug 2024 15:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sazwd-0001kZ-Ln; Mon, 05 Aug 2024 15:48:23 +0000
Received: by outflank-mailman (input) for mailman id 772279;
 Mon, 05 Aug 2024 15:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sazwb-0001kQ-Qj
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 15:48:21 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2334df70-5342-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 17:48:19 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a20de39cfbso13631262a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 08:48:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bb88d1d9a3sm1683960a12.26.2024.08.05.08.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 08:48:18 -0700 (PDT)
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
X-Inumbo-ID: 2334df70-5342-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722872899; x=1723477699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8pwD5E1cYfrRyZTIXFKA990Wqf+kRr0bcG+ogXOoR4g=;
        b=cS4D18ZsMXM39PLvqSWv9z62jyQ949nbL8uszvQg5tzWI4lRY0OFUycMFJTmgvuiuq
         ael00YyQrY9E8i29T9RwPwvnF0H2WcVAhXJJyUqEmEMSpdhE3xehUzPA48elqZ8vDYOZ
         6TiMWA0pp1XVZL32oriW2IwNdQIcmV91XxGzhAh5L6flwJc0bmAs9A1YhPWzYt0hVesA
         OItmtSNygg5h7WBajVCDRWjxM6N856IYPim0MKaxBVJewh81e7+WIk64K09xhSTn0Feq
         kUo3+sBgCTeT5f99JwqaARiAsBDv4K9CPW7k18uH2sEsbZMaPJwU+1mc8EvLBODWMxUO
         OkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872899; x=1723477699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pwD5E1cYfrRyZTIXFKA990Wqf+kRr0bcG+ogXOoR4g=;
        b=NckwEDn2Ms3rYdgqodIrokUc2wxQ0eRtBEK/ZqNPMIrkt5zIjfdfZQjQbsWSOvxx0a
         CBTlqV3JUjjzw4UayOZmkuCuK/jxRezNsix134YfgdIuaKBwcwNhxZoTLVDUMytk6r5s
         2zcbHtD8deveMQ41wTQsuvcL3UOfPP7eCPB8+z0qBvXVs83CTiaUd+cBiXS2Fgucp8HL
         +ibNrlBvLx4Lmql3BIIiRIO5Oiie5oneLOXmDqf0p3sLMgL9ruFL21rTLpeWAEkHtebn
         joouEYEhCO2mAO6o+J4URue8qvt/W3WbO5y8XTZ59xV4PQ3E4cKEtrHqWd3Yk8Dzrn7g
         HyRA==
X-Forwarded-Encrypted: i=1; AJvYcCW/IuOjp+3AKaColzIX6ptWKNTuYfQZl9DxHH1YZbL66hfuP9XUJrea9q0KtF98VMEsxAbM7YqVUQMp+VTsj5XK9/gYJ3QCCr+r04dPfmk=
X-Gm-Message-State: AOJu0YwxjiFj/iMcDERM/PFrt1sL+fRUksxQ1REg4zocZiaKboaQ2hMq
	Jqe0XEy5er0aYJ/C1oz1CZ2JrGQYPX7we7BxOwM628MEoDpwyGN/0gUqmEI4kg==
X-Google-Smtp-Source: AGHT+IGEkH1gwSSLrASEw6niAb06QoExu7GdG0CZmsneVvOpYe58inqevJFIWvsuBRV0h7vDTlc5iA==
X-Received: by 2002:a50:ed08:0:b0:5a3:af31:9ae4 with SMTP id 4fb4d7f45d1cf-5b7f36f58ccmr9734335a12.5.1722872898989;
        Mon, 05 Aug 2024 08:48:18 -0700 (PDT)
Message-ID: <85bf5a08-9d47-4f9f-b1e8-ca12e610f393@suse.com>
Date: Mon, 5 Aug 2024 17:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
 <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
 <fba675f7256aec1492f8446b0a0716e05bc91c54.camel@gmail.com>
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
In-Reply-To: <fba675f7256aec1492f8446b0a0716e05bc91c54.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2024 17:34, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-08-05 at 17:13 +0200, oleksii.kurochko@gmail.com wrote:
>> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
>>>> +    }
>>>> +
>>>> +    BUG_ON(pte_is_valid(*pte));
>>>> +
>>>> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap),
>>>> PTE_TABLE);
>>>
>>> I'm a little puzzled by the use of LINK_TO_LOAD() (and
>>> LOAD_TO_LINK()
>>> a
>>> little further up) here. Don't you have functioning __pa() and
>>> __va()?
>> Can __pa() and __va() be used in this case?
>>
>> According to comments for other architectures, these macros are used
>> for converting between Xen heap virtual addresses (VA) and machine
>> addresses (MA). I may have misunderstood what is meant by the Xen
>> heap
>> in this context, but I'm not sure if xen_fixmap[] and page tables are
>> considered part of the Xen heap.
> 
> One more thing: can we use __pa() and __va() in setup_fixmap()?
> 
> As I understand it, to define __pa() and __va(), the DIRECTMAP mapping
> should be mapped first. However, this requires information about RAM
> banks, which is provided in the device tree file. But we can't map
> device tree without fixmap. Am I missing something?

Depends on further plans. In principle VA <-> PA translation within the
directmap range and within the Xen image range is purely arithmetic, not
requiring any mappings to have been established. You don't access any
of the referenced memory in the course of doing the translation, after
all.

Jan

