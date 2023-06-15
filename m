Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C38731D00
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 17:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549720.858446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDJ-0007Un-KC; Thu, 15 Jun 2023 15:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549720.858446; Thu, 15 Jun 2023 15:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9pDJ-0007Jo-DR; Thu, 15 Jun 2023 15:48:45 +0000
Received: by outflank-mailman (input) for mailman id 549720;
 Thu, 15 Jun 2023 15:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IrMH=CD=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q9pDH-0006RS-8t
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 15:48:43 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aaf2a78-0b94-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 17:48:42 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b448470602so10251061fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jun 2023 08:48:42 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e10-20020a056000194a00b0030497b3224bsm21374699wry.64.2023.06.15.08.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 08:48:41 -0700 (PDT)
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
X-Inumbo-ID: 1aaf2a78-0b94-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686844122; x=1689436122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFauoCPb3uFIKLyQY0yOuojLsuuCte23s4sWaojZ6LI=;
        b=MThFwTc94JwI5fxtNvYJ5ouIYUb2vHHDV8sdWVrIQanhRfWjHdjci5JVvYOmLzjcoB
         50PteWgdEk1gvPqv7zG2u7FjF+01RWxYpoc+YgjamHzTq8oFZZJnWnRxY22mOvzfD7Fw
         bfC5yb8OkuLdhpa7D6SbhqSTdZGvgFNdQEgf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844122; x=1689436122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFauoCPb3uFIKLyQY0yOuojLsuuCte23s4sWaojZ6LI=;
        b=dWXaq85pRiGnGmOFUzV2KbIUJgSWLlkpBE5kb4sRYRIF3cd9k7bbApyxZGgx/Jo1bB
         MRScApYOKW2mK7+W5gDPCIvnLCBMxDP8r7oI3/EKiOpBNagCkioplyWfwPPstWlp7Cyt
         5NyPj/IFJF2cjJeFf4gKGs/o88RW9qpQcG3LdRsBY28oXp0RKLKu69CbiI7eDByQ+TJP
         N9uwprN47cmZAcDNbw+jn8g28z6wtLUnbM/XeJAXN68AJvafBhsu3UHkXYVCanRaPbG3
         5Ly9U7EFthmK+HFLF5tioAzEUeERLaPIlLkW0QjUWzo2X1lOVbPGe673uct5uXXji3A3
         1VlA==
X-Gm-Message-State: AC+VfDyZYwHXr/TXk6toREtMrYReDzuTjf+kVxuLqo+gp5lDDFL+eD1+
	JC0AnCD4+ccvjtJgpOJ69yHxeAHfntDTjJnUR90=
X-Google-Smtp-Source: ACHHUZ6+qEDZ5JtKp1AuzwFXFhPE0BDozyeWFnxRya3nBahP7ijDZCpAjwzP+C8q210kec3UuBXPMA==
X-Received: by 2002:ac2:5b46:0:b0:4f6:2317:f387 with SMTP id i6-20020ac25b46000000b004f62317f387mr9179734lfp.35.1686844122040;
        Thu, 15 Jun 2023 08:48:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 5/5] x86/microcode: Disable microcode update handler if DIS_MCU_UPDATE is set
Date: Thu, 15 Jun 2023 16:48:34 +0100
Message-Id: <20230615154834.959-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615154834.959-1-alejandro.vallejo@cloud.com>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If IA32_MSR_MCU_CONTROL exists then it's possible a CPU may be unable to
perform microcode updates. This is controlled through the DIS_MCU_LOAD bit
and is intended for baremetal clouds where the owner may not trust the
tenant to choose the microcode version in use. If we notice that bit being
set then simply disable the "apply_microcode" handler so we can't even try
to perform update (as it's known to be silently dropped).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Removed microcode_update_one() hunk (Jan, from v2/patch4)
  * Read MSR_ARCH_CAPS in early_cpu_init(), missing in v2/patch4 (Andy)
  * Moved the MSR_ARCH_CAPS after-update read (it's on v3/p3 now)
  * Logic previouslyin this_cpu_can_install_update() is now integrated in
    intel_get_ucode_ops() (Jan, from v2/p4)
---
 xen/arch/x86/cpu/common.c             |  5 +++++
 xen/arch/x86/cpu/microcode/intel.c    | 14 ++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/msr-index.h  |  5 +++++
 4 files changed, 25 insertions(+)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace12..2f895e7c7c 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -352,6 +352,11 @@ void __init early_cpu_init(void)
 			    &c->x86_capability[FEATURESET_7c0],
 			    &c->x86_capability[FEATURESET_7d0]);
 
+		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
+			rdmsr(MSR_ARCH_CAPABILITIES,
+			      c->x86_capability[FEATURESET_m10Al],
+			      c->x86_capability[FEATURESET_m10Ah]);
+
 		if (max_subleaf >= 1)
 			cpuid_count(7, 1, &eax, &ebx, &ecx,
 				    &c->x86_capability[FEATURESET_7d1]);
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index a99e402b98..abcfdc460d 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -387,8 +387,22 @@ static struct microcode_patch *cf_check cpu_request_microcode(
 
 void __init intel_get_ucode_ops(struct microcode_ops *ops)
 {
+    uint64_t mcu_ctrl;
+
     ops->cpu_request_microcode = cpu_request_microcode;
     ops->collect_cpu_info      = collect_cpu_info;
     ops->apply_microcode       = apply_microcode;
     ops->compare_patch         = compare_patch;
+
+    if ( cpu_has_mcu_ctrl )
+    {
+        rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
+        /*
+         * If DIS_MCU_LOAD is set applying microcode updates won't work. We
+         * can still query the current version and things like that, so
+         * we'll leave the other handlers in place.
+         */
+        if ( mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD )
+            ops->apply_microcode = NULL;
+    }
 }
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ace31e3b1f..0118171d7e 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
+#define cpu_has_mcu_ctrl        boot_cpu_has(X86_FEATURE_MCU_CTRL)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
 
 /* Synthesized. */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2749e433d2..5c1350b5f9 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -165,6 +165,11 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_MCU_CONTROL                     0x00001406
+#define  MCU_CONTROL_LOCK                   (_AC(1, ULL) <<  0)
+#define  MCU_CONTROL_DIS_MCU_LOAD           (_AC(1, ULL) <<  1)
+#define  MCU_CONTROL_EN_SMM_BYPASS          (_AC(1, ULL) <<  2)
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
-- 
2.34.1


