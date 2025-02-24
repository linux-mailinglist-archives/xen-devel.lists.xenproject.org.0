Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D999FA42B43
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 19:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895374.1303969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmd9T-0004bT-QO; Mon, 24 Feb 2025 18:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895374.1303969; Mon, 24 Feb 2025 18:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmd9T-0004ZN-NU; Mon, 24 Feb 2025 18:25:59 +0000
Received: by outflank-mailman (input) for mailman id 895374;
 Mon, 24 Feb 2025 18:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jZ5=VP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tmd9S-0004XT-Ak
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 18:25:58 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ea3878-f2dc-11ef-9897-31a8f345e629;
 Mon, 24 Feb 2025 19:25:55 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso4080083e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 10:25:54 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461c35df32sm2579067e87.164.2025.02.24.10.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 10:25:53 -0800 (PST)
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
X-Inumbo-ID: c8ea3878-f2dc-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421554; x=1741026354; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7jrsYBPgU5o0GCLHqJFwoNQhi+N9AKO9njfIKCs55E=;
        b=kNcC+sfepOZ6I0K0m1j1U23DM8dEndL0vI1lRtJzclq8MaZww8sFSPnOs16rbFSRpo
         qkpITljyKSdbEYhmxnINr30Vy8pT7iI89R20CK4iFoGIbYnUHPy4RsiJMhvYHYXl5/kj
         IzxMU//669FgA9Z4V3xEeVXqDgMPbfFKwmBJ41NxfTNwvsxUKFhUYruLzxQ6S6IYnnjd
         oOQhcAJ2LDYkjDT0fk7AnFDo+Wuk1VuxocVAh1X9BOAqMROwLjpOAm6r0W2mOQIuVp6S
         g4minm8jOCuBv5zT9rVwqJK6UHKRGVPGJt2GrN0KRPFHoCnSgoRX/tE4E4cSWF6lLxLo
         +gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421554; x=1741026354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7jrsYBPgU5o0GCLHqJFwoNQhi+N9AKO9njfIKCs55E=;
        b=dreEWyhItS01HNloOmxq8kvCOWE75zLebePhKOP2pPckmdNBeLNTS2sGP40Wej8TbZ
         PHj2cUOhf0WPESUPjFG1oK+bQwOYh6m3n6B1LSd8rninoB/K1Wdmsf4YGa3xnVAThHHj
         RYbc9sq45nIQtD0+9fKUZLATQeUCs1Zt3PmTj/6HTKRjpet4PpkzZhxocWZ2dWjAHJrJ
         CcDa/JO1Wn+NjSCljmXIWKGXHxKHpNWB1gO5wnDwxy+ra4Coj4jsZNnVFilgF10J5n9/
         vYAAh2JKQhyHnLm0gQRWIimZDkccrbsI2M2AkLrCEyqRKYOD1BD65+FzB1KykrFf9Fr/
         45jQ==
X-Gm-Message-State: AOJu0Yw7AIcR2JV2f1sdrF4l7Rtr0RNm3ibLWGUtKMs08zEqcEn5SaIp
	Xtl3fq7wHE96Re+QEQal5IVPHQ+lvVgoJwqzzrFWHIgwa0QRJYPPOfyVTw==
X-Gm-Gg: ASbGncss+bZ8VHnpC1aYY2Ww9Udgs/c18YXmZgF/m/Oor0U5LhTPpnCkKtqMYeXzLaI
	UjhnmKi6SOcm4ub5LQfQqk+RbrWFlaALlg0OBNr+rkamjQLNYgZnk+Bc3m/WVtEbpDeJiZ43lgE
	J+XgOG/5Fv/0rzkgTUVOXX5xivf5IkVTt7ZmqrFsODediqR21evu6iaB1/C68q3iYpB/7F+oS3h
	3OapY0j8leUX/WvzOsBbKpmQoK2XxZ2x+/+hOe++bE9cQpH3tV9zS3pWKiLZDrUsOqdj/wqsul9
	vlVX3IcrunZn5emfT0soOJxpK7o=
X-Google-Smtp-Source: AGHT+IFGW2qXCegnE4eXZcGRE3tv2ktGSg2DjDUZM7hZU9M9KRwnI5wOgPW403UrM+HpZ2G+y7xMUQ==
X-Received: by 2002:a05:6512:31d3:b0:545:22ec:8b51 with SMTP id 2adb3069b0e04-54838f5b09amr6081551e87.41.1740421553709;
        Mon, 24 Feb 2025 10:25:53 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: committers@xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
Date: Mon, 24 Feb 2025 19:25:48 +0100
Message-ID: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 CHANGELOG.md | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820..e6c6144ef1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Fixed blkif protocol specification for sector sizes different than 512b.
  - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
    leaving this to the guest kernel to do in guest context.
+ - Reduce xenstore library dependencies.
+ - On Arm:
+   - Several FF-A support improvements: add indirect messages support, transmit
+     RXTX buffer to the SPMC, fix version negotication and partition information
+     retrieval.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
    - Prefer CMOS over EFI_GET_TIME as time source.
@@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      interrupts instead of logical destination mode.
 
 ### Added
+ - Support device passthrough when dom0 is PVH on Xen.
+ - Enable CONFIG_UBSAN (Arm, x86, RISC-V) for GitLab CI.
  - On Arm:
    - Experimental support for Armv8-R.
    - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
@@ -34,6 +41,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
+   - Add Support for Paging-Write Feature.
+   - Zen5 support (including new hardware support to mitigate the SRSO
+     speculative vulnerability).
 
 ### Removed
  - On x86:
-- 
2.48.1


