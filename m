Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED11867ED6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685691.1066818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewd-0007w5-Lu; Mon, 26 Feb 2024 17:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685691.1066818; Mon, 26 Feb 2024 17:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewd-0007rE-H8; Mon, 26 Feb 2024 17:39:15 +0000
Received: by outflank-mailman (input) for mailman id 685691;
 Mon, 26 Feb 2024 17:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewb-0007o5-T6
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:13 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f40977c8-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:12 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d243797703so42728691fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:09 -0800 (PST)
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
X-Inumbo-ID: f40977c8-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969151; x=1709573951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Cc1ctgpIyGSAwIswK/MOgWw8+E3f2g/putJbdmyaeg=;
        b=LaGBSFP6hdOW2rRGwOwK6ctOAzXq/KN9Bo+zGdZfXdGAL/hkcZjfy9RNEGn7sEJxAP
         ISPyxur+TTiQyEz+M2JYBw4EC6S/W1Dl9+qbljBO8u/pU+nhd5tjkjNEpV22Q3Q3L8vb
         AUdWFtgweGtqZxxQws9H+AKGDuYKmsBFN6kcvjzLPIjsmfrUlUhafrfjq/QXeE5W0+cN
         oBDtBAlgqYjr+HAxU2GDsPHYWT+B0Ys/wctR19O/AUGyHXcsqJOuCR14cQD+Y9O0qN3a
         QBNE0BXIS3SF7j+FAfRyawB/ZirXzSDSEgh6NCDmH5g04g9Azxka6NnPtxgkiQ4tOlCT
         GEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969151; x=1709573951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cc1ctgpIyGSAwIswK/MOgWw8+E3f2g/putJbdmyaeg=;
        b=Yr5rSHkAIvjTTTLe+jjhPyHOrOMbT2e24WOzA1fTbIweWzAqkQQET+GXO/BVPD95QJ
         5O8ko0FNxUG1cy/6bVJvdt5Hhi4IJEU1Bzlx0ZtoYTR48dRX2ni2QPMW2H4SqZmcinUK
         dic/jp1BVuj780lg52gD1UnmCSKCVU+cmucKaIfaxg6cx+BPktEQMkxK9toQ+yhTSKEM
         kSEDxNvqh9Xjzce/CdoiP6Sj3DtCq0ctDq5Sh9jQlcuOrHXwDbYwKQW96sPLKWLlYF6+
         9Ia2lUu74SXGOqz8G0C0ut33akmJjGMkaos3jJQopLjRBNeBpM3yFbzO/wkFoTORnR6i
         Jmsw==
X-Gm-Message-State: AOJu0YxwvUg+g3hVUks0RFwiYnUMPXc6LkZeNKuPUq4/D1LAf4NAJFAL
	tUY87wVcfN2eNV4x5Mi02qc7hkZcQh4E2CFc6GiPkw0A/EGnjwfDorku631+
X-Google-Smtp-Source: AGHT+IHN+nYWAqmitVsteyEec6jSq5D0nVknyjk2VMGqGfbfY3ovdpOGSr9TSVHbVWHSp3sKaiqhqA==
X-Received: by 2002:a2e:80d3:0:b0:2d2:8c9a:c4e5 with SMTP id r19-20020a2e80d3000000b002d28c9ac4e5mr2078923ljg.18.1708969150810;
        Mon, 26 Feb 2024 09:39:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v5 01/23] xen/riscv: disable unnecessary configs
Date: Mon, 26 Feb 2024 18:38:43 +0100
Message-ID: <6aa24c4943b71592c3735cdb1881c268370e7811.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch disables unnecessary configs for two cases:
1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds (GitLab CI jobs).
2. By using tiny64_defconfig for non-randconfig builds.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Rebase and drop duplicated configs in EXTRA_FIXED_RANDCONFIG list
 - Update the commit message
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
 automation/gitlab-ci/build.yaml         | 24 ++++++++++++++++++++++++
 xen/arch/riscv/configs/tiny64_defconfig | 17 +++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index aac29ee13a..3b3d2c47dc 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -519,6 +519,30 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
       CONFIG_MEM_ACCESS=n
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
+      CONFIG_XENOPROF=n
+      CONFIG_COMPAT=n
+      CONFIG_UBSAN=n
+      CONFIG_NEEDS_LIBELF=n
+      CONFIG_XSM=n
 
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
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


