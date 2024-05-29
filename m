Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FE8D3F2A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732320.1138262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOH-0003fI-QA; Wed, 29 May 2024 19:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732320.1138262; Wed, 29 May 2024 19:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOH-0003c8-N3; Wed, 29 May 2024 19:55:17 +0000
Received: by outflank-mailman (input) for mailman id 732320;
 Wed, 29 May 2024 19:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCPOG-0003Q0-Pp
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:55:16 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da20ca6-1df5-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 21:55:14 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ac0c4b62cso164194e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 12:55:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b249sm1344203e87.178.2024.05.29.12.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 12:55:13 -0700 (PDT)
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
X-Inumbo-ID: 5da20ca6-1df5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012514; x=1717617314; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXNTVAvwjq58BlgUtIZuszRpR8ogKV+d9WBU1hktqSI=;
        b=irzYxgrAplbrCWbeVGSGntb5IqYNxAKcb620gIwu44wZIubkESataaJJM3oi1tCxiW
         46tT0H0AyHSr5q1SMfJjLYwomp3cwoXnuUX14A//Wdi3BlTSHj3tXbBAdw8vH1I3x2sb
         XXnRV3SrP4yTBmv/SqBgX1TmVYJCF4vtO3foxk3ppH1gF3ZIh4Pv9/CmIctuY3scPrq6
         gBkzj5CHjDODV/mTTyQaSfOnl7ZndyvWMCsO6D6qqvoSZ94i6/4IXn1kQongjfzEQQNy
         jC+bm3MSU6hqfdGpZnQJ+zE+BjHevG0BnDO7FQWD9Tc84hPiiG74LqLUeCxD03EP5gV0
         G/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012514; x=1717617314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXNTVAvwjq58BlgUtIZuszRpR8ogKV+d9WBU1hktqSI=;
        b=rFrkn1DUv9OWs47FUUKLcrimtloTtYoYtQcgpzAuXlCi7grLGUWc5iLiJ7x6535BGG
         3W4OfcIbVfTP9ejjAV8YeszC3q821FDYDNW3XqyS043ObrpXffCRDRvBVGjbAeNeXrBt
         XcrF1RI/AJU3BP9pWbgjg2jMpy3y7njjDB8SwaUvyKZ+IMzAB0dH9aWflIIBvBBJ30dL
         yYIh2uuF9V1F6vxCGHycYaJL3B8PoJ6IAoo8UZBaJ8nMG+9mxpAZqPy2Bjv5QFOVdy+7
         QsARQ4BIHxs+hJHZz/3hWPMZ57ntPUy8SmLbm32V40U78lRRGHlgCDCrQskK9Rkq/aDk
         32rg==
X-Gm-Message-State: AOJu0Yy/1k4kViE8gz7IITqU/FWR84cCVEZ6NAAGyzRZH4PxhLddswJR
	qG3Fy452t9quyUnXcFwiiXUcI3ttzn86yqaRYtOHZRlsD1p30WWbi2+7sZJH
X-Google-Smtp-Source: AGHT+IFFRNU83IuW9JRf9yB0tc8xEPXk5YxlD+5CPw8HDXR54dZcgidi8PHSzdNDVUTsmrweHZsZxw==
X-Received: by 2002:a19:8c50:0:b0:51d:d78:4952 with SMTP id 2adb3069b0e04-52b7d49058cmr93764e87.65.1717012513693;
        Wed, 29 May 2024 12:55:13 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v12 1/8] xen/riscv: disable unnecessary configs
Date: Wed, 29 May 2024 21:55:02 +0200
Message-ID: <35cf9d52e538aab964a3ecc050260abb3f27c60d.1717008161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1717008161.git.oleksii.kurochko@gmail.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disables unnecessary configs for two cases:
1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds (GitLab CI jobs).
2. By using tiny64_defconfig for non-randconfig builds.

Only configs which lead to compilation issues were disabled.

