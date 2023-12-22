Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6C81CBEF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659406.1028992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDL-0007KZ-7S; Fri, 22 Dec 2023 15:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659406.1028992; Fri, 22 Dec 2023 15:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDL-0007Iv-3O; Fri, 22 Dec 2023 15:13:27 +0000
Received: by outflank-mailman (input) for mailman id 659406;
 Fri, 22 Dec 2023 15:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDJ-0007Ie-HM
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:25 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6475537-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:23 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e6d802507so274045e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:23 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:22 -0800 (PST)
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
X-Inumbo-ID: a6475537-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258003; x=1703862803; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUowHZBO2nKGCuJs3sPxh/R77AFxLnhXhueIKgvrApM=;
        b=Gjc2YyuFkoMVS0OBAeNIKBL0uiGHUVamJGP68ZxS9q0niCSrFrWJP+6Nwg8htS4lZI
         DkaPW9n4WV81RW5+DZSBpvrk311er3IcY5/ms79HzY+y8KluyRfxoe4w1yzdEbJhMnI7
         0o8w7JoRGOkpRzUWfcG4C+w2gfRJrSrCd81JScLvIKbc73uXNRezl8mLKFwBHKImj4lv
         ewF9NFsDp1+dlL2BAt+1rNCIt8TdfUEVTOvaayZcJWeihSGHBvuhJpg4+oqAM3kfY5Kz
         IcSAR/yoVqcJl/hz/mTgJNngCJEpu1ud7Vrh5RRXED9FhYd06C+KNI2pslyexonOhQng
         UM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258003; x=1703862803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUowHZBO2nKGCuJs3sPxh/R77AFxLnhXhueIKgvrApM=;
        b=qAZjEkTyVuiF/uT+2RQwCOVvJQGqA2r2upJg6sISBrjZqnSjupb1H+B7kUeY3uBbF7
         fRb6j4gDTnpiuzhpiRwpq59xrnjlNnOz6Nm3dJPoWyGasCfaqj2BUf+TMcORaENYqnnt
         sC8nq8jBy86egXY1ArJGkMLtxQvj7UVa71CMuYtEpx7bJjinnNXS6f2VbenFRoL1Bsj/
         +Ntpio4SmCqLcbJAN70/MvJkuI9AMU2TvdizJMNr1GqbtODhFPc2EcoORzEdym5FN5Qr
         DlPPRdDXN1zsFL4Sj2DXcWacGfUar8ZRkLSZZzictA06AIRRp9AV1+F2FGbLHqi7brQV
         n+gg==
X-Gm-Message-State: AOJu0Yzes1O9R6/nexyewqZ74bHS1CqeaCQFopcylmtkyXZhvdvJbxhu
	48yyH9/Qo3PbLYyLumpL4hKdiqTof1U=
X-Google-Smtp-Source: AGHT+IFozsh/kiyobZ4kDQYj+0L75QU4g1ERaPe2rKw2zh5mHWUkxXda334d+R1Yp45yknRXl8H6+w==
X-Received: by 2002:a05:6512:2fc:b0:50e:242a:775e with SMTP id m28-20020a05651202fc00b0050e242a775emr796416lfq.106.1703258002781;
        Fri, 22 Dec 2023 07:13:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 01/34] xen/riscv: disable unnecessary configs
Date: Fri, 22 Dec 2023 17:12:45 +0200
Message-ID: <76eeb5b411ccab16ba9696132d6962c169cbf131.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch disables unnecessary configs for two cases:
1. By utilizing EXTRA_FIXED_RANDCONFIG and risc-fixed-randconfig.yaml
   file for randconfig builds (GitLab CI jobs).
2. By using tiny64_defconfig for non-randconfig builds.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Remove EXTRA_FIXED_RANDCONFIG for non-randconfig jobs.
   For non-randconfig jobs, it is sufficient to disable configs by using the defconfig.
 - Remove double blank lines in build.yaml file before archlinux-current-gcc-riscv64-debug
---
Changes in V2:
 - update the commit message.
 - remove xen/arch/riscv/Kconfig changes.
---
 .../gitlab-ci/riscv-fixed-randconfig.yaml     | 27 +++++++++++++++++++
 xen/arch/riscv/configs/tiny64_defconfig       | 17 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/automation/gitlab-ci/riscv-fixed-randconfig.yaml b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
index f1282b40c9..344f39c2d8 100644
--- a/automation/gitlab-ci/riscv-fixed-randconfig.yaml
+++ b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
@@ -5,3 +5,30 @@
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
       CONFIG_MEM_ACCESS=n
+      CONFIG_COVERAGE=n
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_CREDIT2=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_NULL=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_HYPFS=n
+      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
+      CONFIG_ARGO=n
+      CONFIG_HYPFS_CONFIG=n
+      CONFIG_CORE_PARKING=n
+      CONFIG_DEBUG_TRACE=n
+      CONFIG_IOREQ_SERVER=n
+      CONFIG_CRASH_DEBUG=n
+      CONFIG_KEXEC=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_NUMA=n
+      CONFIG_PERF_COUNTERS=n
+      CONFIG_HAS_PMAP=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_XENOPROF=n
+      CONFIG_COMPAT=n
+      CONFIG_COVERAGE=n
+      CONFIG_UBSAN=n
+      CONFIG_NEEDS_LIBELF=n
+      CONFIG_XSM=n
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 09defe236b..35915255e6 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -7,6 +7,23 @@
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
 # CONFIG_MEM_ACCESS is not set
+# CONFIG_ARGO is not set
+# CONFIG_HYPFS_CONFIG is not set
+# CONFIG_CORE_PARKING is not set
+# CONFIG_DEBUG_TRACE is not set
+# CONFIG_IOREQ_SERVER is not set
+# CONFIG_CRASH_DEBUG is not setz
+# CONFIG_KEXEC is not set
+# CONFIG_LIVEPATCH is not set
+# CONFIG_NUMA is not set
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_HAS_PMAP is not set
+# CONFIG_TRACEBUFFER is not set
+# CONFIG_XENOPROF is not set
+# CONFIG_COMPAT is not set
+# CONFIG_COVERAGE is not set
+# CONFIG_UBSAN is not set
+# CONFIG_NEEDS_LIBELF is not set
 
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
-- 
2.43.0


