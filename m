Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2E97C86A3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 15:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616556.958656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrI4U-0000ly-4c; Fri, 13 Oct 2023 13:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616556.958656; Fri, 13 Oct 2023 13:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrI4U-0000ip-1Q; Fri, 13 Oct 2023 13:19:18 +0000
Received: by outflank-mailman (input) for mailman id 616556;
 Fri, 13 Oct 2023 13:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVAw=F3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qrI4R-0000hW-Vb
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 13:19:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b046e92-69cb-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 15:19:14 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ae75ece209so338501066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 06:19:14 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 ov19-20020a170906fc1300b009a193a5acffsm12307018ejb.121.2023.10.13.06.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 06:19:13 -0700 (PDT)
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
X-Inumbo-ID: 1b046e92-69cb-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697203154; x=1697807954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+DuKjX5C9PwQVcUxHpVUuL1o002ypO3N0jFU9aQ36Y=;
        b=QLGfuoB+PDjw0M+CJo2VCLDNy6DeONIAsxdqoyxfuIr9KWegwGtmzDxkQiaSfbdTWP
         TGyMnOLcWcUjeRXPYuBKNNcI9Yst78/vcdgEO2YYYhbb9npEGkxy6oKqs6mc8bN7TP9R
         /pKEn/r9c4nlgoNuqaYPrF3mly8qG/vu8l2ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697203154; x=1697807954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+DuKjX5C9PwQVcUxHpVUuL1o002ypO3N0jFU9aQ36Y=;
        b=w5CVqE3nPu91oQ/ZOFfuP0Ne1DWwiG5QAm9uevUuizv4zXyvuRZSlrC9UjKGcjqFHh
         W592ZoJQ/DMbsqJZLwx+y5nmbDIwT4wNUvMVC9nZRd9xqUVvaV4om/djpkRfTZ7CdL5a
         zoHOXuhFjiRNWPEys/hnUDfAWBzAUJj4yll2eFUg+djgMhf96LEmHEiiH1+5zUADoU0A
         On8Zghk1IHRP2o5sl4nIeQvUhS42PsYmSirCSEZACL0yeW+FNzG2u4TpdxEXOTWXKnEB
         BM3i0eg6fBEz0kj/lbB24aTLc45JAvMlGOHC7I347An92xqSyw2wy8PEAOk1k8QEi05u
         FHfw==
X-Gm-Message-State: AOJu0YyuOZYVHeC9OaH9OYPk8sS2KpAwXHqAjjtNt2RizWsNdcdGUoIR
	JC5VqJL+PZNF7NzroKgkwuM68mKUpnYy6eJwZCI=
X-Google-Smtp-Source: AGHT+IFUyKugnft07NlB3AEM8nPwOjonrh/9cbNG1uNsbKxZIdNvSRf7UCOFg3djSafUsndiObVoWw==
X-Received: by 2002:a17:906:8e:b0:9a9:d5f4:1a0d with SMTP id 14-20020a170906008e00b009a9d5f41a0dmr20331729ejc.45.1697203154163;
        Fri, 13 Oct 2023 06:19:14 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.18][PATCH v2] x86/amd: Address AMD erratum #1485
Date: Fri, 13 Oct 2023 14:18:46 +0100
Message-Id: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix adapted off Linux's mailing list:
  https://lore.kernel.org/lkml/D99589F4-BC5D-430B-87B2-72C20370CF57@exactcode.com/T/#u

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
v2:
  * Removed v1/patch1, as it proved to be contentious
    * Also changed is_zen[34]_uarch() into a heuristic check only
  * Streamlined comments and commit message

---
 xen/arch/x86/cpu/amd.c               | 8 ++++++++
 xen/arch/x86/include/asm/amd.h       | 5 +++++
 xen/arch/x86/include/asm/msr-index.h | 1 +
 3 files changed, 14 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4f27187f92..085c4772d7 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1167,6 +1167,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c->x86 == 0x10)
 		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
 
+	/* Fix for AMD erratum #1485 */
+	if (!cpu_has_hypervisor && c->x86 == 0x19 && is_zen4_uarch()) {
+		rdmsrl(MSR_AMD64_BP_CFG, value);
+		#define ZEN4_BP_CFG_SHARED_BTB_FIX (1ull << 5)
+		wrmsrl(MSR_AMD64_BP_CFG,
+		       value | ZEN4_BP_CFG_SHARED_BTB_FIX);
+	}
+
 	if (!cpu_has_amd_erratum(c, AMD_ERRATUM_121))
 		opt_allow_unsafe = 1;
 	else if (opt_allow_unsafe < 0)
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


