Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FB441D4C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219239.379944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6m-0008Kl-6E; Mon, 01 Nov 2021 15:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219239.379944; Mon, 01 Nov 2021 15:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6m-0008Gk-2S; Mon, 01 Nov 2021 15:20:24 +0000
Received: by outflank-mailman (input) for mailman id 219239;
 Mon, 01 Nov 2021 15:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ6j-0008DA-RL
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:21 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13092484-eb58-4f28-b7ee-8f277d1aa63f;
 Mon, 01 Nov 2021 15:20:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6E2B61FD29;
 Mon,  1 Nov 2021 15:20:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38DB713A4A;
 Mon,  1 Nov 2021 15:20:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iD6WDLMFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:19 +0000
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
X-Inumbo-ID: 13092484-eb58-4f28-b7ee-8f277d1aa63f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEHpkmfZZt1as/ZYBqmT3ZnKiWxNryhzyhq2qPkcsrg=;
	b=VQOhdc8JMSXr770NdXGYoKbD68X0XCUrRBpwUYjT6YKvj3FRT2H63AIdrXGTVZ76HJaInT
	lk94ERWftow7eurqX5vS6a/kYSFR25rL8GnUcy0BXSlHLiLVmdtgGy9yED6ohmgSu6TQLh
	Tv2vGPYBi6mg0DyjUlHhxi2y2/gXpNw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v2 01/15] xen: limit number of hypercall parameters to 5
Date: Mon,  1 Nov 2021 16:20:01 +0100
Message-Id: <20211101152015.28488-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today there is no hypercall with more than 5 parameters, while the ABI
allows up to 6 parameters. Especially for the X86 32-bit case using
6 parameters would require to run without frame pointer, which isn't
very fortunate. Note that for Arm the limit is 5 parameters already.

So limit the maximum number of parameters to 5 for x86, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/hypercall.c    | 28 ++++++++++------------------
 xen/arch/x86/pv/hypercall.c     | 22 ++++++++--------------
 xen/common/trace.c              |  2 +-
 xen/include/asm-x86/hypercall.h |  2 +-
 4 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 122abf80de..f0321c6cb4 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -239,10 +239,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         unsigned long rdx = regs->rdx;
         unsigned long r10 = regs->r10;
         unsigned long r8 = regs->r8;
-        unsigned long r9 = regs->r9;
 
-        HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx, %lx)",
-                    eax, rdi, rsi, rdx, r10, r8, r9);
+        HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
+                    eax, rdi, rsi, rdx, r10, r8);
 
 #ifndef NDEBUG
         /* Deliberately corrupt parameter regs not used by this hypercall. */
@@ -252,13 +251,11 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
         case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
         case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 4: r8 = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 5: r9 = 0xdeadbeefdeadf00dUL;
+        case 4: r8 = 0xdeadbeefdeadf00dUL;
         }
 #endif
 
-        regs->rax = hvm_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8,
-                                                    r9);
+        regs->rax = hvm_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8);
 
 #ifndef NDEBUG
         if ( !curr->hcall_preempted )
@@ -266,7 +263,6 @@ int hvm_hypercall(struct cpu_user_regs *regs)
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].native )
             {
-            case 6: regs->r9  = 0xdeadbeefdeadf00dUL; fallthrough;
             case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
             case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
             case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
@@ -283,10 +279,9 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         unsigned int edx = regs->edx;
         unsigned int esi = regs->esi;
         unsigned int edi = regs->edi;
-        unsigned int ebp = regs->ebp;
 
-        HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x, %x)", eax,
-                    ebx, ecx, edx, esi, edi, ebp);
+        HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%x, %x, %x, %x, %x)", eax,
+                    ebx, ecx, edx, esi, edi);
 
 #ifndef NDEBUG
         /* Deliberately corrupt parameter regs not used by this hypercall. */
@@ -296,14 +291,12 @@ int hvm_hypercall(struct cpu_user_regs *regs)
         case 1: ecx = 0xdeadf00d; fallthrough;
         case 2: edx = 0xdeadf00d; fallthrough;
         case 3: esi = 0xdeadf00d; fallthrough;
-        case 4: edi = 0xdeadf00d; fallthrough;
-        case 5: ebp = 0xdeadf00d;
+        case 4: edi = 0xdeadf00d;
         }
 #endif
 
         curr->hcall_compat = true;
-        regs->rax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi,
-                                                    ebp);
+        regs->rax = hvm_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
         curr->hcall_compat = false;
 
 #ifndef NDEBUG
@@ -312,7 +305,6 @@ int hvm_hypercall(struct cpu_user_regs *regs)
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].compat )
             {
-            case 6: regs->rbp = 0xdeadf00d; fallthrough;
             case 5: regs->rdi = 0xdeadf00d; fallthrough;
             case 4: regs->rsi = 0xdeadf00d; fallthrough;
             case 3: regs->rdx = 0xdeadf00d; fallthrough;
@@ -349,7 +341,7 @@ enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
             func = array_access_nospec(hvm_hypercall_table, call->op).native;
         if ( func )
             call->result = func(call->args[0], call->args[1], call->args[2],
-                                call->args[3], call->args[4], call->args[5]);
+                                call->args[3], call->args[4]);
         else
             call->result = -ENOSYS;
     }
