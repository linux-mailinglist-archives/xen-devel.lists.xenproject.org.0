Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682C945C99
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 12:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770968.1181548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpxT-00028u-8t; Fri, 02 Aug 2024 10:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770968.1181548; Fri, 02 Aug 2024 10:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZpxT-00026v-63; Fri, 02 Aug 2024 10:56:27 +0000
Received: by outflank-mailman (input) for mailman id 770968;
 Fri, 02 Aug 2024 10:56:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZpxR-00023m-MX
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 10:56:25 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc06f410-50bd-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 12:56:24 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-44ff6f3c427so38023161cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 03:56:24 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c7977cbsm5886376d6.43.2024.08.02.03.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 03:56:22 -0700 (PDT)
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
X-Inumbo-ID: dc06f410-50bd-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722596183; x=1723200983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJejKKDmLBL4QGQ2wyHF/zzRoWY9S5VJQkv71rHdd/c=;
        b=jja2gxz5P6enJvxxSBtZq/73pLSUdWFpewPqdf78wQbGIdeI3uCsyPiZkwtodmq2e4
         80voygdCR2xZ7DmSnuj23LPpHby7VMGZCDPEVsZXeoHYYfUspN1S/TKnk8IaB4VAlZWd
         rl3PMpqQo4hoaYJaQfr4pTL0papvf4egwnljI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596183; x=1723200983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJejKKDmLBL4QGQ2wyHF/zzRoWY9S5VJQkv71rHdd/c=;
        b=UAKQ3JfuTzSfYDcouvfdKHV0k0GV2ZDCVFhUw/XWSFyGkCoUJ+MdwoM+5Xm/bJBJmk
         B3CjY7FsYhwjurPxg95MmFNEfQMeVRxQYBveJ9Njbl6olVQwa5clJz7HKyZdJF4J2h2X
         lOWxm1ScpQs0TccTInTGfeAl4H7wayTGZLC/GT09kEc5QV34dRI/yG3paBPCcO7Jr/XB
         5zyFNLOW1a0rbHajDUsbhl/T36X2vrVqI2euc7buz9dMO8XT0+wiEe/g82WLHykXthiC
         R6wmpfv4tsXFUHG8zeKrUj6YaAFy1pprKahSgx/HjbYufHbOFdf6CsTZSQZJ5+ITfS9k
         0Jpw==
X-Gm-Message-State: AOJu0Yw/b0haApJ3ad83btfV95ufo/Xjjxz6b8UQhB9V96vc4zp0YBOs
	9HM+W8cgPBZ8EdY0mEc58GDusGupDKuOcf98uIWLtzrz6hW/EBkSe6GrPQyZdjJStTY/I4FGAgu
	+
X-Google-Smtp-Source: AGHT+IGrm6c1AIDBFSqUoa63EhtpNVe/ftxmWHGfK/r2xxp8JHWwhzn+6deEyuq+GUxzaNO3PFMWlw==
X-Received: by 2002:a05:6214:3d9c:b0:6b5:db9e:2c73 with SMTP id 6a1803df08f44-6bb98379c0amr42929416d6.10.1722596183117;
        Fri, 02 Aug 2024 03:56:23 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4] x86/shutdown: change default reboot method preference
Date: Fri,  2 Aug 2024 12:56:13 +0200
Message-ID: <20240802105613.99197-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic to chose the preferred reboot method is based on the mode Xen
has been booted into, so if the box is booted from UEFI, the preferred reboot
method will be to use the ResetSystem() run time service call.

However, that method seems to be widely untested, and quite often leads to a
result similar to:

Hardware Dom0 shutdown: rebooting machine
----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    0
RIP:    e008:[<0000000000000017>] 0000000000000017
RFLAGS: 0000000000010202   CONTEXT: hypervisor
[...]
Xen call trace:
   [<0000000000000017>] R 0000000000000017
   [<ffff83207eff7b50>] S ffff83207eff7b50
   [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
   [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
   [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
   [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
   [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
   [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
   [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
   [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
   [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee

****************************************
Panic on CPU 0:
FATAL TRAP: vector = 6 (invalid opcode)
****************************************

Which in most cases does lead to a reboot, however that's unreliable.

Change the default reboot preference to prefer ACPI over UEFI if available and
not in reduced hardware mode.

This is in line to what Linux does, so it's unlikely to cause issues on current
and future hardware, since there's a much higher chance of vendors testing
hardware with Linux rather than Xen.

Add a special case for one Acer model that does require being rebooted using
ResetSystem().  See Linux commit 0082517fa4bce for rationale.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes since v3:
 - Add changelog entry.

Changes since v2:
 - Rebase and remove incorrect paragraph from the commit message.

Changes since v1:
 - Add special case for Acer model to use UEFI reboot.
 - Adjust commit message.
---
 CHANGELOG.md            |  2 ++
 xen/arch/x86/shutdown.c | 19 +++++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index eeaaa8b2741d..5521ae5bb37a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.20.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - On x86:
+   - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
 
 ### Added
 
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index acceec2a385d..fa60d1638d58 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -150,19 +150,20 @@ static void default_reboot_type(void)
 
     if ( xen_guest )
         reboot_type = BOOT_XEN;
+    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
+        reboot_type = BOOT_ACPI;
     else if ( efi_enabled(EFI_RS) )
         reboot_type = BOOT_EFI;
-    else if ( acpi_disabled )
-        reboot_type = BOOT_KBD;
     else
-        reboot_type = BOOT_ACPI;
+        reboot_type = BOOT_KBD;
 }
 
 static int __init cf_check override_reboot(const struct dmi_system_id *d)
 {
     enum reboot_type type = (long)d->driver_data;
 
-    if ( type == BOOT_ACPI && acpi_disabled )
+    if ( (type == BOOT_ACPI && acpi_disabled) ||
+         (type == BOOT_EFI && !efi_enabled(EFI_RS)) )
         type = BOOT_KBD;
 
     if ( reboot_type != type )
@@ -172,6 +173,7 @@ static int __init cf_check override_reboot(const struct dmi_system_id *d)
             [BOOT_KBD]  = "keyboard controller",
             [BOOT_ACPI] = "ACPI",
             [BOOT_CF9]  = "PCI",
+            [BOOT_EFI]  = "UEFI",
         };
 
         reboot_type = type;
@@ -492,6 +494,15 @@ static const struct dmi_system_id __initconstrel reboot_dmi_table[] = {
             DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
             DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740")),
     },
+    {    /* Handle problems with rebooting on Acer TravelMate X514-51T. */
+        .callback = override_reboot,
+        .driver_data = (void *)(long)BOOT_EFI,
+        .ident = "Acer TravelMate X514-51T",
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+            DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T"),
+        },
+    },
     { }
 };
 
-- 
2.45.2


