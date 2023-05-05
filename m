Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E746F8841
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 19:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530595.826306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgE-0006f6-SE; Fri, 05 May 2023 17:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530595.826306; Fri, 05 May 2023 17:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puzgE-0006bM-NC; Fri, 05 May 2023 17:57:18 +0000
Received: by outflank-mailman (input) for mailman id 530595;
 Fri, 05 May 2023 17:57:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1gM=A2=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1puzgD-0006Yg-6R
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 17:57:17 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 452f0c61-eb6e-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 19:57:15 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so14131365e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 May 2023 10:57:15 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b12-20020adfe30c000000b00306423904d6sm3053844wrj.45.2023.05.05.10.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 10:57:14 -0700 (PDT)
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
X-Inumbo-ID: 452f0c61-eb6e-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683309435; x=1685901435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2enxHJVvB53hhS6w5p4MreN4cLpgSnyXWT9wrZUvS/4=;
        b=S6WP4jZQqFuckveRJuLLwmmlAWJchVAJAb9jg7PVGcyB+N56rwpZ2AwOxLV671Sz+Q
         FE2T1YlC1BiiUjDV2uZ8Nf7jEsflLCwPGXr13DpeKCJpId6dtgybo09rgCJXJtEamKwj
         4KmLO8o+npkY8s8YD/XtuytYHkOev4UdELeDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309435; x=1685901435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2enxHJVvB53hhS6w5p4MreN4cLpgSnyXWT9wrZUvS/4=;
        b=dyFGTTtTIzDFPoWnYnalHt6XIBX5P+U+N9mhMCc/bToBPbc16rc2O8qrM6eDeFjlgZ
         5uWLn14Jyg52kGqfeYw6AsXWP6by89P+Bk1yxb1g+/xJP6ENip//huhCmJWmSLKC2vb9
         JAkhGDSXX9VVmXsuV9ID5Eb0UyHXhVDbmWWbGk6Z3HVtBx2ybwjC1Qf1/O7pGmlhVRUk
         870kGyeQ5iN2uIkZ0HqfZR8JlCrUXH0z1vW3SRxZZlDdLvmCTIMqpnJb4XlJdiLie8Qx
         B1dMRpLaZzF7b6Uu99ryc1klcbyu/psciB3wFyk+aFhLZckwLV65WUEOFIaXkhxwjoaB
         NeFQ==
X-Gm-Message-State: AC+VfDzV5gCsQncdbCCJAFPutJXlTvGeEnEoKfYb6Q0v0l+Lu4gFfDFH
	A+1FXNpq1V5HLYbEyaazgGjLvmIxJo32bWzQjAE=
X-Google-Smtp-Source: ACHHUZ5sPykgAxfLbTpChhsume9wrclYkH7/nFknVv7g/8xzCXnmQiEIye5TXtK5me/BScAefzZtWg==
X-Received: by 2002:a05:600c:2310:b0:3f3:fe82:ee79 with SMTP id 16-20020a05600c231000b003f3fe82ee79mr1707787wmo.23.1683309434835;
        Fri, 05 May 2023 10:57:14 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86: Add AMD's CpuidUserDis bit definitions
Date: Fri,  5 May 2023 18:57:03 +0100
Message-Id: <20230505175705.18098-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
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


