Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFAA6F58DE
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529223.823390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCNr-0007fN-4O; Wed, 03 May 2023 13:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529223.823390; Wed, 03 May 2023 13:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCNr-0007dZ-0a; Wed, 03 May 2023 13:19:03 +0000
Received: by outflank-mailman (input) for mailman id 529223;
 Wed, 03 May 2023 13:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l+lA=AY=amazon.de=prvs=480977c02=mheyne@srs-se1.protection.inumbo.net>)
 id 1puCNq-0007dT-5z
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:19:02 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b465f4-e9b5-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 15:19:00 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 13:18:56 +0000
Received: from EX19D008EUC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-m6i4x-83883bdb.us-west-2.amazon.com (Postfix)
 with ESMTPS id 1C7BB60F81; Wed,  3 May 2023 13:18:53 +0000 (UTC)
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.145) by
 EX19D008EUC001.ant.amazon.com (10.252.51.165) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 May 2023 13:18:52 +0000
Received: from dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (10.15.57.183)
 by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP Server
 id
 15.2.1118.25 via Frontend Transport; Wed, 3 May 2023 13:18:51 +0000
Received: by dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id 38D6595D; Wed,  3 May 2023 13:18:51 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 10b465f4-e9b5-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1683119941; x=1714655941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5qY6hxBY40KASy+98g6jZI4fvE1bwgAl23ESUykmNsg=;
  b=IkmiogEVDztPAwavdF6wMBs1Qo87FT/UxGRsffIvVHhFqiz7JPP1mRxK
   sz01x6kETEXfGqbQudY9MskQO/NHSbU2fjnpIANzi0Lp9RLdx+tj40Dh9
   fcKqVpiMjpI3iwl5AMyjvbtSEvQzLwhM0Fo4aADyIDU78m8vud2Muni+c
   w=;
X-IronPort-AV: E=Sophos;i="5.99,247,1677542400"; 
   d="scan'208";a="327667209"
From: Maximilian Heyne <mheyne@amazon.de>
To: 
CC: Maximilian Heyne <mheyne@amazon.de>, Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Kevin Tian
	<kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ashok Raj
	<ashok.raj@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, <xen-devel@lists.xenproject.org>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] x86/pci/xen: populate MSI sysfs entries
Date: Wed, 3 May 2023 13:16:53 +0000
Message-ID: <20230503131656.15928-1-mheyne@amazon.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit bf5e758f02fc ("genirq/msi: Simplify sysfs handling") reworked the
creation of sysfs entries for MSI IRQs. The creation used to be in
msi_domain_alloc_irqs_descs_locked after calling ops->domain_alloc_irqs.
Then it moved into __msi_domain_alloc_irqs which is an implementation of
domain_alloc_irqs. However, Xen comes with the only other implementation
of domain_alloc_irqs and hence doesn't run the sysfs population code
anymore.

Commit 6c796996ee70 ("x86/pci/xen: Fixup fallout from the PCI/MSI
overhaul") set the flag MSI_FLAG_DEV_SYSFS for the xen msi_domain_info
but that doesn't actually have an effect because Xen uses it's own
domain_alloc_irqs implementation.

Fix this by making use of the fallback functions for sysfs population.

Fixes: bf5e758f02fc ("genirq/msi: Simplify sysfs handling")
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
---
 arch/x86/pci/xen.c  | 8 +++++---
 include/linux/msi.h | 9 ++++++++-
 kernel/irq/msi.c    | 4 ++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 8babce71915f..014c508e914d 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -198,7 +198,7 @@ static int xen_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 		i++;
 	}
 	kfree(v);
-	return 0;
+	return msi_device_populate_sysfs(&dev->dev);
 
 error:
 	if (ret == -ENOSYS)
@@ -254,7 +254,7 @@ static int xen_hvm_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 		dev_dbg(&dev->dev,
 			"xen: msi --> pirq=%d --> irq=%d\n", pirq, irq);
 	}
-	return 0;
+	return msi_device_populate_sysfs(&dev->dev);
 
 error:
 	dev_err(&dev->dev, "Failed to create MSI%s! ret=%d!\n",
@@ -346,7 +346,7 @@ static int xen_initdom_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 		if (ret < 0)
 			goto out;
 	}
-	ret = 0;
+	ret = msi_device_populate_sysfs(&dev->dev);
 out:
 	return ret;
 }
@@ -394,6 +394,8 @@ static void xen_teardown_msi_irqs(struct pci_dev *dev)
 			xen_destroy_irq(msidesc->irq + i);
 		msidesc->irq = 0;
 	}
+
+	msi_device_destroy_sysfs(&dev->dev);
 }
 
 static void xen_pv_teardown_msi_irqs(struct pci_dev *dev)
diff --git a/include/linux/msi.h b/include/linux/msi.h
index cdb14a1ef268..a50ea79522f8 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -383,6 +383,13 @@ int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc);
 void arch_teardown_msi_irq(unsigned int irq);
 int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void arch_teardown_msi_irqs(struct pci_dev *dev);
+#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
+
+/*
+ * Xen uses non-default msi_domain_ops and hence needs a way to populate sysfs
+ * entries of MSI IRQs.
+ */
+#if defined(CONFIG_PCI_XEN) || defined(CONFIG_PCI_MSI_ARCH_FALLBACKS)
 #ifdef CONFIG_SYSFS
 int msi_device_populate_sysfs(struct device *dev);
 void msi_device_destroy_sysfs(struct device *dev);
@@ -390,7 +397,7 @@ void msi_device_destroy_sysfs(struct device *dev);
 static inline int msi_device_populate_sysfs(struct device *dev) { return 0; }
 static inline void msi_device_destroy_sysfs(struct device *dev) { }
 #endif /* !CONFIG_SYSFS */
-#endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
+#endif /* CONFIG_PCI_XEN || CONFIG_PCI_MSI_ARCH_FALLBACKS */
 
 /*
  * The restore hook is still available even for fully irq domain based
diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 7a97bcb086bf..b4c31a5c1147 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -542,7 +542,7 @@ static int msi_sysfs_populate_desc(struct device *dev, struct msi_desc *desc)
 	return ret;
 }
 
-#ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
+#if defined(CONFIG_PCI_MSI_ARCH_FALLBACKS) || defined(CONFIG_PCI_XEN)
 /**
  * msi_device_populate_sysfs - Populate msi_irqs sysfs entries for a device
  * @dev:	The device (PCI, platform etc) which will get sysfs entries
@@ -574,7 +574,7 @@ void msi_device_destroy_sysfs(struct device *dev)
 	msi_for_each_desc(desc, dev, MSI_DESC_ALL)
 		msi_sysfs_remove_desc(dev, desc);
 }
-#endif /* CONFIG_PCI_MSI_ARCH_FALLBACK */
+#endif /* CONFIG_PCI_MSI_ARCH_FALLBACK || CONFIG_PCI_XEN */
 #else /* CONFIG_SYSFS */
 static inline int msi_sysfs_create_group(struct device *dev) { return 0; }
 static inline int msi_sysfs_populate_desc(struct device *dev, struct msi_desc *desc) { return 0; }
-- 
2.39.2




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




