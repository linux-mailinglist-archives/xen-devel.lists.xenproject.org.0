Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61547A2835
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603365.940374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYe-0002Rn-9C; Fri, 15 Sep 2023 20:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603365.940374; Fri, 15 Sep 2023 20:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYe-0002Pj-4O; Fri, 15 Sep 2023 20:36:56 +0000
Received: by outflank-mailman (input) for mailman id 603365;
 Fri, 15 Sep 2023 20:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYc-0001T8-Dn
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9abc83a9-5407-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 22:36:53 +0200 (CEST)
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
X-Inumbo-ID: 9abc83a9-5407-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e8vuaKEQBPD5qLqcwW195bMIeNLY5T3jMc0PDLaok4g=;
  b=IjrFoasuRDanrgL5Oph2CyRAC+dlNVERQgS57PDaLCdyCskKsBzkciii
   bZjZC0YmM4zwN7FHEK7/ad4sieLgKeMiKX3Nd2CD6ly9wyL/QxS8tgrr7
   +Dx0cE44yrSLFJ9XysDL4Yemx8fZ6cYQiiwKM+w58l2a5eCw++T5nvEwl
   U=;
X-CSE-ConnectionGUID: kAevLBhUSueOHby+POGfdA==
X-CSE-MsgGUID: f8gy8O7DSnychYXMSVaPnw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125538999
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:wnwOZ6scWuH8o0LQ9AbWkFk3WufnVGBeMUV32f8akzHdYApBsoF/q
 tZmKT3UO/iNZDChfYt0YIuxpBwPu5bXzNU1SQJv+C41EXtD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HyiFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwKxkAcDSph9+N3b+cauN9xfwEA8fnFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziboj+pU0BLXDCZ4TTV/WP8obDjpiXqU4IjJJiDyPdShkLGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBBz1pt73TSnub+fGXtxu9PCEUKSkJYipscOcey4C9+sdp1EuJF4s9Vvfv1bUZBA0c3
 RiJhSUgo58TsPUW2oKb90GEuxWDqJTgG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fOdLZ5ycCl/KI+THZuhf8N4AmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTnG7dFi+B7m3BjnAs/oKwXKTz9idJyg1bPEt843KamNLhlvMtoXi2Km
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8qRqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMSk6MuuyDMcj9RrW/0UEZD6V5pTqWq73hI93Snf9VelPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:Gd4WY6o8dI3E2fkAnkkIcCMaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-Talos-CUID: 9a23:pgvw72/1Sfm/CJ1SFzGVv009F94BWH3g92rdBG+yGCVRb5KbRXbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AZg/MLQzd50ihGUtVDSd1Bh2FlYqaqKr+B1Fdtso?=
 =?us-ascii?q?qgM+VPixBCxKmsj2PRJByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="125538999"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 2/7] x86/emul: Fix and extend #DB trap handling
Date: Fri, 15 Sep 2023 21:36:23 +0100
Message-ID: <20230915203628.837732-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Lots of this is very very broken, but we need to start somewhere.

First, the bugfix.  Hooks which use X86EMUL_DONE to skip the general emulation
still need to evaluate singlestep as part of completing the instruction.
Defer the logic until X86EMUL_DONE has been converted to X86EMUL_OKAY.

Second, the improvement.  PENDING_DBG, INTERRUPTIBILITY and ACTIVITY are
internal pipeline state which Intel exposed to software in the VMCS, and AMD
exposed a subset of in the VMCB.  Importantly, bits set in PENDING_DBG can
survive across multiple instruction boundaries if e.g. delivery of #DB is
delayed by a MovSS.

For now, introduce a full pending_dbg field into the retire union.  This keeps
the sh_page_fault() and init_context() paths working but in due course the
field will want to lose the "retire" infix.

In addition, set singlestep into pending_dbg as appropriate.  Leave the old
singlestep bitfield in place until we can adjust the callers to the new
scheme.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * Only evaluate singlestep on X86EMUL_OKAY, but do so after X86EMUL_DONE has
   been adjusted to X86EMUL_OKAY.
 * Adjust comments in light of X86EMUL_DONE not getting back to callers.
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 20 +++++++++++++-------
 xen/arch/x86/x86_emulate/x86_emulate.h | 14 +++++++++++---
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 94caec1d142c..de7f99500e3f 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8379,13 +8379,6 @@ x86_emulate(
     if ( !mode_64bit() )
         _regs.r(ip) = (uint32_t)_regs.r(ip);
 
-    /* Should a singlestep #DB be raised? */
-    if ( rc == X86EMUL_OKAY && singlestep && !ctxt->retire.mov_ss )
-    {
-        ctxt->retire.singlestep = true;
-        ctxt->retire.sti = false;
-    }
-
     if ( rc != X86EMUL_DONE )
         *ctxt->regs = _regs;
     else
@@ -8394,6 +8387,19 @@ x86_emulate(
         rc = X86EMUL_OKAY;
     }
 
+    /* Should a singlestep #DB be raised? */
+    if ( rc == X86EMUL_OKAY && singlestep )
+    {
+        ctxt->retire.pending_dbg |= X86_DR6_BS;
+
+        /* BROKEN - TODO, merge into pending_dbg. */
+        if ( !ctxt->retire.mov_ss )
+        {
+            ctxt->retire.singlestep = true;
+            ctxt->retire.sti = false;
+        }
+    }
+
     ctxt->regs->eflags &= ~X86_EFLAGS_RF;
 
  done:
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 698750267a90..fbc023c37e34 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -588,15 +588,23 @@ struct x86_emulate_ctxt
     /* Canonical opcode (see below) (valid only on X86EMUL_OKAY). */
     unsigned int opcode;
 
-    /* Retirement state, set by the emulator (valid only on X86EMUL_OKAY). */
+    /*
+     * Retirement state, set by the emulator (valid only on X86EMUL_OKAY).
+     *
+     * TODO: all this state should be input/output from the VMCS PENDING_DBG,
+     * INTERRUPTIBILITY and ACTIVITIY fields.
+     */
     union {
-        uint8_t raw;
+        unsigned long raw;
         struct {
+            /* Accumulated %dr6 trap bits, positive polarity. */
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


