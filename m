Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579AF79F2D5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601588.937672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTM-0006Cs-Qh; Wed, 13 Sep 2023 20:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601588.937672; Wed, 13 Sep 2023 20:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTM-00064L-HA; Wed, 13 Sep 2023 20:28:28 +0000
Received: by outflank-mailman (input) for mailman id 601588;
 Wed, 13 Sep 2023 20:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTK-0004yg-Ub
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15f63a70-5274-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 22:28:24 +0200 (CEST)
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
X-Inumbo-ID: 15f63a70-5274-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2OX3DxkMU6J5CjLFRkPzVMla4/tm4f+X2kaevcyHDIQ=;
  b=Tkd7e31bd3fAo5f/ivGt1lQq+AF4Cb52xSqaCD9LXpxkE27taasi7PfZ
   GXax0h1B2ubdf0hYMmtB9Ros/7mjNviKjq9TH8zpBrsuocx9Zvq94zNOq
   u9fcJA2f72cuuddmLyjHCHzltu/uoGwndvtFdWpAKdaxbLgs3raxVSD1n
   Y=;
X-CSE-ConnectionGUID: hN7dthOmQouNNVMZfTFHmw==
X-CSE-MsgGUID: 5pkOILBvSXyUEX0ggRl1Tw==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121213284
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:g6lX8KAc4rcXbBVW/zXjw5YqxClBgxIJ4kV8jS/XYbTApD4rg2QAz
 GYdXTzTaKrYazDyKo92bNu+/ENQ75CBytA3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMscpvlDs15K6p4GJB5QRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+sAoDX1O0
 vkhLy0rSC6mteyK7pK+Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bTH5wOxBbEz
 o7A1znhATY7EPaB8gqUz1+c3uDApyeiZJ1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6cLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sESgzcmMeZQgBdAwYxf/dhbM9sjzvS8k2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3qxZPnqgKulmSwXuF1e5dIlfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMktLVbeoHE2PhLIt4wIrKTKuftvU
 Xt8WZzwZUv29Iw9lGbmLwvj+eBDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI6RD55VqaBketJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:UARoG66DfrkgqFCANwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AMiGufGrNSqKXV4FP4jNIfZLmUcADLXHBzFDVGki?=
 =?us-ascii?q?lL0BXbY+bdXGw/bwxxg=3D=3D?=
X-Talos-MUID: 9a23:6xHzcQVe4wxmJBTq/GL0hxZDEO122JS/NW09yZoJgc3dCTMlbg==
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="121213284"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 7/8] x86/spec-ctrl: Issue VERW during IST exit to Xen
Date: Wed, 13 Sep 2023 21:27:57 +0100
Message-ID: <20230913202758.508225-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is a corner case where e.g. an NMI hitting an exit-to-guest path after
SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
flush to scrub potentially sensitive data from uarch buffers.

In order to compensate, issue VERW when exiting to Xen from an IST entry.

SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
and we're about to add a third.  Load the field into %ebx, and list the
register as clobbered.

%r12 has been arranged to be the ist_exit signal, so add this as an input
dependency and use it to identify when to issue a VERW.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 20 +++++++++++++++-----
 xen/arch/x86/x86_64/entry.S              |  2 +-
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index acdb526d292d..9740697114ad 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -344,10 +344,12 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
  */
 .macro SPEC_CTRL_EXIT_TO_XEN
 /*
- * Requires %r14=stack_end
- * Clobbers %rax, %rcx, %rdx
+ * Requires %r12=ist_exit, %r14=stack_end
+ * Clobbers %rax, %rbx, %rcx, %rdx
  */
-    testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
+    movzbl STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14), %ebx
+
+    testb $SCF_ist_sc_msr, %bl
     jz .L\@_skip_sc_msr
 
     /*
@@ -358,7 +360,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
      */
     xor %edx, %edx
 
-    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
+    testb $SCF_use_shadow, %bl
     jz .L\@_skip_sc_msr
 
     mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%r14), %eax
@@ -367,8 +369,16 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
 
 .L\@_skip_sc_msr:
 
-    /* TODO VERW */
+    test %r12, %r12
+    jz .L\@_skip_ist_exit
+
+    /* Logically DO_SPEC_CTRL_COND_VERW but without the %rsp=cpuinfo dependency */
+    testb $SCF_verw, %bl
+    jz .L\@_verw_skip
+    verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
+.L\@_verw_skip:
 
+.L\@_skip_ist_exit:
 .endm
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index da084a7e8e54..f70752fa36c1 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -686,7 +686,7 @@ UNLIKELY_START(ne, exit_cr3)
 UNLIKELY_END(exit_cr3)
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_XEN     /* Req: %r14=end, Clob: acd */
+        SPEC_CTRL_EXIT_TO_XEN     /* Req: %r12=ist_exit %r14=end, Clob: abcd */
 
         RESTORE_ALL adj=8
         iretq
-- 
2.30.2


