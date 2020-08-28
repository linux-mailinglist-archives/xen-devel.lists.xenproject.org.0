Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAFE255BA8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 15:54:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBeoO-0006T8-Bj; Fri, 28 Aug 2020 13:53:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N3OX=CG=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1kBeoN-0006T3-Il
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 13:52:59 +0000
X-Inumbo-ID: 4ba84421-71ee-44dc-8ce1-9a6e3b44ea2f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ba84421-71ee-44dc-8ce1-9a6e3b44ea2f;
 Fri, 28 Aug 2020 13:52:58 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FD3420776;
 Fri, 28 Aug 2020 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598622778;
 bh=T7BIgnulmA7Rr4VLtFe5t2nLsQIXVYWoUuHXGZx4Vjs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Uo6SO5R2ezrJiBPDRV1S93w8bWqnRhEY+W9XY9s6oSe7cKp02czOoNpg0rTdv9o0Q
 ph8kxjMp/pXOSqcn2p1nxoQjh6mHG7VaVIxPqsu1ZI8ntzCsqdwIurHSpRrEdA3w+Q
 ZxybgY1fooOM/99PO34iLFdwoPHAMX5TShHXGqVU=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kBeoK-007Qex-8b; Fri, 28 Aug 2020 14:52:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 28 Aug 2020 14:52:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, LKML
 <linux-kernel@vger.kernel.org>, x86@kernel.org, Joerg Roedel
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Jon
 Derrick <jonathan.derrick@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>, Dave Jiang
 <dave.jiang@intel.com>, Alex Williamson <alex.williamson@redhat.com>, Jacob
 Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>, Rob Herring
 <robh@kernel.org>
Subject: Re: [patch V2 34/46] PCI/MSI: Make arch_.*_msi_irq[s] fallbacks
 selectable
In-Reply-To: <20200828125403.GR1152540@nvidia.com>
References: <20200826112333.992429909@linutronix.de>
 <20200827182040.GA2049623@bjorn-Precision-5520>
 <20200828112142.GA14208@e121166-lin.cambridge.arm.com>
 <20200828121944.GQ1152540@nvidia.com>
 <0cc8bfd9258dfc507585fd0f19a945e3@kernel.org>
 <20200828125403.GR1152540@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <9346b8358726185a31f50b0fac257129@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jgg@nvidia.com, lorenzo.pieralisi@arm.com,
 helgaas@kernel.org, tglx@linutronix.de, linux-kernel@vger.kernel.org,
 x86@kernel.org, joro@8bytes.org, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, haiyangz@microsoft.com,
 jonathan.derrick@intel.com, baolu.lu@linux.intel.com, wei.liu@kernel.org,
 kys@microsoft.com, sthemmin@microsoft.com, steve.wahl@hpe.com,
 sivanich@hpe.com, rja@hpe.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 konrad.wilk@oracle.com, xen-devel@lists.xenproject.org, jgross@suse.com,
 boris.ostrovsky@oracle.com, sstabellini@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, megha.dey@intel.com, dave.jiang@intel.com,
 alex.williamson@redhat.com, jacob.jun.pan@intel.com, baolu.lu@intel.com,
 kevin.tian@intel.com, dan.j.williams@intel.com, robh@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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

On 2020-08-28 13:54, Jason Gunthorpe wrote:
> On Fri, Aug 28, 2020 at 01:47:59PM +0100, Marc Zyngier wrote:
> 
>> > So the arch_setup_msi_irq/etc is not really an arch hook, but some
>> > infrastructure to support those 4 PCI root port drivers.
>> 
>> I happen to have a *really old* patch addressing Tegra [1], which
>> I was never able to test (no HW). Rebasing it shouldn't be too hard,
>> and maybe you can find someone internally willing to give it a spin?
> 
> Sure, that helps a bunch, I will ask internally if someone in that BU
> can take a look.

I just rebased[1] the patch onto -rc2, and provided a TODO list in the
commit message.

Thanks,

         M.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/tegra-msi
-- 
Jazz is not dead. It just smells funny...

