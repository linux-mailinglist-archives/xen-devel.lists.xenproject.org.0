Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6D4511B0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 20:10:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226019.390456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmhMW-0000UU-01; Mon, 15 Nov 2021 19:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226019.390456; Mon, 15 Nov 2021 19:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmhMV-0000Ru-T0; Mon, 15 Nov 2021 19:09:51 +0000
Received: by outflank-mailman (input) for mailman id 226019;
 Mon, 15 Nov 2021 19:09:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mmhMU-0000Ro-LW
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 19:09:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmhMR-00078D-IG; Mon, 15 Nov 2021 19:09:47 +0000
Received: from [54.239.6.189] (helo=[192.168.10.237])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mmhMR-0001v0-Bv; Mon, 15 Nov 2021 19:09:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xwnd5EvYZMkOSDWxYiMi6REcV/9LZ+42bbHzuj8weqo=; b=Mlyk7i2zkV2/AUiVtTtpLIGq8h
	LYXpvQdedV/PBpEpnwTKWRXXOXePmErG6KplCBflDJvDOjf+sPNAiNUXuDiL149/NleRLxHvXSWWZ
	3ozmEkkwIcln/t+v+VKKz2HHwKMJCREXOVFt6pcqPtXFJR/kCh1NJ8VomiNa2bmq7w44=;
Message-ID: <78aa1ec7-3d47-716d-c9d6-b74d66486e9e@xen.org>
Date: Mon, 15 Nov 2021 19:09:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: ACPI/UEFI support for Xen/ARM status?
To: Jan Beulich <jbeulich@suse.com>, Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
 <64e9208d-ecda-2e62-e10f-81750c0279fb@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <64e9208d-ecda-2e62-e10f-81750c0279fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/11/2021 10:13, Jan Beulich wrote:
> On 12.11.2021 17:02, Julien Grall wrote:
>> Hi Elliott,
>>
>> On 12/11/2021 15:44, Elliott Mitchell wrote:
>>> On Fri, Nov 12, 2021 at 05:54:08AM +0000, Henry Wang wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>>>>> Elliott Mitchell
>>>>>
>>>>> I've been busy with another part of this project, so I've lost track of
>>>>> progress on ACPI/UEFI support on ARM.
>>>>>
>>>>> Last I'd read full support for ACPI/UEFI seemed a ways off.  Using a stub
>>>>> domain to constrain ACPI table parsing seemed the favored approach.  I
>>>>> was under the impression that would take some time.
>>>>>
>>>>> What is the status?  Do the Xen/ARM leads have any guesses for when full
>>>>> ACPI/UEFI support might reach completion?
>>>>
>>>> I am doing some development based on the Xen UEFI/ACPI on AArch64 using
>>>> the Arm FVP_Base platform. Using edk2 and master branch of Xen with
>>>> `CONFIG_ACPI=y`, it seems everything can work properly.
>>>>
>>>> Here are some of my logs:
>>>> Shell> FS2:EFI\XEN\xen.efi
>>>> Xen 4.16-rc (c/s Fri Nov 12 02:34:01 2021 +0000 git:323b47ffd9-dirty) EFI loader
>>>> ...
>>>> (XEN) PFN compression on bits 20...22
>>>> (XEN) ACPI: RSDP F5E30018, 0024 (r2 LINARO)
>>>> (XEN) ACPI: XSDT F5E3FE98, 005C (r1 LINARO RTSMVEV8        2       1000013)
>>>> (XEN) ACPI: FACP F5E3FA98, 0114 (r6 LINARO RTSMVEV8        2 LNRO        2)
>>>> (XEN) ACPI: DSDT F5E3ED98, 02AB (r2 LINARO RTSMVEV8        4 INTL 20200925)
>>>> (XEN) ACPI: GTDT F5E3FC18, 00E0 (r2 LINARO RTSMVEV8        2 LNRO        2)
>>>> (XEN) ACPI: APIC F5E3E998, 02D4 (r4 LINARO RTSMVEV8        2 LNRO        2)
>>>> (XEN) ACPI: SPCR F5E3FF98, 0050 (r2 LINARO RTSMVEV8        2 LNRO        2)
>>>> (XEN) Domain heap initialised
>>>
>>>> ...
>>>> [    0.000000] ACPI: SPCR 0x00000000F5E3FF98 000050 (v02 LINARO RTSMVEV8 00000002 LNRO 00000002)
>>>> [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x1c090000,115200
>>>> ...
>>>>
>>>> Hopefully this answers your question. :)
>>>
>>> Thanks for the attempt at answering, but the SPCR entry tells me there is
>>> a substantial portion of ACPI/UEFI functionality you're not testing.  I'm
>>> specifically looking for framebuffer console support and SPCR says you're
>>> using serial console.  While serial console is appropriate for true
>>> servers, for some use cases it is inadequate.
>>
>> We don't have any support for framebuffer in Xen on Arm (even for
>> Device-Tree). I would be happy to consider any patches if you are plan
>> to post some.
>>
>>>
>>> Julien Grall and Stefano Stabellini had been proposing doing ACPI table
>>> parsing in a stub domain, but I'm unaware of the status.  Not finding
>>> much suggests it hasn't gone very far yet.
>>
>> This was a very early proposal in case we needed to parse the DSDT in
>> Xen. This hasn't been needed so far, hence why this is not implemented
>> and no-one worked on it.
>>
>> I am not very familiar how the framebuffer is detected in ACPI. Can you
>> provide more details on what exactly you want to parse?
> 
> I don't think there's any ACPI support involved there. Instead UEFI data
> needs propagating to Dom0, as that can't access EFI boot services itself.
> At least this is all that's needed on the x86 side (and all the needed
> code is there, just presumably not [fully] wired up on Arm).

Thanks for the feedback. At the moment, we don't enable EFI runtime 
services nor propagate it to Dom0. So this needs to be wired up.

However, for Elliott's case, I am not sure this is going to sufficient. 
The Raspberry PI has some devices that can only DMA into the first 1GB 
of the RAM (the GPU seems to be one). So we need to make sure Xen is 
allocating enough memory for Dom0 below that limit.

Do you have similar problem on x86? If so, how do you deal with it?

Cheers,

-- 
Julien Grall

