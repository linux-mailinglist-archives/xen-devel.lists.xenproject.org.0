Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F43B07C12
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045522.1415692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yq-0003nz-6E; Wed, 16 Jul 2025 17:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045522.1415692; Wed, 16 Jul 2025 17:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yp-0003ih-V7; Wed, 16 Jul 2025 17:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1045522;
 Wed, 16 Jul 2025 17:31:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5yo-00030y-S6
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:42 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc276d58-626a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 19:31:41 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso66805f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:41 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:39 -0700 (PDT)
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
X-Inumbo-ID: bc276d58-626a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687100; x=1753291900; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKAPvis3UQ2b1oSSC4VWDVhBOhANhWsodZ/HjXmcnzE=;
        b=hQihdnzrgbHMsFDiERSDFRjaWq5jWEi5KF0E1xPn1PGGUUiVgYEOmg6DOEjy9Xyr3C
         l2rs0NHppw0WgRmHLHvgI45FvdG67Hju8QC+y77TKR+PnbXaLQchRYjk8bcWdvCoEIpA
         H/R7KQedOqFv3b8Z21hJKMWaJdiodkyVzdHIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687100; x=1753291900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKAPvis3UQ2b1oSSC4VWDVhBOhANhWsodZ/HjXmcnzE=;
        b=o1NR1AEVlcPOvLHv5kkeIi2eemSok277gYMJKlIKJWgtlnPK0cWGwsOJTFm1KKPWLh
         +Y8VKUM+tii+1dD6LsBqf8S0RDFXfDds+CmG91geHy7hiT50KBunjf5bj3AzCe11ddiJ
         ohZxq9P6l7qu8n1ivUH1lEquOmHegOvAOl56YsnRardaHa7tg5R5KQ+2TEYiLbYOIMHd
         M9CZPyje4DOAKHOhmkFUxziVCZ7NB49R729ElEbKFkw6CPjyFYTTivk0N/1pAlmT6NSf
         hEsq0ITwB+73PkQ7p6n1yhnofuGD23bKIAchi7YI6eWBpOSKC2G2SnxlyugCtwDcwfWk
         N39w==
X-Gm-Message-State: AOJu0YwVC/qEjWggaJpieQmbDwnMc5OcZY+vbm213hFLV/sLLU+ZuVT1
	D1pitmxLAKkGvILUSNlIHfrHdQqjdi0cy7jGAvQfne83s1+4LmrBNlFtHXp5BnwxXSLWp2LmsGw
	9zXgtSKVwgw==
X-Gm-Gg: ASbGnctTbtlTnq2KTWWh5kimdkcJqGaWVPPTCwNa9SV0vyFVErdGCWr2fE8NZej778t
	T7xcbuIASN9bY0+dWVp2yRhNbBmYYshKvuEXL0w98QcG9w7/A6jK6Y81hLmWuzP+9hJREkIMhAH
	U8pVwazvkGV7RuOAhi9lbuiWkIUBQZWvLnNbH24CIMAhS9XUYxgv18zFsboO1LGBgxggexMLtRU
	iVjqSsB06dcnEOEwtpYh4MmLh67CVhC2LIgF/hgaNdcOHQEmbGrtz8CQb/kbi4lmwwRCpqrvlHp
	f0VV9eRolffHpdHhHy7gSp9qEk4qZENyJhlerv5gkIUYYdiXuaQ+clFY0MiltoY/hpTdS0fgim8
	ssmj9L2geKhUYSezAk4OU7vYVf59J7xGrWMO4FfgMD40UD+oxIu0eUNSV009p91Up7rVtmxu69L
	m+XLAS/pdQbYM=
X-Google-Smtp-Source: AGHT+IGuOUFb9On/HRhWgVEKTJCn+qFOiFKnj7/mEmRrFFTdg2Tjsv8eOlpKNj8dkRdwsq90mMvWEA==
X-Received: by 2002:a05:6000:1883:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b60dd8e7f7mr4101040f8f.57.1752687100452;
        Wed, 16 Jul 2025 10:31:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/6] x86/match-cpu: Support matching on steppings
Date: Wed, 16 Jul 2025 18:31:31 +0100
Message-Id: <20250716173132.2213891-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Architecturally, stepping is a 4-bit field, so a uint16_t suffices for a
bitmap of steppings.

In order to keep the size of struct x86_cpu_id the same, shrink the vendor and
family fields, neither of which need to be uint16_t in Xen.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Linux supports all fields being optional.  This has lead to using
X86_MATCH_CPU(ANY, ANY, ANY, ANY, FEATURE_FOO, NULL) in place of
boot_cpu_has(), and is not a construct I think we want to encorage.
---
 xen/arch/x86/cpu/common.c            |  4 +++-
 xen/arch/x86/include/asm/match-cpu.h | 12 ++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cc004fc976f5..fc25935d3109 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -1003,13 +1003,15 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
 	const struct x86_cpu_id *m;
 	const struct cpuinfo_x86 *c = &boot_cpu_data;
 
-	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
+	for (m = table; m->vendor | m->family | m->model | m->steppings | m->feature; m++) {
 		if (c->x86_vendor != m->vendor)
 			continue;
 		if (c->x86 != m->family)
 			continue;
 		if (c->x86_model != m->model)
 			continue;
+		if (m->steppings && !(m->steppings & (1U << c->stepping)))
+			continue;
 		if (!cpu_has(c, m->feature))
 			continue;
 		return m;
diff --git a/xen/arch/x86/include/asm/match-cpu.h b/xen/arch/x86/include/asm/match-cpu.h
index dcdc50a70d14..3862e766ccfc 100644
--- a/xen/arch/x86/include/asm/match-cpu.h
+++ b/xen/arch/x86/include/asm/match-cpu.h
@@ -8,28 +8,32 @@
 #include <asm/intel-family.h>
 #include <asm/x86-vendors.h>
 
+#define X86_STEPPINGS_ANY 0
 #define X86_FEATURE_ANY X86_FEATURE_LM
 
 struct x86_cpu_id {
-    uint16_t vendor;
-    uint16_t family;
+    uint8_t vendor;
+    uint8_t family;
     uint16_t model;
+    uint16_t steppings; /* Stepping bitmap, or X86_STEPPINGS_ANY */
     uint16_t feature;   /* X86_FEATURE_*, or X86_FEATURE_ANY */
     const void *driver_data;
 };
 
-#define X86_MATCH_CPU(v, f, m, feat, data)                      \
+#define X86_MATCH_CPU(v, f, m, steps, feat, data)               \
     {                                                           \
         .vendor       = (v),                                    \
         .family       = (f),                                    \
         .model        = (m),                                    \
+        .steppings    = (steps),                                \
         .feature      = (feat),                                 \
         .driver_data  = (const void *)(unsigned long)(data),    \
     }
 
 #define X86_MATCH_VFM(vfm, data)                                \
     X86_MATCH_CPU(VFM_VENDOR(vfm), VFM_FAMILY(vfm),             \
-                  VFM_MODEL(vfm), X86_FEATURE_ANY, data)
+                  VFM_MODEL(vfm), X86_STEPPINGS_ANY,            \
+                  X86_FEATURE_ANY, data)
 
 /*
  * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
-- 
2.39.5


