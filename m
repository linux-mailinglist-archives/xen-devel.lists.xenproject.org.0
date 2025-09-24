Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A7B981B5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 05:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128808.1469026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1FqB-0001qR-7r; Wed, 24 Sep 2025 03:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128808.1469026; Wed, 24 Sep 2025 03:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1FqB-0001nH-4c; Wed, 24 Sep 2025 03:06:47 +0000
Received: by outflank-mailman (input) for mailman id 1128808;
 Wed, 24 Sep 2025 03:06:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1v1FqA-0001nB-6k
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 03:06:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1v1Fq9-007nTL-1t;
 Wed, 24 Sep 2025 03:06:45 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1v1Fq9-00Ah6Q-1y;
 Wed, 24 Sep 2025 03:06:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From; bh=fnFz8JkCkgwlxqLvlzprdKyhKzICse/YqhN2WV/X1/s=; b=6JjPHF
	zZwmuOtVgdLmQUoa+iUHSnYz2XpkHLdx+va9ikHGKwnhGKk/Mf3284+XsyaVPtFakS3Y9RcY8nwgh
	44oPuLhDWdrffiaFMKf8bHxKc7xsl7Lr25mA9PhcA1HRwsLe2uM8lsYbfacfTDWanQVBds7Y7Z6rq
	0dFsv4NZhgo=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v3] xen/domain: introduce DOMID_ANY
Date: Tue, 23 Sep 2025 20:06:31 -0700
Message-ID: <20250924030630.122229-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
of the code.

Update all relevant domid_alloc() call sites.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- move DOMID_ANY back to the public header; add proper guards
- CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2056319227
- Link to v2: https://lore.kernel.org/xen-devel/20250920174732.1207847-2-dmukhin@ford.com/
---
 tools/tests/domid/harness.h             |  1 +
 tools/tests/domid/test-domid.c          | 12 ++++++------
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/domctl.c                     |  2 +-
 xen/common/domid.c                      |  2 +-
 xen/include/public/xen.h                |  5 +++++
 6 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
index 17eb22a9a854..610b564d4061 100644
--- a/tools/tests/domid/harness.h
+++ b/tools/tests/domid/harness.h
@@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
 
 #define DOMID_FIRST_RESERVED            (100)
 #define DOMID_INVALID                   (101)
+#define DOMID_ANY                       DOMID_INVALID
 
 #endif /* _TEST_HARNESS_ */
 
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
index 5915c4699a5c..71cc4e7fd86d 100644
--- a/tools/tests/domid/test-domid.c
+++ b/tools/tests/domid/test-domid.c
@@ -41,20 +41,20 @@ int main(int argc, char **argv)
         domid_free(expected);
 
     /*
-     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
      * will never return the same ID.
      * NB: ID#0 is reserved and shall not be allocated by
-     * domid_alloc(DOMID_INVALID).
+     * domid_alloc(DOMID_ANY).
      */
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 3: expected %u allocated %u\n", expected, allocated);
     }
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == DOMID_INVALID,
                "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
     }
@@ -64,7 +64,7 @@ int main(int argc, char **argv)
         domid_free(expected);
     for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 5: expected %u allocated %u\n", expected, allocated);
     }
@@ -72,7 +72,7 @@ int main(int argc, char **argv)
     /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
     expected = DOMID_FIRST_RESERVED - 1;
     domid_free(DOMID_FIRST_RESERVED - 1);
-    allocated = domid_alloc(DOMID_INVALID);
+    allocated = domid_alloc(DOMID_ANY);
     verify(allocated == expected,
            "TEST 6: expected %u allocated %u\n", expected, allocated);
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 9fd004c42af7..e2764768c983 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -848,7 +848,7 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        domid = domid_alloc(DOMID_INVALID);
+        domid = domid_alloc(DOMID_ANY);
         if ( domid == DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node));
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 954d79022645..ca91686a03d8 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -410,7 +410,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     case XEN_DOMCTL_createdomain:
     {
         /* NB: ID#0 is reserved, find the first suitable ID instead. */
-        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
+        domid_t domid = domid_alloc(op->domain ?: DOMID_ANY);
 
         if ( domid == DOMID_INVALID )
         {
diff --git a/xen/common/domid.c b/xen/common/domid.c
index 2387ddb08300..76b7f3e7ae6e 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
  * @param domid Domain ID hint:
  * - If an explicit domain ID is provided, verify its availability and use it
  *   if ID is not used;
- * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
+ * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
  *   starting from the last used ID. Implementation guarantees that two
  *   consecutive calls will never return the same ID. ID#0 is reserved for
  *   the first boot domain (currently, dom0) and excluded from the allocation
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76b7..29b7c81ba1bb 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
+#define DOMID_ANY            DOMID_INVALID
+#endif
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.51.0


