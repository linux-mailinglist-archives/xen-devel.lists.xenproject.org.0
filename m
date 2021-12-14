Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F434748C7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246935.425886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBDa-00049G-8K; Tue, 14 Dec 2021 17:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246935.425886; Tue, 14 Dec 2021 17:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBDa-00046v-5D; Tue, 14 Dec 2021 17:03:58 +0000
Received: by outflank-mailman (input) for mailman id 246935;
 Tue, 14 Dec 2021 17:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iTjg=Q7=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mxBDY-00046n-Pl
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:03:56 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc0ebb62-5cff-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 18:03:48 +0100 (CET)
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
X-Inumbo-ID: cc0ebb62-5cff-11ec-85d3-df6b77346a89
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639501430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RXDy+gEt+jM/GLA+wNxlJEuBnWYy8r3p2Ru1kkxGm4Q=;
	b=4P9YNy0ES7591XCDm5PSWup8bN4QZP7lauZPNqzguglGF810Qx6tlHC+ni+cCTXT//bRrL
	8sy8xtbBW2WNueS1zjqp8h8A0yb4naQSxUV7RBh2hqT1tsFq6begUYU0evqtkPzN01b278
	fd9gHbaeywBmVDCmDPd2qQ/zpjMiaB9wQAqsRoE0OI6pkTd0Mdkr8wct9zyvWczqltcPfP
	gVFurKQstARHhwA4cqkMjQuwW0a240akK7UOWCq2KqJXtL/Zk07hDvbDB6Geb3dHg82+ku
	rQEa7JysFMGTutJcrfi+Bj+sn5C4cesBd4+iCf7oAFV+qmPbWW589QvaRwSxBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639501430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RXDy+gEt+jM/GLA+wNxlJEuBnWYy8r3p2Ru1kkxGm4Q=;
	b=NEaZQwUVupGSoHFBC83jQ5nykyNdZrjtpZRBFsQka5WyTgqzd9VoqFy4Lrz/ewIMzZW0fK
	mYumgixv6qanTNBQ==
To: Nishanth Menon <nm@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, linux-pci@vger.kernel.org, Cedric Le Goater
 <clg@kaod.org>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>, Tero Kristo <kristo@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, Mark Rutland
 <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 linux-wireless@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
Subject: Re: [patch V3 00/35] genirq/msi, PCI/MSI: Spring cleaning - Part 2
In-Reply-To: <87wnk7rvnz.ffs@tglx>
References: <20211210221642.869015045@linutronix.de>
 <20211213182958.ytj4m6gsg35u77cv@detonator> <87fsqvttfv.ffs@tglx>
 <20211214162247.ocjm7ihg5oi7uiuv@slider> <87wnk7rvnz.ffs@tglx>
Date: Tue, 14 Dec 2021 18:03:50 +0100
Message-ID: <87tufbrudl.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Dec 14 2021 at 17:36, Thomas Gleixner wrote:
> On Tue, Dec 14 2021 at 10:22, Nishanth Menon wrote:
>> On 10:41-20211214, Thomas Gleixner wrote:
> [   13.478122] Call trace:
> [   13.509042]  msi_device_destroy_sysfs+0x18/0x88
> [   13.509058]  msi_domain_free_irqs+0x34/0x58
> [   13.509064]  pci_msi_teardown_msi_irqs+0x30/0x3c
> [   13.509072]  free_msi_irqs+0x78/0xd4
> [   13.509077]  pci_disable_msix+0x138/0x164
> [   13.529930]  pcim_release+0x70/0x238
> [   13.529942]  devres_release_all+0x9c/0xfc
> [   13.529951]  device_release_driver_internal+0x1a0/0x244
> [   13.542725]  device_release_driver+0x18/0x24
> [   13.542741]  iwl_req_fw_callback+0x1a28/0x1ddc [iwlwifi]
> [   13.552308]  request_firmware_work_func+0x50/0x9c
> [   13.552320]  process_one_work+0x194/0x25c
>
> That's not a driver problem, that's an ordering issue vs. the devres
> muck. Let me go back to the drawing board. Sigh...

Which is pretty obvious why:

   pcim_enable_device()
        devres_alloc(pcim_release...);
        ...
        pci_irq_alloc()
          msi_setup_device_data()
             devres_alloc(msi_device_data_release, ...)

and once the device is released:

    msi_device_data_release()
    ...
    pcim_release()
       pci_disable_msi[x]()

Groan....

