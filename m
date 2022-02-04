Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064554AA35B
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 23:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265839.459396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG7I2-0000GQ-2V; Fri, 04 Feb 2022 22:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265839.459396; Fri, 04 Feb 2022 22:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nG7I1-0000Ds-VC; Fri, 04 Feb 2022 22:42:49 +0000
Received: by outflank-mailman (input) for mailman id 265839;
 Fri, 04 Feb 2022 22:42:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wnvI=ST=walle.cc=michael@srs-se1.protection.inumbo.net>)
 id 1nG7I0-0000DW-1r
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 22:42:48 +0000
Received: from ssl.serverraum.org (ssl.serverraum.org [2a01:4f8:151:8464::1:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c549a3d6-860b-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 23:42:46 +0100 (CET)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D23572223A;
 Fri,  4 Feb 2022 23:42:43 +0100 (CET)
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
X-Inumbo-ID: c549a3d6-860b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1644014564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xBouYYDQn0Y1ETqBsjJ4IluMJ7x00/eAmGvWdF7N4Lo=;
	b=mdrN1c1TFf6jS+8vBxc14joHyfdwjje67m0NXF8lAkOcmW3hQSZOrO/8t7kfhEFPaBF+y6
	6GPH7eIcJ4W5E6f7dRb0FJUmzckZvCRyLt05bjR232Pej+SOjfMyqOOhbIdI9d4Y9pCuP9
	nAvhM1o6h737RC72jVioeW+kqGbm/AI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 04 Feb 2022 23:42:43 +0100
From: Michael Walle <michael@walle.cc>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Cc: Bertrand.Marquis@arm.com, Zhiqiang.Hou@nxp.com, brucea@xilinx.com,
 cornelia.bruelhart@zal.aero, julien@xen.org, leo.krueger@zal.aero,
 oleksandr_andrushchenko@epam.com, peng.fan@nxp.com,
 xen-devel@lists.xenproject.org
Subject: Re: Xen data from meta-virtualization layer
In-Reply-To: <alpine.DEB.2.22.394.2202041256040.4074808@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
 <20220204135814.1033356-1-michael@walle.cc>
 <alpine.DEB.2.22.394.2202041256040.4074808@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <faa7864d4df6d9373a3c6b489d3e4469@walle.cc>
X-Sender: michael@walle.cc

Hi Stefano,

Am 2022-02-04 22:11, schrieb Stefano Stabellini:
> On Fri, 4 Feb 2022, Michael Walle wrote:
>> > In regards to the reserved-memory regions, maybe we are not seeing them
>> > because Leo posted the host device tree, not the one passed at runtime
>> > from u-boot to Linux?
>> >
>> > If so, Leo, could you please boot Linux on native (no Xen) and get the
>> > device tree from there at runtime using dtc -I fs -O dts
>> > /proc/device-tree ?
>> >
>> >
>> > However, the name of the reserved-memory region created by u-boot seems
>> > to be "lpi_rd_table". I cannot find any mentions of lpi_rd_table in the
>> > Linux kernel tree either.
>> >
>> > Zhiqiang, Leo is trying to boot Xen on sAL28. Linux booting on Xen
>> > throws errors in regards to GIC/ITS initialization. On other hardware
>> > Xen can use and virtualize GICv3 and ITS just fine. Could you please
>> > explain what is different about sAL28 and how Xen/Linux is expected to
>> > use the lpi_rd_table reserved-memory region?
>> 
>> I actually stumbled across this thread after trying out Xen myself. 
>> I'm
>> using lastest vanilla u-boot (with pending PSCI patches), vanilla 
>> kernel
>> and vanilla Xen.
>> 
>> So far I've discovered, that xen complains that it cannot route IRQ64 
>> to
>> dom0. That is because on the LS1028A there is a dual UART (two 16550
>> with one shared interrupt) and xen takes the first UART and then tries
>> to map the interrupt of the second UART to linux. For now, I don't 
>> know
>> how this is solved correctly. As a quick hack, I removed the second 
>> uart
>> node from the device tree.
> 
> This is an interesting problem. Removing the second UART is a good
> workaround for now as there is no obvious solution I think.

But not a very user friendly one, though. I guess the first UART
is disabled/removed by Xen? I haven't looked at how it is handled.

Can't we search for other uarts with the same interrupt and disable
these, too? Maybe conditionally by the SoC compatible?

>> But what is more severe is that the iommu isn't set up correctly. I'm
>> getting the following faults:
>> 
>> (XEN) smmu: /soc/iommu@5000000: Unexpected global fault, this could be 
>> serious
>> (XEN) smmu: /soc/iommu@5000000: 	GFSR 0x80000002, GFSYNR0 0x00000000, 
>> GFSYNR1 0x0000042a, GFSYNR2 0x00000000
>> 
>> If I decode it correctly, the streamid should be 0x2a which would be 
>> one
>> of the PCI devices on the internal root complex. Probably the network
>> card.
> 
> Yes there is DMA transaction with an "unknown" StreamID. I think the
> StreamID is 0x42a. It means that there is a DMA master on the board 
> with
> StreamID 0x42a that is either:
> 
> - not described in device tree
> - described in device tree with a different StreamID
> - the right StreamID is described device tree, but it is not picked up
>   by Xen

See below.

>> This is the first developer experience with Xen, so please bear with 
>> me
>> :) It seems that Xen doesn't add the master to the IOMMU. To me it 
>> seems
>> that only devices with a 'iommus' dt property are added. But in case 
>> of
>> PCI devices the parent only has a iommu-map property.
>> 
>> And it makes me wonder why Leo has an almost working setup. Maybe I'm
>> missing some patches though.
> 
> Xen 4.16 is able to parse StreamID in the "iommus" property and also
> "mmu-masters" property. But It is not able to parse the "iommu-map"
> property yet. So if 0x42a is described in device tree using "iommu-map"
> then the error makes sense.
> 
> A simple solution is to replace iommu-map with iommus in device tree.

I'm not sure this is so easy, because they are dynamically assigned
by the bootloader. Sure for now I could do that I guess, but iommu=0
works as well ;)

I now got Xen and Linux booting and see the same problems with the
GIC ITS, that is that the enetc interrupts aren't delivered to the
dom0 linux. I've also applied the patch in this thread and I'm
seeing the same as Leo. Full boot log is here [1].

I noticed the following.
[    0.168544] pci 0000:00:00.0: Failed to add - passthrough or 
MSI/MSI-X might fail!

Not sure if it should work nonetheless.

> It is possible that someone in CC to this email might already have a
> patch to introduce parsing of iommu-map in Xen.

I guess they've used the old mmu-masters property.

Btw. I don't know if it matters, but the SMARC-sAL28 normally doesn't
use TF-A and runs without it. Nonetheless, I've booted the board with
the bl31 from NXP and it doesn't help either. There is still a
difference between the NXP bootflow which uses bl1/bl2/bl31/u-boot
and this board which uses u-boot-spl/u-boot or u-boot-spl/bl31/u-boot.

I just found GIC setup code in the bl31. I'll also have a look there.

-michael

[1] https://pastebin.com/raw/XMjE3BvG

