Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8423FFDF5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 12:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177971.323800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67s-0004sW-Bm; Fri, 03 Sep 2021 10:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177971.323800; Fri, 03 Sep 2021 10:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM67s-0004oq-7p; Fri, 03 Sep 2021 10:08:48 +0000
Received: by outflank-mailman (input) for mailman id 177971;
 Fri, 03 Sep 2021 10:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=93bQ=NZ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mM67q-0004Cr-9p
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 10:08:46 +0000
Received: from mail-ej1-x62b.google.com (unknown [2a00:1450:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f91edf82-e50f-4cf4-995d-7339dd9df84b;
 Fri, 03 Sep 2021 10:08:37 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ia27so10983815ejc.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 03:08:37 -0700 (PDT)
Received: from a2klaptop.epam.com (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id p5sm2427187eju.30.2021.09.03.03.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 03:08:36 -0700 (PDT)
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
X-Inumbo-ID: f91edf82-e50f-4cf4-995d-7339dd9df84b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EU6daQfIrHKFvAQi2eWLYJvBvTorOIHCZnBp6xeFP3g=;
        b=kcubAD1Yrxu5RXJEbu7bj0a07h2QblbRY+s8jSOmtT8ZkdpKKBQGCcX5WvzOVQxHbS
         55eUezgwX9I0TbSWL9LToo0uUqvkN+I7fJZOt84M2creBFDahhPC94vgaafd+kHnigfs
         DNKtTUFK6Ibxfig4mz9B0SfhATEmqOExjB0cc+qPmEFCZiEZYlKxAY62tn4K5XHA2bm4
         DluMJoVFnrYQN3CvNURCZGzNvdnDc+48eMedOJKcKFfHLc/He6w52N5HxvkUmrxcolud
         3u9lfiOIhIVkADvUQQalsSwaH9feuKeguOXZ9unsAMQA/IpxrwZ8GvEpMu1xiLdcXTVR
         oSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EU6daQfIrHKFvAQi2eWLYJvBvTorOIHCZnBp6xeFP3g=;
        b=idmU1+ovw6G5NrPkYssghrV2ChJh/LzPdwy3MG/ApEHrp5GoaavT+I5dNB60eSTktN
         HgWdygLn0apuTFRpUQpgLekox//f5VAGdeXKMigSq+atohC+MCeABhOcuKlCxi6UV3vr
         QYfBbn38/lB4r+arfq2OEJMJs3Livvfkgw1CZS6JIvZ8s8FWkaGuQTFhGQBtZuy7ClYT
         pmDLsu9mHGLUfcG2EYPwmQ+V7kYXqThdbxAtX8MaoTRBAdM4lkzhDqa1HtHdEcN35t97
         Oleps0lYHqraC5hK8s3XUf/ZV0JXBRG+goSNiWJu6/SHn/izJln78+dkVr8J7akP0fuS
         voRQ==
X-Gm-Message-State: AOAM531Ff1UH+vuQfiIvWYw/6W2PNoubK9ygdflTG4Or7V5FEJMBi9S/
	Psl+wxbjX9KG29GVb75XzcQJgSln75o=
X-Google-Smtp-Source: ABdhPJz6mPKOr3Bp3qDr/3iV61C9/zLAySQ2YnRt9O7RgvETUrpMoCcyTRoUbjFWHZd9dkA+8OI+fA==
X-Received: by 2002:a17:906:1c8c:: with SMTP id g12mr3370387ejh.186.1630663716639;
        Fri, 03 Sep 2021 03:08:36 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 2/9] vpci: Add hooks for PCI device assign/de-assign
Date: Fri,  3 Sep 2021 13:08:24 +0300
Message-Id: <20210903100831.177748-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903100831.177748-1-andr2000@gmail.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/drivers/passthrough/pci.c |  9 +++++++++
 xen/drivers/vpci/vpci.c       | 21 +++++++++++++++++++++
 xen/include/xen/vpci.h        | 16 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 25304dbe9956..deef986acbb4 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -864,6 +864,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    ret = vpci_deassign_device(d, pdev);
+    if ( ret )
+        goto out;
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1425,6 +1429,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
         rc = hd->platform_ops->assign_device(d, devfn, pci_to_dev(pdev), flag);
     }
 
+    if ( rc )
+        goto done;
+
+    rc = vpci_assign_device(d, pdev);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index b05530f2a6b0..ee0ad63a3c12 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -86,6 +86,27 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct domain *d, struct pci_dev *dev)
+{
+    /* It only makes sense to assign for hwdom or guest domain. */
+    if ( !has_vpci(d) || (d->domain_id >= DOMID_FIRST_RESERVED) )
+        return 0;
+
+    return 0;
+}
+
+/* Notify vPCI that device is de-assigned from guest. */
+int vpci_deassign_device(struct domain *d, struct pci_dev *dev)
+{
+    /* It only makes sense to de-assign from hwdom or guest domain. */
+    if ( !has_vpci(d) || (d->domain_id >= DOMID_FIRST_RESERVED) )
+        return 0;
+
+    return 0;
+}
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index b861f438cc78..e7a1a09ab4c9 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -26,6 +26,12 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 /* Add vPCI handlers to device. */
 int __must_check vpci_add_handlers(struct pci_dev *dev);
 
+/* Notify vPCI that device is assigned to guest. */
+int __must_check vpci_assign_device(struct domain *d, struct pci_dev *dev);
+
+/* Notify vPCI that device is de-assigned from guest. */
+int __must_check vpci_deassign_device(struct domain *d, struct pci_dev *dev);
+
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
 /* Remove all handlers for the device given. */
@@ -220,6 +226,16 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
     return 0;
 }
 
+static inline int vpci_assign_device(struct domain *d, struct pci_dev *dev)
+{
+    return 0;
+};
+
+static inline int vpci_deassign_device(struct domain *d, struct pci_dev *dev)
+{
+    return 0;
+};
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.25.1


