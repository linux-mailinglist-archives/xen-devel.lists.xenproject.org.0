Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D376BF253
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 21:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511253.790242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdGaM-000717-HF; Fri, 17 Mar 2023 20:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511253.790242; Fri, 17 Mar 2023 20:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdGaM-0006yj-E2; Fri, 17 Mar 2023 20:21:58 +0000
Received: by outflank-mailman (input) for mailman id 511253;
 Fri, 17 Mar 2023 20:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FDdY=7J=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pdGaK-0005tD-Uw
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 20:21:56 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bbddaf7-c501-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 21:21:55 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32HKLjXI065934
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 17 Mar 2023 16:21:51 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32HKLjeT065933;
 Fri, 17 Mar 2023 13:21:45 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 5bbddaf7-c501-11ed-b464-930f4c7d94ae
Message-Id: <4db49e192b6829e520cf497481a51deef227b23b.1679084101.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1679084101.git.ehem+xen@m5p.com>
References: <cover.1679084101.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Fri, 17 Mar 2023 12:53:32 -0700
Subject: [PATCH v2 2/2] x86/APIC: modify error_interrupt() to output using
 single printk()
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

This takes care of the issue of APIC errors tending to occur on multiple
cores at one.  In turn this tends to causes the error messages to be
merged together, making understanding them difficult.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 xen/arch/x86/apic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 8cfb8cd71c..89abd1ea51 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1410,6 +1410,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
         ", Received illegal vector",
         ", Illegal register address",
     };
+    const char *entries[ARRAY_SIZE(esr_fields)];
     unsigned int v, v1;
     int i;
 
@@ -1419,12 +1420,12 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
     v1 = apic_read(APIC_ESR);
     ack_APIC_irq();
 
-    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)",
-            smp_processor_id(), v , v1);
     for ( i = 7; i >= 0; --i )
-        if ( v1 & (1 << i) )
-            printk("%s", esr_fields[i]);
-    printk("\n");
+        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
+    printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
+            "%s%s%s%s%s%s%s%s" "\n",
+            smp_processor_id(), v , v1, entries[0], entries[1], entries[2],
+            entries[3], entries[4], entries[5], entries[6], entries[7]);
 }
 
 /*
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |       ehem+sigmsg@drgnwing.com PGP 87145445       |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