@@ -361,7 +353,7 @@ enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
             func = array_access_nospec(hvm_hypercall_table, call->op).compat;
         if ( func )
             call->result = func(call->args[0], call->args[1], call->args[2],
-                                call->args[3], call->args[4], call->args[5]);
+                                call->args[3], call->args[4]);
         else
             call->result = -ENOSYS;
     }
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 3579ba905c..16a77e3a35 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -145,7 +145,6 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         unsigned long rdx = regs->rdx;
         unsigned long r10 = regs->r10;
         unsigned long r8 = regs->r8;
-        unsigned long r9 = regs->r9;
 
 #ifndef NDEBUG
         /* Deliberately corrupt parameter regs not used by this hypercall. */
@@ -155,18 +154,17 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         case 1: rsi = 0xdeadbeefdeadf00dUL; fallthrough;
         case 2: rdx = 0xdeadbeefdeadf00dUL; fallthrough;
         case 3: r10 = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 4: r8 = 0xdeadbeefdeadf00dUL; fallthrough;
-        case 5: r9 = 0xdeadbeefdeadf00dUL;
+        case 4: r8 = 0xdeadbeefdeadf00dUL;
         }
 #endif
         if ( unlikely(tb_init_done) )
         {
-            unsigned long args[6] = { rdi, rsi, rdx, r10, r8, r9 };
+            unsigned long args[5] = { rdi, rsi, rdx, r10, r8 };
 
             __trace_hypercall(TRC_PV_HYPERCALL_V2, eax, args);
         }
 
-        regs->rax = pv_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8, r9);
+        regs->rax = pv_hypercall_table[eax].native(rdi, rsi, rdx, r10, r8);
 
 #ifndef NDEBUG
         if ( !curr->hcall_preempted )
@@ -174,7 +172,6 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].native )
             {
-            case 6: regs->r9  = 0xdeadbeefdeadf00dUL; fallthrough;
             case 5: regs->r8  = 0xdeadbeefdeadf00dUL; fallthrough;
             case 4: regs->r10 = 0xdeadbeefdeadf00dUL; fallthrough;
             case 3: regs->rdx = 0xdeadbeefdeadf00dUL; fallthrough;
@@ -192,7 +189,6 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         unsigned int edx = regs->edx;
         unsigned int esi = regs->esi;
         unsigned int edi = regs->edi;
-        unsigned int ebp = regs->ebp;
 
 #ifndef NDEBUG
         /* Deliberately corrupt parameter regs not used by this hypercall. */
@@ -202,20 +198,19 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
         case 1: ecx = 0xdeadf00d; fallthrough;
         case 2: edx = 0xdeadf00d; fallthrough;
         case 3: esi = 0xdeadf00d; fallthrough;
-        case 4: edi = 0xdeadf00d; fallthrough;
-        case 5: ebp = 0xdeadf00d;
+        case 4: edi = 0xdeadf00d;
         }
 #endif
 
         if ( unlikely(tb_init_done) )
         {
-            unsigned long args[6] = { ebx, ecx, edx, esi, edi, ebp };
+            unsigned long args[5] = { ebx, ecx, edx, esi, edi };
 
             __trace_hypercall(TRC_PV_HYPERCALL_V2, eax, args);
         }
 
         curr->hcall_compat = true;
-        regs->eax = pv_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi, ebp);
+        regs->eax = pv_hypercall_table[eax].compat(ebx, ecx, edx, esi, edi);
         curr->hcall_compat = false;
 
 #ifndef NDEBUG
@@ -224,7 +219,6 @@ _pv_hypercall(struct cpu_user_regs *regs, bool compat)
             /* Deliberately corrupt parameter regs used by this hypercall. */
             switch ( hypercall_args_table[eax].compat )
             {
-            case 6: regs->ebp = 0xdeadf00d; fallthrough;
             case 5: regs->edi = 0xdeadf00d; fallthrough;
             case 4: regs->esi = 0xdeadf00d; fallthrough;
             case 3: regs->edx = 0xdeadf00d; fallthrough;
@@ -262,7 +256,7 @@ enum mc_disposition pv_do_multicall_call(struct mc_state *state)
              pv_hypercall_table[op].compat )
             call->result = pv_hypercall_table[op].compat(
                 call->args[0], call->args[1], call->args[2],
-                call->args[3], call->args[4], call->args[5]);
+                call->args[3], call->args[4]);
         else
             call->result = -ENOSYS;
     }
@@ -276,7 +270,7 @@ enum mc_disposition pv_do_multicall_call(struct mc_state *state)
              pv_hypercall_table[op].native )
             call->result = pv_hypercall_table[op].native(
                 call->args[0], call->args[1], call->args[2],
-                call->args[3], call->args[4], call->args[5]);
+                call->args[3], call->args[4]);
         else
             call->result = -ENOSYS;
     }
diff --git a/xen/common/trace.c b/xen/common/trace.c
index a2a389a1c7..61fecc2b2b 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -822,7 +822,7 @@ void __trace_hypercall(uint32_t event, unsigned long op,
 {
     struct {
         uint32_t op;
-        uint32_t args[6];
+        uint32_t args[5];
     } d;
     uint32_t *a = d.args;
 
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index 0ae3b8b043..5d394d4923 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -13,7 +13,7 @@
 
 typedef unsigned long hypercall_fn_t(
     unsigned long, unsigned long, unsigned long,
-    unsigned long, unsigned long, unsigned long);
+    unsigned long, unsigned long);
 
 typedef struct {
     hypercall_fn_t *native;
-- 
2.26.2


