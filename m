Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BFB07C11
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 19:32:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045519.1415665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yo-0003GT-8P; Wed, 16 Jul 2025 17:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045519.1415665; Wed, 16 Jul 2025 17:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc5yo-0003E4-5J; Wed, 16 Jul 2025 17:31:42 +0000
Received: by outflank-mailman (input) for mailman id 1045519;
 Wed, 16 Jul 2025 17:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uFaK=Z5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uc5ym-0002mM-2w
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 17:31:40 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb38eb88-626a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 19:31:39 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45611a517a4so697605e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 10:31:39 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e68sm27048625e9.1.2025.07.16.10.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 10:31:38 -0700 (PDT)
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
X-Inumbo-ID: bb38eb88-626a-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752687099; x=1753291899; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuWKT5EgHoHwknJ0QpFPabebIVFnr/8XAOuFOiO5CxY=;
        b=pBiWjdUzLBaNQKSnlukOqhbXJpEoFAZIu6xiVfZX75Ny0RTSti58hZkeEpbqcT6wcU
         C4UGxXyvn0krv/KCqAMvZe2N1XFdufWdb++R1OMLU9jQsOjtty+d5XJwZbf75OeVmmyb
         mXuMOJtrZjfyKQrr4BRWYjF68q0Dphrk4bKUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752687099; x=1753291899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuWKT5EgHoHwknJ0QpFPabebIVFnr/8XAOuFOiO5CxY=;
        b=atjclPBvpcUjbrJgJ9qihMKmNvcVdthx6P+mTmA1KMoiQYU+PGUDeiozxloDbqe03t
         V5E9Fi2HBSAGzgkads05hrNNnSSCW4jvQm79ENzOGcz2P+kAbGNV7HfgUuXjOIdUwTmc
         mNLCt/KNcXASW01T1gGBfGWOi5U1yFmGxiPLJBtK1UpWqk64EZwglCXukqV4w+NJkLDI
         32G/tDuXIYRp4nqRuwEVIublNaMvalutufqwNREBlKP45MszLhjdQ3Qd+qTOamqXmdO+
         /PIE3E3JYeMY6cdhKWfV5OKLQYAT2gW2hKwHTOWjj71pbzDzSM7tKGe+29QYCt2o4Y+P
         ry/g==
X-Gm-Message-State: AOJu0YzSRWwVXhhwr3JTI8je6f3sAKwRBwvrfXjrUh+T07t+Y6Q2N9HM
	NtCQiuUIdrWyNHm6SF1QWnypGiTOvUkV6/2O6mDKifVt9MADyrJORmdzaBdm4v9yyXBWZaVwFQA
	m3VQM62XAVA==
X-Gm-Gg: ASbGncsesi6UNUIWzPFOU5AHIyLkPjGvvTH3bFuljkuinI3+O1fDAfk2Jxz2YewOXqK
	lW5LZuUDZsFYT4SV23I4rGyzxYVKHcoK9WyJZqHfbjiSq1kDYRBM4s383hWaUjEOpmYEKUiTczH
	lfK2fOzsG9pjHzX56uROPxlryZudNBzRdt7tjHQlOOdM07gsECfnr88QdBXPmPGbc6mvshAAqYG
	/wdKaDQOHmD7/e2vUqvNHUrAHEz9IviTkQXlxWqBJRh53DALf0UzmLvFsBaSzjkqPQdln2RNGFB
	WEQ6gYkfCpmqcOwHfMedxNOSBVfJeaRc1M2S9whoVu+Irw/3d/LNDl/Woh0iKgPcF0cUHenZUA8
	vDsDm3uPbAnkceYMbRqcW3zD+A2LAetgATNyb9gnXrgYUEjlG1+Iu5U4c8CI5w4mDq0LLohFGqI
	TI
