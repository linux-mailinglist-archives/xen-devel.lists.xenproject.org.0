Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0DB4595A1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 20:32:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229046.396406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpF2L-0003uL-W4; Mon, 22 Nov 2021 19:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229046.396406; Mon, 22 Nov 2021 19:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpF2L-0003rk-Sf; Mon, 22 Nov 2021 19:31:33 +0000
Received: by outflank-mailman (input) for mailman id 229046;
 Mon, 22 Nov 2021 19:31:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpF2L-0003re-4d
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 19:31:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpF2K-0006oV-DV; Mon, 22 Nov 2021 19:31:32 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.28.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpF2K-0008B1-7e; Mon, 22 Nov 2021 19:31:32 +0000
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
	bh=4YiG/0XDor+knvJ2jOgEtX6royfi9TT5Ef9FSYGVdK0=; b=J4mMyx7ThHz313MI2rV2QBF7Bt
	910y1w4QlvYF9nSH0pXKKoJMr9iuDb3AEy/HOmaKgHCRvgvGcjyTQKi7hrFwseK+otATsdu9A5OZc
	ij4wnfA0VzoS+1KwPVvReTZ0Cz0ncH7HYqfpjW263U2l7wQ5+HZQOUk1OQ7w1GVjZQzA=;
Message-ID: <85923001-363c-277f-ead2-026cea88577c@xen.org>
Date: Mon, 22 Nov 2021 19:31:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled
 devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-6-andr2000@gmail.com>
 <997e2ad5-9b52-73b4-a02d-f255480684d9@xen.org>
 <ffaabc83-9ca7-1f41-23a9-bf2a1e3828ca@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ffaabc83-9ca7-1f41-23a9-bf2a1e3828ca@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 18/11/2021 06:59, Oleksandr Andrushchenko wrote:
> Hi, Julien!
> 
> On 16.11.21 21:22, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 05/11/2021 06:33, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Currently Xen maps all IRQs and memory ranges for all devices except
>>> those marked for passthrough, e.g. it doesn't pay attention to the
>>> "status" property of the node.
>>>
>>> According to the device tree specification [1]:
>>>    - "okay"     Indicates the device is operational.
>>>    - "disabled" Indicates that the device is not presently operational,
>>>                 but it might become operational in the future (for example,
>>>            something is not plugged in, or switched off).
>>>            Refer to the device binding for details on what disabled means
>>>            for a given device.
>>>
>>> So, "disabled" status is device dependent and mapping should be taken by
>>> case-by-case approach with that respect. Although in general Xen should map
>>> IRQs and memory ranges as the disabled devices might become operational
>>
>> Right, this change effectively prevent dom0 to use such device if it becomes operational in the future.
> Or doesn't, see below
>> So this sounds like a big regression.
>>
>> How do you plan to handle it?
> It depends if this is really a regression or is ok and "by design"

Quoting what you wrote in the commit message:

"Indicates that the device is not presently operational, but it might 
become operational in the future."

I read that as it might be possible to have a device turn on after boot.
In fact, looking at Linux, I can see some code allowing to change the 
state of a device after boot (see [4]). So I think we want to keep 
mapping the regions in dom0 at least for some devices.

Note, that other bits of the DT overlay would not work. This should be 
covered by the new series from Xilinx [5].

>>
>>> it
>>> makes it impossible for the other devices, which are not operational in
>>> any case, to skip the mappings.
>>
>> You wrote "makes it impossible for the other devices", but it is not clear to me what's would go wrong when we map a disabled device (Dom0 should not touch it). Do you have an example?
> Ok, here we go. In the SoC I am working with the PCIe controller may run in two modes:
> Root or Endpoint. Not configurable at run-time, so you configure it in the device tree.
> The are two device tree entries for that: for the root [1] and for the endpoint [2].
> So, when you want the controller to be a Root Complex then you put status = "disabled"
> for the Endpoint entry and vise versa.

Thank for the example. I think this is something that should be 
explained in the commit message.

> 
> If you take a look at the nodes they both define the same "reg" and "interrupts",
> effectively making it impossible for me in the patch [3] to actually trap MMIOs: > we skip the mappings for [1] and then, because we assume "disabled" is
> still valid for mappings, we add those for [2].

Technically, you would have the same issues if your device is sharing 
the interrupt or the MMIO page.

The former is fairly common, but IIUC you are not emulated the 
interrupts. Right?

For the latter, I have seen multiple UARTs in the same page (e.g. 
pine64) but not multiple PCI hostbridges. However, this is only with 4KB 
page granularity. We may have the issue arising with 16KB/64KB ones. So 
I would say we could ignore it for now.

> 
> So, this is probably why device tree documentation says about the disabled status
> to be device specific.

Correct. That said, until now, all the devices would have their 
MMIOsregions mapped to dom0. So the interpretation of "disabled" didn't 
matter too much.

> 
> Hope this describes a very valid use-case. At the same time you may argue that
> I just need to remove the offending entry from the device tree which may also be
> valid.

We need to be able to accept any *valid* Device-Tree without any 
modification. At the same time, we want to avoid break potential 
existing use-cases.

I think, you can handle the two gracefully by adding a else in 
pci_host_bridge_mappings() that would remove the P2M mapping if 
bridge->ops->need_p2m_hwdom_mapping() returns false.

This is not pretty but it should do the job for now. Long run, I think 
we should consider to create fake entries in the P2M for emulated regions.

The advantage is we could easily find clash and use them to ignore 
mapping when the region is emulated.

Cheers,

>>
>> Cheers,
>>
> Thank you,
> Oleksandr
> 
> [1] https://github.com/renesas-rcar/linux-bsp/blob/v5.10.41/rcar-5.1.3.rc6/arch/arm64/boot/dts/renesas/r8a779f0.dtsi#L843
> [2] https://github.com/renesas-rcar/linux-bsp/blob/v5.10.41/rcar-5.1.3.rc6/arch/arm64/boot/dts/renesas/r8a779f0.dtsi#L896
> [3] https://patchwork.kernel.org/project/xen-devel/patch/20211105063326.939843-5-andr2000@gmail.com/

[4] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/dynamic.c#n111
[5] 
https://lore.kernel.org/xen-devel/1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com/


> 

-- 
Julien Grall

