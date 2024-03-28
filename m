Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1421D8903FF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699024.1091479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6p-00041A-2C; Thu, 28 Mar 2024 15:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699024.1091479; Thu, 28 Mar 2024 15:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rps6o-0003yE-VD; Thu, 28 Mar 2024 15:56:06 +0000
Received: by outflank-mailman (input) for mailman id 699024;
 Thu, 28 Mar 2024 15:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6n-0001AK-JL
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:05 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aee72dcc-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:05 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56c0bd07e7bso1371652a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:05 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 ev6-20020a056402540600b005682a0e915fsm970201edb.76.2024.03.28.08.56.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:04 -0700 (PDT)
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
X-Inumbo-ID: aee72dcc-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641364; x=1712246164; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL5eL7xorZDz2tK167vrCTC41p6AHRY9fWJiDBIL8BM=;
        b=aVmKDe9ABwAldbxQonVT5xEa/QK8aqCNX6AoDt3lDter6xtemBMaSXkhkzBiWs5oMV
         AwtXujfk58Af8yKkeS3OOe3WG8Y96uNE5cf7XrRiHzQIJ3+nds51B1IC1MHUHdxRJ2iD
         lRlZtOT8WoYNbOnZZOle9XX7Ie1Up15kZqDaQ3bd17BQaaL9vshvpwB+0EPohVGXC3Q0
         /2KtgFq+3zUwMyujuv0WFKVWn9T9adcbA8kwLs2Y9KBxhkLjHR5lXIypXy/IzF++MWik
         Z6m40BeUDYp1I9uhtVF34ap3QQicU6CyXhcyhauFaYhHGh3JvBrF5ERv023O2jxQm7Kc
         H5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641364; x=1712246164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL5eL7xorZDz2tK167vrCTC41p6AHRY9fWJiDBIL8BM=;
        b=UVxnldlrSDcjr/9FE9WvyoaL+OpSuHASJCeowaaQlSOUzDvu3zi0BTs5EMvCZ+b9XH
         Ht5lMLqsMuRfgpm8AcZ5sWwOQZfQwIf3cllYgxmjWOTDJIJlyX4p5jUZTBaIzly1iKYJ
         VGwPncYwrtLbKYDY5Lxt69vfTEBckXDAZ7g2j5tsrO9COHWGHKVvhq41wBO+/Y3pRByp
         7t09rFkXJ8M/lORGehjGi1W+6ajjTEGAjeBGRWbyQfoiLs1ujgkfK4+edmUDTk8CgW04
         ofkwS3tnK1ejM7Npl11Xk4pIBLPJXMMNs9cFgxE78JxclM/ZOo61JN+7VeoykyTH5UiT
         tFBw==
X-Forwarded-Encrypted: i=1; AJvYcCXdlWxlxbuq5uu6kESF72wddImOAZGQNkO9FBtu4/Y7JDkqq1U5vttc1edSzA8VbRJIVXhKu33Guu5ZiVpFLg2yvJvu2MrXNa3qcO6Tro8=
X-Gm-Message-State: AOJu0YxYETn/Aps2X07+W9ZF3Q4dFJx4ZblirEa1Bf6rgc6JVbpbNfAH
	Us7sSPycysGhZ43mdi68scEqu/c3XRstEYLYVIhdmaRh6JLf2Q4dxFoBDdUhBio=
X-Google-Smtp-Source: AGHT+IGYMyA4RPPygj+1esA4Svl7bwqA35pfEh79go4U6GODzZLQBPhA8oiV4mBtfx3NK33wxcn4Rg==
X-Received: by 2002:a50:d7d5:0:b0:56c:24e6:ca7e with SMTP id m21-20020a50d7d5000000b0056c24e6ca7emr2463412edj.2.1711641364572;
        Thu, 28 Mar 2024 08:56:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 13/29] hw/i386/pc: Remove non-PCI code from pc_system_firmware_init()
Date: Thu, 28 Mar 2024 16:54:21 +0100
Message-ID: <20240328155439.58719-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

x86_bios_rom_init() is the single non-PCI-machine call
from pc_system_firmware_init(). Extract it to the caller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c       | 6 +++++-
 hw/i386/pc_sysfw.c | 5 +----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index f184808e3e..5b96daa414 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -956,7 +956,11 @@ void pc_memory_init(PCMachineState *pcms,
     }
 
     /* Initialize PC system firmware */
-    pc_system_firmware_init(pcms, rom_memory);
+    if (pci_enabled) {
+        pc_system_firmware_init(pcms, rom_memory);
+    } else {
+        x86_bios_rom_init(machine, "bios.bin", rom_memory, true);
+    }
 
     option_rom_mr = g_malloc(sizeof(*option_rom_mr));
     memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SIZE,
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 862a082b0a..541dcaef71 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -202,10 +202,7 @@ void pc_system_firmware_init(PCMachineState *pcms,
     int i;
     BlockBackend *pflash_blk[ARRAY_SIZE(pcms->flash)];
 
-    if (!pc_machine_is_pci_enabled(pcms)) {
-        x86_bios_rom_init(MACHINE(pcms), "bios.bin", rom_memory, true);
-        return;
-    }
+    assert(pc_machine_is_pci_enabled(pcms));
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-- 
2.41.0


