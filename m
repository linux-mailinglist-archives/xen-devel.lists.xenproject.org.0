Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791A832525E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 16:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89814.169567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWo-0006Yt-Qu; Thu, 25 Feb 2021 15:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89814.169567; Thu, 25 Feb 2021 15:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFIWo-0006Y7-M9; Thu, 25 Feb 2021 15:26:10 +0000
Received: by outflank-mailman (input) for mailman id 89814;
 Thu, 25 Feb 2021 15:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJgK=H3=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFIWm-0006Ig-UC
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 15:26:08 +0000
Received: from mail-ot1-x335.google.com (unknown [2607:f8b0:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1364e052-c330-4da9-90bb-5ed76ce4ac61;
 Thu, 25 Feb 2021 15:25:52 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id e45so5980873ote.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 07:25:52 -0800 (PST)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id l4sm1047292ooq.33.2021.02.25.07.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 07:25:52 -0800 (PST)
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
X-Inumbo-ID: 1364e052-c330-4da9-90bb-5ed76ce4ac61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YiyxCQHFug7bXis7dCUf995/U3uEMwgP4ohptzUZnC0=;
        b=XsUF+tEDJHgsFKyjXHcFJ+zEKr+nxIgXngWfdFwdzX8dcQiGbpELJYFinIdlcoRoY7
         zihf1E5D2ZQShv99Q6chMRLIcWAgGMHTFLp44SSkmWD9lYOthFrt2rY6l53LW7Af+n3M
         CuQaxVzp2RaIdFm/KumXPEXpcliU06qQQcvvnrQy/Buii7ywuvaOdSdzaNmcpdWg81Np
         4EkAY5kjOnj7+AUkivbxWmgMDurFU+sA0DPCzewJnnA0aodSxk0RWzScjxmRJJ2bw5Vc
         hckmduIWDQ8DflDPZSDVwDEa4tK8uvW9Tbfqxbqwn0rkY8a4AnhiXiJMbpCQOLO2C11b
         yjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YiyxCQHFug7bXis7dCUf995/U3uEMwgP4ohptzUZnC0=;
        b=VeU89nQ8gsAAoWp9cdngsgSg+1HXB3zxuaqjn3BoKkj/sk5Z2wYFka3KUe9A1NGUjd
         VnBzcTYTJS5/2BZYg0eJ7DoH27/iHw0jbg9sJZ7Esd/bi/hXO2XNj7693PXAnBewxYTs
         JV6fojqhAwUWLVgiPfzldvcB3mKYzYWJ4P0Dov32pLwFictRdzlLG+KOeCpL3DdyvDXj
         Qc6g1zEAkoFVlKJfzu/2XCYR22lJfE9JVSYhmrhLdh0gaLEmiaCzLdtbXhYZQndiRCVw
         UaHnpD4puDBjP5s2kobq9d+s871COLBYxHmn/f4givz1vOXHsFMu1D42AIPDRiZc9zRa
         mCfw==
X-Gm-Message-State: AOAM533/CW0vla7b4/4BiDP6nN3eQH1sqoxi/WdUtY1us6gEC6ZlaFw6
	epovsaa5J3L1mNtO4DPCcsM+NXYKxRXjEdq/
X-Google-Smtp-Source: ABdhPJxNJ8R4E3S6M8cMfhQpDgFRBtQ59DhMPEt4AVCgAyLkG54jWkuYtksHDQZ0ZvTra/++dMm7eg==
X-Received: by 2002:a9d:7512:: with SMTP id r18mr2769605otk.90.1614266752261;
        Thu, 25 Feb 2021 07:25:52 -0800 (PST)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH for-next 6/6] automation: add container for riscv64 builds
Date: Thu, 25 Feb 2021 08:24:05 -0700
Message-Id: <a7829e62734a73993cd41cdbc18e1d16e4bb06d9.1614265718.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1614265718.git.connojdavis@gmail.com>
References: <cover.1614265718.git.connojdavis@gmail.com>
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
 automation/build/archlinux/riscv64.dockerfile | 32 +++++++++++++++++++
 automation/scripts/containerize               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 automation/build/archlinux/riscv64.dockerfile

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
new file mode 100644
index 0000000000..d94048b6c3
--- /dev/null
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -0,0 +1,32 @@
+FROM archlinux/base
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+# Packages needed for the build
+RUN pacman --noconfirm -Syu \
+    base-devel \
+    gcc \
+    git
+
+# Packages needed for QEMU
+RUN pacman --noconfirm -Syu \
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
+
+RUN useradd --create-home user
+USER user
+WORKDIR /build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index da45baed4e..1901e8c0ef 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -25,6 +25,7 @@ die() {
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
+    _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _centos72) CONTAINER="${BASE}/centos:7.2" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
-- 
2.27.0


