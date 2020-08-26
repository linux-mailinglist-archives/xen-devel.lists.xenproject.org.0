Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC774252DE1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAuCU-00026P-1m; Wed, 26 Aug 2020 12:06:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu85-000821-85
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:02:13 +0000
X-Inumbo-ID: 7074e2cc-ed2b-4e21-94d4-7172a1f92a5e
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7074e2cc-ed2b-4e21-94d4-7172a1f92a5e;
 Wed, 26 Aug 2020 12:01:22 +0000 (UTC)
Message-Id: <20200826112332.767707340@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dYN9jX79rKIWQfhP8dq1fK8m0T2bDgxKsf6OxKJhURs=;
 b=KU244bnLCRTLggIkAhPoRrnNk4ecCLY5jSzkQr6tLrIl0Rk53IfMfXlDPNJwZMmLCFLGkD
 FowqqLBIyHL7DDqMUmJGrs0bDiR0AEPQmJOlKQbIc6jWLyGSXeSScT/iGGqH3nE1lbwVJh
 hDGEwBiQjs58m5lMA87cVjCA60Mx4YpaQoRKiP1/+tFJpURnzokJJNJm41O7i4z82WEpGq
 mrTXb25RBx4IIwRjyNMumY46rKZFYwBOnn6FEiCJGF+9CJUHRlIIjM3XetbKQy3rPyH5W5
 0oxvv87MCFdKOtE+q8tpyYW13CiWVcS8XxQGqRrfVTeqS/G6WRa8DXIZoOu31Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=dYN9jX79rKIWQfhP8dq1fK8m0T2bDgxKsf6OxKJhURs=;
 b=L0z/1eeNvfqCZHeoL4JEuN1YMBW1Iiw6iNV20WAqkSdplzffASpgi2hZ4NMQTB/x3w87bA
 czWHTCA8dXDh6gAw==
Date: Wed, 26 Aug 2020 13:16:49 +0200
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
Subject: [patch V2 21/46] x86/pci: Reducde #ifdeffery in PCI init code
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

Adding a function call before the first #ifdef in arch_pci_init() triggers
a 'mixed declarations and code' warning if PCI_DIRECT is enabled.

Use stub functions and move the #ifdeffery to the header file where it is
not in the way.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/x86/include/asm/pci_x86.h |   11 +++++++++++
 arch/x86/pci/init.c            |   10 +++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

--- a/arch/x86/include/asm/pci_x86.h
+++ b/arch/x86/include/asm/pci_x86.h
@@ -114,9 +114,20 @@ extern const struct pci_raw_ops pci_dire
 extern bool port_cf9_safe;
 
 /* arch_initcall level */
+#ifdef CONFIG_PCI_DIRECT
 extern int pci_direct_probe(void);
 extern void pci_direct_init(int type);
+#else
+static inline int pci_direct_probe(void) { return -1; }
+static inline  void pci_direct_init(int type) { }
+#endif
+
+#ifdef CONFIG_PCI_BIOS
 extern void pci_pcbios_init(void);
+#else
+static inline void pci_pcbios_init(void) { }
+#endif
+
 extern void __init dmi_check_pciprobe(void);
 extern void __init dmi_check_skip_isa_align(void);
 
--- a/arch/x86/pci/init.c
+++ b/arch/x86/pci/init.c
@@ -8,11 +8,9 @@
    in the right sequence from here. */
 static __init int pci_arch_init(void)
 {
-#ifdef CONFIG_PCI_DIRECT
-	int type = 0;
+	int type;
 
 	type = pci_direct_probe();
-#endif
 
 	if (!(pci_probe & PCI_PROBE_NOEARLY))
 		pci_mmcfg_early_init();
@@ -20,18 +18,16 @@ static __init int pci_arch_init(void)
 	if (x86_init.pci.arch_init && !x86_init.pci.arch_init())
 		return 0;
 
-#ifdef CONFIG_PCI_BIOS
 	pci_pcbios_init();
-#endif
+
 	/*
 	 * don't check for raw_pci_ops here because we want pcbios as last
 	 * fallback, yet it's needed to run first to set pcibios_last_bus
 	 * in case legacy PCI probing is used. otherwise detecting peer busses
 	 * fails.
 	 */
-#ifdef CONFIG_PCI_DIRECT
 	pci_direct_init(type);
-#endif
+
 	if (!raw_pci_ops && !raw_pci_ext_ops)
 		printk(KERN_ERR
 		"PCI: Fatal: No config space access function found\n");



