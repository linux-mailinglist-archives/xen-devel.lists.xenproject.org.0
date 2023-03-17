Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B56BE9F1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 14:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511072.789912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdA0D-0008QK-8H; Fri, 17 Mar 2023 13:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511072.789912; Fri, 17 Mar 2023 13:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdA0D-0008Mc-3E; Fri, 17 Mar 2023 13:20:13 +0000
Received: by outflank-mailman (input) for mailman id 511072;
 Fri, 17 Mar 2023 13:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HfIU=7J=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pdA0A-0005tG-J5
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 13:20:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 70e10710-c4c6-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 14:20:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0E631480;
 Fri, 17 Mar 2023 06:20:52 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA4333F64C;
 Fri, 17 Mar 2023 06:20:07 -0700 (PDT)
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
X-Inumbo-ID: 70e10710-c4c6-11ed-87f5-c1b5be75604c
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
Subject: [PATCH v3 07/10] xen/physinfo: encode Arm SVE vector length in arch_capabilities
Date: Fri, 17 Mar 2023 13:19:46 +0000
Message-Id: <20230317131949.4031014-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317131949.4031014-1-luca.fancellu@arm.com>
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the arm platform supports SVE, advertise the feature in the
field arch_capabilities in struct xen_sysctl_physinfo by encoding
the SVE vector length in it.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v2:
 - Remove XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT, use MASK_INSR and
   protect with ifdef XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK (Jan)
 - Use the helper function sve_arch_cap_physinfo to encode
   the VL into physinfo arch_capabilities field.
Changes from v1:
 - Use only arch_capabilities and some defines to encode SVE VL
   (Bertrand, Stefano, Jan)
Changes from RFC:
 - new patch
---
 xen/arch/arm/arm64/sve.c             | 12 ++++++++++++
 xen/arch/arm/include/asm/arm64/sve.h |  2 ++
 xen/arch/arm/sysctl.c                |  3 +++
 xen/include/public/sysctl.h          |  4 ++++
 4 files changed, 21 insertions(+)

diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index 6593b59b58e8..409b029e4d21 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -117,3 +117,15 @@ void sve_restore_state(struct vcpu *v)
 
     sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
 }
+
+void sve_arch_cap_physinfo(uint32_t *arch_capabilities)
+{
+    if ( cpu_has_sve )
+    {
+        /* Vector length is divided by 128 to save some space */
+        uint32_t sve_vl = MASK_INSR(domainconfig_encode_vl(get_sys_vl_len()),
+                                    XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
+
+        *arch_capabilities |= sve_vl;
+    }
+}
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index 8654b0fac4bc..34b4c39191cb 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -41,6 +41,7 @@ int sve_context_init(struct vcpu *v);
 void sve_context_free(struct vcpu *v);
 void sve_save_state(struct vcpu *v);
 void sve_restore_state(struct vcpu *v);
+void sve_arch_cap_physinfo(uint32_t *arch_capabilities);
 
 #else /* !CONFIG_ARM64_SVE */
 
@@ -69,6 +70,7 @@ static inline int sve_context_init(struct vcpu *v)
 static inline void sve_context_free(struct vcpu *v) {}
 static inline void sve_save_state(struct vcpu *v) {}
 static inline void sve_restore_state(struct vcpu *v) {}
+static inline void sve_arch_cap_physinfo(uint32_t *arch_capabilities) {}
 
 #endif
 
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index b0a78a8b10d0..64e4d3e06a6b 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -11,11 +11,14 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
+
+    sve_arch_cap_physinfo(&pi->arch_capabilities);
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index e8dded9fb94a..99ea3fa0740b 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -94,6 +94,10 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+#ifdef __aarch64__
+#define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
+#endif
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
-- 
2.34.1


