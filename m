Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6D20732B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:19:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4Mg-00069Z-B8; Wed, 24 Jun 2020 12:18:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b8vz=AF=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jo4Me-00067X-Tn
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:18:52 +0000
X-Inumbo-ID: dab1d4f6-b614-11ea-80a5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dab1d4f6-b614-11ea-80a5-12813bfff9fa;
 Wed, 24 Jun 2020 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WmkzEFnsGIT7sjSL+1trW0fIwoGyCpkoOnXxvyuh+2I=; b=IMWSEnAp8h0F/2AJelrjK/lD5Y
 XytjbgEbImgRnLyGQ1m8zFKYjRqaaP1EodKbhHxbGcHS3a6n26wzRt057a6vY5aGHuLNVPhaWrr58
 DzqCQmQuICWD58fsq5dry+Lf4PBdal4NM1X+u+cyrn22+nVRmKBWVY0Ggj1hrWaINn34=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MY-0000gH-PN; Wed, 24 Jun 2020 12:18:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jo4MY-0005fi-Gg; Wed, 24 Jun 2020 12:18:46 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] xen: cleanup unrealized flash devices
Date: Wed, 24 Jun 2020 13:18:41 +0100
Message-Id: <20200624121841.17971-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200624121841.17971-1-paul@xen.org>
References: <20200624121841.17971-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <pdurrant@amazon.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The generic pc_machine_initfn() calls pc_system_flash_create() which creates
'system.flash0' and 'system.flash1' devices. These devices are then realized
by pc_system_flash_map() which is called from pc_system_firmware_init() which
itself is called via pc_memory_init(). The latter however is not called when
xen_enable() is true and hence the following assertion fails:

qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
Assertion `dev->realized' failed

These flash devices are unneeded when using Xen so this patch avoids the
assertion by simply removing them using pc_system_flash_cleanup_unused().

Reported-by: Jason Andryuk <jandryuk@gmail.com>
Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -blockdev")
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/i386/pc_piix.c    | 9 ++++++---
 hw/i386/pc_sysfw.c   | 2 +-
 include/hw/i386/pc.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1497d0e4ae..977d40afb8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
     if (!xen_enabled()) {
         pc_memory_init(pcms, system_memory,
                        rom_memory, &ram_memory);
-    } else if (machine->kernel_filename != NULL) {
-        /* For xen HVM direct kernel boot, load linux here */
-        xen_load_linux(pcms);
+    } else {
+        pc_system_flash_cleanup_unused(pcms);
+        if (machine->kernel_filename != NULL) {
+            /* For xen HVM direct kernel boot, load linux here */
+            xen_load_linux(pcms);
+        }
     }
 
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index ec2a3b3e7e..0ff47a4b59 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState *pcms)
     }
 }
 
-static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
+void pc_system_flash_cleanup_unused(PCMachineState *pcms)
 {
     char *prop_name;
     int i;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index e6135c34d6..497f2b7ab7 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
 
 /* pc_sysfw.c */
 void pc_system_flash_create(PCMachineState *pcms);
+void pc_system_flash_cleanup_unused(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 
 /* acpi-build.c */
-- 
2.20.1


