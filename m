Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA659C040
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391408.629211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7EL-0001rY-Qy; Mon, 22 Aug 2022 13:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391408.629211; Mon, 22 Aug 2022 13:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7EL-0001pP-O1; Mon, 22 Aug 2022 13:12:37 +0000
Received: by outflank-mailman (input) for mailman id 391408;
 Mon, 22 Aug 2022 13:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+uMy=Y2=citrix.com=prvs=22646fa71=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQ7EJ-0001pJ-I6
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:12:36 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15302847-221c-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 15:12:34 +0200 (CEST)
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
X-Inumbo-ID: 15302847-221c-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661173954;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DPmKXJOI8G/T+sQv0K4zhFGXrNZPq2rWeq1//4l72Pc=;
  b=fasE8V49TvKFjiZg8lOqBXLcL2qhYqaVT9kR8M0+TzC+M76cFqQZxMVk
   kxNAMSPxPS6v21Luk0De+acVrXqQWZhbujQUUg+CYQVTu97doYFSfwqyJ
   P5tfnJEe+WxOzBr9ZTuL1ro/UeIMBqV5Heqo9d10fN+hPM8ZbJWYBgSE6
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81159432
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Vv6EPKw1pl7pJ+aBi+V6t+dYxirEfRIJ4+MujC+fZmUNrF6WrkUBy
 GYaWWqPMq3eNmOmKNlwPYrloBsEscTQmNYwSFZqqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Ek15K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1VCEs0N4Ijx99PKmpFr
 uY/GR49Swyq0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzpZRFVN0hRI5U5hOqy3VH0ciFCqULTrq0yi4TW5FwoieW8bIGPEjCMbZVFzmSJq
 3vfxjm6MzxdHsG2mSO+2G3504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTg9O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9cnaX9L2blg6LAQMeJjQYQh4qfS4Zyoy2yG0stS4jXuqPAYbs0IOtSW6sm
 mDUxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN51oIvMALbSX6N/cfj2eN5yMCnMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5RrBltP3c/1uIr
 76y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:AMVsWqqaMZQbkyHWCs/wj6AaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.93,254,1654574400"; 
   d="scan'208";a="81159432"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/entry: Fix !PV build
Date: Mon, 22 Aug 2022 14:12:04 +0100
Message-ID: <20220822131204.25814-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

early_page_fault() needs to outside of #ifdef CONFIG_PV

Spotted by Gitlab CI.

Fixes: fe3f50726e87 ("x86/entry: move .init.text section higher up in the code for readability")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/entry.S | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 9b34150bc7ab..b0efe48192d5 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -22,6 +22,17 @@
 #endif
 .endm
 
+        .section .init.text, "ax", @progbits
+ENTRY(early_page_fault)
+        ENDBR64
+        movl  $TRAP_page_fault, 4(%rsp)
+        SAVE_ALL
+        movq  %rsp, %rdi
+        call  do_early_page_fault
+        jmp   restore_all_xen
+
+        .text
+
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
 switch_to_kernel:
@@ -140,15 +151,6 @@ process_trap:
         call create_bounce_frame
         jmp  test_all_events
 
-        .section .init.text, "ax", @progbits
-ENTRY(early_page_fault)
-        ENDBR64
-        movl  $TRAP_page_fault, 4(%rsp)
-        SAVE_ALL
-        movq  %rsp, %rdi
-        call  do_early_page_fault
-        jmp   restore_all_xen
-
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
-- 
2.11.0


