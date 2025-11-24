Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E83C813E8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171389.1496401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYBI-0004mD-Py; Mon, 24 Nov 2025 15:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171389.1496401; Mon, 24 Nov 2025 15:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYBI-0004j6-Ml; Mon, 24 Nov 2025 15:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1171389;
 Mon, 24 Nov 2025 15:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HCIP=6A=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vNYBG-0004j0-Se
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:08:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75bdccc2-c947-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:08:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so28931635e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:08:40 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4eb2sm199290635e9.12.2025.11.24.07.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 07:08:39 -0800 (PST)
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
X-Inumbo-ID: 75bdccc2-c947-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763996920; x=1764601720; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzTlUqlynUPpvUq58w3gSsgx2HPcRNAuuuB89xtRGaU=;
        b=FvJ94kln2wlz0OlGejgKW3wu4eaC4vNx6YmgCVGmIMyGCV/f79kCkjl7SCx31QXOFk
         gRzjhL137P6ZOW/vVsdJNXQ6yCKzTeTnhMRje6l1J2lISOI1e971yQRG88HTuVKARmBq
         qs9gZY2jgcqu5pQW1o28k/MZ+5/CDnC7sJOzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996920; x=1764601720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzTlUqlynUPpvUq58w3gSsgx2HPcRNAuuuB89xtRGaU=;
        b=rlUj4MO5XQMN4Ts+zaGqHejPdKyMqGCO4D2BUC7tYl99XcBz14CjbIrA8vJnS7eta7
         Dfi2kW+aXB/U/y3ta1tpbnwo/PSgH2vWCgEds9jQBg821LIoaCjM9VXlJ8X9LufPSdTH
         0n7TCqHL20QbYgczvHB7JvhiCpaMjB8XWEN0DjCUgPZu+GBrwLEsKq37+7ZctBB4Irhr
         DBP2NASF9bZ7gQWUd12YH/9vKjiu0LSR7YUQ/5E6WjPeCwUNWr1kIP+3ZinOU/986Eo5
         lU11JwFb1it7s3rClS0gw3Z4vcU8WUNnogvFtIVQfZSSBspV2Wc1s8nTIsROV6eJlHOS
         KP7A==
X-Gm-Message-State: AOJu0YzjXBpd/xJm8YCaKjNbYxxnPn1hyECKa5bInk4or+0bJEXeu6os
	romCMtWsRzbKF1xoIhhWl1L5y1Iqb2Bt/UwBOot5Vt0LMCho3GR3OAtCMemnlUAxbjcVBYrwHWx
	t6FqkwP8=
X-Gm-Gg: ASbGncumRbfMhcF7Q0QDatVY1ioblmUQeWRRVX9LrLEGkKipLpyoumwFP1uD7Ba/lnE
	jWYzbs7HntHoOZ1xHQwI07yYvxqZRXUmCENyDiKnib+84Qu3+XwOyq6eZtCtrn8XM/xc9n5nZFR
	jA8LuwS9iq94JE+0/qoBnFPfp4wlDHBvcK6FXbslDT0y9ljmxcLnJ/0/BqMijzhDPj4oCocKD2i
	16vyGbSWO1A+RggpFEJKIkq/bQH9gI6QtZoKMHhmUPr2UB73M+IRs4oHoSrUJfbg40icGJ9jFjS
	ymNzGeNVmDgU0Cd0OgJK1hSRTBRZO/zKmTAl2Fjc410cieulQCyV/qFnxOWZWbGDI6MhQgDRSU/
	ka25ZMvNdtWGHKR72MdrCEhpyJjomH0RADokD4OFI5Ap0GGudyn7IqNkC2xhGJEZ7mxEumfX4Ps
	+h3Vh8mejGCeM5TV1IZElLVBGnXKkpIcusfssX54xs0DY6CyLXGYSGxeu5gbAEBg==
