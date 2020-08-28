Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5125598A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 13:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBclK-0002mo-5z; Fri, 28 Aug 2020 11:41:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p1XV=CG=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1kBclI-0002mj-Uz
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 11:41:41 +0000
X-Inumbo-ID: d02b3107-2744-439b-ab54-4c7917ec1340
Received: from theia.8bytes.org (unknown
 [2a01:238:4383:600:38bc:a715:4b6d:a889])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d02b3107-2744-439b-ab54-4c7917ec1340;
 Fri, 28 Aug 2020 11:41:39 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B73AF2E1; Fri, 28 Aug 2020 13:41:37 +0200 (CEST)
Date: Fri, 28 Aug 2020 13:41:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
Message-ID: <20200828114131.GA13881@8bytes.org>
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826111628.794979401@linutronix.de>
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

On Wed, Aug 26, 2020 at 01:16:28PM +0200, Thomas Gleixner wrote:
> This is the second version of providing a base to support device MSI (non
> PCI based) and on top of that support for IMS (Interrupt Message Storm)
> based devices in a halfways architecture independent way.
> 
> The first version can be found here:
> 
>     https://lore.kernel.org/r/20200821002424.119492231@linutronix.de
> 
> It's still a mixed bag of bug fixes, cleanups and general improvements
> which are worthwhile independent of device MSI.
> 
> There are quite a bunch of issues to solve:
> 
>   - X86 does not use the device::msi_domain pointer for historical reasons
>     and due to XEN, which makes it impossible to create an architecture
>     agnostic device MSI infrastructure.
> 
>   - X86 has it's own msi_alloc_info data type which is pointlessly
>     different from the generic version and does not allow to share code.
> 
>   - The logic of composing MSI messages in an hierarchy is busted at the
>     core level and of course some (x86) drivers depend on that.
> 
>   - A few minor shortcomings as usual
> 
> This series addresses that in several steps:

For all IOMMU changes:

	Acked-by: Joerg Roedel <jroedel@suse.de>


