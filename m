Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F47C74C0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 19:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615949.957535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzRz-0001z5-4B; Thu, 12 Oct 2023 17:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615949.957535; Thu, 12 Oct 2023 17:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzRz-0001xF-12; Thu, 12 Oct 2023 17:26:19 +0000
Received: by outflank-mailman (input) for mailman id 615949;
 Thu, 12 Oct 2023 17:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K032=F2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qqzRw-0001Tc-TU
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 17:26:16 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72533c5b-6924-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 19:26:15 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso504690066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 10:26:15 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 c27-20020a17090603db00b009829d2e892csm11522697eja.15.2023.10.12.10.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:26:14 -0700 (PDT)
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
X-Inumbo-ID: 72533c5b-6924-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697131575; x=1697736375; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHonUX6qskc9LU/MXpGEpaoXVXfgW0/B6Ythy10CTCA=;
        b=S6fKjYO9qaLEy0hA4GbQ5dRdITEUgS7niOVT6/aF7VaQHD41GJYY14OM856SYqgMh2
         rN9Y75kSU9ZT7zG+JvpzYTsFwym3O0OOWABci/K4YJruVERpytLt3mYLcJnC3GtnVACI
         PlZCk+V3wj45ySJbXDGFOSFmsao4QVstBbw0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131575; x=1697736375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHonUX6qskc9LU/MXpGEpaoXVXfgW0/B6Ythy10CTCA=;
        b=P3m0ef1oittp9NCKX0N8icUVpVTGbURHcBnuK4wgVw/IYkSS5sMPL+ssfLAnw3jsoo
         Y678yPtGM4n56Wacoo8dAfp5G7uUPwR7F7V2mfGhEGHtRWn85GbBT+cz3n8phdgSrP9b
         hMJ4ur39k92rKRKRhm7cC5Z2aFExwLbaqt85isd1ZuIuCYNCo14k460z2IIq1XsZs7kL
         EObZNto2iT1YWIHf+2LV0QezUlyoFwjXeaVQhTlUqW0tRIslqCuMljXrwheLDDzcxHF+
         dK3KDrWUWNEYD3icamdJXki1fE5wdKdDrphKF5eJYBpmb59c2J9h54HAh1nejTMxnNOu
         VNQA==
X-Gm-Message-State: AOJu0Yzm9akC17CAlKoT/7dNd9EPBh3Wk26W/QPXp7Tjc6qaTaDuUOS5
	SijZkO2D0rw6S0Fd9wxdVTjo5gHA5ErUJwoAZa0=
X-Google-Smtp-Source: AGHT+IG0DlS7JEKfVHkAj3AyveqIG+PLDvU2Kj8UbESfWVaf/EtRySDFGTifCMBpejk5ttc8LmMKFA==
X-Received: by 2002:a17:906:3b8d:b0:9b2:b808:6a1c with SMTP id u13-20020a1709063b8d00b009b2b8086a1cmr20519203ejf.35.1697131574775;
        Thu, 12 Oct 2023 10:26:14 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.18][PATCH 2/2] x86/amd: Prevent potentially fetching wrong instruction bytes on Zen4
Date: Thu, 12 Oct 2023 18:26:01 +0100
Message-Id: <20231012172601.22600-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If Zen4 runs with SMT and without STIBP, then it may corrupt its own code
stream. This is erratum #1485 in the AMD specs.

Fix adapted off Linux's mailing list:
  https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/cpu/amd.c               | 11 +++++++++++
 xen/arch/x86/include/asm/amd.h       |  8 ++++++++
 xen/arch/x86/include/asm/msr-index.h |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 22aa8c0085..2426e4cf15 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1166,6 +1166,17 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c->x86 == 0x10)
 		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
 
+	/*
+	 * Erratum #1485: Outdated microcode on Zen4 may cause corruption
+	 * in the code stream if SMT is enabled and STIBP is not. The fix
+	 * is cheap, so it's applied irrespective of the loaded microcode.
+	 */
+	if (!cpu_has_hypervisor && is_zen4_uarch()) {
+		rdmsrl(MSR_AMD64_BP_CFG, value);
+		wrmsrl(MSR_AMD64_BP_CFG,
+		       value | AMD64_BP_CFG_SHARED_BTB_FIX);
+	}
+
 	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
 		opt_allow_unsafe = 1;
 	else if (opt_allow_unsafe < 0)
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 5a40bcc2ba..7d18f7c66b 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -145,12 +145,20 @@
  * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
  * as a heuristic that distinguishes the two.
  *
+ * Zen3 and Zen4 are easier to spot by model number, but it's still not a
+ * single range. We use AutoIBRS to to discriminate instead, as that's a
+ * Zen4-specific feature.
+ *
  * The caller is required to perform the appropriate vendor check first.
  */
 #define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
                          !boot_cpu_has(X86_FEATURE_AMD_STIBP))
 #define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
                          boot_cpu_has(X86_FEATURE_AMD_STIBP))
+#define is_zen3_uarch() (boot_cpu_data.x86 == 0x19 && \
+                         !boot_cpu_has(X86_FEATURE_AUTO_IBRS))
+#define is_zen4_uarch() (boot_cpu_data.x86 == 0x19 && \
+                         boot_cpu_has(X86_FEATURE_AUTO_IBRS))
 
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 11ffed543a..4437e8a63e 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -403,6 +403,8 @@
 #define MSR_AMD64_DE_CFG		0xc0011029
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
 #define MSR_AMD64_EX_CFG		0xc001102c
+#define MSR_AMD64_BP_CFG		0xc001102e
+#define AMD64_BP_CFG_SHARED_BTB_FIX	(_AC(1, ULL) << 5)
 #define MSR_AMD64_DE_CFG2		0xc00110e3
 
 #define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027
-- 
2.34.1


