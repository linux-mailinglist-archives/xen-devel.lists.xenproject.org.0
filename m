Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B5C9B3DA
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 11:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176070.1500625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4N-0007D1-6Q; Tue, 02 Dec 2025 10:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176070.1500625; Tue, 02 Dec 2025 10:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQO4N-00078H-2O; Tue, 02 Dec 2025 10:57:19 +0000
Received: by outflank-mailman (input) for mailman id 1176070;
 Tue, 02 Dec 2025 10:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQLy=6I=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vQO4M-00075j-GO
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 10:57:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab33504f-cf6d-11f0-9d1a-b5c5bf9af7f9;
 Tue, 02 Dec 2025 11:57:18 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso40860875e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 02:57:18 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d365sm289825795e9.12.2025.12.02.02.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 02:57:16 -0800 (PST)
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
X-Inumbo-ID: ab33504f-cf6d-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764673037; x=1765277837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riRPJvWz61nwq2yHn5ai8Dg4B8xFn5kKgazweRThc40=;
        b=pdil9SN85+xLiSUie1v7OahUeFgphkAk3urlAAFokdg51Q+hjQ2kW6tXjgSCGjpjmy
         PVMop6nk7r8q6SRj8CVdzqg5zriM/MItPKklm1gnM5nDjZZ+cxK53zRR7ecXepx+IKDI
         1FrQXqJHfdigII9UPnYnzjgpfGhz7KRW5BLM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673037; x=1765277837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=riRPJvWz61nwq2yHn5ai8Dg4B8xFn5kKgazweRThc40=;
        b=hWko3jhWImIQrddmdny/pHxJpXV9KBlB/qYyACExCRA4vDLFMsz+UUhHgFN1xlDdtI
         KrMqKK6ezuU28GTDOO7CC24jLML4fhujDX5II1OrVeyQSRj17ujLZ5cXSiWunvXb+jlX
         /S8nMsH/71sBr4WiD6wK1cAawKDsq5RTZSiaXo2zTQQqH14+Mm6iTAiGDdaAfvQVpxoP
         2Kqr4HlxQEaVH6FG9Im69pq7jJHRHCoXLUACMnKtpUcCzVxE2K8eS0qYrF/GHnpXBrz3
         ARbRcNvd2tabTj8Jp2JVTFPMxq3i6I4qkq8oL0BB/j2eFZFBlfgDzhl0Is4bjrkpAi67
         DErA==
X-Gm-Message-State: AOJu0Yz18E6HqETp7JQ3p0TkT4YxcCinKF6P2QGcB550jBDaVM1qmPVR
	pwMJGuUjiiCurXt5TQs1Zh5ZgDepIRO6kdX755EjdaeaeROxAggdRsSxhrfKDx2tdiM3isbkHZV
	nFOIW
X-Gm-Gg: ASbGncueLH12+QchjRAyo/vWXmXfp/DtD3CTkvAiXBJovKZxZxIInayPnR20qU47xcl
	IIdPEDxxi5JqBV+OhLJT2YZgcnfBKjNLggKHFEesZ1g4i7HJEJbLqW/Tl7lN8MvMK+i31XS+Yuv
	nAbk7Nkpg6TiEc/VKuCYr41IdmMPrYf3ErgYm8jxGVEd806QX2THtE6mdp94GNfF5uE5kphM3rT
	RAaUsQcDAfY9kk1y7CYXXyLj3G88tpAHiPXwDA0xxtExV8uPpzK31d3tfX8o6Jxdbdb55n0aR+t
	TquLnPqaBVg+cdtpgyOauhyVIGS2LL0kZxyXXz0xvjar6820lKMDuULKQo+a84co2c2afR+Iw1/
	0vM3ltkVw7jay6GWGttSq3HKA2Wkt5V5KyAINcP8s6YQtg3sTkf56GMu1hRGB4XgDm7QksnuEdp
	wM1kDdCoUSmKhPQTIoPFydA/mD0n32wxtN4n75rpTNiZKrzC4qdcWfx08JjfKGcQ==
X-Google-Smtp-Source: AGHT+IF8xRcUg1w/qTR4FnaeZsLwR12ATjw4zfcKNq+vdchgjluVzL8fyAnzMxYpc6oK21J/+MaZLA==
X-Received: by 2002:a05:600c:1c9e:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47926f80703mr23758275e9.2.1764673037174;
        Tue, 02 Dec 2025 02:57:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/amd: Delay amd_init_levelling() until after fixes to the CPUID MSRs
Date: Tue,  2 Dec 2025 10:57:10 +0000
Message-Id: <20251202105710.1472927-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
References: <20251202105710.1472927-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no need for amd_init_levelling() to be specifically early.  In fact,
it must be after init_amd() edits the feature MSRs, e.g. enabling TOPOEXT on
Fam15h, or we revert the change on the next context switch.

As the only action in early_init_amd(), drop the function entirely.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c   | 16 ++++++----------
 xen/arch/x86/cpu/cpu.h   |  2 +-
 xen/arch/x86/cpu/hygon.c |  6 +++++-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 73f43b0f9174..b66601b3c51e 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -224,7 +224,7 @@ static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
  * avoid this, as the accidentally-advertised features will not actually
  * function.
  */
-static void __init noinline amd_init_levelling(void)
+void __init amd_init_levelling(void)
 {
 	/*
 	 * If there's support for CpuidUserDis or CPUID faulting then
@@ -617,14 +617,6 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 		*low_mhz = amd_parse_freq(c->x86, lo);
 }
 
-void cf_check early_init_amd(struct cpuinfo_x86 *c)
-{
-	if (c == &boot_cpu_data)
-		amd_init_levelling();
-
-	ctxt_switch_levelling(NULL);
-}
-
 void amd_log_freq(const struct cpuinfo_x86 *c)
 {
 	unsigned int low_mhz = 0, nom_mhz = 0, hi_mhz = 0;
@@ -1270,10 +1262,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
+
+	if (c == &boot_cpu_data)
+		amd_init_levelling(); /* After CPUID MSR adjustments. */
+
+	ctxt_switch_levelling(NULL);
 }
 
 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
-	.c_early_init	= early_init_amd,
 	.c_init		= init_amd,
 };
 
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 8bed3f52490f..c05c620c29bc 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -22,9 +22,9 @@ extern void display_cacheinfo(struct cpuinfo_x86 *c);
 extern void detect_ht(struct cpuinfo_x86 *c);
 extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
-void cf_check early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
 void amd_init_de_cfg(const struct cpuinfo_x86 *c);
+void amd_init_levelling(void);
 void amd_init_lfence_dispatch(void);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index cab915a2fcf1..51104cbaf42c 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -90,9 +90,13 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 	}
 
 	amd_log_freq(c);
+
+	if (c == &boot_cpu_data)
+		amd_init_levelling(); /* After CPUID MSR adjustments. */
+
+	ctxt_switch_levelling(NULL);
 }
 
 const struct cpu_dev __initconst_cf_clobber hygon_cpu_dev = {
-	.c_early_init	= early_init_amd,
 	.c_init		= init_hygon,
 };
-- 
2.39.5


