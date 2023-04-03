Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CF6D445D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 14:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517415.802685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJFo-0001HG-HN; Mon, 03 Apr 2023 12:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517415.802685; Mon, 03 Apr 2023 12:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjJFo-0001Ey-Dp; Mon, 03 Apr 2023 12:25:44 +0000
Received: by outflank-mailman (input) for mailman id 517415;
 Mon, 03 Apr 2023 12:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGRT=72=citrix.com=prvs=45084431a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjJFn-0001El-30
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 12:25:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a501aa3f-d21a-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 14:25:41 +0200 (CEST)
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
X-Inumbo-ID: a501aa3f-d21a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680524741;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TxjTaysaeDa90xTG7SNGAWxGMgj3IbXSTraiBTjeLEs=;
  b=W0ZX94Rv9Fw+UQH3xzzyFrZ2osH7ca3mZZiAeRttIgTARX1DVHY/dyew
   Rx9cHPG04nupYfQeb5Syj61ZdMUWBDFK4l1wgeVKsUwVcB51sEJ+Zc3bc
   vGrkywW9gJLCZIf8n7LIG88XsufA8KZ1WFbajhkiGg99gFb+J2YuAwlK+
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104030835
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Fq9iQ6Kgze6q5vGVFE+RrpUlxSXFcZb7ZxGr2PjKsXjdYENSgTMAm
 DEWXWuBMq3YZGT8c9l/O4q+pxsD7MKAzoJhGwZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5HE2Bwr
 uUfIgwjVQ2NhvCEn7G8WOZj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHZkNxR7I/
 T+uE2LRXgwUb9eflCu88k38ofSQwi/4fd0vC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9HX0DW3QdSgE5zeL+roAhvE3MScRsH/vg5jHqIg0c0
 wxmvQBn2eVL15VXh/jrlbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9rtVZx2k/G5T42NuhXogj1mO8EZSeN61Hs2OR74M57FyyDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPWkU0BDbGvP3CMmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQwnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:w/PMB6BzSLcOKgPlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="104030835"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/emul: Fix test harness build with blk.c moved out of x86_emulate.c
Date: Mon, 3 Apr 2023 13:25:35 +0100
Message-ID: <20230403122535.724250-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Trying to build the test harness fails with:

  x86_emulate/blk.c: In function 'x86_emul_blk':
  x86_emulate/blk.c:74:15: error: expected ':' or ')' before 'ASM_FLAG_OUT'
     74 |               ASM_FLAG_OUT(, "; setz %[zf]")
        |               ^~~~~~~~~~~~

This is because ASM_FLAG_OUT() is still local to x86_emulate.c.  Move it into
x86-emulate.h instead so it ends up in all files including private.h.  The
main Xen build gets this macro from compiler.h.

Fixes: c80243f94386 ("x86emul: move x86_emul_blk() to separate source file")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/tests/x86_emulator/x86-emulate.h | 6 ++++++
 xen/arch/x86/x86_emulate/x86_emulate.c | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
index 0ae528a741ed..942b4cdd47d1 100644
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -65,6 +65,12 @@
 #define AC_(n,t) (n##t)
 #define _AC(n,t) AC_(n,t)
 
+#ifdef __GCC_ASM_FLAG_OUTPUTS__
+# define ASM_FLAG_OUT(yes, no) yes
+#else
+# define ASM_FLAG_OUT(yes, no) no
+#endif
+
 #define hweight32 __builtin_popcount
 #define hweight64 __builtin_popcountll
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index b84e9ee54dae..5a0ec5900a93 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -132,12 +132,6 @@ static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
         (void *)(((long)__##var + __alignof(type) - __alignof(__##var))   \
                  & -__alignof(type))
 
-#ifdef __GCC_ASM_FLAG_OUTPUTS__
-# define ASM_FLAG_OUT(yes, no) yes
-#else
-# define ASM_FLAG_OUT(yes, no) no
-#endif
-
 /* MXCSR bit definitions. */
 #define MXCSR_MM  (1U << 17)
 
-- 
2.30.2


