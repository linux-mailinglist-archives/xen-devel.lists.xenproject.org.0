Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5006E4D41F2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 08:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288180.488743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDKw-0007gH-IZ; Thu, 10 Mar 2022 07:35:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288180.488743; Thu, 10 Mar 2022 07:35:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSDKw-0007eG-EC; Thu, 10 Mar 2022 07:35:50 +0000
Received: by outflank-mailman (input) for mailman id 288180;
 Thu, 10 Mar 2022 07:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgV8=TV=amazon.de=prvs=06149a43a=doebel@srs-se1.protection.inumbo.net>)
 id 1nSDKv-0007dt-4k
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 07:35:49 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0d5ee16-a044-11ec-8539-5f4723681683;
 Thu, 10 Mar 2022 08:35:44 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 10 Mar 2022 07:35:47 +0000
Received: from EX13D44EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-e6c05252.us-west-2.amazon.com (Postfix) with
 ESMTPS id 5260F41D35; Thu, 10 Mar 2022 07:35:40 +0000 (UTC)
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D44EUC002.ant.amazon.com (10.43.164.19) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Thu, 10 Mar 2022 07:35:39 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1497.28 via Frontend Transport; Thu, 10 Mar 2022 07:35:38 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 2055B4EE8; Thu, 10 Mar 2022 07:35:38 +0000 (UTC)
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
X-Inumbo-ID: b0d5ee16-a044-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646897749; x=1678433749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F1i6mc4JNRjStuuHfMes5a9tep6OAGZG0c5Z/wtG6zE=;
  b=I3SYpF7RHUlGjXukwcB7rBm9iyjJ+AzsVL60uE7gS7AMbDfLvsaH3r53
   PBF4F4bg4SjVJK4DQyYJAbX8uSdsIeOW2dHssXrd9eXHsZmPI9OGUTaaN
   x5deNhnmEv7FysDoSLa9H3uFzRjq0XzcNRjjKGWC0kBWPAUQBQHE8M2U6
   c=;
X-IronPort-AV: E=Sophos;i="5.90,169,1643673600"; 
   d="scan'208";a="69574185"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v6 2/2] xen/x86: Livepatch: support patching CET-enhanced functions
Date: Thu, 10 Mar 2022 07:35:36 +0000
Message-ID: <81b800e254019ac3031e57307eea0ec422dc792f.1646897292.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <03798b67ec3a892a302e6be5d87ea676e6376036.1646897292.git.doebel@amazon.de>
References: <03798b67ec3a892a302e6be5d87ea676e6376036.1646897292.git.doebel@amazon.de>
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
Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
----
Changes since r1:
* (v2) use sizeof_field() to avoid unused variable warning
* (v3) make metadata variable const in arch_livepatch_revert
* (v4) rebase on top and make use of Andrew Cooper's was_endbr64() patch
* (v5) use padding byte to store offset rather than reducing opaque area
* (v6) style fixes
---
 xen/arch/x86/livepatch.c    | 39 +++++++++++++++++++++++++++++++------
 xen/include/public/sysctl.h |  3 ++-
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 37c9b8435e..81c48fda7f 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -14,6 +14,7 @@
 #include <xen/vm_event.h>
 #include <xen/virtual_region.h>
 
+#include <asm/endbr.h>
 #include <asm/fixmap.h>
 #include <asm/nmi.h>
 #include <asm/livepatch.h>
@@ -114,8 +115,20 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
         if ( func->old_size < func->new_size )
             return -EINVAL;
     }
-    else if ( func->old_size < ARCH_PATCH_INSN_SIZE )
-        return -EINVAL;
+    else
+    {
+        /*
+         * Space needed now depends on whether the target function
+         * start{s,ed} with an ENDBR64 instruction.
+         */
+        uint8_t needed = ARCH_PATCH_INSN_SIZE;
+
+        if ( is_endbr64(func->old_addr) || was_endbr64(func->old_addr) )
+            needed += ENDBR64_LEN;
+
+        if ( func->old_size < needed )
+            return -EINVAL;
+    }
 
     return 0;
 }
@@ -130,12 +143,24 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
     uint8_t insn[sizeof(func->opaque)];
     unsigned int len;
 
+    func->patch_offset = 0;
     old_ptr = func->old_addr;
     len = livepatch_insn_len(func);
     if ( !len )
         return;
 
-    memcpy(func->opaque, old_ptr, len);
+    /*
+     * CET hotpatching support: We may have functions starting with an ENDBR64
+     * instruction that MUST remain the first instruction of the function,
+     * hence we need to move any hotpatch trampoline further into the function.
+     * For that we need to keep track of the patching offset used for any
+     * loaded hotpatch (to avoid racing against other fixups adding/removing
+     * ENDBR64 or similar instructions).
+     */
+    if ( is_endbr64(old_ptr) || was_endbr64(func->old_addr) )
+        func->patch_offset += ENDBR64_LEN;
+
+    memcpy(func->opaque, old_ptr + func->patch_offset, len);
     if ( func->new_addr )
     {
         int32_t val;
@@ -143,14 +168,15 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
         BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != (1 + sizeof(val)));
 
         insn[0] = 0xe9; /* Relative jump. */
-        val = func->new_addr - func->old_addr - ARCH_PATCH_INSN_SIZE;
+        val = func->new_addr - (func->old_addr + func->patch_offset +
+                                ARCH_PATCH_INSN_SIZE);
 
         memcpy(&insn[1], &val, sizeof(val));
     }
     else
         add_nops(insn, len);
 
-    memcpy(old_ptr, insn, len);
+    memcpy(old_ptr + func->patch_offset, insn, len);
 }
 
 /*
@@ -159,7 +185,8 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
  */
 void noinline arch_livepatch_revert(const struct livepatch_func *func)
 {
-    memcpy(func->old_addr, func->opaque, livepatch_insn_len(func));
+    memcpy(func->old_addr + func->patch_offset, func->opaque,
+           livepatch_insn_len(func));
 }
 
 /*
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 55252e97f2..b0a4af8789 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -876,7 +876,8 @@ struct livepatch_func {
     uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
     uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
     uint8_t applied;
-    uint8_t _pad[7];
+    uint8_t patch_offset;
+    uint8_t _pad[6];
     livepatch_expectation_t expect;
 };
 typedef struct livepatch_func livepatch_func_t;
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




