Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A352ACE9D39
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194217.1512677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBI-0007j0-6j; Tue, 30 Dec 2025 13:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194217.1512677; Tue, 30 Dec 2025 13:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBI-0007fX-1H; Tue, 30 Dec 2025 13:54:36 +0000
Received: by outflank-mailman (input) for mailman id 1194217;
 Tue, 30 Dec 2025 13:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaaBG-0007RX-SA
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:54:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 123aa444-e587-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 14:54:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so72873675e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:54:33 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm70198245f8f.13.2025.12.30.05.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:54:32 -0800 (PST)
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
X-Inumbo-ID: 123aa444-e587-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102873; x=1767707673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fj4LBIkgsuTZTvHR2D7plIKvcLJKz3RzRrwX7uG+/rA=;
        b=wdhpvJ74jYKhyfxlG6jFwM0AgE6PHC7C4rQqNvubFs6o7St/E2KKZirU1mw2wpas4g
         Z9SCeB5D8j7QXwDlFTfYLOCw9Z/eUR/AzTKhVk7vZTE83bkApTDY7BRPYOUlRubE6Mf7
         RPQCjW1cigOQYEz2PmWYYKvQmajOHdwjjRluc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102873; x=1767707673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fj4LBIkgsuTZTvHR2D7plIKvcLJKz3RzRrwX7uG+/rA=;
        b=P0iKm3JhSPVr2ceu5BoW79pI6TDLAAHbRL1aM0PNjj7Nd3eDCPfQOcQIRkKLXKV9Ry
         SVSP3dS75r7oyaWRJsmHvIQ4W0A5MDLdgKePAxod1+jNWiJEHRccu/tU7d/ip2uDdcqE
         Lm+LVtRm0LBK6WZTTSiUb0WYtuiY7fY4ZnQCcEU3NMfCch1Rff+lPlG9R6YPCbloBBLg
         syLdvQVY0eq+9hT+4UQnQzxEZxg7lsJF4VBZpfI0hoDlDnM2aOKu8lR2jiu+SAbX3Lx7
         +mbiXK/r3IcdlGq0Uslq23Tc5K9b6DyID3qOS5/BJ0YxObNu9eiC7EBecCJNaZCe1OAL
         gCsQ==
X-Gm-Message-State: AOJu0YwX8nPb44wKsApGr6mDj0sjmT4bNyij3bhiZ61YOsHgMhn0Mtzm
	troQ4eSujFVvR3d6XKfAfRKCfJcc8BpLBYHo7XLobr6t+5qvKLSTTw9m4dlQMKM3+KWQlFvnYOT
	DCK2b
X-Gm-Gg: AY/fxX43cvM7t2nXX1q224VSqIqtH66DdAPu9bLYpbnv4TS5RoQ80UhyfdKvAf/nE6V
	OTLONkcylzL1qjecPMKJmF5d453Fi5jIaNby45bx+YvzKCvbcJeUR9MJmz8cAio9pzvIrauPKfd
	UBk8CkT+RHd1kqIZxFiBPtjhGEquU7azPDdv9nXNiR2O053luaaROf/YBrPBEvHoyd5SUXFi2OM
	UAkQr3m+F+WNdK13GcLA3qvc924/qvMlzy3brZl4drtfGXTzy7iY5gZ9a3sbKlqRQgMT6lNd/ou
	hC4qPVFDjODoCIsaXxWPxq4KYetN3+h6jDTURDk5CCtKY12rIyV1TAcxewusJlqixvVqAnFOZwY
	uC9CscHshg7EKbxVwBP+InklRBz7XCADWg94PeSEL8pohpG2eoYFNmHTuiC5sm8n1EMB+vZolKb
	o2p6ezhYuSPPbfIpF5DWfvJlaN+RvBNnIVPDVMKVDbwHTtb3Dghd1rCET0hYekvw==
