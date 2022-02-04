Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B74A940F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265015.458387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBl-00038I-4K; Fri, 04 Feb 2022 06:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265015.458387; Fri, 04 Feb 2022 06:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBj-0002sJ-Q9; Fri, 04 Feb 2022 06:35:19 +0000
Received: by outflank-mailman (input) for mailman id 265015;
 Fri, 04 Feb 2022 06:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBg-0008DX-6Q
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:16 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cb91094-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:15 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id i34so10811258lfv.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:15 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:14 -0800 (PST)
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
X-Inumbo-ID: 9cb91094-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hIaF8lkau0N10gIhOfyFkvM+7dDNU2pFNiSNz4Bb4DM=;
        b=BQx5h1U1XzMedlxkvKRWbAoeeDDDuxCa+NYZCC5EXXKvNVb57WykA7geNU2PwwfOZq
         9boVsP/FKrdj5QijI5UOmqpiJ/108TlbnER9IZhZmy0RGl5IOE57CosP9uDTvIDuYDbo
         zHhfShTjr4qt57OIjhKs9SBko9C9BKzPn/3mYPs2jIZxyyICCymb8RGNt8go4CY8Z1Ok
         zqFmtbBlD3fbVKWSpC72QVUh+9sVJeSCaazwwX1bSLiwuIQHtE6UPH88FeAYFv/JNfLI
         d2nZcYcEhbTMz7QDE7HkDz/rjBl9F5R4X+98fpvxVKMfjXD2MOxz+NjAY1Zg3+QrrepP
         mIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hIaF8lkau0N10gIhOfyFkvM+7dDNU2pFNiSNz4Bb4DM=;
        b=pzyEKVUMrHCayfrEwdRh9Jj5XXF2LSwKvnNWzy8vUVrrEokCJnW1xFL0sBcEkGuFQY
         WgONp4bO5QS10r49Vu+YLyfaIlsrh3iLpWJjPXnb90qJNOgIeRDwJkhfRGR++Ca2FTHT
         CqivcHGv3YCoWelvdVK2PhXaqThz5Di1GGCv+IMFWLIPpxkZFFxnVijyovIDG29o93y6
         yhVI2aHj3LKgPj+urdFcui40mUppNBru9Bfbf6Lu7MimivbzKJkwegXARuI4vqaIXazK
         27OEJxFme4eZD3UsvAXaJ/8XEuu35Ofk0gV1nI3pWWp/3zVwGRkkfw1sQ6AYZri70h4m
         h9cg==
X-Gm-Message-State: AOAM533fIkCFEKVIDhuO6yVSKqE+lPh27A0VD26PBWehTmA7ofEI1ETf
	YDJRbJ8oO0EMhzV23I81smev6LTNSfw=
X-Google-Smtp-Source: ABdhPJzInhEwoaUav36B1b6oDvhcMTtbaYic6ktmXAldzUwMXmLO5P4HKZ2/mUC2v+QPU1VKXYIkVw==
X-Received: by 2002:a05:6512:1697:: with SMTP id bu23mr1338331lfb.392.1643956514817;
        Thu, 03 Feb 2022 22:35:14 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v6 12/13] xen/arm: translate virtual PCI bus topology for guests
Date: Fri,  4 Feb 2022 08:34:58 +0200
Message-Id: <20220204063459.680961-13-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
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
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
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
 xen/arch/arm/vpci.c     | 17 +++++++++++++++++
 xen/drivers/vpci/vpci.c | 29 +++++++++++++++++++++++++++++
 xen/include/xen/vpci.h  |  7 +++++++
 3 files changed, 53 insertions(+)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index a9fc5817f94e..84b2b068a0fe 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+    {
+        *r = ~0ul;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -59,6 +69,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
 
+    /*
+     * For the passed through devices we need to map their virtual SBDF
+     * to the physical PCI device being passed through.
+     */
+    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
+        return 1;
+
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 7d422d11f83d..070db7391391 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -168,6 +168,35 @@ static void vpci_remove_virtual_device(struct domain *d,
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
+    ASSERT(!is_hardware_domain(d));
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
index 1f04d34a2369..f6eb9f2051af 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -271,6 +271,7 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 /* Notify vPCI that device is assigned/de-assigned to/from guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev);
 void vpci_deassign_device(struct domain *d, struct pci_dev *pdev);
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
 #else
 static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
@@ -280,6 +281,12 @@ static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 static inline void vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
 {
 };
+
+static inline bool vpci_translate_virtual_device(const struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    return false;
+}
 #endif
 
 #endif
-- 
2.25.1


