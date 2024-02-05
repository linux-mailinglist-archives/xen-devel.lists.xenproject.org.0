Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93836849E43
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676195.1052156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xh-0007Kf-7z; Mon, 05 Feb 2024 15:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676195.1052156; Mon, 05 Feb 2024 15:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xh-0007IB-4p; Mon, 05 Feb 2024 15:32:45 +0000
Received: by outflank-mailman (input) for mailman id 676195;
 Mon, 05 Feb 2024 15:32:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xf-0007Hv-Cn
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:43 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd757792-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:42 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5115744dfe5so5542e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:42 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:41 -0800 (PST)
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
X-Inumbo-ID: cd757792-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147161; x=1707751961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPaE7lsiNetODMb4yDxZSXp3uI/1BFAvrBNl/vZuK+E=;
        b=bKqRZn5jdJN6+wt/o+/lL9ABu/9YZy27WMS/LlSgHnuGLpYtAb+4LXisR1YH8HCqFm
         3iHEKjEhk3L922sC8EXf0UcHwFHf6y07i4KMxUSz3ge7BOvv7GmLbWpvWCBwZOAA9DgW
         8BTic73wpqNu2w+Tyfd6J/Mi4Wk6F4B904d7pEPP1GidqzXyv3bZGe/JCd/jVO9jvuTP
         9PSy3jMfMgB+FGhFIn+rCrkUIPsxzy6npB2iFjleBFfncHv2xSUid1VqGCMMLeVzBJXe
         xugkHkJgeC6jezInvU0lgQ1JPOh/ExoVBgYV1S6RyN2px/YXnzc92jwkb9nlxxMyQDz9
         d29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147161; x=1707751961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPaE7lsiNetODMb4yDxZSXp3uI/1BFAvrBNl/vZuK+E=;
        b=N7TQRdE4KK4TUzKGbp13ZB18D4U/mwFYW0Cuz3hU8vaKdAq0J1uZNeGAFfikY9FGiP
         w+vROJLeC99X5AFmCe/94Kn1kigl6bn5shYAXg04+oGV00sGZroysV9e2qo/1uWWliJh
         YnLBUv5B4NDX6g+FfCHMsAQTIuRY89zSNvFqnWf2EoWS9Jk8bkkYOtkEMn1sCgMqY2si
         rUgoH7cpSW/rLG0mg6WPtGI2AlM+Mm5n0Ie69DbscHhJI4zPipxx13x+VTmV2nE+nL8P
         5l0i27PQRb1t5/y5nIKJw7sqxOEMenumtHCr8U4N0kd2adkqOKW4J781UOH2+iTlea8t
         WT1w==
X-Gm-Message-State: AOJu0YweoOJUqjm3oG4HijURvzUtehpchwicuaXMPsxQ4gh7F//WUf4J
	zk8WJj3+4Z5kTs1kvGF2j/RrPvRP8iErSlFN52n8LphSh09HKbfw8d93pTh6
X-Google-Smtp-Source: AGHT+IHj7ev+GqSUfsoELsOVw/8nhp+7AMv61Oet/v+xMIOQqrZa4qZ6u5PeQKgFzTMP5CzOqPrZJg==
X-Received: by 2002:a05:6512:31ca:b0:50e:a789:dd3b with SMTP id j10-20020a05651231ca00b0050ea789dd3bmr7231537lfe.1.1707147161488;
        Mon, 05 Feb 2024 07:32:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVFa5DpX6sTlNLEgC5k0Lz+lvWZArIUVNAnFr7qgtcW4FKjWwsmyqFiHuoWMgkZQKQ9J3KupSVv0hL+HxfDn3obLPaUicS1IvBaiTsUf+Z/Gaz5dsL9rbP6HxAtvRUcLtlOn7Tka/BJpOXnFMmzS7S6snhK++tJVvjM482qCQO4LattImaKbC0nxKKMQkD2m/lNa4jaFhoI1CgijKO88ksdYEL1
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 01/30] xen/riscv: disable unnecessary configs
Date: Mon,  5 Feb 2024 16:32:08 +0100
Message-ID: <3a6ac88525e645e57c0dd44324fadc7ce499369e.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch disables unnecessary configs for two cases:
1. By utilizing EXTRA_FIXED_RANDCONFIG and risc-fixed-randconfig.yaml
   file for randconfig builds (GitLab CI jobs).
2. By using tiny64_defconfig for non-randconfig builds.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Nothing changed. Only rebase
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


