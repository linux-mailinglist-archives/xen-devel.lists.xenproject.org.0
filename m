Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383337ED83A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 00:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633866.989011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3PLS-00021A-2I; Wed, 15 Nov 2023 23:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633866.989011; Wed, 15 Nov 2023 23:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3PLR-0001ys-VW; Wed, 15 Nov 2023 23:30:53 +0000
Received: by outflank-mailman (input) for mailman id 633866;
 Wed, 15 Nov 2023 23:30:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3PLR-0001ym-1K
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 23:30:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02b2e8a9-840f-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 00:30:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A91006187E;
 Wed, 15 Nov 2023 23:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CD4C433CA;
 Wed, 15 Nov 2023 23:30:47 +0000 (UTC)
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
X-Inumbo-ID: 02b2e8a9-840f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700091049;
	bh=YYlHbc3CxA8d1oFkdy/g6rt3DSzIM+c1uTeMAX68Ux8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ooer/TlxsG/u/Uu6lWjFymmzLY9Fv+t5IAEObgRJSbaTIlT2a4T69RBCpvwA3x5bv
	 6Zqrzwn2p15ZnRe7L1eNLiW8262HORjFl1VbGCbpN9hnYuNOwUEQ7H4AGFJZN5IJYY
	 ul65BOahuWtBb98VAby5na+x7ka2I1qTMbkTXvbSK8k0YZjwvtJVoU9YXFQ2/tOQYV
	 wcXYSKEV5bQrE9Db2nIYUVt5l6Q3c0kIjf05XayOQxOX8zWfmLLUl2qxmM6GrK8IsW
	 Xa7a28MSheSyk9UGYK66peS8HwdLFX3401tmW1JaSiZRqltNvrM2vlj5Zh4tdw7NTg
	 0HGaDC69vxpmA==
Date: Wed, 15 Nov 2023 15:30:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, vikram.garhwal@amd.com, 
    stewart.hildebrand@amd.com
Subject: Re: [RFC PATCH 5/6] xen/arm: Intercept vPCI config accesses and
 forward them to emulator
In-Reply-To: <d290546d-ff44-40d8-aca1-e421bf045481@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311151528580.160649@ubuntu-linux-20-04-desktop>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com> <20231115112611.3865905-6-Sergiy_Kibrik@epam.com> <d290546d-ff44-40d8-aca1-e421bf045481@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Nov 2023, Julien Grall wrote:
> Hi,
> 
> On 15/11/2023 11:26, Sergiy Kibrik wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > This is needed for supporting virtio-pci.
> > 
> > In case when the PCI Host bridge is emulated outside of Xen
> > (IOREQ server), we need some mechanism to intercept config space
> > accesses on Xen on Arm, and forward them to the emulator
> > (for example, virtio backend) via IOREQ request.
> > 
> > Unlike x86, on Arm these accesses are MMIO, there is no CFC/CF8 method
> > to detect which PCI device is targeted.
> > 
> > In order to not mix PCI passthrough with virtio-pci features we add
> > one more region to cover the total configuration space for all possible
> > host bridges which can serve virtio-pci devices for that guest.
> > We expose one PCI host bridge per virtio backend domain.
> I am a little confused. If you expose one PCI host bridge per virtio backend,
> then why can't the backend simply register the MMIO region and do the
> translation itself when it receives the read/write?
> 
> To me, it only makes sense for Xen to emulate the host bridge access if you
> plan to have one host bridge shared between multiple IOREQ domains or mix with
> PCI pasthrough.

+1

This is exactly what Stewart, Vikram and I were thinking


> From my perspective, I don't expect we would have that many virtio PCI
> devices. So imposing a host bridge per device emulator will mean extra
> resource in the guest as well (they need to keep track of all the hostbridge).

+1


> So in the longer run, I think we want to allow mixing PCI passthrough and
> virtio-PCI (or really any emulated PCI because nothing here is virtio
> specific).

+1


> For now, your approach would be OK to enable virtio PCI on Xen. But I don't
> think there are any changes necessary in Xen other than reserving some MMIO
> regions/IRQ.

I don't mean to slow down EPAM, but I think we can jump in and do the
necessary changes to vPCI for everyone's benefits and with a timeframe
that works for AMD, EPAM and the Xen community.

