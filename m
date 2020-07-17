Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955DA224027
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 18:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwSs4-0000k9-OW; Fri, 17 Jul 2020 16:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jwSs3-0000k4-IJ
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 16:05:59 +0000
X-Inumbo-ID: 66902204-c847-11ea-b7bb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66902204-c847-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595001958;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qPLkfG26nVJQE1VRNe7hHilAbOaWUvxJtkEm7+xAYT8=;
 b=WmO9bsPaRfY9b3hWXw5zu8nqHrzqKdd2QdMQQPKdamVZj0DP9qiQ3wdZ
 rPmikRiZ5WVb/AK+ww4A4yEvLDBK5DTqc7ED6Kg+g3gMVxb/cDsqp9SYL
 ppUlqCAhZoNzvUN4fZDsG/y6MoMOgvEhfHUqLODM4HGQ+EwFX/8itY5f7 k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EihqMnwZ2rXBRismD7B9rCDGE/8NctwbucE9w3ZE6Mr5PGYHbmVGrNM7DJ7dJQft/dq0TRPFfP
 bi2VKoGoRnpXc0tep4g+0cCvjg6mDCNCUE9omVRW24jnCrJZ7cQGMFOb9gWRh6XywOasyDWze0
 gzWetkEf6xHiKuAeARazKykf4ueBo4Brs39eqIPfZ/pnhorjDjspT3f5qCwX7FH2/OcfXEHR5X
 gmP7G2RzfgnDPLZs6cCNaTxQIGYzKB1MHtOv3xYoxv7fQca6nye3mcrFnzUbbHULvLklNJfg7m
 EuY=
X-SBRS: 2.7
X-MesageID: 23484045
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="23484045"
Date: Fri, 17 Jul 2020 18:05:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: PCI devices passthrough on Arm design proposal
Message-ID: <20200717160550.GZ7191@Air-de-Roger>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Rahul Singh <Rahul.Singh@arm.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 03:47:25PM +0000, Bertrand Marquis wrote:
> > On 17 Jul 2020, at 17:26, Julien Grall <julien@xen.org> wrote:
> > On 17/07/2020 15:47, Bertrand Marquis wrote:
> >>>>> * Dom0Less implementation will require to have the capacity inside Xen to discover the PCI devices (without depending on Dom0 to declare them to Xen).
> >>>>> 
> >>>>> # Enable the existing x86 virtual PCI support for ARM:
> >>>>> 
> >>>>> The existing VPCI support available for X86 is adapted for Arm. When the device is added to XEN via the hyper call “PHYSDEVOP_pci_device_add”, VPCI handler for the config space access is added to the PCI device to emulate the PCI devices.
> >>>>> 
> >>>>> A MMIO trap handler for the PCI ECAM space is registered in XEN so that when guest is trying to access the PCI config space, XEN will trap the access and emulate read/write using the VPCI and not the real PCI hardware.
> >>>>> 
> >>>>> Limitation:
> >>>>> * No handler is register for the MSI configuration.
> >>>>> * Only legacy interrupt is supported and tested as of now, MSI is not implemented and tested.
> >>>> IIRC, legacy interrupt may be shared between two PCI devices. How do you plan to handle this on Arm?
> >> We plan to fix this by adding proper support for MSI in the long term.
> >> For the use case where MSI is not supported or not wanted we might have to find a way to forward the hardware interrupt to several guests to emulate some kind of shared interrupt.
> > 
> > Sharing interrupts are a bit pain because you couldn't take advantage of the direct EOI in HW and have to be careful if one guest doesn't EOI in timely maneer.
> > 
> > This is something I would rather avoid unless there is a real use case for it.
> 
> I would expect that most recent hardware will support MSI and this
> will not be needed.

Well, PCI Express mandates MSI support, so while this is just a spec,
I would expect most (if not all) devices to support MSI (or MSI-X), as
Arm platforms haven't implemented legacy PCI anyway.

> When MSI is not used, the only solution would be to enforce that
> devices assigned to different guest are using different interrupts
> which would limit the number of domains being able to use PCI
> devices on a bus to 4 (if the enumeration can be modified correctly
> to assign the interrupts properly).
> 
> If we all agree that this is an acceptable limitation then we would
> not need the “interrupt sharing”.

I might be easier to start by just supporting devices that have MSI
(or MSI-X) and then move to legacy interrupts if required?

You should have most of the pieces you require already implemented
since that's what x86 uses, and hence could reuse almost all of it?

IIRC Julien even said that Arm was likely to require much less traps
than x86 for accesses to MSI and MSI-X since you could allow untrusted
guests to write directly to the registers as there's another piece of
hardware that would already translate the interrupts?

I think it's fine to use this workaround while you don't have MSI
support in order to start testing and upstreaming stuff, but maybe
that shouldn't be committed?

Roger.

