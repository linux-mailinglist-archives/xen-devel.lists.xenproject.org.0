Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C401D1E4C37
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 19:43:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je05g-0004PS-7u; Wed, 27 May 2020 17:43:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NoV=7J=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1je05e-0004PE-9q
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 17:43:42 +0000
X-Inumbo-ID: 99b4c794-a041-11ea-a76e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99b4c794-a041-11ea-a76e-12813bfff9fa;
 Wed, 27 May 2020 17:43:40 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E06420663;
 Wed, 27 May 2020 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590601419;
 bh=FHu3tfr7BLYO0sXAFxkyhkrxhWECuYcejWzTuvTFgAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CCanJ0N/Btr+b4Ga/b0dB9L0ZuLGi7ehHtsrzCbYiwyGckWrmSNf3IUPec5EAtAe5
 EJbB5a6MyeyOQi/0BuS51FMW5A2OTCsNQWLuKCKv6kLlO+wDVqbvdl369m5Jf098BO
 hOwzdpuGfVdptBwUoHkHafOOqexLno+65Brp9cMw=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] xen-pciback: Use dev_printk() when possible
Date: Wed, 27 May 2020 12:43:25 -0500
Message-Id: <20200527174326.254329-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200527174326.254329-1-helgaas@kernel.org>
References: <20200527174326.254329-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Use dev_printk() when possible to include device and driver information in
the conventional format.

Add "#define dev_fmt" when needed to preserve DRV_NAME or KBUILD_MODNAME in
messages.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/xen/xen-pciback/conf_space.c        | 16 +++++----
 drivers/xen/xen-pciback/conf_space_header.c | 40 +++++++++------------
 drivers/xen/xen-pciback/conf_space_quirks.c |  6 ++--
 drivers/xen/xen-pciback/pci_stub.c          | 38 +++++++++-----------
 drivers/xen/xen-pciback/pciback_ops.c       | 38 ++++++++------------
 drivers/xen/xen-pciback/vpci.c              | 10 +++---
 6 files changed, 65 insertions(+), 83 deletions(-)

diff --git a/drivers/xen/xen-pciback/conf_space.c b/drivers/xen/xen-pciback/conf_space.c
index da51a5d34e6e..f2df4e55fc1b 100644
--- a/drivers/xen/xen-pciback/conf_space.c
+++ b/drivers/xen/xen-pciback/conf_space.c
@@ -10,6 +10,8 @@
  * Author: Ryan Wilson <hap9@epoch.ncsc.mil>
  */
 
+#define dev_fmt(fmt) DRV_NAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
@@ -155,8 +157,8 @@ int xen_pcibk_config_read(struct pci_dev *dev, int offset, int size,
 	u32 value = 0, tmp_val;
 
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: read %d bytes at 0x%x\n",
-		       pci_name(dev), size, offset);
+		dev_printk(KERN_DEBUG, &dev->dev, "read %d bytes at 0x%x\n",
+			   size, offset);
 
 	if (!valid_request(offset, size)) {
 		err = XEN_PCI_ERR_invalid_offset;
@@ -196,8 +198,8 @@ int xen_pcibk_config_read(struct pci_dev *dev, int offset, int size,
 
 out:
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: read %d bytes at 0x%x = %x\n",
-		       pci_name(dev), size, offset, value);
+		dev_printk(KERN_DEBUG, &dev->dev,
+			   "read %d bytes at 0x%x = %x\n", size, offset, value);
 
 	*ret_val = value;
 	return xen_pcibios_err_to_errno(err);
@@ -213,9 +215,9 @@ int xen_pcibk_config_write(struct pci_dev *dev, int offset, int size, u32 value)
 	int field_start, field_end;
 
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG
-		       DRV_NAME ": %s: write request %d bytes at 0x%x = %x\n",
-		       pci_name(dev), size, offset, value);
+		dev_printk(KERN_DEBUG, &dev->dev,
+			   "write request %d bytes at 0x%x = %x\n", size,
+			   offset, value);
 
 	if (!valid_request(offset, size))
 		return XEN_PCI_ERR_invalid_offset;
