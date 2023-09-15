Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10687A2834
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603361.940344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYW-0001Xv-BX; Fri, 15 Sep 2023 20:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603361.940344; Fri, 15 Sep 2023 20:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYW-0001VH-7N; Fri, 15 Sep 2023 20:36:48 +0000
Received: by outflank-mailman (input) for mailman id 603361;
 Fri, 15 Sep 2023 20:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYU-0001T8-5e
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94e8f95e-5407-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 22:36:44 +0200 (CEST)
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
X-Inumbo-ID: 94e8f95e-5407-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ff/2EofbVuWE4xzAF9UfYfZVRYEZrCslF2ClKTfM04U=;
  b=RFSfLxzTJr4D0sPrH8BtnfT0VLMFyxgo6ItOgPgA5zFusk44NnCrW8Er
   jqjQZ2nl0v+jSznsG2fdnwQlt7FhNISk1GFMh5o/0doQvqxm/Je3S+4vv
   8tT3FyryjWA0eGRwM4/HISRnQe85gRjYsZNOX6ULB5TQGQ0kUl1or5I1S
   I=;
X-CSE-ConnectionGUID: yX2361nNQWCUBRY66Zgs3Q==
X-CSE-MsgGUID: gGehqQ37Tya7O0+Nb3lSjw==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121464505
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:xRZ9MaryxRbzLJ9BFoOKXBfp4xZeBmIuZRIvgKrLsJaIsI4StFCzt
 garIBnVOP/eZjHxKd5/YI7loU9Q75+Hy9dkTgto+yg1EHsUoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziRNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACE9NEvd3uSQ+Y2Qd8NWt5p9HsbwZ7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucpjinXkxCabRzzxKK3X+sn9aUwh/qUd01TP6e/KVuu1+Mkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBLT5utrqVD3GU8LjSrimaNi0cLGtEbigBJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6ivRhk3OtKi+gy6I6G12r23WyeqYOSd1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jhYyjJ5fK6fTgAahwzRoMUCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoFrtNieV0ln1umDq7qXXHI/KPi+L2iJm9E+xtDbdzRrphsPPsTPv9r
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5U/SwJ3GSI/QDtJI6aIkdscl3lNw/w9ehHgo
 ivsBSe1CTPX2RX6FOl9Qis6Mem3AMcu8SpT0O5FFQ/A5kXPqL2HtM83H6bbt5F9nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:NPWp3q1JvOk65HR1HvB/9gqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3AT2KxqWh2nv5e3hC51210I5aTfzJuY02HlymJJWm?=
 =?us-ascii?q?BNk1UYoekFwGi97g/qp87?=
X-Talos-MUID: 9a23:Br8lPAbkRHvgAOBTuBDhhChbb5hU8q3xLxhOt59dv/KGKnkl
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="121464505"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 4/7] x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg instead
Date: Fri, 15 Sep 2023 21:36:25 +0100
Message-ID: <20230915203628.837732-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With a full pending_dbg field in x86_emulate_ctxt, use it rather than using a
local bpmatch field.

This simplifies the X86EMUL_OKAY path as singlestep is already accumulated by
x86_emulate() when appropriate.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * Tweak commit message to avoid referencing X86EMUL_DONE.
---
 xen/arch/x86/pv/emul-priv-op.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 0d9f84f458ba..2f73ed0682e1 100644
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
@@ -1360,12 +1363,9 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     case X86EMUL_OKAY:
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


