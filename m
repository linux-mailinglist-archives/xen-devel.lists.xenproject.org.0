Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668CE2954AD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 00:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10144.26834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMM1-0006YY-64; Wed, 21 Oct 2020 22:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10144.26834; Wed, 21 Oct 2020 22:13:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMM1-0006Y9-2I; Wed, 21 Oct 2020 22:13:09 +0000
Received: by outflank-mailman (input) for mailman id 10144;
 Wed, 21 Oct 2020 22:13:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aWaT=D4=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kVMLz-0006Y4-AY
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:13:07 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79acf41-5742-430a-92ae-a722c85c6f90;
 Wed, 21 Oct 2020 22:13:06 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09LMCrQ2073233
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 21 Oct 2020 18:12:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09LMCr8q073232;
 Wed, 21 Oct 2020 15:12:53 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aWaT=D4=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kVMLz-0006Y4-AY
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:13:07 +0000
X-Inumbo-ID: a79acf41-5742-430a-92ae-a722c85c6f90
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a79acf41-5742-430a-92ae-a722c85c6f90;
	Wed, 21 Oct 2020 22:13:06 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09LMCrQ2073233
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 21 Oct 2020 18:12:59 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09LMCr8q073232;
	Wed, 21 Oct 2020 15:12:53 -0700 (PDT)
	(envelope-from ehem)
Date: Wed, 21 Oct 2020 15:12:53 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/acpi: Don't fail if SPCR table is absent
Message-ID: <20201021221253.GA73207@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Absence of a SPCR table likely means the console is a framebuffer.  In
such case acpi_iomem_deny_access() should NOT fail.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 xen/arch/arm/acpi/domain_build.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index 1b1cfabb00..bbdc90f92c 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -42,17 +42,18 @@ static int __init acpi_iomem_deny_access(struct domain *d)
     status = acpi_get_table(ACPI_SIG_SPCR, 0,
                             (struct acpi_table_header **)&spcr);
 
-    if ( ACPI_FAILURE(status) )
+    if ( ACPI_SUCCESS(status) )
     {
-        printk("Failed to get SPCR table\n");
-        return -EINVAL;
+        mfn = spcr->serial_port.address >> PAGE_SHIFT;
+        /* Deny MMIO access for UART */
+        rc = iomem_deny_access(d, mfn, mfn + 1);
+        if ( rc )
+            return rc;
+    }
+    else
+    {
+        printk("Failed to get SPCR table, Xen console may be unavailable\n");
     }
-
-    mfn = spcr->serial_port.address >> PAGE_SHIFT;
-    /* Deny MMIO access for UART */
-    rc = iomem_deny_access(d, mfn, mfn + 1);
-    if ( rc )
-        return rc;
 
     /* Deny MMIO access for GIC regions */
     return gic_iomem_deny_access(d);
-- 
2.20.1



-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



