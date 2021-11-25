Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3345D8B6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 12:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230889.399244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX6-0005XD-R6; Thu, 25 Nov 2021 11:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230889.399244; Thu, 25 Nov 2021 11:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCX6-0005GA-3k; Thu, 25 Nov 2021 11:03:16 +0000
Received: by outflank-mailman (input) for mailman id 230889;
 Thu, 25 Nov 2021 11:03:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68NU=QM=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mqCX2-0001Km-0Y
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 11:03:12 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46f9c8c8-4ddf-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 12:03:10 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id z8so11729740ljz.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Nov 2021 03:03:10 -0800 (PST)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id bt10sm235165lfb.193.2021.11.25.03.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 03:03:09 -0800 (PST)
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
X-Inumbo-ID: 46f9c8c8-4ddf-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kZqEhK0lSTPPH7s4XeLss9am7aDHkDnrG+VGANSSqhs=;
        b=kxE0nc7+ZIhSzeKFBn/ycXd/0/Fr6R/JY8BouykvGtlyhqqwj+RmypY5J4aiJjr4WR
         ZHsjSLNe55PEe1TKhubs2FGmmQIYWGNyjWSkVj+6bL2VYs3AGJL+rwpq1yonyTJxKz41
         w0a4EUQD678fE3UElGs9IxfXC/pTd6fHT2Njol3wd/JxXOSyhCZCTe8r5o20qPqX+Jr3
         5lQmtmJl6Ygh9qkKTx+jd33mYwf9kHwLhPrpX3RsnMHWUqp6OE2bmjYuxCVHEMPPXoxt
         ThykhCQjC201gZLo/mCvED+la3mOewg66QIINFh1r/WDQXGir9CXf8hZz8zrTH0eBcuO
         iVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kZqEhK0lSTPPH7s4XeLss9am7aDHkDnrG+VGANSSqhs=;
        b=lE0oStvMsK91m/GbK9/YfPsTh5runSVCnOy07pESdRM7N8ElftLKpx2koYYxVOhZwL
         Cuq0OIguYZXuy/j8hsbzBF2+oKCjEcTjm4fETvWx8qQzFnu/vN7dk8kkoM9YEb2FpKot
         RHP0EXvs+9TOopA8sZEgJGnCXwpiT7MvRSdiLvUt/jla1KdGfZozof57Eng0a3vBOwsv
         bLWwI7ZryrFlY+dr/k4cmF0kFtlEH2vWUzZd0Tv2rGuEvzdblM6Y5QADTYKcrCV6H4sA
         FeeeWa2Cgo09b2pXi8rEkUs2T3eNKaeaAM7lNzF+PNmHA1WOaI5X1ZKP5aqN245Yh3uP
         3iqA==
X-Gm-Message-State: AOAM532fNg3ejqvpX6fHurQLvaJsEm0OihqJrGCmACevnMeWQi9a5am/
	ExyoF/XGfmNwEq7RX2WnEnGQAgSi7XluOA==
X-Google-Smtp-Source: ABdhPJzBvgipfEIhTxTfN3KLHKclXOeyvsJMOM3BP4PRkB6a8NA6Vn42fUxKGhF7gYGXSo2CxNAiYA==
X-Received: by 2002:a2e:9f15:: with SMTP id u21mr23980508ljk.132.1637838189955;
        Thu, 25 Nov 2021 03:03:09 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v5 12/14] xen/arm: translate virtual PCI bus topology for guests
Date: Thu, 25 Nov 2021 13:02:49 +0200
Message-Id: <20211125110251.2877218-13-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125110251.2877218-1-andr2000@gmail.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 18 ++++++++++++++++++
 xen/drivers/vpci/vpci.c | 27 +++++++++++++++++++++++++++
 xen/include/xen/vpci.h  |  1 +
 3 files changed, 46 insertions(+)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 8e801f275879..3d134f42d07e 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -41,6 +41,15 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+        return 1;
+#endif
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -59,6 +68,15 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+        return 1;
+#endif
+
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index c2fb4d4db233..bdc8c63f73fa 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -195,6 +195,33 @@ static void vpci_remove_virtual_device(struct domain *d,
     pdev->vpci->guest_sbdf.sbdf = ~0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
+{
+    struct pci_dev *pdev;
+
+    for_each_pdev( d, pdev )
+    {
+        bool found;
+
+        spin_lock(&pdev->vpci_lock);
+        found = pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf);
+        spin_unlock(&pdev->vpci_lock);
+
+        if ( found )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e5258bd7ce90..21d76929391f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -280,6 +280,7 @@ static inline void vpci_cancel_pending_locked(struct pci_dev *pdev)
 /* Notify vPCI that device is assigned/de-assigned to/from guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev);
 int vpci_deassign_device(struct domain *d, struct pci_dev *pdev);
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
 #else
 static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
-- 
2.25.1


