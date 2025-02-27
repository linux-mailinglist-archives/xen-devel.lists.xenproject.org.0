Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80681A48129
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 15:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898144.1306718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnero-0004No-0F; Thu, 27 Feb 2025 14:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898144.1306718; Thu, 27 Feb 2025 14:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnern-0004MJ-Tp; Thu, 27 Feb 2025 14:27:59 +0000
Received: by outflank-mailman (input) for mailman id 898144;
 Thu, 27 Feb 2025 14:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RNkt=VS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnerl-0004MC-OF
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 14:27:57 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09c876f0-f517-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 15:27:56 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-548430564d9so1063642e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 06:27:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417b636sm176031e87.94.2025.02.27.06.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 06:27:55 -0800 (PST)
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
X-Inumbo-ID: 09c876f0-f517-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740666476; x=1741271276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNSijNZXdH8TRslchO0i6ZjUhLkUj8x4frWcH403sLE=;
        b=CLcex799xZQf0NQQfAJOax/OAEQU7ZciQV9ovzVXKDd7vyx8yGgLNuINC2NhV1G615
         SwAf8hEjx5eIYVn7e0dNqi9bKthQ0KOBSNyh2s6h/xtDgT8b7j9HLpDYh/mxrcW5NbsH
         VcrCFzlZpQfV2/vLpJ9D6imOcoBmmTEmtfcsJp7qxAV0Zq4lNG5hcoMOh1KjHG//H4qu
         mf/+UcD2XQX33YA7ZtmHFx25vRXf+5hRUrzcPVFxB5HzOWArYmpHiKcgfoJzm+zC+aGq
         18p/M+cbw4PslvpLVE8cQT83s2CbqVU4zbuaqoGqSYoXO9H8mphSWEXx3DAzQSZ+KzuI
         ISHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666476; x=1741271276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNSijNZXdH8TRslchO0i6ZjUhLkUj8x4frWcH403sLE=;
        b=CQPdIgFOA1QCTy4LFUdd5xnerEsWrOk+9k/UN/IFKhgSyDanupD6BW6WQYh4Yrw7y5
         PDvozh0WzqaQ8k6jhvTqNhE6c0rT7TS8UH1g92jmwVCGtgUDesqXFTFjgJOg62TnACTS
         x04DcwD7Cjn29R6vL4Nvju6XGLLb+GBlsKYzBAQGyKmx9FmQxN5/3Ds+5oSQ2W8uysyO
         jBSXyQIQHKiNYrmaYpiVc+eWjd4aT8rpzT5B/c7da+oE7TazeBiBwsBmkh6/rgazWdqN
         o/9hQCAVYpqrXD4mtxLqTEuVYXgIjkrGisAu6NzFbRkD5CaTTR8r1rHe6i64sa2C8MTv
         AJlQ==
X-Gm-Message-State: AOJu0Yx5NzLCsH/TsA6s5R2OkTA+J7/uFMXrsmuJ8Le0zrXVukBuyEnd
	L85XBPAqZ3hSAo65tmg0ncUGaZihnfXAOF4vaoqJg8XaIPC5S86MLkstzA==
X-Gm-Gg: ASbGncuKRRpi/4vgVkbe1VqgPVWg4DZs03JJp28f46O+WBA7AomwuJDyha52W0NeG5l
	HhlOQKi726MtEVQT/Qv2mnUYp16mJkIM7ZTnYVKohSGu4MTNjumSYwUQS1KOcoxyAgRyOu5UZzP
	A/cK6jjQaYLAGGf1m5L5dQKsPqFoEUZqYJr/cMCd1E7ZSH8YQNpZVPYFcdDN+q69xXMpsvbKobo
	zuY2gmaR23coI2TlJzMKsVlEFh/mlfO1wAC8oaaJ3uKWrV+AryXjCf5jJxu6FAJLwI5iHV4Gcv1
	IA0V/TTxxEyXj2SfAi7noB+O1T8=
X-Google-Smtp-Source: AGHT+IEj3SV1/XEGFzG3yCj7aVtnqv+jYolZjvDPl70qakby2YoAW0lXp82tpD8GsN2xV4wNNd/PWg==
X-Received: by 2002:a05:6512:3095:b0:546:2ea4:38f8 with SMTP id 2adb3069b0e04-54839136fcfmr12352187e87.12.1740666475810;
        Thu, 27 Feb 2025 06:27:55 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>
Subject: [PATCH for 4.20 v3] CHANGELOG.md: Finalize changes in 4.20 release cycle
Date: Thu, 27 Feb 2025 15:27:52 +0100
Message-ID: <20250227142753.48572-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update that CONFIG_UBSAN is also enabled for PPC; also for the same item
   change Arm to Arm64.
 - Add "Intel EPT" to "Add suport for Paging-Write Feature"; drop "Add" at
   the start as it is already in Added section.
 - "Zen 5" change to "AMD Zen 5". Drop brackets around "including mitigation..."
---
Changes in v2:
 - Drop "Support device passthrough when dom0 is PVH on Xen" from
   CHANGELOD.md becuase it isn't really ready:
   https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16
---
 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820..c5c2ca998a 100644
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
@@ -25,6 +30,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      interrupts instead of logical destination mode.
 
 ### Added
+ - Enable CONFIG_UBSAN (Arm64, x86, PPC, RISC-V) for GitLab CI.
  - On Arm:
    - Experimental support for Armv8-R.
    - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
@@ -34,6 +40,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
+   - Support for Intel EPT Paging-Write Feature.
+   - AMD Zen 5 CPU support, including mitigation for SRSO speculative
+     vulnerability.
 
 ### Removed
  - On x86:
-- 
2.48.1


