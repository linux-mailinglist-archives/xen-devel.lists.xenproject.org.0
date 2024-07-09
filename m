Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA16B92B0C1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 09:02:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755879.1164384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4rC-0002jX-36; Tue, 09 Jul 2024 07:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755879.1164384; Tue, 09 Jul 2024 07:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4rC-0002h6-0W; Tue, 09 Jul 2024 07:01:46 +0000
Received: by outflank-mailman (input) for mailman id 755879;
 Tue, 09 Jul 2024 07:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR4rA-0002fo-4E
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 07:01:44 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1835fd7d-3dc1-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 09:01:41 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ea1a69624so5527060e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 00:01:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b439b9555sm1035661b3a.198.2024.07.09.00.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 00:01:39 -0700 (PDT)
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
X-Inumbo-ID: 1835fd7d-3dc1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720508501; x=1721113301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dA98gXcCDPIk/pF33kneDy6d1TV3YJuGmg68ii6L554=;
        b=VjRvQi+w/KXLsJkN1AIw3S9MiIwk6YfrrqozLMBFyOfVojpSj78FpiHpVUT7oa7A2e
         /ZOX8DYzo1RE5BUZVKwairXyPbWVtxLgN7CjhNAfB9p2sUwlYKT0W1SdeVT/9QnsNIL2
         DdKKFw293C3Fq8vStKT+94fDvpi9Oo3JfwBxyAOx0lCYGZKVIl9RAEhJQVzfBVeec2M/
         6/1DwHU+OVbjMkghThjZ3HvmIsxZ6ahh8rLle/YF2SB0OC36n6al/lmeZc01LJK3VUF6
         tIqtLV4qbZprqaybHS64V0ZmU6dVHw7NSVP03sTZ7xkFCongA5pMQJPo/GaQ+ppXlfeg
         n0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720508501; x=1721113301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dA98gXcCDPIk/pF33kneDy6d1TV3YJuGmg68ii6L554=;
        b=ETbvA5HkRmJ6YzZuqf+PUlMecWsLwI6t6G6A8P+/x18L7HZhPzsluIPXnHnPERdQqq
         mvkanAwD2e4B2w+SSIcXHCW6SRr+/Gpa6pGqXJPN6x6VwEjbXoAfCA0rzMAn4gTY8Rcw
         MuCAG5j1M3q4FvhIQLEzv+15ppdwPtg6kfV+mF4dDEsmHkCyPAaxZIz0itFwMFNcQBUc
         dcoAgrmrQTLl8rH5LQoJzWJAoGd7ock3PKDJDFiskq3TKAiA5b2TTJuwbS7yGPOLL+6Z
         rXodmEPLoDYECV8jyvnVRryRF/My131ylW+V7+WPYkoXiLZf+Z9vf7WbGLTsYwwh+OVn
         C/7A==
X-Gm-Message-State: AOJu0YwUenX/h7nVQhuYt5/xRPg9HMMWYcXRdiyUBaxZAmklXhZntT/x
	jiQvUj8XZyl4xQsyFJEK3ZVxXmJ1MOeXik1WfxLXYWYX/7usUHaj3qfCpWdtEQ==
X-Google-Smtp-Source: AGHT+IEL54TMW8b71IGlM8jeUFVPdxKa9h5epEXjCT9fbZ+B3TKMfO+Jw+32ulA7Z8YqzOju+gdL1g==
X-Received: by 2002:a05:6512:688:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-52eb99942b2mr944933e87.16.1720508500091;
        Tue, 09 Jul 2024 00:01:40 -0700 (PDT)
Message-ID: <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
Date: Tue, 9 Jul 2024 09:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
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
In-Reply-To: <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2024 08:36, Jürgen Groß wrote:
> On 09.07.24 08:24, Jan Beulich wrote:
>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>   From the backtrace, it looks like the immediate case is just trying to
>>> read a 4-byte version:
>>>
>>>   >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>   >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>   >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>   >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>
>>> int ucsi_register(struct ucsi *ucsi)
>>> {
>>>           int ret;
>>>
>>>           ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>>>                                 sizeof(ucsi->version));
>>>
>>> ->read being ucsi_acpi_read()
>>>
>>> However, the driver also appears write to adjacent addresses.
>>
>> There are also corresponding write functions in the driver, yes, but
>> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
>> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
>> ACPI object evaluation, which isn't obvious without seeing the
>> involved AML whether it might write said memory region.
> 
> I guess an ACPI dump would help here?

Perhaps, yes.

>> The writing
>> done in the write function(s) looks to be
>>
>> 	memcpy(ua->base + offset, val, val_len);
>>
>> with their read counterpart being
>>
>> 	memcpy(val, ua->base + offset, val_len);
>>
>> where ua->base may well be an entirely different address (looks like
>> it's the first of the BARs as per ucsi_acpi_probe()).
> 
> According to the lspci -v output there are no BARs in the MSI space:
> 
> 66:00.6 USB controller: Advanced Micro Devices, Inc. [AMD] Pink Sardine 
> USB4/Thunderbolt NHI controller #2 (prog-if 40 [USB4 Host Interface])
> 	Subsystem: Lenovo Device 50d9
> 	Flags: bus master, fast devsel, latency 0, IRQ 71
> 	Memory at 78a00000 (64-bit, non-prefetchable) [size=512K]
> 	Capabilities: [48] Vendor Specific Information: Len=08 <?>
> 	Capabilities: [50] Power Management version 3
> 	Capabilities: [64] Express Endpoint, MSI 00
> 	Capabilities: [a0] MSI: Enable- Count=1/16 Maskable- 64bit+
> 	Capabilities: [c0] MSI-X: Enable+ Count=16 Masked-
> 	Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
> 	Capabilities: [2a0] Access Control Services
> 	Kernel driver in use: thunderbolt
> 	Kernel modules: thunderbolt

Right, this matches what I was vaguely guessing from reading the code in
the driver. My present understanding is that the object evaluation
actually triggers the read/write operation to produce/consume data inside
that single BAR's space.

>> If acpi_evaluate_dsm() would only ever read the region, an option (if
>> all else fails) might be to similarly (to what we do for IO-APICs)
>> permit read accesses / mappings (by inserting the range into
>> mmio_ro_ranges). Yet of course first we need to better understand
>> what's actually going on here.
> 
> As the mapping is currently trying to allow write access, too, the kernel
> would need some modification as well.

Not really, no. It would be better if the kernel didn't ask for write
access, but get_page_from_l1e() simply tells its caller to remove the
W bit from the PTE in case a page is recorded in mmio_ro_ranges. That's
also why for the IO-APIC case we got away without needing to alter the
kernel (which would likely be pretty ugly, as acpi_os_map_iomem() sits
very far away from the place where we would have a way to know that a
mapping is sufficient to be r/o; the function itself takes only
address and size right now, no permissions or cachability or anything).

Jan

