Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56724AB968C
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 09:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986386.1371950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpUp-0004gp-LT; Fri, 16 May 2025 07:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986386.1371950; Fri, 16 May 2025 07:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFpUp-0004eJ-Hu; Fri, 16 May 2025 07:28:43 +0000
Received: by outflank-mailman (input) for mailman id 986386;
 Fri, 16 May 2025 07:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFpUo-0004eB-K6
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 07:28:42 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c9c5995-3227-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 09:28:28 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ace333d5f7bso308488266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 00:28:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06cdccsm107153266b.49.2025.05.16.00.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 00:28:27 -0700 (PDT)
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
X-Inumbo-ID: 5c9c5995-3227-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747380508; x=1747985308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jB7fVrQoyA+r4vLcvPaB1ddQ0Xr11hBWRr6evsrcrD8=;
        b=PC696R470nUP6+xSCo/tY4XNDgQVgyLHORGV49kFgn+ZJvIm8e1hkiKIwNFXv7mRQ4
         J98qc4GxgBA5UKjTF6Km4QwvvQ3NHjnydvSzNYW/Po0OkVQVXK2l32rX9vDD7tKx3yzH
         8ESLB6+K9K5M+I/ZMn1pTp93a2mSG/zhp6TWf+xHnU+bIS8aVLqkLHOiWJJ8Sk0hjEBi
         hkY1AqmQyk+aXjK5ZNXV+kcKc0IgbQM8mUPDZxIrGh5jsmPL+wLGM5sSesE5sjRkEyOR
         CqynScL/hrXmUXhVNweL1DQMJdC3l/RSH1kYwqJfhzIuGacruaNkr9ETC6LpL3D6plx1
         /Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747380508; x=1747985308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB7fVrQoyA+r4vLcvPaB1ddQ0Xr11hBWRr6evsrcrD8=;
        b=SHhTF4UKYh91ArxRIuc1sOaKWP9bDnpAR3GF9pTXqfP4TbdIqeexjhBbp5ONhT4g5K
         +XMxlFdLwpElEIm1/juapujIL4u0Dxga5vDgmpWPM/bARDCjyQo+g+qPqg8H09bXnUjT
         FDPMo45TIxArvbpRnm3Tv6k67JodxqeKjEnmQWJ8dtflqpYVEWOs3yBC0Z5jLVFaSOig
         SiV7HBzefVq6D3ZkGHAmrH1DQRXk/VV18PCJfYTKIPKeJ7uQjpyRG+WXu8MYp/6dM7la
         FPOYalG+4fSg+K2jp16fEKrciaa0pG2pgYCIAD7p5mC8avPM7jE6uzBitk3pJkhBTrPk
         zBAg==
X-Forwarded-Encrypted: i=1; AJvYcCXpcCrR8i+RuyOqqjve+kEM/TUWqH8iuBR8wanrzDMOU385uCAK14KsyU4UmKtw5W72fUJ4dJO9IhE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEzV9iZhXlrTsXnKb2pfx2HkixQSreyL8BBch2l1THHLWgbMnF
	Y2rRwyiurrakAy/64v6LBPfwJ+ESzGdhvwHp5onDkAS1SdX7MsYuEV4neQdK2TecyQ==
X-Gm-Gg: ASbGncv+fFWzkwx4srowIwcrpTkE+MODsCu7ew114cBRW5c4iIv3DdzXfRz+OzMs/4W
	zBsKVP+LY7IJtXDGDvGx10WsZUKMQx6tz+ukW1SPM5Zd9dHoc8rJXF0mxVvvSx2H5li43FYXY2w
	vDWbxcq9pgotejtqWXV+qbwkXQCUb2oUA9aZg1xAmuIBuFcChw5vwgbDt+blhbsllLFou3ZR4tC
	jQQOdZA/PqnHUPoDwkKsz/QxWXRSokiaa0lvUghxOFeJN8kg8V+ETiGTB5jgEMZc3FQBCz8HlC6
	FRcd4oMVt53pNDuks0AfuMCbDospoup6rQqwjpG+9CM69T6KD63RcNnnbrlFWu+cY+ww6gwqLcm
	cYn6VEdyYCH2BBQRwTlRkMsIqLoSF/Eby+S8sLlI8VF16FFQ=