X-Google-Smtp-Source: AGHT+IHT9NWC1rgEm9qK+BPToIU5Hxm5m4NPKnzzvKzunKaS4LQyc5IA7YCwWqt6RddVSMBFMR5E/A==
X-Received: by 2002:a05:600c:3593:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-477c0162f1fmr134635935e9.7.1763996919504;
        Mon, 24 Nov 2025 07:08:39 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86/intel: Resync intel-family.h
Date: Mon, 24 Nov 2025 15:08:37 +0000
Message-Id: <20251124150837.654354-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Kevin Lampis <kevin.lampis@citrix.com>

I'm unsure about the Intel CPU Core types, but it's probably better to keep
them than strip them from our copy.
---
 xen/arch/x86/include/asm/intel-family.h | 68 +++++++++++++++++++++----
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/include/asm/intel-family.h b/xen/arch/x86/include/asm/intel-family.h
index d8c0bcc406de..cc3fb4cc471f 100644
--- a/xen/arch/x86/include/asm/intel-family.h
+++ b/xen/arch/x86/include/asm/intel-family.h
@@ -1,8 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Snapshot from Linux:
- *   db4001f9cc32e3ef105a4e4f492d7d813b28292a
- *   x86/cpu/vfm: Delete all the *_FAM6_ CPU #defines
+ *   89216c9051ef6635f1514f8e0d2f9cd63b37a3b6
+ *   x86/cpu: Add/fix core comments for {Panther,Nova} Lake
  */
 #ifndef _ASM_X86_INTEL_FAMILY_H
 #define _ASM_X86_INTEL_FAMILY_H
@@ -50,7 +50,18 @@
 /* Wildcard match so X86_MATCH_VFM(ANY) works */
 #define INTEL_ANY			IFM(X86_FAMILY_ANY, X86_MODEL_ANY)
 
+/* Family 5 */
+#define INTEL_FAM5_START		IFM(5, 0x00) /* Notational marker, also P5 A-step */
+#define INTEL_PENTIUM_75		IFM(5, 0x02) /* P54C */
+#define INTEL_PENTIUM_MMX		IFM(5, 0x04) /* P55C */
+#define INTEL_QUARK_X1000		IFM(5, 0x09) /* Quark X1000 SoC */
+
+/* Family 6, 18, 19 */
 #define INTEL_PENTIUM_PRO		IFM(6, 0x01)
+#define INTEL_PENTIUM_II_KLAMATH	IFM(6, 0x03)
+#define INTEL_PENTIUM_III_DESCHUTES	IFM(6, 0x05)
+#define INTEL_PENTIUM_III_TUALATIN	IFM(6, 0x0B)
+#define INTEL_PENTIUM_M_DOTHAN		IFM(6, 0x0D)
 
 #define INTEL_CORE_YONAH		IFM(6, 0x0E)
 
@@ -115,11 +126,15 @@
 
 #define INTEL_SAPPHIRERAPIDS_X		IFM(6, 0x8F) /* Golden Cove */
 
-#define INTEL_EMERALDRAPIDS_X		IFM(6, 0xCF)
+#define INTEL_EMERALDRAPIDS_X		IFM(6, 0xCF) /* Raptor Cove */
 
-#define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD)
+#define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD) /* Redwood Cove */
 #define INTEL_GRANITERAPIDS_D		IFM(6, 0xAE)
 
+#define INTEL_DIAMONDRAPIDS_X		IFM(19, 0x01) /* Panther Cove */
+
+#define INTEL_BARTLETTLAKE		IFM(6, 0xD7) /* Raptor Cove */
+
 /* "Hybrid" Processors (P-Core/E-Core) */
 
 #define INTEL_LAKEFIELD			IFM(6, 0x8A) /* Sunny Cove / Tremont */
@@ -131,14 +146,21 @@
 #define INTEL_RAPTORLAKE_P		IFM(6, 0xBA)
 #define INTEL_RAPTORLAKE_S		IFM(6, 0xBF)
 
-#define INTEL_METEORLAKE		IFM(6, 0xAC)
+#define INTEL_METEORLAKE		IFM(6, 0xAC) /* Redwood Cove / Crestmont */
 #define INTEL_METEORLAKE_L		IFM(6, 0xAA)
 
