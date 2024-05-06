Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7DF8BCBBA
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717431.1119645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNe-0001vb-1V; Mon, 06 May 2024 10:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717431.1119645; Mon, 06 May 2024 10:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNd-0001sV-Pe; Mon, 06 May 2024 10:15:33 +0000
Received: by outflank-mailman (input) for mailman id 717431;
 Mon, 06 May 2024 10:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNc-0001n2-91
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:32 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90c7cc01-0b91-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 12:15:30 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so353711866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:30 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:28 -0700 (PDT)
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
X-Inumbo-ID: 90c7cc01-0b91-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990529; x=1715595329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GS70VGt/vkRIGFqYUodDia2ytY8yKMbU0vSOnyuvPs0=;
        b=FEK1rtCHBibIkRfqMrYP1ttJrjXNRoyOG8vR0zx8+fzv8mQuB827OZbAJD4mwnNohl
         C1uJHzgQ5uoXN7eIcfqIAgZCrFYp8khOWqa7iyNdY8gVCKz+rmqlNLM/CQvXANRhA7FE
         hAdpwGFbWWaKp5qnwGIUysbj3d19ReiMsAGcqXr+DckHRSeJfB0r8IIrwhzUwPPDT+0O
         +qGo8V+6G2EDEEOFRRqfUFnG2xKzMsPXJEpFXx26XZFZEnv2Hm3vORlUoTBLN4N9Aoiz
         MGI3NC4Zleos9DI8u2SUp1/DLi/522rwFqTJXVxSHnXV1WQ+v30gwyimQtyL94UX8rQB
         eApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990529; x=1715595329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GS70VGt/vkRIGFqYUodDia2ytY8yKMbU0vSOnyuvPs0=;
        b=JkCysEtqJr9TQiWOBGRxIpthX9SmOCAkW0ADVh8hXcUIcKqy65uMhK+b8zQvXo96e1
         wwege+1Yr+X4l0TvA4xWt2IFhKabIlGWPNz12KW7ueqMeTc3hAHwDvgL0WO5pjjApP6p
         RxgjXheNKhwcWJiViYGSGjupCyOChJ73ObEfN4MSoKffMnI0rAifY7DAfhD3zvKxdb54
         u4p7OH3won0Q/SqPVpzOvAtCPUOth8SyshB7y/hxW2YEEbFk1yeOkZsgUD2cEUCLllqV
         0549Sp4oI3PzWPH8Lus8TSIDwp5jTEW6kZqyKIP1QuQcvcYC11MZ6a+5pRlM8Dm+nbgK
         /j1A==
X-Gm-Message-State: AOJu0YypOb9C8Mxk0KS5jsrvJ1EDNg+nWzYx8r/TyJS8x02bF33ANW97
	irsa2Ba1hsBjFRqftDbsBUx1T0iTkzBdjUwDz9LTDUP2/zamyPOCAo+d+g==
X-Google-Smtp-Source: AGHT+IFNfQs1aGRBM2aNpOJpnBHabE19zaC1aCJMK8HRlERQab4UdfftQY1oTH5pLYL0Ztec1KuYhg==
X-Received: by 2002:a17:907:7291:b0:a59:bfab:b25a with SMTP id dt17-20020a170907729100b00a59bfabb25amr3063761ejc.63.1714990529180;
        Mon, 06 May 2024 03:15:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v9 01/15] xen/riscv: disable unnecessary configs
Date: Mon,  6 May 2024 12:15:10 +0200
Message-ID: <f3fd3f5ba8a8cd5ead43880c337a23e62cf8c1e3.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
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
index 49d6265ad5..ff5c9055d1 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -494,10 +494,14 @@ alpine-3.18-gcc-debug-arm64-earlyprintk:
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
2.45.0


