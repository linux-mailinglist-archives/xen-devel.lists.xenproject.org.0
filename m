Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E292968D4
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 05:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10678.28520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVnrO-0000hh-Pe; Fri, 23 Oct 2020 03:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10678.28520; Fri, 23 Oct 2020 03:35:22 +0000
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
	id 1kVnrO-0000hI-MQ; Fri, 23 Oct 2020 03:35:22 +0000
Received: by outflank-mailman (input) for mailman id 10678;
 Fri, 23 Oct 2020 03:35:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yA4w=D6=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kVnrM-0000hD-N1
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 03:35:20 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c52b60c9-6201-4adb-839c-9d949dde7327;
 Fri, 23 Oct 2020 03:35:19 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09N3Z6vb085398
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 22 Oct 2020 23:35:12 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09N3Z6uK085397;
 Thu, 22 Oct 2020 20:35:06 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yA4w=D6=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kVnrM-0000hD-N1
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 03:35:20 +0000
X-Inumbo-ID: c52b60c9-6201-4adb-839c-9d949dde7327
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c52b60c9-6201-4adb-839c-9d949dde7327;
	Fri, 23 Oct 2020 03:35:19 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09N3Z6vb085398
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 22 Oct 2020 23:35:12 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09N3Z6uK085397;
	Thu, 22 Oct 2020 20:35:06 -0700 (PDT)
	(envelope-from ehem)
Date: Thu, 22 Oct 2020 20:35:06 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: ACPI: Remove EXPERT dependancy, default on for ARM64
Message-ID: <20201023033506.GC83870@mattapan.m5p.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

Linux requires UEFI support to be enabled on ARM64 devices.  While many
ARM64 devices lack ACPI, the writing seems to be on the wall of UEFI/ACPI
potentially taking over.  Some common devices may require ACPI table
support to boot.

For devices which can boot in either mode, continue defaulting to
device-tree.  Add warnings about using ACPI advising users of present
situation.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
Okay, hopefully this is okay.  Warning in Kconfig, warning on boot.
Perhaps "default y if ARM_64" is redundant, yet if someone tries to make
it possible to boot aarch32 on a ACPI machine...

I also want a date in the message.  Theory is this won't be there
forever, so a date is essential.
---
 xen/arch/arm/Kconfig     | 7 ++++++-
 xen/arch/arm/acpi/boot.c | 9 +++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2777388265..29624d03fa 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -32,13 +32,18 @@ menu "Architecture Features"
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
+	bool "ACPI (Advanced Configuration and Power Interface) Support"
 	depends on ARM_64
+	default y if ARM_64
 	---help---
 
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+	  Note this is presently EXPERIMENTAL.  If a given device has both
+	  device-tree and ACPI support, it is presently (October 2020)
+	  recommended to boot using the device-tree.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
index 30e4bd1bc5..c0e8f85325 100644
--- a/xen/arch/arm/acpi/boot.c
+++ b/xen/arch/arm/acpi/boot.c
@@ -254,6 +254,15 @@ int __init acpi_boot_table_init(void)
                                    dt_scan_depth1_nodes, NULL) )
         goto disable;
 
+    printk("\n"
+"*************************************************************************\n"
+"*    WARNING WARNING WARNING WARNING WARNING WARNING WARNING WARNING    *\n"
+"*                                                                       *\n"
+"* Xen-ARM ACPI support is EXPERIMENTAL.  It is presently (October 2020) *\n"
+"* recommended you boot your system in device-tree mode if you can.      *\n"
+"*************************************************************************\n"
+            "\n");
+
     /*
      * ACPI is disabled at this point. Enable it in order to parse
      * the ACPI tables.
-- 
2.20.1


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



