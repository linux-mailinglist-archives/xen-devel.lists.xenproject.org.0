Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FC141D4CE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199501.353628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrv-000259-Aq; Thu, 30 Sep 2021 07:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199501.353628; Thu, 30 Sep 2021 07:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqrv-00022r-31; Thu, 30 Sep 2021 07:52:39 +0000
Received: by outflank-mailman (input) for mailman id 199501;
 Thu, 30 Sep 2021 07:52:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqrt-00017f-4s
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:52:37 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31dbb497-6e8f-4456-bbcc-c77af33a62b1;
 Thu, 30 Sep 2021 07:52:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u18so21640519lfd.12
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:52:28 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id 13sm251099ljf.51.2021.09.30.00.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:52:26 -0700 (PDT)
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
X-Inumbo-ID: 31dbb497-6e8f-4456-bbcc-c77af33a62b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7n1ziOkiQyIV9eus199iv91YK2oXQWN+eMmfapyz5UQ=;
        b=lxxe9SG314t15/TZPQBDOd4EQv7HddnV6SUX5ZEEwxxkkQT436vPQX0Xbltf0RLnvL
         ppnWhUbLWnELFmajNIbuSPJfPV6vK+41CSvAxQh9YrG+hmR2t8cKdbhnHfb71yauhfGq
         mqhx4oklREJFi9EDKdEcauypiX1t40XJ3lL7t8a9BPkB2Ub8HL2i3OIOp7vJFwNAO4G8
         Be+o5fbPa3/Z1E/saDKs+dxR4aHFUpPs1HXABqnszlcs4kb5a+LiDzyMQzP2rNjGHIxl
         3MSlHrlxYi3P3d49i2Wlz9Lk4cALL+4kmVo/3Fkj8FLVg2HKNFrzf/Jb9idlhCWVjwrv
         cgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7n1ziOkiQyIV9eus199iv91YK2oXQWN+eMmfapyz5UQ=;
        b=qAIlXeF9ZnaOiG5PW8OZIR7WtPjRs8tOgFrrERI9u/LjmCwJdhEUWMgaLAsMcTlqXC
         Ottu/JD+kO7QGtEbnlusHy32Mp8wJIhHfOegn3n0LBLMQtLpE8qzG2xQ/JJCK+wBdwH8
         UC0SJP0sY6kWOleuklc8ct/qBAebRvZy/Zj03s+ZNBamyr7Z3q4uSUGWmSbbAz+N/U+3
         ifdA6PgiAPhpB1M8/Tl19mt8bLeJjJM1F+Yqg23ZmyEKBkknsZijnr6o8KXoaSG0EgZN
         jPgVzRn6FekDwSWOARglFHvZSZmtsUGpN5v6SoivImUi5OMa/lysNfT/Eg11IdnPEo3h
         /oWw==
X-Gm-Message-State: AOAM533l+l04VojrA0YtzSUYiUF2a1t/gckSr9yrQBTwPhHufxDxeTct
	89vS47y9cPKxMJBBsYqHdzghbIurKv4=
X-Google-Smtp-Source: ABdhPJwdvPHmCq0g0ujvcf3lB0FqKYqVUjUSP/uNbltsIKz6JKcCHEqRNXIjrl7bvplAx1UBUHQHIA==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr4307930lfi.309.1632988346764;
        Thu, 30 Sep 2021 00:52:26 -0700 (PDT)
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
Subject: [PATCH v3 02/11] vpci: Add hooks for PCI device assign/de-assign
Date: Thu, 30 Sep 2021 10:52:14 +0300
Message-Id: <20210930075223.860329-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930075223.860329-1-andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

When a PCI device gets assigned/de-assigned some work on vPCI side needs
to be done for that device. Introduce a pair of hooks so vPCI can handle
that.

Please note, that in the current design the error path is handled by
the toolstack via XEN_DOMCTL_assign_device/XEN_DOMCTL_deassign_device,
so this is why it is acceptable not to de-assign devices if vPCI's
assign fails, e.g. the roll back will be handled on deassign_device when
it is called by the toolstack.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v2:
- define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
  for x86
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/Kconfig           |  4 ++++
 xen/drivers/passthrough/pci.c |  9 +++++++++
 xen/drivers/vpci/vpci.c       | 23 +++++++++++++++++++++++
 xen/include/xen/vpci.h        | 20 ++++++++++++++++++++
 4 files changed, 56 insertions(+)

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
index 9f804a50e780..805ab86ed555 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -870,6 +870,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    ret = vpci_deassign_device(d, pdev);
+    if ( ret )
+        goto out;
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1429,6 +1433,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
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
index 1666402d55b8..0fe86cb30d23 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -86,6 +86,29 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+/* Notify vPCI that device is assigned to guest. */
+int vpci_assign_device(struct domain *d, const struct pci_dev *dev)
+{
+    /* It only makes sense to assign for hwdom or guest domain. */
+    if ( is_system_domain(d) || !has_vpci(d) )
+        return 0;
+
+    return 0;
+}
+
+/* Notify vPCI that device is de-assigned from guest. */
+int vpci_deassign_device(struct domain *d, const struct pci_dev *dev)
+{
+    /* It only makes sense to de-assign from hwdom or guest domain. */
+    if ( is_system_domain(d) || !has_vpci(d) )
+        return 0;
+
+    return 0;
+}
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 2e910d0b1f90..ecc08f2c0f65 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -242,6 +242,26 @@ static inline bool vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_HAS_VPCI_GUEST_SUPPORT)
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int __must_check vpci_assign_device(struct domain *d,
+                                    const struct pci_dev *dev);
+int __must_check vpci_deassign_device(struct domain *d,
+                                      const struct pci_dev *dev);
+#else
+static inline int vpci_assign_device(struct domain *d,
+                                     const struct pci_dev *dev)
+{
+    return 0;
+};
+
+static inline int vpci_deassign_device(struct domain *d,
+                                       const struct pci_dev *dev)
+{
+    return 0;
+};
+#endif
+
 #endif
 
 /*
-- 
2.25.1


