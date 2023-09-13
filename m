Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424379F2D8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601590.937688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTO-0006dM-2n; Wed, 13 Sep 2023 20:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601590.937688; Wed, 13 Sep 2023 20:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTN-0006Tp-Tz; Wed, 13 Sep 2023 20:28:29 +0000
Received: by outflank-mailman (input) for mailman id 601590;
 Wed, 13 Sep 2023 20:28:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTM-0004dA-0e
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1768456a-5274-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:28:26 +0200 (CEST)
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
X-Inumbo-ID: 1768456a-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jx4SOK+9S/IjqodWIlucBKoLHCAUVljbJYSnUX0zZyE=;
  b=KqoALMNqnBHPFSEGzbk7Z0Yy0R6I55TxlI4L7yUE634VynszxbZ1fW5c
   Jkq3KOfXLzcJNRqCRcMpJ3Etdo0hvZ8DSVggPgKgtZ7zhc59DR3oatP2M
   ALqe9jcaNQOx3HB8ypV3Sx+I2TAQiU8JonG6ca4qHXfIPQj0hUGTdmD94
   w=;
X-CSE-ConnectionGUID: tqLoj7ejQSK+P4DSBC/0tA==
X-CSE-MsgGUID: Ve2Ajt9KQAWORAnfabEMKg==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125280891
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:9AOFYqwl9Z0HFCInghd6t+chxirEfRIJ4+MujC+fZmUNrF6WrkUEz
 WcbXGyGb/iCNDOhL9h2O4yzpB9Sup6HyIMxGwVtpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKsT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX1X0
 fsadz0PVyugxNrq7ImRYa40mu12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPwxzI/
 jKXpgwVBDkkOYa2yybU0UuFucj1tCX1UYg/MZ63o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cefAsDT1QI4eDYg8IL0j70ZP0kSLKc24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9A4DNJWfh0B3iM4ldjBO
 RW7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHWoH81PRbMgT2zwSDAdJ3T3
 r/BLa6R4YsyU/w7nFJauc9DuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmrflY5QDx4W6+JqV7jEqQ895loei7z1
 inVcidlJJDX1BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:zYTrlK1FUvlG6PzvXu3uKQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3ACoiE/GrCSoCEODMpS+izFZXmUdw8Vnrfk3rSGnS?=
 =?us-ascii?q?bSl41ZIa/YhjI5Ioxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A/ObK0A0TCPcZP15Y9NPuwlvItTUj3an0IUIRwLY?=
 =?us-ascii?q?/kvajDwV2NT6XoRGUTdpy?=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="125280891"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/8] x86/spec-ctrl: Fold DO_SPEC_CTRL_EXIT_TO_XEN into it's single user
Date: Wed, 13 Sep 2023 21:27:52 +0100
Message-ID: <20230913202758.508225-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With the SPEC_CTRL_EXIT_TO_XEN{,_IST} confusion fixed, it's now obvious that
there's only a single EXIT_TO_XEN path.  Fold DO_SPEC_CTRL_EXIT_TO_XEN into
SPEC_CTRL_EXIT_TO_XEN to simplify further fixes.

When merging labels, switch the name to .L\@_skip_sc_msr as "skip" on its own
is going to be too generic shortly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 40 ++++++++++--------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 14ec40e8d32f..dd7c5e8bfc79 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -199,27 +199,6 @@
     wrmsr
 .endm
 
-.macro DO_SPEC_CTRL_EXIT_TO_XEN
-/*
- * Requires %rbx=stack_end
- * Clobbers %rax, %rcx, %rdx
- *
- * When returning to Xen context, look to see whether SPEC_CTRL shadowing is
- * in effect, and reload the shadow value.  This covers race conditions which
- * exist with an NMI/MCE/etc hitting late in the return-to-guest path.
- */
-    xor %edx, %edx
-
-    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
-    jz .L\@_skip
-
-    mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%rbx), %eax
-    mov $MSR_SPEC_CTRL, %ecx
-    wrmsr
-
-.L\@_skip:
-.endm
-
 .macro DO_SPEC_CTRL_EXIT_TO_GUEST
 /*
  * Requires %eax=spec_ctrl, %rsp=regs/cpuinfo
@@ -328,11 +307,24 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
  * Clobbers %rax, %rcx, %rdx
  */
     testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
-    jz .L\@_skip
+    jz .L\@_skip_sc_msr
 
-    DO_SPEC_CTRL_EXIT_TO_XEN
+    /*
+     * When returning to Xen context, look to see whether SPEC_CTRL shadowing
+     * is in effect, and reload the shadow value.  This covers race conditions
+     * which exist with an NMI/MCE/etc hitting late in the return-to-guest
+     * path.
+     */
+    xor %edx, %edx
 
-.L\@_skip:
+    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
+    jz .L\@_skip_sc_msr
+
+    mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%rbx), %eax
+    mov $MSR_SPEC_CTRL, %ecx
+    wrmsr
+
+.L\@_skip_sc_msr:
 .endm
 
 #endif /* __ASSEMBLY__ */
-- 
2.30.2


