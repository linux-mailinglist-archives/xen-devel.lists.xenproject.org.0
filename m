Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3599692E5CA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757332.1166260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrm0-0002Ig-49; Thu, 11 Jul 2024 11:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757332.1166260; Thu, 11 Jul 2024 11:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlz-0002E6-TA; Thu, 11 Jul 2024 11:15:39 +0000
Received: by outflank-mailman (input) for mailman id 757332;
 Thu, 11 Jul 2024 11:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlx-0007rD-WE
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:38 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e64191d0-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:37 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52ea7bdde68so872292e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:37 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:35 -0700 (PDT)
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
X-Inumbo-ID: e64191d0-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696536; x=1721301336; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbVg7w4alkvOoQ5s2c/0B5pTZEicSWylHq2BvrumP6Q=;
        b=GrWkvRWJkeHSTlr/sILTkHjDVr423aI4b7i4xBBb+VRMEWRnyQm1SNKP6UDFaCQMhT
         PPdjk23cGOz816ACWtTY76j+B4zhYwEX0TFuJ5YsYD0oCfFh4nK7sUmWxB2HHfQ6seBl
         Q9bob53f57kKnoIHDrgM4chsVaSKuCX8ufnA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696536; x=1721301336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbVg7w4alkvOoQ5s2c/0B5pTZEicSWylHq2BvrumP6Q=;
        b=T2N32k9mBvsNY7tQ09vijgy8e7ulqWQFRucQ5Um5lEeASu3F3aGzK4Ig6ag5VSC0lV
         4O70JvL0tNxOeWUadMxYt9k/bnlNbRRytmAJjQ4ur3AJtcr+dJlCp3dtafBHppFrkrw/
         hTlPP/EDr/zSjcHPuR6Cbr6tpsTjYZJBuCdm5nzClTFD4hHH7udjz8oivgiPeAacZu8Y
         5202CdgnFIWXmklYjCkyOCS1wzpArlv4W9oB7WxsjtRXzF5N8sR7gvfbAqYFHunWZsvC
         X9GtKdt+vVLolCpEGa/YwfR0Oo46No0haHMNjyRbqEnIwUL1E/24dnJoZsf0cdfAopKi
         o78w==
X-Gm-Message-State: AOJu0Yy1WgCZC2M11UDb1Ckk1EzTGlXI6MTFenCT+MPCwLAtY8VycWf2
	EiMHxJF/TljArcAnxub1fGbUOlUZaTWuMgZ+TfDt590DBIff46PH1BDwOHmkSdALrOT48klChoo
	u
X-Google-Smtp-Source: AGHT+IEL4NyFSqGSNl8loq9qRYBr5SimlEEEgEkOozgj694FlwWQ/JTAUZD3wSHsANGFzjuohj8PyQ==
X-Received: by 2002:a05:6512:4016:b0:52c:e3ad:3fbf with SMTP id 2adb3069b0e04-52eb99d16aamr6026096e87.42.1720696536562;
        Thu, 11 Jul 2024 04:15:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 10/12] CI: Introduce debian:11/12-riscv64 containers
Date: Thu, 11 Jul 2024 12:15:15 +0100
Message-Id: <20240711111517.3064810-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For starters, they're slightly smaller:

  $ docker image list <snip>
  registry.gitlab.com/xen-project/xen/debian      12-riscv64         772MB
  registry.gitlab.com/xen-project/xen/debian      11-riscv64         422MB
  registry.gitlab.com/xen-project/xen/archlinux   current-riscv64    2.32GB

They also not rolling distros, so will be more predicatable testing for the
stable trees in the future.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/build/debian/11-riscv64.dockerfile | 33 +++++++++++++++++
 automation/build/debian/12-riscv64.dockerfile | 36 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 automation/build/debian/11-riscv64.dockerfile
 create mode 100644 automation/build/debian/12-riscv64.dockerfile

diff --git a/automation/build/debian/11-riscv64.dockerfile b/automation/build/debian/11-riscv64.dockerfile
new file mode 100644
index 000000000000..1c99bc89ea1a
--- /dev/null
+++ b/automation/build/debian/11-riscv64.dockerfile
@@ -0,0 +1,33 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bullseye-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=riscv64-linux-gnu-
+ENV XEN_TARGET_ARCH=riscv64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get -y update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+        gcc-riscv64-linux-gnu
+        python3-minimal
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/12-riscv64.dockerfile b/automation/build/debian/12-riscv64.dockerfile
new file mode 100644
index 000000000000..03fd4b03059b
--- /dev/null
+++ b/automation/build/debian/12-riscv64.dockerfile
@@ -0,0 +1,36 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bookworm-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=riscv64-linux-gnu-
+ENV XEN_TARGET_ARCH=riscv64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get -y update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        flex
+        gcc-riscv64-linux-gnu
+        python3-minimal
+
+        # Qemu for test phase
+        qemu-system-riscv64
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
-- 
2.39.2


