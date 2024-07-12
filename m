Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8792FC47
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 16:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758091.1167356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGxt-0006e8-NP; Fri, 12 Jul 2024 14:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758091.1167356; Fri, 12 Jul 2024 14:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGxt-0006be-Jn; Fri, 12 Jul 2024 14:09:37 +0000
Received: by outflank-mailman (input) for mailman id 758091;
 Fri, 12 Jul 2024 14:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sSGxr-0006bV-Uc
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 14:09:35 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d313074-4058-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 16:09:33 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eea7e2b073so26007411fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 07:09:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cacd3e4a45sm1565589a91.18.2024.07.12.07.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:09:32 -0700 (PDT)
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
X-Inumbo-ID: 5d313074-4058-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720793373; x=1721398173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJoMw0tNSMubsjAqV0ICG26U6lOplcHdNAOC0zCyqOI=;
        b=fdd9BKxA3J/cXlVWr8t6VaswzwwYu3VAqEgqkXI+ty0iqY5Kh7lZLHR/x6UmmVVz/7
         ECDqfgg5i+Reu1sqPi389dQG+2GByc/BMks314tKmw6Dx5kOY8KloAPeedc0PPwyJ/u9
         qA6uWIZP2Du19NvKVm0EBYyOPsizglSFiRL+i74nCMxN7N0tBdzT04Up3L3A1k1QFJvB
         Ky3Pbpt0mXvR1kU7Ul+RNFvKjtEkU+xQkXfJ280Jhsja/OwvF2QsD2FrgYiSaEhT91gn
         Enodl/RqLOsesllfolEdkpjT2TOOajq+qHbgSNuP8afoKsW1IJdZa0o3rzVDpc6eh1LW
         0zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793373; x=1721398173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJoMw0tNSMubsjAqV0ICG26U6lOplcHdNAOC0zCyqOI=;
        b=BqVbhWRASobPgneYASbgFZSswvkhAed3vA3N/qV3agzwkBO4NScoFkdajBwk64hHNx
         XJ2ZX9rPbSRxiHlk6dD1H2tToTZjHyoCnhACB++KXGPNnIqUUBdYNsCYztshAyx0J4pe
         l6lwME7uiSIIvjtNUtZHq555lu6wV+sjsBoaNRvGF1u+HFNO2bjCJ+1wx9HMKfwzKtvd
         7qfQqC81B/XQdXrnIafK5a+pDDy+MYdem+tz+GU65MnY/1cCfe4EDm0iTe4iK8cXTTGS
         iMlIDcU5Trb0XTPu0WYGEgcCCJLKlnrWxXhghYB51feHtfdYlBvpBD4eHVAoYPWeDY+5
         Tlhg==
X-Gm-Message-State: AOJu0Ywtt+kwa/ovxcqeZnahlgZHpEJh7vnJnmJo9tR69OZyRAYDZ47g
	9XNstCZKCrB0Q2TuMBbu4vLt8XyN6D6YlRoyR9mD7TsyzsJfboAUlOU+mfZPFQ==
X-Google-Smtp-Source: AGHT+IHXkJvDT+PCGmwZoB6uv5c7zZbKtafaukq6a5n27jY5KE9A73KyuliHsFr3kq9AJdZHJM55WA==
X-Received: by 2002:a2e:9510:0:b0:2ee:d8f3:6bdf with SMTP id 38308e7fff4ca-2eed8f36c37mr4077811fa.44.1720793373012;
        Fri, 12 Jul 2024 07:09:33 -0700 (PDT)
