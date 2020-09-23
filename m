Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AB2753F2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 11:05:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL0hR-0006cI-KL; Wed, 23 Sep 2020 09:04:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL0hQ-0006cD-KR
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 09:04:28 +0000
X-Inumbo-ID: 075f24bc-7d9b-45db-a7a4-06b875d8b953
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 075f24bc-7d9b-45db-a7a4-06b875d8b953;
 Wed, 23 Sep 2020 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=qOjBlIzxR+gfAB6xwpTUQLgF7fmC3Bf+cr0RcZOH654=; b=pw4ZV4/qZPHaiF5U9kxlXQ/kqI
 q9QrG46Kjgfxd7p0JPoh7LkGzY7031N5RupM7NmGCekquR5uZQIupxgpSy1as120vK5CoAE/ZYBzw
 A1qmvl2PoEf1DbPms0wkv0ENLINw6jFeN9JwbC2qvIhv09rE1R7mqxMPXe5vaXMxVghQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL0hN-0005XG-7j; Wed, 23 Sep 2020 09:04:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL0hM-0003Ff-Pf; Wed, 23 Sep 2020 09:04:25 +0000
Subject: Re: Virtio Xen (WAS: Re: [Linux] [ARM] Granting memory obtained from
 the DMA API)
To: Simon Leiner <simon@leiner.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <44f2d486-e3bd-6a44-042d-f05b5d0c0732@leiner.me>
 <9bbea2a9-76f8-6384-3cff-3ae65e0475fa@xen.org>
 <9AFF0FE3-F808-453F-91B1-74F9C7426FE7@leiner.me>
From: Julien Grall <julien@xen.org>
Message-ID: <2c296fa0-d4f1-3f9a-00d8-99d401615799@xen.org>
Date: Wed, 23 Sep 2020 10:04:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9AFF0FE3-F808-453F-91B1-74F9C7426FE7@leiner.me>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/08/2020 11:38, Simon Leiner wrote:
> Hi Julien,

Hi Simon,

Apologies for the late answer.

> On 25.08.20 15:02, Julien Grall wrote:
>> May I ask why did you create a new transport rather than using the
>> existing one?
> 
> We wanted a mechanism for dynamically creating virtio devices at
> runtime. I looked at virtio-mmio briefly and it seemed to me that a lot
> of things would have to be known in advance (how many devices are
> there? How much memory do they need? Where does the memory range for
> virtio-mmio start on the device domain?). So after reading a bit about
> Xen and how the classic split drivers work, I figured building a split
> driver for virtio was the way to go. The basic principle is really
> simple:
> 
>   - Using grants to share memory for the virtqueues
>   - Using event channels as a queue notification mechanism
>   - All state handling and other information exchange (like number of
>     queues, grant refs, event channel numbers etc.) is done through the
>     Xenbus.
> 
> On the Linux side, this is implemented as a kernel module. No patches
> to the kernel itself (apart from the ones I sent in earlier) or to Xen
> itself are required.
> 
>> So far, there is an RFC to implement virtio-mmio for Xen on Arm
> 
> I did not see that before. Also, I'm not familiar with the ioreq
> mechanism. But from skimming the patch, it seems like it achieves the
> same thing (dynamic creation of virtio devices at runtime). Is that
> right?

I am not aware of any mechanism with virtio-mmio to notify a new device 
after the OS booted. But virtio-pci should allow you to do as as this is 
just a PCI device.

However, you will still need to size the PCI hostbridge I/O region 
correctly when the domain creation. Not sure if this would be an issue 
in your use case.

> 
>> But the idea of a Xen specific transport is discussed on the mailing
>> list time to time. It would be more secure than existing transport,
>> but I am worried about the adoption of the transport.
> 
> What are the security issues with the existing transport mechanisms?
In the Xen PV model, a backend cannot access the frontend memory unless 
the latter did explictly grant.

In the default virtio-{mmio, pci} model, a backend must have full access 
to the frontend memory. This can be an issue if you don't trust your 
backend or it can get compromised.

> I'm quite new to the Xen community, so I have no idea about adoption
> rates.
> 
>> A new transport requires to modify all the OSes so they can work on
>> Xen.
> 
> Just to be clear: They would need to be modified in order to support
> that mechanism, but it changes nothing about the interface between
> hypervisor and guest.

Right, this is the first bit I am more concerned about. IMHO, the main 
goal of virtio is to allow moving from one hypervisor to another without 
(or possibly limited) changing the guest OS code.

Adding a new transport open source OS for a new transport is fairly 
easy, but it may be harder to justify for proprietary OS if it only 
benefits Xen.

That said, if we can convince other hypervisor vendors to adopt it then 
most of my concern are moot :).

> 
> However, supporting the same use case with an already existing
> transport mechanism is more elegant than building another transport
> mechanism specifically for that case IMO. The only technical difference
> between my implementation and the virtio-mmio approach in actually
> running the virtio device is that I'm using event channels for queue
> notification while virtio-mmio uses some bytes in memory for that. I do
> not have any measurements indicating whether or not this makes a
> difference.

The virtio-mmio notification is potentially going to be expensive on Xen 
because the guest because a vCPU will be blocked until the I/O has been 
handled by the IOREQ server.

The notification would look like:
     1) Frontend write in notification address
     2) Trap in Xen
     3) Pause the vCPU and forward the I/O to the IOREQ server (e.g. 
your virtio backend)
     4) Schedule the domain where the IOREQ server resides
     5) Wait for the I/O completion
     6) Unpause the vCPU
     7) Return to guest

We may be able to optimize as there is no need to wait for the I/O to 
complete when we notify.

Cheers,

-- 
Julien Grall

