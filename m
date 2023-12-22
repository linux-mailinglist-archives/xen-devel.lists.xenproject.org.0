Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A449B81C63E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 09:10:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659249.1028770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGaad-0002Xj-8F; Fri, 22 Dec 2023 08:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659249.1028770; Fri, 22 Dec 2023 08:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGaad-0002Vs-3m; Fri, 22 Dec 2023 08:09:03 +0000
Received: by outflank-mailman (input) for mailman id 659249;
 Fri, 22 Dec 2023 08:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGaab-0002VW-AL
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 08:09:01 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bb659db-a0a1-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 09:08:59 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d483019d9so1794575e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 00:08:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b0040d378510adsm8663243wmq.1.2023.12.22.00.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 00:08:57 -0800 (PST)
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
X-Inumbo-ID: 5bb659db-a0a1-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703232538; x=1703837338; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iIot8+NpCUGBFT252AzQPoBtCvAJRNXPuQIXfUMk7l0=;
        b=fu0KUGCZMEvjwFPAPL1c7sGZk5kaCooBUZMVHKIJy9LA0a1FjZrosx8A99PpuNEWpu
         sUvxW9y9toarirGCbt/ZDtASy2t/QRs/jx+L3lTxdBHjfpipSIx4+VKJgKKGVmi1zcUH
         opmf58pEP2toNOP2rPqsQzNWOFm9dOB3enWaCRYKWnvsFEAMFGMqkG3w0d2Fe0rPFnOJ
         5mSFYUuNGP8Rv7W9YiuY1308gC97CI3pwuoKeKOCPsbJ4+qfcaP6vid1OUYJIv+oLMRH
         PNVRBq1LAryIr4ZZ2Eq4tw2XIHzFwF9Up9W9sywyYCqIzfniUKmBtTcBKjx9fgTt2Lh1
         RToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703232538; x=1703837338;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIot8+NpCUGBFT252AzQPoBtCvAJRNXPuQIXfUMk7l0=;
        b=Q5/X7ugJu7TaiHujHYIvXKMiaQZivOs+EVJ4E6L0mNR/Gc7ttgzRH4TPFvoJPMNt+r
         tDWMTmYbR2LvDr9Wa+OEhaQeuf0xW+3Eyb3Jr0A5cO2FHi2U3BKoqoLHWSMau9diVW+F
         Qt4b8CdaVSBXoctYWvNpJx9fDSvvBXtrtpcHFV7/r4elUwJJmedCL4xtyWxkaLPqswPh
         pWhRVQtp8NnfB4wFW9iO+YzGI7D+2WQ32gLijTWDkS8Rv/9wZneXlvBeU4lo5XDAL+Cv
         lXoFOOGVQJmNmQzv4TJbD7EYOZk1UNZi/rgTXyATq6K3wRm/rrenOxagkjSxS3G0YilW
         jktA==
X-Gm-Message-State: AOJu0YyvEesz3LpIKYKLh28RDAytgcNXbqRfYbYVxxHHhq0UFzAZx/ZU
	2bS0GmesMKz7ASq86Ne+tzr7daDaTBth
X-Google-Smtp-Source: AGHT+IH9Zn7CPU6KU9E8JSnk1x7O5CUnme6rmXo5YaRxRBkN14LkJ9dKgvTuiGCpRAHTk58UFC//lg==
X-Received: by 2002:a05:600c:4ecf:b0:40d:3ae6:4a42 with SMTP id g15-20020a05600c4ecf00b0040d3ae64a42mr481803wmq.99.1703232537923;
        Fri, 22 Dec 2023 00:08:57 -0800 (PST)