X-Google-Smtp-Source: AGHT+IGynP6k8Q9sBl7SRYEXh+IhwA9BUOAAgsi8q1SGfpvDdMhvPK8/YlT2pMvqdwd/AUMI0Rxaiw==
X-Received: by 2002:a05:600c:8901:b0:455:efd7:17dc with SMTP id 5b1f17b1804b1-45634588a24mr2380285e9.11.1752687098614;
        Wed, 16 Jul 2025 10:31:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/6] x86/match-cpu: Introduce X86_MATCH_VFM() and convert intel_idle_ids[]
Date: Wed, 16 Jul 2025 18:31:29 +0100
Message-Id: <20250716173132.2213891-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mwait-idle's ICPU() is the most convenient place to get started.  Introduce
X86_MATCH_CPU() and X86_MATCH_VFM() following their Linux counterparts.

This involves match-cpu.h including more headers, which in turn allows us to
drop a few.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

We now have X86_FEATURE_ANY and X86_FEATURE_ALWAYS as aliases of LM.  Given
the contexts they're used in, I've left the naming as-is.

It's a bit nasty (preprocessing wise) triple-expanding VFM in X86_MATCH_VFM(),
but we need an Integer Constant Expression.
---
 xen/arch/x86/cpu/intel.c             |  1 -
 xen/arch/x86/cpu/mwait-idle.c        |  4 +---
 xen/arch/x86/include/asm/match-cpu.h | 21 ++++++++++++++++++++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index ee1ae92cd7e6..26a171aa363e 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -7,7 +7,6 @@
 
 #include <asm/apic.h>
 #include <asm/i387.h>
-#include <asm/intel-family.h>
 #include <asm/match-cpu.h>
 #include <asm/mpspec.h>
 #include <asm/msr.h>
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index eec2823cbacf..e837cbf50eb3 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -51,7 +51,6 @@
 
 #include <asm/cpuidle.h>
 #include <asm/hpet.h>
-#include <asm/intel-family.h>
 #include <asm/match-cpu.h>
 #include <asm/msr.h>
 #include <asm/mwait.h>
@@ -1302,8 +1301,7 @@ static const struct idle_cpu idle_cpu_srf = {
 };
 
 #define ICPU(model, cpu) \
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ ## model, X86_FEATURE_ALWAYS, \
-	  &idle_cpu_ ## cpu}
+	X86_MATCH_VFM(INTEL_ ## model, &idle_cpu_ ## cpu)
 
 static const struct x86_cpu_id intel_idle_ids[] __initconstrel = {
 	ICPU(NEHALEM_EP,		nehalem),
diff --git a/xen/arch/x86/include/asm/match-cpu.h b/xen/arch/x86/include/asm/match-cpu.h
index 2704b84d74c9..dcdc50a70d14 100644
--- a/xen/arch/x86/include/asm/match-cpu.h
+++ b/xen/arch/x86/include/asm/match-cpu.h
@@ -4,14 +4,33 @@
 
 #include <xen/stdint.h>
 
+#include <asm/cpufeature.h>
+#include <asm/intel-family.h>
+#include <asm/x86-vendors.h>
+
+#define X86_FEATURE_ANY X86_FEATURE_LM
+
 struct x86_cpu_id {
     uint16_t vendor;
     uint16_t family;
     uint16_t model;
-    uint16_t feature;
+    uint16_t feature;   /* X86_FEATURE_*, or X86_FEATURE_ANY */
     const void *driver_data;
 };
 
+#define X86_MATCH_CPU(v, f, m, feat, data)                      \
+    {                                                           \
+        .vendor       = (v),                                    \
+        .family       = (f),                                    \
+        .model        = (m),                                    \
+        .feature      = (feat),                                 \
+        .driver_data  = (const void *)(unsigned long)(data),    \
+    }
+
+#define X86_MATCH_VFM(vfm, data)                                \
+    X86_MATCH_CPU(VFM_VENDOR(vfm), VFM_FAMILY(vfm),             \
+                  VFM_MODEL(vfm), X86_FEATURE_ANY, data)
+
 /*
  * x86_match_cpu() - match the CPU against an array of x86_cpu_ids[]
  *
-- 
2.39.5


