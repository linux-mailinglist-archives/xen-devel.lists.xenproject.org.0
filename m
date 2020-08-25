Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29152252321
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 23:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAgq9-0002TJ-2g; Tue, 25 Aug 2020 21:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQdE=CD=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1kAgq7-0002TD-EH
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 21:50:47 +0000
X-Inumbo-ID: ac5661fc-183d-43d1-86b8-42d4999868c3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac5661fc-183d-43d1-86b8-42d4999868c3;
 Tue, 25 Aug 2020 21:50:46 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A15A52071E;
 Tue, 25 Aug 2020 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598392246;
 bh=gW+Kyw7s85pdMJPiT0EVkW6Spjh+vc5Xsc9aIaZqua4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=0BQ40nfdAlXqJPs3OOuI8Ssn8Z2O1utLGfnyOGGfrGgtMOdZwjF6A6hpeJPR5QK8L
 zHVj7bNvVxIRWyAC7LyGPDLGu28DQvzx2X5ca5Y+ZPQYMZcIW5UFyhZSPDO/puDRNo
 h4qQTdX65oO39OhH+kTAORXVv3Ory/yw/07uwYPU=
Date: Tue, 25 Aug 2020 16:50:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 linux-pci@vger.kernel.org, linux-hyperv@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch RFC 34/38] x86/msi: Let pci_msi_prepare() handle non-PCI
 MSI
Message-ID: <20200825215044.GA1932869@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dtmxvjy.fsf@nanos.tec.linutronix.de>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25, 2020 at 11:30:41PM +0200, Thomas Gleixner wrote:
> On Tue, Aug 25 2020 at 15:24, Bjorn Helgaas wrote:
> > On Fri, Aug 21, 2020 at 02:24:58AM +0200, Thomas Gleixner wrote:
> >> Rename it to x86_msi_prepare() and handle the allocation type setup
> >> depending on the device type.
> >
> > I see what you're doing, but the subject reads a little strangely
> 
> Yes :(
> 
> > ("pci_msi_prepare() handling non-PCI" stuff) since it doesn't mention
> > the rename.  Maybe not practical or worthwhile to split into a rename
> > + make generic, I dunno.
> 
> What about
> 
> x86/msi: Rename and rework pci_msi_prepare() to cover non-PCI MSI

Perfect!

