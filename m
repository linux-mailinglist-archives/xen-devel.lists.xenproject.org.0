Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D75A0C3B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393182.631967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8ph-0002Gu-Nb; Thu, 25 Aug 2022 09:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393182.631967; Thu, 25 Aug 2022 09:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR8ph-0002EZ-Jq; Thu, 25 Aug 2022 09:07:25 +0000
Received: by outflank-mailman (input) for mailman id 393182;
 Thu, 25 Aug 2022 09:07:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oR8pg-0002ET-DI
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:07:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oR8pd-0001y0-Ue; Thu, 25 Aug 2022 09:07:21 +0000
Received: from [54.239.6.188] (helo=[192.168.11.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oR8pd-0003oe-O9; Thu, 25 Aug 2022 09:07:21 +0000
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
	bh=WgM2SLMASiTtPzx/1gmlV6cUDfaK7DdlYGvcHC5lYvs=; b=OgjbIw8A+sdPByjT/bjOy3xNl9
	KgJ/zg0sdMzrGFyp8Z4tiBs6heGTo5xnoNFQThWrfZiK2BKXMP4EomZDwKLgxcvjNhzJd4QfanVKf
	qvwtK0CgGZelwb2KgQWFwOSit/DGuDv7U4PB0t3UU/Nzx73DuKBBCf/YolPm8YuIESPc=;
Message-ID: <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
Date: Thu, 25 Aug 2022 10:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <jgrall@amazon.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org> <Ywcr1849LiEHezd3@leoy-huanghe>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Ywcr1849LiEHezd3@leoy-huanghe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/08/2022 08:59, Leo Yan wrote:
> On Fri, Aug 19, 2022 at 01:10:10PM +0100, Marc Zyngier wrote:
> 
> [...]
> 
>>>>> In the context of Xen, dom0 doesn't have direct access to the host ITS
>>>>> because we are emulating it. So I think it doesn't matter for us because we
>>>>> can fix our implementation if it is affected.
>>>>>
>>>>> That said, kexec-ing dom0 (or any other domain) on Xen on Arm would require
>>>>> some work to be supported. OOI, @leo is it something you are investigating?
>>>>
>>>>
>>>> Now I am working on automative reference platform; the first thing for
>>>> me is to resolve the kernel oops.
>>>>
>>>> For long term, I think the kexec/kdump would be important to be
>>>> supported, to be clear, so far supporting kexec/kdump for Xen/Linux is
>>>> not priority for my work.
>>>>
>>>> Also thanks a lot for Ard and Mark's replying. To be honest, I missed
>>>> many prerequisites (e.g. redistributor configurations for GIC in
>>>> hypervisor) and seems Xen uses a different way by emulating GICv3
>>>> controller for guest OS.  So now I am bit puzzle what's for next step
>>>> or just keep as it is?
>>>>
>>>
>>> If i understand Julien's remark correctly, the dom0 GICv3 is emulated,
>>> and so it should not suffer from the issue that we are working around
>>> here.
> 
> Before proceeding discussion, I would like step back to get clear for
> the GIC implementation in Xen, otherwise, it's really hard for me to
> catch up the dicussion :)
> 
> For me it's clear that Xen emulates GICv3 for DomU, but I am still
> confused how GICv3 works for Dom0.
> 
> Xen directly passes ACPI MADT table from UEFI to Linux kernel to Dom0,
> (see functions acpi_create_madt() and gic_make_hwdom_madt()), which
> means the Linux kernel Dom0 uses the same ACPI table to initialize GICv3
> driver, but since Linux kernel Dom0 accesses GIC memory region as IPA,
> it still trap to Xen in EL2 for stage 2 translation, so finally Xen
> can emulate the GICv3 device for Dom0.

In the default setup, dom0 is also the hardware domain. So it owns all 
of the devices but the ones used by Xen (e.g. interrupt controller, SMMU).

Therefore, dom0 will use the same memory layout as the host. At which 
point, it is a lot more convenient to re-use the host ACPI tables and 
rewrite only what's necessary.

> 
> This is quite different from DomU.  Xen prepares a DT node for GICv3
> rather than directly passing ACPI table, so DomU kernel initializes
> GICv3 driver based on the DT binding.

DomUs memory layout is defined by Xen. So we need to create the 
Device-Tree and ACPI tables (both are supported) from scrartch.

> 
> Simply to say, no matter Dom0 using ACPI table or DomU using DT
> binding, at the end Xen emulates GICv3 device for all of them.

Correct. In both situations the GICv3 will be owned by Xen and we will 
emulate the bits that are not virtualized by the CPUs (e.g. 
re-distributors).

> 
> Another thing is not clear for me is that I can see Xen allocates
> redistributor pending page (see gicv3_lpi_set_pendtable()), after Dom0
> or DomU kernel boots up, kernel allocates another RD pending page; so
> the question is how these two different pending pages co-work
> together.

Xen allocates the pending pages that will be used by the host. Dom0/DomU 
will be allocating pending pages that will be used by the virtual GICv3.

> 
> In other words, let's assume the Dom0 kernel panic and its secondary
> kernel is launched by kexec, is it necessarily for the secondary
> kernel to reuse the primary kernel's RD pending page?

No.

>  Or in this case
> it's no matter for the RD pending page in Dom0 and it's safe for Xen
> always maintains its own RD pending page in EL2?

Dom0 doesn't have direct access to the host GICv3 (this will be 
controlled by Xen). What we expose to dom0 is a virtual GICv3.

So effectively we have two different GICv3 and each of them will require 
their own set of pending table.

> 
>> The problem is that there is no way to distinguish a system that
>> suffers from GICR LPI tables being immutable from one that allows the
>> LPI configuration being changed (either because the HW allows it or
>> because the hypervisor plays other games).
> 
> Let me ask a stupid question.  Seems to me, GICR LPI tables can be
> configured as below options
> 
> - The hypervisor pre-allocates GICR LPI tables and pass the memory
>    region info to Dom0 kernel;
> 
> - The hypervisor doesn't allocate GICR LPI tables, and then Dom0
>    kernel allocates GICR LPI tables for the virtual GICv3, and Dom0
>    directly write data to the GICR LPI tables and the table is used by
>    physical GICv3;
> 
> - The hypervisor pre-allocates GICR LPI tables for phycial GICv3 and
>    Dom0 kernel allocates another GICR LPI tables for virtual GICv3,
>    and Xen needs to sync between these two tables.
> 
> To be clear, all of above three options are hypothesis.  So please
> correct me if anything is wrong (or even total are wrong?!).

I will defer this question to Marc.

Cheers,

-- 
Julien Grall

