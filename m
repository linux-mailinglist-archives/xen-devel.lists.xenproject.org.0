Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43D92FC05
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 16:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758074.1167325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGpV-0003y8-C9; Fri, 12 Jul 2024 14:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758074.1167325; Fri, 12 Jul 2024 14:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSGpV-0003wN-9X; Fri, 12 Jul 2024 14:00:57 +0000
Received: by outflank-mailman (input) for mailman id 758074;
 Fri, 12 Jul 2024 14:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZSin=OM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sSGpT-0003wH-P6
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 14:00:55 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27c2c117-4057-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 16:00:54 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52ea2ce7abaso3675931e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 07:00:54 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bd459e1esm4555699a12.73.2024.07.12.07.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:00:52 -0700 (PDT)
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
X-Inumbo-ID: 27c2c117-4057-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720792854; x=1721397654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7wK2JcIp9rnHVs/Y7poNAdp1XOHuI94HzphW7l7GQiM=;
        b=m14xtbKtrIWXx49W3MMtqS6+0+2zQ0ZUrzoI9ZX9e+/MZPD5GzUSxtoge66ilovIsc
         JyCVNe0RnIcoGVbtSue1Ac4UY8JrKGi75Q7q/n44bKD6nf/uDXRmfVmGI0a6Lam58KFc
         h81OXtWoqcvlEyHgiitEPlrz1N62AXQLp0L6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792854; x=1721397654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wK2JcIp9rnHVs/Y7poNAdp1XOHuI94HzphW7l7GQiM=;
        b=mj4JEOMja2IYPA4sl+YQ2NIvaCkwp58V5qCEKGa4VhZ8AJ7aDLWnYf+twTNkZfMxPM
         Gmn0GOCj/scNSBQmbkz9xbDlqFrOQZ8gRj7Q1mMrO3vyZBY2bm7t1+4ldHPGjt1M/j4N
         4BefVCMLnDhKxq6YXTzKFW4jxXhCfyjHPHKkV/f2e3ZWmkaCqcxu8r0vNyMWX25/8Z/6
         tlWKawZjIKueDbUMc80TgQAgMRPb4H6TOdhovTOFcp5D0pVjw6akgCQzGLs52Z0ExDAn
         5ZPpLODTPkwnUlCsBPYvapaMpHtx4+wFnR9OATP0PE4wdPh3FRsYSnii25s01YOxjcCn
         oipw==
X-Gm-Message-State: AOJu0YwSJKZw+EsXQfsf17ujfzBdMMEr5Il+yEF37e89DNoHF5EohdTZ
	rwD/k1pZP1aQ71N61gZnuuogazW1Rux7WtuG7pi8vH2+/r2wUmdqbsLEQfvhTDI=
X-Google-Smtp-Source: AGHT+IHxk7FeFXkH3OZlNOapxOc6SIkG8Z6pMI5r5M783dnXvzMHM7uBoInGaDBHruvacLUCvmmqiA==
X-Received: by 2002:ac2:4109:0:b0:52e:7f09:aaae with SMTP id 2adb3069b0e04-52eb9999d76mr7289202e87.27.1720792853392;
        Fri, 12 Jul 2024 07:00:53 -0700 (PDT)
