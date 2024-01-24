Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8791D83A3BD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670742.1043705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYIi-0008Jh-Fy; Wed, 24 Jan 2024 08:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670742.1043705; Wed, 24 Jan 2024 08:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYIi-0008H4-CR; Wed, 24 Jan 2024 08:08:00 +0000
Received: by outflank-mailman (input) for mailman id 670742;
 Wed, 24 Jan 2024 08:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYIh-0008Gy-4l
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:07:59 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af46d7b6-ba8f-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 09:07:58 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf108f6a2dso17984401fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:07:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c8-20020a056e020cc800b0036197f7f157sm2837097ilj.2.2024.01.24.00.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:07:56 -0800 (PST)
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
X-Inumbo-ID: af46d7b6-ba8f-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706083677; x=1706688477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oydzX1fgiau+XzsIwkm0mdErCi3ZW6pW/Kj3UVBTZDI=;
        b=IALKg70Zx7jFl71wJ9fd6jO/Ok3oZHNtje5nUr+qPBbbkn0ZVNABWn8aR3w+NKSSZc
         rO41aqxOrDeJ6zr/9LwjYqJxRIE+ppny/kJkFYS9KZ0/E+g5/tmvPkeqyz9Ki8CAWIPc
         Cfo5Iy1EwuNmN2TJEYmTiZOcyf/p6oo7kebSxVmZGHGsQ1U93kyrODoUdITnVwEJjXi5
         IKtXrJSziE4zRscK/y0r/mrcd+eAqDbx9D2TZc12aoT5ISE84vJEjiwK22Mg0MJ+ozVJ
         QnHduf24SrhPdGSSMpnCAD+WfWQKIVLQ6Uo9fhZzxqNOcFysvfHcfoPEzTAVN+SFv+QG
         6LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706083677; x=1706688477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oydzX1fgiau+XzsIwkm0mdErCi3ZW6pW/Kj3UVBTZDI=;
        b=FOptgTQaH9xAniNs7ql9l0ehA+6W9mT7/s3Y1xecNZ1dvURBtiPDur8yXGF411Jryl
         c1pgjm8InjenajVVBUqvRTOyQ97ybKQqEZycvwQGhJPqu9GieUFN0nexLLwpW9wUOOiP
         kLIFE+k9hKedxqZ0qisyTUE8OetFMLMdyDjhZ8Nai9s80wbG4DvaxJAeqM1kZdeXM7CW
         XO4A804+VozB2Bcpzu7mQmv0mx9LKKsMguWVSD6Kg82LXZoPxj9JUlcYl0cPy7gwLRwa
         p8JHJasbboAtaEC+YqFRDxYfRULhgHbVbi7cbuHFSQJMkW+anrN0lj5eQ7FG/ucbuoaj
         tukg==
X-Gm-Message-State: AOJu0YwyEOtADxtquhDm19UILjBmWWxZ6K1A+/D7qey9sOSzxgReYLfi
	1w1M65wwQiUnaYnnMEc1zpHJwrQiP4E0GlosDhvBrrnncdMdle4LFI8T7225AA==
X-Google-Smtp-Source: AGHT+IHFCklphROpCt7dbUm9nz7Vvd5QPBLRt6sGEH1A3gVytYNZas5nGdLDmv0c5uUNH+32wpR+Yg==
X-Received: by 2002:a2e:8916:0:b0:2cf:1b7b:11d2 with SMTP id d22-20020a2e8916000000b002cf1b7b11d2mr553716lji.105.1706083677371;
        Wed, 24 Jan 2024 00:07:57 -0800 (PST)
