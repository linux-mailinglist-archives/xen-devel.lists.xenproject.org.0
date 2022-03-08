Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE24D14C8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 11:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286703.486321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRX6S-0005PW-96; Tue, 08 Mar 2022 10:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286703.486321; Tue, 08 Mar 2022 10:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRX6S-0005LR-5a; Tue, 08 Mar 2022 10:30:04 +0000
Received: by outflank-mailman (input) for mailman id 286703;
 Tue, 08 Mar 2022 10:30:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRX6P-0004xE-3M
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 10:30:02 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b275c69b-9eca-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 11:29:58 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-72dc3927.us-west-2.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 08 Mar 2022 10:29:42 +0000
Received: from EX13D44EUB004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-72dc3927.us-west-2.amazon.com (Postfix) with
 ESMTPS id C1C3741C60; Tue,  8 Mar 2022 10:29:40 +0000 (UTC)
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D44EUB004.ant.amazon.com (10.43.166.198) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 10:29:39 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Tue, 8 Mar 2022 10:29:38 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 7487B4EA9; Tue,  8 Mar 2022 10:29:37 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b275c69b-9eca-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646735400; x=1678271400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mj4KvWVjR2Lga3XKnQh2USZEpWm0M+0U0oUseAwdJjM=;
  b=Yb7I2MQDinijsuZDoEwg1viP+7O+B1hmEGvQyvG9rTxYsxNNNbLXucNY
   m1Tgn9Oxg5UYk3VvhfXe9Dah5Hy/JHiUFKeJPE1lnoGZltwi7unwGbU8R
   IMcedg+8Cdpa43Kz82tPA38lzrqa5hs27Fg5FNNzoMSqQtRGc//js8Uyn
   4=;
X-IronPort-AV: E=Sophos;i="5.90,164,1643673600"; 
   d="scan'208";a="68917907"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced functions
Date: Tue, 8 Mar 2022 10:29:35 +0000
Message-ID: <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xen enabled CET for supporting architectures. The control flow aspect of
CET expects functions that can be called indirectly (i.e., via function
pointers) to start with an ENDBR64 instruction. Otherwise a control flow
exception is raised.

This expectation breaks livepatching flows because we patch functions by
overwriting their first 5 bytes with a JMP + <offset>, thus breaking the
ENDBR64. We fix this by checking the start of a patched function for
being ENDBR64. In the positive case we move the livepatch JMP to start
behind the ENDBR64 instruction.

To avoid having to guess the ENDBR64 offset again on patch reversal
(which might race with other mechanisms adding/removing ENDBR
dynamically), use the livepatch metadata to store the computed offset
along with the saved bytes of the overwritten function.

Signed-off-by: Bjoern Doebel <doebel@amazon.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
----
Note that on top of livepatching functions, Xen supports an additional
mode where we can "remove" a function by overwriting it with NOPs. This
is only supported for functions up to 31 bytes in size and this patch
reduces this limit to 30 bytes.

Changes since r1:
* use sizeof_field() to avoid unused variable warning
* make metadata variable const in arch_livepatch_revert
---
 xen/arch/x86/livepatch.c | 61 ++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 65530c1e57..0fd97f2a00 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -14,11 +14,29 @@
 #include <xen/vm_event.h>
 #include <xen/virtual_region.h>
 
+#include <asm/endbr.h>
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
 #include <asm/livepatch.h>
 #include <asm/setup.h>
 
+/*
+ * CET hotpatching support: We may have functions starting with an ENDBR64
+ * instruction that MUST remain the first instruction of the function, hence
+ * we need to move any hotpatch trampoline further into the function. For that
+ * we need to keep track of the patching offset used for any loaded hotpatch
+ * (to avoid racing against other fixups adding/removing ENDBR64 or similar
+ * instructions).
+ *
+ * We do so by making use of the existing opaque metadata area. We use its
+ * first 4 bytes to track the offset into the function used for patching and
+ * the remainder of the data to store overwritten code bytes.
+ */
+struct x86_livepatch_meta {
+    uint8_t patch_offset;
+    uint8_t instruction[LIVEPATCH_OPAQUE_SIZE - sizeof(uint8_t)];
+};
+
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
 {
     /* ved may be xzalloc()'d without INIT_LIST_HEAD() yet. */
@@ -104,18 +122,34 @@ void noinline arch_livepatch_revive(void)
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
 {
+    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
+
     /* If NOPing.. */
     if ( !func->new_addr )
     {
         /* Only do up to maximum amount we can put in the ->opaque. */
-        if ( func->new_size > sizeof(func->opaque) )
+        if ( func->new_size > sizeof_field(struct x86_livepatch_meta,
+                                           instruction) )
             return -EOPNOTSUPP;
 
         if ( func->old_size < func->new_size )
             return -EINVAL;
     }
-    else if ( func->old_size < ARCH_PATCH_INSN_SIZE )
-        return -EINVAL;
+    else
+    {
+        /*
+         * Space needed now depends on whether the target function
+         * starts with an ENDBR64 instruction.
+         */
+        uint8_t needed;
+
+        needed = ARCH_PATCH_INSN_SIZE;
+        if ( is_endbr64(func->old_addr) )
+            needed += ENDBR64_LEN;
+
+        if ( func->old_size < needed )
+            return -EINVAL;
+    }
 
     return 0;
 }
@@ -127,15 +161,21 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
 void noinline arch_livepatch_apply(struct livepatch_func *func)
 {
     uint8_t *old_ptr;
-    uint8_t insn[sizeof(func->opaque)];
+    struct x86_livepatch_meta *lp;
+    uint8_t insn[sizeof(lp->instruction)];
     unsigned int len;
 
+    lp = (struct x86_livepatch_meta *)func->opaque;
+    lp->patch_offset = 0;
     old_ptr = func->old_addr;
     len = livepatch_insn_len(func);
     if ( !len )
         return;
 
-    memcpy(func->opaque, old_ptr, len);
+    if ( is_endbr64(old_ptr) )
+        lp->patch_offset += ENDBR64_LEN;
+
+    memcpy(lp->instruction, old_ptr + lp->patch_offset, len);
     if ( func->new_addr )
     {
         int32_t val;
@@ -143,14 +183,15 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
         BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != (1 + sizeof(val)));
 
         insn[0] = 0xe9; /* Relative jump. */
-        val = func->new_addr - func->old_addr - ARCH_PATCH_INSN_SIZE;
+        val = func->new_addr - (func->old_addr + lp->patch_offset
+                                + ARCH_PATCH_INSN_SIZE);
 
         memcpy(&insn[1], &val, sizeof(val));
     }
     else
         add_nops(insn, len);
 
-    memcpy(old_ptr, insn, len);
+    memcpy(old_ptr + lp->patch_offset, insn, len);
 }
 
 /*
@@ -159,7 +200,11 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
  */
 void noinline arch_livepatch_revert(const struct livepatch_func *func)
 {
-    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
+    const struct x86_livepatch_meta *lp;
+
+    lp = (struct x86_livepatch_meta *)func->opaque;
+
+    memcpy(func->old_addr + lp->patch_offset, lp->instruction, livepatch_insn_len(func));
 }
 
 /*
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




