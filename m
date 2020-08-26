Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8AB252DD5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:06:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAuCM-0001sY-T0; Wed, 26 Aug 2020 12:06:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu8y-000821-A1
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:03:08 +0000
X-Inumbo-ID: 0a051cbe-f8cb-4b7f-9558-f0183e09efe2
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a051cbe-f8cb-4b7f-9558-f0183e09efe2;
 Wed, 26 Aug 2020 12:01:43 +0000 (UTC)
Message-Id: <20200826112334.400700807@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XS2OtPL63+BbeAwrgOvQZ62jjX8dKd2NUee/RefW/jE=;
 b=g7xv50ATWyf0Y9KZtfd5GDP7gv+ub4Reyp3zzVcltJZHJTLFQiFFXZP+cdXkZqtXlfvIpG
 tdDcnRDMiB+NAD5pfoxdVPRDMENd5IGhIAds5207sNs7ZFUbnwlncbC9MFo6M3VyfOi/E2
 sTAtg0h0YKOOz9nDA3vW1m6MWO8ZCD3zzYaI7xVc9jcBd/G5iYloQEx+PRC6EaWAe2KhaK
 owm1ZICVZYAXvrQzrjTMUaGTpQ4IZGqclzgFWEqg5L8qaWofCWb0s81fNwQhQPAj02rxjV
 cyoLMosaH14iqtGJnoLcXp3hzvcc4rpt7+YOBBmYbBg+vQie4RgCA7KB9JgMBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XS2OtPL63+BbeAwrgOvQZ62jjX8dKd2NUee/RefW/jE=;
 b=YlpLIMOqrorOG1iP3fEgl8h8huJ+SEm1UgkOPUBIUHdgsvpjhvsDnVL85p8wf3l/OswF4l
 3rF6X4dWCwWuIwAQ==
Date: Wed, 26 Aug 2020 13:17:06 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch V2 38/46] iommu/amd: Remove domain search for PCI/MSI
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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

Now that the domain can be retrieved through device::msi_domain the domain
search for PCI_MSI[X] is not longer required. Remove it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: New patch
---
 drivers/iommu/amd/iommu.c |    3 ---
 1 file changed, 3 deletions(-)

--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3548,9 +3548,6 @@ static struct irq_domain *get_irq_domain
 	case X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT:
 	case X86_IRQ_ALLOC_TYPE_HPET_GET_PARENT:
 		return iommu->ir_domain;
-	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
-	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		return iommu->msi_domain;
 	default:
 		WARN_ON_ONCE(1);
 		return NULL;