X-Google-Smtp-Source: AGHT+IHcwCuMWyWR04moZN2Lxw2polE70sMCCy0v5MRtbBSxCpwFv6WzGnLiHhwnaXHXn/xPxUVRGg==
X-Received: by 2002:a17:907:94ce:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ad536bde67bmr135842266b.20.1747380508183;
        Fri, 16 May 2025 00:28:28 -0700 (PDT)
Message-ID: <6e37d964-5df8-4685-934b-0f8d31048123@suse.com>
Date: Fri, 16 May 2025 09:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250515084123.43289-1-roger.pau@citrix.com>
 <8b0fa959-6d00-4bfb-bef0-b3d1ae7ce7e0@suse.com>
 <aCW9vfNEsDFLbE-y@macbook.lan>
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
In-Reply-To: <aCW9vfNEsDFLbE-y@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.05.2025 12:11, Roger Pau Monné wrote:
> On Thu, May 15, 2025 at 11:24:59AM +0200, Jan Beulich wrote:
>> On 15.05.2025 10:41, Roger Pau Monne wrote:
>>> For once the message printed when a BAR overlaps with a non-hole regions is
>>> not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
>>> is quite likely overlapping with a reserved region in the memory map, and
>>> already mapped as by default all reserved regions are identity mapped in
>>> the p2m.  Fix the message so it just warns about the overlap, without
>>> mentioning that the BAR won't be mapped, as this has caused confusion in
>>> the past.
>>>
>>> Secondly, when an overlap is detected the BAR 'enabled' field is not set,
>>> hence other vPCI code that depends on it like vPCI MSI-X handling won't
>>> function properly, as it sees the BAR as disabled, even when memory
>>> decoding is enabled for the device and the BAR is likely mapped in the
>>> p2m.  Change the handling of BARs that overlap non-hole regions to instead
>>> remove any overlapped regions from the rangeset, so the resulting ranges to
>>> map just contain the hole regions.  This requires introducing a new
>>> pci_sanitize_bar_memory() that's implemented per-arch and sanitizes the
>>> address range to add to the p2m.
>>>
>>> For x86 pci_sanitize_bar_memory() removes any regions present in the host
>>> memory map, for ARM this is currently left as a dummy handler to not change
>>> existing behavior.
>>>
>>> Ultimately the above changes should fix the vPCI MSI-X handlers not working
>>> correctly when the BAR that contains the MSI-X table overlaps with a
>>> non-hole region, as then the 'enabled' BAR bit won't be set and the MSI-X
>>> traps won't handle accesses as expected.
>>
>> While all of this reads plausible, I may need to look at this again later,
>> to hopefully grok the connections and implications.
> 
> Thanks, it's indeed not trivial to follow.  I've attempted to write
> this as best as I could.
> 
> I think the fix is far easier to understand than the description of
> the issue and the connection with vPCI MSI-X handling.

Right - the code change itself looks technically fine to me.

>>> --- a/xen/arch/x86/include/asm/pci.h
>>> +++ b/xen/arch/x86/include/asm/pci.h
>>> @@ -2,6 +2,7 @@
>>>  #define __X86_PCI_H__
>>>  
>>>  #include <xen/mm.h>
>>> +#include <xen/rangeset.h>
>>
>> Please don't, ...
>>
>>> @@ -57,14 +58,7 @@ static always_inline bool is_pci_passthrough_enabled(void)
>>>  
>>>  void arch_pci_init_pdev(struct pci_dev *pdev);
>>>  
>>> -static inline bool pci_check_bar(const struct pci_dev *pdev,
>>> -                                 mfn_t start, mfn_t end)
>>> -{
>>> -    /*
>>> -     * Check if BAR is not overlapping with any memory region defined
>>> -     * in the memory map.
>>> -     */
>>> -    return is_memory_hole(start, end);
>>> -}
>>> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
>>> +int pci_sanitize_bar_memory(struct rangeset *r);
>>
>> ... all you need is a struct forward decl here.
> 
> Hm, but any user that makes use of pci_sanitize_bar_memory() will need
> to include rangeset.h anyway, hence it seemed better to just include
> the header rather that pollute the current one by adding forward
> declarations.

Yet any user of the header not calling this function won't need the full
definition of the struct, nor (perhaps) any other of the contents of
xen/rangeset.h.

Jan

