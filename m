Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45173766F0F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 16:12:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571474.895417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOCV-0002DC-Mw; Fri, 28 Jul 2023 14:12:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571474.895417; Fri, 28 Jul 2023 14:12:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPOCV-0002Ab-KA; Fri, 28 Jul 2023 14:12:15 +0000
Received: by outflank-mailman (input) for mailman id 571474;
 Fri, 28 Jul 2023 14:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8l51=DO=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qPOCT-0002AV-Kd
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 14:12:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be6e510e-2d50-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 16:12:11 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.4.37])
 by support.bugseng.com (Postfix) with ESMTPSA id F26BB4EE073F;
 Fri, 28 Jul 2023 16:12:09 +0200 (CEST)
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
X-Inumbo-ID: be6e510e-2d50-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] IOMMU: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Fri, 28 Jul 2023 16:12:02 +0200
Message-Id: <ba140642a267791c619dbbe2ba21f880c7e2b53e.1690551759.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters to address violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/iommu.c | 10 +++++-----
 xen/include/xen/iommu.h         | 30 ++++++++++++++++--------------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 0e187f6ae3..7bbe3889a2 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -25,10 +25,10 @@
 unsigned int __read_mostly iommu_dev_iotlb_timeout = 1000;
 integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_timeout);
 
-bool_t __initdata iommu_enable = 1;
-bool_t __read_mostly iommu_enabled;
-bool_t __read_mostly force_iommu;
-bool_t __read_mostly iommu_verbose;
+bool __initdata iommu_enable = 1;
+bool __read_mostly iommu_enabled;
+bool __read_mostly force_iommu;
+bool __read_mostly iommu_verbose;
 static bool_t __read_mostly iommu_crash_disable;
 
 #define IOMMU_quarantine_none         0 /* aka false */
@@ -57,7 +57,7 @@ int8_t __hwdom_initdata iommu_hwdom_reserved = -1;
 bool __read_mostly iommu_hap_pt_share = true;
 #endif
 
-bool_t __read_mostly iommu_debug;
+bool __read_mostly iommu_debug;
 
 DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 405db59971..8c0818cd01 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -52,7 +52,7 @@ static inline bool_t dfn_eq(dfn_t x, dfn_t y)
 }
 
 #ifdef CONFIG_HAS_PASSTHROUGH
-extern bool_t iommu_enable, iommu_enabled;
+extern bool iommu_enable, iommu_enabled;
 extern bool force_iommu, iommu_verbose;
 /* Boolean except for the specific purposes of drivers/passthrough/iommu.c. */
 extern uint8_t iommu_quarantine;
@@ -108,8 +108,8 @@ static inline void clear_iommu_hap_pt_share(void)
 #endif
 }
 
-extern bool_t iommu_debug;
-extern bool_t amd_iommu_perdev_intremap;
+extern bool iommu_debug;
+extern bool amd_iommu_perdev_intremap;
 
 extern bool iommu_hwdom_strict, iommu_hwdom_passthrough, iommu_hwdom_inclusive;
 extern int8_t iommu_hwdom_reserved;
@@ -165,10 +165,10 @@ enum
  * values indicate partial completion, which is possible only with
  * IOMMUF_preempt passed in.
  */
-long __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
+long __must_check iommu_map(struct domain *d, dfn_t dfn0, mfn_t mfn0,
                             unsigned long page_count, unsigned int flags,
                             unsigned int *flush_flags);
-long __must_check iommu_unmap(struct domain *d, dfn_t dfn,
+long __must_check iommu_unmap(struct domain *d, dfn_t dfn0,
                               unsigned long page_count, unsigned int flags,
                               unsigned int *flush_flags);
 
@@ -197,11 +197,13 @@ bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature);
 
 #ifdef CONFIG_HAS_PCI
 struct pirq;
-int hvm_do_IRQ_dpci(struct domain *, struct pirq *);
-int pt_irq_create_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
-int pt_irq_destroy_bind(struct domain *, const struct xen_domctl_bind_pt_irq *);
+int hvm_do_IRQ_dpci(struct domain *d, struct pirq *pirq);
+int pt_irq_create_bind(struct domain *d,
+                       const struct xen_domctl_bind_pt_irq *pt_irq_bind);
+int pt_irq_destroy_bind(struct domain *d,
+                        const struct xen_domctl_bind_pt_irq *pt_irq_bind);
 
-struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *);
+struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *d);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
 
 struct msi_desc;
@@ -229,8 +231,8 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
 
-int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
-                       XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
+int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
+                       XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
 #endif /* HAS_DEVICE_TREE */
 
@@ -386,12 +388,12 @@ static inline int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
 int __must_check iommu_suspend(void);
 void iommu_resume(void);
 void iommu_crash_shutdown(void);
-int iommu_get_reserved_device_memory(iommu_grdm_t *, void *);
+int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
 int iommu_quarantine_dev_init(device_t *dev);
 
 #ifdef CONFIG_HAS_PCI
-int iommu_do_pci_domctl(struct xen_domctl *, struct domain *d,
-                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
+int iommu_do_pci_domctl(struct xen_domctl *domctl, struct domain *d,
+                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 #endif
 
 void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
-- 
2.34.1


