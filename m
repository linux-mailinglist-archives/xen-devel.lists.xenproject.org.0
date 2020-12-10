Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51A2D5C00
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 14:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49229.87028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knM9G-0005Fx-4M; Thu, 10 Dec 2020 13:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49229.87028; Thu, 10 Dec 2020 13:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knM9G-0005FY-15; Thu, 10 Dec 2020 13:38:22 +0000
Received: by outflank-mailman (input) for mailman id 49229;
 Thu, 10 Dec 2020 13:38:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knM9F-0005F1-A1
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:38:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knM98-0007ky-6h; Thu, 10 Dec 2020 13:38:14 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knM97-0001C1-UQ; Thu, 10 Dec 2020 13:38:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=aYqTd/WChvNGXDV0uaxGOhHg4JZtfhldey1GEQ5D6OM=; b=b412AEuSV52OKxlkX+/14/QlJc
	IF5HXqrP6SF3gRzg32vfgmSf0rialgpfXgg8c8D0KbCURQu9mHf+bSfQhXRFamkHGR702dFGGcCFR
	uVwUxBMfeXsEaJtIcoK2dgkxMxDEaXNxKvij6oqrHM4wQNsuceSA3TBtyNm6eQHRXAZg=;
Subject: Re: [PATCH V3 18/23] xen/dm: Introduce xendevicemodel_set_irq_level
 DM op
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, alex.bennee@linaro.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-19-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2012091802240.20986@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d02e00e3-655f-9378-1d95-0e7895d943f4@xen.org>
Date: Thu, 10 Dec 2020 13:38:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012091802240.20986@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/12/2020 02:21, Stefano Stabellini wrote:
> On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch adds ability to the device emulator to notify otherend
>> (some entity running in the guest) using a SPI and implements Arm
>> specific bits for it. Proposed interface allows emulator to set
>> the logical level of a one of a domain's IRQ lines.
>>
>> We can't reuse the existing DM op (xen_dm_op_set_isa_irq_level)
>> to inject an interrupt as the "isa_irq" field is only 8-bit and
>> able to cover IRQ 0 - 255, whereas we need a wider range (0 - 1020).
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> ***
>> Please note, I left interface untouched since there is still
>> an open discussion what interface to use/what information to pass
>> to the hypervisor. The question whether we should abstract away
>> the state of the line or not.
>> ***
> 
> Let's start with a simple question: is this going to work with
> virtio-mmio emulation in QEMU that doesn't lower the state of the line
> to end the notification (only calls qemu_set_irq(irq, high))?
> 
> See: hw/virtio/virtio-mmio.c:virtio_mmio_update_irq

Hmmm my version of QEMU is using:

level = (qatomic_read(&vdev->isr) != 0);
trace_virtio_mmio_setting_irq(level);
qemu_set_irq(proxy->irq, level);

So QEMU will raise/lower the interrupt based on whether there are 
pending still interrupts.

> 
> 
> Alex (CC'ed) might be able to confirm whether I am reading the QEMU code
> correctly. Assuming that it is true that QEMU is only raising the level,
> never lowering it, although the emulation is obviously not correct, I
> would rather keep QEMU as is for efficiency reasons, and because we
> don't want to deviate from the common implementation in QEMU.
> 
> 
> Looking at this patch and at vgic_inject_irq, yes, I think it would
> work as is.

Our implementation of vgic_inject_irq() is completely bogus as soon as 
you deal with level interrupt. We are getting away so far, because there 
are not many fully emulated level interrupt (AFAIK this would only be 
the pl011). In fact, we carry a gross hack in the emulation to handle them.

In case of the level interrupt, we should keep injecting the interrupt 
to the guest until the line was lowered down (e.g qemu_set_irq(irq, 0) 
assuming active-high).

> 
> 
> So it looks like we are going to end up with an interface that:
> 
> - in theory it is modelling the line closely

For level interrupt we need to know whether the line is low or high. I 
am struggling to see how this would work if we consider the variable as 
"trigger".

Cheers,

-- 
Julien Grall

