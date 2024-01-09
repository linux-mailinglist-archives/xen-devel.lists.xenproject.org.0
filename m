Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549AC828921
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664699.1034799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBf-0008JS-U4; Tue, 09 Jan 2024 15:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664699.1034799; Tue, 09 Jan 2024 15:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBf-0008HN-Qk; Tue, 09 Jan 2024 15:38:43 +0000
Received: by outflank-mailman (input) for mailman id 664699;
 Tue, 09 Jan 2024 15:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBe-00081L-1O
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:42 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29fdd3c8-af05-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 16:38:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d5336986cso40412885e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:41 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:38:39 -0800 (PST)
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
X-Inumbo-ID: 29fdd3c8-af05-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814720; x=1705419520; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+00zpDD6E1F2vymnDKj104s79dZsxIp75zMuYgp0YY0=;
        b=gr2qTOtuZqyPVqd6P3vBDX4ulp7+VgwR10D9Vo9Lclgc+kyeZ12vC+3pjGkjMXcwQf
         855q0K1Vig+UtngUpzKjJBygCBP9OW5xfuxT9t3y7M6unGs39QG1Coi6NsYiC25oBItS
         Xz0wMbRDnB8vJMyspBzIrxPtF5PKgNJlNkGRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814720; x=1705419520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+00zpDD6E1F2vymnDKj104s79dZsxIp75zMuYgp0YY0=;
        b=gR+7dMd7RzypzrKvYxIOO/bs8aotn/J9iKs5rwTuZ6mFwzppgiaA0gnBm9n5Deh+CU
         SailEh5UFxxSZdCtAHzIlZ1Z8DfYDauKlZo2A1ipqZUiXc1FVMpm53BoFmA4+m/WRKEo
         K0GFKLZHVMqstXU9JJfknVtKqJm4RVTMdbov1DYo+9X0WdUS2cRLa+5sKXP6c839BogF
         z1GW7/02hL3eWLRgZtk/Z4LwlIr9FFPCfeJSLOxAqr3CsukgsQiSYVVtGoDqM8QXpex1
         No0gjVT2Kpbq8ThSF3xxCATvV+P16kKM2OxZPH8fCvcrQN3Dpgv7Zc5LE6gG7tEvs3TQ
         f2dw==
X-Gm-Message-State: AOJu0Yy8GjHOlmz9WFiHiZKLzIukuR1tjNSFRpVB3blYi0FPLU5+FKg3
	u/0Yh4jWnpW/uWGw2BJotrtra4JAe4JtnZZl7PqixfYoO0c=
X-Google-Smtp-Source: AGHT+IFMsroVWEpT8SgYSbgTDA+tq4Q7UFJVMCwsEySCtcDdTqRvpp+J6jABJErYFEZOm5SYRhPvRg==
X-Received: by 2002:a1c:7707:0:b0:40e:4921:5044 with SMTP id t7-20020a1c7707000000b0040e49215044mr1207878wmi.55.1704814720090;
        Tue, 09 Jan 2024 07:38:40 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/6] tools/xc: Add xc_cpu_policy to the public xenctrl.h header
Date: Tue,  9 Jan 2024 15:38:30 +0000
Message-Id: <20240109153834.4192-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move struct xc_cpu_policy data structure out of xg_private.h and into
the public xenguest.h so it can be used by libxl.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/include/xenguest.h             |  8 +++++++-
 tools/libs/guest/xg_private.h        | 10 ----------
 xen/include/xen/lib/x86/cpu-policy.h |  5 +++++
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index e01f494b77..4e9078fdee 100644
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
index d73947094f..d1940f1ea4 100644
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
index 14724cedff..65f6335b32 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -85,6 +85,11 @@ unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
  */
 const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 
+#ifndef __XEN__
+/* Needed for MAX() */
+#include <xen-tools/common-macros.h>
+#endif /* __XEN__ */
+
 #define CPUID_GUEST_NR_BASIC      (0xdu + 1)
 #define CPUID_GUEST_NR_CACHE      (5u + 1)
 #define CPUID_GUEST_NR_FEAT       (2u + 1)
-- 
2.34.1


