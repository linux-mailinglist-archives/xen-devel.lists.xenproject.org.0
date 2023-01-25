Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC767B94C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 19:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484512.751117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKkUh-0002wq-DL; Wed, 25 Jan 2023 18:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484512.751117; Wed, 25 Jan 2023 18:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKkUh-0002ts-AQ; Wed, 25 Jan 2023 18:27:35 +0000
Received: by outflank-mailman (input) for mailman id 484512;
 Wed, 25 Jan 2023 18:27:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmdc=5W=citrix.com=prvs=382ccbc00=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1pKkUg-0002tm-6L
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 18:27:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecb563a4-9cdd-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 19:27:30 +0100 (CET)
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
X-Inumbo-ID: ecb563a4-9cdd-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674671250;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HfetvvXoeGVeKHCAxwKgly1dttDJk6a1tWc5GK5C/pM=;
  b=AYti+agZ6F8s41Az/zatDwRrVSMZUa3J05TWwHPF6Z8QsRhc5PUFgFnZ
   ftVXEubv8ZtxcIFf5jUsbkL+kmzkBzhsbmSHVdny0bpmUJ4F5MKfBQ41N
   czYrJH6Yvfulj1oMQdxbr0Pdj1s818/9YYVkpVvQVOMJ2qV4iaG0TH5To
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93141906
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wZ6azapJJBSffdgDS3PCTb5OmDleBmIQZRIvgKrLsJaIsI4StFCzt
 garIBmEaPnbambweIsgYIy1p0oOvcTUyIBmGVRvriFhRitGopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzSRNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACgHRRTfiMe6+qCQardMr+smJsa1I7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVgpUjTj6sz+GX7xw1tyrn9dtHSf7RmQO0ExR/E/
 zOeoQwVBDk8FMyykjy/ykuun9CevAbUdItDG5uno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WdBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cabwQAEQQg7+Pxi6FtrjvgS9xsTrGM24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9g4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlDboXEzPxXJhz69+KTJrU3YE
 c7LGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbafVs/QjFxUqONqV7jEqQ895loei7z1
 inVcidlJJDX3BUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:w+9ThalqSkUUTHuaRfT3qmK7PqHpDfIT3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8W3WBVB8bAYOCEggqVxeNZnO/fKlTbckWUygce78
 ddmsNFebrN5DZB/KDHCcqDf+rIAuPrzEllv4jjJr5WIz1XVw==
X-IronPort-AV: E=Sophos;i="5.97,246,1669093200"; 
   d="scan'208";a="93141906"
From: Per Bilse <per.bilse@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Per Bilse <per.bilse@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] Create a Kconfig option to set preferred reboot method
Date: Wed, 25 Jan 2023 18:27:06 +0000
Message-ID: <20230125182706.1480160-1-per.bilse@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Provide a user-friendly option to specify preferred reboot details at
compile time.  It uses the same internals as the command line 'reboot'
parameter, and will be overridden by a choice on the command line.

Signed-off-by: Per Bilse <per.bilse@citrix.com>
---
v2: Incorporate feedback from initial patch.  Separating out warm
reboot as a separate boolean led to a proliferation of code changes,
so we now use the details from Kconfig to assemble a reboot string
identical to what would be specified on the command line.  This leads
to minimal changes and additions to the code.
---
 xen/arch/x86/Kconfig    | 84 +++++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/shutdown.c | 30 ++++++++++++++-
 2 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba..b881a118f1 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -306,6 +306,90 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