diff --git a/drivers/xen/xen-pciback/conf_space_header.c b/drivers/xen/xen-pciback/conf_space_header.c
index fb4fccb4aecc..b277b689f257 100644
--- a/drivers/xen/xen-pciback/conf_space_header.c
+++ b/drivers/xen/xen-pciback/conf_space_header.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -68,8 +69,7 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 	dev_data = pci_get_drvdata(dev);
 	if (!pci_is_enabled(dev) && is_enable_cmd(value)) {
 		if (unlikely(verbose_request))
-			printk(KERN_DEBUG DRV_NAME ": %s: enable\n",
-			       pci_name(dev));
+			dev_printk(KERN_DEBUG, &dev->dev, "enable\n");
 		err = pci_enable_device(dev);
 		if (err)
 			return err;
@@ -77,8 +77,7 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 			dev_data->enable_intx = 1;
 	} else if (pci_is_enabled(dev) && !is_enable_cmd(value)) {
 		if (unlikely(verbose_request))
-			printk(KERN_DEBUG DRV_NAME ": %s: disable\n",
-			       pci_name(dev));
+			dev_printk(KERN_DEBUG, &dev->dev, "disable\n");
 		pci_disable_device(dev);
 		if (dev_data)
 			dev_data->enable_intx = 0;
@@ -86,34 +85,30 @@ static int command_write(struct pci_dev *dev, int offset, u16 value, void *data)
 
 	if (!dev->is_busmaster && is_master_cmd(value)) {
 		if (unlikely(verbose_request))
-			printk(KERN_DEBUG DRV_NAME ": %s: set bus master\n",
-			       pci_name(dev));
+			dev_printk(KERN_DEBUG, &dev->dev, "set bus master\n");
 		pci_set_master(dev);
 	} else if (dev->is_busmaster && !is_master_cmd(value)) {
 		if (unlikely(verbose_request))
-			printk(KERN_DEBUG DRV_NAME ": %s: clear bus master\n",
-			       pci_name(dev));
+			dev_printk(KERN_DEBUG, &dev->dev, "clear bus master\n");
 		pci_clear_master(dev);
 	}
 
 	if (!(cmd->val & PCI_COMMAND_INVALIDATE) &&
 	    (value & PCI_COMMAND_INVALIDATE)) {
 		if (unlikely(verbose_request))
-			printk(KERN_DEBUG
-			       DRV_NAME ": %s: enable memory-write-invalidate\n",
-			       pci_name(dev));
+			dev_printk(KERN_DEBUG, &dev->dev,
+				   "enable memory-write-invalidate\n");
 		err = pci_set_mwi(dev);
 		if (err) {
-			pr_warn("%s: cannot enable memory-write-invalidate (%d)\n",
-				pci_name(dev), err);
+			dev_warn(&dev->dev, "cannot enable memory-write-invalidate (%d)\n",
+				err);
 			value &= ~PCI_COMMAND_INVALIDATE;
 		}
 	} else if ((cmd->val & PCI_COMMAND_INVALIDATE) &&
 		   !(value & PCI_COMMAND_INVALIDATE)) {
 		if (unlikely(verbose_request))
-			printk(KERN_DEBUG
-			       DRV_NAME ": %s: disable memory-write-invalidate\n",
-			       pci_name(dev));
+			dev_printk(KERN_DEBUG, &dev->dev,
+				   "disable memory-write-invalidate\n");
 		pci_clear_mwi(dev);
 	}
 
@@ -157,8 +152,7 @@ static int rom_write(struct pci_dev *dev, int offset, u32 value, void *data)
 	struct pci_bar_info *bar = data;
 
 	if (unlikely(!bar)) {
-		pr_warn(DRV_NAME ": driver data not found for %s\n",
-		       pci_name(dev));
+		dev_warn(&dev->dev, "driver data not found\n");
 		return XEN_PCI_ERR_op_failed;
 	}
 
@@ -194,8 +188,7 @@ static int bar_write(struct pci_dev *dev, int offset, u32 value, void *data)
 	u32 mask;
 
 	if (unlikely(!bar)) {
-		pr_warn(DRV_NAME ": driver data not found for %s\n",
-		       pci_name(dev));
+		dev_warn(&dev->dev, "driver data not found\n");
 		return XEN_PCI_ERR_op_failed;
 	}
 
@@ -228,8 +221,7 @@ static int bar_read(struct pci_dev *dev, int offset, u32 * value, void *data)
 	struct pci_bar_info *bar = data;
 
 	if (unlikely(!bar)) {
-		pr_warn(DRV_NAME ": driver data not found for %s\n",
-		       pci_name(dev));
+		dev_warn(&dev->dev, "driver data not found\n");
 		return XEN_PCI_ERR_op_failed;
 	}
 
@@ -433,8 +425,8 @@ int xen_pcibk_config_header_add_fields(struct pci_dev *dev)
 
 	default:
 		err = -EINVAL;
-		pr_err("%s: Unsupported header type %d!\n",
-		       pci_name(dev), dev->hdr_type);
+		dev_err(&dev->dev, "Unsupported header type %d!\n",
+			dev->hdr_type);
 		break;
 	}
 
