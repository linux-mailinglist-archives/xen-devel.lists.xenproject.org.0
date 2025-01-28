Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49DCA205C1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 09:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878300.1288464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcgk4-0006M1-Ci; Tue, 28 Jan 2025 08:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878300.1288464; Tue, 28 Jan 2025 08:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcgk4-0006KE-9u; Tue, 28 Jan 2025 08:14:40 +0000
Received: by outflank-mailman (input) for mailman id 878300;
 Tue, 28 Jan 2025 08:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcgk2-0006K8-Ig
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 08:14:38 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e98608c4-dd4f-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 09:14:36 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso396672366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 00:14:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e8acb6sm729427166b.76.2025.01.28.00.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 00:14:35 -0800 (PST)
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
X-Inumbo-ID: e98608c4-dd4f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738052076; x=1738656876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jt+nWAV1QZZp5qIssMiiKcXqaKaLPDo+PVRL+RMiBkM=;
        b=Y6EOeLxPIA/52/Mbx+5ryt0c9D6rKtkj1pvJrQpWq1BZff9kd4h9flMPVFKhjPLvku
         64Ze/tie8itt/jiR28ahwz4aQpU91tJ3uiS7ux6rG8Q/e0d1l+ymbQATlXTT05oAln6K
         EjnT72jbikrTVdNvvl5z+3CKauMMFDwohoo+0gJrXyEdCvDvGMuQ7v7WKMn5PzmTAZSU
         LjrHWHM+fbHHiD08F7WfMRVmKwI3hEXLmiC4fSrkj3dsyD5YEwJe/IVKlLzvpIYcY9Yt
         XXEZeAW5XZ6wQA609YAr8GSDwKBiAciiUtt5NdfpdzPAMdUeKbOeAYikNSGJrs9pQJqu
         Lidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738052076; x=1738656876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt+nWAV1QZZp5qIssMiiKcXqaKaLPDo+PVRL+RMiBkM=;
        b=GoGvT+9stNGSiJ4y/567MxgCjOaXFM/FzB6V0lo1wHAE4q/h4zKE6s83cinIFwB5R1
         nYv+h5ArfsWidUNo5D2bIeiUy3omFeqq/5bjlZhnfH+nOuZrKL8PsIWJl8BaW0WhIkzm
         x171m+GkJegKvQivcHKUhU8ffxgkHlHVfXwo/zOchTfEeHCNxvWKHA/el8gpdRCtU/HF
         XD3JrxqtYXAtNeVINrcvdbzgWi85UXjMzdQPJ2G7m95EB/V0CNzwbJt7lEOAX88luY/e
         QmJmzJi29cbwVXhSkVKXXC6cMWzg0bPWe1dtYQa0l33wdpycJ2LY2CkXk16gDH4oP/hh
         aA+g==
X-Forwarded-Encrypted: i=1; AJvYcCVtRigucin7lO0ibLAhWrmyTR6VahawoyrRbfarSpvnpbpP/om6GrbADxYq1uHaaVrn2N/JPSJc8V8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn4zME8CDl7jTjh0Od2AihSRXM3jQchA0sYOOCA6TsDF+xyHdp
	GOPR1iEiO2po8u24NFuy1it1nuYb2v3BCsImEeNcgk8GVaKJRMV2UxhClvVx9w==
X-Gm-Gg: ASbGncveoy6HRx8J6lAOPPRRcu2wusG/Itg5Jjbxql5WlbT9FbBC6JugoNamBqzBaBy
	47aGhgqcX7+zT0H4Nxw632MvXy3lSdWXQUtAtKymjETtBic98FuAXgHzhZ2CGSSPbZm4XqzftsA
	Dje1RtSPdDy2uvWQ7xnh6WRHFiYdDF691HonAKQaALkWJy0vGzzaCZRe6z0Lpi0f+bw+FVwCKIf
	YnYBa6Vd+X2GbExaXDd0ksQQUsZ897DzqdJY4mAsfRwJWp4THSYUAU/DWm9nFzJ++d1yZ0AYaA9
	iUU9abdU/zmuUhj1nWbRYZ7FdbgzyxxdfRA9iRu9ZWFvTCPvtduWxixyOT5sMbBHsrr3mhVeO6Z
	s
