Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B2A25A44
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880570.1290651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tew48-0001R4-LF; Mon, 03 Feb 2025 13:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880570.1290651; Mon, 03 Feb 2025 13:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tew48-0001PM-HK; Mon, 03 Feb 2025 13:00:40 +0000
Received: by outflank-mailman (input) for mailman id 880570;
 Mon, 03 Feb 2025 13:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tew47-0001PG-Q9
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:00:39 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd4e67e8-e22e-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 14:00:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so50896235e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:00:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a31f86sm758964866b.145.2025.02.03.05.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 05:00:37 -0800 (PST)
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
X-Inumbo-ID: dd4e67e8-e22e-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738587638; x=1739192438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YWa4ThOO5PieqnaGvwLR3hzURa9GSzUouVWB9YXlCqI=;
        b=TLWwxHnMG8DTxduqR/ElPNLJuxJK4GuzQ318o3c1KQ6ti0hkC4TkWhT+0Rz6snaTxw
         5Df2uZZ2s/jSllNECP82wtoTq6X7uNovEkaLSIGXHAvJfRcZpFvCa8ooCBC3CBUEKzoV
         sbTKMbMXURU95/YV/HCqy3BGee1Pp8b/rVKCZyfiWmfpbOW554/gaGok8XEisUjdjlLM
         QudkwWfHlO9JrmxqgCpkSdraBue7oYL74sGczkTWFbwqXg+FPjE86Ad1vUqIWF+8HX5s
         btIb/+PFZBEq2tsjKRGaU/ZEgEttpBO9mkvS8JKhhA5UN5Cz3U1KT5Kj/EMmBh+RDvb7
         nXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587638; x=1739192438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWa4ThOO5PieqnaGvwLR3hzURa9GSzUouVWB9YXlCqI=;
        b=BsAk7nwe4iPnWc9Xx7R5SqY9Zkn3jMNeaiG7f+18JbUJPG9p9jAJsusfTsf33tf2/c
         TAAplpKkZ7HUg9qpqJOAbNpA57vqNRMgOQWEPjcqr4W43JAEIQ+CE/IOHCkaRrh8u5+P
         pT0qUJlKUH0ChGpdcgM6xK21EqFkgGaHTBVaBNf11G3DHM4Q1/FrQHODDhzFcR2pArxH
         DxK+NIeHNEzWWl7+Nen3B0FnWVViLmFwMMKw+QVnnlts6aAM9APHPUAsgizWwhwRJ/3j
         fsm5yNhjCcjm9ar1bqWVKmbGGJ5LZGjH7JNop050c2ncNEk0j1H787AIVjJnLGGleqIH
         XSvA==
X-Gm-Message-State: AOJu0YwTOBEfQ4GaD4nl2aanEABFQT/7w98ZBdFaMFX5Ikv5mMr/wpyE
	6UJfF0e4mRi9dvRpL5eIZkdVYlowee/j4akfNg7xSa6gJxeHax/Urk7FjbFXZUJPH7F90nfjw6w
	=
X-Gm-Gg: ASbGncs6oAkFp+wMDCMz1Yls3T/HWD2s7YBzU+Y3Py58QeD8eCVKL9r9fF4OZn9LL9U
	lguOnzl4s2SVDjewkB4VGfmH3csIxVVYEojQnF0hRL62JeIIQdA1BBNDsZoFCUK5qrdfBH6ONaY
	wUVKlyJmWCHH1cWE6Dk6lJrWduhOoIyWGJKdfgJIK8URHAi5Gva/JvkMRI1UUyeeBBEIiU1curr
	UCqqenhMRQWMDc1leRlTdqYYFk4Fsw+UqgTbx9tTdft9CTxxn2eRsLyY4OQMaoiRMNdOd4Islfe
	j9HUDow6sVikj8Q6DkxjxBTR6yJ81S2wBs9+V//oxnjiJU0Mp83e/aNQwoy/lEP0F+RRiybbNHO
	c
