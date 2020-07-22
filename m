Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7A168A11A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 19:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489313.757686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO0No-0004hP-Tb; Fri, 03 Feb 2023 18:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489313.757686; Fri, 03 Feb 2023 18:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pO0No-0004et-QY; Fri, 03 Feb 2023 18:01:56 +0000
Received: by outflank-mailman (input) for mailman id 489313;
 Fri, 03 Feb 2023 18:01:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hMIX=57=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pO0Nn-0004en-Ap
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 18:01:55 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d619a340-a3ec-11ed-933c-83870f6b2ba8;
 Fri, 03 Feb 2023 19:01:53 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 313I1SAE033265
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 3 Feb 2023 13:01:34 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 313I1SdK033264;
 Fri, 3 Feb 2023 10:01:28 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: d619a340-a3ec-11ed-933c-83870f6b2ba8
Message-Id: <202302031801.313I1SdK033264@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 22 Jul 2020 10:43:57 -0700
Subject: [PATCH] xen/arm64: Default ACPI support enabled
X-Spam-Status: No, score=2.5 required=10.0 tests=DATE_IN_PAST_96_XX,
	KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

Unlike other unsupportted options, ACPI support is required to *boot*
for a number of platforms.  Users on these platforms are unable to use
distribution builds and must rebuild from source to use Xen.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Stripping this down to near-minimum.  Previous similar commits had
included a message in dmesg, but the community call indicated doing near
the absolute minimum.

There was also a mention of potentially marking Xen as tainted in this
case.  That seems reasonable to me.  Just ACPI support needs to default
enabled now.
---
 xen/arch/arm/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..778bee5792 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -29,13 +29,18 @@ menu "Architecture Features"
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
+	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)"
 	depends on ARM_64
+	default y
 	---help---
 
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+	  Note this is presently UNSUPPORTED.  If a given device has both
+	  device-tree and ACPI support, it is presently (February 2023)
+	  recommended to boot using the device-tree.
+
 config ARM_EFI
 	bool
 
-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



