Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FD38E8D0
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 16:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131795.246179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBf1-0007Pg-LY; Mon, 24 May 2021 14:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131795.246179; Mon, 24 May 2021 14:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llBf1-0007MR-HS; Mon, 24 May 2021 14:34:27 +0000
Received: by outflank-mailman (input) for mailman id 131795;
 Mon, 24 May 2021 14:34:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOm5=KT=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1llBf0-0005zC-61
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 14:34:26 +0000
Received: from mail-ot1-x329.google.com (unknown [2607:f8b0:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a12a2de7-aaba-43cb-bf74-89ba5790a82e;
 Mon, 24 May 2021 14:34:12 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso3513289otl.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 May 2021 07:34:12 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id p22sm2840564oop.7.2021.05.24.07.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 07:34:11 -0700 (PDT)
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
X-Inumbo-ID: a12a2de7-aaba-43cb-bf74-89ba5790a82e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTdpcVmRCgop2NexjHiymnhaCvkDQbmbyYol6ymHZ0c=;
        b=DSO2OyD5D9kLgCVqNzrAi7JG6GGuxr2HFfxpL5r9b2U1dLCDw+K6qYCC5CA6jdM1QV
         KI0AtKZHzIbGrpzw/Z2yIt9hJe1t9Q0LJb+mo2MHSIs7abKua9k1oSktcEt4+D2qzgFa
         lG+iMQfclCjhF7I052CgVYvUBArqF4qtDTEtS2xGOe67G24wcX8dtX1uaLzlwDN2Gitk
         ddTg5Fnf1TXMXDh8DnLIAVVw/c1E1iwgDwQOJh5dqc8c+h88iWDVeusXfQU/zXNFASSE
         gsvIFMePrNIYTKIkkumGyURco4W3DZQ9r2Vm1tLtzsDx4qFf/LOfqtE9njEc1VIFzpwK
         oAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTdpcVmRCgop2NexjHiymnhaCvkDQbmbyYol6ymHZ0c=;
        b=EwrDXVKt/U8r59l6s11p1VK36r/AK6t5DhrABRWYyOV6lQ52bdKKScwSvggWOgmAdN
         UEjUBQnGBnyzOhP9vxtdT9ZMPk6pjRQd7a13Y6cwLKzZw02tmyJ9FMVGzS5HeaLoHFlL
         oUfgFMzxrfmlaxzwnBEwErWOvNm8dHjL23hBaRnP9Pk+R8lpD1yWELmn59k60a6kVgap
         BJXCuuIGUhYOBcnQWmxTOWihqqdhtqx6G3xq9fM39HtqK7hsNTyft3OyFy1fr4Q9FrUI
         qGIsmiECenFz9bLAwnUeZ03cCMx8JmSDeLqhM6NhOi4aSbuSfKIylLcIffIM4JWqJ4Pp
         UnQg==
X-Gm-Message-State: AOAM532xv+6C2P6rcc8+K4GPWmRuDDTxvaCqYcZ3icngbxb5XFUYFD99
	XkZ7ZBosO2MW3MQz3N0WB/gQohHwHOf+9g==
X-Google-Smtp-Source: ABdhPJzGTihKkS6tM2uyS4Otw8RMydzhTSScHWdE1C1EXcQp6qQnRPQ5ke+MftA703SlnjRukwOfxQ==
X-Received: by 2002:a9d:855:: with SMTP id 79mr18230805oty.36.1621866852191;
        Mon, 24 May 2021 07:34:12 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 4/4] automation: Add container for riscv64 builds
Date: Mon, 24 May 2021 08:34:28 -0600
Message-Id: <e43a22c723b0320883e4f0dc3d08287937d29181.1621712830.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621712830.git.connojdavis@gmail.com>
References: <cover.1621712830.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a container for cross-compiling xen to riscv64.
This just includes the cross-compiler and necessary packages for
building xen itself (packages for tools, stubdoms, etc., can be
added later).

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 automation/build/archlinux/riscv64.dockerfile | 19 +++++++++++++++++++
 automation/scripts/containerize               |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 automation/build/archlinux/riscv64.dockerfile

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
new file mode 100644
index 0000000000..ff8b2b955d
--- /dev/null
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -0,0 +1,19 @@
+FROM archlinux
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+# Packages needed for the build
+RUN pacman --noconfirm --needed -Syu \
+    base-devel \
+    git \
+    inetutils \
+    riscv64-linux-gnu-binutils \
+    riscv64-linux-gnu-gcc \
+    riscv64-linux-gnu-glibc
+
+# Add compiler path
+ENV CROSS_COMPILE=riscv64-linux-gnu-
+
+RUN useradd --create-home user
+USER user
+WORKDIR /build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index b7c81559fb..59edf0ba40 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -26,6 +26,7 @@ BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
+    _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _centos72) CONTAINER="${BASE}/centos:7.2" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
-- 
2.31.1


