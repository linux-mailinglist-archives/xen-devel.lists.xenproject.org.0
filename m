Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA40ABDB72
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990781.1374697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNfu-0002Fb-P6; Tue, 20 May 2025 14:10:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990781.1374697; Tue, 20 May 2025 14:10:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNfu-0002Cq-MO; Tue, 20 May 2025 14:10:34 +0000
Received: by outflank-mailman (input) for mailman id 990781;
 Tue, 20 May 2025 14:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BmRr=YE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uHNfs-0002Ck-CQ
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:10:32 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fba2fd0-3584-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:10:30 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so40809215e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:10:30 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca8d005sm16948991f8f.90.2025.05.20.07.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 07:10:28 -0700 (PDT)
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
X-Inumbo-ID: 2fba2fd0-3584-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747750229; x=1748355029; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rQvBy5/uvxRnrI67HKlyK8cxfU/5aJIKUfLdplNBqPA=;
        b=M5nalHEsaCbNcZcQQ5JG8XZtfmpnxO1UE/G4P8XXgfE6XsLym4AcS0EIwrLPjDKmQ9
         KU/3+zE18+i6izMokcecK+IOTBU45w21mz7pMWUq4RPnwb4MlnsLmlz14gKJMSAT58SP
         EnhvM3cVEZ01vL3EUXjG1TkTUSjMvI5kEpA0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750229; x=1748355029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rQvBy5/uvxRnrI67HKlyK8cxfU/5aJIKUfLdplNBqPA=;
        b=NHoBilEzR1PveNtnsPCTFN+T4QUMBBq0TbpGCzevpW9h3IYK2f9po+0LaQ/8X3+IRQ
         Ezl8QuM49GgUsAGXg0Y88Y6O5kfPalypGQ1ShFV83xc09mxE4+aHP6F5zN6i+mEOpYQs
         8cG2SzjA5zn+KuYqAuSPcQX5op33xdOmJeHzRWJ/EcR62gh4lDDQSf0VdPK3bfenP5hJ
         B8VxbfI7RH5k4kHjjFMxQEHNZ+JvsPn9D9p/abQQVmT0uAEIen0Jk2rPHLWx8CCGMkcU
         We6hSNSHYvklLQ8j+/p43HRcTfex0s9V/N+2PHjd2Taw8Ro7bbd0swg9McPhUjEvGBgW
         x2dA==
X-Gm-Message-State: AOJu0YySf6QZ681qwoerzT7U99WdKH2CqhShI6tH2BipZYJEktKkrDcp
	cp9xzkV0A6kI0KYxE0TvELzdwO7xAloMhGdzs/bIQN+cpvYzNVXT8uV4HVxwruiBTqBgyU6/6Od
	Lu7I3
X-Gm-Gg: ASbGnctWg4vRPJWi3lugd5eer7iQ8ib/lfNYA+0QS7A5uyA+tFvw8br85IdosE2LxYg
	dEwrSMihLdD2/7mJec7TVl13hJgavo7M8C4sv4Bw9I4fO+fRWp6OPvhn1IIbqVHa5Bap/ZGPsN7
	oKivE3ehhehJcmUTP+cOvxFiTiugOI2r4SwN7f/QqWHF1h000Jr/w7AjUzBncyglcMGKZBHxFLD
	hjvfQS09cQE/P0VaWZKORtVPfNwoOndwABS2e+db1GCM0uI+vJH6hv++CrqD1HzPVcyIRU3VcT+
	4UTPOkLLIeoHIkPm5JIg0vzWGFXoTnlDVqNelW43taoK1u0dcNJ9zbaEyGljTXcQLWHSchQ+YLi
	gxh2qSbpRbILknUsAT7LiF6or
X-Google-Smtp-Source: AGHT+IGq8h/wkMmzCSSsvy3CLaFNeudXfSfP73P8rNXb/Za0bjyv2crEYFVegIOAKLxicxtMC9xj3g==
X-Received: by 2002:a05:6000:230a:b0:3a0:9dc2:5e0e with SMTP id ffacd0b85a97d-3a35c835093mr17400899f8f.11.1747750229456;
        Tue, 20 May 2025 07:10:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Denis Mukhin <dmkhn@proton.me>
Subject: [PATCH] xen/argo: Command line handling improvements
Date: Tue, 20 May 2025 15:10:27 +0100
Message-Id: <20250520141027.120958-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Treat "argo" on the command line as a positive boolean, rather than requiring
the user to pass "argo=1/on/enable/true".

Move both opt_argo* variables into __ro_after_init.  They're set during
command line parsing and never modified thereafter.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christopher Clark <christopher.w.clark@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Denis Mukhin <dmkhn@proton.me>

Found while
---
 xen/common/argo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/common/argo.c b/xen/common/argo.c
index cbe8911a4364..027b37b18a6c 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -79,8 +79,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_argo_unregister_ring_t);
 DEFINE_COMPAT_HANDLE(compat_argo_iov_t);
 #endif
 
-static bool __read_mostly opt_argo;
-static bool __read_mostly opt_argo_mac_permissive;
+static bool __ro_after_init opt_argo;
+static bool __ro_after_init opt_argo_mac_permissive;
 
 static int __init cf_check parse_argo(const char *s)
 {
@@ -92,7 +92,10 @@ static int __init cf_check parse_argo(const char *s)
         if ( !ss )
             ss = strchr(s, '\0');
 
-        if ( (val = parse_bool(s, ss)) >= 0 )
+        /* Intepret "argo" as a positive boolean. */
+        if ( *s == '\0' )
+            opt_argo = true;
+        else if ( (val = parse_bool(s, ss)) >= 0 )
             opt_argo = val;
         else if ( (val = parse_boolean("mac-permissive", s, ss)) >= 0 )
             opt_argo_mac_permissive = val;

base-commit: 293abb9e0c5e8df96cc5dfe457c62dfcb7542b19
-- 
2.39.5


