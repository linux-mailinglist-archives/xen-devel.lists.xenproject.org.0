Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F187C88D1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616729.958955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKEr-00049y-Ur; Fri, 13 Oct 2023 15:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616729.958955; Fri, 13 Oct 2023 15:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrKEr-00046e-Qx; Fri, 13 Oct 2023 15:38:09 +0000
Received: by outflank-mailman (input) for mailman id 616729;
 Fri, 13 Oct 2023 15:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVAw=F3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qrKEq-00046Y-7A
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:38:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80da596e-69de-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:38:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9be1ee3dc86so26665066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 08:38:06 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1709064ed000b0099bd0b5a2bcsm12590567ejv.101.2023.10.13.08.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 08:38:04 -0700 (PDT)
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
X-Inumbo-ID: 80da596e-69de-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697211485; x=1697816285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZOSbH45SFa5v8GWRuOB+LMDI36gFFgPgiVJLY+kGhw=;
        b=Fg1oPOzPPlFkNIaPNNpizXaIvDDrCpPRh/a5xfl681hqNIvEa4e8vXPNzioynKzrEq
         Sc2iFwDgaFjcfUCU+aSkZbXrnPg+WBJukd2MZqJ5d9XDiJ828+98T6S2cmkzpz3DG9a7
         8iQbKbaErcUbEGWKjLmYMoc3PVTqNP6c2PmaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211485; x=1697816285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZOSbH45SFa5v8GWRuOB+LMDI36gFFgPgiVJLY+kGhw=;
        b=AIsMJf1rQ+d4vBepzPXkd1AbFOiqKgtahdfjPvXD/Bx2m02p4jElTCQiOXwznQw4w8
         aQNSgdVzmKr+zNMd+LhLIzJZ7kO8S+GEfcR5V5QBgcoW4chm+ZKdtvy105ri7HZ30hAt
         1RX3dzr+ubjLNZYf3zU4ya5pPGFiEfaX/xLfAe+vg2HXizBohxF2b4u3MC4KAms49Qw0
         1QF4f4i8kYmMo8MDzccE8D/L2Ad38V1z7+cml2D+3M0IGcgYfaMeC315X3k0SyNAZGFA
         i3HHc29al9YlNH4ibbwl61u3P18rl5KHN2Il++ln/bjK+NiBcpxrPXb7k4ER3Vf1gKAR
         5ZAA==
X-Gm-Message-State: AOJu0Yyv6S/4NHskK0fNr2Od0J/b4PQM0+Xh3XPedOUdE4Ub9pnkRjjU
	ctn1ZLn7QKo0nv6k9SmhQ7JY+A7n5LwcbMAAx84=
X-Google-Smtp-Source: AGHT+IFkpAe5BIhbttrsNWhEYJhv0GuO1hTdXhYhYlouwv/cr65sHELIVqRoZQcfrJvcxw6HoH0t5w==
X-Received: by 2002:a17:906:7484:b0:9a2:185b:5375 with SMTP id e4-20020a170906748400b009a2185b5375mr24621690ejl.18.1697211485163;
        Fri, 13 Oct 2023 08:38:05 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3] x86/amd: Address AMD erratum #1485
Date: Fri, 13 Oct 2023 16:38:01 +0100
Message-Id: <20231013153801.188324-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix adapted off Linux's mailing list:
  https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
v3:
  * Factored MSR shuffling into a separate function and moved the call to
    the end of init_amd() rather than having it in the middle
  * Style changes
  * Added comment about the unavoidable wrmsr race
  * Avoid wrmsrl() if the chickenbit already set
  * Removed the "ull" suffix as it's pointless with a local variable and it
    violates a MISRA 7.3.

Pipeline pending:
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1036125869
---
 xen/arch/x86/cpu/amd.c               | 23 +++++++++++++++++++++++
 xen/arch/x86/include/asm/amd.h       |  5 +++++
 xen/arch/x86/include/asm/msr-index.h |  1 +
 3 files changed, 29 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4f27187f92..cb77c23f1a 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1004,6 +1004,28 @@ static void cf_check zen2_disable_c6(void *arg)
 	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
 }
 
+static void amd_check_erratum_1485(void)
+{
+	uint64_t val, chickenbit = (1 << 5);
+
+	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x19 || !is_zen4_uarch())
+		return;
+
+	rdmsrl(MSR_AMD64_BP_CFG, val);
+
+	if (val & chickenbit)
+		return;
+
+	/*
+	 * BP_CFG is a core-scoped MSR. There's a benign race on this write
+	 * on the case where 2 threads perform the previous check at the
+	 * same time before the chickenbit is set. It's benign because the
+	 * value being written is the same on both.
+	 */
+	wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
+
+}
+
 static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -1271,6 +1293,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		disable_c1_ramping();
 
 	amd_check_zenbleed();
+	amd_check_erratum_1485();
 
 	if (zen2_c6_disabled)
 		zen2_disable_c6(NULL);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index d862cb7972..0700827561 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -145,11 +145,16 @@
  * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
  * as a heuristic that distinguishes the two.
  *
+ * For Zen3 and Zen4 (Fam19h) the heuristic is the presence of AutoIBRS, as
+ * it's Zen4-specific.
+ *
  * The caller is required to perform the appropriate vendor/family checks
  * first.
  */
 #define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
 #define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
+#define is_zen3_uarch() (!boot_cpu_has(X86_FEATURE_AUTO_IBRS))
+#define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
 
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 11ffed543a..7b3490bfb1 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -403,6 +403,7 @@
 #define MSR_AMD64_DE_CFG		0xc0011029
 #define AMD64_DE_CFG_LFENCE_SERIALISE	(_AC(1, ULL) << 1)
 #define MSR_AMD64_EX_CFG		0xc001102c
+#define MSR_AMD64_BP_CFG		0xc001102e
 #define MSR_AMD64_DE_CFG2		0xc00110e3
 
 #define MSR_AMD64_DR0_ADDRESS_MASK	0xc0011027
-- 
2.34.1