Remove lines related to disablement of configs which aren't affected
compilation:
 -# CONFIG_SCHED_CREDIT is not set
 -# CONFIG_SCHED_RTDS is not set
 -# CONFIG_SCHED_NULL is not set
 -# CONFIG_SCHED_ARINC653 is not set
 -# CONFIG_TRACEBUFFER is not set
 -# CONFIG_HYPFS is not set
 -# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set

To allow CONFIG_ARGO build happy it was included <asm/p2m.h> to <asm/domain.h>
as ARGO requires p2m_type_t ( p2m_ram_rw ) and declaration of
check_get_page_from_gfn() from xen/p2m-common.h.

Also, it was included <xen/errno.h> to asm/p2m.h as after the latter was
included to <asm/domain.h> the compilation error that EINVAL, EOPNOTSUPP
aren't declared started to occur.

CONFIG_XSM=n as it requires an introduction of:
* boot_module_find_by_kind()
* BOOTMOD_XSM
* struct bootmodule
* copy_from_paddr()
The mentioned things aren't introduced now.

CPU_BOOT_TIME_CPUPOOLS requires an introduction of cpu_physical_id() and
acpi_disabled, so it is disabled for now.

PERF_COUNTERS requires asm/perf.h and asm/perfc-defn.h, so it is
also disabled for now, as RISC-V hasn't introduced this headers yet.

LIVEPATCH isn't ready for RISC-V too and it can be overriden by randconfig,
so to avoid compilation errors for randconfig it is disabled for now.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V10-V12:
 - Nothing changed. Only rebase.
---
Changes in V9:
 - update the commit message: add info about LIVEPATCH and PERF_COUNTERS.
---
Changes in V8:
 - disabled CPU_BOOT_TIME_CPUPOOLS as it requires an introduction of cpu_physical_id() and acpi_disabled.
 - leave XSM disabled, add explanation in the commit message.
 - drop HYPFS as the patch was provided to resolve compilation issue when this condif is enabled for RISC-V.
 - include asm/p2m.h to asm/domain.h, and xen/errno.h to asm/p2m.h to drop ARGO config from
   tiny64_defconfing and build.yaml.
 - update the commit message.
---
Changes in V7:
 - Disable only configs which cause compilation issues.
 - Update the commit message.
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
 automation/gitlab-ci/build.yaml         |  4 ++++
 xen/arch/riscv/configs/tiny64_defconfig | 12 +++++-------
 xen/arch/riscv/include/asm/domain.h     |  2 ++
 xen/arch/riscv/include/asm/p2m.h        |  2 ++
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 5985be9378..3290a36dca 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -379,10 +379,14 @@ alpine-3.18-gcc-debug-arm64:
 .riscv-fixed-randconfig:
   variables: &riscv-fixed-randconfig
     EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_BOOT_TIME_CPUPOOLS=n
       CONFIG_COVERAGE=n
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
       CONFIG_MEM_ACCESS=n
+      CONFIG_PERF_COUNTERS=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_XSM=n
 
 archlinux-current-gcc-riscv64-debug:
   extends: .gcc-riscv64-cross-build-debug
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 09defe236b..fc7a04872f 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -1,12 +1,10 @@
-# CONFIG_SCHED_CREDIT is not set
-# CONFIG_SCHED_RTDS is not set
-# CONFIG_SCHED_NULL is not set
-# CONFIG_SCHED_ARINC653 is not set
-# CONFIG_TRACEBUFFER is not set
-# CONFIG_HYPFS is not set
+# CONFIG_BOOT_TIME_CPUPOOLS is not set
 # CONFIG_GRANT_TABLE is not set
-# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
 # CONFIG_MEM_ACCESS is not set
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_COVERAGE is not set
+# CONFIG_LIVEPATCH is not set
+# CONFIG_XSM is not set
 
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 027bfa8a93..16a9dd57aa 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,8 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/p2m.h>
+
 struct hvm_domain
 {
     uint64_t              params[HVM_NR_PARAMS];
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 387f372b5d..26860c0ae7 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_RISCV_P2M_H__
 #define __ASM_RISCV_P2M_H__
 
+#include <xen/errno.h>
+
 #include <asm/page-bits.h>
 
 #define paddr_bits PADDR_BITS
-- 
2.45.0


