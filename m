Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5896384FB5F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 19:01:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678782.1056319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBL-0007hv-St; Fri, 09 Feb 2024 18:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678782.1056319; Fri, 09 Feb 2024 18:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYVBL-0007eE-KU; Fri, 09 Feb 2024 18:00:59 +0000
Received: by outflank-mailman (input) for mailman id 678782;
 Fri, 09 Feb 2024 18:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnec=JS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rYVBJ-0007AX-Nd
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 18:00:57 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c0f6149-c775-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 19:00:56 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d066b82658so17478961fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2024 10:00:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 fd1-20020a056402388100b00561103f29fbsm984503edb.75.2024.02.09.10.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 10:00:53 -0800 (PST)
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
X-Inumbo-ID: 2c0f6149-c775-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707501655; x=1708106455; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FAxJg0gmB5DWDjQyTT6C98jISHS9vZdHw6mxETNKmo=;
        b=E27mnS4bZ1BDoOq5d3Dg2Dc+ocZRlrmtvuoMKCToE/lbvm9r8W6BOGfH0UfZ49kbP5
         sl1/h+hGtvdc6CDaDKaqDbaZ7NdPS3eb2w/LAZLERLgS8QSHceUV7XEAno39EbwWAz/Y
         oI4R9NWNQ28FsDVZpOP/8mda5dUzM3DY+IZ+8g3RyYQHOWSncXAJSWIQoF4C8XgShI1h
         sQNrf+QP83I7Od+xiwsJtBkQg1TCTX1Hxm/29Ut7C+kOCf7BRh4ea7EOUDwhtin9UW+N
         yjcMwvkD5R5VIj7ukMlA5fMQqzBGvQZw4ua5tq7jQdqAL3AYwUKNIBeWVykP9K87IYTd
         kaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501655; x=1708106455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FAxJg0gmB5DWDjQyTT6C98jISHS9vZdHw6mxETNKmo=;
        b=lZyKt/p0BxpuEU5RbmGQiFunTFlbUqlmOcm5xTxRbh9MTqAiWv0DS+luj4XzZC2tf3
         EdgI3PZkG41olls/66mR5RAsCEZkvWKB3qhRFesogHRulX9pbM/uD3EqR+nFVXD6ak7C
         azJTTZUD8BsVNBeFLntZ/gOCphlpaIGecY0vpN4Uico9skKnaw3gw5mSZGJkOwkOQLk/
         nZ+vHVKGQcKGViFiixWHtS3aokY7eaEMgyjHHlmxKBgDolNe4ccTyvt77UlKvGHfIhIy
         JAYzzU6IIZPoSBU+7E7V2ZyTWowFITkAKtIXGQvW9HpM5rXSGQH1/mxDVoHLpfrwhNqw
         z3LQ==
X-Gm-Message-State: AOJu0Yxs9r2AlDunwz+Qoejf2pYADzzyc8+5DctKUFdoM7ibYzc2xJU/
	5Oc2UKfJQg38hLLQHF6E2A2pagT9oFeyuc6/RzCkMBZeiBmuzUsQzmLYObX5
X-Google-Smtp-Source: AGHT+IFbSuQHrFD+pCaWosSAT51WKM2wswg64lILWQSiNhb+QTAe+Zz7P5j3ad0mIicMH3BJdo6Qeg==
X-Received: by 2002:a2e:9888:0:b0:2d0:a2ad:bb5 with SMTP id b8-20020a2e9888000000b002d0a2ad0bb5mr1691612ljj.44.1707501654857;
        Fri, 09 Feb 2024 10:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2UNPXe/bQPGqfYVR+SWxZqR7Zi8dQvlVA1YR82f6V8MlZ84d6/8d410wm+zJH0xq9zzODG8LCTm+bzx6fbU7UQQRCXjVZ0tDE/77AZUqwDTDa5nH/MhdxWA==
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 2/7] automation: introduce fixed randconfig for RISC-V
Date: Fri,  9 Feb 2024 19:00:44 +0100
Message-ID: <3f662e3b4ded36d982ff04ed5cdfdd8e36f83594.1707499278.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707499278.git.oleksii.kurochko@gmail.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the file riscv-fixed-randconfig.yaml,
which includes all configurations that should be disabled for
randconfig builds.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
The patch were introduced after discussion in a topic:
 https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko@gmail.com/
 ---
Changes in V8:
 - Nothing changed. Only rebase
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/gitlab-ci/build.yaml                  | 8 ++++----
 automation/gitlab-ci/riscv-fixed-randconfig.yaml | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 automation/gitlab-ci/riscv-fixed-randconfig.yaml

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6d2cb18b88..376eb17f9c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -512,6 +512,8 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 # RISC-V 64 cross-build
+include: 'automation/gitlab-ci/riscv-fixed-randconfig.yaml'
+
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
   variables:
@@ -532,8 +534,7 @@ archlinux-current-gcc-riscv64-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig, variables, EXTRA_FIXED_RANDCONFIG]
 
 archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -541,8 +542,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig, variables, EXTRA_FIXED_RANDCONFIG]
 
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
diff --git a/automation/gitlab-ci/riscv-fixed-randconfig.yaml b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
new file mode 100644
index 0000000000..f1282b40c9
--- /dev/null
+++ b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
@@ -0,0 +1,7 @@
+.riscv-fixed-randconfig:
+  variables:
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_EXPERT=y
+      CONFIG_GRANT_TABLE=n
+      CONFIG_MEM_ACCESS=n
-- 
2.43.0


