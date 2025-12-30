Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155ACE9D45
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194219.1512691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBJ-00080m-ST; Tue, 30 Dec 2025 13:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194219.1512691; Tue, 30 Dec 2025 13:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaaBJ-0007wm-Ka; Tue, 30 Dec 2025 13:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1194219;
 Tue, 30 Dec 2025 13:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaaBI-0007fS-1J
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:54:36 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 120b39ed-e587-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 14:54:33 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so4688213f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:54:33 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm70198245f8f.13.2025.12.30.05.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:54:31 -0800 (PST)
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
X-Inumbo-ID: 120b39ed-e587-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102873; x=1767707673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dfg9SOntw48QjjQPH4731TXdZMbOgAkel6auQMh8/BY=;
        b=VpiiVmCt1R6YGCSlUWQepLY5D+/PqyxfrUaEbRY8dL3Sz5jxTQzrE951o/7ZnIjuIt
         lhLq6yIHjAQS9SW6nsh6By6mZ0OGvjFrRoLn3RdqCmb2ev0wcJR20MeTCWc5XNpgy/TT
         8zFo/luVJOY7TtUCs8z5/0CtktDvYNGU0JhDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102873; x=1767707673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dfg9SOntw48QjjQPH4731TXdZMbOgAkel6auQMh8/BY=;
        b=jP6XoInLSgKAc4PQ/zEt3NL8rfcz+yyOG+jf7HGhiIredBHfpPMIDkA4fEYINss/Aa
         VsAU1eJX+ooRmv/GElFgdD3JQIHD42KAtdbE50ZKl+onmHZJaLa6Egux4WoTlyWAdtzF
         Lzg2sRLWM/bjlyDAc6XPBShL/KVn72pa58QeZioaziDUWd/bW6MdrQw+ZJsSXLCOTtBK
         UFAOiYMTKztBIpFKoP9G4xbcqU+uddmgfnT1UaHJoAx2F/iw25mKMt6q/9JnjDq/uVOR
         yvJXJPR4mwtk7MQiHEvgFU75IFZ1gQAli6w2/QXI0niqyCVPu8lR99aGgMzjc033XdYm
         AS6A==
X-Gm-Message-State: AOJu0YxW8XjMagdHAYxSlx9A4sqFsLjG32vuOBgwHe2wDuLTT85JTj2q
	8O4ePUhmTPV69tCLySQudT8VcTA8MbXRIKRDwd1PQazsuGpl0PbcWtX0SxQgjYDrQdDTQ4adTF9
	JoBqX
X-Gm-Gg: AY/fxX6PS1tOYLE7VrmRM9mPK6owmfzZUC9ixUmqVq/VwMrfbizISm3oauX0s74gYNV
	FTwYPg5M0FhfUFt0er98Ruer7HCc8fAbU0Jho8ejyz4azqU/p3+mkITi5k9GZmc2S47LSjC2Xom
	4zy/1nV0K9d5Ylkn0mm1h0Iv5DXYnHLIA+YPzjQ1nNR8j8ulO1HBxB+wKx73mBBY33ihbniN+x0
	KYRFgPMDoKJ7zrRxq4Cacyq9VCMw2k0MWgHtjHQWPmH/fP2GQdFORuNbm+Sytb4/btQDMQ5ZVly
	69+GaDQJgmbq0ajMgE4bsWlCDAMJq9mAQnCAB0sJVDUX/4TqntaWwEXBt4RPrNPBwi/W99EdgGW
	+gg8PERqpeIGsDCqJAc0KFfGk4NUYvBB2X/9E8NSbG/52U7X71OLNvaG78XXdFvN1l3xztoXKCt
	XOaMyJTDamOi2yLU/1Z6YVW1OjfjgQWu/Mct7PXcfLr6edGsMIK7+LXoY7AsdJXw==
