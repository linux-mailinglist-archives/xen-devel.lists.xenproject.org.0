Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C026D88F7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 22:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518634.805387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkA06-0004Xn-Vd; Wed, 05 Apr 2023 20:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518634.805387; Wed, 05 Apr 2023 20:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkA06-0004Vg-Rp; Wed, 05 Apr 2023 20:45:02 +0000
Received: by outflank-mailman (input) for mailman id 518634;
 Wed, 05 Apr 2023 20:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkA05-0004Va-IR
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 20:45:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d15acb-d3f2-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 22:44:59 +0200 (CEST)
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
X-Inumbo-ID: b9d15acb-d3f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680727499;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eZkTQLlgPViTbuqQR+5y7JsM486poKpDOSK+FX/m5MU=;
  b=MMa1x3ZRZTC0E6IsB9dBmwPGG2jPPZuf9Yv/rWpYOQtX8SoC5+2aSvek
   9SPNS3TiwuD9mkWqzL9W3LbK9n6NmdmS9a8TKHQUvHDK1ddDlXh67XXj9
   dudx8sWL+4NlnWIjUwi1CJV4/UWEPKJ+K4BXF/p7u4UNBcZgIACa7crqO
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103266266
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:V8DxZ6340MN2FGuC9PbD5axxkn2cJEfYwER7XKvMYLTBsI5bpzVVm
 GUbXG/QPquKY2Xxe9x3at6x/BwOvMLSy4UySQQ+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE3sVr
 fs4FTs2VT+guu2p+fGDWPdDv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0OxBjG/
 DyYl4j/KjM/HsGv8R+UzlO9hrWWvR39Aq4ACZTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBX0YPncDbTYO2OLMg7w8kSuMdsR9P5fg27UZBgrML
 yC2QDkW3utD1ZFRiv/mpjgrkBr3+MGXE1ddChH/Gzv8s1gnPNPNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83oJrW7FF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPdLpVJ17k/m/SI25PhwxUjapSsEoHDJrAQk0PRLAt4wTuBNEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqLH/jTlk33uYdykVbJEd/pxnPSNLFmhE5FyS2Jm
 +ti2zyikEUDCreuPXiHqub+7zkidBAGOHw/kOQPHsbrH+asMD1J5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:+XmAyaM7CqPesMBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.98,321,1673931600"; 
   d="scan'208";a="103266266"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: Provide EXITINFO decodes for MOV CR/DR intercepts
Date: Wed, 5 Apr 2023 21:44:23 +0100
Message-ID: <20230405204423.2113418-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This removes raw number manipulation, and makes the logic easier to follow.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/svm.c              | 4 ++--
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 8d8b250101ce..90c2f89c1b0d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1740,7 +1740,7 @@ static void svm_vmexit_do_cr_access(
     cr = vmcb->exitcode - VMEXIT_CR0_READ;
     dir = (cr > 15);
     cr &= 0xf;
-    gp = vmcb->exitinfo1 & 0xf;
+    gp = vmcb->ei.mov.gpr;
 
     rc = dir ? hvm_mov_to_cr(cr, gp) : hvm_mov_from_cr(cr, gp);
 
@@ -2961,7 +2961,7 @@ void svm_vmexit_handler(void)
 
     case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
     case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
-        if ( cpu_has_svm_decode && (vmcb->exitinfo1 & (1ULL << 63)) )
+        if ( cpu_has_svm_decode && vmcb->ei.mov.mov_insn )
             svm_vmexit_do_cr_access(vmcb, regs);
         else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index b809e85507aa..77e3bd9aa048 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -450,6 +450,11 @@ struct vmcb_struct {
 
                 uint64_t nrip;
             } io;
+            struct {
+                uint64_t gpr:4;
+                uint64_t :59;
+                bool     mov_insn:1; /* MOV, as opposed to LMSW, CLTS, etc */
+            } mov;
             struct {
                 uint16_t sel;
                 uint64_t :48;
-- 
2.30.2


