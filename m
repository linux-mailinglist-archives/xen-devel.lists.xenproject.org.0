Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D457A59F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370797.602684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFa-0006OB-HK; Tue, 19 Jul 2022 17:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370797.602684; Tue, 19 Jul 2022 17:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFa-0006LN-Da; Tue, 19 Jul 2022 17:43:14 +0000
Received: by outflank-mailman (input) for mailman id 370797;
 Tue, 19 Jul 2022 17:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFY-00065R-QO
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:12 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42540942-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:12 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id y8so20648121eda.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:12 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:10 -0700 (PDT)
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
X-Inumbo-ID: 42540942-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Clq/yFmOZ38glmpc8+TyB4sKPvTCJ7X1eyQxmF0coEI=;
        b=d5FPSK0K72d9Xe+i6ecKVccyRdhudBtSq7Gsg52mnFqT46RzZB1R2LF+jD9ndUfGaM
         /uPxrDP1hg7nUgQneTN2h0UYnFDfP3aswJ32KwNf8uQr4+EmToIUFBrmuRa4R7uPnVRL
         xzsUeROARqcaMcnfU6HQtED+vuNpnEynxFuwoh025WabBI6mYmFD8E19m+pEV0zKF7G6
         +sAFvVejJ6236UnrN6QNFyeJanWDNpSBvBvyKtIHowxZf1TNfHjvtOVls/Ub8GA3mrb8
         M0tOk64zMa6jovUmywas8nnjkkDWOxzAagsVH/NHiVNJEe6gPKXo/zlh7m3wUtWW9/z3
         V8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Clq/yFmOZ38glmpc8+TyB4sKPvTCJ7X1eyQxmF0coEI=;
        b=fkYnMy8Zpt8Lshhs9vHSk2I5U+5cA2cS3QGm5X9RkPVY+XbxCsBcp7XUYuzOIPC9+Z
         b5bjtEuZUZkmWhEnOttUc+ujJnHkmifOH9zG3F450WpSPMaa+6gaezIMQ5VFxhft1jFG
         IRa2uqHG1CnUgDspWa0qczXI49bKrZ6bS1l1rzz90vydpNs/k0cAP7ydmyxK9WRS/1Wa
         xmAHnVQYMTm8vadLeMzNKfNEdno7i/3TCmG6yore2M5A1cI/6dyIBMMrRhkq94D0IxDp
         R5HakVozA5B107ZAXfmMgEafCr367bO/1pizcBkrDBklgEegLNAphtKGRPaIlooBQ7WS
         WNPQ==
X-Gm-Message-State: AJIora+0LelLZBAUPwoFN+RP/sS+zSi0NmA38JXsGS/aWTInZ4PxmjMB
	ySrh68n7aJifMCnDSnUqPXfhqZBcl4Fpxg==
X-Google-Smtp-Source: AGRyM1sl4lvRtDpSZF0fInywXXwKy2gpEGVI470vMbcD0kTRR34dE4NikC9nXtxRM4smnaZPKlSnAQ==
X-Received: by 2002:aa7:c250:0:b0:43b:25fb:4903 with SMTP id y16-20020aa7c250000000b0043b25fb4903mr36375785edo.253.1658252591074;
        Tue, 19 Jul 2022 10:43:11 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH V7 02/11] vpci: add hooks for PCI device assign/de-assign
Date: Tue, 19 Jul 2022 20:42:44 +0300
Message-Id: <20220719174253.541965-3-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719174253.541965-1-olekstysh@gmail.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v6:
- do not pass struct domain to vpci_{assign|deassign}_device as
  pdev->domain can be used
- do not leave the device assigned (pdev->domain == new domain) in case
  vpci_assign_device fails: try to de-assign and if this also fails, then
  crash the domain
- re-work according to the new locking scheme (ASSERTs)
- OT: rebased
Since v5:
- do not split code into run_vpci_init
- do not check for is_system_domain in vpci_{de}assign_device
- do not use vpci_remove_device_handlers_locked and re-allocate
  pdev->vpci completely
- make vpci_deassign_device void
Since v4:
 - de-assign vPCI from the previous domain on device assignment
 - do not remove handlers in vpci_assign_device as those must not
   exist at that point
Since v3:
 - remove toolstack roll-back description from the commit message
   as error are to be handled with proper cleanup in Xen itself
 - remove __must_check
 - remove redundant rc check while assigning devices
 - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
 - use REGISTER_VPCI_INIT machinery to run required steps on device
   init/assign: add run_vpci_init helper
Since v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/Kconfig           |  4 ++++
 xen/drivers/passthrough/pci.c | 11 +++++++++++
 xen/drivers/vpci/vpci.c       | 31 +++++++++++++++++++++++++++++++
 xen/include/xen/vpci.h        | 15 +++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47..780490cf8e 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
 
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index f93922acc8..56af1dbd97 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1019,6 +1019,8 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    vpci_deassign_device(pdev);
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1558,6 +1560,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
 {
     const struct domain_iommu *hd = dom_iommu(d);
     struct pci_dev *pdev;
+    uint8_t old_devfn;
     int rc = 0;
 
     if ( !is_iommu_enabled(d) )
@@ -1577,6 +1580,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     if ( pdev->broken && d != hardware_domain && d != dom_io )
         goto done;
 
+    vpci_deassign_device(pdev);
+
     rc = pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1594,6 +1599,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                           pci_to_dev(pdev), flag)) )
         goto done;
 
+    old_devfn = devfn;
+
     for ( ; pdev->phantom_stride; rc = 0 )
     {
         devfn += pdev->phantom_stride;
@@ -1603,6 +1610,10 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                         pci_to_dev(pdev), flag);
     }
 
+    rc = vpci_assign_device(pdev);
+    if ( rc && deassign_device(d, seg, bus, old_devfn) )
+        domain_crash(d);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 674c9b347d..d187901422 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -92,6 +92,37 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct pci_dev *pdev)
+{
+    int rc;
+
+    ASSERT(pcidevs_write_locked());
+
+    if ( !has_vpci(pdev->domain) )
+        return 0;
+
+    rc = vpci_add_handlers(pdev);
+    if ( rc )
+        vpci_deassign_device(pdev);
+
+    return rc;
+}
+
+/* Notify vPCI that device is de-assigned from guest. */
+void vpci_deassign_device(struct pci_dev *pdev)
+{
+    ASSERT(pcidevs_write_locked());
+
+    if ( !has_vpci(pdev->domain) )
+        return;
+
+    vpci_remove_device(pdev);
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 7ab39839ff..e5501b9207 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -254,6 +254,21 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int vpci_assign_device(struct pci_dev *pdev);
+void vpci_deassign_device(struct pci_dev *pdev);
+#else
+static inline int vpci_assign_device(struct pci_dev *pdev)
+{
+    return 0;
+};
+
+static inline void vpci_deassign_device(struct pci_dev *pdev)
+{
+};
+#endif
+
 #endif
 
 /*
-- 
2.25.1


