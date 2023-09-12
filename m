Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458679DC9F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:22:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600820.936641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChL-0000gm-0f; Tue, 12 Sep 2023 23:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600820.936641; Tue, 12 Sep 2023 23:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChK-0000eh-S1; Tue, 12 Sep 2023 23:21:34 +0000
Received: by outflank-mailman (input) for mailman id 600820;
 Tue, 12 Sep 2023 23:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLIb=E4=citrix.com=prvs=612d1dac3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgChI-0008LM-P9
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:21:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ab09b80-51c3-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 01:21:30 +0200 (CEST)
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
X-Inumbo-ID: 1ab09b80-51c3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694560890;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=auuaGN9D4TVXp5GeCAINQDXwp5U7lbZ3pClmTMDFPMs=;
  b=VQxGTcRBea7NiSWMp1dwFZZCmOb3fKLi3TZbIFZOk23mHSdMEpJLzu39
   HSU4IqEHz1kwnFFEIAL+pHdVch6rSt5ncRyjvDSpYE3Xfs0eQA7DtiWUk
   5XoIshtL+DLO36CwLAkJME/a2HwKD944tBfpbVsj/eJ/Lllh0rjFh6gV3
   Q=;
X-CSE-ConnectionGUID: nO66D9+OQ+yXSxiZ0nj3dw==
X-CSE-MsgGUID: b5lsfuY1SGmYOEAYxHGXvA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125168441
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:3t7r/65G8mg84RJrkWikRQxRtBDHchMFZxGqfqrLsTDasY5as4F+v
 jEXDzyOOPeOMDH0Lt9wYY3g9EJTvsPVz9JgT1M4/CxhHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaES5geD/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 9tGdhxcLTe6xPOG+6K6eLFqhJ8vM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzF/
 zyWozigav0cHNbCzSGL70P1vcDKrATWcbMCNJKI6Nc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 TehndLvAjwps7STRjSe7J+bqDqzPW4eKmpqWMMfZVJbuZ+5+th110+RCI85S8ZZk+EZBxn25
 G7UgHl9oIxQnP4wx6SJpVbF2D6z882hohEO2i3bWWes7wVcbYGjZpC15VWz0cusPLp1XXHa4
 iFaxpH2APQmSMjUyXfTGLll8KSBva7tDdHKvbJ483DNHRyJ8mXrQ41f6SoWyKxBYpddIm+Bj
 KM+VGpsCH5v0JmCN/8fj2GZUZ5CIU3c+TPND6q8Uza2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo2kGfqHLlAiOJ2n0jSIF8/orihk3yaPUe2PibJGd/pznPeBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07dDg3wYwALcmu8aR/L7fTSjeK7Ul9U5c9N5t9Id0690mU/8+Ul
 kyAtrhwkQOh3iWXcFvSOxiOqtrHBP5CkJ7yBgR0VX7A5pTpSdzHAHs3H3fvQYQayQ==
IronPort-HdrOrdr: A9a23:Rtgxxq92BiJh1OibzVZuk+DiI+orL9Y04lQ7vn2ZHyYlFfBw8P
 re/8jztCWVtN9/YhodcLy7UpVoIkm8yXcW2+Ys1OyZLW3bUQKTRelfBO3ZrgEIcBeRygcy78
 tdmwcVMqyXMbDX5/yKgjVRsrwbsby6zJw=
X-Talos-CUID: 9a23:v4gJEGOujnB5Cu5DXg45qmJFWeccMWzt92fRERe+Cz1lV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AXK57/Q0J7cl5iMrwuTvuXSvmuTUj6fmqE04QoMw?=
 =?us-ascii?q?9lMy1EgFZCie9owSpa9py?=
X-IronPort-AV: E=Sophos;i="6.02,141,1688443200"; 
   d="scan'208";a="125168441"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 1/5] x86/pv: Fix the determiniation of whether to inject #DB
Date: Wed, 13 Sep 2023 00:21:09 +0100
Message-ID: <20230912232113.402347-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912232113.402347-1-andrew.cooper3@citrix.com>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We long ago fixed the emulator to not inject exceptions behind our back.
Therefore, assert that that a PV event (including interrupts, because that
would be buggy too) isn't pending, rather than skipping the #DB injection if
one is.

On the other hand, the io_emul() stubs which use X86EMUL_DONE rather than
X86EMUL_OKAY may have pending breakpoints to inject after the IO access is
complete, not to mention a pending singlestep.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 142bc4818cb5..257891a2a2dd 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -1358,14 +1358,18 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
     switch ( rc )
     {
     case X86EMUL_OKAY:
+    case X86EMUL_DONE:
+        ASSERT(!curr->arch.pv.trap_bounce.flags);
+
         if ( ctxt.ctxt.retire.singlestep )
             ctxt.bpmatch |= DR_STEP;
+
         if ( ctxt.bpmatch )
         {
             curr->arch.dr6 |= ctxt.bpmatch | DR_STATUS_RESERVED_ONE;
-            if ( !(curr->arch.pv.trap_bounce.flags & TBF_EXCEPTION) )
-                pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
+            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
         }
+
         /* fall through */
     case X86EMUL_RETRY:
         return EXCRET_fault_fixed;
-- 
2.30.2


