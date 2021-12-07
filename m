Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641B146B4AD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240638.417314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVHQ-0005W9-GO; Tue, 07 Dec 2021 07:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240638.417314; Tue, 07 Dec 2021 07:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVHQ-0005S0-CF; Tue, 07 Dec 2021 07:52:52 +0000
Received: by outflank-mailman (input) for mailman id 240638;
 Tue, 07 Dec 2021 07:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muVHO-0002w4-8x
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:52:50 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac8636e6-5732-11ec-8a4d-196798b21f7b;
 Tue, 07 Dec 2021 08:52:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51239B816CE;
 Tue,  7 Dec 2021 07:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6456CC341C1;
 Tue,  7 Dec 2021 07:52:47 +0000 (UTC)
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
X-Inumbo-ID: ac8636e6-5732-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863568;
	bh=vCZmCfds9fGR8KSqYGfBdedJROQkJKaIyrhFh2LFF/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtoyV3RRzvoi0PrEYpfpDPeITXhIwQvbjxWqx411JpOHn7PGizTjybev6iCzICEYY
	 x7Ns6xV/QcCyjvP8JXB3nGwo7wrEGnRfcS9iW3/uqjpuUAP24nFL5MSwkRYf5HSMjP
	 n2TcEjgXaACoJgRlEa1cjKloYE1WcawlchFz/aAA=
Date: Tue, 7 Dec 2021 08:52:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Will Deacon <will@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 28/36] PCI/MSI: Use __msi_get_virq() in
 pci_get_vector()
Message-ID: <Ya8SzYpOcsbItjkU@kroah.com>
References: <20211206210307.625116253@linutronix.de>
 <20211206210439.181331216@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210439.181331216@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:41PM +0100, Thomas Gleixner wrote:
> Use msi_get_vector() and handle the return value to be compatible.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


