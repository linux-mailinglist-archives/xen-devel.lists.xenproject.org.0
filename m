Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480A75C265
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 11:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567426.886459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm4H-000216-94; Fri, 21 Jul 2023 09:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567426.886459; Fri, 21 Jul 2023 09:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMm4H-0001zS-4j; Fri, 21 Jul 2023 09:04:57 +0000
Received: by outflank-mailman (input) for mailman id 567426;
 Fri, 21 Jul 2023 09:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0zQ=DH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qMm4F-0001zM-Jl
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 09:04:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a82f50ad-27a5-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 11:04:54 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id 8C7B94EE0C89;
 Fri, 21 Jul 2023 11:04:52 +0200 (CEST)
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
X-Inumbo-ID: a82f50ad-27a5-11ee-b23a-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] x86/cpu-policy: address violations of MISRA C:2012 Rule 8.3 on parameter names
Date: Fri, 21 Jul 2023 11:04:45 +0200
Message-Id: <912cfe8f5b043bddc80cbf9f75cc0b35e02a6ecd.1689929894.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter names in function declarations to be consistent with
the ones used in the correponding definitions, thus addressing
violations of MISRA C:2012 Rule 8.3: "All declarations of an object or
function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/lib/x86/cpu-policy.h | 29 ++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 6d5e9edd26..bab3eecda6 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -451,23 +451,24 @@ typedef xen_msr_entry_t msr_entry_buffer_t[];
  * Serialise the CPUID leaves of a cpu_policy object into an array of cpuid
  * leaves.
  *
- * @param policy     The cpu_policy to serialise.
- * @param leaves     The array of leaves to serialise into.
- * @param nr_entries The number of entries in 'leaves'.
+ * @param p            The cpu_policy to serialise.
+ * @param leaves       The array of leaves to serialise into.
+ * @param nr_entries_p The number of entries in 'leaves'.
  * @returns -errno
  *
  * Writes at most CPUID_MAX_SERIALISED_LEAVES.  May fail with -ENOBUFS if the
  * leaves array is too short.  On success, nr_entries is updated with the
  * actual number of leaves written.
  */
-int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
-                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries);
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
+                             cpuid_leaf_buffer_t leaves,
+                             uint32_t *nr_entries_p);
 
 /**
  * Unserialise the CPUID leaves of a cpu_policy object into an array of cpuid
  * leaves.
  *
- * @param policy      The cpu_policy to unserialise into.
+ * @param p           The cpu_policy to unserialise into.
  * @param leaves      The array of leaves to unserialise from.
  * @param nr_entries  The number of entries in 'leaves'.
  * @param err_leaf    Optional hint for error diagnostics.
@@ -481,7 +482,7 @@ int x86_cpuid_copy_to_buffer(const struct cpu_policy *policy,
  * No content validation of in-range leaves is performed.  Synthesised data is
  * recalculated.
  */
-int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
+int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
                                const cpuid_leaf_buffer_t leaves,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
@@ -489,22 +490,22 @@ int x86_cpuid_copy_from_buffer(struct cpu_policy *policy,
 /**
  * Serialise the MSRs of a cpu_policy object into an array.
  *
- * @param policy     The cpu_policy to serialise.
- * @param msrs       The array of msrs to serialise into.
- * @param nr_entries The number of entries in 'msrs'.
+ * @param p            The cpu_policy to serialise.
+ * @param msrs         The array of msrs to serialise into.
+ * @param nr_entries_p The number of entries in 'msrs'.
  * @returns -errno
  *
  * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
  * buffer array is too short.  On success, nr_entries is updated with the
  * actual number of msrs written.
  */
-int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
-                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
+int x86_msr_copy_to_buffer(const struct cpu_policy *p,
+                           msr_entry_buffer_t msrs, uint32_t *nr_entries_p);
 
 /**
  * Unserialise the MSRs of a cpu_policy object from an array of msrs.
  *
- * @param policy     The cpu_policy object to unserialise into.
+ * @param p          The cpu_policy object to unserialise into.
  * @param msrs       The array of msrs to unserialise from.
  * @param nr_entries The number of entries in 'msrs'.
  * @param err_msr    Optional hint for error diagnostics.
@@ -518,7 +519,7 @@ int x86_msr_copy_to_buffer(const struct cpu_policy *policy,
  *
  * No content validation is performed on the data stored in the policy object.
  */
-int x86_msr_copy_from_buffer(struct cpu_policy *policy,
+int x86_msr_copy_from_buffer(struct cpu_policy *p,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
-- 
2.34.1


