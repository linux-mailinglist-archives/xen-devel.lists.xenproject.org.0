Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3EBD0A8E1
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 15:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198883.1515687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veD9y-0001XG-NC; Fri, 09 Jan 2026 14:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198883.1515687; Fri, 09 Jan 2026 14:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veD9y-0001Up-K5; Fri, 09 Jan 2026 14:08:14 +0000
Received: by outflank-mailman (input) for mailman id 1198883;
 Fri, 09 Jan 2026 14:08:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1veD9w-0001Uh-MX
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 14:08:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1veD9v-00GbCg-0C;
 Fri, 09 Jan 2026 14:08:11 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1veD9v-00FZLi-0H;
 Fri, 09 Jan 2026 14:08:11 +0000
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
	Subject:Cc:To:From; bh=qjgtr4bC7APkZhNKrkEmz/ndAIWVoimDzoPnpMO29/Y=; b=wQnZC+
	/xZQaAvCmgybtpUxVlYHS+2lWz77qObyvzA2lm5gM6i+Km/l136LnH1JZcHj+wCbNrP8W3DluvHMd
	0TwJ3Z4UDl/fLxDHHVWERGrD3kEjEuvNoPjZVnq1VwoEJ9TRdb5QMVu7zX+u0RuBstFNh4D1Dm2NY
	SKsh+iS4B2I=;
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
Subject: [PATCH v4] xen/domain: introduce DOMID_ANY
Date: Fri,  9 Jan 2026 06:07:48 -0800
Message-ID: <20260109140747.195460-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add a new symbol DOMID_ANY to improve the readability of the code.

Update all relevant domid_alloc() call sites.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- new value for DOMID_ANY instead of aliasing DOMID_INVALID
- Link to v3: https://lore.kernel.org/xen-devel/20250924030630.122229-2-dmukhin@ford.com/
---
 tools/tests/domid/harness.h             |  1 +
 tools/tests/domid/test-domid.c          | 12 ++++++------
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/domctl.c                     |  2 +-
 xen/common/domid.c                      |  2 +-
 xen/include/public/xen.h                |  5 +++++
 6 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
index 17eb22a9a854..65da0d075a2b 100644
--- a/tools/tests/domid/harness.h
+++ b/tools/tests/domid/harness.h
@@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
 
 #define DOMID_FIRST_RESERVED            (100)
 #define DOMID_INVALID                   (101)
+#define DOMID_ANY                       (102)
 
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
index 495ef7b16aa0..9130c38681df 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -842,7 +842,7 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        domid = domid_alloc(DOMID_INVALID);
+        domid = domid_alloc(DOMID_ANY);
         if ( domid == DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node));
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32d0..e2c8990531ad 100644
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
index 7f15204c3885..b5789c32ae1f 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+#endif
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.52.0


