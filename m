Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7F2280D4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 15:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxsE6-0005tH-Fr; Tue, 21 Jul 2020 13:22:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxsE4-0005tC-PH
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 13:22:32 +0000
X-Inumbo-ID: 3b582cba-cb55-11ea-8515-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b582cba-cb55-11ea-8515-bc764e2007e4;
 Tue, 21 Jul 2020 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J42ay2v2PlHuRzncOzUEnEmIxuRBBDaDZG2DhQxBNDM=; b=wS2jJ5E9CauENOggMRU8UwFAw3
 BlZT+C6W1sAI3g+c8m2LqqlMpXoIHfHnOK3J/IUXBL+ej9lI1JNBik6uz71JVALjYrfAw+QHjNcA/
 bwChoPEj/8mQbD4GPpCRoZF/x1lres2XBeyH4BAmKKF1kXffz8FzXxjg01BbRik/hT/o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxsE2-0006tn-V2; Tue, 21 Jul 2020 13:22:30 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxsE2-0001Cc-Mu; Tue, 21 Jul 2020 13:22:30 +0000
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr <olekstysh@gmail.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <56e512af-993b-1364-be56-fc4be5d88519@xen.org>
Date: Tue, 21 Jul 2020 14:22:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007201326060.32544@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 alex.bennee@linaro.org, Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Andree for the vGIC).

Hi Stefano,

On 20/07/2020 21:38, Stefano Stabellini wrote:
> On Fri, 17 Jul 2020, Oleksandr wrote:
>>>> *A few word about solution:*
>>>> As it was mentioned at [1], in order to implement virtio-mmio Xen on Arm
>>> Any plans for virtio-pci? Arm seems to be moving to the PCI bus, and
>>> it would be very interesting from a x86 PoV, as I don't think
>>> virtio-mmio is something that you can easily use on x86 (or even use
>>> at all).
>>
>> Being honest I didn't consider virtio-pci so far. Julien's PoC (we are based
>> on) provides support for the virtio-mmio transport
>>
>> which is enough to start working around VirtIO and is not as complex as
>> virtio-pci. But it doesn't mean there is no way for virtio-pci in Xen.
>>
>> I think, this could be added in next steps. But the nearest target is
>> virtio-mmio approach (of course if the community agrees on that).

> Aside from complexity and easy-of-development, are there any other
> architectural reasons for using virtio-mmio?

 From the hypervisor PoV, the main/only difference between virtio-mmio 
and virtio-pci is that in the latter we need to forward PCI config space 
access to the device emulator. IOW, we would need to add support for 
vPCI. This shouldn't require much more work, but I didn't want to invest 
on it for PoC.

Long term, I don't think we should tie Xen to any of the virtio 
protocol. We just need to offer facilities so users can be build easily 
virtio backend for Xen.

> 
> I am not asking because I intend to suggest to do something different
> (virtio-mmio is fine as far as I can tell.) I am asking because recently
> there was a virtio-pci/virtio-mmio discussion recently in Linaro and I
> would like to understand if there are any implications from a Xen point
> of view that I don't yet know.

virtio-mmio is going to require more work in the toolstack because we 
would need to do the memory/interrupts allocation ourself. In the case 
of virtio-pci, we only need to pass a range of memory/interrupts to the 
guest and let him decide the allocation.

Regarding virtio-pci vs virtio-mmio:
      - flexibility: virtio-mmio is a good fit when you know all your 
devices at boot. If you want to hotplug disk/network, then virtio-pci is 
going to be a better fit.
      - interrupts: I would expect each virtio-mmio device to have its 
own SPI interrupts. In the case of virtio-pci, then legacy interrupts 
would be shared between all the PCI devices on the same host controller. 
This could possibly lead to performance issue if you have many devices. 
So for virtio-pci, we should consider MSIs.

> 
> For instance, what's your take on notifications with virtio-mmio? How
> are they modelled today?

The backend will notify the frontend using an SPI. The other way around 
(frontend -> backend) is based on an MMIO write.

We have an interface to allow the backend to control whether the 
interrupt level (i.e. low, high). However, the "old" vGIC doesn't handle 
properly level interrupts. So we would end up to treat level interrupts 
as edge.

Technically, the problem is already existing with HW interrupts, but the 
HW should fire it again if the interrupt line is still asserted. Another 
issue is the interrupt may fire even if the interrupt line was 
deasserted (IIRC this caused some interesting problem with the Arch timer).

I am a bit concerned that the issue will be more proeminent for virtual 
interrupts. I know that we have some gross hack in the vpl011 to handle 
a level interrupts. So maybe it is time to switch to the new vGIC?

> Are they good enough or do we need MSIs?

I am not sure whether virtio-mmio supports MSIs. However for virtio-pci, 
MSIs is going to be useful to improve performance. This may mean to 
expose an ITS, so we would need to add support for guest.

Cheers,

-- 
Julien Grall