diff --git a/drivers/xen/xen-pciback/conf_space_quirks.c b/drivers/xen/xen-pciback/conf_space_quirks.c
index ed593d1042a6..7dc281086302 100644
--- a/drivers/xen/xen-pciback/conf_space_quirks.c
+++ b/drivers/xen/xen-pciback/conf_space_quirks.c
@@ -6,6 +6,8 @@
  * Author: Chris Bookholt <hap10@epoch.ncsc.mil>
  */
 
+#define dev_fmt(fmt) DRV_NAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include "pciback.h"
@@ -35,8 +37,8 @@ static struct xen_pcibk_config_quirk *xen_pcibk_find_quirk(struct pci_dev *dev)
 		if (match_one_device(&tmp_quirk->devid, dev) != NULL)
 			goto out;
 	tmp_quirk = NULL;
-	printk(KERN_DEBUG DRV_NAME
-	       ": quirk didn't match any device known\n");
+	dev_printk(KERN_DEBUG, &dev->dev,
+		   "quirk didn't match any device known\n");
 out:
 	return tmp_quirk;
 }
diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 7af93d65ed51..e876c3d6dad1 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
 
 #include <linux/module.h>
 #include <linux/init.h>
@@ -626,11 +627,11 @@ static void pcistub_remove(struct pci_dev *dev)
 		if (found_psdev->pdev) {
 			int domid = xen_find_device_domain_owner(dev);
 
-			pr_warn("****** removing device %s while still in-use by domain %d! ******\n",
+			dev_warn(&dev->dev, "****** removing device %s while still in-use by domain %d! ******\n",
 			       pci_name(found_psdev->dev), domid);
-			pr_warn("****** driver domain may still access this device's i/o resources!\n");
-			pr_warn("****** shutdown driver domain before binding device\n");
-			pr_warn("****** to other drivers or domains\n");
+			dev_warn(&dev->dev, "****** driver domain may still access this device's i/o resources!\n");
+			dev_warn(&dev->dev, "****** shutdown driver domain before binding device\n");
+			dev_warn(&dev->dev, "****** to other drivers or domains\n");
 
 			/* N.B. This ends up calling pcistub_put_pci_dev which ends up
 			 * doing the FLR. */
@@ -711,14 +712,12 @@ static pci_ers_result_t common_process(struct pcistub_device *psdev,
 	ret = xen_pcibk_get_pcifront_dev(psdev->dev, psdev->pdev,
 		&aer_op->domain, &aer_op->bus, &aer_op->devfn);
 	if (!ret) {
-		dev_err(&psdev->dev->dev,
-			DRV_NAME ": failed to get pcifront device\n");
+		dev_err(&psdev->dev->dev, "failed to get pcifront device\n");
 		return PCI_ERS_RESULT_NONE;
 	}
 	wmb();
 
-	dev_dbg(&psdev->dev->dev,
-			DRV_NAME ": aer_op %x dom %x bus %x devfn %x\n",
+	dev_dbg(&psdev->dev->dev, "aer_op %x dom %x bus %x devfn %x\n",
 			aer_cmd, aer_op->domain, aer_op->bus, aer_op->devfn);
 	/*local flag to mark there's aer request, xen_pcibk callback will use
 	* this flag to judge whether we need to check pci-front give aer
@@ -754,8 +753,7 @@ static pci_ers_result_t common_process(struct pcistub_device *psdev,
 
 	if (test_bit(_XEN_PCIF_active,
 		(unsigned long *)&sh_info->flags)) {
-		dev_dbg(&psdev->dev->dev,
-			"schedule pci_conf service in " DRV_NAME "\n");
+		dev_dbg(&psdev->dev->dev, "schedule pci_conf service\n");
 		xen_pcibk_test_and_schedule_op(psdev->pdev);
 	}
 
@@ -786,13 +784,12 @@ static pci_ers_result_t xen_pcibk_slot_reset(struct pci_dev *dev)
 				PCI_FUNC(dev->devfn));
 
 	if (!psdev || !psdev->pdev) {
-		dev_err(&dev->dev,
-			DRV_NAME " device is not found/assigned\n");
+		dev_err(&dev->dev, "device is not found/assigned\n");
 		goto end;
 	}
 
 	if (!psdev->pdev->sh_info) {
-		dev_err(&dev->dev, DRV_NAME " device is not connected or owned"
+		dev_err(&dev->dev, "device is not connected or owned"
 			" by HVM, kill it\n");
 		kill_domain_by_device(psdev);
 		goto end;
@@ -844,13 +841,12 @@ static pci_ers_result_t xen_pcibk_mmio_enabled(struct pci_dev *dev)
 				PCI_FUNC(dev->devfn));
 
 	if (!psdev || !psdev->pdev) {
-		dev_err(&dev->dev,
-			DRV_NAME " device is not found/assigned\n");
+		dev_err(&dev->dev, "device is not found/assigned\n");
 		goto end;
 	}
 
 	if (!psdev->pdev->sh_info) {
-		dev_err(&dev->dev, DRV_NAME " device is not connected or owned"
+		dev_err(&dev->dev, "device is not connected or owned"
 			" by HVM, kill it\n");
 		kill_domain_by_device(psdev);
 		goto end;
@@ -902,13 +898,12 @@ static pci_ers_result_t xen_pcibk_error_detected(struct pci_dev *dev,
 				PCI_FUNC(dev->devfn));
 
 	if (!psdev || !psdev->pdev) {
-		dev_err(&dev->dev,
-			DRV_NAME " device is not found/assigned\n");
+		dev_err(&dev->dev, "device is not found/assigned\n");
 		goto end;
 	}
 
 	if (!psdev->pdev->sh_info) {
-		dev_err(&dev->dev, DRV_NAME " device is not connected or owned"
+		dev_err(&dev->dev, "device is not connected or owned"
 			" by HVM, kill it\n");
 		kill_domain_by_device(psdev);
 		goto end;
@@ -956,13 +951,12 @@ static void xen_pcibk_error_resume(struct pci_dev *dev)
 				PCI_FUNC(dev->devfn));
 
 	if (!psdev || !psdev->pdev) {
-		dev_err(&dev->dev,
-			DRV_NAME " device is not found/assigned\n");
+		dev_err(&dev->dev, "device is not found/assigned\n");
 		goto end;
 	}
 
 	if (!psdev->pdev->sh_info) {
-		dev_err(&dev->dev, DRV_NAME " device is not connected or owned"
+		dev_err(&dev->dev, "device is not connected or owned"
 			" by HVM, kill it\n");
 		kill_domain_by_device(psdev);
 		goto end;
diff --git a/drivers/xen/xen-pciback/pciback_ops.c b/drivers/xen/xen-pciback/pciback_ops.c
index 787966f44589..8545ca78c4f1 100644
--- a/drivers/xen/xen-pciback/pciback_ops.c
+++ b/drivers/xen/xen-pciback/pciback_ops.c
@@ -6,6 +6,7 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
 
 #include <linux/moduleparam.h>
 #include <linux/wait.h>
@@ -148,7 +149,7 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 	int status;
 
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: enable MSI\n", pci_name(dev));
+		dev_printk(KERN_DEBUG, &dev->dev, "enable MSI\n");
 
 	if (dev->msi_enabled)
 		status = -EALREADY;
@@ -158,9 +159,8 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 		status = pci_enable_msi(dev);
 
 	if (status) {
-		pr_warn_ratelimited("%s: error enabling MSI for guest %u: err %d\n",
-				    pci_name(dev), pdev->xdev->otherend_id,
-				    status);
+		dev_warn_ratelimited(&dev->dev, "error enabling MSI for guest %u: err %d\n",
+				     pdev->xdev->otherend_id, status);
 		op->value = 0;
 		return XEN_PCI_ERR_op_failed;
 	}
@@ -170,8 +170,7 @@ int xen_pcibk_enable_msi(struct xen_pcibk_device *pdev,
 
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: MSI: %d\n", pci_name(dev),
-			op->value);
+		dev_printk(KERN_DEBUG, &dev->dev, "MSI: %d\n", op->value);
 
 	dev_data = pci_get_drvdata(dev);
 	if (dev_data)
@@ -185,8 +184,7 @@ int xen_pcibk_disable_msi(struct xen_pcibk_device *pdev,
 			  struct pci_dev *dev, struct xen_pci_op *op)
 {
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: disable MSI\n",
-		       pci_name(dev));
+		dev_printk(KERN_DEBUG, &dev->dev, "disable MSI\n");
 
 	if (dev->msi_enabled) {
 		struct xen_pcibk_dev_data *dev_data;
@@ -199,8 +197,7 @@ int xen_pcibk_disable_msi(struct xen_pcibk_device *pdev,
 	}
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: MSI: %d\n", pci_name(dev),
-			op->value);
+		dev_printk(KERN_DEBUG, &dev->dev, "MSI: %d\n", op->value);
 	return 0;
 }
 
@@ -214,8 +211,7 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 	u16 cmd;
 
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: enable MSI-X\n",
-		       pci_name(dev));
+		dev_printk(KERN_DEBUG, &dev->dev, "enable MSI-X\n");
 
 	if (op->value > SH_INFO_MAX_VEC)
 		return -EINVAL;
@@ -249,16 +245,14 @@ int xen_pcibk_enable_msix(struct xen_pcibk_device *pdev,
 				op->msix_entries[i].vector =
 					xen_pirq_from_irq(entries[i].vector);
 				if (unlikely(verbose_request))
-					printk(KERN_DEBUG DRV_NAME ": %s: " \
-						"MSI-X[%d]: %d\n",
-						pci_name(dev), i,
+					dev_printk(KERN_DEBUG, &dev->dev,
+						"MSI-X[%d]: %d\n", i,
 						op->msix_entries[i].vector);
 			}
 		}
 	} else
-		pr_warn_ratelimited("%s: error enabling MSI-X for guest %u: err %d!\n",
-				    pci_name(dev), pdev->xdev->otherend_id,
-				    result);
+		dev_warn_ratelimited(&dev->dev, "error enabling MSI-X for guest %u: err %d!\n",
+				     pdev->xdev->otherend_id, result);
 	kfree(entries);
 
 	op->value = result;
@@ -274,8 +268,7 @@ int xen_pcibk_disable_msix(struct xen_pcibk_device *pdev,
 			   struct pci_dev *dev, struct xen_pci_op *op)
 {
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: disable MSI-X\n",
-			pci_name(dev));
+		dev_printk(KERN_DEBUG, &dev->dev, "disable MSI-X\n");
 
 	if (dev->msix_enabled) {
 		struct xen_pcibk_dev_data *dev_data;
@@ -292,8 +285,7 @@ int xen_pcibk_disable_msix(struct xen_pcibk_device *pdev,
 	 */
 	op->value = dev->irq ? xen_pirq_from_irq(dev->irq) : 0;
 	if (unlikely(verbose_request))
-		printk(KERN_DEBUG DRV_NAME ": %s: MSI-X: %d\n",
-		       pci_name(dev), op->value);
+		dev_printk(KERN_DEBUG, &dev->dev, "MSI-X: %d\n", op->value);
 	return 0;
 }
 #endif
@@ -424,7 +416,7 @@ static irqreturn_t xen_pcibk_guest_interrupt(int irq, void *dev_id)
 		dev_data->handled++;
 		if ((dev_data->handled % 1000) == 0) {
 			if (xen_test_irq_shared(irq)) {
-				pr_info("%s IRQ line is not shared "
+				dev_info(&dev->dev, "%s IRQ line is not shared "
 					"with other domains. Turning ISR off\n",
 					 dev_data->irq_name);
 				dev_data->ack_intr = 0;
diff --git a/drivers/xen/xen-pciback/vpci.c b/drivers/xen/xen-pciback/vpci.c
index f6ba18191c0f..5447b5ab7c76 100644
--- a/drivers/xen/xen-pciback/vpci.c
+++ b/drivers/xen/xen-pciback/vpci.c
@@ -7,6 +7,7 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
 
 #include <linux/list.h>
 #include <linux/slab.h>
@@ -105,9 +106,8 @@ static int __xen_pcibk_add_pci_dev(struct xen_pcibk_device *pdev,
 				       struct pci_dev_entry, list);
 
 			if (match_slot(dev, t->dev)) {
-				pr_info("vpci: %s: assign to virtual slot %d func %d\n",
-					pci_name(dev), slot,
-					PCI_FUNC(dev->devfn));
+				dev_info(&dev->dev, "vpci: assign to virtual slot %d func %d\n",
+					 slot, PCI_FUNC(dev->devfn));
 				list_add_tail(&dev_entry->list,
 					      &vpci_dev->dev_list[slot]);
 				func = PCI_FUNC(dev->devfn);
@@ -119,8 +119,8 @@ static int __xen_pcibk_add_pci_dev(struct xen_pcibk_device *pdev,
 	/* Assign to a new slot on the virtual PCI bus */
 	for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
 		if (list_empty(&vpci_dev->dev_list[slot])) {
-			pr_info("vpci: %s: assign to virtual slot %d\n",
-				pci_name(dev), slot);
+			dev_info(&dev->dev, "vpci: assign to virtual slot %d\n",
+				 slot);
 			list_add_tail(&dev_entry->list,
 				      &vpci_dev->dev_list[slot]);
 			func = dev->is_virtfn ? 0 : PCI_FUNC(dev->devfn);
-- 
2.25.1


