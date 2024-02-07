Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7D84CFDC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 18:40:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677847.1054746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluL-0005ji-LC; Wed, 07 Feb 2024 17:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677847.1054746; Wed, 07 Feb 2024 17:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXluL-0005i7-HR; Wed, 07 Feb 2024 17:40:25 +0000
Received: by outflank-mailman (input) for mailman id 677847;
 Wed, 07 Feb 2024 17:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q5t=JQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rXluJ-0005Tj-IS
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 17:40:23 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f762fe44-c5df-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 18:40:21 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2a17f3217aso110280766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 09:40:21 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 op3-20020a170906bce300b00a37669280d1sm976355ejb.141.2024.02.07.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 09:40:19 -0800 (PST)
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
X-Inumbo-ID: f762fe44-c5df-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707327621; x=1707932421; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hjQ03fb4gTy1nB5aYDQXgvwccHLoP4GL/zVeSr+oE4=;
        b=FWuphzI+t9EusMvTOLYSbPCBE0rojA0TSYYslW1S2FTkw7z459xTXBW0zQDljPPZuL
         N6PsmJ5N8V0L//WGixo1Vrr9DD7j6gNs/kIuPAuVVcivS3pJfxdMn6/xgC8KltshQMdE
         pNrwN5Y5j2QoPzDE+T/D+BcWjX/AaL+voI1KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707327621; x=1707932421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hjQ03fb4gTy1nB5aYDQXgvwccHLoP4GL/zVeSr+oE4=;
        b=MtcEy8iE0XuU8rZWhTC6SyWIwPmHa+bxwX3KT85cNca65hxtIBu/3KD4K1jB/H0LH7
         kiqnjuMzK5ZI3GuW42P1B9/S0GgZsi8cxkHacTfdrwEFsaFI2kwm6oMGmvEWDKSe7sh2
         m6ZOSPsjFP/6t+IrVl0VrA5TqNaTjNK1ArFRJ1uln0bhDDaKg+mFitDaVB+axDXxOU1y
         6G9WKZGbklHAMH7mANnTfXt3xrHr8C3fyUh+zJJxekRJNyLqXi87+tCXj8khAEgQszDm
         ZDgXAZGMJ8+ZEbZ5OSt3IDjZixSIGGWs5gA801tfDSpmdG9ekOn6v3Ywf8JYr78sFled
         ef5w==
X-Gm-Message-State: AOJu0Yweqssvhyy7pr0nN7bG/h5YTqTMV7Q5NGokLcInZ1ynpw/0X34l
	r+XOZXIFRpoqJrlmHz7+W7qXCNxCPyfedAazTVx53EbywyCUKF/dRiRrx0+xFSsKj2x+4au6/ao
	s
X-Google-Smtp-Source: AGHT+IHXF4iCI5cUyuRNUfpzz5Nygg8GIH0vsQ0EZmE3VpuusshmPnBXuPJdBt5m9k7Mcz+oFVS0XQ==
X-Received: by 2002:a17:906:1c5:b0:a35:103e:3614 with SMTP id 5-20020a17090601c500b00a35103e3614mr4214546ejj.52.1707327620723;
        Wed, 07 Feb 2024 09:40:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAS9JeEvannetqUxhv+QgmoRsEdjhaEIVOAi6+SmbdeoIyM4R9mh2xgAQBkALvkDnr2n63Q83ejxNypl8yn5tIL0/CsOQh5VtR9zVzpmyTTtTWsxO+C5/DMwMb2J4TO3qp1DJaIKW/bTAqi90aHYgiJh1nZvqxa1CjWcr4Ca8brIS+dYe6vENEMMGfizXYa91EmZrSDslDEfu/BexVP3EWe6yNwrxIxz1yoA==
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] tools/xg: Move xc_cpu_policy_t to xenguest.h
Date: Wed,  7 Feb 2024 17:39:55 +0000
Message-Id: <20240207173957.19811-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables a set of follow-up simplifications in the toolstack.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenguest.h             |  8 +++++++-
 tools/libs/guest/xg_private.h        | 10 ----------
 xen/include/xen/lib/x86/cpu-policy.h |  6 ++++--
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b772a..4e9078fdee4d 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -784,7 +784,13 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
                       unsigned long *mfn0);
 
 #if defined(__i386__) || defined(__x86_64__)
-typedef struct xc_cpu_policy xc_cpu_policy_t;
+#include <xen/lib/x86/cpu-policy.h>
+
+typedef struct xc_cpu_policy {
+    struct cpu_policy policy;
+    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
+    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
+} xc_cpu_policy_t;
 
 /* Create and free a xc_cpu_policy object. */
 xc_cpu_policy_t *xc_cpu_policy_init(void);
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index d73947094f2e..d1940f1ea482 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -170,14 +170,4 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
-#if defined(__x86_64__) || defined(__i386__)
-#include <xen/lib/x86/cpu-policy.h>
-
-struct xc_cpu_policy {
-    struct cpu_policy policy;
-    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
-    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
-};
-#endif /* x86 */
-
 #endif /* XG_PRIVATE_H */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d5e447e9dc06..0cd454dfc0b6 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -85,6 +85,8 @@ unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
+#define XENLIB_MAX(x, y) ((x) < (y) ? (y) : (x))
+
 #define CPUID_GUEST_NR_BASIC      (0xdu + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
@@ -92,8 +94,8 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
 #define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
-#define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
-                                      CPUID_GUEST_NR_EXTD_AMD)
+#define CPUID_GUEST_NR_EXTD       XENLIB_MAX(CPUID_GUEST_NR_EXTD_INTEL, \
+                                             CPUID_GUEST_NR_EXTD_AMD)
 
 /*
  * Maximum number of leaves a struct cpu_policy turns into when serialised for
-- 
2.34.1


