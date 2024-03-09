Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B4877386
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690971.1076688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hd-0001TV-Rr; Sat, 09 Mar 2024 19:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690971.1076688; Sat, 09 Mar 2024 19:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Hd-0001Rr-N6; Sat, 09 Mar 2024 19:23:01 +0000
Received: by outflank-mailman (input) for mailman id 690971;
 Sat, 09 Mar 2024 19:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2Hb-0001PG-TJ
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:22:59 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f7053c8-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:22:58 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51321e71673so3517333e87.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:22:57 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 24-20020a508e58000000b00566f92f1facsm1220206edx.36.2024.03.09.11.22.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:56 -0800 (PST)
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
X-Inumbo-ID: 6f7053c8-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012177; x=1710616977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TjXBOuAt82J0vCEpvih+prFEkSXa24TTOPlq290ir4=;
        b=dzI5nZudVzm/07E0dJ9+u14kaSFAahpYErUiYSNzNJhul0vvQZDBs9hXURwhEZIWAn
         ZuugjowlFPVIoz1DoWViIKiq99K2e9hBs7i8hM7F2YzZUAqgfwqUQP/92SW0Alin5WJA
         iSLk0EYLvMTuXYmVjXsCdsSMAmxTCcxLSLKNoEsU5jYVdrNSCUJh3A91GY2P8UtPxlX6
         6bAgRLxzE0sVEX+XRrFPda482zJI3JoYfHkp1dt29S9tZ0NNeEFvsZZVAKLB2jNc01LU
         8rZGOnbOgy2PMp6TJ/xDB2eVXgSyRPhhZybwL1JeOCRnXGL8TVuhi4Z+jjX0LcZg/+sS
         wSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012177; x=1710616977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TjXBOuAt82J0vCEpvih+prFEkSXa24TTOPlq290ir4=;
        b=XRMLEBxjYPXa0/+Whv56TeWKN1acN0fEWtZ0qj7lJTIYFvF7fF2siiGaW+3lI1xVGP
         gBKVN2AmnrRfc7dsrG4Ngujbo8Z87J1IaLHQCLIL2At0Udf34KQfe0MXO03fRn3D/fp1
         lUbY/mgfFLVDU8W+9qjUmgoNl25gVCSQ1Ll92HkSZefxcZjwUnBXdYtLGtMNZ4Ca63P8
         XXsvVu4/Dnc0uMsfULvZWaU3eMnUV39ktvNDlNu0SFJU1nb2562d+UxMeUVgr3IncOBR
         bSByvxzf65Qs5O5PiyGvANKkQYPvRYrM3CqvkADWTnYmjNVxx4D7fNejIq+4/Bja7l3u
         H0DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWunoYpHV5tDT7QbgJZDW7O5Ozc5o1hH0LKALvVRCHIvVVoxAqCX5HLAtq/fcNZ1LAtLMyj2/pjKas2f7fMa62LDaqpB/Z6PyZwuouI1yA=
X-Gm-Message-State: AOJu0YzKjwsgbjBMiQpxa5dd0qVs/F/ArWbypje2EZyg5ZfOq95WCBpZ
	pRpK6BbI0byag2fgBk61Ve9C0xBoJ2sK11HhhjPRH9QXBMUmn3gxg96kmdP0LHw=
X-Google-Smtp-Source: AGHT+IFu3iF5YfsPHFl4QgKzLThNg0KEglVlBZvKN0xPMmy0J9g6tryab3kSYkTuJAqwUaCGcPfaPg==
X-Received: by 2002:a19:ae17:0:b0:512:d6b6:dc44 with SMTP id f23-20020a19ae17000000b00512d6b6dc44mr1371505lfc.66.1710012177076;
        Sat, 09 Mar 2024 11:22:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PULL 07/43] hw/xen: Rename 'ram_memory' global variable as 'xen_memory'
Date: Sat,  9 Mar 2024 20:21:34 +0100
Message-ID: <20240309192213.23420-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To avoid a potential global variable shadow in
hw/i386/pc_piix.c::pc_init1(), rename Xen's
"ram_memory" as "xen_memory".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Message-Id: <20231114143816.71079-11-philmd@linaro.org>
---
 include/hw/xen/xen-hvm-common.h |  2 +-
 hw/arm/xen_arm.c                |  6 +++---
 hw/i386/xen/xen-hvm.c           | 10 +++++-----
 hw/xen/xen-hvm-common.c         |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
index 4b1d728f35..65a51aac2e 100644
--- a/include/hw/xen/xen-hvm-common.h
+++ b/include/hw/xen/xen-hvm-common.h
@@ -15,7 +15,7 @@
 #include "qemu/error-report.h"
 #include <xen/hvm/ioreq.h>
 
-extern MemoryRegion ram_memory;
+extern MemoryRegion xen_memory;
 extern MemoryListener xen_io_listener;
 extern DeviceListener xen_device_listener;
 
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 32776d94df..15fa7dfa84 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -114,14 +114,14 @@ static void xen_init_ram(MachineState *machine)
         block_len = GUEST_RAM1_BASE + ram_size[1];
     }
 
-    memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
+    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
 
-    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
+    memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &xen_memory,
                              GUEST_RAM0_BASE, ram_size[0]);
     memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
     if (ram_size[1] > 0) {
-        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memory,
+        memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &xen_memory,
                                  GUEST_RAM1_BASE, ram_size[1]);
         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
     }
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index f42621e674..1ae943370b 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -149,12 +149,12 @@ static void xen_ram_init(PCMachineState *pcms,
          */
         block_len = (4 * GiB) + x86ms->above_4g_mem_size;
     }
-    memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
+    memory_region_init_ram(&xen_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
-    *ram_memory_p = &ram_memory;
+    *ram_memory_p = &xen_memory;
 
     memory_region_init_alias(&ram_640k, NULL, "xen.ram.640k",
-                             &ram_memory, 0, 0xa0000);
+                             &xen_memory, 0, 0xa0000);
     memory_region_add_subregion(sysmem, 0, &ram_640k);
     /* Skip of the VGA IO memory space, it will be registered later by the VGA
      * emulated device.
@@ -163,12 +163,12 @@ static void xen_ram_init(PCMachineState *pcms,
      * the Options ROM, so it is registered here as RAM.
      */
     memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo",
-                             &ram_memory, 0xc0000,
+                             &xen_memory, 0xc0000,
                              x86ms->below_4g_mem_size - 0xc0000);
     memory_region_add_subregion(sysmem, 0xc0000, &ram_lo);
     if (x86ms->above_4g_mem_size > 0) {
         memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi",
-                                 &ram_memory, 0x100000000ULL,
+                                 &xen_memory, 0x100000000ULL,
                                  x86ms->above_4g_mem_size);
         memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
     }
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index baa1adb9f2..dc69cada57 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -9,7 +9,7 @@
 #include "hw/boards.h"
 #include "hw/xen/arch_hvm.h"
 
-MemoryRegion ram_memory;
+MemoryRegion xen_memory;
 
 void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
                    Error **errp)
@@ -26,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
         return;
     }
 
-    if (mr == &ram_memory) {
+    if (mr == &xen_memory) {
         return;
     }
 
@@ -53,7 +53,7 @@ static void xen_set_memory(struct MemoryListener *listener,
 {
     XenIOState *state = container_of(listener, XenIOState, memory_listener);
 
-    if (section->mr == &ram_memory) {
+    if (section->mr == &xen_memory) {
         return;
     } else {
         if (add) {
-- 
2.41.0


