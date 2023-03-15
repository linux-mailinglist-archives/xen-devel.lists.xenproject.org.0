Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E86BBFA2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 23:11:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510258.787581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcZKB-0000WN-2J; Wed, 15 Mar 2023 22:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510258.787581; Wed, 15 Mar 2023 22:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcZKA-0000UM-Uu; Wed, 15 Mar 2023 22:10:22 +0000
Received: by outflank-mailman (input) for mailman id 510258;
 Wed, 15 Mar 2023 22:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN/u=7H=citrix.com=prvs=431ad58dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pcZKA-0000UG-46
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 22:10:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b83b127-c37e-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 23:10:20 +0100 (CET)
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
X-Inumbo-ID: 2b83b127-c37e-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678918220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AoxV7CO1KLe3TIVgZq2lth+0MW0vNKxwSIMoAHfudKU=;
  b=QJP13QQbNe6x/cpKexEYqZSaJuGfO9LI2zCnD5bCOCwQsH8iJRNCxVXE
   dwqsxtM/Eu4edXd0ZYeeMbVxtO13qJvy8dEXH1UDcG4U6J+LGDWIqYTW1
   7mL79LP58dSl7cC4jxfbz2SMOZ5rYaI511PFIkAORCQdyp3ptkAfJ0muT
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100394084
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Ibnoy63LataE6TTXEvbD5dpxkn2cJEfYwER7XKvMYLTBsI5bp2FVm
 2McWTvXafiIajb1LookPoXk8B4F6p/czN5nHVc9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGXlDx
 Pk2cwk3URWjlszp7/G4UtZMiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0NxRfE/
 jKal4j/KklGH+aEwzTYyCi9hb7rmB/RBZpVPbLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBXcaaB4BY1A82ebmgJAd0T2MTc5cMKHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5IOi8Axkkfi+F1/ronhe4C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvK1/WpHwzPB/Ngj6FfK0QfUYXa
 P+mnTuEVy5GWcyLMhLvLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaodFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcym85ELK7XYfmKL2ggJUpfs/F/oQKQ994w9qwsC1
 i3VtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:FIcufK2qzSK/YjhvOj2chQqjBfdyeYIsimQD101hICG9E/bo4v
 xG+c5xuyMc5wxwZJheo6H9BEDtexLhHP1OkPos1MmZLWvbUQKTRekJ0WKI+UyCJ8SRzJ856U
 9qG5IOd+EZZTJB4foTi2ODfOrJD7O8nZyAtKPm6zNIcCkvUqdn6m5Ce3Sm+o8dfng5OXL8fq
 DslvauYlCbCAUqh7+Adx04dtmGncTPiJXlJTYeHnccmXCzpALt0qf+Dx+bmjwDUzZDqI1SjF
 TtokjC/6C+tPP+7RfZ2wbonvNrseqk8MJHGMuPzu4KLTn24zzYArhJavm5pTUop+Pq0nYG+e
 O82ysIDoBI8nbMeWPwmxf3xAX69z4r5xbZuCSlqEqmm9X9WDU5T/VMnphYdByx0TtbgO1B
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100394084"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/svm: Provide EXITINFO decodes for IO intercetps
Date: Wed, 15 Mar 2023 22:10:03 +0000
Message-ID: <20230315221003.733913-1-andrew.cooper3@citrix.com>
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
 xen/arch/x86/hvm/svm/svm.c              | 11 +++++------
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 14 ++++++++++++++
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index a43bcf2e92f0..bfe03316def6 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2939,13 +2939,12 @@ void svm_vmexit_handler(void)
         break;
 
     case VMEXIT_IOIO:
-        if ( (vmcb->exitinfo1 & (1u<<2)) == 0 )
+        if ( !vmcb->ei.io.str )
         {
-            uint16_t port = (vmcb->exitinfo1 >> 16) & 0xFFFF;
-            int bytes = ((vmcb->exitinfo1 >> 4) & 0x07);
-            int dir = (vmcb->exitinfo1 & 1) ? IOREQ_READ : IOREQ_WRITE;
-            if ( handle_pio(port, bytes, dir) )
-                __update_guest_eip(regs, vmcb->exitinfo2 - vmcb->rip);
+            if ( handle_pio(vmcb->ei.io.port,
+                            vmcb->ei.io.bytes,
+                            vmcb->ei.io.in ? IOREQ_READ : IOREQ_WRITE) )
+                __update_guest_eip(regs, vmcb->ei.io.nrip - vmcb->rip);
         }
         else if ( !hvm_emulate_one_insn(x86_insn_is_portio, "port I/O") )
             hvm_inject_hw_exception(TRAP_gp_fault, 0);
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index e87728fa81cd..2981a303746a 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -436,6 +436,20 @@ struct vmcb_struct {
             uint64_t exitinfo2; /* offset 0x80 */
         };
         union {
+            struct {
+                bool     in:1;
+                bool     :1;
+                bool     str:1;
+                bool     /* rep */:1;
+                uint16_t bytes:3;
+                uint16_t /* asz */:3;
+                uint16_t /* seg */:3;
+                uint16_t :3;
+                uint16_t port;
+                uint32_t :32;
+
+                uint64_t nrip;
+            } io;
             struct {
                 uint16_t sel;
                 uint64_t :48;
-- 
2.30.2