+config REBOOT_SYSTEM_DEFAULT
+	bool "Xen-defined reboot method"
+	default y
+	help
+	  Xen will choose the most appropriate reboot method,
+	  which will be a Xen SCHEDOP hypercall if running as
+	  a Xen guest, otherwise EFI, ACPI, or by way of the
+	  keyboard controller, depending on system features.
+	  Disabling this will allow you to specify how the
+	  system will be rebooted.
+
+choice
+	bool "Reboot method"
+	depends on !REBOOT_SYSTEM_DEFAULT
+	default REBOOT_METHOD_ACPI
+	help
+	  This is a compiled-in alternative to specifying the
+	  reboot method on the Xen command line.  Specifying a
+	  method on the command line will override both this
+	  configuration and the warm boot option below.
+
+	  none    Suppress automatic reboot after panics or crashes
+	  triple  Force a triple fault (init)
+	  kbd     Use the keyboard controller
+	  acpi    Use the RESET_REG in the FADT
+	  pci     Use the so-called "PCI reset register", CF9
+	  power   Like 'pci' but for a full power-cyle reset
+	  efi     Use the EFI reboot (if running under EFI)
+	  xen     Use Xen SCHEDOP hypercall (if running under Xen as a guest)
+
+	config REBOOT_METHOD_NONE
+	bool "none"
+
+	config REBOOT_METHOD_TRIPLE
+	bool "triple"
+
+	config REBOOT_METHOD_KBD
+	bool "kbd"
+
+	config REBOOT_METHOD_ACPI
+	bool "acpi"
+
+	config REBOOT_METHOD_PCI
+	bool "pci"
+
+	config REBOOT_METHOD_POWER
+	bool "power"
+
+	config REBOOT_METHOD_EFI
+	bool "efi"
+
+	config REBOOT_METHOD_XEN
+	bool "xen"
+	depends on !XEN_GUEST
+
+endchoice
+
+config REBOOT_METHOD
+	string
+	default "none"   if REBOOT_METHOD_NONE
+	default "triple" if REBOOT_METHOD_TRIPLE
+	default "kbd"    if REBOOT_METHOD_KBD
+	default "acpi"   if REBOOT_METHOD_ACPI
+	default "pci"    if REBOOT_METHOD_PCI
+	default "Power"  if REBOOT_METHOD_POWER
+	default "efi"    if REBOOT_METHOD_EFI
+	default "xen"    if REBOOT_METHOD_XEN
+
+config REBOOT_WARM
+	bool "Warm reboot"
+	default n
+	help
+	  By default the system will perform a cold reboot.
+	  Enable this to carry out a warm reboot.  This
+	  configuration will have no effect if a "reboot="
+	  string is supplied on the Xen command line; in this
+	  case the reboot string must include "warm" if a warm
+	  reboot is desired.
+
+config REBOOT_TEMPERATURE
+	string
+	default "warm" if REBOOT_WARM
+	default "cold" if !REBOOT_WARM && !REBOOT_SYSTEM_DEFAULT
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 7619544d14..4969af1316 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -28,6 +28,19 @@
 #include <asm/apic.h>
 #include <asm/guest.h>
 
+/*
+ * We don't define a compiled-in reboot string if both method and
+ * temperature are defaults, in which case we can compile better code.
+ */
+#ifdef CONFIG_REBOOT_METHOD
+#define REBOOT_STR CONFIG_REBOOT_METHOD "," CONFIG_REBOOT_TEMPERATURE
+#else
+#ifdef CONFIG_REBOOT_TEMPERATURE
+#define REBOOT_STR CONFIG_REBOOT_TEMPERATURE
+#endif
+#endif
+
+/* Do not modify without updating arch/x86/Kconfig, see below. */
 enum reboot_type {
         BOOT_INVALID,
         BOOT_TRIPLE = 't',
@@ -42,10 +55,13 @@ enum reboot_type {
 static int reboot_mode;
 
 /*
- * reboot=t[riple] | k[bd] | a[cpi] | p[ci] | n[o] | [e]fi [, [w]arm | [c]old]
+ * These constants are duplicated in full in arch/x86/Kconfig, keep in synch.
+ *
+ * reboot=t[riple] | k[bd] | a[cpi] | p[ci] | P[ower] | n[one] | [e]fi
+ *                                                     [, [w]arm | [c]old]
  * warm   Don't set the cold reboot flag
  * cold   Set the cold reboot flag
- * no     Suppress automatic reboot after panics or crashes
+ * none   Suppress automatic reboot after panics or crashes
  * triple Force a triple fault (init)
  * kbd    Use the keyboard controller. cold reset (default)
  * acpi   Use the RESET_REG in the FADT
@@ -56,7 +72,12 @@ static int reboot_mode;
  */
 static enum reboot_type reboot_type = BOOT_INVALID;
 
+/* If we don't have a compiled-in boot string, we won't call after start-up. */
+#ifndef REBOOT_STR
 static int __init cf_check set_reboot_type(const char *str)
+#else
+static int cf_check set_reboot_type(const char *str)
+#endif
 {
     int rc = 0;
 
@@ -145,6 +166,11 @@ void machine_halt(void)
 
 static void default_reboot_type(void)
 {
+#ifdef REBOOT_STR
+    if ( reboot_type == BOOT_INVALID )
+        set_reboot_type(REBOOT_STR);
+#endif
+
     if ( reboot_type != BOOT_INVALID )
         return;
 
-- 
2.31.1