Message-ID: <03651b8f-238a-4d64-8595-6b814a118d87@suse.com>
Date: Fri, 22 Dec 2023 09:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: define an address of frame table
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
 <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
 <5d3e7f9ad7ff0eb779e269eee1c42300d987b5a1.camel@gmail.com>
 <abacb997-99f4-49c3-b146-320cc9ff1a90@suse.com>
 <8deb45febe3d8061bca4a8376c280befeaa00fed.camel@gmail.com>
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
In-Reply-To: <8deb45febe3d8061bca4a8376c280befeaa00fed.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.12.2023 20:59, Oleksii wrote:
> On Mon, 2023-12-18 at 12:22 +0100, Jan Beulich wrote:
>> On 18.12.2023 11:36, Oleksii wrote:
>>> On Thu, 2023-12-14 at 16:48 +0100, Jan Beulich wrote:
>>>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>>>> +#define SLOTN_ENTRY_SIZE        SLOTN(1)
>>>>> +
>>>>>  #define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1
>>>>> -
>>>>> GB(1)) */
>>>>> +
>>>>> +#define FRAMETABLE_VIRT_START   SLOTN(196)
>>>>> +#define FRAMETABLE_SIZE         GB(3)
>>>>> +#define FRAMETABLE_NR           (FRAMETABLE_SIZE /
>>>>> sizeof(*frame_table))
>>>>> +#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START +
>>>>> FRAMETABLE_SIZE - 1)
>>>>> +
>>>>> +#define VMAP_VIRT_START         SLOTN(194)
>>>>> +#define VMAP_VIRT_SIZE          GB(1)
>>>>
>>>> May I suggest that you keep these blocks sorted by slot number?
>>>> Or
>>>> wait,
>>>> the layout comment further up is also in decreasing order, so
>>>> that's
>>>> fine here, but then can all of this please be moved next to the
>>>> comment
>>>> actually providing the necessary context (thus eliminating the
>>>> need
>>>> for
>>>> new comments)?
>>> Sure, I'll put this part close to layout comment.
>>>
>>>>  You'll then also notice that the generalization here
>>>> (keeping basically the same layout for e.g. SATP_MODE_SV48, just
>>>> shifted
>>>> by 9 bits) isn't in line with the comment there.
>>> Does it make sense to add another one table with updated addresses
>>> for
>>> SATP_MODE_SV48?
>>
>> Well, especially if you mean to support that mode, its layout surely
>> wants writing down. I was hoping though that maybe you/we could get
>> away
>> without multiple tables, but e.g. use one having multiple columns.
> I came up with the following but I am not sure that it is really
> convient:
> /*
>  * RISC-V64 Layout:
>  *
> #if RV_STAGE1_MODE == SATP_MODE_SV39
>  *
>  * From the riscv-privileged doc:
>  *   When mapping between narrower and wider addresses,
>  *   RISC-V zero-extends a narrower physical address to a wider size.
>  *   The mapping between 64-bit virtual addresses and the 39-bit usable
>  *   address space of Sv39 is not based on zero-extension but instead
>  *   follows an entrenched convention that allows an OS to use one or
>  *   a few of the most-significant bits of a full-size (64-bit) virtual
>  *   address to quickly distinguish user and supervisor address
> regions.
>  *
>  * It means that:
>  *   top VA bits are simply ignored for the purpose of translating to
> PA.
> #endif
>  *
>  *       SATP_MODE_SV32   SATP_MODE_SV39   SATP_MODE_SV48  
> SATP_MODE_SV57
>  *     ----------------------------------------------------------------
> -----------
>  * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 |
> FFFF000000000000
>  * BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 |
> 00C8000000000000
>  * BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 |
> 00C4000000000000
>  * BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 |
> 00C2000000000000
>  * 
>  *
> =======================================================================
> =====
>  * Start addr    |   End addr           |  Size  | Slot       |area
> description
>  *
> =======================================================================
> =====
>  * BA0 + 0x800000 |  FFFFFFFFFFFFFFFF   |1016 MB |
> L${HYP_PT_ROOT_LEVEL} 511     | Unused
>  * BA0 + 0x400000 |  BA0 + 0x800000     |  2 MB  |
> L${HYP_PT_ROOT_LEVEL} 511     | Fixmap
>  * BA0 + 0x200000 |  BA0 + 0x400000     |  4 MB  |
> L${HYP_PT_ROOT_LEVEL} 511     | FDT
>  * BA0            |  BA0 + 0x200000     |  2 MB  |
> L${HYP_PT_ROOT_LEVEL} 511     | Xen
>  *                 ...                  |  1 GB  |
> L${HYP_PT_ROOT_LEVEL} 510     | Unused
>  * BA1 + 0x000000 |  BA1 + 0x4D80000000 | 309 GB |
> L${HYP_PT_ROOT_LEVEL} 200-509 | Direct map
>  *                 ...                  |  1 GB  |
> L${HYP_PT_ROOT_LEVEL} 199     | Unused
>  * BA2 + 0x000000 |  BA2 + 0xC0000000   |  3 GB  |
> L${HYP_PT_ROOT_LEVEL} 196-198 | Frametable
>  *                 ...                  |  1 GB  |
> L${HYP_PT_ROOT_LEVEL} 195     | Unused
>  * BA3 + 0x000000 |  BA3 + 0x40000000   |  1 GB  |
> L${HYP_PT_ROOT_LEVEL} 194     | VMAP
>  *                 ...                  | 194 GB |
> L${HYP_PT_ROOT_LEVEL} 0 - 193 | Unused
>  *
> =======================================================================
> =====
>  */
> 
> Do you have better ideas?

It doesn't look too bad imo, at the first glance, albeit the line
wrapping damage of course makes it a little hard to look at. In the
last table with all lines saying L${HYP_PT_ROOT_LEVEL}, perhaps that
could be put in the table heading (instead of "Slot" say e.g. "Root
PT slot")?

Jan

