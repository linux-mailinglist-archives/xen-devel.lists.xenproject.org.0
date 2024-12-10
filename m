Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 039409EB60E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852844.1266521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2yo-0006of-Mm; Tue, 10 Dec 2024 16:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852844.1266521; Tue, 10 Dec 2024 16:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2yo-0006mF-K1; Tue, 10 Dec 2024 16:20:58 +0000
Received: by outflank-mailman (input) for mailman id 852844;
 Tue, 10 Dec 2024 16:20:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL2yn-0006gz-FE
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:20:57 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb825052-b712-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 17:20:55 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so2639528f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 08:20:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fdde228459sm1697539a12.40.2024.12.10.08.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 08:20:54 -0800 (PST)
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
X-Inumbo-ID: bb825052-b712-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733847655; x=1734452455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TJWHtqg7dHTZgr9KAeu3wq9Ix5+1j1Kkx+wn30IbGEI=;
        b=Sbjvndk952xkVpWAACNbrdRQzf1Wo5iv0HxNrjR494JKmJNhNMCHXKLIcFbgkIEktq
         W726sbFQFrVkSIanuFP17Epafxlo2iQF3Y62fUxbCNY72bmTX/z5YwdtmedIMXpJa1xD
         GaFo2FPfuO+tPRLXgNQQD3n5LIlEcMtHZGSLf0XyX1xIENHqk95Q/pbfXCbgokgyX/dZ
         YwJVh8Tnnv6M4bEakj95uQ/X3x3w/U3XH216sO9P2WM4aDR+a9zrN4VR9jdQnNZ/ICS8
         7S5cJA/j7jzpCbV1UaAW7mZdeD0X00wxiiGdzrPmV6SHqxTOe3QDA5KVc4taafTOliAs
         MPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847655; x=1734452455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJWHtqg7dHTZgr9KAeu3wq9Ix5+1j1Kkx+wn30IbGEI=;
        b=DCs5x9OrAGHLphSR7kpMstqj2KmE1c34J2i5NBjQP7DLx5IgZzmW14kipRfjI2WECd
         g2omaP+Y+TiCoJ8mLZasLcG2A7dtLSj/jVoT+06j2pxQUj2o5Ddz6t8eufSmby6nK8I7
         KBojUF/fWYWqL3vnWI++yQz3F2bpYu30DA4EVrl+wuM3SOcbLPx9YFB3wjDobOfXqj+s
         4MYpreWpx0jObqhN9OF/keyFXoOmvZhTtocaByaDUd5bahyCTlWj5bT3PZV3yHRkrcJP
         17K45dTdoiaVsV+ZSDU6Z8ZTax8xqmukrj6k0OuXooq75LKxqhoeZ7FWSaNa3MeYRbO2
         YD9w==
X-Forwarded-Encrypted: i=1; AJvYcCUnNCPIYAwgU9dL6uXK0s+00eZtMBnwPEbl/VdylZbQfB+ZhRrmqM7wCbXTdpg/QFl9VW3XtOgFtC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTtzUy96h12MTvmH7Eom7Hmqo2rVa7z3zDohS6g3FkP4ZDSs72
	AKej+4LeULswAJfAs2GycQchjVL0axlJhodgoWl7kdbs67xtIvyQeBgk8zEPiQ==
X-Gm-Gg: ASbGncvgt7aA2NripKCxL025kvJSt1XQIyjZu6G1vFG+lcp+3ywOK9OUVaQtpbMZ92+
	U52Q4yL6QWBGuRfvzrKf3Xvamqo6YbBFEG1Y1cstDXTP+Qcj+mGo+8686bzxkGMyZEaPk22dY/l
	X9mFU/FXKxAWvtxmxgQVaH52+mxN5hCoCcsNaKo9o5giApdXYENvVqfTR9nlV6T1DORzKi6Ew3Y
	+DNkUVwsDnXbQtDQToXdDQnZU5iTDuD6aPW2LlGBybkKbNtmDjdIj3lZ/lqDPkxSzVSJ0cnN0GG
	jpeKKVNG7mI52gGMBwSnKVAzrgmagFNCXyZfIus=
X-Google-Smtp-Source: AGHT+IGCL0ALXcGOZeBsCP4hpuiIT0N4jx5LCt6lX2ugg3Bowoj8gV/kD6liD4gBac3OaOMwjUY1dA==
X-Received: by 2002:a05:6000:18a5:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-386453fbc6emr4049678f8f.36.1733847655043;
        Tue, 10 Dec 2024 08:20:55 -0800 (PST)
