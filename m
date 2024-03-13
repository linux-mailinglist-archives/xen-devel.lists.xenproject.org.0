Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D687A78B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 13:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692403.1079503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNil-0005y7-Ow; Wed, 13 Mar 2024 12:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692403.1079503; Wed, 13 Mar 2024 12:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkNil-0005vE-KZ; Wed, 13 Mar 2024 12:28:35 +0000
Received: by outflank-mailman (input) for mailman id 692403;
 Wed, 13 Mar 2024 12:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5AcA=KT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rkNij-0005e0-Ls
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 12:28:33 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34356dca-e135-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 13:28:32 +0100 (CET)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3c21a3120feso2612387b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 05:28:32 -0700 (PDT)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 ne7-20020a056214424700b00690dbc390dcsm2283874qvb.89.2024.03.13.05.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 05:28:31 -0700 (PDT)
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
X-Inumbo-ID: 34356dca-e135-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710332911; x=1710937711; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCwOpLYs0LxuV2LN5cgSdDy/7vlzfUoEPoHbwcZNVf0=;
        b=XG/MOe8ajsSjz5XAY63g5SIBTY3OkiyOXV/VXim/kI1Kl4M6Vs37ywG5Sr8d3v77xi
         Bil4WOv/6hdbh2gqmtj+N2PFVEPpdpmi7/VlbH898HXSRWp9DwyqkbH/0U/eThpJmt5K
         C6Cr48dNj3zP6nPDIkT0wOFXAiwgtIG5m2OsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710332911; x=1710937711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCwOpLYs0LxuV2LN5cgSdDy/7vlzfUoEPoHbwcZNVf0=;
        b=USOMqE3OJB216yc1cueE3q1Ec9T092w6BB7L57hOIlgF4KmlKbyBTD4v4eaOCQWhfe
         +ALshh9taJCcaPmZZGFyWwcBeuZPdou8nt9LErnekkB1nTlOr3C0DPvVYm90ygdSNyAN
         fesgDor5xp0wjuy8nMV74/kP2+n7Ph5O6MD4hCpgJWTag3onquEXm9LdTW1wLO7l+XuA
         RJSQ5n+Oc1lSS2YFvQEMc02a3NDmc2nEyiR9gD1krXP9mcwFl77UE80oasI98nodeoWZ
         z1cjXPf69c/eM/x0nD9MF6SB3fKgjHp2ZyQEud6k6yrf95pKw4T5yHB6wuhtA0JhtFJL
         Soyg==
X-Gm-Message-State: AOJu0YzO4TUUOmZ4r9xDBfBkasMKchsWkC12ft7d+apqaTT0ho4Ud4L2
	8HVV6Mgqa+UEUFN1X2tpbSA+H4WewD+Smj2XamWsp9sMd3p8sKa4giFRmuWRJBEKNsHSK+5kZxU
	/
X-Google-Smtp-Source: AGHT+IHR9DN+7lcvO4/7WeenkBKRhBNcXU7Vg81kDU+bivxwGjowDiMk22Rx8pE3AMmCbhgbrwU/wg==
X-Received: by 2002:a05:6808:3021:b0:3c2:1881:f015 with SMTP id ay33-20020a056808302100b003c21881f015mr14877332oib.15.1710332911502;
        Wed, 13 Mar 2024 05:28:31 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH v2 1/3] x86: Move SVM features exposed to guest into hvm_max_cpu_policy
Date: Wed, 13 Mar 2024 12:24:52 +0000
Message-Id: <20240313122454.965566-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313122454.965566-1-george.dunlap@cloud.com>
References: <20240313122454.965566-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently (nested) SVM features we're willing to expose to the guest
are defined in calculate_host_policy, and stored in host_cpu_policy.
This is the wrong place for this; move it into
calculate_hvm_max_policy(), and store it in hvm_max_cpu_policy.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
v2:
- New
---
 xen/arch/x86/cpu-policy.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 2acc27632f..bd047456eb 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -398,19 +398,6 @@ static void __init calculate_host_policy(void)
     if ( vpmu_mode == XENPMU_MODE_OFF )
         p->basic.raw[0xa] = EMPTY_LEAF;
 
-    if ( p->extd.svm )
-    {
-        /* Clamp to implemented features which require hardware support. */
-        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
-                               (1u << SVM_FEATURE_LBRV) |
-                               (1u << SVM_FEATURE_NRIPS) |
-                               (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
-        /* Enable features which are always emulated. */
-        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
-                               (1u << SVM_FEATURE_TSCRATEMSR));
-    }
-
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
@@ -741,6 +728,23 @@ static void __init calculate_hvm_max_policy(void)
     if ( !cpu_has_vmx )
         __clear_bit(X86_FEATURE_PKS, fs);
 
+    /* 
+     * Make adjustments to possible (nested) virtualization features exposed
+     * to the guest
+     */
+    if ( p->extd.svm )
+    {
+        /* Clamp to implemented features which require hardware support. */
+        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
+                               (1u << SVM_FEATURE_LBRV) |
+                               (1u << SVM_FEATURE_NRIPS) |
+                               (1u << SVM_FEATURE_PAUSEFILTER) |
+                               (1u << SVM_FEATURE_DECODEASSISTS));
+        /* Enable features which are always emulated. */
+        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
+                               (1u << SVM_FEATURE_TSCRATEMSR));
+    }
+    
     guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
-- 
2.25.1


