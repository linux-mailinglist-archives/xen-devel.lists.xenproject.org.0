Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F59A5F9F9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912508.1318766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskXy-0008Ro-Uk; Thu, 13 Mar 2025 15:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912508.1318766; Thu, 13 Mar 2025 15:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskXy-0008Oi-QE; Thu, 13 Mar 2025 15:32:34 +0000
Received: by outflank-mailman (input) for mailman id 912508;
 Thu, 13 Mar 2025 15:32:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskXx-0008Nv-Lc
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f82c228-0020-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:32:29 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso189733266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:31 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac31485bd4dsm92628466b.81.2025.03.13.08.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:28 -0700 (PDT)
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
X-Inumbo-ID: 5f82c228-0020-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879950; x=1742484750; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iluUGVwmybl1uvmaup9n3VtNZWTX7tEEI+m9+ONsj+U=;
        b=q8rEVf+Ob+WCttZ+Rh4BoF2bAr5195efd8VzeaNfEuNFMyjkDbdreVM6NWekeKA/Dg
         h3G9fFzFTLkg6XUDFkIquQI4ZCAdced5qoXvvNg538Ow94rz4JuDz4EdNiaSfMvuaCBb
         B0AKEZ233MnBwtyAPSGP8PKvgBp20IMdJ4YF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879950; x=1742484750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iluUGVwmybl1uvmaup9n3VtNZWTX7tEEI+m9+ONsj+U=;
        b=QDNwOsj03OggsgRjlQAQ/ndXde0GMNpYdASG66FTa41gWE/Czx9rpxlKZlUhIENvlW
         HpHqoDvQCfDByvZ3XJ9RgCODUaRNlr61/81MmV8fhvVd/xoBHjDJxkx6gB7JQkoH9UII
         m2M9OSD1QdzxWF5Pqevt3aD+mfgy0zO/LpFX5qH+0AAUSQoikt/pNA5zbt2aDaDdv2qe
         RzJ40xZKlYutpSZYQiOvmBm4G5bKeEvRIuuaZik5/hLF5u4mJI7CH6/L1H01kmxfIrOY
         YgBw2YpVumioFIdQn57dyEJqn8dYNZJar/4mGkoPkfc7ddc5+nxS4Ixdaz0bhCoeTvjj
         WOFw==
X-Gm-Message-State: AOJu0YxGJcsRPU050f3tAlbMqnBaNtmiGxJvXm/JCwJJyEX/m8VWDwN1
	e89NniEBEhy3pXt0dIasu0CiMY1OXj+q3Hn5CzQ8H4pwU22movvYzNw+HDUwy7cYV6IahN/K2+c
	i
X-Gm-Gg: ASbGncudjxu+ReLbX5KdEYk9ENGAf5LiBIxwsKsSxi12BSRSxc4nlVKyE7PPWnGCYsm
	GQjh6zl5EiCOTDIuVNTkRc/M1B2pHyzuo17WOpvO/zYB/0wWxD8U/pxEpxMfPd128PYC9FWjMdb
	oDKEEBHEta6q+bUBF2wyG77eEaIMGNZFRuQHvsf8kWDuv/X/ox4YLRIXZUT9vBKn8pwkDrZjJst
	6lgBZajXZJSBng/kydNePRyQC7zR4PMUXrk3LNutMIEYLAkDkMJJtROvhr35dipwCgZnUSGZons
	r2wGU0xRHM2gyoVSQWUb0y8OLUIXDhMcpcoD2+4Aqg7A3HqDbA==
X-Google-Smtp-Source: AGHT+IEWRdiX/lHxQJn1GQzKfoYttXRxTb0u6BxSs7Pj8QR/2O92Sn67rPf1DLNoFI7M6Xa7Y1ij5Q==
X-Received: by 2002:a17:907:9725:b0:ac2:d667:8d64 with SMTP id a640c23a62f3a-ac2d66790a7mr1057682366b.39.1741879949199;
        Thu, 13 Mar 2025 08:32:29 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/7] x86/wait: prevent duplicated assembly labels
Date: Thu, 13 Mar 2025 16:30:24 +0100
Message-ID: <20250313153029.93347-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When enabling UBSAN with clang, the following error is triggered during the
build:

common/wait.c:154:9: error: symbol '.L_wq_resume' is already defined
  154 |         "push %%rbx; push %%rbp; push %%r12;"
      |         ^
<inline asm>:1:121: note: instantiated into assembly here
    1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
      |                                                                                                                                ^
common/wait.c:154:9: error: symbol '.L_skip' is already defined
  154 |         "push %%rbx; push %%rbp; push %%r12;"
      |         ^
<inline asm>:1:159: note: instantiated into assembly here
    1 |         push %rbx; push %rbp; push %r12;push %r13; push %r14; push %r15;sub %esp,%ecx;cmp $4096, %ecx;ja .L_skip;mov %rsp,%rsi;.L_wq_resume: rep movsb;mov %rsp,%rsi;.L_skip:pop %r15; pop %r14; pop %r13;pop %r12; pop %rbp; pop %rbx
      |                                                                                                                                                                      ^
2 errors generated.

The inline assembly block in __prepare_to_wait() is duplicated, thus
leading to multiple definitions of the otherwise unique labels inside the
assembly block.  GCC extended-asm documentation notes the possibility of
duplicating asm blocks:

> Under certain circumstances, GCC may duplicate (or remove duplicates of)
> your assembly code when optimizing. This can lead to unexpected duplicate
> symbol errors during compilation if your asm code defines symbols or
> labels. Using ‘%=’ (see AssemblerTemplate) may help resolve this problem.

