Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64023687B92
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488666.756914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSL-0004q2-16; Thu, 02 Feb 2023 11:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488666.756914; Thu, 02 Feb 2023 11:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSK-0004mv-QA; Thu, 02 Feb 2023 11:08:40 +0000
Received: by outflank-mailman (input) for mailman id 488666;
 Thu, 02 Feb 2023 11:08:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BK1=56=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pNXSI-0002sY-ST
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:08:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f10c0395-a2e9-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 12:08:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B92C9C14;
 Thu,  2 Feb 2023 03:09:19 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E93D3F64C;
 Thu,  2 Feb 2023 03:08:36 -0800 (PST)
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
X-Inumbo-ID: f10c0395-a2e9-11ed-933c-83870f6b2ba8
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 07/10] xen/physinfo: add arm SVE arch capability and vector length
Date: Thu,  2 Feb 2023 11:08:13 +0000
Message-Id: <20230202110816.1252419-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202110816.1252419-1-luca.fancellu@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the arm platform supports SVE, advertise the feature by a new
flag for the arch_capabilities in struct xen_sysctl_physinfo and add
a new field "arm_sve_vl_bits" where on arm there can be stored the
maximum SVE vector length in bits.

Update the padding.

Bump XEN_SYSCTL_INTERFACE_VERSION for the changes.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from RFC:
 - new patch
---
Here I need an opinion from arm and x86 maintainer, I see there is no arch
specific structure in struct xen_sysctl_physinfo, hw_cap is used only by x86
and now arch_capabilities and the new arm_sve_vl_bits will be used only by arm.
So how should we proceed here? Shall we create a struct arch for each
architecture and for example move arch_capabilities inside it (renaming to
capabilities) and every arch specific field as well?
(is hw_cap only for x86?)
---
 xen/arch/arm/sysctl.c       |  7 +++++++
 xen/include/public/sysctl.h | 11 +++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index b0a78a8b10d0..d65f8be498f4 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -11,11 +11,18 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
+
+    if ( cpu_has_sve )
+    {
+        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_sve;
+        pi->arm_sve_vl_bits = get_sys_vl_len();
+    }
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 001a4de27375..5acbb41256bc 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -18,7 +18,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000015
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000016
 
 /*
  * Read console content from Xen buffer ring.
@@ -94,6 +94,12 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+/* Arm platform is SVE capable */
+#define XEN_SYSCTL_PHYSCAP_ARM_sve (1u << 0)
+
+/* Max XEN_SYSCTL_PHYSCAP_ARM_* constant.  Used for ABI checking. */
+#define XEN_SYSCTL_PHYSCAP_ARM_MAX XEN_SYSCTL_PHYSCAP_ARM_sve
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
@@ -104,7 +110,8 @@ struct xen_sysctl_physinfo {
     uint32_t cpu_khz;
     uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
     uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
-    uint32_t pad;
+    uint16_t arm_sve_vl_bits;
+    uint16_t pad;
     uint64_aligned_t total_pages;
     uint64_aligned_t free_pages;
     uint64_aligned_t scrub_pages;
-- 
2.25.1


