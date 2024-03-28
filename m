Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178B8904A7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699087.1091636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsLc-000871-4C; Thu, 28 Mar 2024 16:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699087.1091636; Thu, 28 Mar 2024 16:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsLc-00084R-11; Thu, 28 Mar 2024 16:11:24 +0000
Received: by outflank-mailman (input) for mailman id 699087;
 Thu, 28 Mar 2024 16:11:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7i-00071m-FZ
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:57:02 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0226048-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:57:00 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4a3a5e47baso151644966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:57:00 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 c7-20020a170906340700b00a468bf8586bsm906768ejb.174.2024.03.28.08.56.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:57:00 -0700 (PDT)
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
X-Inumbo-ID: d0226048-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641420; x=1712246220; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBrGlAtp7IiqJxUt6Mnv7AOEnMWPJd0FVBqTzh3q09E=;
        b=fTbQNm9sC7hP8TvZo64yoh7W9+gUa+lbBeORV82mRt3yUz/o/duVFycfCZ1f6Wj6nB
         7V/Ald3tAKZudYvMf22AUcTS03diJ8pL17CEZ2rhr+Dy+mj6jtKToBHnj7ZXcn3T/M0x
         aftZNNVLh3h3fYF/YWvT4Hvd5UpefSfJMxvTDZIenokHCNpCbf+CSFgsWgqQnnstY7db
         OeqCQqucYsHxo1wJPnhliZ+bil3zOnf2OstRHXYQslpkF2ev4/RlHr8ziopGAgSuvUjo
         FllNj19qYKn+1jRDIqZr38fF/mlovjfWuGdf4DFfE0YJC+toLQWFeUPXYa5d1IZ1bztP
         +oAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641420; x=1712246220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBrGlAtp7IiqJxUt6Mnv7AOEnMWPJd0FVBqTzh3q09E=;
        b=ubpx2/goAZ6eY9QA6RsZmdEQPTsORe97V3KDyAdIxSsboJ/91E8DCyk5UBQM2jl1dI
         kjHQpbGctMFIc4XuFHk5ftDmqZlh1GrTPlmYmdHNYHn13ZwgTfb3hS+IYwAx7BdpjKpe
         R9cmyCe1C2SDmYNlI4x1jXYnC13Z/KI05IognC2K0H+BePNIQjNrFRgp7+KolrZTeorI
         g7IbzjEH84r5by2aOtLeeBods1fVMLOIdP+y8CrvFjggt+wjZcpkLYJX48BjM7ZSrV6w
         swmz9UYlHEnYnygpF/pFJG9B8boU8lEj6TU7NfY40c8S1MsGQhY/T2gAsx0Uo7DGR9SK
         nj8A==
X-Forwarded-Encrypted: i=1; AJvYcCXweWtMCP5oXfAqCvJ1NyZ1+VRR3KaQOgUiQMHYtE8MIobwr4pAKmmNj3QRurUauIzT2QZeuA42Eee/sIcfInKNE2fUAYFK94SFAbcN6Jw=
X-Gm-Message-State: AOJu0Ywo58zhqzEHQzo3qzfUATk0e1L6vAFBgPlE+eDx932nrKjfqmq9
	kQapS+8moCHkejO+ulPK1rjs6hm4jSlbs3l6B4BD9aobRJwDSHpXZ8keLZg/eTw=
X-Google-Smtp-Source: AGHT+IEOvg34oYcu9GAIHQIWSpLYGC94raSmAj67zD4Gs/B4BPRdpoH1JkHeTSn1iij0r48HVMXasQ==
X-Received: by 2002:a17:906:3289:b0:a46:420f:8ecb with SMTP id 9-20020a170906328900b00a46420f8ecbmr1904346ejw.62.1711641420490;
        Thu, 28 Mar 2024 08:57:00 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 22/29] hw/i386/fw_cfg: Define fw_cfg_build_smbios() stub
Date: Thu, 28 Mar 2024 16:54:30 +0100
Message-ID: <20240328155439.58719-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are going to refactor fw_cfg_build_smbios() in the
next patches. In order to avoid too much #ifdef'ry in
it, define a stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/fw_cfg-smbios-stub.c | 15 +++++++++++++++
 hw/i386/fw_cfg.c             |  4 ++--
 hw/i386/meson.build          |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 hw/i386/fw_cfg-smbios-stub.c

diff --git a/hw/i386/fw_cfg-smbios-stub.c b/hw/i386/fw_cfg-smbios-stub.c
new file mode 100644
index 0000000000..37dbfdee7c
--- /dev/null
+++ b/hw/i386/fw_cfg-smbios-stub.c
@@ -0,0 +1,15 @@
+/*
+ * QEMU fw_cfg/SMBIOS stubs
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/firmware/smbios.h"
+#include "fw_cfg.h"
+
+void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
+                         SmbiosEntryPointType ep_type)
+{
+}
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index ecc4047a4b..14a7dfbdc9 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -48,10 +48,10 @@ const char *fw_cfg_arch_key_name(uint16_t key)
     return NULL;
 }
 
+#ifdef CONFIG_SMBIOS
 void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                          SmbiosEntryPointType ep_type)
 {
-#ifdef CONFIG_SMBIOS
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     struct smbios_phys_mem_area *mem_array;
@@ -100,8 +100,8 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
         fw_cfg_add_file(fw_cfg, "etc/smbios/smbios-anchor",
                         smbios_anchor, smbios_anchor_len);
     }
-#endif
 }
+#endif
 
 FWCfgState *fw_cfg_arch_create(MachineState *ms,
                                       uint16_t boot_cpus,
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index d8b70ef3e9..1a6e731196 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -6,6 +6,7 @@ i386_ss.add(files(
   'multiboot.c',
   'x86.c',
 ))
+i386_ss.add(when: 'CONFIG_SMBIOS', if_false: files('fw_cfg-smbios-stub.c'))
 
 i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
                                       if_false: files('x86-iommu-stub.c'))
-- 
2.41.0


