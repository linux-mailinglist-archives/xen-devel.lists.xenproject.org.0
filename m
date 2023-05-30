Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AC7162DA
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 15:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541187.843665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsM-0003tq-R9; Tue, 30 May 2023 13:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541187.843665; Tue, 30 May 2023 13:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3zsM-0003kz-ND; Tue, 30 May 2023 13:59:02 +0000
Received: by outflank-mailman (input) for mailman id 541187;
 Tue, 30 May 2023 13:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Ox2=BT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q3zsL-0003d9-4V
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 13:59:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f5b44fc-fef2-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 15:58:58 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30ae4ec1ac7so2032769f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 06:58:58 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020adfe984000000b002fe96f0b3acsm3442008wrm.63.2023.05.30.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 06:58:57 -0700 (PDT)
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
X-Inumbo-ID: 1f5b44fc-fef2-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685455138; x=1688047138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VGIEfka143J0krZiSLzHrTls4eT4q/W+mkBwrLfv54=;
        b=ZhhZfO7q72sTT5rBhH2YPnCoB1wFR4rVVUlVo6NFuQyjnyd1w8vyWkUp8w4vDvVDyV
         7R2QiC5jAJipXukYakZZsufxLacWcThAR0EoTvElPuWcnBEsvJLz/Fq69iN0yeTsdlkO
         LlL+Es9vag2BXH0YSLS7buxBupdLdcUoEef0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685455138; x=1688047138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VGIEfka143J0krZiSLzHrTls4eT4q/W+mkBwrLfv54=;
        b=My4loFbhE2Rptr56F6JBpCt+WXiWbu//GzT7dAUBY331Wzshk3AG8HpR8wz6kKMdlW
         1etv+axrwwYwEReE0bDxTaeFMofjjXM9GQ3SmF5rC8jZyMIecdDc9IZq5F9gnqZVWzzK
         Cchw6emKr6ISJmA4DsEszKOu7X6HqyXPO2nO+jwxIiLv6davngQ0/I5eUvpfeUzxsj+X
         +cJH/NZW/VWZCtWOxZHv3RGtpygKfum6Em0nF6l8TooEep5eEIh0qrONWp87oLH6qYz/
         ZuPjZEBTPUObBaIUt68nRj0bH8VIE9N4QepjUGmaAzbPE92A6719xzB3WxRHYYuzS5+/
         Hykw==
X-Gm-Message-State: AC+VfDxKG/9idoJocX0qAIzAXNZK0SgRcmT7QXDi0+8IcXt3E5g0yupI
	X6kai26XqKyXOYVDdGEMYh1Xc+kGJKfMJDDtm+4=
X-Google-Smtp-Source: ACHHUZ5TjpqhfIQbn9xHpTqWWLDyhcSyIuXhK0cd3ZAOY33EY1wyj0ZIUSfHnCWHKrA3DuXFOQh7Xg==
X-Received: by 2002:adf:ff85:0:b0:2ee:f77f:3d02 with SMTP id j5-20020adfff85000000b002eef77f3d02mr1743613wrr.0.1685455138287;
        Tue, 30 May 2023 06:58:58 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] x86: Add bit definitions for Automatic IBRS
Date: Tue, 30 May 2023 14:58:52 +0100
Message-Id: <20230530135854.1517-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AMD feature to reduce the IBRS handling overhead. Once enabled,
processes running at CPL=0 are automatically IBRS-protected even if
SPEC_CTRL.IBRS is not set. Furthermore, the RAS/RSB is cleared on VMEXIT.

The feature is exposed in CPUID and toggled in EFER.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Renamed AUTOMATIC -> AUTO
  * Newline removal in xen-cpuid.c
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 1 +
 xen/arch/x86/include/asm/cpufeature.h       | 1 +
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 5 files changed, 5 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index cca0f19d93..f5ce9f9795 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -317,6 +317,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
         {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
+        {"auto-ibrs",    0x80000021, NA, CPUID_REG_EAX,  8,  1},
         {"cpuid-user-dis", 0x80000021, NA, CPUID_REG_EAX, 17, 1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 5d0c64a45f..c65d9e01bf 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -199,6 +199,7 @@ static const char *const str_e21a[32] =
 {
     [ 2] = "lfence+",
     [ 6] = "nscb",
+    [ 8] = "auto-ibrs",
 
     /* 16 */                [17] = "cpuid-user-dis",
 };
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 50235f098d..ace31e3b1f 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -161,6 +161,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_amd_ssbd        boot_cpu_has(X86_FEATURE_AMD_SSBD)
 #define cpu_has_virt_ssbd       boot_cpu_has(X86_FEATURE_VIRT_SSBD)
 #define cpu_has_ssb_no          boot_cpu_has(X86_FEATURE_SSB_NO)
+#define cpu_has_auto_ibrs       boot_cpu_has(X86_FEATURE_AUTO_IBRS)
 
 /* CPUID level 0x00000007:0.edx */
 #define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 082fb2e0d9..73d0af2615 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -175,6 +175,7 @@
 #define  EFER_NXE                           (_AC(1, ULL) << 11) /* No Execute Enable */
 #define  EFER_SVME                          (_AC(1, ULL) << 12) /* Secure Virtual Machine Enable */
 #define  EFER_FFXSE                         (_AC(1, ULL) << 14) /* Fast FXSAVE/FXRSTOR */
+#define  EFER_AIBRSE                        (_AC(1, ULL) << 21) /* Automatic IBRS Enable */
 
 #define EFER_KNOWN_MASK \
     (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 777041425e..3ac144100e 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
+XEN_CPUFEATURE(AUTO_IBRS,          11*32+ 8) /*   HW can handle IBRS on its own */
 XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for CPL > 0 software */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
-- 
2.34.1