X-Google-Smtp-Source: AGHT+IEHmzJx6EpzP8liABYa1yD78oPSCK9QxYCTgtufdEg0h2g2U7a+nzdZKWgWnVUi2CAq4iCeNQ==
X-Received: by 2002:a5d:6c65:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38c5cd0efe3mr14606826f8f.11.1738587637528;
        Mon, 03 Feb 2025 05:00:37 -0800 (PST)
Message-ID: <e7eff762-ff80-440e-8a92-e5a5e09a97ce@suse.com>
Date: Mon, 3 Feb 2025 14:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/3] x86/PCI: init segments earlier
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
 <940ccd1b-9ad8-4b68-a035-36f45326872b@suse.com>
 <Z6C6fUeB4mFfGfJc@macbook.local>
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
In-Reply-To: <Z6C6fUeB4mFfGfJc@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 13:45, Roger Pau Monné wrote:
> On Thu, Jan 30, 2025 at 12:12:31PM +0100, Jan Beulich wrote:
>> In order for amd_iommu_detect_one_acpi()'s call to pci_ro_device() to
>> have permanent effect, pci_segments_init() needs to be called ahead of
>> making it there. Without this we're losing segment 0's r/o map, and thus
>> we're losing write-protection of the PCI devices representing IOMMUs.
>> Which in turn means that half-way recent Linux Dom0 will, as it boots,
>> turn off MSI on these devices, thus preventing any IOMMU events (faults
>> in particular) from being reported on pre-x2APIC hardware.
>>
>> As the acpi_iommu_init() invocation was moved ahead of
>> acpi_mmcfg_init()'s by the offending commit, move the call to
>> pci_segments_init() accordingly.
>>
>> Fixes: 3950f2485bbc ("x86/x2APIC: defer probe until after IOMMU ACPI table parsing")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course it would have been quite a bit easier to notice this issue if
>> radix_tree_insert() wouldn't work fine ahead of radix_tree_init() being
>> invoked for a given radix tree, when the index inserted at is 0.
>>
>> While hunting down various other dead paths to actually find the root
>> cause, it occurred to me that it's probably not a good idea to fully
>> disallow config space writes for r/o devices: Dom0 won't be able to size
>> their BARs (luckily the IOMMU "devices" don't have any, but e.g. serial
>> ones generally will have at least one), for example. Without being able
>> to size BARs it also will likely be unable to correctly account for the
>> address space taken by these BARs. However, outside of vPCI it's not
>> really clear to me how we could reasonably emulate such BAR sizing
>> writes - we can't, after all, allow Dom0 to actually write to the
>> underlying physical registers, yet we don't intercept reads (i.e. we
>> can't mimic expected behavior then).
> 
> For properly sizing the domain will also attempt to toggle the memory
> decoding bit ahead of sizing the BARs, and letting that trough will
> break the usage of the device from Xen.  IOW: we would likely need to
> emulate a fair amount of device state to make the view coherent from a
> guest PoV, but is it worth it for a device that the hardware domain
> cannot interact with?
> 
> Would it make more sense to just hide those devices instead of
> allowing read-only access to their PCI config space?

No, I don't think so. The original reason is still valid: We want such
devices to be enumerable by Dom0. Consider just this one implication
from us not permitting that: What if such a device is part of a multi-
function one, at func 0? Then we'd effectively hide all other devices
at the same bus/dev, too.

>> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
>> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
>> @@ -402,8 +402,6 @@ void __init acpi_mmcfg_init(void)
>>  {
>>      bool valid = true;
>>  
>> -    pci_segments_init();
>> -
>>      /* MMCONFIG disabled */
>>      if ((pci_probe & PCI_PROBE_MMCONF) == 0)
>>          return;
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -55,6 +55,8 @@ void __init acpi_iommu_init(void)
>>  {
>>      int ret = -ENODEV;
>>  
>> +    pci_segments_init();
> 
> My preference might be to just place the pci_segments_init() call in
> __start_xen(),

As said in reply to Andrew - I was considering doing so as an alternative
to the moving done here. I can certainly do so, in case some non-negative
reply comes back from him.

> instead of hiding it again in what might look like an
> unrelated function (there's no mention of PCI in acpi_iommu_init()
> function name for example).

Nor is there in acpi_mmcfg_init(). Irrespective of their names, both are
firmly tied to PCI.

Jan