Message-ID: <929d657d-ffe8-4243-ba01-fffa20b26205@suse.com>
Date: Tue, 10 Dec 2024 17:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen/riscv: implement relocate_fdt()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <c157b03a8cb6d9c4910136b5d73260b47c55554e.1732709650.git.oleksii.kurochko@gmail.com>
 <d9fddba7-8364-45a6-addd-004dbde366a5@suse.com>
 <4dd6a2e9-d2b9-4402-907b-b9314d2346f7@gmail.com>
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
In-Reply-To: <4dd6a2e9-d2b9-4402-907b-b9314d2346f7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 16:20, Oleksii Kurochko wrote:
> On 12/9/24 4:00 PM, Jan Beulich wrote:
>> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>>> relocate_fdt() relocates FDT to Xen heap instead of using early mapping
>>> as it is expected that discard_initial_modules() ( is supposed to call
>>> in the future ) discards the FDT boot module and remove_early_mappings()
>>> destroys the early mapping.
>>>
>>> To implement that the following things are introduced as they are called
>>> by internals of xmalloc_bytes() which is used in relocate_fdt():
>>> 1. As RISC-V may have non-coherent access for RAM ( f.e., in case
>>>     of non-coherent IO devices ) flush_page_to_ram() is implemented
>>>     to ensure that cache and RAM are consistent for such platforms.
>> This is a detail of the page allocator, yes. It can then be viewed as also
>> a detail of xmalloc() et al, but I consider the wording a little misleading.
>>
>>> 2. copy_from_paddr() to copy FDT from a physical address to allocated
>>>     by xmalloc_bytes() in Xen heap.
>> This doesn't look to be related to the internals of xmalloc() et al.
>>
>>> 3. virt_to_page() to convert virtual address to page. Also introduce
>>>     directmap_virt_end to check that VA argument of virt_to_page() is
>>>     inside directmap region.
>> This is a need of free_xenheap_pages(), yes; see remark on point 1.
> 
> Actually I faced the usage of virt_to_page() in xmalloc_whole_page():
> ```
>    static void *xmalloc_whole_pages(unsigned long size, unsigned long align)
>    {
>      ...
>      PFN_ORDER(virt_to_page(res)) = PFN_UP(size);
>      /* Check that there was no truncation: */
>      ASSERT(PFN_ORDER(virt_to_page(res)) == PFN_UP(size));
> 
>      return res;
>    }
> ```
> which is called from xmalloc().
> 
> Do we need a second paragraph of the commit message at all? Or it is just obvious if
> flush_page_to_ram(), virt_to_page() and copy_from_paddr() are introduces that they are needed for
> relocate_fdt()?
> 
> Or perhaps rephrasing in the following way would be enough?
> ```
> For internal use of|xmalloc|, the functions|flush_page_to_ram()| and|virt_to_page()| are introduced.
> |virt_to_page()| is also required for|free_xenheap_pages()|. These additions are used to support
> |xmalloc|, which is utilized within|relocate_fdt()|. Additionally,|copy_from_paddr()| is introduced
> for use in|relocate_fdt()|.
> ```

I think that would do.

>> Also recall my comment on one of your earlier series, regarding inclusive
>> vs exclusive ranges. Can that please be sorted properly as a prereq, to
>> avoid extending the inconsistency?
> 
> Yes, I remember that and at the moment everything ( DIRECTMAP_VIRT_END, FRAMETABLE_VIRT_END )
> is following "inclusive" way. Considering that you remind me that could you please tell me more time
> what I am missing?

First the table azt the top of config.h uses all exclusive upper bounds.
And then DIRECTMAP_SIZE's definition assumes DIRECTMAP_SLOT_END would be
exclusive, when it's inclusive.

>>> +        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
>>> +        memcpy(dst, src + s, l);
>>> +        clean_dcache_va_range(dst, l);
>> Why is this necessary here? You're copying to plain RAM that Xen alone
>> is using.
> 
> It is Arm specific:
> ```
> commit c60209d77e2c02de110ca0fdaa2582ef4e53d8fd
> Author: Stefano Stabellini<stefano.stabellini@eu.citrix.com>
> Date:   Mon Jan 21 12:40:31 2013 +0000
> 
>      xen/arm: flush dcache after memcpy'ing the kernel image
>      
>      After memcpy'ing the kernel in guest memory we need to flush the dcache
>      to make sure that the data actually reaches the memory before we start
>      executing guest code with caches disabled.
>      
>      copy_from_paddr is the function that does the copy, so add a
>      flush_xen_dcache_va_range there.
> ```
> I wanted to put copy_from_paddr() to some common place at the end but in RISC-V cache is always enabled
> ( I don't see an instruction in the spec for disable/enable cache ) so this issue isn't present for RISC-V
> and clean_dcache_va_range() should/could be dropped.

That plus there's no kernel in sight just yet.

Jan

