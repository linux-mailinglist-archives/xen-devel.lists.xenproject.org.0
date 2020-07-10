Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 415FF21B604
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 15:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtsoy-0007hV-Al; Fri, 10 Jul 2020 13:12:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6aM=AV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jtsow-0007gn-Or
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 13:12:06 +0000
X-Inumbo-ID: f0d071f6-c2ae-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0d071f6-c2ae-11ea-bb8b-bc764e2007e4;
 Fri, 10 Jul 2020 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594386722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nmb6NQAhCzH4JjUSe1UKDKjxPSYUFa2abwapsmcYj28=;
 b=ftZ7E5IhWP/oGVoTzEuI6PpBNSeAVf40WnBEnIa21ZQMfcsdfca1jMSq
 3YYoHqzerGdJGcJfFCEbk7Xls6GILGXtdDtJJjunh5NSgFy8jktx3bee4
 62yVCcvs1mnO+aJkH63Bd8Gpo5VxTWxf3jwlTYtpwhnlhzrjADylXzFlW s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6NtbgrUcwTzHphZC00mVAgYezMiyjPFVaIvLjrIxDt0uyB1mfUWbETZ8MXofdy7WWIP/f99xNK
 THx3E4q70CtUqwk7DEhBuLQ5EN+Vd5dShH2ZMpXq31yq04fTUSoQ+TEUzEZv3Hsok6uMchbEkG
 3B/9g1pXg+gnbkdS4YFQspoSpXHGkTe2erQGk6bGKF7GheyyiXAJwhhCVV86RYTlRexKmmmI9V
 4Ie535q++HE0g7oRpfQCaITPndOvHl5VrsgJIDHFdaIYc4rcoLKeqP1Dw2MdwYhpziBU1WOcFb
 /88=
X-SBRS: 2.7
X-MesageID: 22068708
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,335,1589256000"; d="scan'208";a="22068708"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 2/2] xen: cleanup unrealized flash devices
Date: Fri, 10 Jul 2020 14:11:45 +0100
Message-ID: <20200710131145.589476-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710131145.589476-1-anthony.perard@citrix.com>
References: <20200710131145.589476-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <pdurrant@amazon.com>,
 xen-devel@lists.xenproject.org
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
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200624121841.17971-3-paul@xen.org>
Fixes: dfe8c79c4468 ("qdev: Assert onboard devices all get realized properly")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/i386/pc_piix.c    | 9 ++++++---
 hw/i386/pc_sysfw.c   | 2 +-
 include/hw/i386/pc.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2bb42a814144..3469b1fd1072 100644
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
index ec2a3b3e7eff..0ff47a4b5915 100644
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
index a802e699749a..3d7ed3a55e30 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -186,6 +186,7 @@ ISADevice *pc_find_fdc0(void);
 
 /* pc_sysfw.c */
 void pc_system_flash_create(PCMachineState *pcms);
+void pc_system_flash_cleanup_unused(PCMachineState *pcms);
 void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 
 /* acpi-build.c */
-- 
Anthony PERARD


