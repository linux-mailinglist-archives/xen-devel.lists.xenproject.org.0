Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46098415F0B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194144.345928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIJ-0005Cn-Ep; Thu, 23 Sep 2021 12:57:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194144.345928; Thu, 23 Sep 2021 12:57:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIJ-000556-6A; Thu, 23 Sep 2021 12:57:43 +0000
Received: by outflank-mailman (input) for mailman id 194144;
 Thu, 23 Sep 2021 12:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOH1-0004it-6A
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:23 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56e2b585-9c23-4014-bc02-da210cf5b44a;
 Thu, 23 Sep 2021 12:55:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i4so26250580lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:07 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:05 -0700 (PDT)
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
X-Inumbo-ID: 56e2b585-9c23-4014-bc02-da210cf5b44a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Y+DU0DSrlSJm3RBHsKqMThf7inWBIT9pPD3eSNkVAE=;
        b=hYxKWCjYG91LckucdXz7kiTTL5AB09I7V3lbQ4uZfD/q/MYCdyjE2/BPyX2RGkGkdD
         LfzE8+Dq+LMIIayzkHPshcRPxLaXsNy1adj8t3KB0xIEB7dvCLotKdf5i3SbpzPtedxp
         izc40arDT+3hOiCrJkkto5MPJztcsDKNoskt7sClcJASUMvw7ijT/tgxdo2IeKV32+ku
         EHFUoUbQLhE8/6dSUTfwfUKIDtfWs3YfQIptdnsV2te7IokWTGwuBHgN30IWV3kbcbbJ
         TFLgalge/nTmIig4YTtpi5Be+40ZTTJZ/wbm4FINugBjRCfV+W/vTLDcKfhE0U7wNW5J
         Fgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Y+DU0DSrlSJm3RBHsKqMThf7inWBIT9pPD3eSNkVAE=;
        b=dFdbrSulI0lh5wU1CMbGz/KoUiC86HHuc+ShB7P56GBiwaswyR0ZcruFRXt/BpwetH
         C8p1PHajJMfNaOo9bk/j/dNdnhqm02/ZKtOd62EVNnquRynUg+gcveBtNk0ZnSIeAMZk
         ID3iR8JX3YBgejMyjzQrgtNOk8XIOWHxwe0d53hV+lkaFapkYSdmHHeXfL0f7spSEAnf
         BWlXe5VfABOGsDv2q85U2gdZQ06osozRUxYZ4aJr+dK6zhLAapyMPiaErro782SnbN9v
         DVnc9KUX3hW7ClwM40faGe4VsJxtIfs1pJsejST7xphlXXShzXRYv6PHopFqmO7/jl+n
         0FZw==
X-Gm-Message-State: AOAM532dvFyUfJbVzxEVfhnwPHJTapvH488VP/CqErlzTv0QDTk4EhEA
	1r+jhQx6h0IZxQ/+ra7zxoDgvKOhX5QErw==
X-Google-Smtp-Source: ABdhPJws+VUTSrWiIzEEm+gWdSYS1iA4cTrQf4OFeA2lEZRm4C2x+KWOsrumrELjauDBZ1A2tBy7QA==
X-Received: by 2002:ac2:5f83:: with SMTP id r3mr4179435lfe.686.1632401706071;
        Thu, 23 Sep 2021 05:55:06 -0700 (PDT)
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
Subject: [PATCH v2 02/11] vpci: Add hooks for PCI device assign/de-assign
Date: Thu, 23 Sep 2021 15:54:52 +0300
Message-Id: <20210923125501.234252-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
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
Since v1:
 - constify struct pci_dev where possible
 - do not open code is_system_domain()
 - extended the commit message
---
 xen/drivers/passthrough/pci.c |  9 +++++++++
 xen/drivers/vpci/vpci.c       | 21 +++++++++++++++++++++
 xen/include/xen/vpci.h        | 18 ++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index fc3469bc12dc..e1da283d73ad 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -872,6 +872,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
     if ( ret )
         goto out;
 
+    ret = vpci_deassign_device(d, pdev);
+    if ( ret )
+        goto out;
+
     if ( pdev->domain == hardware_domain  )
         pdev->quarantine = false;
 
@@ -1431,6 +1435,11 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
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
index 1666402d55b8..a8fed3d2c42e 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -86,6 +86,27 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
 
     return rc;
 }
+
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
+
 #endif /* __XEN__ */
 
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 2e910d0b1f90..b9485b2aea1b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -26,6 +26,12 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 /* Add vPCI handlers to device. */
 int __must_check vpci_add_handlers(struct pci_dev *dev);
 
+/* Notify vPCI that device is assigned/de-assigned to/from guest. */
+int __must_check vpci_assign_device(struct domain *d,
+                                    const struct pci_dev *dev);
+int __must_check vpci_deassign_device(struct domain *d,
+                                      const struct pci_dev *dev);
+
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
 /* Remove all handlers for the device given. */
@@ -220,6 +226,18 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
     return 0;
 }
 
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
+
 static inline void vpci_dump_msi(void) { }
 
 static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
-- 
2.25.1


