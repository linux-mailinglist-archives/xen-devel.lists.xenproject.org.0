Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607EFA8B7C9
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955703.1349308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u518D-0003qd-RR; Wed, 16 Apr 2025 11:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955703.1349308; Wed, 16 Apr 2025 11:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u518D-0003nQ-Ny; Wed, 16 Apr 2025 11:40:41 +0000
Received: by outflank-mailman (input) for mailman id 955703;
 Wed, 16 Apr 2025 11:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u518C-0003kN-20
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:40:40 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfc8398-1ab7-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:40:38 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso47706765e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:40:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b52b6a4sm18653685e9.31.2025.04.16.04.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 04:40:37 -0700 (PDT)
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
X-Inumbo-ID: 9dfc8398-1ab7-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744803637; x=1745408437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uEw35/AzWCtJIgcX5ECnhT3ZrxDw77Fx4PIKAmy7xSk=;
        b=TssXW6wJgqoAP4IIdY9hw0gSSm218gj60PrRSUT5CmK2LLAanVk325Prdc/YmapUOO
         jw5xSSd4FsUZpDGFaPkyyBbHwqmyRf7U3Kfrkh62gI8PlCh4U/4MmlCHPF0xTsWUjRqU
         lfqkZmBsI9/DfTRJo9UZKaqBP3H8ZaqgqaXWXo2IrHEwKyJbcXSL8cWTsGelcpgawZxl
         iE1FUHHURKYOczAZWITXKdRKJx/o6B6C7pVZCHm6pTFw600QZrGU2pmu9fQKPdPmVceS
         85ir18lDVyGzCTu3nDUroLlzCrKpe6EH8zhtPx5WCHnO4Mbt/cPKCUZ/hE23PowBk+go
         GzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803637; x=1745408437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEw35/AzWCtJIgcX5ECnhT3ZrxDw77Fx4PIKAmy7xSk=;
        b=jjz7pdh7wnbEav4HtnTpUDck8WIGrWozGaW4YBkU6iMnfOHqeLNTjnOT4zohRoVpiQ
         aAJatN+AZnd+qmRZTwpwLQ8DGSzYnU48ECPH9IMPB6e7/0ySpwpqM2byuJI6yAt6oysU
         5b3E3eFU8fLoUBlq2ORdEd8S2OJ/+lch4/AQntpVNh1J8OlBW8UtSMJJSplKxptccVdn
         P/0bGTmdmIUlVWwWl0nHTjDpS7RCh0ExQ3K5mta6GOBaenJasw0oT5Gfn4fi9BWL/XLG
         fhZmciV2ifB5qPiavRi7m4NiACxLILEyCYp3hM7rj7cylrolacoFTxrjecX+urXpwb4a
         6xCw==
X-Forwarded-Encrypted: i=1; AJvYcCWut2ZWBE0Hj7dbDNV+KKgL8nHqmfSZBHQZk23RSv4MGoOcjUh5reE5vTsRVQqh/iiTIgiJOM82Bys=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkED3Oe7QN/N6f0n5dSiJ4iIXi0VKTftE1sfEH40hJII7k2F/F
	8XHyQp8uwfkijt/qaDIMCNZRgBteukdXsx+Pw+g4eyp/lGqayLdioygKIeN0Sg==
X-Gm-Gg: ASbGncs+r5gU7gheXqt4dKmKqk1n3K057W9A8cne6f4pq6yXJcLgvFwx4D35ZqkRH6b
	zmn8vO/K4C2Rb19b64VlfDy8ux3XhMHFUvpaqOx6q/Eb02eqLn8FcMpYjJ3e4XabEFXIIGCO87e
	3u09bPNSvQML3fYzESia5epM0Gq7ED+mQPOS++5rfyk8wGT6PSsggDUSpck0S7M2oT0+hi4nDA0
	ZYHW3IL3HXNkN4uc4mh3ICEUWi32F4oFCikwYWVkbM2PJZgAqJVsh4i5ZhnAXjhURavN6y+1+Xj
	rXTuPSa8PISfPFgqgAMB39J5NVdiLigREGEwaQwaoEyzaKZHuntJuv5D0mQrshfnRYxDCCIVoxX
	U69UBCj6DdMxxbli3jZ1OXi3/F8qAAY3ga+QG
X-Google-Smtp-Source: AGHT+IGTTDbqro+m1QROOb/GZ+H6gqPmuS7BP9ieaiqo+4HSzHw6OJdr1VtUJYpogPPKxRIY6wLdaA==
X-Received: by 2002:a05:600c:1d86:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-4405d616afamr14296425e9.11.1744803637460;
        Wed, 16 Apr 2025 04:40:37 -0700 (PDT)
Message-ID: <9007cf28-644c-47cd-9eef-66573350d08a@suse.com>
Date: Wed, 16 Apr 2025 13:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0815b65aa0b526b85c737f5923148b119cc4104f.1744639515.git.oleksii.kurochko@gmail.com>
 <6ea52f30-7aa4-494b-9719-9fdffc56e3c8@suse.com>
 <91856640-1b82-4440-8a45-de56ffb57e71@gmail.com>
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
In-Reply-To: <91856640-1b82-4440-8a45-de56ffb57e71@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 12:44, Oleksii Kurochko wrote:
> 
> On 4/15/25 12:07 PM, Jan Beulich wrote:
>> On 14.04.2025 17:56, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/mm.c
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -31,20 +31,30 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>>   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>   
>>>   /*
>>> - * It is expected that Xen won't be more then 2 MB.
>>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE.
>>>    * The check in xen.lds.S guarantees that.
>>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>>    *
>>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>>> + * Root page table is shared with the initial mapping and is declared
>>> + * separately. (look at stage1_pgtbl_root)
>>>    *
>>> - * It might be needed one more page table in case when Xen load address
>>> - * isn't 2 MB aligned.
>>> + * An amount of page tables between root page table and L0 page table
>>> + * (in the case of Sv39 it covers L1 table):
>>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>>> + *   the same amount are needed for Xen.
>>>    *
>>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>>> - * except that the root page table is shared with the initial mapping
>>> + * An amount of L0 page tables:
>>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>>> + *   one L0 is needed for identity mapping.
>>>    */
>>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 2) * 2 + \
>>> +                             (XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1)) + 1)
>> I'm still struggling here. In the original expression, the +1 was to cover
>> the root page table, wasn't it?
> 
> |+1| was added to cover the case where the Xen address is not 2MB-aligned.

Oh, okay.

> For the root page table, we use a separate variable|stage1_pgtbl_root|.
> Since the root page table is shared with the identity mapping, it is not
> included in|PGTBL_INITIAL_COUNT|.

Makes all sense then, thanks.

Jan

