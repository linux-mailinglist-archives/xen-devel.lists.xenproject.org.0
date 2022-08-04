Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DCF589E27
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380518.614711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPM-00021F-QO; Thu, 04 Aug 2022 15:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380518.614711; Thu, 04 Aug 2022 15:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPM-0001sY-Ma; Thu, 04 Aug 2022 15:05:08 +0000
Received: by outflank-mailman (input) for mailman id 380518;
 Thu, 04 Aug 2022 15:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMPZ=YI=citrix.com=prvs=2084bc4d8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oJcPL-0001pR-SR
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:05:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2558e88-1406-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 17:05:06 +0200 (CEST)
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
X-Inumbo-ID: d2558e88-1406-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659625506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QgUZ32yF2K286P2BkzCo1ex4mjo4Zhntd7s4lmaIVpo=;
  b=NwI6vkdyRFBY/3g9ch+1ooY+csxsAfuHJ4aTLVGCPcrbF3+H/0zjm10f
   MH1Riie6aGUS4t7KELeiw0NdV1WRELH0I/eq2eNUKuCUL8TwtVZmpgpqo
   dB5FhPafbWnEynArDkFsaLHdX2t1eigTCHuwgtnFjd4pgOyLqozXjW/CN
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77379592
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4j5itK/RN50nuPFwmNsfDrUD7H6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GQcWTyHM/yIZWqmfdtyb4vi/RsC7MODytJmQANuqys8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM34Kyp0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGHX8RAqlA/sNOBVpN8
 dMWa2kAdh7SiLfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoQRRJNxEyAZY3mO6ui1H0ciFCqULTrq0yi4TW5FMui+e8bYuPEjCMbYZz3UfAm
 0KXxmfSOwgCPcCd9zHUr1v504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTo/O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9WEy6yZPMqRaLPRMWKUAMJnYJVQVU7Iy2yG0stS4jXuqPAYbs0ICkRWmtm
 m3QxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5FIMucYMbCD6MvQfj2eN5yMCncDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6RMJruMow+lWLeb7pMjtcWKtUWnzy7qWbTk0v6itJzpRe9Fd84Dbd5Rr9jvf7c8VyFr
 r6y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:9+M+/Km6aGtqgmMDuqOVGtUUKhDpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77379592"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 3/4] x86/entry: move .init.text section higher up in the code for readability
Date: Thu, 4 Aug 2022 16:04:23 +0100
Message-ID: <20220804150424.17584-4-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220804150424.17584-1-jane.malalane@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/entry.S | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 26bf2f1941..4ad25d9c90 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -140,6 +140,15 @@ process_trap:
         call create_bounce_frame
         jmp  test_all_events
 
+        .pushsection .init.text, "ax", @progbits
+        ENTRY(early_page_fault)
+        ENDBR64
+        movl  $TRAP_page_fault,4(%rsp)
+        SAVE_ALL
+        movq  %rsp,%rdi
+        call  do_early_page_fault
+        jmp   restore_all_xen
+
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
@@ -982,16 +991,6 @@ ENTRY(double_fault)
         call  do_double_fault
         BUG   /* do_double_fault() shouldn't return. */
 
-        .pushsection .init.text, "ax", @progbits
-ENTRY(early_page_fault)
-        ENDBR64
-        movl  $TRAP_page_fault,4(%rsp)
-        SAVE_ALL
-        movq  %rsp,%rdi
-        call  do_early_page_fault
-        jmp   restore_all_xen
-        .popsection
-
 ENTRY(nmi)
         ENDBR64
         pushq $0
-- 
2.11.0


