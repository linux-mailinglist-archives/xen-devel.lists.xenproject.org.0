Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A924CFD73
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285881.485189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBwe-0005Oh-7c; Mon, 07 Mar 2022 11:54:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285881.485189; Mon, 07 Mar 2022 11:54:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBwe-0005Kx-3K; Mon, 07 Mar 2022 11:54:32 +0000
Received: by outflank-mailman (input) for mailman id 285881;
 Mon, 07 Mar 2022 11:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7T3K=TS=amazon.de=prvs=058ff0969=doebel@srs-se1.protection.inumbo.net>)
 id 1nRBwc-0004Lv-8O
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:54:30 +0000
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56adcddc-9e0d-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:54:28 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP;
 07 Mar 2022 11:54:08 +0000
Received: from EX13D44EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com (Postfix) with
 ESMTPS id 8EB46A277F; Mon,  7 Mar 2022 11:54:05 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D44EUB004.ant.amazon.com (10.43.166.198) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 7 Mar 2022 11:54:04 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Mon, 7 Mar 2022 11:54:03 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 4E48D4E7F; Mon,  7 Mar 2022 11:54:03 +0000 (UTC)
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
X-Inumbo-ID: 56adcddc-9e0d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646654069; x=1678190069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T4HQVwdD+Sp1df6ID2a/ASUAEQvXVBttAi63ggcy0Qg=;
  b=oqPK8vc+PN0FW5dmOzkrjNIO2hC8qvNtHVSV7ncHGGbsAHLeWuXzNre5
   WLmZE+qVdmG9aQhv6UxebDJkZ7NeQVvl4MB/LNHtOIfD+mpzjAGQkuUZR
   B0SnZuV0F0g+d/5AbHpgto6QXF/P/LwLU9k8lkt28Yux0jzX0b944bpqr
   A=;
X-IronPort-AV: E=Sophos;i="5.90,162,1643673600"; 
   d="scan'208";a="68586367"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/2] xen/x86: Livepatch: support patching CET-enhanced functions
Date: Mon, 7 Mar 2022 11:53:54 +0000
Message-ID: <deb5d86b20c02312023959bae06b0fe651a4b2f4.1646653825.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1646653825.git.doebel@amazon.de>
References: <cover.1646653825.git.doebel@amazon.de>
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
---
 xen/arch/x86/livepatch.c | 63 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 65530c1e57..da7611c01d 100644
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
@@ -104,18 +122,36 @@ void noinline arch_livepatch_revive(void)
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
 {
+    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
+
     /* If NOPing.. */
     if ( !func->new_addr )
     {
+        struct x86_livepatch_meta *lp;
+
+        lp = (struct x86_livepatch_meta *)func->opaque;
         /* Only do up to maximum amount we can put in the ->opaque. */
-        if ( func->new_size > sizeof(func->opaque) )
+        if ( func->new_size > sizeof(lp->instruction) )
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
@@ -127,15 +163,21 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
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
@@ -143,14 +185,15 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
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
@@ -159,7 +202,11 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
  */
 void noinline arch_livepatch_revert(const struct livepatch_func *func)
 {
-    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
+    struct x86_livepatch_meta *lp;
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




