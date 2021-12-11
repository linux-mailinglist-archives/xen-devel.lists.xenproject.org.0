Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3347137F
	for <lists+xen-devel@lfdr.de>; Sat, 11 Dec 2021 11:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245257.423296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvzzP-0003ce-Sw; Sat, 11 Dec 2021 10:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245257.423296; Sat, 11 Dec 2021 10:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvzzP-0003aq-Pg; Sat, 11 Dec 2021 10:52:27 +0000
Received: by outflank-mailman (input) for mailman id 245257;
 Sat, 11 Dec 2021 10:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nohm=Q4=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1mvzzO-0003ak-NN
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 10:52:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b82a0d8-5a70-11ec-a74f-db008197e53d;
 Sat, 11 Dec 2021 11:52:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 055A4CE2F5A;
 Sat, 11 Dec 2021 10:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF2CC004DD;
 Sat, 11 Dec 2021 10:52:15 +0000 (UTC)
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
X-Inumbo-ID: 6b82a0d8-5a70-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1639219936;
	bh=wYn3ADgLYrPQRMceGNbHRArEW/qGU4RTivEh07HgNkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAf7FtjgctjlDptzlNxV8fA3znYlVJNDypd8oQHEjx1RtkgLeLO9oxpSgU9GK3SCc
	 z2Wg40TFAAHywhOUN03n3v8rTHjtLCaU0Zd26IKCxh/K1WU9EKzUXOZELH1gHM5jvE
	 aHi5wUh0c0gFevijVyLgi+69QnKhHhM0tojBtX5A=
Date: Sat, 11 Dec 2021 11:52:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Stuart Yoder <stuyoder@gmail.com>,
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
Subject: Re: [patch V3 03/35] x86/apic/msi: Use PCI device MSI property
Message-ID: <YbSC2GadkARsAIA8@kroah.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.372357371@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221813.372357371@linutronix.de>

On Fri, Dec 10, 2021 at 11:18:47PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> instead of fiddling with MSI descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

