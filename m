Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72C4C8B4C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281297.479576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1M1-0000AM-Pi; Tue, 01 Mar 2022 12:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281297.479576; Tue, 01 Mar 2022 12:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1M1-00007Q-MB; Tue, 01 Mar 2022 12:11:45 +0000
Received: by outflank-mailman (input) for mailman id 281297;
 Tue, 01 Mar 2022 12:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoc=TM=citrix.com=prvs=05201426e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nP1Lz-0008Ic-Qg
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:11:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c025121f-9958-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:11:42 +0100 (CET)
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
X-Inumbo-ID: c025121f-9958-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646136702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ud7MXxbX94bNlyXml0X8hASsYOPzgNU7AYPT+z5zGV8=;
  b=I3Gdhs8ShNjYbIy6U8g83SBnMvezC8+6bTLDMixNRZy6ORPug9067Rce
   mxMhD1wt8R8RIcLrCMA1Icbh33dEImuDCLJzbON9DlnZX5k+GRmUaXboT
   M+NBiKStoCRLortPe9CFmxrdQXEmIjVlWEE+6NuWBZD/4Bxj5UmTz0uDM
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65205231
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FJ87bKBgtdeQkRVW/zXjw5YqxClBgxIJ4kV8jS/XYbTApD9302EPz
 2oeWGGDaPaJZjfxf90jaoS08EpSuJ7QxtJqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhfm
 NgKpbq3ZD4tJ6KcoNg9dCRCGWZhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4TR66DP
 ZFAAdZpRCjvXDhwKHkMM4Adhva2iFXkeixEuE3A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt+Xu2iujCtSjyQo4VGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDUd3VTxC+5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOmp87AiwM0
 XKwm8rmVQRTkJqoU3ja6eLBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Q2f21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTVflhdwTXGY3h+Y1FAd7faFUwZnY1QvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MpO93qVZhzlPGxfTgAahwyRoAVCnSWXFXalByCmGbKhzy9+KTSuftX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClE+STF5VqSImutJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:x5wfiaGUJ/VBdCIfpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65205231"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 1/3] automation: adding debian:stable container
Date: Tue, 1 Mar 2022 12:11:31 +0000
Message-ID: <20220301121133.19271-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301121133.19271-1-anthony.perard@citrix.com>
References: <20220301121133.19271-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This container will be used to check that generated source file in the
git repository are up to date.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/build/debian/stable.dockerfile | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 automation/build/debian/stable.dockerfile

diff --git a/automation/build/debian/stable.dockerfile b/automation/build/debian/stable.dockerfile
new file mode 100644
index 0000000000..912c4a5345
--- /dev/null
+++ b/automation/build/debian/stable.dockerfile
@@ -0,0 +1,53 @@
+FROM debian:stable
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN useradd -ms /bin/bash user
+ENV DEBIAN_FRONTEND=noninteractive
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        autoconf \
+        zlib1g-dev \
+        libncurses5-dev \
+        libssl-dev \
+        python3-dev \
+        xorg-dev \
+        uuid-dev \
+        libyajl-dev \
+        libaio-dev \
+        libglib2.0-dev \
+        clang \
+        libpixman-1-dev \
+        pkg-config \
+        flex \
+        bison \
+        # gettext for Xen < 4.13
+        gettext \
+        acpica-tools \
+        bin86 \
+        bcc \
+        liblzma-dev \
+        # libc6-dev-i386 for Xen < 4.15
+        libc6-dev-i386 \
+        libnl-3-dev \
+        ocaml-nox \
+        libfindlib-ocaml-dev \
+        markdown \
+        transfig \
+        pandoc \
+        checkpolicy \
+        wget \
+        git \
+        nasm \
+        gnupg \
+        golang \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+
+USER user
+WORKDIR /build
-- 
Anthony PERARD


