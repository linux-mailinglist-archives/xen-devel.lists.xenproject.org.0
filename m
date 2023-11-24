Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319A27F7169
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640366.998402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSt-0006s3-3U; Fri, 24 Nov 2023 10:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640366.998402; Fri, 24 Nov 2023 10:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSs-0006lF-VV; Fri, 24 Nov 2023 10:31:14 +0000
Received: by outflank-mailman (input) for mailman id 640366;
 Fri, 24 Nov 2023 10:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSr-0006hy-9v
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96425539-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:11 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a0064353af8so547414966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:11 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:09 -0800 (PST)
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
X-Inumbo-ID: 96425539-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821870; x=1701426670; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GGwlFyEsHHh1M1lPvOTRu5vN91zCPhYcW+euIgRdPc=;
        b=X5i72WBEYjUCXLJdyg4b5evGkpIGgvze2DlaOwe2uuvggqyxzsJUrIWUy/gTShmnCy
         dahcnzLuTfpfe21StosdgP0/6Y88QUOeNjT4jxVMmLB5NVo5NtF2oDaclSzDcXxIuncA
         Sc9sFNSS9xkyi84MidGhpHDPH9J0rmfZ2s9lNy0AHZsps93rFuQmAppNCdOlwXe1zDPE
         pDUosdkYcjACgQ36LivdC0dHONM1I+NQqYiScRJG1HyY2OCdRoHwyPL0pwc5RrsrJeYX
         zKqkcphyoIIxcXTZMEbXcnmrPBw3ePMCSNSOVVyjG9yuK/kWOPNYtPQz/3iN3SAuabJ2
         j9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821870; x=1701426670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GGwlFyEsHHh1M1lPvOTRu5vN91zCPhYcW+euIgRdPc=;
        b=kpn9cdTZWrIGSntEEwdRfN/1v9L9jemKQO8NCGD8J0XQGFR/PaYVQUdjPUEi1N4cxi
         tM/LYGqkZ7VJVQEaMVNg8CkPy1iTD6sTW+WcKLx6o25TvVq7rfP3epntI5M3Ikaz/O2n
         vaZU22OxUuSviPVJRJYZ/nujMXuF7Z+h22iE34reQ8fIvjX0Q1IF7bANyq9v8wjksGZt
         4ZROmkZ9IcDg14nPokJBK/2843ZN4O0oT5rE993kHpZwpfBU4LFBiZJBTwvDoGdKoUjq
         qlR0cU7kFlTCvuKOW7GLvz7NTLbUnMtnlvMXpbmDvxFY/SZNjEB0X2+0gHmF3BCwaK5G
         jX9Q==
X-Gm-Message-State: AOJu0Yxuk3AXxmz80SS4KYfhEOvshAIdTNmLhgWK8qcvPXIosYKvRZ+c
	/CNxCtKSYlPbdMYm1iCT71ThR53ugwCypg==
X-Google-Smtp-Source: AGHT+IHqamxg5VKsBkqvKfJkp7qnvgFjJX41hjLUmZ8Pwg26bv7aLJ1u1lvg+/wFj2QE/guXdEO1KQ==
X-Received: by 2002:a17:907:920f:b0:a02:b9c2:87bb with SMTP id ka15-20020a170907920f00b00a02b9c287bbmr1842790ejb.15.1700821870039;
        Fri, 24 Nov 2023 02:31:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 01/39] xen/riscv: disable unnecessary configs
Date: Fri, 24 Nov 2023 12:30:21 +0200
Message-ID: <b4e85f8f58787b4d179022973ce25673d6b56e36.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch also fixes the build script as conf util expects
to have each config on separate line.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - update the commit message.
 - remove xen/arch/riscv/Kconfig changes.
---
 automation/gitlab-ci/build.yaml         | 122 ++++++++++++++++++++++++
 automation/scripts/build                |   4 +-
 xen/arch/riscv/configs/tiny64_defconfig |  18 ++++
 3 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30cced..f4ef81839a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -522,6 +522,38 @@ archlinux-current-gcc-riscv64:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_CREDIT2=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_NULL=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_HYPFS=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
