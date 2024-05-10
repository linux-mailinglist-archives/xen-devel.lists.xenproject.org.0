Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468F38C2273
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719773.1122659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Np7-0001mn-63; Fri, 10 May 2024 10:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719773.1122659; Fri, 10 May 2024 10:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Np7-0001jx-1m; Fri, 10 May 2024 10:49:57 +0000
Received: by outflank-mailman (input) for mailman id 719773;
 Fri, 10 May 2024 10:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Np5-0007sQ-FV
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:55 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 092f1925-0ebb-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 12:49:54 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-350513d2c6aso461525f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:54 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbfecsm4215282f8f.105.2024.05.10.03.49.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:54 -0700 (PDT)
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
X-Inumbo-ID: 092f1925-0ebb-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338194; x=1715942994; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MMieI22tvUHRez0ASZq1ieLRFlQN49cydbbEGQRCXw=;
        b=IvOZucE8hH8TOcDSfuzDd82e9OeYpCLk4a8VDxP+3ybBISDaV33EnKG1lmBj4cmWV4
         u92uqVsh+MASZuM6GUrXRh9SJM4dyDiod5bFjPcMfoTL82szKrNn08kUYaiy/B+Iq4NO
         s+h/4FaPmdvQfPQ06JgKeRN8FpC94Li6fB0U7bWpYcsNOgqjuDyw49EIPC2zBAJdV7Yl
         1ezIzr952wrqZNv5qP9FsH14r0tauQf+h8nH0MAk8OI24xxgLQQ46mjZe/FMKWtY0IXh
         n6G60PaIVvefTSGhLF+f4/JoNmuybSvKnMZ1qoybm4l5bIe0JvwPoxdsTfqhGdzA5Dfx
         6WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338194; x=1715942994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MMieI22tvUHRez0ASZq1ieLRFlQN49cydbbEGQRCXw=;
        b=Gz7Z5ESAqEJWgPL8QbejG/75CdDwGlxSDET06Meov0CAb0G837HeQrbMU6AcIuddoh
         0ibHDreKTsdJa49JEXDJ/dOA50hg5Td2nUToVcbBQuAb2/lXUzb6CMQ2AfmBjPRw1yD9
         1qOs+iKEnVuoOayAWXZbiXPqqWc3Q7N/VPex9DjRhuDA73zFaOQ7d1S3DtNR9WEayL2K
         DdtyIYWgxvmmQtackt25IfTVDAOaiNvd4UMwJ1fOuEXDgW1EpnV4jyMDQHS4yWLaUmfS
         fpPWX8hNxC4+V/pt1nj3acESuDPBlVuhf5ZwhP+6dxcwcVeEakZwp886Rv1VozER3dH+
         3BKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2Ajy/OYd20dAqtzDhnnA4mnlKkYIM95pJb4EhL5T+w668AOXLXs1eFWRzhhEli8Txa0pXlNcBTz67urgRWMvqJNRB1177p4TxFwO72IQ=
X-Gm-Message-State: AOJu0Yy5oJ5QvTkviDG0hqTG98Bcu/fstJe40a1lCtU+Iz5fIGI219It
	ww7qibY365sc+ui1TlcXGYESk09WdZiSmQPA87vt3SGQNco36clewFwGOV3nEig=
X-Google-Smtp-Source: AGHT+IEewNU5yU5UDos2eDjrq2/6gYromkISrbJeR/i31/cfP+aw0nvt1M9WGWO7AigSVj0qKxcq5A==
X-Received: by 2002:adf:ef09:0:b0:34c:fd72:f308 with SMTP id ffacd0b85a97d-3504aa69de0mr1652917f8f.71.1715338194433;
        Fri, 10 May 2024 03:49:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/7] hw/xen: Register framebuffer backend via xen_backend_init()
Date: Fri, 10 May 2024 12:49:08 +0200
Message-ID: <20240510104908.76908-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Align the framebuffer backend with the other legacy ones,
register it via xen_backend_init() when '-vga xenfb' is
used. It is safe because MODULE_INIT_XEN_BACKEND is called
in xen_bus_realize(), long after CLI processing initialized
the vga_interface_type variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-legacy-backend.h | 3 ---
 hw/display/xenfb.c                  | 9 +++++++--
 hw/xenpv/xen_machine_pv.c           | 2 --
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index e55a14057f..943732b8d1 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -66,9 +66,6 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
     return xen_be_unmap_grant_refs(xendev, ptr, &ref, 1);
 }
 
-/* backend drivers not included in all machines */
-extern const struct XenDevOps xen_framebuffer_ops;  /* xenfb.c */
-
 /* configuration (aka xenbus setup) */
 void xen_config_cleanup(void);
 int xen_config_dev_vfb(int vdev, const char *type);
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index b6d370bdf6..ff442ced1a 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -29,6 +29,7 @@
 
 #include "ui/input.h"
 #include "ui/console.h"
+#include "sysemu/sysemu.h"
 #include "hw/xen/xen-legacy-backend.h"
 
 #include "hw/xen/interface/io/fbif.h"
@@ -996,8 +997,12 @@ static const GraphicHwOps xenfb_ops = {
     .ui_info     = xenfb_ui_info,
 };
 
-static void xen_vkbd_register_backend(void)
+static void xen_ui_register_backend(void)
 {
     xen_be_register("vkbd", &xen_kbdmouse_ops);
+
+    if (vga_interface_type == VGA_XENFB) {
+        xen_be_register("vfb", &xen_framebuffer_ops);
+    }
 }
-xen_backend_init(xen_vkbd_register_backend);
+xen_backend_init(xen_ui_register_backend);
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index b500ce0989..24395f42cb 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -50,8 +50,6 @@ static void xen_init_pv(MachineState *machine)
         break;
     }
 
-    xen_be_register("vfb", &xen_framebuffer_ops);
-
     /* configure framebuffer */
     if (vga_interface_type == VGA_XENFB) {
         xen_config_dev_vfb(0, "vnc");
-- 
2.41.0


