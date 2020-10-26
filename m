Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7736299390
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12477.32502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68l-00038J-CR; Mon, 26 Oct 2020 17:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12477.32502; Mon, 26 Oct 2020 17:18:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68l-00037n-8U; Mon, 26 Oct 2020 17:18:39 +0000
Received: by outflank-mailman (input) for mailman id 12477;
 Mon, 26 Oct 2020 17:18:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kX68k-00032c-Lt
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:38 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0ae8421b-87d0-4fbf-a03d-17c905b0a8ef;
 Mon, 26 Oct 2020 17:18:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B487139F;
 Mon, 26 Oct 2020 10:18:34 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCC1E3F719;
 Mon, 26 Oct 2020 10:18:32 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kX68k-00032c-Lt
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:38 +0000
X-Inumbo-ID: 0ae8421b-87d0-4fbf-a03d-17c905b0a8ef
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 0ae8421b-87d0-4fbf-a03d-17c905b0a8ef;
	Mon, 26 Oct 2020 17:18:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B487139F;
	Mon, 26 Oct 2020 10:18:34 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCC1E3F719;
	Mon, 26 Oct 2020 10:18:32 -0700 (PDT)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v1 2/4] xen/pci: Introduce new CONFIG_HAS_PCI_ATS flag for PCI ATS functionality.
Date: Mon, 26 Oct 2020 17:17:52 +0000
Message-Id: <1bb971bed3f5a56b0691fbcfd0346ae721ba049f.1603731279.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>

PCI ATS functionality is not enabled and tested for ARM architecture
but it is enabled for x86 and referenced in common passthrough/pci.c
code.

Therefore introducing the new flag to enable the ATS functionality for
x86 only to avoid issues for ARM architecture.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/x86/Kconfig                     |  1 +
 xen/drivers/passthrough/ats.h            | 24 ++++++++++++++++++++++++
 xen/drivers/passthrough/vtd/x86/Makefile |  2 +-
 xen/drivers/passthrough/x86/Makefile     |  2 +-
 xen/drivers/pci/Kconfig                  |  3 +++
 5 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 24868aa6ad..31906e9c97 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -20,6 +20,7 @@ config X86
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
 	select HAS_PCI
+	select HAS_PCI_ATS
 	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index 22ae209b37..a0af07b287 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -17,6 +17,8 @@
 
 #include <xen/pci_regs.h>
 
+#ifdef CONFIG_HAS_PCI_ATS
+
 #define ATS_REG_CAP    4
 #define ATS_REG_CTL    6
 #define ATS_QUEUE_DEPTH_MASK     0x1f
@@ -48,5 +50,27 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
     return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
 }
 
+#else
+
+static inline int enable_ats_device(struct pci_dev *pdev,
+                                    struct list_head *ats_list)
+{
+    return -ENODEV;
+}
+
+static inline void disable_ats_device(struct pci_dev *pdev) { }
+
+static inline int pci_ats_enabled(int seg, int bus, int devfn)
+{
+    return -ENODEV;
+}
+
+static inline int pci_ats_device(int seg, int bus, int devfn)
+{
+    return -ENODEV;
+}
+
+#endif /* CONFIG_HAS_PCI_ATS */
+
 #endif /* _ATS_H_ */
 
diff --git a/xen/drivers/passthrough/vtd/x86/Makefile b/xen/drivers/passthrough/vtd/x86/Makefile
index 4ef00a4c5b..60f79fe263 100644
--- a/xen/drivers/passthrough/vtd/x86/Makefile
+++ b/xen/drivers/passthrough/vtd/x86/Makefile
@@ -1,3 +1,3 @@
-obj-y += ats.o
+obj-$(CONFIG_HAS_PCI_ATS) += ats.o
 obj-$(CONFIG_HVM) += hvm.o
 obj-y += vtd.o
diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
index a70cf9460d..05e6f51f25 100644
--- a/xen/drivers/passthrough/x86/Makefile
+++ b/xen/drivers/passthrough/x86/Makefile
@@ -1,2 +1,2 @@
-obj-y += ats.o
+obj-$(CONFIG_HAS_PCI_ATS) += ats.o
 obj-y += iommu.o
diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
index 7da03fa13b..1588d4a91e 100644
--- a/xen/drivers/pci/Kconfig
+++ b/xen/drivers/pci/Kconfig
@@ -1,3 +1,6 @@
 
 config HAS_PCI
 	bool
+
+config HAS_PCI_ATS
+	bool
-- 
2.17.1