Move the assembly blocks that deal with saving and restoring the current
CPU context into it's own explicitly non-inline functions.  This prevents
clang from duplicating the assembly blocks.  Just using noinline attribute
seems to be enough to prevent assembly duplication, in the future noclone
might also be required if asm block duplication issues arise again.

Additionally, add a small self-test to ensure the consistency of the
context save and restore logic.

Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html
Link: https://github.com/llvm/llvm-project/issues/92161
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/wait.c | 111 +++++++++++++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 35 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index cb6f5ff3c20a..2fcbbe8d0c71 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -119,24 +119,16 @@ void wake_up_all(struct waitqueue_head *wq)
 
 #ifdef CONFIG_X86
 
-static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
+/*
+ * context_save() must strictly be noinline, as to avoid multiple callers from
+ * inlining the code, thus duplicating the label and triggering an assembler
+ * error about duplicated labels.
+ */
+static void noinline context_save(struct waitqueue_vcpu *wqv)
 {
     struct cpu_info *cpu_info = get_cpu_info();
-    struct vcpu *curr = current;
     unsigned long dummy;
 
-    ASSERT(wqv->esp == NULL);
-
-    /* Save current VCPU affinity; force wakeup on *this* CPU only. */
-    if ( vcpu_temporary_affinity(curr, smp_processor_id(), VCPU_AFFINITY_WAIT) )
-    {
-        gdprintk(XENLOG_ERR, "Unable to set vcpu affinity\n");
-        domain_crash(curr->domain);
-
-        for ( ; ; )
-            do_softirq();
-    }
-
     /*
      * Hand-rolled setjmp().
      *
@@ -170,6 +162,54 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
         : "0" (0), "1" (cpu_info), "2" (wqv->stack),
           [sz] "i" (PAGE_SIZE)
         : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
+}
+
+/*
+ * Since context_save() is noinline, context_restore() must also be noinline,
+ * to balance the RET vs CALL instructions.
+ */
+static void noinline noreturn context_restore(struct waitqueue_vcpu *wqv)
+{
+    /*
+     * Hand-rolled longjmp().
+     *
+     * check_wakeup_from_wait() is always called with a shallow stack,
+     * immediately after the vCPU has been rescheduled.
+     *
+     * Adjust %rsp to be the correct depth for the (deeper) stack we want to
+     * restore, then prepare %rsi, %rdi and %rcx such that when we rejoin the
+     * rep movs in __prepare_to_wait(), it copies from wqv->stack over the
+     * active stack.
+     *
+     * All other GPRs are available for use; They're restored from the stack,
+     * or explicitly clobbered.
+     */
+    asm volatile ( "mov %%rdi, %%rsp;"
+                   "jmp .L_wq_resume"
+                   :
+                   : "S" (wqv->stack), "D" (wqv->esp),
+                     "c" ((char *)get_cpu_info() - (char *)wqv->esp)
+                   : "memory" );
+    unreachable();
+}
+
+static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
+{
+    struct vcpu *curr = current;
+
+    ASSERT(wqv->esp == NULL);
+
+    /* Save current VCPU affinity; force wakeup on *this* CPU only. */
+    if ( vcpu_temporary_affinity(curr, smp_processor_id(), VCPU_AFFINITY_WAIT) )
+    {
+        gdprintk(XENLOG_ERR, "Unable to set vcpu affinity\n");
+        domain_crash(curr->domain);
+
+        for ( ; ; )
+            do_softirq();
+    }
+
+    context_save(wqv);
 
     if ( unlikely(wqv->esp == NULL) )
     {
@@ -229,30 +269,31 @@ void check_wakeup_from_wait(void)
      *
      * Therefore, no actions are necessary here to maintain RSB safety.
      */
-
-    /*
-     * Hand-rolled longjmp().
-     *
-     * check_wakeup_from_wait() is always called with a shallow stack,
-     * immediately after the vCPU has been rescheduled.
-     *
-     * Adjust %rsp to be the correct depth for the (deeper) stack we want to
-     * restore, then prepare %rsi, %rdi and %rcx such that when we rejoin the
-     * rep movs in __prepare_to_wait(), it copies from wqv->stack over the
-     * active stack.
-     *
-     * All other GPRs are available for use; They're restored from the stack,
-     * or explicitly clobbered.
-     */
-    asm volatile ( "mov %%rdi, %%rsp;"
-                   "jmp .L_wq_resume"
-                   :
-                   : "S" (wqv->stack), "D" (wqv->esp),
-                     "c" ((char *)get_cpu_info() - (char *)wqv->esp)
-                   : "memory" );
+    context_restore(wqv);
     unreachable();
 }
 
+#ifdef CONFIG_SELF_TESTS
+static void __init __constructor test_save_restore_ctx(void)
+{
+    static unsigned int __initdata count;
+    struct waitqueue_vcpu wqv = {};
+
+    wqv.stack = alloc_xenheap_page();
+    if ( !wqv.stack )
+        panic("unable to allocate memory for context selftest\n");
+
+    context_save(&wqv);
+    if ( !count++ )
+        context_restore(&wqv);
+
+    if ( count != 2 )
+        panic("context save and restore not working as expected\n");
+
+    free_xenheap_page(wqv.stack);
+}
+#endif
+
 #else /* !CONFIG_X86 */
 
 #define __prepare_to_wait(wqv) ((void)0)
-- 
2.48.1


