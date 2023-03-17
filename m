Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253057511A1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 22:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562791.879575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJg4U-0005qe-Md; Wed, 12 Jul 2023 20:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562791.879575; Wed, 12 Jul 2023 20:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJg4U-0005o7-Ig; Wed, 12 Jul 2023 20:04:22 +0000
Received: by outflank-mailman (input) for mailman id 562791;
 Wed, 12 Jul 2023 20:04:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cscr=C6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qJg4T-0004Xs-Kt
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 20:04:21 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49c476a1-20ef-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 22:04:21 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36CK4B1W091933
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 12 Jul 2023 16:04:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36CK4BC3091932;
 Wed, 12 Jul 2023 13:04:11 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 49c476a1-20ef-11ee-b239-6b7b168915f2
Message-Id: <880212ac370425389688f8b4fef2fd27c4fba446.1689191941.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689191941.git.ehem+xen@m5p.com>
References: <cover.1689191941.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Fri, 17 Mar 2023 12:53:32 -0700
Subject: [PATCH v3 3/3] x86/APIC: adjustments to error_interrupt() loop
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

ARRAY_SIZE() makes future maintainance easier and thus less likely for
bugs to occur.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
v2:
        Breaking this miniscule tidbit off.
---
 xen/arch/x86/apic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 5b830b2312..18ceb35e34 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1412,7 +1412,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
     };
     const char *entries[ARRAY_SIZE(esr_fields)];
     unsigned int v, v1;
-    int i;
+    unsigned int i;
 
     /* First tickle the hardware, only then report what went on. -- REW */
     v = apic_read(APIC_ESR);
@@ -1420,7 +1420,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
     v1 = apic_read(APIC_ESR);
     ack_APIC_irq();
 
-    for ( i = 7; i >= 0; --i )
+    for ( i = 0; i < ARRAY_SIZE(entries); ++i )
         entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
     printk(XENLOG_DEBUG "APIC error on CPU%u: %02x(%02x)"
         "%s%s%s%s%s%s%s%s" "\n",
-- 
2.30.2


