Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB96FCB8C
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532376.828548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRF-00021v-Kf; Tue, 09 May 2023 16:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532376.828548; Tue, 09 May 2023 16:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwQRF-0001u9-G6; Tue, 09 May 2023 16:43:45 +0000
Received: by outflank-mailman (input) for mailman id 532376;
 Tue, 09 May 2023 16:43:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwQRD-0001qp-VG
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:43:43 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8d2fb1d-ee88-11ed-b229-6b7b168915f2;
 Tue, 09 May 2023 18:43:43 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so7279585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:43:43 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s9-20020a5d5109000000b002ffbf2213d4sm14754606wrt.75.2023.05.09.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:43:41 -0700 (PDT)
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
X-Inumbo-ID: a8d2fb1d-ee88-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683650622; x=1686242622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2enxHJVvB53hhS6w5p4MreN4cLpgSnyXWT9wrZUvS/4=;
        b=Jx1Y62UZFeAOx2gMKCjK4jBHh3yhgyKAn9n7FuUAvNutUqg8yAeuRofpXYb8vErxfI
         7mrXPYxG+D4C8qtZvknk5JZ1buBWqM91LA8CGQylC4OiOQNkJyFM8JFHan2FaHKM8qrS
         D4S45+nSoit9/DdwrTanwMs6g87mBGlF5IcYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683650622; x=1686242622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2enxHJVvB53hhS6w5p4MreN4cLpgSnyXWT9wrZUvS/4=;
        b=F+RtZctmdlk1u4hnyJaebmVIITPuxovDcCUH9M5PiGIjHzVJw7EtwKmAwU83XB4gCr
         gv67lLrH4IIwNdMleLU/5Umq13hBN0JARzZmpFVMdzfnK20FgWWdvJzXCvGqFUiAmu0F
         7lxRxns8kfYX/WGGxZP8/KRI8Oxr+6Zveqvi2jtRruz9GvAtHZKgh4Vzhe1FW9BJD50z
         U9cg1MTMQ0FlNGKa8lkYIu7yBpwj5UR6opRa5bBBkjJtJX5YsP4WzTJ8EGDBAeXg9qpP
         m49XQ7mRPXR0X89DCO2UG62FjtKJcz9g67wytX6YxRGX5mWELFF02gfKtLLnyDXlZKRz
         LMeA==
X-Gm-Message-State: AC+VfDxVHJPam9f7x1Yy0O51mWMYpNhF+7+6Z8QCqLZTQbof7kq6G37A
	qQwBzninmoSbTx5llR5TlwYsCiZvflXaM9BplII=
X-Google-Smtp-Source: ACHHUZ581+1hPFk3uezFqtzRz8gKAsnHQjClnXioOR9gPVCwBkgpowVceLxszo8PH6MPDLUn03qoRg==
X-Received: by 2002:a05:600c:2206:b0:3f4:2220:28cc with SMTP id z6-20020a05600c220600b003f4222028ccmr5959782wml.9.1683650622346;
        Tue, 09 May 2023 09:43:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] x86: Add AMD's CpuidUserDis bit definitions
Date: Tue,  9 May 2023 17:43:34 +0100
Message-Id: <20230509164336.12523-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
References: <20230509164336.12523-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMD reports support for CpuidUserDis in CPUID and provides the toggle in HWCR.
This patch adds the positions of both of those bits to both xen and tools.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 2 ++
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 5f0bf93810..4d2fab5414 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -317,6 +317,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
 
         {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
         {"nscb",         0x80000021, NA, CPUID_REG_EAX,  6,  1},
+        {"cpuid-user-dis", 0x80000021, NA, CPUID_REG_EAX, 17,  1},
 
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index d7efc59d31..8ec143ebc8 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -199,6 +199,8 @@ static const char *const str_e21a[32] =
 {
     [ 2] = "lfence+",
     [ 6] = "nscb",
+
+    /* 16 */                [17] = "cpuid-user-dis",
 };
 
 static const char *const str_7b1[32] =
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index fa771ed0b5..082fb2e0d9 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -337,6 +337,7 @@
 
 #define MSR_K8_HWCR			0xc0010015
 #define K8_HWCR_TSC_FREQ_SEL		(1ULL << 24)
+#define K8_HWCR_CPUID_USER_DIS		(1ULL << 35)
 
 #define MSR_K7_FID_VID_CTL		0xc0010041
 #define MSR_K7_FID_VID_STATUS		0xc0010042
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 12e3dc80c6..623dcb1bce 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
 XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
+XEN_CPUFEATURE(CPUID_USER_DIS,     11*32+17) /*   CPUID disable for non-privileged software */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
-- 
2.34.1


