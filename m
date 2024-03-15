Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F3287D33B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693987.1082694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwn-000682-OJ; Fri, 15 Mar 2024 18:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693987.1082694; Fri, 15 Mar 2024 18:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwn-00060j-Ij; Fri, 15 Mar 2024 18:06:25 +0000
Received: by outflank-mailman (input) for mailman id 693987;
 Fri, 15 Mar 2024 18:06:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwm-0005yW-5n
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:24 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb93d62c-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:23 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso33948251fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:20 -0700 (PDT)
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
X-Inumbo-ID: bb93d62c-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525982; x=1711130782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b956toTh9DhRZ58EEcldn/bf2x22T6+RI+Lzdk85ScQ=;
        b=e727lqbUDai+CJTFcFdEl1/H1UlCA4YU+fzYnh+cOxeOMYZhX74NNzYl7HHZZD9CSL
         Z0W8JPg8Jggq/pOsblEOH78N64xy+paUSY5PyOI+qRrB18Ro5hIG+xea5U6sxXukXTjv
         suVlLQCQV5n9AZxAGRIplA3+olr1h+px8MgNzSLGriVhoy4vXzwlKy3Loq8MHNi2ZwQ+
         gbzJQBnWJpB/6OWufvHpU9s2FqM15NR/DN8u4aLuUzys0QoF0SiIJiMmd6RBC1nZ1D7q
         l26sv/CDwy3Ro91SduGYpmC8F2AK8cuEuRkNMcMvFErUzUt40PdpxAR6vOZydcH+CAjJ
         id0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525982; x=1711130782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b956toTh9DhRZ58EEcldn/bf2x22T6+RI+Lzdk85ScQ=;
        b=KdYvLIQS9v6eDEz31yM4NvJS8Z+eWlBwMnNg0BY7dNWxh4mJjY8lEOcR/1ei/tsVzf
         ofqV/+3EKgoaLNnm0x25ToThmyClz+bkATdRpdEk5fVdtU1A764XqDewT/vSeDAQ9XAy
         ihn9/Mh7qMNFfNJxsRxpXIy0jPScLcO5klxvbVc3XPOFkC1r+mr8hBY+jonL8b2WkR+w
         xKCT/BwSJyPZmePotIqaPIT2YTl+Dpu4klUTcty8i43kLEepBUsMUBUthSQcU6QAmoin
         cdnl+vwnHAe5gRpeD2W18xv6qqZgUSK96nlfs1hcNmevDqtL09VSVQJoH2T5bByz7sEI
         GzEA==
X-Gm-Message-State: AOJu0YwtLwxbCZAKrEvHggf8tguXgypzo/Ffqeqjn7W+EOELfA6FiQvc
	75vlHs17Jrb3x+gdgiyTrqhHGFu0wUOk2o2ZOp+3ciro26WFkOMdFzBFPG+z44s=
X-Google-Smtp-Source: AGHT+IEKZeiL7AjpnXkkbaowoYHyzoJTG23T1OhsLFonO4lxu26OuDUItxfXRVkVZcJK/PCBAV3i3w==
X-Received: by 2002:a05:651c:1050:b0:2d4:71bd:b072 with SMTP id x16-20020a05651c105000b002d471bdb072mr4127027ljm.14.1710525981785;
        Fri, 15 Mar 2024 11:06:21 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 02/20] xen/riscv: disable unnecessary configs
Date: Fri, 15 Mar 2024 19:05:58 +0100
Message-ID: <5a1b905601db481a1a625dafbbf9b28dbe12876c.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch disables unnecessary configs for two cases:
1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds (GitLab CI jobs).
2. By using tiny64_defconfig for non-randconfig builds.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - Nothing changed. Only rebase.
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


