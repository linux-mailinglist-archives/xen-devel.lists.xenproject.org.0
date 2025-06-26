Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16169AE9C15
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 13:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026153.1401397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUkMJ-0007TR-9k; Thu, 26 Jun 2025 11:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026153.1401397; Thu, 26 Jun 2025 11:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUkMJ-0007QP-6J; Thu, 26 Jun 2025 11:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1026153;
 Thu, 26 Jun 2025 11:01:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUkMH-0007QJ-8A
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 11:01:33 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea6bd86d-527c-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 13:01:31 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so497675f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 04:01:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c88548dbsm7122468b3a.133.2025.06.26.04.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 04:01:29 -0700 (PDT)
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
X-Inumbo-ID: ea6bd86d-527c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750935691; x=1751540491; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JTTzSn1mp5tKrc97TyIj6fMd1If/EadWFimAPQUV/t4=;
        b=LBP4LMA0G6kLrn5qOsISIhRs3+HwFsXZDwi92jBNMl3EK9Lw0pmdpXpIx/BUpuXk37
         9EqxherzkuoUS+oiUJn9O4AtQUfoil2KiCgc+W8Sfged7qn4M2+gZVLzfTDTIjZhvfsx
         6RJMY46wpBqmzWsQC+11MigvzayiQYA4Q1mMZS19E+y5noni3+DXqI9Bm3E3u//ybDYT
         T9Rcw4nFh+7u1TpX6tKgMAtJ/h/NlqcvRlRnWX/L69obnrYfZ+YF35xyLO3b4INtl1lR
         R/twzPzQ2xTiSTYDn3Ue7YovYsLrWZIr0Cy9LaMfbdBDSj9HZ6vEII04lip/jACJVgEf
         Ztzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750935691; x=1751540491;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTTzSn1mp5tKrc97TyIj6fMd1If/EadWFimAPQUV/t4=;
        b=Erc9PW6AZBTx0UlRw9FTXpb+tC3+R8MSrOzVPS91kF4cEIF1BHBndMjH4ZW33vJJmB
         tlPuK7fQzA7IvjL7ZnlfVpJOQYQB/ctCCLWGFl7HfP62o8QFJI+lr+uwkf7BBP1Gg5Ia
         zu41mQntJUEYAPNPFtaXiY2JyGoZsKbB14Hch4WHcCeJycV9klIF6osoXF90xwIrisAJ
         1znCy+PXS/PQLR64NwubjL4H5RtPrRx56wBxrXnbrJaenRqoGgwHug9Ldjr+NX6lppKs
         NsW+9WN+H2YpPBJ4V0dTcmR+CihEf7pO5ueozbEOri+OlFXIwGQ5j4kRHk5ksGooS8VA
         zPhg==
X-Forwarded-Encrypted: i=1; AJvYcCUlwUCW6zW2u0PqHfdrIPPaFSKSFjAqI9DGmM+78RFG2s/rkBRxLP6gccV+k9DMK446Twg3x+XObkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjUXSuUi5dGIUv4lp9JMM/AFXD+nZDO9FxOZKO5DCaYfQ6LGwN
	papMeoVgJgvE0Kp1kbbSv3Y+w8bXrNQFUUWELHIYKA9IQ4K/NknLMFP88E0+FIAHWA==
X-Gm-Gg: ASbGncsxkppVekpPhRC7Q/B66uJHpv0OYNtHw7h7HBSt/izF97TRd93+D4/EuXIeTGT
	RfdNKL11WrGJe7BQpssP+eQZ38RYtHmLlthWTacpBW36yuLwciYQiRGrBrpVz6zSBXTU4oWX9Hr
	7M+XX47qJT7S9f+M/K5sQetAf9x707u500yzcnZBlfzrVNXrrXjna/WxUREYHN+aKRX4DE0roih
	lquIPeK0K6Jij3Nz/buDwRU5U6SqlinLyFwuUqmXm3rYBvbJqENCliOWs82qDhVZZf22dWNTHBM
	xllMLhZ+2JyXAP+MpJJyfwzsnLtROBc2I1bxihYb/5KTEs6oD8Tlhk4DQHemUUwVDJ9OvWiBf17
	6KbNm/bXOHEwSrSse1MW9YWjc1vxM40cLRLSeI3mheJy9yVA=
