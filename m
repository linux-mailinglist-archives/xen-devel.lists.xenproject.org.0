Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D246B4A7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 08:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240631.417292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVH6-0004PE-UI; Tue, 07 Dec 2021 07:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240631.417292; Tue, 07 Dec 2021 07:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muVH6-0004N5-Pf; Tue, 07 Dec 2021 07:52:32 +0000
Received: by outflank-mailman (input) for mailman id 240631;
 Tue, 07 Dec 2021 07:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3MF5=QY=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1muVH5-0002w4-Hw
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 07:52:31 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0a2902c-5732-11ec-8a4d-196798b21f7b;
 Tue, 07 Dec 2021 08:52:30 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E5A4DCE1A02;
 Tue,  7 Dec 2021 07:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FDEC341C6;
 Tue,  7 Dec 2021 07:52:26 +0000 (UTC)
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
X-Inumbo-ID: a0a2902c-5732-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1638863547;
	bh=nCz2eprBDDZQ3hphsrTchcKKsptlZR6ElROa48+S3D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THSlYZzdDomIjyopvU5UfNwTG47lpNK4jXGRHhOoFNXwX5+imnG0HcAyKtwYLRR5x
	 nrrwNNGJQmDJIgRHihmrMpGobufnGW2QTi+2XkoTvxG8s0uo8t2HjLG/kOjX2Oo5zw
	 Z8t/Sg2MiIE1W7osNN65DigsH0oO3jivQutxb2t4=
Date: Tue, 7 Dec 2021 08:52:24 +0100
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
Subject: Re: [patch V2 19/36] PCI/MSI: Store properties in device::msi::data
Message-ID: <Ya8SuMnuZ4I64xLh@kroah.com>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.688216619@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210438.688216619@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:26PM +0100, Thomas Gleixner wrote:
> Store the properties which are interesting for various places so the MSI
> descriptor fiddling can be removed.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



