Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558E2B809C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30059.59776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPUC-0004AT-KA; Wed, 18 Nov 2020 15:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30059.59776; Wed, 18 Nov 2020 15:35:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfPUC-0004A4-Go; Wed, 18 Nov 2020 15:35:08 +0000
Received: by outflank-mailman (input) for mailman id 30059;
 Wed, 18 Nov 2020 15:35:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfPUB-00049z-5n
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:35:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfPUA-0003wZ-AP; Wed, 18 Nov 2020 15:35:06 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfPU9-0007bn-W8; Wed, 18 Nov 2020 15:35:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPUB-00049z-5n
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=rSEK9lYwlW4jAC1pFVIz3xCqG5RQhts4Oxd5Bzm9HKM=; b=e1LEgiaSm0hAfDmGunnWt/7UEx
	TxjkbeVCiGkTjcYE9Q8rMZPJQ9V5+RDFR3cq8f8wIxKjKF5Yy6tXZgdB2REr88N3nr7XnvECpGNr2
	TbDpcVvYpkLj3w5iD9NMTZocUvZb4+h5U92hUymzRXAkwpsB1yo7i/9BffYIb1/RwwNA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPUA-0003wZ-AP; Wed, 18 Nov 2020 15:35:06 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfPU9-0007bn-W8; Wed, 18 Nov 2020 15:35:06 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
 <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
 <1530c2fb-8def-37eb-8a22-d7f9fc4e38b4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0946edb2-c2c1-0d3d-c8ff-f24055f78ebf@xen.org>
Date: Wed, 18 Nov 2020 15:35:03 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1530c2fb-8def-37eb-8a22-d7f9fc4e38b4@suse.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 18/11/2020 15:16, Jan Beulich wrote:
> On 18.11.2020 16:02, Rahul Singh wrote:
>> Hello Jan,
>>
>>> On 17 Nov 2020, at 10:55 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 16.11.2020 13:25, Rahul Singh wrote:
>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>>> is enabled for ARM, compilation error is observed for ARM architecture
>>>> because ARM platforms do not have full PCI support available.
>>>
>>> While you've extended the sentence, it remains unclear to me what
>>> compilation error it is that results here. I've requested such
>>> clarification for v2 already.
>>
>> Compilation error is related to the code that refer to x86  functions (create_irq()..) and MSI implementation related error.
>> For more details please find the attached file for compilation error.
> 
> The use of mmio_ro_ranges is almost quite possibly going to remain
> x86-specific, but then I guess this wants abstracting in a suitable
> way.
> 
> The remaining look to all be MSI-related, so perhaps what you want
> to avoid is just that part rather than everything PCI-ish?

Not really (see more above).

> 
>>>> --- a/xen/drivers/char/ns16550.c
>>>> +++ b/xen/drivers/char/ns16550.c
>>>> @@ -16,7 +16,7 @@
>>>> #include <xen/timer.h>
>>>> #include <xen/serial.h>
>>>> #include <xen/iocap.h>
>>>> -#ifdef CONFIG_HAS_PCI
>>>> +#ifdef CONFIG_HAS_NS16550_PCI
>>>> #include <xen/pci.h>
>>>> #include <xen/pci_regs.h>
>>>> #include <xen/pci_ids.h>
>>>
>>> ... #undef-ining CONFIG_HAS_PCI at a suitable position in this
>>> file (e.g. after all #include-s, to make sure all structure
>>> layouts remain correct)? This would then be far easier to revert
>>> down the road, and would confine the oddity to a single file
>>> (and there a single place) in the code base.
>>>
>>
>> As for ARM platforms, PCI implementation is in the development process and I am not sure if after completion of PCI work, ns16500 PCI part of code will work out of the box. I think there is some effort required to test the ns16550 PCI part of the code on ARM.
>> As this code is tested on X86 only so I make the options depends on X86 and enable it by default for x86.
>>
>> I feel that adding a new Kconfig options is ok to enable/disable the PCI NS16550 support as compared to #undef CONFIG_HAS_PCI in the particular file. If in future other architecture wants to implement the PCI they will face the similar compilation error issues.
>>
>> Please suggest how we can proceed on this.
> 
> Introduce CONFIG_HAS_PCI_MSI (selected only by x86), if there's no
> immediate plan to support it on Arm together with the rest of PCI?

So even we are going to enable PCI on Arm and fix compilation issue, 
there are no way the NS16550 PCI would be usuable without effort for a 
few reasons:

   1) com1/com2 is x86 specific
   2) ns16550_init() is not used by Arm and the only way to use a PCI UART
   3) UART is discovered through the device-tree/ACPI tables on Arm

So I think CONFIG_HAS_NS16550_PCI is most suitable solution and we 
should probably guard more code (e.g. ns16550_init(), com1, com2...).

Note that's not a request for doing it in this patch :).

Cheers,

-- 
Julien Grall