-#define INTEL_ARROWLAKE_H		IFM(6, 0xC5)
+#define INTEL_ARROWLAKE_H		IFM(6, 0xC5) /* Lion Cove / Skymont */
 #define INTEL_ARROWLAKE			IFM(6, 0xC6)
 #define INTEL_ARROWLAKE_U		IFM(6, 0xB5)
 
-#define INTEL_LUNARLAKE_M		IFM(6, 0xBD)
+#define INTEL_LUNARLAKE_M		IFM(6, 0xBD) /* Lion Cove / Skymont */
+
+#define INTEL_PANTHERLAKE_L		IFM(6, 0xCC) /* Cougar Cove / Darkmont */
+
+#define INTEL_WILDCATLAKE_L		IFM(6, 0xD5)
+
+#define INTEL_NOVALAKE			IFM(18, 0x01) /* Coyote Cove / Arctic Wolf */
+#define INTEL_NOVALAKE_L		IFM(18, 0x03) /* Coyote Cove / Arctic Wolf */
 
 /* "Small Core" Processors (Atom/E-Core) */
 
@@ -152,9 +174,9 @@
 #define INTEL_ATOM_SILVERMONT		IFM(6, 0x37) /* Bay Trail, Valleyview */
 #define INTEL_ATOM_SILVERMONT_D		IFM(6, 0x4D) /* Avaton, Rangely */
 #define INTEL_ATOM_SILVERMONT_MID	IFM(6, 0x4A) /* Merriefield */
+#define INTEL_ATOM_SILVERMONT_MID2	IFM(6, 0x5A) /* Anniedale */
 
 #define INTEL_ATOM_AIRMONT		IFM(6, 0x4C) /* Cherry Trail, Braswell */
-#define INTEL_ATOM_AIRMONT_MID		IFM(6, 0x5A) /* Moorefield */
 #define INTEL_ATOM_AIRMONT_NP		IFM(6, 0x75) /* Lightning Mountain */
 
 #define INTEL_ATOM_GOLDMONT		IFM(6, 0x5C) /* Apollo Lake */
@@ -179,8 +201,32 @@
 #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
 #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
 
-/* Family 5 */
-#define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
-#define INTEL_QUARK_X1000		IFM(5, 0x09) /* Quark X1000 SoC */
+/* Notational marker denoting the last Family 6 model */
+#define INTEL_FAM6_LAST			IFM(6, 0xFF)
+
+/* Family 15 - NetBurst */
+#define INTEL_P4_WILLAMETTE		IFM(15, 0x01) /* Also Xeon Foster */
+#define INTEL_P4_PRESCOTT		IFM(15, 0x03)
+#define INTEL_P4_PRESCOTT_2M		IFM(15, 0x04)
+#define INTEL_P4_CEDARMILL		IFM(15, 0x06) /* Also Xeon Dempsey */
+
+/*
+ * Intel CPU core types
+ *
+ * CPUID.1AH.EAX[31:0] uniquely identifies the microarchitecture
+ * of the core. Bits 31-24 indicates its core type (Core or Atom)
+ * and Bits [23:0] indicates the native model ID of the core.
+ * Core type and native model ID are defined in below enumerations.
+ */
+enum intel_cpu_type {
+	INTEL_CPU_TYPE_UNKNOWN,
+	INTEL_CPU_TYPE_ATOM = 0x20,
+	INTEL_CPU_TYPE_CORE = 0x40,
+};
+
+enum intel_native_id {
+	INTEL_ATOM_CMT_NATIVE_ID = 0x2,  /* Crestmont */
+	INTEL_ATOM_SKT_NATIVE_ID = 0x3,  /* Skymont */
+};
 
 #endif /* _ASM_X86_INTEL_FAMILY_H */

base-commit: bc23a49d13a30de06a961dfaccc4a19262fe9967
-- 
2.39.5


