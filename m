Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13ED472051
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 06:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245797.424061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwdfs-0005A8-Bb; Mon, 13 Dec 2021 05:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245797.424061; Mon, 13 Dec 2021 05:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwdfs-00057O-80; Mon, 13 Dec 2021 05:14:56 +0000
Received: by outflank-mailman (input) for mailman id 245797;
 Mon, 13 Dec 2021 05:14:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6tW/=Q6=kernel.org=vkoul@srs-se1.protection.inumbo.net>)
 id 1mwdfq-0004nj-9r
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 05:14:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ab61144-5bd3-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 06:14:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73F0EB80D7C;
 Mon, 13 Dec 2021 05:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E36C00446;
 Mon, 13 Dec 2021 05:14:50 +0000 (UTC)
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
X-Inumbo-ID: 9ab61144-5bd3-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639372491;
	bh=zuuGW5+kS2UVDTK9JZgN0rVsKZ9vO7N+ikVVGGhcFus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGfflIEVbOYzZ4L0+ZwdoUg9quAO5nOi9/UXP3Xmr9G9FMvVyrwT7jr3JP9IGaiFL
	 iDr3OkfoB6b8rQrplP3MBZ21trYA1fHZJ/P6K9OgJk7ys8npF3ZR421z8PmAzyK7at
	 mVJOPb6bRTPOptJL+XKRuXrxiPG2olj+FZeiYHjN4ZRoI7C3Src7FeNuQiJmp+bUMG
	 xPtHLVBnuBhLRIQdqXBDutn2NvWHHNDEQKnckdYO0OUOOTJAyaAkyCOddpx7Tk6abA
	 UbXFRd62tmtswrOO2et02MquRCBkv8NhukN03R6Wud8Ms+/tbnOLTtPGic26cUTGyv
	 Al/o3XGCyfNBQ==
Date: Mon, 13 Dec 2021 10:44:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [patch V3 35/35] dmaengine: qcom_hidma: Cleanup MSI handling
Message-ID: <YbbWx1LhPEtF/9pp@matsya>
References: <20211210221642.869015045@linutronix.de>
 <20211210221815.329792721@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221815.329792721@linutronix.de>

On 10-12-21, 23:19, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> There is no reason to walk the MSI descriptors to retrieve the interrupt
> number for a device. Use msi_get_virq() instead.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

