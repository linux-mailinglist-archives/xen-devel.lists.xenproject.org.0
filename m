Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A471780F
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541559.844498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GCE-00077W-OZ; Wed, 31 May 2023 07:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541559.844498; Wed, 31 May 2023 07:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GCE-00073A-H9; Wed, 31 May 2023 07:24:38 +0000
Received: by outflank-mailman (input) for mailman id 541559;
 Wed, 31 May 2023 07:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKzP=BU=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q4GCC-0005os-PF
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:24:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 31518958-ff84-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 09:24:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AF7415BF;
 Wed, 31 May 2023 00:25:20 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E90B3F663;
 Wed, 31 May 2023 00:24:33 -0700 (PDT)
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
X-Inumbo-ID: 31518958-ff84-11ed-8611-37d641c3527e
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
Subject: [PATCH v8 08/12] xen/physinfo: encode Arm SVE vector length in arch_capabilities
Date: Wed, 31 May 2023 08:24:09 +0100
Message-Id: <20230531072413.868673-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531072413.868673-1-luca.fancellu@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the arm platform supports SVE, advertise the feature in the
field arch_capabilities in struct xen_sysctl_physinfo by encoding
the SVE vector length in it.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes from v5:
 - Add R-by from Bertrand
Changes from v4:
 - Write arch_capabilities from arch_do_physinfo instead of using
   stub functions (Jan)
Changes from v3:
 - domainconfig_encode_vl is now named sve_encode_vl
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
 xen/arch/arm/sysctl.c       | 4 ++++
 xen/include/public/sysctl.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index b0a78a8b10d0..e9a0661146e4 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -11,11 +11,15 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
+#include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
+
+    pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
+                                       XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 2b24d6bfd00e..9d06e92d0f6a 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -94,6 +94,10 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+#if defined(__arm__) || defined(__aarch64__)
+#define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
+#endif
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
-- 
2.34.1


