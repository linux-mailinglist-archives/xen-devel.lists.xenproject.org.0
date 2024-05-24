Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5308CE4BC
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729356.1134500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnH-0003T8-4J; Fri, 24 May 2024 11:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729356.1134500; Fri, 24 May 2024 11:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnH-0003RK-0x; Fri, 24 May 2024 11:09:03 +0000
Received: by outflank-mailman (input) for mailman id 729356;
 Fri, 24 May 2024 11:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sASnE-0003D0-Sc
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:09:00 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05423ceb-19be-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 13:08:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6265d3c488so95339466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:08:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817c81sm116051366b.28.2024.05.24.04.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:08:57 -0700 (PDT)
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
X-Inumbo-ID: 05423ceb-19be-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716548939; x=1717153739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VObOJh3vdjUSCat91cLLs4dKVo8jpzpt3RbhRwfCXX4=;
        b=BT3hrZH+0zQcsy8aojUBE1iXiTjgohradSxzFr0lWS1lZZMWajmn6cKfM87ISrd3dJ
         JXNF6VPwBYzhaOwluaDWtx65Yd08KRwANoqgL8UClRqmrJzIobLIG1glN3jTZtfRQCJF
         cv3bxEQJqwZXvEZYTVpmgLRMnO85pTSIshZ2OE9HQQjhUqpbwAKBjLFWcyWYTf5NKqce
         LJPdYwa9FW4LdR2vxe9b9LkCetmMTSPjXITFTAElX64LH9RaBF9UlmtwY+XdYCuDSODb
         PhaguEL3wybPi2Lw1BFRakJMT3HgxDOeXaJQu5IkXCCJNqCYcu6fVxgXSeJnsNCPVDeV
         du+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548939; x=1717153739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VObOJh3vdjUSCat91cLLs4dKVo8jpzpt3RbhRwfCXX4=;
        b=oSJH6jYMwnMfjs/mUFdu5dQie0nF5xnSJua3T3hn0WARxH2l/GnFyEvJ6X7X+mKHUn
         lzYgsEl96+Kk6qhy6z1ud7ECXCacISDwaTK2i8tWOEiocn4KUKNCjjIbGuGOv4FKCNRz
         7gGngY8XSmeHXdjpbqE0KuO1RrICpW8PfTvmV41b6iQXap5aQplIb16DByBa26J3yqs4
         txML7UBEK/MKZoXkF0Z2n+U+5tLA0eJuq0lWzHrbjU8RmR32cfHG3VyjOAVSOPXlzd9h
         nB8H+0PSmj5RG1WsqM5hyhQQRk3OeaArRyGrAb9rh8Ed6affHtD+EToj/3bjuY+rGswl
         xQlg==
X-Gm-Message-State: AOJu0Yw6ipFMikCMmnNSbMTAVp3BX2TA8eLO4kQ/S6A5vcHY/H+0O3uS
	vddq+r9XpykaToHu4VnDf526039azoJXeCzhxF1os6f97RUlfrktKCXtfvjg
X-Google-Smtp-Source: AGHT+IEnfRajkGsXOcdDFf+N0NCog0aw4WP70ktRaE8iDhxiyttE5UG/CVauN9Avk8uaqYIdE5AXJA==
X-Received: by 2002:a17:906:2dd7:b0:a59:ccbb:595b with SMTP id a640c23a62f3a-a62642e937amr189197966b.25.1716548938644;
        Fri, 24 May 2024 04:08:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v11 1/9] xen/riscv: disable unnecessary configs
Date: Fri, 24 May 2024 13:08:47 +0200
Message-ID: <77cfff76ddcad4e41efce46c1e68d504e376bd32.1716547693.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716547693.git.oleksii.kurochko@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
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
Changes in V10-V11:
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


