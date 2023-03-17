Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7675119F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 22:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562763.879555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJg3K-0004hA-4s; Wed, 12 Jul 2023 20:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562763.879555; Wed, 12 Jul 2023 20:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJg3K-0004ej-0v; Wed, 12 Jul 2023 20:03:10 +0000
Received: by outflank-mailman (input) for mailman id 562763;
 Wed, 12 Jul 2023 20:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cscr=C6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qJg3I-00047T-2t
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 20:03:08 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d2ccd96-20ef-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 22:03:06 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36CK2uW8091908
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 12 Jul 2023 16:03:02 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36CK2ueX091907;
 Wed, 12 Jul 2023 13:02:56 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1d2ccd96-20ef-11ee-8611-37d641c3527e
Message-Id: <062ed51e7529d282b6e336c8b62734afaf21979f.1689191941.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1689191941.git.ehem+xen@m5p.com>
References: <cover.1689191941.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>
Date: Fri, 17 Mar 2023 12:45:41 -0700
Subject: [PATCH v3 1/3] x86/APIC: include full string with error_interrupt()
 error messages
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Rather than adding ", " with each printf(), simply include them in the
string initially.  This allows converting to strlcat() or other methods
which strictly concatenate, rather than formatting.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
v2:
        One more sentence in the commit message.
---
 xen/arch/x86/apic.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index f71474d47d..8cfb8cd71c 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1401,14 +1401,14 @@ static void cf_check spurious_interrupt(struct cpu_user_regs *regs)
 static void cf_check error_interrupt(struct cpu_user_regs *regs)
 {
     static const char *const esr_fields[] = {
-        "Send CS error",
-        "Receive CS error",
-        "Send accept error",
-        "Receive accept error",
-        "Redirectable IPI",
-        "Send illegal vector",
-        "Received illegal vector",
-        "Illegal register address",
+        ", Send CS error",
+        ", Receive CS error",
+        ", Send accept error",
+        ", Receive accept error",
+        ", Redirectable IPI",
+        ", Send illegal vector",
+        ", Received illegal vector",
+        ", Illegal register address",
     };
     unsigned int v, v1;
     int i;
@@ -1423,7 +1423,7 @@ static void cf_check error_interrupt(struct cpu_user_regs *regs)
             smp_processor_id(), v , v1);
     for ( i = 7; i >= 0; --i )
         if ( v1 & (1 << i) )
-            printk(", %s", esr_fields[i]);
+            printk("%s", esr_fields[i]);
     printk("\n");
 }
 
-- 
2.30.2


