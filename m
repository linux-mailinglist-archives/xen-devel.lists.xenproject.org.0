Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B87BB31A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613306.953794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogAB-0007IB-He; Fri, 06 Oct 2023 08:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613306.953794; Fri, 06 Oct 2023 08:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogAB-00077t-Bz; Fri, 06 Oct 2023 08:26:23 +0000
Received: by outflank-mailman (input) for mailman id 613306;
 Fri, 06 Oct 2023 08:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qogA9-0006Fk-KG
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:26:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0704009e-6422-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 10:26:20 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C12D34EE074E;
 Fri,  6 Oct 2023 10:26:19 +0200 (CEST)
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
X-Inumbo-ID: 0704009e-6422-11ee-98d3-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/9] x86/cpu-policy: address violations of MISRA C Rule 10.1
Date: Fri,  6 Oct 2023 10:26:08 +0200
Message-Id: <463572d126a7700e5e90ef3a49104bd4b8c1c389.1696514677.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696514677.git.nicola.vetrini@bugseng.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The COUNT_LEAVES macro is introduced to avoid using an essentially
boolean value in a subtraction.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/lib/x86/cpu-policy.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index bab3eecda6c1..700993cc67e8 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -95,17 +95,18 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
                                       CPUID_GUEST_NR_EXTD_AMD)
 
+#define COUNT_LEAVES(X) ((X) - ((X) ? 1 : 0))
 /*
  * Maximum number of leaves a struct cpu_policy turns into when serialised for
  * interaction with the toolstack.  (Sum of all leaves in each union, less the
  * entries in basic which sub-unions hang off of.)
  */
-#define CPUID_MAX_SERIALISED_LEAVES                     \
-    (CPUID_GUEST_NR_BASIC +                             \
-     CPUID_GUEST_NR_FEAT   - !!CPUID_GUEST_NR_FEAT +    \
-     CPUID_GUEST_NR_CACHE  - !!CPUID_GUEST_NR_CACHE +   \
-     CPUID_GUEST_NR_TOPO   - !!CPUID_GUEST_NR_TOPO +    \
-     CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
+#define CPUID_MAX_SERIALISED_LEAVES         \
+    (CPUID_GUEST_NR_BASIC +                 \
+     COUNT_LEAVES(CPUID_GUEST_NR_FEAT) +    \
+     COUNT_LEAVES(CPUID_GUEST_NR_CACHE) +   \
+     COUNT_LEAVES(CPUID_GUEST_NR_TOPO) +    \
+     COUNT_LEAVES(CPUID_GUEST_NR_XSTATE) +  \
      CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
 
 /* Maximum number of MSRs written when serialising a cpu_policy. */
-- 
2.34.1


