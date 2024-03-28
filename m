Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C888904B4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699097.1091672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsNz-0001yi-6t; Thu, 28 Mar 2024 16:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699097.1091672; Thu, 28 Mar 2024 16:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsNz-0001v9-1k; Thu, 28 Mar 2024 16:13:51 +0000
Received: by outflank-mailman (input) for mailman id 699097;
 Thu, 28 Mar 2024 16:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps6P-00071m-6t
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:55:41 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fb6da5c-ed1b-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:55:39 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so154976866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:55:39 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170906254f00b00a473362062fsm894249ejb.220.2024.03.28.08.55.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:55:38 -0700 (PDT)
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
X-Inumbo-ID: 9fb6da5c-ed1b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641339; x=1712246139; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckSqN94Ak/AVFv4C8DP1wel6lx7UDcBC5ZVn+IWQ+zI=;
        b=VLRlRVMtsCcUj8gm8+ZKYALS4tR+eUM/GC7Qv6j7tfYWLou6mzrFCzuVd4GkTnG2sQ
         yZGN0XSDC8NdF2c30bDI6lLdOvVI8Vf/6FVMLWfCOperFm78Ht4JtorXTNlldTzOrs+l
         VcTIsZhTzQmH3ev64qwpYr0Gi1DveK/5aJcBbYk7wZYdEsx9/s8X0WjPKuCsLrde9AT3
         27++mK8lms3TKLIHY5K5hhSeCTFz3p2yjbsms/gIOb3WrnOPRQu8Q2IWT1kHRIqSK2Tt
         vA77yEuiin9tLxl2bc2XWAH97fMoxda/Kf6v6Nuir2DxPeTpZKLVJHNYWLtd40sqOYYi
         Sg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641339; x=1712246139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckSqN94Ak/AVFv4C8DP1wel6lx7UDcBC5ZVn+IWQ+zI=;
        b=Yo23aEZ2XT8NU/LqJ28+lAC7qJJlTHk3Ao3j7QtNQpfRHNbHEsEJx0R3iv2wp+2Yjt
         sKwd6BGjtiRL/CBYFwmrRYHgR/l7KhKYUzP1uComAQZDtOfJLdjaENPtWWVkjNLt2BVc
         WNktc9MQAVv6sQiqrlLB2NlB4k1j+uJ3mx3R/NaigeSL3DDFgoYXdfGhDUpJHmYygK+p
         70w819H7ECPrUN2koc80VkSZLHZhw4j0CfCJLRZLRXRsCSiDtb+5yqlfibIDOyuW3fDp
         TpsNSzFR+k1hkr7hsV9uJh7ye2vhx615TcLINUtdyGaBdNhkY1efvZ1fREH1QmrRUUMF
         3vXg==
X-Forwarded-Encrypted: i=1; AJvYcCVmogoDO5zf6jjyHtelA6BbNepygGlCJ8nX14oq4XoWBNHbXVguHuGQS7Yzu9R/thZpA+chOZj4i0pVbd+Vgrjt9+tQWqPKX5TRcUnu+a0=
X-Gm-Message-State: AOJu0YyqdpvbFGsXW9NKZpvU+aFg1Mw97w0/mGdUkmjRasOAFJ9kwb8Y
	99/C7UgoGFQOTcFnR+agWcHtUXH397HyffECR9wzx9FrSpaTbO2B4VS4Q2TRdtM=
X-Google-Smtp-Source: AGHT+IGwP6p/08zu3mCMRpeAkzfHcigXM/JR3t5dmiNwQCcEIbh+pOnBScYA897DxMkDTYP+GJc42Q==
X-Received: by 2002:a17:906:494f:b0:a47:4fed:514a with SMTP id f15-20020a170906494f00b00a474fed514amr1839620ejt.52.1711641339277;
        Thu, 28 Mar 2024 08:55:39 -0700 (PDT)
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
Subject: [RFC PATCH-for-9.1 09/29] hw/i386/pc: Pass PCMachineState argument to acpi_setup()
Date: Thu, 28 Mar 2024 16:54:17 +0100
Message-ID: <20240328155439.58719-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

acpi_setup() caller knows about the machine state, so pass
it as argument to avoid a qdev_get_machine() call.

We already resolved X86_MACHINE(pcms) as 'x86ms' so use the
latter.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-build.h | 3 ++-
 hw/i386/acpi-build.c | 5 ++---
 hw/i386/pc.c         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 0dce155c8c..31de5bddbd 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -2,6 +2,7 @@
 #ifndef HW_I386_ACPI_BUILD_H
 #define HW_I386_ACPI_BUILD_H
 #include "hw/acpi/acpi-defs.h"
+#include "hw/i386/pc.h"
 
 extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 
@@ -9,7 +10,7 @@ extern const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio;
 #define ACPI_PCIHP_SEJ_BASE 0x8
 #define ACPI_PCIHP_BNMR_BASE 0x10
 
-void acpi_setup(void);
+void acpi_setup(PCMachineState *pcms);
 Object *acpi_get_i386_pci_host(void);
 
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6e8e32e5d2..e702d5e9d2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2749,9 +2749,8 @@ static const VMStateDescription vmstate_acpi_build = {
     },
 };
 
-void acpi_setup(void)
+void acpi_setup(PCMachineState *pcms)
 {
-    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     X86MachineState *x86ms = X86_MACHINE(pcms);
     AcpiBuildTables tables;
     AcpiBuildState *build_state;
@@ -2771,7 +2770,7 @@ void acpi_setup(void)
         return;
     }
 
-    if (!x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
+    if (!x86_machine_is_acpi_enabled(x86ms)) {
         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6d87d1d4c2..dfc0247bb6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -601,7 +601,7 @@ void pc_machine_done(Notifier *notifier, void *data)
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
-    acpi_setup();
+    acpi_setup(pcms);
     if (x86ms->fw_cfg) {
         fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_point_type);
         fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
-- 
2.41.0


