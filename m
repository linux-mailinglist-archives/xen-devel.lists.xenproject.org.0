Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FEFAD91D4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014627.1392742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eK-0006zx-Qu; Fri, 13 Jun 2025 15:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014627.1392742; Fri, 13 Jun 2025 15:49:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eK-0006vg-IF; Fri, 13 Jun 2025 15:49:00 +0000
Received: by outflank-mailman (input) for mailman id 1014627;
 Fri, 13 Jun 2025 15:48:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eJ-0006cn-HU
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:48:59 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eacbe99d-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:48:57 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ade58ef47c0so457361566b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:48:57 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:48:56 -0700 (PDT)
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
X-Inumbo-ID: eacbe99d-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829737; x=1750434537; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6A8r2DsEy0IO5GoSvvpcCWrmAlrTSeNGBRJKoWIeJE=;
        b=NebhAuNT1GH8t3ne8wvXlvR4xQfXK6UGdFjsO1Lw3xeK4SOmS09+33Y56RzDrbWaPV
         pfFA04R/LzvmvzkDW0FulT/zz0gpkHgkkK14Gwo4EjX15vPCuoCX/2lKrS268qe5lHJM
         SLpjL/YfXxKihQTsl3p/kIdMeET7F23llSRo2IdNfjn+BLHxpECPzjqI4/97A9vE1CH+
         M1PXgrWgXkmYv613oOWAPz1VPIiXSFHbAVCqJjJEvLvKa764oL9I5vzi8+IgqCjgKjMb
         azUvzCLaj7YxLy3GTyv0VlZk0Rblsi0FIrMGg89VP2bQh31kuFsBE29lTlI2rojLwDfU
         goQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829737; x=1750434537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6A8r2DsEy0IO5GoSvvpcCWrmAlrTSeNGBRJKoWIeJE=;
        b=Y0VCCi3BJxn0u9mJ3AqYn1bpSP6d/TBhH1uMLxi8TsnOlh2wmqi3d6l4dmZqgmSuTo
         /MN95Ba8tjqS08CUIEgzMKgPwUxKDcPqJmpYQvStiUpfXKg1i+y8uDmUh9v2FV59rirH
         EDGRY/vRMZgQAnVaEqdB2ORArkhAZmTdsM6AUABP6VLdDNMlpgqGlSpye2OH+QpqjHBE
         oMXa4A0w8d5IDqMbZbWCBVkhAkX0GKzZeipUhn1S7a92HjH8UbhFR6ArMMZVx6kQyzPU
         JSNAd499MZVKiug8fz3SpxcYb3VPHCAAvEbCky6VmQsCNEz/rlhoNWwNETXorcGH4aAL
         rGtQ==
X-Gm-Message-State: AOJu0Yz6fyxVHOZ4S0W8gHXICQ3DENcKBXDe4OnX785J+dY/L8W8jx8W
	gqtwwpnfwPLYS+nUMw8TtwgogSJJWgg1qWXV3hhY+jXemBIB010kGX73VEroXA==
X-Gm-Gg: ASbGncs1JXY4GKzauoaH+F/aotkRCi1hZLosXkpRE1RjXsgzv8/NOKKjoLi/Xe2QMYZ
	RFvLRoRcHEr4oVAJd+HfiVtYTMilKRcp5sOtVyEYGdUXZzRXopzKsHVtb6m/HTcrvNtrhbUkRtm
	/3jtKve8k0VRETFQSsux2QLGIvd1xaRVvC+lOPY2+X+1B5SxJaQCW7oAQyIuAg0crXfa+xuWDqf
	QgL9NmAmBwPDAvAICay/OaWICbyhZeyhLqnfFxmOcY5CVa+aN/rkoliT25og/GJpoMEBA+yjCzg
	rFcteyce/U6TTJ2P6Wm4QT4JfHPIqLOv12ATMD7gqqy1TTJ9tY1qGpTVIpaQ4cTDLUSzlXtLDFr
	4ZMZReXjPlKnH7vx/SOcvsjG+OXwXM2P4PKW64pU=
X-Google-Smtp-Source: AGHT+IHLGuZmkW+kSw560ggBD0NBIY1H4eKZ93nmmbFSZmm1UVBrZY9TNOMsy6/xMK/A0+7PYsLKIA==
X-Received: by 2002:a17:907:6d0a:b0:ad2:27b1:7214 with SMTP id a640c23a62f3a-adf9e1d7e73mr22733666b.17.1749829736693;
        Fri, 13 Jun 2025 08:48:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v5 2/9] xen/riscv: introduce register_intc_ops() and intc_hw_ops.
Date: Fri, 13 Jun 2025 17:48:41 +0200
Message-ID: <67f202602066afc7334a15ed5cbdb96309e7d2b3.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the intc_hw_operations structure to encapsulate interrupt
controller-specific data and operations. This structure includes:
- A pointer to interrupt controller information (`intc_info`)
- Callbacks to initialize the controller and set IRQ type/priority
- A reference to an interupt controller descriptor (`host_irq_type`)
- number of interrupt controller irqs.

Add function register_intc_ops() to mentioned above structure.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V3:
 - Drop inclusion of xen/irq.h in asm/intc.h as forward declaration is enogh
   for types used in asm/intc.h.
 - Drop forward declaration for dt_device_node  and hw_irq_controller.
 - Declare intc_hw_ops as:
     const struct intc_hw_operations * __ro_after_init intc_hw_ops;
---
Changes in V2:
 - Declare host_irq_type member of intc_hw_operations as pointer-to-const.
 - Moved up forward declaration of irq_desc.
 - Use attribute __init for register_intc_ops().
 - Use attribute __ro_after_init for intc_hw_ops variable.
 - Update prototype of register_intc_ops() because of what mention in the
   previous point.
---
 xen/arch/riscv/include/asm/intc.h | 19 +++++++++++++++++++
 xen/arch/riscv/intc.c             |  9 +++++++++
 2 files changed, 28 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 81f74736ba..434c9d0781 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -14,11 +14,30 @@ enum intc_version {
     INTC_APLIC,
 };
 
+struct irq_desc;
+
 struct intc_info {
     enum intc_version hw_version;
     const struct dt_device_node *node;
 };
 
+struct intc_hw_operations {
+    /* Hold intc hw information */
+    const struct intc_info *info;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+
+    /* hw_irq_controller to enable/disable/eoi host irq */
+    const struct hw_interrupt_type *host_irq_type;
+
+    /* Set IRQ type */
+    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
+    /* Set IRQ priority */
+    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
+};
+
 void intc_preinit(void);
 
+void register_intc_ops(const struct intc_hw_operations *ops);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 4061a3c457..1ecd651bf3 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -5,6 +5,15 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 
+#include <asm/intc.h>
+
+static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
+
+void __init register_intc_ops(const struct intc_hw_operations *ops)
+{
+    intc_hw_ops = ops;
+}
+
 void __init intc_preinit(void)
 {
     if ( acpi_disabled )
-- 
2.49.0


