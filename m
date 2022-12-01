Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC263F4DA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450949.708498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m6q-0004WR-4B; Thu, 01 Dec 2022 16:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450949.708498; Thu, 01 Dec 2022 16:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m6q-0004U1-1G; Thu, 01 Dec 2022 16:08:24 +0000
Received: by outflank-mailman (input) for mailman id 450949;
 Thu, 01 Dec 2022 16:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m6p-0004Tp-6I
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:08:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 607465c4-7192-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:08:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEFD6ED1;
 Thu,  1 Dec 2022 08:08:27 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E56093F73B;
 Thu,  1 Dec 2022 08:08:19 -0800 (PST)
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
X-Inumbo-ID: 607465c4-7192-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 07/21] xen/arm: vIOMMU: Add cmdline boot option "viommu = <boolean>"
Date: Thu,  1 Dec 2022 16:02:31 +0000
Message-Id: <11ad0192b1dfe5f90bc980a09894eb6ff7c5ba1f.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add cmdline boot option "viommu = <boolean>" to enable or disable the
virtual iommu support for guests on ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 docs/misc/xen-command-line.pandoc      |  7 +++++++
 xen/arch/arm/include/asm/viommu.h      | 11 +++++++++++
 xen/drivers/passthrough/arm/viommu.c   |  9 +++++++++
 xen/drivers/passthrough/arm/vsmmu-v3.c |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 424b12cfb2..14a104f2b9 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1896,6 +1896,13 @@ This option can be specified more than once (up to 8 times at present).
 
 Flag to enable or disable support for PCI passthrough
 
+### viommu (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable support for Virtual IOMMU for guests.
+
 ### pcid (x86)
 > `= <boolean> | xpti=<bool>`
 
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
index 4785877e2a..4de4cceeda 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -10,6 +10,7 @@
 #include <public/xen.h>
 
 extern struct list_head host_iommu_list;
+extern bool viommu_enabled;
 
 /* data structure for each hardware IOMMU */
 struct host_iommu {
@@ -50,6 +51,11 @@ uint16_t viommu_get_type(void);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
                             const struct dt_device_node *node);
 
+static always_inline bool is_viommu_enabled(void)
+{
+    return viommu_enabled;
+}
+
 #else
 
 static inline uint8_t viommu_get_type(void)
@@ -76,6 +82,11 @@ static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
     return;
 }
 
+static always_inline bool is_viommu_enabled(void)
+{
+    return false;
+}
+
 #endif /* CONFIG_VIRTUAL_IOMMU */
 
 #endif /* __ARCH_ARM_VIOMMU_H__ */
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
index 53ae46349a..a1d6a04ba9 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -3,6 +3,7 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/param.h>
 #include <xen/types.h>
 
 #include <asm/viommu.h>
@@ -38,8 +39,16 @@ void add_to_host_iommu_list(paddr_t addr, paddr_t size,
     list_add_tail(&iommu_data->entry, &host_iommu_list);
 }
 
+/* By default viommu is disabled. */
+bool __read_mostly viommu_enabled;
+boolean_param("viommu", viommu_enabled);
+
 int domain_viommu_init(struct domain *d, uint16_t viommu_type)
 {
+    /* Enable viommu when it has been enabled explicitly (viommu=on). */
+    if ( !viommu_enabled )
+        return 0;
+
     if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
         return 0;
 
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index 6b4009e5ef..e36f200ba5 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -105,6 +105,9 @@ void __init vsmmuv3_set_type(void)
 {
     const struct viommu_desc *desc = &vsmmuv3_desc;
 
+    if ( !is_viommu_enabled() )
+        return;
+
     if ( cur_viommu && (cur_viommu != desc) )
     {
         printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
-- 
2.25.1