Message-ID: <4aaa1034-2a07-47bc-9344-469653289c66@citrix.com>
Date: Fri, 12 Jul 2024 15:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d0da7689-514e-4dc8-ae2c-3f2e5eeefbac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2024 2:46 pm, Juergen Gross wrote:
> On 12.07.24 12:35, Jürgen Groß wrote:
>> On 09.07.24 15:08, Jason Andryuk wrote:
>>> On 2024-07-09 06:56, Jürgen Groß wrote:
>>>> On 09.07.24 09:01, Jan Beulich wrote:
>>>>> On 09.07.2024 08:36, Jürgen Groß wrote:
>>>>>> On 09.07.24 08:24, Jan Beulich wrote:
>>>>>>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>>>>>>    From the backtrace, it looks like the immediate case is just
>>>>>>>> trying to
>>>>>>>> read a 4-byte version:
>>>>>>>>
>>>>>>>>    >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>>>>>    >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>>>>>    >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>>>>>    >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>>>>>
>>>>>>>> int ucsi_register(struct ucsi *ucsi)
>>>>>>>> {
>>>>>>>>            int ret;
>>>>>>>>
>>>>>>>>            ret = ucsi->ops->read(ucsi, UCSI_VERSION,
>>>>>>>> &ucsi->version,
>>>>>>>>                                  sizeof(ucsi->version));
>>>>>>>>
>>>>>>>> ->read being ucsi_acpi_read()
>>>>>>>>
>>>>>>>> However, the driver also appears write to adjacent addresses.
>>>>>>>
>>>>>>> There are also corresponding write functions in the driver, yes,
>>>>>>> but
>>>>>>> ucsi_acpi_async_write() (used directly or indirectly) similarly
>>>>>>> calls
>>>>>>> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
>>>>>>> ACPI object evaluation, which isn't obvious without seeing the
>>>>>>> involved AML whether it might write said memory region.
>>>>>>
>>>>>> I guess an ACPI dump would help here?
>>>>>
>>>>> Perhaps, yes.
>>>>
>>>> It is available in the bug report:
>>>>
>>>> https://bugzilla.opensuse.org/show_bug.cgi?id=1227301
>>>
>>> After acpixtract & iasl:
>>>
>>> $ grep -ir FEEC *
>>> dsdt.dsl:   OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>>> ssdt16.dsl: OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>>>
>>>
>>> from the DSDT:
>>>      Scope (\_SB.PCI0.LPC0.EC0)
>>>      {
>>>          OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
>>>          Field (ECMM, AnyAcc, Lock, Preserve)
>>>          {
>>>              TWBT,   2048
>>>          }
>>>
>>>          Name (BTBF, Buffer (0x0100)
>>>          {
>>>               0x00                                             // .
>>>          })
>>>          Method (BTIF, 0, NotSerialized)
>>>          {
>>>              BTBF = TWBT /* \_SB_.PCI0.LPC0.EC0_.TWBT */
>>>              Return (BTBF) /* \_SB_.PCI0.LPC0.EC0_.BTBF */
>>>          }
>>>      }
>>>
>>>  From SSDT16:
>>> DefinitionBlock ("", "SSDT", 2, "LENOVO", "UsbCTabl", 0x00000001)
>>> {
>>>      External (_SB_.PCI0.LPC0.EC0_, DeviceObj)
>>>
>>>      Scope (\_SB)
>>>      {
>>>          OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
>>>          Field (SUSC, ByteAcc, Lock, Preserve)
>>>          {
>>>
>>>
>>> This embedded controller (?) seems to live at 0xfeec2xxx.
>>
>> What is the takeaway from that?
>>
>> Is this a firmware bug (if yes, pointers to a specification saying that
>> this is an illegal configuration would be nice), or do we need a way to
>> map this page from dom0?
>
> I've found the following in the AMD IOMMU spec [1]:
>
>   Received DMA requests without PASID in the 0xFEEx_xxxx address range
> are
>   treated as MSI interrupts and are processed using interrupt
> remapping rather
>   than address translation.
>
> To me this sounds as if there wouldn't be a major risk letting dom0 map
> physical addresses in this area, as long as "normal" I/Os to this area
> would
> result in DMA requests with a PASID. OTOH I'm not familiar with Xen IOMMU
> handling, so I might be completely wrong.
>
> Another question would be whether a device having resources in this
> area can
> even work through an IOMMU.

Address spaces are not fully uniform.  What 0xFEEx_xxxx means/does
really does differ depending on your point of view.

The CPU accessing 0xFEEx_xxxx literally does different things than a PCI
device accessing the same range.

That's why nothing outside of the CPU can get at the LAPIC MMIO
registers.  No amount of remapping trickery in the IOMMU pagetables are
going to change this fact.


Now - the problem here is that 0xFEEx_xxxx is (for legacy reasons)
"known" to be the LAPIC MMIO, which has a 4k window at the bottom and
everything else in the 2M is reserved.

And it appears that AMD have started putting other things into that
reserved space, which are only described by AML, and not known to Xen. 
Xen, generally, is very wary of mappings in and around here, because it
does need to prevent even dom0 having access to the interrupt controller
MMIO windows (I'm including IO-APICs too).

So I expect Xen is saying "that's an interrupt MMIO window, no" without
knowing that there's actually something else in there.  (But I am just
guessing.)

It comes full circle back to all the problems of Xen not being OSPM, for
which we don't have a good solution.

One thing that Tim Deegan suggested aages ago was to have an ACPI OSPM
stubdom, and provide pv-AML allowing dom0 to do things.

Importantly, it would let us do things like evaluate all methods on all
processor objects, knowing that e.g. vCPUs weren't relevant.

The more I think about it the more I like it, and it would allow us to
start taking some of the more invasive hacks out of Linux, but at the
same time it's also a giant quantity of work.

~Andrew