X-Google-Smtp-Source: AGHT+IFQns2SVbOey2WYscX7kXf23MwBEcXmK7GTnLucdRqGrccHBskp9mYlmrt2fsqnPBfWRbVWXA==
X-Received: by 2002:a17:907:1b24:b0:aa6:7b34:c1a8 with SMTP id a640c23a62f3a-ab38b3d664emr3400947366b.55.1738052075832;
        Tue, 28 Jan 2025 00:14:35 -0800 (PST)
Message-ID: <dfe0c6c5-db4a-4e27-9963-fe1b0c2bf629@suse.com>
Date: Tue, 28 Jan 2025 09:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: implement software page table walking
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <00dfc71569bc9971b53e29b36a80e9e020ac61ac.1737391102.git.oleksii.kurochko@gmail.com>
 <21bfd2f5-74b8-409e-956c-dd736a3c0be2@suse.com>
 <e2290a2a-a3c0-4cfe-b9e9-8cfec0b194a8@gmail.com>
 <a304e4f0-709f-4fcd-9847-01fe6ab4b98c@suse.com>
 <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
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
In-Reply-To: <d9ca4252-1bf0-4257-ad6b-e91240cc5de3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2025 18:22, Oleksii Kurochko wrote:
> On 1/27/25 1:57 PM, Jan Beulich wrote:
>> On 27.01.2025 13:29, Oleksii Kurochko wrote:
>>> On 1/27/25 11:06 AM, Jan Beulich wrote:
>>>> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>>>>> RISC-V doesn't have hardware feature to ask MMU to translate
>>>>> virtual address to physical address ( like Arm has, for example ),
>>>>> so software page table walking in implemented.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>>> ---
>>>>>    xen/arch/riscv/include/asm/mm.h |  2 ++
>>>>>    xen/arch/riscv/pt.c             | 56 +++++++++++++++++++++++++++++++++
>>>>>    2 files changed, 58 insertions(+)
>>>>>
>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
>>>>> index 292aa48fc1..d46018c132 100644
>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>> @@ -15,6 +15,8 @@
>>>>>    
>>>>>    extern vaddr_t directmap_virt_start;
>>>>>    
>>>>> +paddr_t pt_walk(vaddr_t va);
>>>> In the longer run, is returning just the PA really going to be sufficient?
>>>> If not, perhaps say a word on the limitation in the description.
>>> In the long run, this function's prototype looks like|paddr_t pt_walk(vaddr_t root, vaddr_t va, bool is_xen)| [1]. However, I'm not sure if it will stay that way,
>>> as I think|is_xen| could be skipped, since using|map_table()| should be sufficient (as it now considers|system_state|) and I'm not really sure if I need root argument
>>> as initial goal was to use this function for debug only purposes and I've never used it for guest page table (stage-1) walking.
>>> Anyway, yes, it is still returning a physical address, and that seems enough to me.
>>>
>>> Could you share your thoughts on what I should take into account for returning value, probably, I am missing something really useful?
>> Often you care about the permissions as well. Sometimes it may even be relevant
>> to know the (super-)page size of the mapping.
> 
> Perhaps it would be better to change the prototype to:
>    bool pt_walk(vaddr_t va, mfn_t *ret_pa);
> or even
>    void pt_walk(vaddr_t va, mfn_t *ret_pa);
>    In this case,|ret_pa = INVALID_MFN| could serve as a signal that|pt_walk()| failed.
> If there's a need to return permissions or (super-)page size in the future, another argument could be added.
> 
> What do you think? Would this approach be better?
> 
> I am also considering returning a structure containing the|mfn| (or|paddr_t|) and adding other properties (such as permissions or
> page size) as needed in the future. Both solutions seem more or less equivalent.

Imo the most natural thing for a page walking function would be to return the
leaf PTE (or the leaf-most not-present [or otherwise "no-access"] one). That
would provide (almost) all possible information to the caller. "Almost"
because depending on how page walk works, permissions may combine across page
table levels. Yet then (see also the "no-access" above) this would also
require further input, to specify the context for which the translation is
being seeked. For example, the intention to write may want to yield no valid
PTE when there are present ones down to the leaf, but effective permissions
say "read-only".

Jan

