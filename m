Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142768A8051
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707300.1105079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2A8-0007oL-Tb; Wed, 17 Apr 2024 10:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707300.1105079; Wed, 17 Apr 2024 10:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2A8-0007lU-Qa; Wed, 17 Apr 2024 10:05:08 +0000
Received: by outflank-mailman (input) for mailman id 707300;
 Wed, 17 Apr 2024 10:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2A7-0007lI-5S
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:07 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f72ac45c-fca1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:06 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5194cebd6caso430371e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:04 -0700 (PDT)
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
X-Inumbo-ID: f72ac45c-fca1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348305; x=1713953105; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHB/UxAL8E3rbDnKIaIo6e50EVsTREcWNgCcpnb5Lfw=;
        b=c7AfCmmGGlvKK6n4lF3Tj+xKbjZSK2IJHswBntBlkk6dcOgUf0DsSgWaD8y0R9dDYY
         qoWF98F5jta7a1x1GpG1U+6atCrz07cExJ/Jii4mtirzWqhVohte6ZlhI/WjKWrmQYmf
         79kEqK6sueyKFpaqcbxm55BnK9u86LHiXniPiqtPliV1z0NnBd8c710NC7YMKue/Ud9H
         9d/NrxchrsmrF8wMqZYNe6mFQcufKDZnSDt54wMusS9OQn6YB3+gOncwVT2NOFoBSL0K
         Hn2A6J2NoZqSc5pSmSQAo4rdRJDWvLyK9uYrwG9WI+59BPJyFyAXYrXFk/O7BMIhaak1
         IqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348305; x=1713953105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHB/UxAL8E3rbDnKIaIo6e50EVsTREcWNgCcpnb5Lfw=;
        b=Ql75SgEf0D4pzFi46KpleEPd/ZGss1BA2R+coV87L7jey4Kl6j5a9OSQJkR1ZSeCR9
         WFiwVGH7MdOLG43HbJSPjxB+19O4JHYSO6BRX2Je+yA1xR2dxc/rxo2lHDrpljhPL9Kb
         V2KKh1bI9ypycUyJkbg0FrWgeoA4H0i3V/iEYjXlFKyvgoC9J/R9nQBjzlVtzwFTkXAW
         vG8AOZqnhXYQtTRLBkyUVxQHjK+yLesVwbECy+cVjgzrgYVoNL2A6InH9kTc7Cd2w9CL
         3fJXZoY/x4QvT6xhQFz6l+3ALU6cHfmcZsUg0FglsO7f5iJ1RnuCc0zWi07dfUJg8f/x
         n5vQ==
X-Gm-Message-State: AOJu0YxmxRtd7PGXOr06c0G5S6TmjnsVqxHb6hurvs0pL752F0neli43
	iPcOcBhQO/KDXXZ4XVVMtnDZ+3KVUY9HVgAml3N1Ka2QpIAkjCSOuJW/PQ==
X-Google-Smtp-Source: AGHT+IFkdm2DmO95vHJ2guYJdPUzTlp6oK0crDh5h01xJ4X5iT+HQ0vhGbj+Fm6QSrgHzq+jSd5yvQ==
X-Received: by 2002:a05:6512:33cb:b0:518:d079:ffd9 with SMTP id d11-20020a05651233cb00b00518d079ffd9mr9099302lfg.13.1713348304889;
        Wed, 17 Apr 2024 03:05:04 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v8 01/17] xen/riscv: disable unnecessary configs
Date: Wed, 17 Apr 2024 12:04:44 +0200
Message-ID: <267bb71ebeeafde25284eff82408effebba4380b.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index aac29ee13a..a1dce6cefd 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -515,10 +515,14 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
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
 
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
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
index 87b13f8979..aa86fa10a7 100644
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
2.44.0


