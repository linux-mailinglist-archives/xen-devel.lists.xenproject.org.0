Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26E97EFC7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 19:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802249.1212462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssmeh-0007G8-9j; Mon, 23 Sep 2024 17:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802249.1212462; Mon, 23 Sep 2024 17:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssmeh-0007EZ-6E; Mon, 23 Sep 2024 17:15:23 +0000
Received: by outflank-mailman (input) for mailman id 802249;
 Mon, 23 Sep 2024 17:15:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssmeg-0007ET-7P
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 17:15:22 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69b12540-79cf-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 19:15:21 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d64b27c45so854080266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 10:15:21 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e5696sm1269353966b.172.2024.09.23.10.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 10:15:19 -0700 (PDT)
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
X-Inumbo-ID: 69b12540-79cf-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727111720; x=1727716520; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTCfGE+KIC9K4dBXRqJvzlOq3XiCEX80lBP+YcPkwfc=;
        b=G3WmqZhmskNZbyvm6ILFEqG5At8qVa4p5caZhw/5GULTVvS+yoVTUtDsmpDg9vPqvc
         YzVeDYl5WfjkzB10ajShzQME/XwvN+XblDzIp9qE00e1ILetAHcANvJaZ8UVeJE/ahUk
         DAhNGBc7yZlaf/NvWB2sBNbWH4fjkddNuNb0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727111720; x=1727716520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTCfGE+KIC9K4dBXRqJvzlOq3XiCEX80lBP+YcPkwfc=;
        b=PE4SFuzQZprJtNlUAWoK7wHIVpNj27CgWkq4wpwnDPVJ8uxvZmLbrrsv8YJMTlz1ni
         0JR5HxaAOdEvOtOnrCOrFxKvSRC30+2b9Rib3sInss1EVbUu22G8RIRW3oQun1Ll16Q+
         Ilh9YSFiLZBTlkRPchxP+q9CsZ8kN8ftXa2+OGHNEQPgG7NpCm86GuvSdUK39YKS5eqQ
         uhFePmg1t69jxuk3zE5ki2yZRvUANmTEhkeQI/ez2txWprISqw1e7LhthXl4hc5yM6ZM
         JKkudrih29g4LFYKxAj8wO2LQM0xL/lqs93wkYYHUvSyKWrpYts0GPhxKr9rFmdUnb7s
         s5mA==
X-Gm-Message-State: AOJu0Yw0G5H3w5CuH3X42oRMJpXR717L21OjTPiztzFhM2WMZebbEjFR
	wzBP6aMs+plyK3zhGUqEMIdKF+MjJC8eRO2Q7y9BaQ5cwTFBvC3oBQ7wEU5r/ItuFZbq/6RlAb9
	YQMtF2A==
X-Google-Smtp-Source: AGHT+IFpNGBfUz1cUW9+hDG3sLM7SzD3pXT+BVY0v+fgPCAzOT5/EQ338l6FqH184EOa3v/0JFbinQ==
X-Received: by 2002:a17:906:bc24:b0:a7a:9f0f:ab2c with SMTP id a640c23a62f3a-a90d501abc8mr1259724266b.29.1727111720127;
        Mon, 23 Sep 2024 10:15:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/cpufeature: Reposition cpu_has_{lfence_dispatch,nscb}
Date: Mon, 23 Sep 2024 18:15:17 +0100
Message-Id: <20240923171517.125089-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LFENCE_DISPATCH used to be a synthetic feature, but was given a real CPUID bit
by AMD.  The define wasn't moved when this was changed.

NSCB has always been a real CPUID bit, and was misplaced when introduced in
the synthetic block alongside LFENCE_DISPATCH.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/cpufeature.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 3baf9fcdbeeb..3a06b6f297b9 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -192,6 +192,10 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
+/* CPUID level 0x80000021.eax */
+#define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
+#define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
+
 /* CPUID level 0x00000007:1.edx */
 #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
 #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
@@ -219,8 +223,6 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
 #define cpu_has_aperfmperf      boot_cpu_has(X86_FEATURE_APERFMPERF)
-#define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
-#define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
 #define cpu_has_xen_shstk       (IS_ENABLED(CONFIG_XEN_SHSTK) && \
                                  boot_cpu_has(X86_FEATURE_XEN_SHSTK))

base-commit: e1c8a3dc8aeee26e7d483669ca34fceb8e80d933
-- 
2.39.5


