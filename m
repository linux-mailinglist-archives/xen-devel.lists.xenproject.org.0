Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0424A9405
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 07:35:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265008.458319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBa-00017J-JL; Fri, 04 Feb 2022 06:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265008.458319; Fri, 04 Feb 2022 06:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFsBa-00011Y-Bz; Fri, 04 Feb 2022 06:35:10 +0000
Received: by outflank-mailman (input) for mailman id 265008;
 Fri, 04 Feb 2022 06:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tguk=ST=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nFsBY-0008DX-5I
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 06:35:08 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f177f4-8584-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 07:35:07 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id e17so7167528ljk.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Feb 2022 22:35:07 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f34sm163027lfv.165.2022.02.03.22.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 22:35:06 -0800 (PST)
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
X-Inumbo-ID: 97f177f4-8584-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XW5WI2LKa0+lHLha6LOvz3mRlOFJHaJBN6i9Y4p6WM=;
        b=dhahBLefv3vqpJIzC/B6ePyfjpDpPIn86QOziEMIKUWSkc+w0iRCBKAJ6dWQdHnocH
         QKOJqMlHxXYEJ/mxNf/0sVdGb0tW7CAtp4i/oNw6u8Rr28oCjpPNVgP2WCz+nWhJ7Te2
         NmdZfvJ/QtVeUxx23tOWOcEfvFweXLQw30iJt2sTikUH2ss2SUxGXONdjtD4BZXJ3M4t
         8j9yN+t5sFF12wbD0Py19VVpXMQwX0RRhg1kPw1G920+tqgtQbA6ZwwwLvDzdKYNVuUX
         T9nVM7QqK4HsM2wb+uvctYF4gge17KSZ1x0oWs9vA1VcrKsTHR3njYi1Z6r9ZhL+bAxe
         MXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XW5WI2LKa0+lHLha6LOvz3mRlOFJHaJBN6i9Y4p6WM=;
        b=x2Lrz3Tw9xnAOdSbSY+DdcvxEiF6oicZXECNegNKX67ZDMUeVME41VlwXtPdc/fK7M
         nhKfYsJ8hl8g1mduv3TvI5VFF1Gtp0i2rieAhhpglyxG+Yz7wGldB2RWRv/Rr5NqtS4f
         oGd4QQyLqY5iSBM4BF0ZGWTcoeWWDaK8NRTLBLUxeW3MSMM/nK/00yF8BtpaekJ2xxWf
         bQcxgsym+LU3bsUEp6HUrrD0RENM1hFWQ8AWwefWF5bmQkpRdo73BpBzlBFZXKPDvk3O
         0PEGMXRIiGCbDcmjH5VtxCxz5w+IH1xrsc6f9gfM5rwsqapZDVAs6QQxiWeLD/yiXf3W
         yxYA==
X-Gm-Message-State: AOAM533X/WKQqvXQOiVY89c/ogMHJajirMrQ8m/rCXb6JuV/39l/Ze96
	rS51qJ354SHfpT90LLT2Ps+m9LuwN2I=
X-Google-Smtp-Source: ABdhPJx32wzZ5nqhjR3pnLXjGJB/ispCD26olf2AkIY8XmREw8kF2eQaqvbwXb6rvKqnjeQ7HQ+hKQ==
X-Received: by 2002:a2e:a289:: with SMTP id k9mr907186lja.464.1643956506750;
        Thu, 03 Feb 2022 22:35:06 -0800 (PST)
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
Subject: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Date: Fri,  4 Feb 2022 08:34:51 +0200
Message-Id: <20220204063459.680961-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204063459.680961-1-andr2000@gmail.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
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
 xen/drivers/passthrough/pci.c |  6 ++++++
 xen/drivers/vpci/vpci.c       | 27 +++++++++++++++++++++++++++
 xen/include/xen/vpci.h        | 15 +++++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47a6..780490cf8e39 100644
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
index 50dec3bb73d0..88836aab6baf 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -943,6 +943,8 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    vpci_deassign_device(d, pdev);
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1488,6 +1490,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
+    vpci_deassign_device(pdev->domain, pdev);
+
     rc = pdev_msix_assign(d, pdev);
     if ( rc )
         goto done;
@@ -1507,6 +1511,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
                         pci_to_dev(pdev), flag);
     }
 
+    rc = vpci_assign_device(d, pdev);
+
  done:
     if ( rc )
         printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f8a93e61c08f..4e774875fa04 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -99,6 +99,33 @@ int vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
+{
+    int rc;
+
+    if ( !has_vpci(d) )
+        return 0;
+
+    rc = vpci_add_handlers(pdev);
+    if ( rc )
+        vpci_deassign_device(d, pdev);
+
+    return rc;
+}
+
+/* Notify vPCI that device is de-assigned from guest. */
+void vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
+{
+    if ( !has_vpci(d) )
+        return;
+
+    vpci_remove_device(pdev);
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index f2a7d82ce77b..246307e6f5d5 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -251,6 +251,21 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int vpci_assign_device(struct domain *d, struct pci_dev *pdev);
+void vpci_deassign_device(struct domain *d, struct pci_dev *pdev);
+#else
+static inline int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
+{
+    return 0;
+};
+
+static inline void vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
+{
+};
+#endif
+
 #endif
 
 /*
-- 
2.25.1


