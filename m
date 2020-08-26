Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B801252D5E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu7P-0008Mo-3n; Wed, 26 Aug 2020 12:01:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7N-00083C-Ap
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:29 +0000
X-Inumbo-ID: 3b0841d5-10a6-4670-b4b2-2d7f3e533b6d
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b0841d5-10a6-4670-b4b2-2d7f3e533b6d;
 Wed, 26 Aug 2020 12:01:24 +0000 (UTC)
Message-Id: <20200826112332.954409970@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=ua6NqpYSmZApI6uP+18lDgw4EnjAETLTuYc3KhfX2+w=;
 b=eJn39pF++R7y4RiJv9aME9HZXKzf7AMtx9gOIQ/KZhoM3Ld0hlH/DnKGJSmV3hVK7ueYqX
 g1TpG290lPqFhzmAKo6hqVmPwqEyrX7rt/PhmQiixSoeLrqPBxlBTb7V5nlKo9FeeO68w9
 P+nP/kWZ0Q3FfsrwOaftJfMc0rekm49YPAwe1NBLe4ss62eDgjZkUMH5SBARbrLVSeCsHW
 9wSFLRhkhyvmHyqMypfoAkbY6kL/Y1hZFdrfo2aarMJtV0+1qhqRZ+WGFKj/hsCV4En27V
 zyFSS2ZxL7C8PQ53C1/a/Tt9WRdp2fAapfBPmUw2+7K8K2Qi+jcv21W0IVT5RQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=ua6NqpYSmZApI6uP+18lDgw4EnjAETLTuYc3KhfX2+w=;
 b=hT/OBr4eTGEXyMwMWWHmsjom0DAsmwGAPtkbOlxE5LrlE3lHi77XHAXMud4bbKn68MLXI3
 kEfd4yz3w6MRPuDQ==
Date: Wed, 26 Aug 2020 13:16:51 +0200
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
Subject: [patch V2 23/46] irqdomain/msi: Provide DOMAIN_BUS_VMD_MSI
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

From: Thomas Gleixner <tglx@linutronix.de>

PCI devices behind a VMD bus are not subject to interrupt remapping, but
the irq domain for VMD MSI cannot be distinguished from a regular PCI/MSI
irq domain.

Add a new domain bus token and allow it in the bus token check in
msi_check_reservation_mode() to keep the functionality the same once VMD
uses this token.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 include/linux/irqdomain.h |    1 +
 kernel/irq/msi.c          |    7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -84,6 +84,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_FSL_MC_MSI,
 	DOMAIN_BUS_TI_SCI_INTA_MSI,
 	DOMAIN_BUS_WAKEUP,
+	DOMAIN_BUS_VMD_MSI,
 };
 
 /**
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -370,8 +370,13 @@ static bool msi_check_reservation_mode(s
 {
 	struct msi_desc *desc;
 
-	if (domain->bus_token != DOMAIN_BUS_PCI_MSI)
+	switch(domain->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
+	case DOMAIN_BUS_VMD_MSI:
+		break;
+	default:
 		return false;
+	}
 
 	if (!(info->flags & MSI_FLAG_MUST_REACTIVATE))
 		return false;



