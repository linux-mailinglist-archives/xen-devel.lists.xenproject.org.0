Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF225C701
	for <lists+xen-devel@lfdr.de>; Thu,  3 Sep 2020 18:36:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kDsCr-0006H4-JP; Thu, 03 Sep 2020 16:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=su+M=CM=intel.com=ashok.raj@srs-us1.protection.inumbo.net>)
 id 1kDsCq-0006Gz-Gw
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2020 16:35:24 +0000
X-Inumbo-ID: 11df204a-dee9-4b43-bfa9-f51799617fe6
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11df204a-dee9-4b43-bfa9-f51799617fe6;
 Thu, 03 Sep 2020 16:35:22 +0000 (UTC)
IronPort-SDR: KgKnbdRcsDUYdL69UWVeKH69RZ7+deD8CVgwRCFT52bUDxzfqG4us4WfaqhceKiJHNtaqJKUFQ
 2SuoEAuPBoeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157623236"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="157623236"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 09:35:21 -0700
IronPort-SDR: fpm2EUkci2oTbjGtopGBquDwwKng+PMe+foZPSI3HK+bv08KmruAxr7wF/55ACFaKSLBoUxQVH
 vLRGOXY9BheA==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="503124720"
Received: from araj-mobl1.jf.intel.com ([10.254.124.120])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 09:35:18 -0700
Date: Thu, 3 Sep 2020 09:35:16 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
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
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Ashok Raj <ashok.raj@intel.com>
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device MSI
Message-ID: <20200903163516.GA23129@araj-mobl1.jf.intel.com>
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200826111628.794979401@linutronix.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
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

Hi Thomas,

Thanks a ton for jumping in helping on straightening it for IMS!!!


On Wed, Aug 26, 2020 at 01:16:28PM +0200, Thomas Gleixner wrote:
> This is the second version of providing a base to support device MSI (non
> PCI based) and on top of that support for IMS (Interrupt Message Storm)

s/Storm/Store

maybe pun intended :-)

> based devices in a halfways architecture independent way.

You mean "halfways" because the message addr and data follow guidelines
per arch (x86 or such), but the location of the storage isn't dictated
by architecture? or did you have something else in mind? 

> 
> The first version can be found here:
> 
>     https://lore.kernel.org/r/20200821002424.119492231@linutronix.de
> 

[snip]

> 
> Changes vs. V1:
> 
>    - Addressed various review comments and addressed the 0day fallout.
>      - Corrected the XEN logic (Jürgen)
>      - Make the arch fallback in PCI/MSI opt-in not opt-out (Bjorn)
> 
>    - Fixed the compose MSI message inconsistency
> 
>    - Ensure that the necessary flags are set for device SMI

is that supposed to be MSI? 

Cheers,
Ashok

