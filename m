Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471257CDF4A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618595.962445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nz-0005Wx-8D; Wed, 18 Oct 2023 14:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618595.962445; Wed, 18 Oct 2023 14:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7Nz-0005U5-21; Wed, 18 Oct 2023 14:18:59 +0000
Received: by outflank-mailman (input) for mailman id 618595;
 Wed, 18 Oct 2023 14:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7etD=GA=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qt7Nx-0004vw-B0
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:18:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44dd416c-6dc1-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 16:18:54 +0200 (CEST)
Received: from beta.station (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id 4169E4EE0740;
 Wed, 18 Oct 2023 16:18:54 +0200 (CEST)
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
X-Inumbo-ID: 44dd416c-6dc1-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 1/4] xen/arm: address violations of MISRA C:2012 Rule 13.1
Date: Wed, 18 Oct 2023 16:18:48 +0200
Message-Id: <31a926a09dfcef43d13a402fd3b235aeba48009d.1697638210.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638210.git.simone.ballarin@bugseng.com>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

This patch moves expressions with side-effects into new variables before
the initializer lists.

Function calls do not necessarily have side-effects, in these cases the
GCC pure or const attributes are added when possible.

No functional changes.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Function attributes pure and const do not need to be added as GCC
attributes, they can be added using ECLAIR configurations.
---
 xen/arch/arm/device.c              |  6 +++---
 xen/arch/arm/guestcopy.c           | 12 ++++++++----
 xen/arch/arm/include/asm/current.h |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 1f631d3274..e9be078415 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -319,6 +319,8 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
     int res;
     paddr_t addr, size;
     bool own_device = !dt_device_for_passthrough(dev);
+    bool dev_is_hostbridge = is_pci_passthrough_enabled() &&
+                             device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE;
     /*
      * We want to avoid mapping the MMIO in dom0 for the following cases:
      *   - The device is owned by dom0 (i.e. it has been flagged for
@@ -329,9 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
     struct map_range_data mr_data = {
         .d = d,
         .p2mt = p2mt,
-        .skip_mapping = !own_device ||
-                        (is_pci_passthrough_enabled() &&
-                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
+        .skip_mapping = !own_device || dev_is_hostbridge,
         .iomem_ranges = iomem_ranges,
         .irq_ranges = irq_ranges
     };
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
index 6716b03561..3ec6743bf6 100644
--- a/xen/arch/arm/guestcopy.c
+++ b/xen/arch/arm/guestcopy.c
@@ -109,27 +109,31 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
 
 unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
 {
+    struct vcpu *current_vcpu = current;
     return copy_guest((void *)from, (vaddr_t)to, len,
-                      GVA_INFO(current), COPY_to_guest | COPY_linear);
+                      GVA_INFO(current_vcpu), COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
                                              unsigned int len)
 {
-    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
+    struct vcpu *current_vcpu = current;
+    return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current_vcpu),
                       COPY_to_guest | COPY_flush_dcache | COPY_linear);
 }
 
 unsigned long raw_clear_guest(void *to, unsigned int len)
 {
-    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
+    struct vcpu *current_vcpu = current;
+    return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current_vcpu),
                       COPY_to_guest | COPY_linear);
 }
 
 unsigned long raw_copy_from_guest(void *to, const void __user *from,
                                   unsigned int len)
 {
-    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
+    struct vcpu *current_vcpu = current;
+    return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current_vcpu),
                       COPY_from_guest | COPY_linear);
 }
 
diff --git a/xen/arch/arm/include/asm/current.h b/xen/arch/arm/include/asm/current.h
index 6973eeb1d1..a66e28fefb 100644
--- a/xen/arch/arm/include/asm/current.h
+++ b/xen/arch/arm/include/asm/current.h
@@ -28,7 +28,7 @@ struct cpu_info {
     uint32_t flags;
 };
 
-static inline struct cpu_info *get_cpu_info(void)
+static inline __attribute_pure__ struct cpu_info *get_cpu_info(void)
 {
 #ifdef __clang__
     unsigned long sp;
-- 
2.34.1


