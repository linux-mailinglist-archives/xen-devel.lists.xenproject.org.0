Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90945F7E3
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233585.405316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMW-0002qu-7L; Sat, 27 Nov 2021 01:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233585.405316; Sat, 27 Nov 2021 01:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMW-0002oX-28; Sat, 27 Nov 2021 01:18:44 +0000
Received: by outflank-mailman (input) for mailman id 233585;
 Sat, 27 Nov 2021 01:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMU-0002cc-Ea
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:18:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4160b5e-4f1f-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:18:41 +0100 (CET)
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
X-Inumbo-ID: f4160b5e-4f1f-11ec-b941-1df2895da90e
Message-ID: <20211126223824.263656943@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7H7+YC/Q3X3DUjW7OFUmpmZxFX8YbEmXXunUPCxWTOo=;
	b=Q/BWnFgpqlk/Xfzvk8Enumd9Tv9t7JEEp0DHi4rSBSx9/fQFTFOMhfhrRh+HvFyTryJZg6
	2H6cR7D0a+EEDQ8oQg0OU7d/nbqiZhQyNFyo4bhXjmQLINx5jNITNbKUROyMi6k5AylsFk
	GuHYww9m3gcDcaQkDt89XO76miQ2YMD954fX/YwE6Q6bHL3HhsHaFps2ULrwJQWThfnBPG
	3yUvPsmNh5MonSc8cW1Dzr6keAHLf3o1bfK6y28a4Y/W5AQZNjHBs9tfcg+nJDTYJSjRF0
	mmE0bpwDggg4+Lb75ngYAkUXqkaFYQLfA0sUdXi6vjtaa9R6ZCz5sQ03QYCLSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=7H7+YC/Q3X3DUjW7OFUmpmZxFX8YbEmXXunUPCxWTOo=;
	b=lOPEaRrjbm3G3ojV4Pxdg64aaahnAv+fh0zcGZd7hniH2wr2smlEjYaa9TlnTbAnZ42z1s
	Y9bOJ0tKC/T204Cg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 03/22] genirq/msi: Guard sysfs code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:39 +0100 (CET)

No point in building unused code when CONFIG_SYSFS=n.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/msi.h |   10 ++++++++++
 kernel/irq/msi.c    |    2 ++
 2 files changed, 12 insertions(+)

--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -239,9 +239,19 @@ void __pci_write_msi_msg(struct msi_desc
 void pci_msi_mask_irq(struct irq_data *data);
 void pci_msi_unmask_irq(struct irq_data *data);
 
+#ifdef CONFIG_SYSFS
 const struct attribute_group **msi_populate_sysfs(struct device *dev);
 void msi_destroy_sysfs(struct device *dev,
 		       const struct attribute_group **msi_irq_groups);
+#else
+static inline const struct attribute_group **msi_populate_sysfs(struct device *dev)
+{
+	return NULL;
+}
+static inline void msi_destroy_sysfs(struct device *dev, const struct attribute_group **msi_irq_groups)
+{
+}
+#endif
 
 /*
  * The arch hooks to setup up msi irqs. Default functions are implemented
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -72,6 +72,7 @@ void get_cached_msi_msg(unsigned int irq
 }
 EXPORT_SYMBOL_GPL(get_cached_msi_msg);
 
+#ifdef CONFIG_SYSFS
 static ssize_t msi_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
@@ -204,6 +205,7 @@ void msi_destroy_sysfs(struct device *de
 		kfree(msi_irq_groups);
 	}
 }
+#endif
 
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 static inline void irq_chip_write_msi_msg(struct irq_data *data,


