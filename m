Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5E3087EA
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77956.141579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RHt-0000Iq-Eh; Fri, 29 Jan 2021 10:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77956.141579; Fri, 29 Jan 2021 10:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RHt-0000IQ-BR; Fri, 29 Jan 2021 10:46:01 +0000
Received: by outflank-mailman (input) for mailman id 77956;
 Fri, 29 Jan 2021 10:46:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5RHs-0000II-61
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:46:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b96bfaa-ea30-43aa-90ae-e97994574f26;
 Fri, 29 Jan 2021 10:45:58 +0000 (UTC)
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
X-Inumbo-ID: 3b96bfaa-ea30-43aa-90ae-e97994574f26
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611917158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tv4cBwEAsvdZj0In03grL69EwnWIPYvdtYFViraxlCw=;
  b=heEQui6/Hcfj0UIueMzpsIIFbSwgt0e9pkTGgs5g2REpiN2iueTvlQGg
   6yU0PW+qupV9SszUu1xIqcpsDv0EYDB1R4Y2uONJzrVisisPOAqE2x1X0
   /FZ+A9WHGriyXCcN4VWGVTQTEXjoln8pk/OoIZVyk3BL+Hq4xyYZ8e8pc
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SpVlrpEWSl+OnuyIfttemGZHhAdmBXE1B+7P38b1dZKAIwUHZvGBw22W5LaN7rN4AujlHEIiV8
 zqnPznKbd4FpO3Z5lRJltfOu4WiRCEXJ5T2X1EPodAGQoSoE2eEjwHybffJ4d26DLbwNd1hhKf
 Jp86OoGqClOGEWFSR0/a9hk5SwDQpg1Rfpw0/ZSUSuUTFMNGTEoEUJQbAeewwes1SiBwkSqKcm
 f8x0JRowtothAAFRIlVqkaJ5z2lPR8cYfSjCJhfB1HFMrKxQ8mAmCysS+O99BIDttj/8QVz1Kj
 4OE=
X-SBRS: 5.1
X-MesageID: 36517224
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36517224"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2.5/3] x86/svm: Reimplement VMRUN/STGI/CLGI with new asm-defns.h infrastructure
Date: Fri, 29 Jan 2021 10:45:40 +0000
Message-ID: <20210129104540.32137-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210115231046.31785-1-andrew.cooper3@citrix.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... in order to reuse stgi elsewhere.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/svm/entry.S    | 10 +++-------
 xen/include/asm-x86/asm-defns.h | 12 ++++++++++++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 1d2df08e89..e208a4b32a 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -22,10 +22,6 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
-#define VMRUN  .byte 0x0F,0x01,0xD8
-#define STGI   .byte 0x0F,0x01,0xDC
-#define CLGI   .byte 0x0F,0x01,0xDD
-
 ENTRY(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
@@ -82,9 +78,9 @@ __UNLIKELY_END(nsvm_hap)
         pop  %rsi
         pop  %rdi
 
-        CLGI
+        clgi
         sti
-        VMRUN
+        vmrun
 
         SAVE_ALL
 
@@ -93,7 +89,7 @@ __UNLIKELY_END(nsvm_hap)
         SPEC_CTRL_ENTRY_FROM_HVM    /* Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
-        STGI
+        stgi
 GLOBAL(svm_stgi_label)
         mov  %rsp,%rdi
         call svm_vmexit_handler
diff --git a/xen/include/asm-x86/asm-defns.h b/xen/include/asm-x86/asm-defns.h
index 43f4868d40..2e3ec0ac01 100644
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -8,6 +8,18 @@
 .endm
 #endif
 
+.macro vmrun
+    .byte 0x0f, 0x01, 0xd8
+.endm
+
+.macro stgi
+    .byte 0x0f, 0x01, 0xdc
+.endm
+
+.macro clgi
+    .byte 0x0f, 0x01, 0xdd
+.endm
+
 .macro INDIRECT_BRANCH insn:req arg:req
 /*
  * Create an indirect branch.  insn is one of call/jmp, arg is a single
-- 
2.11.0