Message-ID: <b6dd4bff-d40a-47c7-9c18-913ed2bd07c1@suse.com>
Date: Wed, 24 Jan 2024 09:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 27/34] xen/riscv: define an address of frame table
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <d0a357e3b9597479b539e88915731b3f15489c04.1703255175.git.oleksii.kurochko@gmail.com>
 <39837f92-d139-49c3-9e5f-a79dd585f050@suse.com>
 <2267a8dc4b1be495be65c2d7e22378cd2394829c.camel@gmail.com>
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
In-Reply-To: <2267a8dc4b1be495be65c2d7e22378cd2394829c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 17:50, Oleksii wrote:
> On Tue, 2024-01-23 at 12:32 +0100, Jan Beulich wrote:
>> On 22.12.2023 16:13, Oleksii Kurochko wrote:
>>> @@ -22,25 +30,56 @@
>>>   *
>>>   * It means that:
>>>   *   top VA bits are simply ignored for the purpose of translating
>>> to PA.
>>> +#endif
>>>   *
>>> - *
>>> ===================================================================
>>> =========
>>> - *    Start addr    |   End addr        |  Size  | Slot      
>>> |area description
>>> - *
>>> ===================================================================
>>> =========
>>> - * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     |
>>> Unused
>>> - * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     |
>>> Fixmap
>>> - * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     |
>>> FDT
>>> - * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     |
>>> Xen
>>> - *                 ...                  |  1 GB  | L2 510     |
>>> Unused
>>> - * 0000003200000000 |  0000007F80000000 | 309 GB | L2 200-509 |
>>> Direct map
>>> - *                 ...                  |  1 GB  | L2 199     |
>>> Unused
>>> - * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 |
>>> Frametable
>>> - *                 ...                  |  1 GB  | L2 195     |
>>> Unused
>>> - * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     |
>>> VMAP
>>> - *                 ...                  | 194 GB | L2 0 - 193 |
>>> Unused
>>> - *
>>> ===================================================================
>>> =========
>>> + *       SATP_MODE_SV32   | SATP_MODE_SV39   | SATP_MODE_SV48   |
>>> SATP_MODE_SV57
>>> + *     
>>> ==================|==================|==================|==========
>>> =======
>>> + * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 |
>>> FFFF000000000000
>>> + * BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 |
>>> 00C8000000000000
>>> + * BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 |
>>> 00C4000000000000
>>> + * BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 |
>>> 00C2000000000000
>>>   *
>>> -#endif
>>> + *
>>> ===================================================================
>>> ============
>>> + * Start addr     |   End addr          |  Size  | Root PT slot |
>>> Area description
>>> + *
>>> ===================================================================
>>> ============
>>> + * BA0 + 0x800000 |  FFFFFFFFFFFFFFFF   |1016 MB |     511      |
>>> Unused
>>> + * BA0 + 0x400000 |  BA0 + 0x800000     |  2 MB  |     511      |
>>> Fixmap
>>> + * BA0 + 0x200000 |  BA0 + 0x400000     |  4 MB  |     511      |
>>> FDT
>>> + * BA0            |  BA0 + 0x200000     |  2 MB  |     511      |
>>> Xen
>>> + *                 ...                  |  1 GB  |     510      |
>>> Unused
>>> + * BA1 + 0x000000 |  BA1 + 0x4D80000000 | 309 GB |   200-509    |
>>> Direct map
>>
>> This definitely can't be right for SV32. Others may be problematic,
>> too, like ...
>>
>>> + *                 ...                  |  1 GB  |     199      |
>>> Unused
>>> + * BA2 + 0x000000 |  BA2 + 0xC0000000   |  3 GB  |   196-198    |
>>> Frametable
>>
>> ... this one. Otoh I'd expect both to potentially be much larger in
>> SV48 and SV57 modes.
> Regarding Sv32, it looks to me the only BA0 and End addr at the first
> line isn't correct as address size is 32.
> 
> Regarding other modes, yes, it should be changed Size column. Also, the
> size of frame table should be recalculated.
> 
> Do we really need size column?
> 
> Wouldn't it be enough only have PT slot number?

Perhaps.

> Would it be better to have separate table for each mode?

Don't know.

>>> +#define VPN_BITS    (9)
>>
>> This need to move ...
>>
>>> +#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
>>> +
>>> +#ifdef CONFIG_RISCV_64
>>
>> ... here, I think, for not being applicable to SV32?
> You are right, it is not applicable for Sv32. In case of Sv32, it
> should be 10.
> But I am not sure that it is correct only to move this definition as
> RISCV-64 can also use Sv32. So it looks like VPN_BITS should be "#ifdef
> RV_STAGE1_MODE == Sv32".

Can it? The spec talks of SXLEN=32 implying SV32, while SXLEN=64 permits
SV39, SV48, and SV57. No mention of SV32 there.

>>> +#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS +
>>> PAGE_SHIFT)
>>> +#define SLOTN(slot)             (_AT(vaddr_t, slot) <<
>>> SLOTN_ENTRY_BITS)
>>> +#define SLOTN_ENTRY_SIZE        SLOTN(1)
>>
>> Do you have any example of how/where this going to be used?
> Yes, it will be used to define DIRECTMAP_SIZE:
> #define DIRECTMAP_SIZE          (SLOTN_ENTRY_SIZE * (509-200))

How about

#define DIRECTMAP_SIZE          (SLOTN(509) - SLOTN(200))

instead?

>>> +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 -
>>> GB(1)) */
>>
>> Won't /* -GB(1) */ do, thus allowing the line to also be padded such
>> that
>> it matches neighboring ones in layout?
> Could you please clarify what do you mean by padded here? The intention
> was to show that 1 GB is used for Xen, FDT and fixmap.

I'm talking of blank padding in the source file. Note how preceding and
following #define-s blank-pad expansions so they all align. Just this
one in the middle does not.

Jan

>>> +#define FRAMETABLE_VIRT_START   SLOTN(196)
>>> +#define FRAMETABLE_SIZE         GB(3)
>>> +#define FRAMETABLE_NR           (FRAMETABLE_SIZE /
>>> sizeof(*frame_table))
>>> +#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START +
>>> FRAMETABLE_SIZE - 1)
>>> +
>>> +#define VMAP_VIRT_START         SLOTN(194)
>>> +#define VMAP_VIRT_SIZE          GB(1)
>>> [...]
>>
> 


