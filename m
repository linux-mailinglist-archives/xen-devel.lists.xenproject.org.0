Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00C22826C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:41:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxtRq-00059H-2A; Tue, 21 Jul 2020 14:40:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxtRo-000596-5Q
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 14:40:48 +0000
X-Inumbo-ID: 28f02bb6-cb60-11ea-a0db-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28f02bb6-cb60-11ea-a0db-12813bfff9fa;
 Tue, 21 Jul 2020 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y9tm5lKlnZ6rC4ngXZhk6UMCYwArwfuMcegxqyYsUfU=; b=inUnpQ/CGDT8CAgzYoQZEMPMSk
 /ZZSztThLui9j/7g54+4rbnto9gH3ccM1ds1KH31YrXZXqxXL/pivlZFGHkuRBILO1zsDjzufAd+i
 vSKMox6/cOptjlHa9WxP2hwwKsWvNRpEikhQU7YofYJUT2/bj8iD/7vMp/EMho9MuDqg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxtRl-00007s-6h; Tue, 21 Jul 2020 14:40:45 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxtRk-0006Ah-UP; Tue, 21 Jul 2020 14:40:45 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
 <56e512af-993b-1364-be56-fc4be5d88519@xen.org> <87k0yxuf89.fsf@linaro.org>
From: Julien Grall <julien@xen.org>
Message-ID: <8f125464-a0c2-dd71-6d51-eaf13259e727@xen.org>
Date: Tue, 21 Jul 2020 15:40:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0yxuf89.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Alex,

Thank you for your feedback!

On 21/07/2020 15:15, Alex Bennée wrote:
> Julien Grall <julien@xen.org> writes:
> 
>> (+ Andree for the vGIC).
>>
>> Hi Stefano,
>>
>> On 20/07/2020 21:38, Stefano Stabellini wrote:
>>> On Fri, 17 Jul 2020, Oleksandr wrote:
>>>>>> *A few word about solution:*
>>>>>> As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm
>>>>> Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
>>>>> it would be very interesting from a x86 PoV, as I don't think
>>>>> virtio-mmio is something that you can easily use on x86 (or even use
>>>>> at all).
>>>>
>>>> Being honest I didn't consider virtio-pci so far. Julien's PoC (we are based
>>>> on) provides support for the virtio-mmio transport
>>>>
>>>> which is enough to start working around VirtIO and is not as complex as
>>>> virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.
>>>>
>>>> I think, this could be added in next steps. But the nearest target is
>>>> virtio-mmio approach (of course if the community agrees on that).
>>
>>> Aside from complexity and easy-of-development, are there any other
>>> architectural reasons for using virtio-mmio?
>>
> <snip>
>>>
>>> For instance, what's your take on notifications with virtio-mmio? How
>>> are they modelled today?
>>
>> The backend will notify the frontend using an SPI. The other way around
>> (frontend -> backend) is based on an MMIO write.
>>
>> We have an interface to allow the backend to control whether the
>> interrupt level (i.e. low, high). However, the "old" vGIC doesn't handle
>> properly level interrupts. So we would end up to treat level interrupts
>> as edge.
>>
>> Technically, the problem is already existing with HW interrupts, but the
>> HW should fire it again if the interrupt line is still asserted. Another
>> issue is the interrupt may fire even if the interrupt line was
>> deasserted (IIRC this caused some interesting problem with the Arch timer).
>>
>> I am a bit concerned that the issue will be more proeminent for virtual
>> interrupts. I know that we have some gross hack in the vpl011 to handle
>> a level interrupts. So maybe it is time to switch to the new vGIC?
>>
>>> Are they good enough or do we need MSIs?
>>
>> I am not sure whether virtio-mmio supports MSIs. However for virtio-pci,
>> MSIs is going to be useful to improve performance. This may mean to
>> expose an ITS, so we would need to add support for guest.
> 
> virtio-mmio doesn't support MSI's at the moment although there have been
> proposals to update the spec to allow them. At the moment the cost of
> reading the ISR value and then writing an ack in vm_interrupt:
> 
> 	/* Read and acknowledge interrupts */
> 	status = readl(vm_dev->base + VIRTIO_MMIO_INTERRUPT_STATUS);
> 	writel(status, vm_dev->base + VIRTIO_MMIO_INTERRUPT_ACK);
>

Hmmmm, the current way to handle MMIO is the following:
     * pause the vCPU
     * Forward the access to the backend domain
     * Schedule the backend domain
     * Wait for the access to be handled
     * unpause the vCPU

So the sequence is going to be fairly expensive on Xen.

> puts an extra vmexit cost to trap an emulate each exit. Getting an MSI
> via an exitless access to the GIC would be better I think.
> I'm not quite
> sure what the path to IRQs from Xen is.

vmexit on Xen on Arm is pretty cheap compare to KVM as we don't save a 
lot of things. In this situation, they handling an extra trap for the 
interrupt is likely to be meaningless compare to the sequence above.

I am assuming the sequence is also going to be used by the MSIs, right?

It feels to me that it would be worth spending time to investigate the 
cost of that sequence. It might be possible to optimize the ACK and 
avoid to wait for the backend to handle the access.

Cheers,

-- 
Julien Grall

