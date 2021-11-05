Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958BF445FEC
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222096.384220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9d-0002tY-HV; Fri, 05 Nov 2021 06:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222096.384220; Fri, 05 Nov 2021 06:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mit9c-0002o7-VY; Fri, 05 Nov 2021 06:56:48 +0000
Received: by outflank-mailman (input) for mailman id 222096;
 Fri, 05 Nov 2021 06:56:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmz5=PY=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mit9a-0008NQ-SQ
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:56:46 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a5cd3be-3e05-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 07:56:46 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id w1so30027716edd.10
 for <xen-devel@lists.xenproject.org>; Thu, 04 Nov 2021 23:56:46 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id dt4sm3735150ejb.27.2021.11.04.23.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 23:56:44 -0700 (PDT)
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
X-Inumbo-ID: 8a5cd3be-3e05-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ku75VZX/TQ1wxjSevU0hc8PtkdlgtlMhhIG2xgl6Ofc=;
        b=NDxX5Vm/k7LYA5JCIm0+QlVCsPrIHbjm785HHBMfst0ab/k3PkoKp6vV7UtSKJnK1I
         zmZt3fjOD4AsivSHuRVhUlEVeRyNBWJw8H76QEe8QoI5hViHDly4GU7XY5tQSZI95MJB
         cJN5Kv+OCyQ4+UkATNtLw89S7+aKTnt3W69te4SFDQD9nKjzf5xPMX4v1PddbMdOqhfc
         XaHX7XRc4oXNQP+2PQG6UXw4nx3knp52pVfSoMlEryfTy7Ef6oJpGZ8Igh9RvhyDA3Eu
         YQlK6E2e2NHAIOEBbVJr1M2nfL2nMAFYEZnlZF2ATBU1ewkl5VQqD3zuTnUU8VoY0lHg
         B46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ku75VZX/TQ1wxjSevU0hc8PtkdlgtlMhhIG2xgl6Ofc=;
        b=vmCpnMlFnLTnIWOytwcpTTMvQv5vAVOqyvDbarPp8cMmOGWA9GIzzSySj56OXBLv+b
         7q7JEO1imZdZj/F0tLUEyDqf4UFctcfKsgPNPQiAavzIGi8M1abQ8P2RuiskK3HVofzk
         KP6+CKMR0TR02LO/llutcA5WZ9eDll1DK3W4+xtG9b2u325VGvwuoEeyah6COtzJSpVM
         qGmw2oGdDNhVR3qomUZCoSuJtOyrm0Mjq71oqesl07hErHhVEVsPdecVCg85QDlzVs6S
         bGOk7+AqBJNxGrDWkpzpdnwtB6P1pT8KsHW0MYw5+cK0gZ8s0yapzzEHMM7VtAIc8qMF
         xjUA==
X-Gm-Message-State: AOAM530fUTyEbyx+aZivXH5r7Z0Z927PF0vOuD2koum2yGJJWOsGvR3E
	CFsjF7cSbX9+YMUtGAOvY2Ke3ZH7/CbHdw==
X-Google-Smtp-Source: ABdhPJznZ1Bt/7VgyWdSOs5D8rXKBDaD9RskvSN9Sr6eFAexPm+adsmBAZZCGxHmQQPmpDaN31lv+A==
X-Received: by 2002:a05:6402:5190:: with SMTP id q16mr37435741edd.12.1636095405353;
        Thu, 04 Nov 2021 23:56:45 -0700 (PDT)
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
Subject: [PATCH v4 11/11] xen/arm: translate virtual PCI bus topology for guests
Date: Fri,  5 Nov 2021 08:56:29 +0200
Message-Id: <20211105065629.940943-12-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105065629.940943-1-andr2000@gmail.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
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
 xen/drivers/vpci/vpci.c | 30 ++++++++++++++++++++++++++++++
 xen/include/xen/vpci.h  |  1 +
 3 files changed, 49 insertions(+)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 5a6ebd8b9868..6a37f770f8f0 100644
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
+            return 1;
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
+            return 1;
+#endif
+
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 6657d236dc1a..cb0bde35b6a6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -94,6 +94,7 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     /* We should not get here twice for the same device. */
     ASSERT(!pdev->vpci);
+    ASSERT(pcidevs_locked());
 
     pdev->vpci = xzalloc(struct vpci);
     if ( !pdev->vpci )
@@ -134,6 +135,8 @@ int vpci_add_virtual_device(struct pci_dev *pdev)
     pci_sbdf_t sbdf;
     unsigned long new_dev_number;
 
+    ASSERT(pcidevs_locked());
+
     /*
      * Each PCI bus supports 32 devices/slots at max or up to 256 when
      * there are multi-function ones which are not yet supported.
@@ -172,10 +175,37 @@ REGISTER_VPCI_INIT(vpci_add_virtual_device, VPCI_PRIORITY_MIDDLE);
 static void vpci_remove_virtual_device(struct domain *d,
                                        const struct pci_dev *pdev)
 {
+    ASSERT(pcidevs_locked());
+
     clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
     pdev->vpci->guest_sbdf.sbdf = ~0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
+{
+    const struct pci_dev *pdev;
+    bool found = false;
+
+    pcidevs_lock();
+    for_each_pdev( d, pdev )
+    {
+        if ( pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf )
+        {
+            /* Replace virtual SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            found = true;
+            break;
+        }
+    }
+    pcidevs_unlock();
+
+    return found;
+}
+
 /* Notify vPCI that device is assigned to guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9cc7071bc0af..d5765301e442 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -274,6 +274,7 @@ static inline void vpci_cancel_pending(const struct pci_dev *pdev)
 /* Notify vPCI that device is assigned/de-assigned to/from guest. */
 int vpci_assign_device(struct domain *d, struct pci_dev *pdev);
 int vpci_deassign_device(struct domain *d, struct pci_dev *pdev);
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
 #else
 static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
 {
-- 
2.25.1


