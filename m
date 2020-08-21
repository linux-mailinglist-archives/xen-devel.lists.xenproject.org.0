Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999924CACB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlM-00057e-3C; Fri, 21 Aug 2020 02:26:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wca-0002BQ-Ue
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:36 +0000
X-Inumbo-ID: 50e7ff84-5f3a-47b7-b3f9-747f978dc6ad
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50e7ff84-5f3a-47b7-b3f9-747f978dc6ad;
 Fri, 21 Aug 2020 02:17:02 +0000 (UTC)
Message-Id: <20200821002947.168173557@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Xil47Xitq/gy2CFriIqkg6fmKg4rUeNmWQC3UIIAE6w=;
 b=yE78YKBWeQJNRno/mhgAqmoyeOTKFwnOmAuRZQ5SkOa0rdPcXDsezUiMafpbmddhT8YtRx
 Q48PBPl5MCz8RE+vKQS6FvAoswzKSqltLT8dz4hEt8NfisI3WqmgK4DKoERYansXMAOCPd
 EwBdwb4DFqgc98F1KE4se7KtWer9ytqTsAhj9vGzByVYJQv/UCteKvlg8RR+c36Z6ixDcJ
 BD6gKlCjCebIEAR5oyxn66+VkJnohi7LOi/o0l5x7UMgjimXfDEJyg400bRHlBN1oBEuWP
 fTTG6828E//dV9xRZEjoWhFP+b/n2Z4ZMMIf+ezYaZKeZkEJp8dyTlXQ87/pZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=Xil47Xitq/gy2CFriIqkg6fmKg4rUeNmWQC3UIIAE6w=;
 b=WP3SvXjrxQ5y0nFAbsID3Pj/5cUANa6inm+6T4+n98lsoiLiw/u7pX1jx+Twz/Mxho32Av
 rocr6eby1iKkoNCA==
Date: Fri, 21 Aug 2020 02:24:43 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Jon Derrick <jonathan.derrick@intel.com>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
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
Subject: [patch RFC 19/38] irqdomain/msi: Provide DOMAIN_BUS_VMD_MSI
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="genirq-msi--Provide-DOMAIN_BUS_VMD_MSI.patch"
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

PCI devices behind a VMD bus are not subject to interrupt remapping, but
the irq domain for VMD MSI cannot be distinguished from a regular PCI/MSI
irq domain.

Add a new domain bus token and allow it in the bus token check in
msi_check_reservation_mode() to keep the functionality the same once VMD
uses this token.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jon Derrick <jonathan.derrick@intel.com>
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


