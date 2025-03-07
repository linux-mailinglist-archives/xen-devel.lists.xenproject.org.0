Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F9A55C2B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904426.1312307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLsS-0003o6-Nv; Fri, 07 Mar 2025 00:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904426.1312307; Fri, 07 Mar 2025 00:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLsS-0003me-Km; Fri, 07 Mar 2025 00:47:48 +0000
Received: by outflank-mailman (input) for mailman id 904426;
 Fri, 07 Mar 2025 00:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AsaE=V2=treblig.org=linux@srs-se1.protection.inumbo.net>)
 id 1tqLsR-0003mY-BD
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:47:47 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5645573-faed-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 01:47:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tqLsH-003H7O-1H;
 Fri, 07 Mar 2025 00:47:37 +0000
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
X-Inumbo-ID: c5645573-faed-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=YCYD+T9+FjJKiym2zwCOFkdlpqOZMAK+Qe99zxgMH6s=; b=UUqHVjyMM8WUReiU
	A4ca7U+tiC0+qNH8lB6X5qSexXMCQClFL2J2nTEE19AVd1QoC0fB+z8NClnd2OwKELQY/Vph8Vwsk
	vvm6xprdC2RUCe29yvcMXr9q5/owfpwSLZjUJ1nghsSDF/YXrKOOmhCCt8soHPttjnkMqBrSameBH
	l+eFOl3scc/GHQkcJosyJ2yUDLJ0t5C9Ml/wo65DLqL4xIug3CNYhYgBwhXEjy78cXYVwkZWeRJTx
	AYTIxFF6BMVoeR0K/OAOF31LZHOTiSb9eHLN21eCTWf6hcKy5ijymaxrNgvMKjsvgRYxSI9J0DaGw
	k0q45Pc2MWKspgBivg==;
From: linux@treblig.org
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] xen/pciback: Remove unused pcistub_get_pci_dev
Date: Fri,  7 Mar 2025 00:47:36 +0000
Message-ID: <20250307004736.291229-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

pcistub_get_pci_dev() was added in 2009 as part of:
commit 30edc14bf39a ("xen/pciback: xen pci backend driver.")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/xen/xen-pciback/pci_stub.c | 20 --------------------
 drivers/xen/xen-pciback/pciback.h  |  2 --
 2 files changed, 22 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index b616b7768c3b..5c2f829d5b0b 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -262,26 +262,6 @@ struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
 	return found_dev;
 }
 
-struct pci_dev *pcistub_get_pci_dev(struct xen_pcibk_device *pdev,
-				    struct pci_dev *dev)
-{
-	struct pcistub_device *psdev;
-	struct pci_dev *found_dev = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&pcistub_devices_lock, flags);
-
-	list_for_each_entry(psdev, &pcistub_devices, dev_list) {
-		if (psdev->dev == dev) {
-			found_dev = pcistub_device_get_pci_dev(pdev, psdev);
-			break;
-		}
-	}
-
-	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
-	return found_dev;
-}
-
 /*
  * Called when:
  *  - XenBus state has been reconfigure (pci unplug). See xen_pcibk_remove_device
diff --git a/drivers/xen/xen-pciback/pciback.h b/drivers/xen/xen-pciback/pciback.h
index f9599ed2f2e2..b786c1f74f85 100644
--- a/drivers/xen/xen-pciback/pciback.h
+++ b/drivers/xen/xen-pciback/pciback.h
@@ -67,8 +67,6 @@ extern struct list_head xen_pcibk_quirks;
 struct pci_dev *pcistub_get_pci_dev_by_slot(struct xen_pcibk_device *pdev,
 					    int domain, int bus,
 					    int slot, int func);
-struct pci_dev *pcistub_get_pci_dev(struct xen_pcibk_device *pdev,
-				    struct pci_dev *dev);
 void pcistub_put_pci_dev(struct pci_dev *dev);
 
 static inline bool xen_pcibk_pv_support(void)
-- 
2.48.1


