Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604844CF493
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 10:19:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285742.484992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR9VX-0005eY-Py; Mon, 07 Mar 2022 09:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285742.484992; Mon, 07 Mar 2022 09:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nR9VX-0005ci-MN; Mon, 07 Mar 2022 09:18:23 +0000
Received: by outflank-mailman (input) for mailman id 285742;
 Mon, 07 Mar 2022 09:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7T3K=TS=amazon.de=prvs=058ff0969=doebel@srs-se1.protection.inumbo.net>)
 id 1nR9VV-0005cc-RB
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 09:18:22 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86677351-9df7-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 10:18:19 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-51ba86d8.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 07 Mar 2022 09:18:05 +0000
Received: from EX13D44EUC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-51ba86d8.us-west-2.amazon.com (Postfix) with
 ESMTPS id 8F10B840B8; Mon,  7 Mar 2022 09:18:04 +0000 (UTC)
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D44EUC001.ant.amazon.com (10.43.164.236) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 7 Mar 2022 09:18:03 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1497.28 via Frontend Transport; Mon, 7 Mar 2022 09:18:01 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 3886C4E7F; Mon,  7 Mar 2022 09:18:00 +0000 (UTC)
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
X-Inumbo-ID: 86677351-9df7-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646644700; x=1678180700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ddX3RTclsMOPSNazwnK9SdFNGe3EdxDBGalO8CrgNm4=;
  b=uNY7wZ0WRnHmtW8JT4byPJIG+mlNQTR2LfFBCxk9+NPXhUWaMTUfJOrg
   BzRvkOrtDwkxQHGNev/AJtGHHQ8aAJnSQv6isxvE5UYp/Vq5Le840BgAG
   eKpcj9QjcsUj7SBXz4ypfd2Z378v7zTqxqNwXvipOgoKJnUWfiuBB71BN
   A=;
X-IronPort-AV: E=Sophos;i="5.90,161,1643673600"; 
   d="scan'208";a="178993956"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/x86: Livepatch: support patching CET-enhanced functions
Date: Mon, 7 Mar 2022 09:17:47 +0000
Message-ID: <fd56d3713b873bb00f7fca80e86ee7466057be3c.1646643967.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
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

Note that on top of livepatching functions, Xen supports an additional
mode where we can "remove" a function by overwriting it with NOPs. This
is only supported for functions up to 31 bytes in size and this patch
reduces this limit to 27 bytes.
---
 xen/arch/x86/livepatch.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 65530c1e57..bb7ecf36a6 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -14,11 +14,28 @@
 #include <xen/vm_event.h>
 #include <xen/virtual_region.h>
 
+#include <asm/endbr.h>
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
 #include <asm/livepatch.h>
 #include <asm/setup.h>
 
+/*
+ * CET hotpatching support: We may have functions starting with an ENDBR64 instruction
+ * that MUST remain the first instruction of the function, hence we need to move any
+ * hotpatch trampoline further into the function. For that we need to keep track of the
+ * patching offset used for any loaded hotpatch (to avoid racing against other fixups
+ * adding/removing ENDBR64 or similar instructions).
+ *
+ * We do so by making use of the existing opaque metadata area. We use its first 4 bytes
+ * to track the offset into the function used for patching and the remainder of the data
+ * to store overwritten code bytes.
+ */
+struct __packed x86_livepatch_meta {
+    int32_t patch_offset;
+    uint8_t instruction[LIVEPATCH_OPAQUE_SIZE - sizeof(int32_t)];
+};
+
 static bool has_active_waitqueue(const struct vm_event_domain *ved)
 {
     /* ved may be xzalloc()'d without INIT_LIST_HEAD() yet. */
@@ -104,11 +121,14 @@ void noinline arch_livepatch_revive(void)
 
 int arch_livepatch_verify_func(const struct livepatch_func *func)
 {
+    BUILD_BUG_ON(sizeof(struct x86_livepatch_meta) != LIVEPATCH_OPAQUE_SIZE);
+
     /* If NOPing.. */
     if ( !func->new_addr )
     {
+        struct x86_livepatch_meta *lp = (struct x86_livepatch_meta*)func->opaque;
         /* Only do up to maximum amount we can put in the ->opaque. */
-        if ( func->new_size > sizeof(func->opaque) )
+        if ( func->new_size > sizeof(lp->instruction) )
             return -EOPNOTSUPP;
 
         if ( func->old_size < func->new_size )
@@ -127,15 +147,20 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
 void noinline arch_livepatch_apply(struct livepatch_func *func)
 {
     uint8_t *old_ptr;
-    uint8_t insn[sizeof(func->opaque)];
+    struct x86_livepatch_meta *lp = (struct x86_livepatch_meta*)func->opaque;
+    uint8_t insn[sizeof(lp->instruction)];
     unsigned int len;
 
+    lp->patch_offset = 0;
     old_ptr = func->old_addr;
     len = livepatch_insn_len(func);
     if ( !len )
         return;
 
-    memcpy(func->opaque, old_ptr, len);
+    if ( is_endbr64( old_ptr ) )
+        lp->patch_offset += ENDBR64_LEN;
+
+    memcpy(lp->instruction, old_ptr + lp->patch_offset, len);
     if ( func->new_addr )
     {
         int32_t val;
@@ -143,14 +168,14 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
         BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != (1 + sizeof(val)));
 
         insn[0] = 0xe9; /* Relative jump. */
-        val = func->new_addr - func->old_addr - ARCH_PATCH_INSN_SIZE;
+        val = func->new_addr - (func->old_addr + lp->patch_offset + ARCH_PATCH_INSN_SIZE);
 
         memcpy(&insn[1], &val, sizeof(val));
     }
     else
         add_nops(insn, len);
 
-    memcpy(old_ptr, insn, len);
+    memcpy(old_ptr + lp->patch_offset, insn, len);
 }
 
 /*
@@ -159,7 +184,9 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
  */
 void noinline arch_livepatch_revert(const struct livepatch_func *func)
 {
-    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
+    struct x86_livepatch_meta *lp = (struct x86_livepatch_meta*)func->opaque;
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




