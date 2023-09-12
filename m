Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73879DC9B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600822.936654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChL-0000zU-R5; Tue, 12 Sep 2023 23:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600822.936654; Tue, 12 Sep 2023 23:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChL-0000r3-NB; Tue, 12 Sep 2023 23:21:35 +0000
Received: by outflank-mailman (input) for mailman id 600822;
 Tue, 12 Sep 2023 23:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLIb=E4=citrix.com=prvs=612d1dac3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgChK-0000Tq-OZ
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:21:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19dcf772-51c3-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 01:21:31 +0200 (CEST)
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
X-Inumbo-ID: 19dcf772-51c3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694560891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I+t08q4edjlX+Xq8TCZHZvBTk0F1uFlqxmMDbLaf4mY=;
  b=hqp3EJWCNXKrQZik1o0b5axZ2r91hzESwjcAsyKUMQxGGrEF1EcjW3j+
   KRNmdWBU1iUM0w4laBiPEAbbgukNd4oobFd8YlsD8lSqo4jPP/8NkV7h3
   ryd1gEyO2uHCpPLtjOChR9a+QG7AqFjexDP3JL8wqh7ut0ToOC73JWbjl
   4=;
X-CSE-ConnectionGUID: +h1fXvQHQkmwDB2eMJUqUg==
X-CSE-MsgGUID: FJMcmrPeQn6tryP3ZGVlgA==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121104892
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:3vWIxaxEq/v/DVkj61F6t+cfxirEfRIJ4+MujC+fZmUNrF6WrkUEy
 WRJWDyCa/uDZWGne4h2a43j8UkCsZWEn9dgTwc6/yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKoT4TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KSJOr
 PIoNgktVxOGmM6cmr+eaNR1u8t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPxx/A+
 jKXpQwVBDk0FvmUzCC9/0uq2PPVjBugaq0sELKRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC/
 l2ImdTpQz9mtrLTSmi1+bKdrDf0Mi8QRVLufgddE1FDuYO65thu0FSWFI0L/LOJYsPdWjGpz
 QCUlQgHhLAMoeRR2oCZwEn6jGf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCH6BUOUS9jrYyjP8UQHPY2/Ps04lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EWPg6kGHoGr5AjOZDKsUCKYT7H8yT8vha+eDGOC79pUktYDNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dd7ELz+FlBiXcqeg5UOJoa+zv9ORDlJ5wn5nelwJOSIXs19yo/1w
 51KchYBlgGn1SSZcVTih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:rI8Wo6qbu7TY2S9WSVKJK30aV5r9eYIsimQD101hICG9Ffbo9P
 xG/c5rtyMc7QxwZJhOo6H7BEC/ewK6yXcY2/hvAV7AZniBhILLFvAa0WKK+VSJcBEWkNQtqZ
 uIGJIOc+EYY2IK8PoTmGODYrIdKN7uys6VbbC39RtQpdoDUdAZ0+9qYjz7LqVkLDMoOXIofK
 D32iJczwDMRZxvBP7LY0U4Yw==
X-Talos-CUID: 9a23:AiiQX2y2KlyC2++E1hVkBgVXGpkrQmPk7E7TJlCUIzxkbZ+oUGKfrfY=
X-Talos-MUID: 9a23:39MKXAoItbwxmzAnilYezx9AEcxt+ZyjMUZTjY8Xg5K2GhJ0NB7I2Q==
X-IronPort-AV: E=Sophos;i="6.02,141,1688443200"; 
   d="scan'208";a="121104892"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 3/5] x86/emul: Add a pending_dbg field to x86_emulate_ctxt.retire
Date: Wed, 13 Sep 2023 00:21:11 +0100
Message-ID: <20230912232113.402347-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912232113.402347-1-andrew.cooper3@citrix.com>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Lots of this is very very broken, but we need to start somewhere.

PENDING_DBG, INTERRUPTIBILITY and ACTIVITY are internal pipeline registers
which Intel exposed to software in the VMCS, and AMD exposed a subset of in
the VMCB.  Importantly, bits set in PENDING_DBG can survive across multiple
instruction boundaries if e.g. delivery of #DB is delayed by a MovSS.

For now, introduce a full pending_dbg field into the retire union.  This keeps
the sh_page_fault() and init_context() paths working but in due course the
field will want to lose the "retire" infix.

In addition, set singlestep into pending_dbg as appropriate.  Leave the old
singlestep bitfield in place until we can adjust the callers to handle it
properly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c |  6 +++++-
 xen/arch/x86/x86_emulate/x86_emulate.h | 17 ++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e88245eae9fb..de707c8ec211 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8379,7 +8379,10 @@ x86_emulate(
     if ( !mode_64bit() )
         _regs.r(ip) = (uint32_t)_regs.r(ip);
 
-    /* Should a singlestep #DB be raised? */
+    if ( singlestep )
+        ctxt->retire.pending_dbg |= X86_DR6_BS;
+
+    /* Should a singlestep #DB be raised? (BROKEN - TODO, merge into pending_dbg) */
     if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
     {
         ctxt->retire.singlestep = true;
@@ -8659,6 +8662,7 @@ int x86_emulate_wrapper(
     {
         typeof(ctxt->retire) retire = ctxt->retire;
 
+        retire.pending_dbg = 0;
         retire.unblock_nmi = false;
         ASSERT(!retire.raw);
     }
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 698750267a90..f0e74d23c378 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -588,15 +588,26 @@ struct x86_emulate_ctxt
     /* Canonical opcode (see below) (valid only on X86EMUL_OKAY). */
     unsigned int opcode;
 
-    /* Retirement state, set by the emulator (valid only on X86EMUL_OKAY). */
+    /*
+     * Retirement state, set by the emulator (valid only on X86EMUL_OKAY/DONE).
+     *
+     * TODO: all this state should be input/output from the VMCS PENDING_DBG,
+     * INTERRUPTIBILITY and ACTIVITIY fields.
+     */
     union {
-        uint8_t raw;
+        unsigned long raw;
         struct {
+            /*
+             * Accumulated %dr6 trap bits, positive polarity.  Should only be
+             * interpreted in the case of X86EMUL_OKAY/DONE.
+             */
+            unsigned int pending_dbg;
+
             bool hlt:1;          /* Instruction HLTed. */
             bool mov_ss:1;       /* Instruction sets MOV-SS irq shadow. */
             bool sti:1;          /* Instruction sets STI irq shadow. */
             bool unblock_nmi:1;  /* Instruction clears NMI blocking. */
-            bool singlestep:1;   /* Singlestepping was active. */
+            bool singlestep:1;   /* Singlestepping was active. (TODO, merge into pending_dbg) */
         };
     } retire;
 
-- 
2.30.2


