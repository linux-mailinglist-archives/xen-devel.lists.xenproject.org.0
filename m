Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1357A475FAA
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 18:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247506.426795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYMd-0000CS-RM; Wed, 15 Dec 2021 17:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247506.426795; Wed, 15 Dec 2021 17:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxYMd-00009e-Np; Wed, 15 Dec 2021 17:46:51 +0000
Received: by outflank-mailman (input) for mailman id 247506;
 Wed, 15 Dec 2021 17:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBW1=RA=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mxYMc-0008Ht-Ss
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 17:46:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa9fec3c-5dce-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 18:46:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26215B8204D;
 Wed, 15 Dec 2021 17:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3895EC36AE0;
 Wed, 15 Dec 2021 17:46:47 +0000 (UTC)
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
X-Inumbo-ID: fa9fec3c-5dce-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639590408;
	bh=oVAWRtkVhyLVewrr96Eqb3xtvZVqpmLF7lafQtqO6io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDn0d3Wgo9MrkKkAlhFp4clsP7kYBq6OP2oGHpB+ZI+/t6B5qJsnoCzurjsB46fWy
	 AoK6Or0D4ayB4bHwvQH/ebEEdMkczC3evphKuABc44ElX4jTf+p1dRuhuUK9c1usOI
	 gwGgUwjsoCjjzpzu2MRgkv/yDC8qQwbLbyooW/C4=
Date: Wed, 15 Dec 2021 18:46:45 +0100
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
Subject: Re: [patch V4 09-02/35] PCI/MSI: Allocate MSI device data on first
 use
Message-ID: <YboqBZuwu5qDwxKS@kroah.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de>
 <87tuf9rdoj.ffs@tglx>
 <87r1adrdje.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1adrdje.ffs@tglx>

On Wed, Dec 15, 2021 at 06:19:49PM +0100, Thomas Gleixner wrote:
> Allocate MSI device data on first use, i.e. when a PCI driver invokes one
> of the PCI/MSI enablement functions.
> 
> Add a wrapper function to ensure that the ordering vs. pcim_msi_release()
> is correct.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