X-Google-Smtp-Source: AGHT+IFy6hVfBXCtLj2C/CgIn2/UKXGM1mCYTqCw3Usbx3prNtRhG0Flbrgrb9SzdiySjRr8FsEaJw==
X-Received: by 2002:a5d:5e8d:0:b0:3a5:88e9:a54f with SMTP id ffacd0b85a97d-3a6ed5ea197mr5914677f8f.1.1750935690424;
        Thu, 26 Jun 2025 04:01:30 -0700 (PDT)
Message-ID: <1bb7c808-9383-4c51-880e-a12984d544c4@suse.com>
Date: Thu, 26 Jun 2025 13:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/17] xen/riscv: introduce things necessary for p2m
 initialization
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
 <5c61fd86-5c0e-481e-a5a9-6a53f2d78c36@suse.com>
 <0b3c403b-0f24-4fc6-ba5b-fb4df62d7057@gmail.com>
 <7cb7a46b-8d2e-4f9e-9613-f7a4199096ee@suse.com>
 <8741800f-b40b-4c42-b435-91e2f9375f6c@gmail.com>
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
In-Reply-To: <8741800f-b40b-4c42-b435-91e2f9375f6c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 10:40, Oleksii Kurochko wrote:
> On 6/25/25 5:53 PM, Jan Beulich wrote:
>> On 25.06.2025 17:31, Oleksii Kurochko wrote:
>>> On 6/18/25 6:08 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> @@ -14,6 +18,29 @@
>>>>>    
>>>>>    /* Per-p2m-table state */
>>>>>    struct p2m_domain {
>>>>> +    /*
>>>>> +     * Lock that protects updates to the p2m.
>>>>> +     */
>>>>> +    rwlock_t lock;
>>>>> +
>>>>> +    /* Pages used to construct the p2m */
>>>>> +    struct page_list_head pages;
>>>>> +
>>>>> +    /* Indicate if it is required to clean the cache when writing an entry */
>>>>> +    bool clean_pte;
>>>>> +
>>>>> +    struct radix_tree_root p2m_type;
>>>> A field with a p2m_ prefix in a p2m struct?
>>> p2m_ prefix could be really dropped.
>>>
>>>>    And is this tree really about
>>>> just a single "type"?
>>> Yes, we don't have enough bits in PTE so we need some extra storage to store type.
>> My question wasn't about that, though. My question was whether in the name
>> "type" (singular) is appropriate. I didn't think you need a tree to store just
>> a single type.
> 
> I need tree to store a pair of <gfn, p2m_type>, where gfn is an index. And it seems
> to me a tree is a good structure for fast insert/search.

Hmm, I'm increasingly puzzled. I tried to emphasize that my question was towards
the singular "type" in the variable name. I can't see any relationship between
that and your reply. (And yes, using a tree here may be appropriate. There is a
concern towards memory consumption, but that's a separate topic.)

Having said that, aiui you don't use the two RSW bits in the PTE. Do you have
any plans there? If not, can't they be used to at least represent the most
commonly used types, such that the number of entries in that tree can be kept
(relatively) low?

>>>>> +    /*
>>>>> +     * Some IOMMUs don't support coherent PT walk. When the p2m is
>>>>> +     * shared with the CPU, Xen has to make sure that the PT changes have
>>>>> +     * reached the memory
>>>>> +     */
>>>>> +    p2m->clean_pte = is_iommu_enabled(d) &&
>>>>> +        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
>>>> The comment talks about shared page tables, yet you don't check whether
>>>> page table sharing is actually enabled for the domain.
>>> Do we have such function/macros?
>> We have iommu_hap_pt_share, and we have the per-domain hap_pt_share flag.
>>
>>> It is shared by implementation now.
>> I don't understand. There's no IOMMU support yet for RISC-V. Hence it's in
>> neither state - not shared, but also not not shared.
> 
> In downstream there is a support of IOMMU for RISC-V.

And there page tables are unconditionally shared? I'll be surprised if no
want/need for non-shared page tables would ever appear.

Jan

