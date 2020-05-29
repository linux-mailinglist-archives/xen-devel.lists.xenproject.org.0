Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1841E725A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 04:03:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeUMh-0003Nl-P5; Fri, 29 May 2020 02:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F66H=7L=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jeUMg-0003Ng-Il
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 02:03:18 +0000
X-Inumbo-ID: 8f4866e8-a150-11ea-a85a-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f4866e8-a150-11ea-a85a-12813bfff9fa;
 Fri, 29 May 2020 02:03:16 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04T21puW121232;
 Fri, 29 May 2020 02:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=1DrUzr8iNDuy+mdtvz3XzNbrgeH8IM8IGqzi1tapQ60=;
 b=rTDzgnhVuu5mGfDVdgNNcrLujUua9cGYdnjngXVho/grDBxaQotormUOKs+IUw2CLoh1
 lI14dyA3qnEs2R9mimPztTUtyPypFJQJHKx7qnBZu6YK+XBYBD0HTF2rZqNwiguaiHeY
 paFsuKMzkCfx7WmMt5+mm1KxPmwi19M3jKCPnqkgwG4ooOTDaCbBVfU6x2bPcpNSRSC9
 Mw9T+slMc0R+KQEQB8/tPirFxCtzOnQ+3AYjyhPxSTzc8gcFW8AVp6DQ4HSpNev53vo+
 i8b+vqCg7q0ues3m5bP9yDfRUNmLoF29kAEMHT41cFV5lTg/Pu4kIF2kIVDGNK36RxwI mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 318xbk81pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 May 2020 02:03:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04T239ho142956;
 Fri, 29 May 2020 02:03:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 317ddtqq21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 02:03:12 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04T22w8a024931;
 Fri, 29 May 2020 02:02:58 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 28 May 2020 19:02:58 -0700
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH] xen/pci: Get rid of verbose_request and use dev_dbg() instead
Date: Thu, 28 May 2020 22:24:52 -0400
Message-Id: <1590719092-8578-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290012
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 cotscore=-2147483648
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005290012
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
Cc: bhelgaas@google.com, jgross@suse.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org,
 konrad.wilk@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Information printed under verbose_request is clearly used for debugging
only. Remove it and use dev_dbg() instead.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 drivers/pci/xen-pcifront.c                  | 27 +++++++++-------------
 drivers/xen/xen-pciback/conf_space.c        | 14 ++++--------
 drivers/xen/xen-pciback/conf_space_header.c | 20 +++++------------
 drivers/xen/xen-pciback/pciback.h           |  2 --
 drivers/xen/xen-pciback/pciback_ops.c       | 35 +++++++++--------------------
 5 files changed, 31 insertions(+), 67 deletions(-)

diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
index d1b16cf..fab267e 100644
--- a/drivers/pci/xen-pcifront.c
+++ b/drivers/pci/xen-pcifront.c
@@ -77,9 +77,6 @@ static inline void pcifront_init_sd(struct pcifront_sd *sd,
 static DEFINE_SPINLOCK(pcifront_dev_lock);
 static struct pcifront_device *pcifront_dev;
 
-static int verbose_request;
-module_param(verbose_request, int, 0644);
-
 static int errno_to_pcibios_err(int errno)
 {
 	switch (errno) {
@@ -190,18 +187,16 @@ static int pcifront_bus_read(struct pci_bus *bus, unsigned int devfn,
 	struct pcifront_sd *sd = bus->sysdata;
 	struct pcifront_device *pdev = pcifront_get_pdev(sd);
 
-	if (verbose_request)
-		dev_info(&pdev->xdev->dev,
-			 "read dev=%04x:%02x:%02x.%d - offset %x size %d\n",
-			 pci_domain_nr(bus), bus->number, PCI_SLOT(devfn),
-			 PCI_FUNC(devfn), where, size);
+	dev_dbg(&pdev->xdev->dev,
+		"read dev=%04x:%02x:%02x.%d - offset %x size %d\n",
+		pci_domain_nr(bus), bus->number, PCI_SLOT(devfn),
+		PCI_FUNC(devfn), where, size);
 
 	err = do_pci_op(pdev, &op);
 
 	if (likely(!err)) {
-		if (verbose_request)
-			dev_info(&pdev->xdev->dev, "read got back value %x\n",
-				 op.value);
+		dev_dbg(&pdev->xdev->dev, "read got back value %x\n",
+			op.value);
 
 		*val = op.value;
 	} else if (err == -ENODEV) {
@@ -229,12 +224,10 @@ static int pcifront_bus_write(struct pci_bus *bus, unsigned int devfn,
 	struct pcifront_sd *sd = bus->sysdata;
 	struct pcifront_device *pdev = pcifront_get_pdev(sd);
 
-	if (verbose_request)
-		dev_info(&pdev->xdev->dev,
-			 "write dev=%04x:%02x:%02x.%d - "
-			 "offset %x size %d val %x\n",
-			 pci_domain_nr(bus), bus->number,
-			 PCI_SLOT(devfn), PCI_FUNC(devfn), where, size, val);
+	dev_dbg(&pdev->xdev->dev,
+		"write dev=%04x:%02x:%02x.%d - offset %x size %d val %x\n",
+		pci_domain_nr(bus), bus->number,
+		PCI_SLOT(devfn), PCI_FUNC(devfn), where, size, val);
 
 	return errno_to_pcibios_err(do_pci_op(pdev, &op));
 }
diff --git a/drivers/xen/xen-pciback/conf_space.c b/drivers/xen/xen-pciback/conf_space.c
index f2df4e5..059de92 100644
--- a/drivers/xen/xen-pciback/conf_space.c
+++ b/drivers/xen/xen-pciback/conf_space.c
@@ -156,9 +156,7 @@ int xen_pcibk_config_read(struct pci_dev *dev, int offset, int size,
 	 * (as if device didn't respond) */
 	u32 value = 0, tmp_val;
 
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "read %d bytes at 0x%x\n",
-			   size, offset);
+	dev_dbg(&dev->dev, "read %d bytes at 0x%x\n", size, offset);
 
 	if (!valid_request(offset, size)) {
 		err = XEN_PCI_ERR_invalid_offset;
@@ -197,9 +195,7 @@ int xen_pcibk_config_read(struct pci_dev *dev, int offset, int size,
 	}
 
 out:
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev,
-			   "read %d bytes at 0x%x = %x\n", size, offset, value);
+	dev_dbg(&dev->dev, "read %d bytes at 0x%x = %x\n", size, offset, value);
 
 	*ret_val = value;
 	return xen_pcibios_err_to_errno(err);
@@ -214,10 +210,8 @@ int xen_pcibk_config_write(struct pci_dev *dev, int offset, int size, u32 value)
 	u32 tmp_val;
 	int field_start, field_end;
 
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev,
-			   "write request %d bytes at 0x%x = %x\n", size,
-			   offset, value);
+	dev_dbg(&dev->dev, "write request %d bytes at 0x%x = %x\n",
+		size, offset, value);
 
 	if (!valid_request(offset, size))
 		return XEN_PCI_ERR_invalid_offset;
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index b277b68..ac45cdc 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -68,36 +68,30 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 
 	dev_data = pci_get_drvdata(dev);
 	if (!pci_is_enabled(dev) && is_enable_cmd(value)) {
-		if (unlikely(verbose_request))
-			dev_printk(KERN_DEBUG, &dev->dev, "enable\n");
+		dev_dbg(&dev->dev, "enable\n");
 		err = pci_enable_device(dev);
 		if (err)
 			return err;
 		if (dev_data)
 			dev_data->enable_intx = 1;
 	} else if (pci_is_enabled(dev) && !is_enable_cmd(value)) {
-		if (unlikely(verbose_request))
-			dev_printk(KERN_DEBUG, &dev->dev, "disable\n");
+		dev_dbg(&dev->dev, "disable\n");
 		pci_disable_device(dev);
 		if (dev_data)
 			dev_data->enable_intx = 0;
 	}
 
 	if (!dev->is_busmaster && is_master_cmd(value)) {
-		if (unlikely(verbose_request))
-			dev_printk(KERN_DEBUG, &dev->dev, "set bus master\n");
+		dev_dbg(&dev->dev, "set bus master\n");
 		pci_set_master(dev);
 	} else if (dev->is_busmaster && !is_master_cmd(value)) {
-		if (unlikely(verbose_request))
-			dev_printk(KERN_DEBUG, &dev->dev, "clear bus master\n");
+		dev_dbg(&dev->dev, "clear bus master\n");
 		pci_clear_master(dev);
 	}
 
 	if (!(cmd->val & PCI_COMMAND_INVALIDATE) &&
 	    (value & PCI_COMMAND_INVALIDATE)) {
-		if (unlikely(verbose_request))
-			dev_printk(KERN_DEBUG, &dev->dev,
-				   "enable memory-write-invalidate\n");
+		dev_dbg(&dev->dev, "enable memory-write-invalidate\n");
 		err = pci_set_mwi(dev);
 		if (err) {
 			dev_warn(&dev->dev, "cannot enable memory-write-invalidate (%d)\n",
@@ -106,9 +100,7 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 		}
 	} else if ((cmd->val & PCI_COMMAND_INVALIDATE) &&
 		   !(value & PCI_COMMAND_INVALIDATE)) {
-		if (unlikely(verbose_request))
-			dev_printk(KERN_DEBUG, &dev->dev,
-				   "disable memory-write-invalidate\n");
+		dev_dbg(&dev->dev, "disable memory-write-invalidate\n");
 		pci_clear_mwi(dev);
 	}
 
diff --git a/drivers/xen/xen-pciback/pciback.h b/drivers/xen/xen-pciback/pciback.h
index 7c95516..f1ed2db 100644
--- a/drivers/xen/xen-pciback/pciback.h
+++ b/drivers/xen/xen-pciback/pciback.h
@@ -186,8 +186,6 @@ static inline void xen_pcibk_release_devices(struct xen_pcibk_device *pdev)
 int xen_pcibk_xenbus_register(void);
 void xen_pcibk_xenbus_unregister(void);
 
-extern int verbose_request;
-
 void xen_pcibk_test_and_schedule_op(struct xen_pcibk_device *pdev);
 #endif
 
diff --git a/drivers/xen/xen-pciback/pciback_ops.c b/drivers/xen/xen-pciback/pciback_ops.c
index 8545ca7..e11a743 100644
--- a/drivers/xen/xen-pciback/pciback_ops.c
+++ b/drivers/xen/xen-pciback/pciback_ops.c
@@ -15,9 +15,6 @@
 #include <linux/sched.h>
 #include "pciback.h"
 
-int verbose_request;
-module_param(verbose_request, int, 0644);
-
 static irqreturn_t xen_pcibk_guest_interrupt(int irq, void *dev_id);
 
 /* Ensure a device is has the fake IRQ handler "turned on/off" and is
@@ -148,9 +145,6 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 	struct xen_pcibk_dev_data *dev_data;
 	int status;
 
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "enable MSI\n");
-
 	if (dev->msi_enabled)
 		status = -EALREADY;
 	else if (dev->msix_enabled)
@@ -169,8 +163,8 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 	 * the local domain's IRQ number. */
 
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "MSI: %d\n", op->value);
+
+	dev_dbg(&dev->dev, "MSI: %d\n", op->value);
 
 	dev_data = pci_get_drvdata(dev);
 	if (dev_data)
@@ -183,9 +177,6 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 int xen_pcibk_disable_msi(struct xen_pcibk_device *pdev,
 			  struct pci_dev *dev, struct xen_pci_op *op)
 {
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "disable MSI\n");
-
 	if (dev->msi_enabled) {
 		struct xen_pcibk_dev_data *dev_data;
 
@@ -196,8 +187,9 @@ int xen_pcibk_disable_msi(struct xen_pcibk_device *pdev,
 			dev_data->ack_intr = 1;
 	}
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "MSI: %d\n", op->value);
+
+	dev_dbg(&dev->dev, "MSI: %d\n", op->value);
+
 	return 0;
 }
 
@@ -210,8 +202,7 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 	struct msix_entry *entries;
 	u16 cmd;
 
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "enable MSI-X\n");
+	dev_dbg(&dev->dev, "enable MSI-X\n");
 
 	if (op->value > SH_INFO_MAX_VEC)
 		return -EINVAL;
@@ -244,10 +235,8 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 			if (entries[i].vector) {
 				op->msix_entries[i].vector =
 					xen_pirq_from_irq(entries[i].vector);
-				if (unlikely(verbose_request))
-					dev_printk(KERN_DEBUG, &dev->dev,
-						"MSI-X[%d]: %d\n", i,
-						op->msix_entries[i].vector);
+				dev_dbg(&dev->dev, "MSI-X[%d]: %d\n", i,
+					op->msix_entries[i].vector);
 			}
 		}
 	} else
@@ -267,9 +256,6 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 int xen_pcibk_disable_msix(struct xen_pcibk_device *pdev,
 			   struct pci_dev *dev, struct xen_pci_op *op)
 {
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "disable MSI-X\n");
-
 	if (dev->msix_enabled) {
 		struct xen_pcibk_dev_data *dev_data;
 
@@ -284,8 +270,9 @@ int xen_pcibk_disable_msix(struct xen_pcibk_device *pdev,
 	 * an undefined IRQ value of zero.
 	 */
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
-	if (unlikely(verbose_request))
-		dev_printk(KERN_DEBUG, &dev->dev, "MSI-X: %d\n", op->value);
+
+	dev_dbg(&dev->dev, "MSI-X: %d\n", op->value);
+
 	return 0;
 }
 #endif
-- 
1.8.3.1


