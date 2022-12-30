Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267765988A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 14:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469900.729353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBF19-0000c2-8N; Fri, 30 Dec 2022 13:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469900.729353; Fri, 30 Dec 2022 13:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBF19-0000Yg-4Z; Fri, 30 Dec 2022 13:01:47 +0000
Received: by outflank-mailman (input) for mailman id 469900;
 Fri, 30 Dec 2022 13:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm99=44=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pBF17-0000Iu-Bj
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 13:01:45 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b2b97e4-8842-11ed-91b6-6bf2151ebd3b;
 Fri, 30 Dec 2022 14:01:43 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id bs20so17757017wrb.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Dec 2022 05:01:42 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b00273cd321a1bsm19309548wro.107.2022.12.30.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 05:01:41 -0800 (PST)
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
X-Inumbo-ID: 1b2b97e4-8842-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aehIhiOSPO0UY1yboaOg5tDnKtSx7l5gzqO3ILXdJfA=;
        b=VzFOkqzAYFkBZjsI1vQb22bLSefA1AJk00aGoJ4x6smSoPhI4DRt+4te5XxBHVK4O/
         vL+4HnlXQhv7syvfllpSbOYaDkuI2vhwcxzCS/o1y/Bfh0k5tG40Hw1TXMIxhJaAs5Eq
         0oqIBLgWqdJKASL9vy8kcuK5uDwzZbRhEUZVNKcVRMetwb2waCuPgMNjqs9ATkBxlw2F
         4AEe6OcVUTnbCwLwdilncNx7OPyTB1BEd46F9+66qhalSrupEccH52cxRO59zgsqxp9N
         KkVcBnIMxGQ3yTJWK84iZQEc3lzqdIWc6/PWanRkfIaeMoFgMMAdq6A8QUF9niJ8OXT5
         lx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aehIhiOSPO0UY1yboaOg5tDnKtSx7l5gzqO3ILXdJfA=;
        b=1IyEO0o4JuqcOFPqvsYbcDNdUiWoxCQNDKIiWvRf8cAjV6uAgu36sLijvHVFuFHkRN
         oBMZOZ6CHXpoT+npAwjymfdDmrbJxB5lCkMbYPaZcmqP3+R03HNDe8f0qQ9Yyjfu5PRO
         ul60fuGTBaU5bchShiVt7kJmJoOst2WwKRLPQ0RCyDEG27HMMllOiuuTlcAh0SKXL+Yf
         qmNX1e55vFXZoglWnZV4OatIVsL4h70WrVeW0vhLtviAEtsrFdsF2iokBzCBYcFYNijW
         CbsYkriY/8OH09/NZH5m19QnYv6hJ45gQGaSzPzSO08w3sprdyKSpfATA+pOCgeBdmyr
         iuTg==
X-Gm-Message-State: AFqh2ko3g2uY8kiX4PUxrkTO3NkhMelwqQXC27HoU2jMk5BqVlXonZtq
	AbeaIiKIcX7XNQyPBz/dTTBHXqIdyHHh0ABL
X-Google-Smtp-Source: AMrXdXs6A6ybWocujd9fgMOhNk95Gw/OBPhLTk2ARoc/1tdpCbcY2EjXmUed8NhdVmUZX807QqzzOg==
X-Received: by 2002:a05:6000:1373:b0:242:30b3:3ca7 with SMTP id q19-20020a056000137300b0024230b33ca7mr19036403wrz.11.1672405301816;
        Fri, 30 Dec 2022 05:01:41 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [XEN PATCH v2 2/2] automation: add RISC-V 64 cross-build tests for Xen
Date: Fri, 30 Dec 2022 15:01:32 +0200
Message-Id: <855e05a0459d44282679f08c8f67e38d35635eb6.1672401599.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1672401599.git.oleksii.kurochko@gmail.com>
References: <cover.1672401599.git.oleksii.kurochko@gmail.com>
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


