Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936E80AF8D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 23:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650815.1016624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBj83-0002Dh-01; Fri, 08 Dec 2023 22:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650815.1016624; Fri, 08 Dec 2023 22:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBj82-0002As-Sw; Fri, 08 Dec 2023 22:15:26 +0000
Received: by outflank-mailman (input) for mailman id 650815;
 Fri, 08 Dec 2023 22:15:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBj81-0002AW-L2
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 22:15:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46e1029d-9617-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 23:15:22 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A6E14625E4;
 Fri,  8 Dec 2023 22:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F182C433C7;
 Fri,  8 Dec 2023 22:15:18 +0000 (UTC)
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
X-Inumbo-ID: 46e1029d-9617-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702073720;
	bh=Ha/wmXPQCbdxxQFnVSlTzopr1J5CWlZTgjxmMqdAYGk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LTWrVesl6oX3wVUIhMhp8blfITncMg9ec998Y/6Wlcgz3nuyK8FqBo4Pv1e/Pc+Tl
	 Tyt/ol0fpH3mxbZNK5FniW+oh4TRNf7Kel+xsmAJcIe1JtT3Ck1/06Oeg5x2+TJIMo
	 pUDqaz3/FWqIy0+XvcYrj//qBDsJH5/4az8QBJN5Fp6QrUw0jN287fB22oX4+sCtjh
	 h7ATUeBzPHOdz3Gh+ARUcJxLALv9y0n+oMzGbDfat9SsklaXGP4K7BJdARMTaSWWMl
	 ExTFxcJOJfybN4EZzKd6gMpEfj94r5oHipMTjlsFN5LPYUIgNXyrVAB8eLZkM//3I+
	 Z1hC1SrOdDG+w==
Date: Fri, 8 Dec 2023 14:15:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
    David Woodhouse <dwmw@amazon.co.uk>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Vikram Garhwal <vikram.garhwal@amd.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    stewart.hildebrand@amd.com
Subject: Re: Adding MSI support for virtio-pci to QEMU as Xen backend on
 ARM
In-Reply-To: <PAVPR03MB10102178A70BF72984FFAF8CD848AA@PAVPR03MB10102.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2312081407250.1703076@ubuntu-linux-20-04-desktop>
References: <PAVPR03MB10102178A70BF72984FFAF8CD848AA@PAVPR03MB10102.eurprd03.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Stewart

On Fri, 8 Dec 2023, Mykyta Poturai wrote:
> Hello everyone,
> 
> I am currently working on adding MSI support to virtio-pci on ARM with Xen.

Excellent!


> As far as I understand QEMU Xen ARM machine that is used for virtio-pci device emulation does not initialize any interrupt controllers. And that makes it somewhat unclear what is the best approach to adding the MSI support. So, I would appreciate some thoughts on this.
> To trigger the MSI interrupt in Xen guests we basically need to call a single DMOP, which I am also implementing.

You should be able to call xen_inject_msi


> So far, I have come up with 3 possible approaches:
> 1. Hooking up the existing GIC code to the Xen Arm machine and extending it with the DMOP call.

No, I would rather avoid this for a couple of reasons. In reality, the
GIC is emulated by Xen, not QEMU. So letting QEMU think that QEMU is
emulating a GIC is more error prone than the alternatives and also it
would allocate resources needlessly.


> 2. Writing some new barebones GIC implementation with only the required methods (something similar to xen_apic.c).
> 3. Just hooking up the DMOP call to the existing PCI code based on xen_enabled() check.

I would rather not introduce any more if (xen_enabled()) checks beyond
the ones we already have unless it is the only option. So I would go
with option 2). Even better if we could reuse xen_apic.c. xen_apic.c is
just a stub, which is basically the same thing that we need here.