X-Google-Smtp-Source: AGHT+IEMX5GLBww93BLDQ//qBhV7DqxxfhjOyAzavyTo24n3r0wKnHq93KIb08ORzFBU2kARDwiTBw==
X-Received: by 2002:a05:600c:1988:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47d216f9b5cmr265963385e9.2.1767102873102;
        Tue, 30 Dec 2025 05:54:33 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/i387: Rework fpu_fxrstor() given a newer toolchain baseline
Date: Tue, 30 Dec 2025 13:54:26 +0000
Message-Id: <20251230135427.188440-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135427.188440-1-andrew.cooper3@citrix.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use asm goto rather than hiding a memset() in the fixup section.  With the
compiler now able to see the write into fpu_ctxt (as opposed to the asm
constraint erroneously stating it as input-only), it validly objects to the
pointer being const.

While FXRSTOR oughtn't to fault on an all-zeros input, avoid a risk of an
infinite loop entirely by using a fixup scheme similar to xrstor(), and
crashing the domain if we run out options.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/i387.c | 65 ++++++++++++++++++++-------------------------
 1 file changed, 29 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index b84cd6f7a9e1..e0714ab2267d 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -38,7 +38,8 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
 /* Restore x87 FPU, MMX, SSE and SSE2 state */
 static inline void fpu_fxrstor(struct vcpu *v)
 {
-    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
+    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
+    unsigned int faults = 0;
 
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
@@ -59,49 +60,41 @@ static inline void fpu_fxrstor(struct vcpu *v)
      * possibility, which may occur if the block was passed to us by control
      * tools or through VCPUOP_initialise, by silently clearing the block.
      */
+ retry:
     switch ( __builtin_expect(fpu_ctxt->x[FPU_WORD_SIZE_OFFSET], 8) )
     {
     default:
-        asm_inline volatile (
+        asm_inline volatile goto (
             "1: fxrstorq %0\n"
-            ".section .fixup,\"ax\"   \n"
-            "2: push %%"__OP"ax       \n"
-            "   push %%"__OP"cx       \n"
-            "   push %%"__OP"di       \n"
-            "   lea  %0,%%"__OP"di    \n"
-            "   mov  %1,%%ecx         \n"
-            "   xor  %%eax,%%eax      \n"
-            "   rep ; stosl           \n"
-            "   pop  %%"__OP"di       \n"
-            "   pop  %%"__OP"cx       \n"
-            "   pop  %%"__OP"ax       \n"
-            "   jmp  1b               \n"
-            ".previous                \n"
-            _ASM_EXTABLE(1b, 2b)
-            :
-            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
+            _ASM_EXTABLE(1b, %l[fault])
+            :: "m" (*fpu_ctxt)
+            :: fault );
         break;
+
     case 4: case 2:
-        asm_inline volatile (
-            "1: fxrstor %0         \n"
-            ".section .fixup,\"ax\"\n"
-            "2: push %%"__OP"ax    \n"
-            "   push %%"__OP"cx    \n"
-            "   push %%"__OP"di    \n"
-            "   lea  %0,%%"__OP"di \n"
-            "   mov  %1,%%ecx      \n"
-            "   xor  %%eax,%%eax   \n"
-            "   rep ; stosl        \n"
-            "   pop  %%"__OP"di    \n"
-            "   pop  %%"__OP"cx    \n"
-            "   pop  %%"__OP"ax    \n"
-            "   jmp  1b            \n"
-            ".previous             \n"
-            _ASM_EXTABLE(1b, 2b)
-            :
-            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
+        asm_inline volatile goto (
+            "1: fxrstor %0\n"
+            _ASM_EXTABLE(1b, %l[fault])
+            :: "m" (*fpu_ctxt)
+            :: fault );
         break;
     }
+
+    return;
+
+ fault:
+    faults++;
+
+    switch ( faults )
+    {
+    case 1: /* Stage 1: Reset all state. */
+        memset(fpu_ctxt, 0, sizeof(*fpu_ctxt));
+        goto retry;
+
+    default: /* Stage 2: Nothing else to do. */
+        domain_crash(v->domain, "Uncorrectable FXRSTOR fault\n");
+        return;
+    }
 }
 
 /*******************************/
-- 
2.39.5


