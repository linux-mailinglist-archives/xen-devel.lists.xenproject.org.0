Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BA65EA50
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471848.731878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOwY-0007aJ-7W; Thu, 05 Jan 2023 12:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471848.731878; Thu, 05 Jan 2023 12:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOwY-0007XQ-4L; Thu, 05 Jan 2023 12:01:58 +0000
Received: by outflank-mailman (input) for mailman id 471848;
 Thu, 05 Jan 2023 12:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDOwW-00071H-ES
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:01:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1eaf22-8cf0-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 13:01:54 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso1115571wms.5
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 04:01:54 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 x5-20020a05600c21c500b003d9b89a39b2sm2159826wmj.10.2023.01.05.04.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:01:53 -0800 (PST)
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
X-Inumbo-ID: bf1eaf22-8cf0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEdE610llDLMp8O4DeyVRrmQCHhD1SKsTN47twxNoiI=;
        b=QFErldNCO2mrk5LL8zlYwXziQNBpOK+PphWvyCkUgYROLNMOs7C9I4qr/uDXg5kYhj
         8kqTI4rfGYYbB32LMUgGcX/Sx5/zHTuOYtvFe5kGHfwxbkswYskCJmkRk3h2RF4G3LfN
         A6gNjbSnsFpr7RValUIU12j34ckg6WaXbdMa0R0yZeeXPv24mhxvhY1avQsi5lGDKdLz
         H35Up31QgjmueDcNvKW+BIB9KjYx3MqtmyN8P/sqJLapiXBz0f4RTSy8YOkyTHcFXBWr
         O6LmVK76Ww0wRoiFONMqNSm3C2i539AjjvecNwt5f+LnsONlBxDAdkIhGJ7LHQjimAHe
         crrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEdE610llDLMp8O4DeyVRrmQCHhD1SKsTN47twxNoiI=;
        b=c0waLa+KnFc3tPsXKrXG/AToea9LFdoLugrYQuOufxRqM7bQdhKfTZRqHLddlj8n9Y
         ZlAH2M5dqLKcejVX92vyz8wyZMiC6qAtHE6VzhY6eNbr4zSZySQA8DSi9w0H8sFg4sMm
         c1jMfHJhjHWktZJSQUuTwg1+mH1DWxoC4hjA5drJ5sKnrYZYumfAoQ15jSPbRVypBC3U
         MPkS/0jlVCPLy/BgOzK0YwkJePL9/mlCKSN7oUi18lOsV/2vHeTibFLkWq+igtwCvkME
         MYmN1xxkKjA/4u9pI+UCMg69q6WYgk8MB4xaPfTmDfcMQq2X2H4UflHgxgh8LtLSm9CE
         1dJQ==
X-Gm-Message-State: AFqh2krEUHOMb6CLH8JcQ3aQvAbx/urSTSS/IvhWKoriwrI7aeRmXcbl
	aO4caCaw1i3OQ8EIKotaLoQvrFI63mcV7zK+
X-Google-Smtp-Source: AMrXdXtCSkkQJPSIaON/PqlUvKP0j+OCC8GRjx3CUMUnB0kYwufcQ54q3I7Z7/HiR3oPi6kFNsMgNQ==
X-Received: by 2002:a05:600c:3ac3:b0:3d1:cfcb:7d19 with SMTP id d3-20020a05600c3ac300b003d1cfcb7d19mr43668618wms.32.1672920113643;
        Thu, 05 Jan 2023 04:01:53 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 2/2] automation: add RISC-V 64 cross-build tests for Xen
Date: Thu,  5 Jan 2023 14:01:46 +0200
Message-Id: <7d9bf454d056180376031aaf862963036a46d1e5.1672912316.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1672912316.git.oleksii.kurochko@gmail.com>
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add build jobs to cross-compile Xen-only for RISC-V 64.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V4:
- Add RISCV RANDCONFIG jobs
- Remove unnecessary comments
---
Changes in V2:
- Add HYPERVISOR_ONLY to RISCV jobs because after rebase on
  top of the patch series "CI: Fixes/cleanup in preparation for RISCV"
  it is required to set HYPERVISOR_ONLY in build.yaml
---
 automation/gitlab-ci/build.yaml | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 43dbef8aba..6784974619 100644
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
@@ -619,6 +646,35 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
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
+riscv64-cross-gcc-randconfig:
+  extends: .gcc-riscv64-cross-build
+  variables:
+    CONTAINER: archlinux:riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    RANDCONFIG: y
+
+riscv64-cross-gcc-debug-randconfig:
+  extends: .gcc-riscv64-cross-build-debug
+  variables:
+    CONTAINER: archlinux:riscv64
+    KBUILD_DEFCONFIG: tiny64_defconfig
+    RANDCONFIG: y
+
 ## Test artifacts common
 
 .test-jobs-artifact-common:
-- 
2.38.1


