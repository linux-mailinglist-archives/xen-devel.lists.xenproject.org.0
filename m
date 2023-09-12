Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCFF79DC9D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600817.936610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChH-0008NX-8k; Tue, 12 Sep 2023 23:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600817.936610; Tue, 12 Sep 2023 23:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChH-0008LZ-68; Tue, 12 Sep 2023 23:21:31 +0000
Received: by outflank-mailman (input) for mailman id 600817;
 Tue, 12 Sep 2023 23:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLIb=E4=citrix.com=prvs=612d1dac3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgChG-0008LM-Jt
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:21:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1783b4b6-51c3-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 01:21:28 +0200 (CEST)
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
X-Inumbo-ID: 1783b4b6-51c3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694560887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=17zQ/LA3e8HCaF9E25s0sPXuwUparmz1rf9n5G2YsDI=;
  b=LpmLpRE+XhrXvj6S6m8yRSFolHHsrM5+Misf+55n3owHTrW6b2LIpl31
   J24sMVZTiq8NkcGJ9rxEvGvDdRXgRRwh/xlz8uUVXwMmDvykXMB4PPipd
   Vd5ofrxlF64mQkwzcxvsYtbzWfW2OAOPq3e6JAd4iZE2lFViWlF71uXlT
   U=;
X-CSE-ConnectionGUID: 77hly/MbRSyZrodrhAl29Q==
X-CSE-MsgGUID: BPWehqUeTh+3I1FvjXVUaQ==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122460587
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:kyXTiKAro9YIQBVW/wHjw5YqxClBgxIJ4kV8jS/XYbTApDor0TYFx
 2obXmzSPvuCZDCne9FwPYq+90gOv8DcxtRlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GJB5ARjDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpbl3BXAJ0
 PYiEyE/dBePneKfxOjqc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bQGZsNwxbHz
 o7A107BPRwaLeGS9TrGqVP1qPHNrR3GUbtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceRz0s0
 V/PnNrvCnpsqpWaTHuc8vGfqjbaBMQOBTZcP2leF1JDuoS95thp1XojU+qPDobq0d3xCHbVy
 QqxvRokgLkJjecPjfSCqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGr1lIV2/2xqS3NQwa3ZLFoJpyTmi8mXLkWt4sGAnfxcB3irplFbUj
 K7vVeF5vs870JiCN/Ufj2eN5yMClPKIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJj9UStGUvo6lWfrHo/xNIPHIQhkmQvuqW3TlUz7gdJymlbFIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHXooBQlSdxATXMmmw/G7g8bfemKK7kl9Ua6OqV7gEqQ595loehDgp
 yjjARcIkQSn1BUq62yiMxheVV8mZr4nxVpTAMDmFQ/AN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:26F2HK+t0klHWH/HF2puk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-Talos-CUID: 9a23:DJXptW1R2MGvkZp6rCGAHbxfRZ8ldmya6X3qGF6KE2FlUr28TQXBwfYx
X-Talos-MUID: =?us-ascii?q?9a23=3AfCGxTA0EzEGc6fC5ntCVSzmeXjUjyZyRBUAUrJg?=
 =?us-ascii?q?6u4rfFHVeJTWtsgm+e9py?=
X-IronPort-AV: E=Sophos;i="6.02,141,1688443200"; 
   d="scan'208";a="122460587"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 4/5] x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg instead
Date: Wed, 13 Sep 2023 00:21:12 +0100
Message-ID: <20230912232113.402347-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912232113.402347-1-andrew.cooper3@citrix.com>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With a full pending_dbg field in x86_emulate_ctxt, use it rather than using a
local bpmatch field.

This simplifies the OKAY/DONE path as singlestep is already accumulated by
x86_emulate() when appropriate.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 257891a2a2dd..6963db35c960 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -34,7 +34,6 @@ struct priv_op_ctxt {
         unsigned long base, limit;
     } cs;
     char *io_emul_stub;
-    unsigned int bpmatch;
 };
 
 /* I/O emulation helpers.  Use non-standard calling conventions. */
@@ -367,7 +366,8 @@ static int cf_check read_io(
     if ( !guest_io_okay(port, bytes, curr, ctxt->regs) )
         return X86EMUL_UNHANDLEABLE;
 
-    poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes);
+    poc->ctxt.retire.pending_dbg |=
+        check_guest_io_breakpoint(curr, port, bytes);
 
     if ( admin_io_okay(port, bytes, currd) )
     {
@@ -472,7 +472,8 @@ static int cf_check write_io(
     if ( !guest_io_okay(port, bytes, curr, ctxt->regs) )
         return X86EMUL_UNHANDLEABLE;
 
-    poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes);
+    poc->ctxt.retire.pending_dbg |=
+        check_guest_io_breakpoint(curr, port, bytes);
 
     if ( admin_io_okay(port, bytes, currd) )
     {
@@ -636,7 +637,8 @@ static int cf_check rep_ins(
         return X86EMUL_EXCEPTION;
     }
 
-    poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes_per_rep);
+    poc->ctxt.retire.pending_dbg |=
+        check_guest_io_breakpoint(curr, port, bytes_per_rep);
 
     while ( *reps < goal )
     {
@@ -658,7 +660,7 @@ static int cf_check rep_ins(
 
         ++*reps;
 
-        if ( poc->bpmatch || hypercall_preempt_check() )
+        if ( poc->ctxt.retire.pending_dbg || hypercall_preempt_check() )
             break;
 
         /* x86_emulate() clips the repetition count to ensure we don't wrap. */
@@ -703,7 +705,8 @@ static int cf_check rep_outs(
         return X86EMUL_EXCEPTION;
     }
 
-    poc->bpmatch = check_guest_io_breakpoint(curr, port, bytes_per_rep);
+    poc->ctxt.retire.pending_dbg |=
+        check_guest_io_breakpoint(curr, port, bytes_per_rep);
 
     while ( *reps < goal )
     {
@@ -726,7 +729,7 @@ static int cf_check rep_outs(
 
         ++*reps;
 
-        if ( poc->bpmatch || hypercall_preempt_check() )
+        if ( poc->ctxt.retire.pending_dbg || hypercall_preempt_check() )
             break;
 
         /* x86_emulate() clips the repetition count to ensure we don't wrap. */
@@ -1361,12 +1364,9 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     case X86EMUL_DONE:
         ASSERT(!curr->arch.pv.trap_bounce.flags);
 
-        if ( ctxt.ctxt.retire.singlestep )
-            ctxt.bpmatch |= DR_STEP;
-
-        if ( ctxt.bpmatch )
+        if ( ctxt.ctxt.retire.pending_dbg )
         {
-            curr->arch.dr6 |= ctxt.bpmatch | DR_STATUS_RESERVED_ONE;
+            curr->arch.dr6 |= ctxt.ctxt.retire.pending_dbg | DR_STATUS_RESERVED_ONE;
             pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
         }
 
-- 
2.30.2


