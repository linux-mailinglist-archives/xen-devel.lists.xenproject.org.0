Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC2E2566D9
	for <lists+xen-devel@lfdr.de>; Sat, 29 Aug 2020 12:39:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kByG6-00014B-VS; Sat, 29 Aug 2020 10:38:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1EQo=CH=leiner.me=simon@srs-us1.protection.inumbo.net>)
 id 1kByG4-000146-Vq
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2020 10:38:53 +0000
X-Inumbo-ID: 8a0aa0cc-0315-4483-9a12-bd6ab2bf81ee
Received: from mx2.mailbox.org (unknown [80.241.60.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a0aa0cc-0315-4483-9a12-bd6ab2bf81ee;
 Sat, 29 Aug 2020 10:38:50 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id BDAA4A010F;
 Sat, 29 Aug 2020 12:38:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id CxAZZPBN5ZXI; Sat, 29 Aug 2020 12:38:44 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0
Subject: Re: Virtio Xen (WAS: Re: [Linux] [ARM] Granting memory obtained from
 the DMA API)
From: Simon Leiner <simon@leiner.me>
In-Reply-To: <9bbea2a9-76f8-6384-3cff-3ae65e0475fa@xen.org>
Date: Sat, 29 Aug 2020 12:38:43 +0200
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <9AFF0FE3-F808-453F-91B1-74F9C7426FE7@leiner.me>
References: <32922E87-9F50-41B3-A321-3212697CF7DB@leiner.me>
 <b45a40e3-ea9d-0eef-ea99-88201be83511@xen.org>
 <44f2d486-e3bd-6a44-042d-f05b5d0c0732@leiner.me>
 <9bbea2a9-76f8-6384-3cff-3ae65e0475fa@xen.org>
To: Julien Grall <julien@xen.org>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.72 / 15.00 / 15.00
X-Rspamd-Queue-Id: 3AD1A389
X-Rspamd-UID: a04be1
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

Hi Julien,

On 25.08.20 15:02, Julien Grall wrote:
> May I ask why did you create a new transport rather than using the
> existing one?

We wanted a mechanism for dynamically creating virtio devices at 
runtime. I looked at virtio-mmio briefly and it seemed to me that a lot 
of things would have to be known in advance (how many devices are 
there? How much memory do they need? Where does the memory range for 
virtio-mmio start on the device domain?). So after reading a bit about 
Xen and how the classic split drivers work, I figured building a split 
driver for virtio was the way to go. The basic principle is really 
simple:

 - Using grants to share memory for the virtqueues
 - Using event channels as a queue notification mechanism
 - All state handling and other information exchange (like number of 
   queues, grant refs, event channel numbers etc.) is done through the 
   Xenbus.

On the Linux side, this is implemented as a kernel module. No patches 
to the kernel itself (apart from the ones I sent in earlier) or to Xen 
itself are required.

> So far, there is an RFC to implement virtio-mmio for Xen on Arm

I did not see that before. Also, I'm not familiar with the ioreq 
mechanism. But from skimming the patch, it seems like it achieves the 
same thing (dynamic creation of virtio devices at runtime). Is that 
right?

> But the idea of a Xen specific transport is discussed on the mailing
> list time to time. It would be more secure than existing transport,
> but I am worried about the adoption of the transport. 

What are the security issues with the existing transport mechanisms?
I'm quite new to the Xen community, so I have no idea about adoption 
rates.

> A new transport requires to modify all the OSes so they can work on 
> Xen.

Just to be clear: They would need to be modified in order to support 
that mechanism, but it changes nothing about the interface between 
hypervisor and guest.

However, supporting the same use case with an already existing 
transport mechanism is more elegant than building another transport 
mechanism specifically for that case IMO. The only technical difference 
between my implementation and the virtio-mmio approach in actually 
running the virtio device is that I'm using event channels for queue 
notification while virtio-mmio uses some bytes in memory for that. I do 
not have any measurements indicating whether or not this makes a 
difference.

> Do see any use of this transport outside of Xen? 

This mechanism relies on the Xenbus, so no.

Greetings,
Simon

