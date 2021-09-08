Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F7403D81
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 18:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182309.329817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO0IN-0008NK-JB; Wed, 08 Sep 2021 16:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182309.329817; Wed, 08 Sep 2021 16:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO0IN-0008LW-Ft; Wed, 08 Sep 2021 16:19:31 +0000
Received: by outflank-mailman (input) for mailman id 182309;
 Wed, 08 Sep 2021 16:19:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mO0IL-0008LO-It
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 16:19:29 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a063f44-10c0-11ec-b16a-12813bfff9fa;
 Wed, 08 Sep 2021 16:19:28 +0000 (UTC)
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
X-Inumbo-ID: 8a063f44-10c0-11ec-b16a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631117968;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1PNTtirelvdOFT8pkqCJx/nKsOd1/I276VVJU/Bt6vI=;
  b=IWc1XbUwloA1pHE9V19cusa0TBEUUkfCsg+My5vnvqWyAHll9vZeDpCR
   d5S2g7hXNIeDHgICVJPJ0LnyY6ZSe4mjzHKmsLv7mOXIsB7Gh5NE/kZEo
   ecNbrAfbBV8oqhl4GFkLXFaog9cc00OGfyGLumuwOqn0RR+u67UtMEA2G
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bkjV2uRkmrFZZolAqDluZKT+JnhJV18b6j/tit/bmUnJH67XO66aCLtKWco9+WH5V9C9TirUWZ
 n3wrfb6POp03jg8U5v8CUMBeoL3Nr1LOm1EazIxlIM4esLwYSk0txYBLkrsf5p9z7B5qq3qnLO
 GCJV6Oe5F4kSZiOuqOFf0BrHgW5GJMF6VGeQpXMbiuQiELa2BBDktCDaJGeQO1aqp8PiFydgl5
 J+59XL6UAyWPNNv586YhcND1rDzyEtVOeDBD6JDR+hyuMmJCjgxGsdVjbZPdGnnD1zz6cZsklU
 9EB5skYzI59s1POMZFmRGrzq
X-SBRS: 5.1
X-MesageID: 52289560
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:c/rKd6EwjPGy2QajpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="52289560"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: Intercept and terminate RDPRU with #UD
Date: Wed, 8 Sep 2021 17:19:18 +0100
Message-ID: <20210908161918.25911-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The RDPRU instruction isn't supported at all (and it is unclear how this can
ever be offered safely to guests).  However, a guest which ignores CPUID and
blindly executes RDPRU will find that it functions.

Use the intercept and terminate with #UD.  While at it, fold SKINIT into the
same "unconditionally disabled" path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I could have sworn that I'd posted this before, but I can't locate any
evidence of it.  I've got a separate patch adding the CPUID infrastructure for
rdpru, but that is better left until we've got more libx86 levelling logic in
place.
---
 xen/arch/x86/hvm/svm/svm.c         | 5 ++---
 xen/arch/x86/hvm/svm/vmcb.c        | 3 ++-
 xen/include/asm-x86/hvm/svm/vmcb.h | 4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 8dc92c8b9f96..18c4831f98ad 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2945,6 +2945,8 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
 
     case VMEXIT_MONITOR:
     case VMEXIT_MWAIT:
+    case VMEXIT_SKINIT:
+    case VMEXIT_RDPRU:
         hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
         break;
 
@@ -2963,9 +2965,6 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     case VMEXIT_CLGI:
         svm_vmexit_do_clgi(regs, v);
         break;
-    case VMEXIT_SKINIT:
-        hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
-        break;
 
     case VMEXIT_XSETBV:
         if ( vmcb_get_cpl(vmcb) )
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 55da9302e5d7..565e997155f2 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -70,7 +70,8 @@ static int construct_vmcb(struct vcpu *v)
         GENERAL2_INTERCEPT_STGI        | GENERAL2_INTERCEPT_CLGI        |
         GENERAL2_INTERCEPT_SKINIT      | GENERAL2_INTERCEPT_MWAIT       |
         GENERAL2_INTERCEPT_WBINVD      | GENERAL2_INTERCEPT_MONITOR     |
-        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP;
+        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
+        GENERAL2_INTERCEPT_RDPRU;
 
     /* Intercept all debug-register writes. */
     vmcb->_dr_intercepts = ~0u;
diff --git a/xen/include/asm-x86/hvm/svm/vmcb.h b/xen/include/asm-x86/hvm/svm/vmcb.h
index 4fa2ddfb2ff2..ed7cebea7174 100644
--- a/xen/include/asm-x86/hvm/svm/vmcb.h
+++ b/xen/include/asm-x86/hvm/svm/vmcb.h
@@ -74,7 +74,8 @@ enum GenericIntercept2bits
     GENERAL2_INTERCEPT_MONITOR = 1 << 10,
     GENERAL2_INTERCEPT_MWAIT   = 1 << 11,
     GENERAL2_INTERCEPT_MWAIT_CONDITIONAL = 1 << 12,
-    GENERAL2_INTERCEPT_XSETBV  = 1 << 13
+    GENERAL2_INTERCEPT_XSETBV  = 1 << 13,
+    GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
 };
 
 
@@ -300,6 +301,7 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT            = 139, /* 0x8b */
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
+    VMEXIT_RDPRU            = 142, /* 0x8e */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     VMEXIT_INVALID          =  -1
 };
-- 
2.11.0


