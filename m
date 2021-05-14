Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE83802B8
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 06:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127186.239006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPH6-0002qa-I9; Fri, 14 May 2021 04:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127186.239006; Fri, 14 May 2021 04:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPH6-0002mG-DO; Fri, 14 May 2021 04:18:08 +0000
Received: by outflank-mailman (input) for mailman id 127186;
 Fri, 14 May 2021 04:18:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhPH4-0001OI-PZ
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:18:06 +0000
Received: from mail-il1-x12b.google.com (unknown [2607:f8b0:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f48555-1565-4208-bab3-9c76742ed6b0;
 Fri, 14 May 2021 04:17:58 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id e14so24780380ils.12
 for <xen-devel@lists.xenproject.org>; Thu, 13 May 2021 21:17:58 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g11sm2401505ilq.38.2021.05.13.21.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 21:17:57 -0700 (PDT)
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
X-Inumbo-ID: 58f48555-1565-4208-bab3-9c76742ed6b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BT6O1zmlP2z29HXEprVn3g9HsKzNF9PGCbDM4AzPEW0=;
        b=pQczM9ZC3BARuMOdCbfLFjsZnq+3ddd9ElV754WAqTrDIqoCQXvmaKbdkRCW2IsFKZ
         uZeO6tTNGPBUyHX+2EHI54nkX+6xKd8h4r1AdC9I6SBgvaRtlBb939NrhDxkXUprIQUb
         TuFtwBkqOsNkuO0TvV1jFBVLFi22NZoUIfpHR2+4JCSlM9IwfrOX61wkScF4Gf8J/ME9
         YxZHEnT5YruOxW0Dvbbe4OZMsOG/HSJ7atIei8DCKq8TTF20jI/zMSKRMVLoY2/14lr4
         FR257G1aHV9RzK5TN+oGtd/TVeVaORZWIV29gB2/+gn19r6YDiAcByPdAUq0jDtRzpdR
         CtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BT6O1zmlP2z29HXEprVn3g9HsKzNF9PGCbDM4AzPEW0=;
        b=em9zajpMjslai1vj1NJfSFsI1pEbCwjbVGwGc1EUHGXb9HwPJhiOfwofVkw65DFz+p
         YSxbCj8k02MHsAJh6yUQ8fXv0pzDJyn81Gpt/JpzxQMjBRpc/IdBcCAMEtaKTkkPk7bN
         kKev+ldl8/IT84rDiIptE3dS76WlxFaEivOJoq+Qz3OFrjFWq3KazWEvfGsSBr1OBG5N
         Y+V2AqPFYZhjREFDA6MiowfgtiNz60xXhsg7Uw8z5bchXqZu/1+/uZpUgpzOQr5nXU4k
         uCw2f6gD8hrPo+MMbjlmV01r32/WPF6lL1RNoPDD6fMlbyjSS9xNAfQO9u4wpRCxmJy2
         pADQ==
X-Gm-Message-State: AOAM533E4g1XjEiIEMAAZ/hggiCu3jptuDaf/tqbr+1CREqa00buw3dt
	GW3RH4U0b87tDKv51+27Flhi/1lFBt0oyA==
X-Google-Smtp-Source: ABdhPJyCzzMyZqih7E+w2fiBBhZDynBm+hJhmYKL9iCW6+0WujSWgCNHq/2HDM81oLh3HLNtRqod1g==
X-Received: by 2002:a05:6e02:1a4b:: with SMTP id u11mr38672185ilv.258.1620965877573;
        Thu, 13 May 2021 21:17:57 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 5/5] automation: add container for riscv64 builds
Date: Thu, 13 May 2021 22:17:12 -0600
Message-Id: <3fc237b4350832e63be4943d4fd1b029fea8d486.1620965208.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620965208.git.connojdavis@gmail.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a container for cross-compiling xen to riscv64.
This just includes the cross-compiler and necessary packages for
building xen itself (packages for tools, stubdoms, etc., can be
added later).

To build xen in the container run the following:

$ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen

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


