Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0005080CB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 07:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308803.524613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3LS-0008JD-HO; Wed, 20 Apr 2022 05:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308803.524613; Wed, 20 Apr 2022 05:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3LS-0008GT-EO; Wed, 20 Apr 2022 05:57:42 +0000
Received: by outflank-mailman (input) for mailman id 308803;
 Wed, 20 Apr 2022 05:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nh3LQ-0008GK-7a
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 05:57:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ba9464-c06e-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 07:57:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 89D871F380;
 Wed, 20 Apr 2022 05:57:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3746813AD5;
 Wed, 20 Apr 2022 05:57:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HIYjDNKgX2JFPAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 05:57:38 +0000
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
X-Inumbo-ID: c8ba9464-c06e-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650434258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FOVZCtdntsh9ZipxoJ5dEjdAyWPUlLf5ST56YjpMrA8=;
	b=hlf9t7txJnR60pzw0uIncPRxtUy3T428M7/Q+hPNCLUVp+GF8liLXOUJQEUatJjvTz9KIL
	D8DEA0ZA/qUGv+gStw0O1i8FcBIJWLZqMTis4aajRLDUaoxHAMn52/VpBN9icBuUGQjp6U
	LdWm6zrk1X1Kr7XXkzQtcC/9/AWG6c8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Date: Wed, 20 Apr 2022 07:57:36 +0200
Message-Id: <20220420055736.27901-1-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today iommu_do_domctl() is being called from arch_do_domctl() in the
"default:" case of a switch statement. This has led already to crashes
due to unvalidated parameters.

Fix that by moving the call of iommu_do_domctl() to the main switch
statement of do_domctl().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
V4:
- add iommu_do_domctl() stub for !CONFIG_HAS_PASSTHROUGH (Andrew Cooper,
  Jan Beulich)
---
 xen/arch/arm/domctl.c   | 11 +----------
 xen/arch/x86/domctl.c   |  2 +-
 xen/common/domctl.c     |  7 +++++++
 xen/include/xen/iommu.h | 12 +++++++++---
 4 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 6245af6d0b..1baf25c3d9 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -176,16 +176,7 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         return rc;
     }
     default:
-    {
-        int rc;
-
-        rc = subarch_do_domctl(domctl, d, u_domctl);
-
-        if ( rc == -ENOSYS )
-            rc = iommu_do_domctl(domctl, d, u_domctl);
-
-        return rc;
-    }
+        return subarch_do_domctl(domctl, d, u_domctl);
     }
 }
 
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index a6aae500a3..c9699bb868 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1380,7 +1380,7 @@ long arch_do_domctl(
         break;
 
     default:
-        ret = iommu_do_domctl(domctl, d, u_domctl);
+        ret = -ENOSYS;
         break;
     }
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 5879117580..0a866e3132 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -871,6 +871,13 @@ long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = 1;
         break;
 
+    case XEN_DOMCTL_assign_device:
+    case XEN_DOMCTL_test_assign_device:
+    case XEN_DOMCTL_deassign_device:
+    case XEN_DOMCTL_get_device_group:
+        ret = iommu_do_domctl(op, d, u_domctl);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3a83981464..c6bbb65bbf 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -341,8 +341,17 @@ struct domain_iommu {
 /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
 #ifdef CONFIG_HAS_PASSTHROUGH
 #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
+
+int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 #else
 #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
+
+static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    return -ENOSYS;
+}
 #endif
 
 int __must_check iommu_suspend(void);
@@ -356,9 +365,6 @@ int iommu_do_pci_domctl(struct xen_domctl *, struct domain *d,
                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 #endif
 
-int iommu_do_domctl(struct xen_domctl *, struct domain *d,
-                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
-
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
 /*
-- 
2.34.1


