Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D665E6F7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 09:41:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471708.731679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLoA-0004FZ-Bd; Thu, 05 Jan 2023 08:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471708.731679; Thu, 05 Jan 2023 08:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLoA-0004CL-7V; Thu, 05 Jan 2023 08:41:06 +0000
Received: by outflank-mailman (input) for mailman id 471708;
 Thu, 05 Jan 2023 08:41:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDLo8-0003sb-G8
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 08:41:04 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af938764-8cd4-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 09:41:02 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso781108wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 00:41:02 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003cffd3c3d6csm1752711wmq.12.2023.01.05.00.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 00:41:01 -0800 (PST)
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
X-Inumbo-ID: af938764-8cd4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aehIhiOSPO0UY1yboaOg5tDnKtSx7l5gzqO3ILXdJfA=;
        b=XyBn4t9PzsoVBWZ5HogTlhYr0qTNW/9gO9b4BLE4oYOPFemstOkmpmmEJXvftygwGM
         QBCPN4YC7GvxpentTkz1VTfxFLW8YcixdBVvCMXKYspCyzT6DsD9S1T38kEyhMShVXwe
         OFeY4WIN+/G3ubdPacUBSonky/oZzbZVTMgG7s7sGWUlUS1L3c9ON3bH1OUlR0UtskE4
         Jl8wGcyifXpg2af7OIY+r3Skj9nSW1SqpbMdWu755Ilpsb6sGpAvmmlWiHhbxlC13T+U
         GfKP5NhZIjolgGyb/lXgo64wQnrpXqzI9YrudkZvDB75gY1nP0xZaMtraRzTYy7UXaLJ
         5Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aehIhiOSPO0UY1yboaOg5tDnKtSx7l5gzqO3ILXdJfA=;
        b=zCfyEj4iVyNv3DAnXEf55KFxnSWc4mFLNnjEG/TOHT/aeoRXHZkgEmE8CkedgILuC1
         Jc1MYT9FQDJGDTiW5dGsqzpaQHqOr+BW78GfnyOwQc71iWMC8kqF2Yq//ia1oVnIw7O0
         bygWRNlj7wqad7R5NTIRfrZ0pGoVMA5+EtHeuU8JNJbjpjfuMy6rYAhYoKgbWiQCUVXb
         ddczT9SRRYpa59JnVP/nGjuU2SquqMQQSOHMOWtAYS9cQN3v9YEyl1qk2md1UVjjFzhe
         RNiYR0zmtH3V87muIsXc5BG3/YfaM1LhCaMHvvPaJfVGp3FXGP/5/VXuKpAEB27HxpVo
         NCTA==
X-Gm-Message-State: AFqh2kp2xGiFa4EVbRmbuJrRXzUwFy4ZFArtp0pWf/gFR7AdkkHAPRVf
	oZjrm7trJG/Sl+44GRXEMJWLHt9pw3cgIgnl
X-Google-Smtp-Source: AMrXdXsjNND4+vpRTOlet0CB22rhp0yoxL/EPO4XuLf3u5HKhxkQhI4j9IALsg7DG6x7TD2Vl9XO5A==
X-Received: by 2002:a05:600c:1e10:b0:3d1:f496:e25f with SMTP id ay16-20020a05600c1e1000b003d1f496e25fmr38734543wmb.16.1672908061997;
        Thu, 05 Jan 2023 00:41:01 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/2] automation: add RISC-V 64 cross-build tests for Xen
Date: Thu,  5 Jan 2023 10:40:51 +0200
Message-Id: <a9e0866ec025bc70b4cde78ab782fe11390222d6.1672906559.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1672906559.git.oleksii.kurochko@gmail.com>
References: <cover.1672906559.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add build jobs to cross-compile Xen-only for RISC-V 64.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V2:
- Add HYPERVISOR_ONLY to RISCV jobs because after rebase on
  top of the patch series "CI: Fixes/cleanup in preparation for RISCV"
  it is required to set HYPERVISOR_ONLY in build.yaml
---
 automation/gitlab-ci/build.yaml | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index e6a9357de3..11eb1c6b82 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -172,6 +172,33 @@
   variables:
     <<: *gcc
 
+.riscv64-cross-build-tmpl:
+  <<: *build
+  variables:
+    XEN_TARGET_ARCH: riscv64
+  tags:
+    - x86_64
+
+.riscv64-cross-build:
+  extends: .riscv64-cross-build-tmpl
+  variables:
+    debug: n
+
+.riscv64-cross-build-debug:
+  extends: .riscv64-cross-build-tmpl
+  variables:
+    debug: y
+
+.gcc-riscv64-cross-build:
+  extends: .riscv64-cross-build
+  variables:
+    <<: *gcc
+
+.gcc-riscv64-cross-build-debug:
+  extends: .riscv64-cross-build-debug
+  variables:
+    <<: *gcc
+
 # Jobs below this line
 
 archlinux-gcc:
@@ -617,6 +644,21 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
+# RISC-V 64 cross-build
+riscv64-cross-gcc:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: archlinux:riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
+riscv64-cross-gcc-debug:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: archlinux:riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    HYPERVISOR_ONLY: y
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
@@ -692,3 +734,6 @@ kernel-5.10.74-export:
       - binaries/bzImage
   tags:
     - x86_64
+
+# # RISC-V 64 test artificats
+# # TODO: add RISC-V 64 test artitifacts
-- 
2.38.1


