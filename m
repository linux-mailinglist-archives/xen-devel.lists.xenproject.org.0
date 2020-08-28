Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6425593E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 13:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBcSC-0000vg-2e; Fri, 28 Aug 2020 11:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NqGh=CG=arm.com=lorenzo.pieralisi@srs-us1.protection.inumbo.net>)
 id 1kBcSA-0000vZ-8I
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 11:21:54 +0000
X-Inumbo-ID: e78edbc1-bee1-4264-98b9-381dbbe374f3
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e78edbc1-bee1-4264-98b9-381dbbe374f3;
 Fri, 28 Aug 2020 11:21:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10BC931B;
 Fri, 28 Aug 2020 04:21:52 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03F763F66B;
 Fri, 28 Aug 2020 04:21:47 -0700 (PDT)
Date: Fri, 28 Aug 2020 12:21:42 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
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
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
Message-ID: <20200828112142.GA14208@e121166-lin.cambridge.arm.com>
References: <20200826112333.992429909@linutronix.de>
 <20200827182040.GA2049623@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827182040.GA2049623@bjorn-Precision-5520>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Aug 27, 2020 at 01:20:40PM -0500, Bjorn Helgaas wrote:

[...]

> And I can't figure out what's special about tegra, rcar, and xilinx
> that makes them need it as well.  Is there something I could grep for
> to identify them?  Is there a way to convert them so they don't need
> it?

I think DT binding and related firmware support are needed to setup the
MSI IRQ domains correctly, there is nothing special about tegra, rcar
and xilinx AFAIK (well, all native host controllers MSI handling is
*special* just to be polite but let's gloss over this for the time
being).

struct msi_controller, to answer the first question.

I have doubts about pci_mvebu too, they do allocate an msi_controller
but without methods so it looks pretty much useless.

Hyper-V code too seems questionable, maybe there is room for more
clean-ups.

Lorenzo

> > --- a/include/linux/msi.h
> > +++ b/include/linux/msi.h
> > @@ -193,17 +193,38 @@ void pci_msi_mask_irq(struct irq_data *d
> >  void pci_msi_unmask_irq(struct irq_data *data);
> >  
> >  /*
> > - * The arch hooks to setup up msi irqs. Those functions are
> > - * implemented as weak symbols so that they /can/ be overriden by
> > - * architecture specific code if needed.
> > + * The arch hooks to setup up msi irqs. Default functions are implemented
> 
> s/msi/MSI/ to match the one below.
> 
> > + * as weak symbols so that they /can/ be overriden by architecture specific
> > + * code if needed. These hooks must be enabled by the architecture or by
> > + * drivers which depend on them via msi_controller based MSI handling.

