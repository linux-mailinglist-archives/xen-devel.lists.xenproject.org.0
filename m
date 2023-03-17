Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4556BEF33
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 18:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511179.790134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdDXa-0000uA-EF; Fri, 17 Mar 2023 17:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511179.790134; Fri, 17 Mar 2023 17:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdDXa-0000rS-AN; Fri, 17 Mar 2023 17:06:54 +0000
Received: by outflank-mailman (input) for mailman id 511179;
 Fri, 17 Mar 2023 17:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FDdY=7J=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pdDXY-0000rM-OP
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 17:06:52 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a0be55e-c4e6-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 18:06:50 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32HH6J3F064584
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 17 Mar 2023 13:06:25 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32HH6JPj064583;
 Fri, 17 Mar 2023 10:06:19 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1a0be55e-c4e6-11ed-87f5-c1b5be75604c
Message-Id: <b4f311dc40ed6036cea46fe05efceac09554a6c4.1679072607.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Fri, 17 Mar 2023 09:10:56 -0700
Subject: [PATCH] x86/APIC: modify error_interrupt() to output using single
 printk()
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This takes care of the issue of APIC errors tending to occur on multiple
cores at one.  In turn this tends to causes the error messages to be
merged together, making understanding them difficult.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 xen/arch/x86/apic.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f71474d47d..5399488120 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1412,6 +1412,12 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
     };
     unsigned int v, v1;
     int i;
+    char head[] = XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)";
+    char entry[] = ", %s";
+    /* header string, ", %s" for each potential entry, newline */
+    char fmt[sizeof(head) + ARRAY_SIZE(esr_fields) * (sizeof(entry) - 1) + 1];
+    const char *args[ARRAY_SIZE(esr_fields)];
+    unsigned int count = 0;
 
     /* First tickle the hardware, only then report what went on. -- REW */
     v = apic_read(APIC_ESR);
@@ -1419,12 +1425,18 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
     v1 = apic_read(APIC_ESR);
     ack_APIC_irq();
 
-    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
-            smp_processor_id(), v , v1);
+    memcpy(fmt, head, sizeof(head) - 1);
+
     for ( i = 7; i >= 0; --i )
-        if ( v1 & (1 << i) )
-            printk(", %s", esr_fields[i]);
-    printk("\n");
+        if ( v1 & (1 << i) ) {
+            memcpy(fmt + sizeof(head) + (sizeof(entry) - 1) * count - 1, entry,
+                    sizeof(entry) - 1);
+            args[count++] = esr_fields[i];
+        }
+    memcpy(fmt + sizeof(head) + (sizeof(entry) - 1) * count - 1, "\n", 2);
+    /*_Static_assert(ARRAY_SIZE(args) == 8, "printk() here needs args added");*/
+    printk(fmt, smp_processor_id(), v , v1, args[0], args[1], args[2], args[3],
+            args[4], args[5], args[6], args[7]);
 }
 
 /*
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |        ehem+sigmsg@m5p.com    PGP 87145445        |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



