Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DE7C74BE
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 19:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615948.957525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzRx-0001ke-S7; Thu, 12 Oct 2023 17:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615948.957525; Thu, 12 Oct 2023 17:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqzRx-0001iY-PY; Thu, 12 Oct 2023 17:26:17 +0000
Received: by outflank-mailman (input) for mailman id 615948;
 Thu, 12 Oct 2023 17:26:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K032=F2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qqzRv-0001Tc-U3
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 17:26:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71d2dda0-6924-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 19:26:14 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so204624866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 10:26:14 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 c27-20020a17090603db00b009829d2e892csm11522697eja.15.2023.10.12.10.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:26:13 -0700 (PDT)
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
X-Inumbo-ID: 71d2dda0-6924-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697131574; x=1697736374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYHV7c90aO56gEQ/yK3mNJoFKYNlYbtCnmi3by1vlgc=;
        b=ZSXcIGPvSi6t2VwdCyqED9PMfrCIbXj0a/qLUZOFTtFUpQXXsLfui1HAU2tAS16maw
         mndIsEoP/7f+YrKnPU93ezNfVng8B1PrvgzzQ8Ukpah9f/T7Ht2r3P7pUoUt/Cxg72vn
         09xp4p/5amWxNHbWArfRt4xD2P0vQMw+bvXWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131574; x=1697736374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYHV7c90aO56gEQ/yK3mNJoFKYNlYbtCnmi3by1vlgc=;
        b=NcduBccM/smj45P70LU/g6+1yIJ9QBbj1xTNDJDE/NnbP+MxXL7cuftjtZFgPQeOfs
         z85xeA3d+acBA52egi6KGVaL2xXIDR8RqxPymd5i42xdBwxoeDDvaV3AF+xnWrJ9vTNP
         ymJtjBbmnh3AIz/42EkYnPQdlsvR1MrU3kKp8TvaJrjVtSSWUKVF2jAQp/VAK2JYTZ0U
         HEfUu7LJq85QsEnH2phM4HCWAROFK2knivOUEcJtMvpCOLWNdkiLMb+G6TNRQRDYc6TS
         8hc0TxOWAchmuDuh1+ieOZGgchLxoRTpdmdnvUVDU02qQKPG4SjXIpxkP9CquYgDOk3+
         1ABw==
X-Gm-Message-State: AOJu0Yyo2IogQJdU/weAndB9hk2t47w9UIHoNNCpjlUeYieVuhhGfJ2/
	rMEPlweSmaf7k23OIVDLrEI0ZtTURAlIrDFjozE=
X-Google-Smtp-Source: AGHT+IHRwpZDbak1cbJkyC0ODfF+hHpgBGwY1qDI0jSxs/Tj6PLxWKdj0EN48ydhsaE6q8DDy1FSfw==
X-Received: by 2002:a17:906:290:b0:9b2:89eb:79b5 with SMTP id 16-20020a170906029000b009b289eb79b5mr24435349ejf.35.1697131573891;
        Thu, 12 Oct 2023 10:26:13 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [for-4.18][PATCH 1/2] xen/x86: Add family guards to the is_zen[12]_uarch() macros
Date: Thu, 12 Oct 2023 18:26:00 +0100
Message-Id: <20231012172601.22600-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
References: <20231012172601.22600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It slightly simplifies the code that uses them at no real cost because the
code is very rarely executed. This makes it harder to confuse zen uarches
due to missing or mistaken family checks.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/cpu/amd.c         | 5 ++---
 xen/arch/x86/include/asm/amd.h | 9 +++++----
 xen/arch/x86/spec_ctrl.c       | 3 ---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 4f27187f92..22aa8c0085 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1056,8 +1056,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 
 	amd_init_ssbd(c);
 
-	if (c->x86 == 0x17)
-		amd_init_spectral_chicken();
+	amd_init_spectral_chicken();
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
@@ -1293,7 +1292,7 @@ static int __init cf_check zen2_c6_errata_check(void)
 	 */
 	s_time_t delta;
 
-	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17 || !is_zen2_uarch())
+	if (cpu_has_hypervisor || !is_zen2_uarch())
 		return 0;
 
 	/*
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index d862cb7972..5a40bcc2ba 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -145,11 +145,12 @@
  * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
  * as a heuristic that distinguishes the two.
  *
- * The caller is required to perform the appropriate vendor/family checks
- * first.
+ * The caller is required to perform the appropriate vendor check first.
  */
-#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
-#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
+#define is_zen1_uarch() ((boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) && \
+                         !boot_cpu_has(X86_FEATURE_AMD_STIBP))
+#define is_zen2_uarch() (boot_cpu_data.x86 == 0x17 && \
+                         boot_cpu_has(X86_FEATURE_AMD_STIBP))
 
 struct cpuinfo_x86;
 int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 6fd7d44ce4..508c454516 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -976,9 +976,6 @@ static bool __init has_div_vuln(void)
            (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
         return false;
 
-    if ( boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18 )
-        return false;
-
     return is_zen1_uarch();
 }
 
-- 
2.34.1


