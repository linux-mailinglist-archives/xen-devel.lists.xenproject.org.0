Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5C5475FA9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 18:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247505.426784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYMT-0008Jm-JG; Wed, 15 Dec 2021 17:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247505.426784; Wed, 15 Dec 2021 17:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYMT-0008Hz-GD; Wed, 15 Dec 2021 17:46:41 +0000
Received: by outflank-mailman (input) for mailman id 247505;
 Wed, 15 Dec 2021 17:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBW1=RA=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mxYMR-0008Ht-KC
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 17:46:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ce79bf-5dce-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 18:46:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21FF8618FF;
 Wed, 15 Dec 2021 17:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC38C36AE0;
 Wed, 15 Dec 2021 17:46:34 +0000 (UTC)
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
X-Inumbo-ID: f2ce79bf-5dce-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639590395;
	bh=8eon80aBZeFq23Odf9TNhXLZ0kuufkyxyEQ2UyQvkqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkCoNkhqYhaWsFSTKJpb77W8nbK6xBhgXx04HDrtcU3wqKWjQXiGzgyhrmLZyIcpi
	 MQjyZk+Z77/94x42VRHSfHDxYxwbhzyU1x8FRVQnYWLIzTIG39Is2wA6fDhqQ2fpqP
	 n5B4SefG3RtkmGRq+Q9AMgbeRnK4rPW85FgQYoxs=
Date: Wed, 15 Dec 2021 18:46:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V4 09-01/35] PCI/MSI: Decouple MSI[-X] disable from
 pcim_release()
Message-ID: <Ybop+ZdUQSqGkOxe@kroah.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de>
 <87tuf9rdoj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuf9rdoj.ffs@tglx>

On Wed, Dec 15, 2021 at 06:16:44PM +0100, Thomas Gleixner wrote:
> The MSI core will introduce runtime allocation of MSI related data. This
> data will be devres managed and has to be set up before enabling
> PCI/MSI[-X]. This would introduce an ordering issue vs. pcim_release().
> 
> The setup order is:
> 
>    pcim_enable_device()
> 	devres_alloc(pcim_release...);
> 	...
> 	pci_irq_alloc()
> 	  msi_setup_device_data()
> 	     devres_alloc(msi_device_data_release, ...)
> 
> and once the device is released these release functions are invoked in the
> opposite order:
> 
>     msi_device_data_release()
>     ...
>     pcim_release()
>        pci_disable_msi[x]()
> 
> which is obviously wrong, because pci_disable_msi[x]() requires the MSI
> data to be available to tear down the MSI[-X] interrupts.
> 
> Remove the MSI[-X] teardown from pcim_release() and add an explicit action
> to be installed on the attempt of enabling PCI/MSI[-X].
> 
> This allows the MSI core data allocation to be ordered correctly in a
> subsequent step.
> 
> Reported-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V4: New patch


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