X-Google-Smtp-Source: AGHT+IHx15LPlEcPx2ILuydl9rgMLwSDyB0zTQBjhnlj0f6IMxG0RthWvbrpoDSFJWWj/AEtUBimvQ==
X-Received: by 2002:a05:6000:310f:b0:431:4b7:a309 with SMTP id ffacd0b85a97d-4324e4cc2d7mr42430294f8f.20.1767102872062;
        Tue, 30 Dec 2025 05:54:32 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/4] x86/xstate: Deindent the logic in xrstor()
Date: Tue, 30 Dec 2025 13:54:24 +0000
Message-Id: <20251230135427.188440-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135427.188440-1-andrew.cooper3@citrix.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to improve the legibility of the following fix.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Best reviewed with `git show --ignore-all-space`
---
 xen/arch/x86/xstate.c | 131 ++++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 63 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e990abc9d18c..384f78bd5281 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -407,19 +407,19 @@ void xrstor(struct vcpu *v, uint64_t mask)
      */
     for ( prev_faults = faults = 0; ; prev_faults = faults )
     {
-        switch ( __builtin_expect(ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET], 8) )
-        {
-            BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
-#define _xrstor(insn) \
-        asm volatile ( "1: .byte " insn "\n" \
-                       "3:\n" \
-                       "   .section .fixup,\"ax\"\n" \
-                       "2: incl %[faults]\n" \
-                       "   jmp 3b\n" \
-                       "   .previous\n" \
-                       _ASM_EXTABLE(1b, 2b) \
-                       : [mem] "+m" (*ptr), [faults] "+g" (faults) \
-                       : [lmask] "a" (lmask), [hmask] "d" (hmask), \
+    switch ( __builtin_expect(ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET], 8) )
+    {
+        BUILD_BUG_ON(sizeof(faults) != 4); /* Clang doesn't support %z in asm. */
+#define _xrstor(insn)                                               \
+        asm volatile ( "1: .byte " insn "\n"                        \
+                       "3:\n"                                       \
+                       "   .section .fixup,\"ax\"\n"                \
+                       "2: incl %[faults]\n"                        \
+                       "   jmp 3b\n"                                \
+                       "   .previous\n"                             \
+                       _ASM_EXTABLE(1b, 2b)                         \
+                       : [mem] "+m" (*ptr), [faults] "+g" (faults)  \
+                       : [lmask] "a" (lmask), [hmask] "d" (hmask),  \
                          [ptr] "D" (ptr) )
 
 #define XRSTOR(pfx) \
@@ -437,62 +437,67 @@ void xrstor(struct vcpu *v, uint64_t mask)
         else \
             _xrstor(pfx "0x0f,0xae,0x2f") /* xrstor */
 
-        default:
-            XRSTOR("0x48,");
-            break;
-        case 4: case 2:
-            XRSTOR("");
-            break;
+    default:
+        XRSTOR("0x48,");
+        break;
+
+    case 4: case 2:
+        XRSTOR("");
+        break;
+
 #undef XRSTOR
 #undef _xrstor
-        }
-        if ( likely(faults == prev_faults) )
-            break;
+    }
+
+    if ( likely(faults == prev_faults) )
+        break;
+
 #ifndef NDEBUG
