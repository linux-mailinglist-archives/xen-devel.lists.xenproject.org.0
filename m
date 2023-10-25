Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921717D7444
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 21:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623196.970852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZx-0003DQ-HN; Wed, 25 Oct 2023 19:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623196.970852; Wed, 25 Oct 2023 19:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvjZx-00035p-88; Wed, 25 Oct 2023 19:30:09 +0000
Received: by outflank-mailman (input) for mailman id 623196;
 Wed, 25 Oct 2023 19:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qvjZv-0001Lv-QS
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 19:30:07 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e659d384-736c-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 21:30:05 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso22281666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 12:30:05 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b00985ed2f1584sm10408710ejc.187.2023.10.25.12.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 12:30:03 -0700 (PDT)
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
X-Inumbo-ID: e659d384-736c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698262205; x=1698867005; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyM84Qdg+WVAc6W6qy0lJuiinDdESDwhb8Pnza3zSdg=;
        b=TREcwNwslcqulnMJM9Y6FLewz5cHe1Hz4X+rjmMCi/K/8iqnFKZInoxPSbmIcwLNhp
         iT8GzVo/CcyQvtenaoxKN/aHbOy0inyQVricThg5p9q1hGCrEcx9GXH8KiwarYm8PaYH
         GGT95TTX9HRg0kp9fLAZfAmjdH2abr7fM6oUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262205; x=1698867005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyM84Qdg+WVAc6W6qy0lJuiinDdESDwhb8Pnza3zSdg=;
        b=cAJdkvqmHWpOKv7f8VoNnU71oRp8TneYrVpLZSxn84LEQ9R8TFvAotzUvoIOSoeJj5
         tlF/gjVBSzLIM/p5vTzhsLiBuEMmNk22iO63i/VmlAIWOU3lH6X8X6tkcl1qW+KBHCP3
         Us5WEbBNltLARvfYxgpoHl943gRzca7v9tDyd8R2kCABlfwIY0qapyYEV9vMXxLWB88m
         yr7BF/0FemFQ5ZQHxGVPJLXTYOJWsg4+9IGQVPrP00lp/gCtndniDAePODoS6Qh6nGGl
         MXbidWR0Le/ay1R+veYvSEOWOS+5HDghaoFuUoN5DGK9Qpt9C6dO0OrT99qLz+QtC0KS
         +OEA==
X-Gm-Message-State: AOJu0Yw14JIYIhdMtk+OmvSH7QValAYpC1fZ73FONoxPX+Q+gWqPiVat
	SC2VSUePgbwJqI7RyO4VBxbvO+HFSoHZbwSrzWMxxcXR
X-Google-Smtp-Source: AGHT+IFgN/mYcpUyc35YlHMAiXwlT37k7ePUjpzOqHB9F7IC7ofILTlN4WwhoN+j9LJVlHLG4MDqlA==
X-Received: by 2002:a17:907:97d4:b0:9bf:63b2:b6f0 with SMTP id js20-20020a17090797d400b009bf63b2b6f0mr12183499ejc.29.1698262204605;
        Wed, 25 Oct 2023 12:30:04 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 08/22] x86/PMUv1: define macro for max number of events
Date: Wed, 25 Oct 2023 20:29:38 +0100
Message-Id: <6f53f17afdf80b63bed4bc0c0d599ae0d8e7af5a.1698261255.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698261255.git.edwin.torok@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

This is needed so we can expose the maximum supported in CPUID,
without cpuid.c and vpmu_intel.c going out of sync.

The macros defined here take a parameter that controls how the enum
values are used: either to generate case statements or to count how many
elements we have.

They are a variation on https://en.wikipedia.org/wiki/X_Macro

No functional change.

Could be backported to 4.13.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c   | 16 ++--------------
 xen/arch/x86/cpuid.c            |  2 +-
 xen/arch/x86/include/asm/vpmu.h | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 44a1ed5b10..ef8d69a0d6 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -622,15 +622,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
                 blocked = 1;
                 switch ( umaskevent )
                 {
-                /*
-                 * See the Pre-Defined Architectural Performance Events table
-                 * from the Intel 64 and IA-32 Architectures Software
-                 * Developer's Manual, Volume 3B, System Programming Guide,
-                 * Part 2.
-                 */
-                case 0x003c:	/* UnHalted Core Cycles */
-                case 0x013c:	/* UnHalted Reference Cycles */
-                case 0x00c0:	/* Instructions Retired */
+                VPMU_IPC_EVENTS(DEFCASE)
                     blocked = 0;
                     break;
                 }
@@ -641,11 +633,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
                 /* Additional counters beyond IPC only; blocked already set. */
                 switch ( umaskevent )
                 {
-                case 0x4f2e:	/* Last Level Cache References */
-                case 0x412e:	/* Last Level Cache Misses */
-                case 0x00c4:	/* Branch Instructions Retired */
-                case 0x00c5:	/* All Branch Mispredict Retired */
-                case 0x01a4:	/* Topdown Slots */
+                VPMU_ARCH_EVENTS(DEFCASE)
                     blocked = 0;
                     break;
                }
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 51ee89afc4..12e768ae87 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -328,7 +328,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
             if ( vpmu_features & (XENPMU_FEATURE_IPC_ONLY |
                                   XENPMU_FEATURE_ARCH_ONLY) ) {
-                unsigned limit = ( vpmu_features & XENPMU_FEATURE_ARCH_ONLY ) ? 8 : 3;
+                unsigned limit = VPMU_IPC_EVENTS_MAX + ( vpmu_features & XENPMU_FEATURE_ARCH_ONLY ) ? VPMU_ARCH_EVENTS_MAX : 0;
                 if (limit < u.arch_nr) {
                     gdprintk(XENLOG_WARNING, "Limiting architectural PMU events to %d (actual %d)", limit, u.arch_nr);
                     u.arch_nr = limit;
diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 1ef6089ccb..49c3e8c19a 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -146,5 +146,32 @@ static inline int vpmu_allocate_context(struct vcpu *v)
 }
 #endif
 
+/*
+ * See "20.2.1.2 Pre-Defined Architectural Performance Events"
+ * from the Intel 64 and IA-32 Architectures Software
+ * Developer's Manual, Volume 3B, System Programming Guide,
+ * Part 2.
+ */
+#define VPMU_IPC_EVENTS(DEF) \
+    DEF(0x003c)	/* UnHalted Core Cycles */\
+    DEF(0x00c0)	/* Instructions Retired */\
+    DEF(0x013c)	/* UnHalted Reference Cycles */\
+
+
+#define VPMU_ARCH_EVENTS(DEF) \
+    VPMU_IPC_EVENTS(DEF)\
+    DEF(0x4f2e)	/* Last Level Cache References */\
+    DEF(0x412e)	/* Last Level Cache Misses */\
+    DEF(0x00c4)	/* Branch Instructions Retired */\
+    DEF(0x00c5)	/* All Branch Mispredict Retired */\
+    DEF(0x01a4)	/* Topdown Slots */\
+
+#define DEFCASE(x) case (x):
+#define DEFSUM(x) +1
+#define DEFCOUNT(X) (0+X(DEFSUM))
+
+#define VPMU_IPC_EVENTS_MAX DEFCOUNT(VPMU_IPC_EVENTS)
+#define VPMU_ARCH_EVENTS_MAX DEFCOUNT(VPMU_ARCH_EVENTS)
+
 #endif /* __ASM_X86_HVM_VPMU_H_*/
 
-- 
2.41.0


