Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8826BAB95
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509942.786780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5T-0007CW-3N; Wed, 15 Mar 2023 09:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509942.786780; Wed, 15 Mar 2023 09:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5S-00078K-VC; Wed, 15 Mar 2023 09:06:22 +0000
Received: by outflank-mailman (input) for mailman id 509942;
 Wed, 15 Mar 2023 09:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pcN5R-0005Kr-Rm
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:06:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a68d5f01-c310-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:06:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C7D9165C;
 Wed, 15 Mar 2023 02:07:03 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 223873F8C6;
 Wed, 15 Mar 2023 02:06:18 -0700 (PDT)
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
X-Inumbo-ID: a68d5f01-c310-11ed-b464-930f4c7d94ae
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
Subject: [PATCH v2 07/10] xen/physinfo: encode Arm SVE vector length in arch_capabilities
Date: Wed, 15 Mar 2023 09:05:55 +0000
Message-Id: <20230315090558.731029-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315090558.731029-1-luca.fancellu@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the arm platform supports SVE, advertise the feature in the
field arch_capabilities in struct xen_sysctl_physinfo by encoding
the SVE vector length in it.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - Use only arch_capabilities and some defines to encode SVE VL
   (Bertrand, Stefano, Jan)
Changes from RFC:
 - new patch
---
 xen/arch/arm/sysctl.c       | 11 +++++++++++
 xen/include/public/sysctl.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index b0a78a8b10d0..075f52801453 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -11,11 +11,22 @@
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
+        /* Vector length is divided by 128 to save some space */
+        uint32_t sve_vl = get_sys_vl_len() / SVE_VL_MULTIPLE_VAL;
+
+        sve_vl &= XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK;
+
+        pi->arch_capabilities |= sve_vl << XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT;
+    }
 }
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index e8dded9fb94a..ec15d8c5ab47 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -94,6 +94,9 @@ struct xen_sysctl_tbuf_op {
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
 #define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
 
+#define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
+#define XEN_SYSCTL_PHYSCAP_ARM_SVE_SHFT  (0)
+
 struct xen_sysctl_physinfo {
     uint32_t threads_per_core;
     uint32_t cores_per_socket;
-- 
2.34.1