-        gprintk(XENLOG_WARNING, "fault#%u: mxcsr=%08x\n",
-                faults, ptr->fpu_sse.mxcsr);
-        gprintk(XENLOG_WARNING, "xs=%016lx xc=%016lx\n",
-                ptr->xsave_hdr.xstate_bv, ptr->xsave_hdr.xcomp_bv);
-        gprintk(XENLOG_WARNING, "r0=%016lx r1=%016lx\n",
-                ptr->xsave_hdr.reserved[0], ptr->xsave_hdr.reserved[1]);
-        gprintk(XENLOG_WARNING, "r2=%016lx r3=%016lx\n",
-                ptr->xsave_hdr.reserved[2], ptr->xsave_hdr.reserved[3]);
-        gprintk(XENLOG_WARNING, "r4=%016lx r5=%016lx\n",
-                ptr->xsave_hdr.reserved[4], ptr->xsave_hdr.reserved[5]);
+    gprintk(XENLOG_WARNING, "fault#%u: mxcsr=%08x\n",
+            faults, ptr->fpu_sse.mxcsr);
+    gprintk(XENLOG_WARNING, "xs=%016lx xc=%016lx\n",
+            ptr->xsave_hdr.xstate_bv, ptr->xsave_hdr.xcomp_bv);
+    gprintk(XENLOG_WARNING, "r0=%016lx r1=%016lx\n",
+            ptr->xsave_hdr.reserved[0], ptr->xsave_hdr.reserved[1]);
+    gprintk(XENLOG_WARNING, "r2=%016lx r3=%016lx\n",
+            ptr->xsave_hdr.reserved[2], ptr->xsave_hdr.reserved[3]);
+    gprintk(XENLOG_WARNING, "r4=%016lx r5=%016lx\n",
+            ptr->xsave_hdr.reserved[4], ptr->xsave_hdr.reserved[5]);
 #endif
-        switch ( faults )
+
+    switch ( faults )
+    {
+    case 1: /* Stage 1: Reset state to be loaded. */
+        ptr->xsave_hdr.xstate_bv &= ~mask;
+        /*
+         * Also try to eliminate fault reasons, even if this shouldn't be
+         * needed here (other code should ensure the sanity of the data).
+         */
+        if ( ((mask & X86_XCR0_SSE) ||
+              ((mask & X86_XCR0_YMM) &&
+               !(ptr->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED))) )
+            ptr->fpu_sse.mxcsr &= mxcsr_mask;
+        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )
         {
-        case 1: /* Stage 1: Reset state to be loaded. */
-            ptr->xsave_hdr.xstate_bv &= ~mask;
-            /*
-             * Also try to eliminate fault reasons, even if this shouldn't be
-             * needed here (other code should ensure the sanity of the data).
-             */
-            if ( ((mask & X86_XCR0_SSE) ||
-                  ((mask & X86_XCR0_YMM) &&
-                   !(ptr->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED))) )
-                ptr->fpu_sse.mxcsr &= mxcsr_mask;
-            if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )
-            {
-                ptr->xsave_hdr.xcomp_bv &= this_cpu(xcr0) | this_cpu(xss);
-                ptr->xsave_hdr.xstate_bv &= ptr->xsave_hdr.xcomp_bv;
-                ptr->xsave_hdr.xcomp_bv |= XSTATE_COMPACTION_ENABLED;
-            }
-            else
-            {
-                ptr->xsave_hdr.xstate_bv &= this_cpu(xcr0);
-                ptr->xsave_hdr.xcomp_bv = 0;
-            }
-            memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
-            continue;
-
-        case 2: /* Stage 2: Reset all state. */
-            ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
-            ptr->xsave_hdr.xstate_bv = 0;
-            ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
-                                      ? XSTATE_COMPACTION_ENABLED : 0;
-            continue;
+            ptr->xsave_hdr.xcomp_bv &= this_cpu(xcr0) | this_cpu(xss);
+            ptr->xsave_hdr.xstate_bv &= ptr->xsave_hdr.xcomp_bv;
+            ptr->xsave_hdr.xcomp_bv |= XSTATE_COMPACTION_ENABLED;
         }
+        else
+        {
+            ptr->xsave_hdr.xstate_bv &= this_cpu(xcr0);
+            ptr->xsave_hdr.xcomp_bv = 0;
+        }
+        memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
+        continue;
+
+    case 2: /* Stage 2: Reset all state. */
+        ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
+        ptr->xsave_hdr.xstate_bv = 0;
+        ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
+            ? XSTATE_COMPACTION_ENABLED : 0;
+        continue;
+    }
 
         domain_crash(current->domain);
         return;
-- 
2.39.5


