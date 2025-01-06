Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E1A02DF0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 17:41:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865838.1277107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqAU-0000j9-9v; Mon, 06 Jan 2025 16:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865838.1277107; Mon, 06 Jan 2025 16:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqAU-0000ge-7K; Mon, 06 Jan 2025 16:41:30 +0000
Received: by outflank-mailman (input) for mailman id 865838;
 Mon, 06 Jan 2025 16:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUqAT-0000gY-2S
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 16:41:29 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12bf8ffb-cc4d-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 17:41:27 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d34030ebb2so9489440a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 08:41:27 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80676f496sm23267140a12.34.2025.01.06.08.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 08:41:25 -0800 (PST)
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
X-Inumbo-ID: 12bf8ffb-cc4d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736181686; x=1736786486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bu1qdeQ8htGAhO8BhpqxLGX5bJRujvB81kYlK6uEgI=;
        b=DQbvs5F06Oi8DkZKJi8eC1UonzezZ2GHN0OPJxdQZe6G76yxk1AcEggQdNhc5cGvP/
         dHhXKLbuxPnf+YgjWipbmLP+5zXgzR41zHZLwwMxI4dcvMvWqhXXYh9S6BMYV9U327je
         wP9yjyREW3fRxBaMtb8/jrZgGIlbeKlLtzvbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736181686; x=1736786486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Bu1qdeQ8htGAhO8BhpqxLGX5bJRujvB81kYlK6uEgI=;
        b=H/oA/NhLTFBV3tfuD5fswQSCt9lWD68tNSYMLah2mfkNjshQ4WekobqOQTLM4FVEBZ
         mQ4GfK4wy7eYDluMpxHW8ZbFRWlWXoMQHgkp7ZsoKIIuBtPyxcdpWS0wJgAihM3st0Ef
         UBc4GQbS/hfM9y4kQbugZtdh1zm+HvPtJLh0fg5jX9OzeaU9/pDL3SLNmDiXef1FFA52
         xbmWw5GGk/S1suNh8F34pxIJxT6bZecDJ7Ner+duEA4wkBDz/ZM6pI+EnJM7R5GbI0eK
         DDxyzSSS9y/tGkasAqBDWdJkUZY+6I+QPM9VsflBNhvln5g3ouHCpC6dFl5Zft1cadm1
         HrWQ==
X-Gm-Message-State: AOJu0Yxj+3OlOQEpHfuBLa7Ai7UX9tQgcADyslDBAvjm7QxLafFw+Oqr
	Sc7ZVxMGuJPahVHREtv7YOM2yELfy8So0uzRxdT8s0kxNXY4G6JSWhS/Z83zBdM5Hg/HAAcG0N/
	q5UkgFA==
X-Gm-Gg: ASbGnctPJc6wT9R/CvvBMURIr8svaHuGS/qTd3ZY19Vwt5aJlSo81ggkO6mKC6OsrSi
	avJxGlBnoIe3iuTAFAny34S85rarUB93LC7vh+BHkuxnSKV/XhRjDjb/w6Dgb26wZv1PiBrRgRP
	e/MBlz56/njqa/JJfBjgy8v21oAm/q/QBfGmx4pdp1g381O4TuDOUM79feEQrwtnIhJSurTYGbC
	n6Mo1PPa8vIW98EWSUdpzI3aj9GAKM6/LLaVvPi10bHo48FijoxHFjzYWlcFaDunL+xoaFU7/vt
	qD4k5QLLrf5+O7RhJeMs13x75oXnNzjqpjAh
X-Google-Smtp-Source: AGHT+IG/A14ES5hpSkLUN8HO9fYBY5rlRi/+8BeGrsHVDqB95AMu092Luhvkl704d+CKNOFu3HLSWA==
X-Received: by 2002:a05:6402:270d:b0:5d2:73b0:81e8 with SMTP id 4fb4d7f45d1cf-5d81dd820admr50512155a12.9.1736181686289;
        Mon, 06 Jan 2025 08:41:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20 v2] x86/amd: Misc setup for Fam1Ah processors
Date: Mon,  6 Jan 2025 16:41:24 +0000
Message-Id: <20250106164124.620662-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fam1Ah is similar to Fam19h in these regards.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Update microcode size, based on the largest value I can find in the PPRs.

Defer updating amd_log_freq() for now.  The MSR layout is different and rather
more complicated to parse.

With this patch, I think we're in an ok position to declare support on Zen5
CPUs.  I'm very disappointed that AMD don't have any documetation about ERAPS,
but to the best of my (backchannel) knowledge, Xen should behave safely.
---
 xen/arch/x86/acpi/cpu_idle.c     | 1 +
 xen/arch/x86/cpu/microcode/amd.c | 4 ++++
 xen/arch/x86/cpu/vpmu_amd.c      | 1 +
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 876317fad059..420198406def 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1417,6 +1417,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
 
     switch ( c->x86 )
     {
+    case 0x1a:
     case 0x19:
     case 0x18:
         if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index ba7668a94670..210736f5804a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -114,6 +114,7 @@ static bool verify_patch_size(uint32_t patch_size)
 #define F16H_MPB_MAX_SIZE 3458
 #define F17H_MPB_MAX_SIZE 3200
 #define F19H_MPB_MAX_SIZE 5568
+#define F1AH_MPB_MAX_SIZE 15296
 
     switch ( boot_cpu_data.x86 )
     {
@@ -132,6 +133,9 @@ static bool verify_patch_size(uint32_t patch_size)
     case 0x19:
         max_size = F19H_MPB_MAX_SIZE;
         break;
+    case 0x1a:
+        max_size = F1AH_MPB_MAX_SIZE;
+        break;
     default:
         max_size = F1XH_MPB_MAX_SIZE;
         break;
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index a082450e923a..a6117dfebf2a 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -568,6 +568,7 @@ const struct arch_vpmu_ops *__init amd_vpmu_init(void)
     case 0x15:
     case 0x17:
     case 0x19:
+    case 0x1a:
         num_counters = F15H_NUM_COUNTERS;
         counters = AMD_F15H_COUNTERS;
         ctrls = AMD_F15H_CTRLS;
-- 
2.39.5