+      CONFIG_ARGO=n
+      CONFIG_HYPFS_CONFIG=n
+      CONFIG_CORE_PARKING=n
+      CONFIG_DEBUG_TRACE=n
+      CONFIG_IOREQ_SERVER=n
+      CONFIG_CRASH_DEBUG=n
+      CONFIG_KEXEC=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_MEM_ACCESS=n
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
+
 
 archlinux-current-gcc-riscv64-debug:
   extends: .gcc-riscv64-cross-build-debug
@@ -529,6 +561,38 @@ archlinux-current-gcc-riscv64-debug:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
+    EXTRA_XEN_CONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_CREDIT2=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_NULL=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_HYPFS=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
+      CONFIG_ARGO=n
+      CONFIG_HYPFS_CONFIG=n
+      CONFIG_CORE_PARKING=n
+      CONFIG_DEBUG_TRACE=n
+      CONFIG_IOREQ_SERVER=n
+      CONFIG_CRASH_DEBUG=n
+      CONFIG_KEXEC=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_MEM_ACCESS=n
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
+
 
 archlinux-current-gcc-riscv64-randconfig:
   extends: .gcc-riscv64-cross-build
@@ -538,6 +602,35 @@ archlinux-current-gcc-riscv64-randconfig:
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_CREDIT2=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_NULL=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_HYPFS=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
+      CONFIG_ARGO=n
+      CONFIG_HYPFS_CONFIG=n
+      CONFIG_CORE_PARKING=n
+      CONFIG_DEBUG_TRACE=n
+      CONFIG_IOREQ_SERVER=n
+      CONFIG_CRASH_DEBUG=n
+      CONFIG_KEXEC=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_MEM_ACCESS=n
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
 
 archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -547,6 +640,35 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SCHED_CREDIT=n
+      CONFIG_SCHED_CREDIT2=n
+      CONFIG_SCHED_RTDS=n
+      CONFIG_SCHED_NULL=n
+      CONFIG_SCHED_ARINC653=n
+      CONFIG_TRACEBUFFER=n
+      CONFIG_HYPFS=n
+      CONFIG_GRANT_TABLE=n
+      CONFIG_SPECULATIVE_HARDEN_ARRAY=n
+      CONFIG_ARGO=n
+      CONFIG_HYPFS_CONFIG=n
+      CONFIG_CORE_PARKING=n
+      CONFIG_DEBUG_TRACE=n
+      CONFIG_IOREQ_SERVER=n
+      CONFIG_CRASH_DEBUG=n
+      CONFIG_KEXEC=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_MEM_ACCESS=n
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
 
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb..88287b9c46 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -14,7 +14,7 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
 
     # Append job-specific fixed configuration
     if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
-        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
+        sed "s/ /\n/g" <<< "${EXTRA_FIXED_RANDCONFIG}" > xen/tools/kconfig/allrandom.config
     fi
 
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
@@ -28,7 +28,7 @@ else
     echo "CONFIG_DEBUG=${debug}" >> xen/.config
 
     if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
-        echo "${EXTRA_XEN_CONFIG}" >> xen/.config
+        sed "s/ /\n/g" <<< "${EXTRA_XEN_CONFIG}" >> xen/.config
     fi
 
     make -j$(nproc) -C xen olddefconfig
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 3c9a2ff941..ce37c5ae00 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -6,6 +6,24 @@
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
 # CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
+# CONFIG_ARGO is not set
+# CONFIG_HYPFS_CONFIG is not set
+# CONFIG_CORE_PARKING is not set
+# CONFIG_DEBUG_TRACE is not set
+# CONFIG_IOREQ_SERVER is not set
+# CONFIG_CRASH_DEBUG is not setz
+# CONFIG_KEXEC is not set
+# CONFIG_LIVEPATCH is not set
+# CONFIG_MEM_ACCESS is not set
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
2.42.0


