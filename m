Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA0712909
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 17:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540131.841673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw3-0001ly-1S; Fri, 26 May 2023 15:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540131.841673; Fri, 26 May 2023 15:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2Yw2-0001il-U8; Fri, 26 May 2023 15:00:54 +0000
Received: by outflank-mailman (input) for mailman id 540131;
 Fri, 26 May 2023 15:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EF2/=BP=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q2Yw1-00010A-4A
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 15:00:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19a130fd-fbd6-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 17:00:49 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30adb83aa69so400204f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 May 2023 08:00:49 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y9-20020a5d4709000000b00307d58b3da9sm5360033wrq.25.2023.05.26.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 08:00:48 -0700 (PDT)
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
X-Inumbo-ID: 19a130fd-fbd6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685113248; x=1687705248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDLeIg4hyXVwKDMD+oHA+cHDIiqPkUjqW0gJGqDa3iY=;
        b=lS0i8c6WoI9s0QqxcoAmJ5//1XJoK5J+/1TLCjhECbnjiBguOP+bm16ow1csZ8ABqo
         qmCgYFnUgKqrtw877Z5LpRvAGiWxJqob6DhdG7SpwWmT+cez8P7sPAWeMrPUIwsJjK+i
         eIxNK96f7zjvDjWieUlJcug2+2K8z+MBru3O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113248; x=1687705248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDLeIg4hyXVwKDMD+oHA+cHDIiqPkUjqW0gJGqDa3iY=;
        b=PU1ugSmk2CeVQZUk8G8NjrFUHdS1hTlhfJo18wIo4B3vRhJ0EchyXCstaEjLEpO/ze
         x754UTmj4N1MxGpDlWgzkUMv/kSB3i4wTtKZBtlbwfjx9oWC+qWCEBRWhhFoqwaxRTh+
         fjiw3KxDZm9rvwOiRN+NDzP8/XELdDy3cIsYg7/DjCuxBG6vFYe2rqd2JdBkSJwq9XKj
         2L58mh/bE6w2xPi2g9pHs9+yonoG14SshfmA6/VsssRaU1BmyX5qSB2d4S21QX/93Zv8
         BrJJCOUQ7EqzrPMWCMPvbEOUKl25rCCLbLccZWyLY+O4hX5ph0il6Yzyd3jKW8eMioU1
         dT1A==
X-Gm-Message-State: AC+VfDwc2zfjmb3wWEosgu+JFaDAb/pYQMX2aK76E5dbgoFtKyJxfpZn
	medIg+XAlwSdk0P1RnQaEMXskcDU5j29KxoC6rw=
X-Google-Smtp-Source: ACHHUZ6O2SdPZO8PSTTB62xGQM2fmOLCEpBsE31ubWtroVWUNCOUztUGBnQp2k33vsG3N+pYq+inkw==
X-Received: by 2002:adf:dc89:0:b0:307:bd64:f5a4 with SMTP id r9-20020adfdc89000000b00307bd64f5a4mr1613643wrj.52.1685113248440;
        Fri, 26 May 2023 08:00:48 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86: Add bit definitions for Automatic IBRS
Date: Fri, 26 May 2023 16:00:42 +0100
Message-Id: <20230526150044.31553-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is AMD's version of Intel's Enhanced IBRS. Exposed in CPUID
and toggled in EFER.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 2 ++
 xen/arch/x86/include/asm/cpufeature.h       | 1 +
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 5 files changed, 6 insertions(+)

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
index 5d0c64a45f..e487885a5c 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -200,6 +200,8 @@ static const char *const str_e21a[32] =
     [ 2] = "lfence+",
     [ 6] = "nscb",
 
+    [ 8] = "auto-ibrs",
+
     /* 16 */                [17] = "cpuid-user-dis",
 };
 
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 50235f098d..d5947a6826 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -161,6 +161,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_amd_ssbd        boot_cpu_has(X86_FEATURE_AMD_SSBD)
 #define cpu_has_virt_ssbd       boot_cpu_has(X86_FEATURE_VIRT_SSBD)
 #define cpu_has_ssb_no          boot_cpu_has(X86_FEATURE_SSB_NO)
+#define cpu_has_auto_ibrs       boot_cpu_has(X86_FEATURE_AUTOMATIC_IBRS)
 
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
index 777041425e..e3952f62bc 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
+XEN_CPUFEATURE(AUTOMATIC_IBRS,     11*32+ 8) /*   HW can handle IBRS on its own */
 XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for CPL > 0 software */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
-- 
2.34.1


