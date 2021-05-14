Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87516381018
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 20:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127494.239653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcxD-0003a4-SW; Fri, 14 May 2021 18:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127494.239653; Fri, 14 May 2021 18:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhcxD-0003X7-L8; Fri, 14 May 2021 18:54:31 +0000
Received: by outflank-mailman (input) for mailman id 127494;
 Fri, 14 May 2021 18:54:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhcxB-0001R5-IY
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 18:54:29 +0000
Received: from mail-il1-x132.google.com (unknown [2607:f8b0:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d41a3445-4e51-4fca-b306-9e1ab418212c;
 Fri, 14 May 2021 18:54:10 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id j20so581131ilo.10
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 11:54:10 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d81sm2815190iof.26.2021.05.14.11.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 11:54:09 -0700 (PDT)
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
X-Inumbo-ID: d41a3445-4e51-4fca-b306-9e1ab418212c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dKx3kHJenx3C/CwPtUUrPl3dcyda2vxTcbUQPlrKK/I=;
        b=u+78FH0Vr3aWOovk/6ndFCwcIoD4RYH9MU6CT9zrTY7IgYS7bRgUP/VgaR98+UBOvF
         8SlAnc9z2PHpbvanxUea/ViSfW8w04eQ2laQdvzDIQBGah0W57NX9WwzJUzjD8HGJPzm
         b3POupSVCma7wnpV/aIQdm7dlFq1NF1y98qwbs1Q4NYo/iQx2TNYHh0GBDmiplI6Tcjr
         vVBVAsxMF/sXfn/dThp/VV+7SnaTKVVIXmJltiGQGZpr2nXQuh2MLqQbBd1T6OO9dUmn
         97ybZZHlQVXK4XyRjxmRkAnJ1qQt+jF0V/7NlX4p6J/XghYfACuA6bAk1+Z8BhbvZckQ
         0ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dKx3kHJenx3C/CwPtUUrPl3dcyda2vxTcbUQPlrKK/I=;
        b=ZGeMNVXgCpqAV4Qs1BFS+OPSL3FDnS2seeLuIyYQVpHnY+U4ap7W9AWJoburwlZ+EN
         opFc+HZTyJUc7z7hbz+w92DTobueCVhWjSdU+eNZ9ZgDBHtTDAZ2XWsXXPeFEbjlC2nC
         2KnE9x5gA1u9q2fJcoNHJ49OCQsDccJuupwDi61qVeZq8ovYa9nLWxgwIYX3k5+EoLbw
         RJ+ftCms3fVfhn4+/SD5zxtl3oiz93r7o8K1yCh0psos9mtza2j4Kpuu4YJVJENp7Jx8
         LFuCQT0ClL1vK/AlPn4IIkXyMu7LcVUt49VyVvwz4iRx7ipVDnYPKxHPgX8HS8RxtZbD
         pi9g==
X-Gm-Message-State: AOAM533f/6rhaFmbycdbmyfcZAGybdgnB7uhG4PJWFMDsX2g1haAQ5a/
	bWtIngVCTuqycr2j/wivDZzidCRSOmavmA==
X-Google-Smtp-Source: ABdhPJxtvP4iLSoWwduNkKcEriM6cSfd2KJ6iN8SoZ/MqzVNFqk2QN6vVu89CSHckxRX7gIVfd6Baw==
X-Received: by 2002:a92:c569:: with SMTP id b9mr28228572ilj.117.1621018449545;
        Fri, 14 May 2021 11:54:09 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 5/5] automation: Add container for riscv64 builds
Date: Fri, 14 May 2021 12:53:25 -0600
Message-Id: <5a78ff425e45588da5c97c68e94275b649346012.1621017334.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621017334.git.connojdavis@gmail.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a container for cross-compiling xen to riscv64.
This just includes the cross-compiler and necessary packages for
building xen itself (packages for tools, stubdoms, etc., can be
added later).

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 automation/build/archlinux/riscv64.dockerfile | 33 +++++++++++++++++++
 automation/scripts/containerize               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 automation/build/archlinux/riscv64.dockerfile

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
new file mode 100644
index 0000000000..505b623c01
--- /dev/null
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -0,0 +1,33 @@
+FROM archlinux
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+# Packages needed for the build
+RUN pacman --noconfirm --needed -Syu \
+    base-devel \
+    gcc \
+    git
+
+# Packages needed for QEMU
+RUN pacman --noconfirm --needed -Syu \
+    pixman \
+    python \
+    sh
+
+# There is a regression in GDB that causes an assertion error
+# when setting breakpoints, use this commit until it is fixed!
+RUN git clone --recursive -j$(nproc) --progress https://github.com/riscv/riscv-gnu-toolchain && \
+    cd riscv-gnu-toolchain/riscv-gdb && \
+    git checkout 1dd588507782591478882a891f64945af9e2b86c && \
+    cd  .. && \
+    ./configure --prefix=/opt/riscv && \
+    make linux -j$(nproc) && \
+    rm -R /riscv-gnu-toolchain
+
+# Add compiler path
+ENV PATH=/opt/riscv/bin/:${PATH}
+ENV CROSS_COMPILE=riscv64-unknown-linux-gnu-
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


