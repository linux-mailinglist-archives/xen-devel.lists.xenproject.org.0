Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3CD9075E1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 16:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740046.1147049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHluu-000330-7i; Thu, 13 Jun 2024 14:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740046.1147049; Thu, 13 Jun 2024 14:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHluu-00030e-4I; Thu, 13 Jun 2024 14:59:08 +0000
Received: by outflank-mailman (input) for mailman id 740046;
 Thu, 13 Jun 2024 14:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0CL=NP=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sHlus-00030Y-6J
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 14:59:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a86c59-2995-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 16:59:04 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-46-197-197.retail.telecomitalia.it [79.46.197.197])
 by support.bugseng.com (Postfix) with ESMTPSA id DCF064EE0756;
 Thu, 13 Jun 2024 16:59:02 +0200 (CEST)
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
X-Inumbo-ID: 79a86c59-2995-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] public/sysctl: address violations of MISRA C: 2012 Rule 7.3
Date: Thu, 13 Jun 2024 16:58:43 +0200
Message-Id: <a68e796048912c816bc8320416024a60290f33e7.1718290222.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 7.3 which states as
following: The lowercase character `l' shall not be used in a literal
suffix.

Changed moreover suffixes 'u' in 'U' for better readability next to
the 'L's.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/include/public/sysctl.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3a6e7d48f0..b2a5a724db 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -898,15 +898,15 @@ struct xen_sysctl_psr_alloc {
  * instruction for PV guests.
  */
 struct xen_sysctl_cpu_levelling_caps {
-#define XEN_SYSCTL_CPU_LEVELCAP_faulting    (1ul <<  0) /* CPUID faulting    */
-#define XEN_SYSCTL_CPU_LEVELCAP_ecx         (1ul <<  1) /* 0x00000001.ecx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_edx         (1ul <<  2) /* 0x00000001.edx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_extd_ecx    (1ul <<  3) /* 0x80000001.ecx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_extd_edx    (1ul <<  4) /* 0x80000001.edx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_xsave_eax   (1ul <<  5) /* 0x0000000D:1.eax  */
-#define XEN_SYSCTL_CPU_LEVELCAP_thermal_ecx (1ul <<  6) /* 0x00000006.ecx    */
-#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_eax    (1ul <<  7) /* 0x00000007:0.eax  */
-#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_ebx    (1ul <<  8) /* 0x00000007:0.ebx  */
+#define XEN_SYSCTL_CPU_LEVELCAP_faulting    (1UL <<  0) /* CPUID faulting    */
+#define XEN_SYSCTL_CPU_LEVELCAP_ecx         (1UL <<  1) /* 0x00000001.ecx    */
+#define XEN_SYSCTL_CPU_LEVELCAP_edx         (1UL <<  2) /* 0x00000001.edx    */
+#define XEN_SYSCTL_CPU_LEVELCAP_extd_ecx    (1UL <<  3) /* 0x80000001.ecx    */
+#define XEN_SYSCTL_CPU_LEVELCAP_extd_edx    (1UL <<  4) /* 0x80000001.edx    */
+#define XEN_SYSCTL_CPU_LEVELCAP_xsave_eax   (1UL <<  5) /* 0x0000000D:1.eax  */
+#define XEN_SYSCTL_CPU_LEVELCAP_thermal_ecx (1UL <<  6) /* 0x00000006.ecx    */
+#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_eax    (1UL <<  7) /* 0x00000007:0.eax  */
+#define XEN_SYSCTL_CPU_LEVELCAP_l7s0_ebx    (1UL <<  8) /* 0x00000007:0.ebx  */
     uint32_t caps;
 };
 
-- 
2.34.1