Message-ID: <0052661e-ffbd-48ae-8082-c7509680803e@suse.com>
Date: Fri, 12 Jul 2024 16:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
 <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
 <a6144f89-449a-4d2f-927b-a9bbdfbed56b@suse.com>
 <d0da7689-514e-4dc8-ae2c-3f2e5eeefbac@suse.com>
 <4aaa1034-2a07-47bc-9344-469653289c66@citrix.com>
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
In-Reply-To: <4aaa1034-2a07-47bc-9344-469653289c66@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.07.2024 16:00, Andrew Cooper wrote:
> On 12/07/2024 2:46 pm, Juergen Gross wrote:
>> On 12.07.24 12:35, Jürgen Groß wrote:
>>> On 09.07.24 15:08, Jason Andryuk wrote:
>>>> After acpixtract & iasl:
>>>>
>>>> $ grep -ir FEEC *
>>>> dsdt.dsl:   OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>>>> ssdt16.dsl: OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>>>>
>>>>
>>>> from the DSDT:
>>>>      Scope (\_SB.PCI0.LPC0.EC0)
>>>>      {
>>>>          OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>>>>          Field (ECMM, AnyAcc, Lock, Preserve)
>>>>          {
>>>>              TWBT,   2048
>>>>          }
>>>>
>>>>          Name (BTBF, Buffer (0x0100)
>>>>          {
>>>>               0x00                                             // .
>>>>          })
>>>>          Method (BTIF, 0, NotSerialized)
>>>>          {
>>>>              BTBF = TWBT /* \_SB_.PCI0.LPC0.EC0_.TWBT */
>>>>              Return (BTBF) /* \_SB_.PCI0.LPC0.EC0_.BTBF */
>>>>          }
>>>>      }
>>>>
>>>>  From SSDT16:
>>>> DefinitionBlock ("", "SSDT", 2, "LENOVO", "UsbCTabl", 0x00000001)
>>>> {
>>>>      External (_SB_.PCI0.LPC0.EC0_, DeviceObj)
>>>>
>>>>      Scope (\_SB)
>>>>      {
>>>>          OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>>>>          Field (SUSC, ByteAcc, Lock, Preserve)
>>>>          {
>>>>
>>>>
>>>> This embedded controller (?) seems to live at 0xfeec2xxx.
>>>
>>> What is the takeaway from that?
>>>
>>> Is this a firmware bug (if yes, pointers to a specification saying that
>>> this is an illegal configuration would be nice), or do we need a way to
>>> map this page from dom0?
>>
>> I've found the following in the AMD IOMMU spec [1]:
>>
>>   Received DMA requests without PASID in the 0xFEEx_xxxx address range
>> are
>>   treated as MSI interrupts and are processed using interrupt
>> remapping rather
>>   than address translation.
>>
>> To me this sounds as if there wouldn't be a major risk letting dom0 map
>> physical addresses in this area, as long as "normal" I/Os to this area
>> would
>> result in DMA requests with a PASID. OTOH I'm not familiar with Xen IOMMU
>> handling, so I might be completely wrong.
>>
>> Another question would be whether a device having resources in this
>> area can
>> even work through an IOMMU.
> 
> Address spaces are not fully uniform.  What 0xFEEx_xxxx means/does
> really does differ depending on your point of view.
> 
> The CPU accessing 0xFEEx_xxxx literally does different things than a PCI
> device accessing the same range.
> 
> That's why nothing outside of the CPU can get at the LAPIC MMIO
> registers.  No amount of remapping trickery in the IOMMU pagetables are
> going to change this fact.
> 
> 
> Now - the problem here is that 0xFEEx_xxxx is (for legacy reasons)
> "known" to be the LAPIC MMIO, which has a 4k window at the bottom and
> everything else in the 2M is reserved.
> 
> And it appears that AMD have started putting other things into that
> reserved space, which are only described by AML, and not known to Xen. 

I wouldn't read it like that. The entire range (1M though, not 2M) is the
MSI window for everything non-CPU. They merely emphasize that, imo.

> Xen, generally, is very wary of mappings in and around here, because it
> does need to prevent even dom0 having access to the interrupt controller
> MMIO windows (I'm including IO-APICs too).
> 
> So I expect Xen is saying "that's an interrupt MMIO window, no" without
> knowing that there's actually something else in there.  (But I am just
> guessing.)

That's what we do, yes. At some point we did relax that for the IO-APIC
ranges (to permit Dom0 r/o access). If all else fails, we may need to do
the same for the problems here.

Jan

