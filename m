Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4082B6D47
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 19:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29205.58471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ec-0000Kh-PH; Tue, 17 Nov 2020 18:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29205.58471; Tue, 17 Nov 2020 18:24:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ec-0000K5-Ll; Tue, 17 Nov 2020 18:24:34 +0000
Received: by outflank-mailman (input) for mailman id 29205;
 Tue, 17 Nov 2020 18:24:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kf5eb-0000JV-A4
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 685c27c8-d13e-44bb-b2c3-2762a5b9c7fb;
 Tue, 17 Nov 2020 18:24:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kf5eb-0000JV-A4
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:33 +0000
X-Inumbo-ID: 685c27c8-d13e-44bb-b2c3-2762a5b9c7fb
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 685c27c8-d13e-44bb-b2c3-2762a5b9c7fb;
	Tue, 17 Nov 2020 18:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605637472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eJ2hLKgOfS8/P8g/B8+o58K3OleQXpKSYMGB+jKi44U=;
  b=X04BZn3DyFbok95nRtc3LwEcRPZwNWCVqFNWH80Xv/J1lrtKnyHYGLH0
   EvnOEX3lSRx329ue1c8jC6Fu4aQvk0TPqarYPrAZb4tckZ9Z48/ZC1Hpi
   KRPqeQY/lfQAxMKvfhvd5maVbqBnaIazi74li5XvawTl89l2nuBnol7N5
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Duet1FZ93wPHjC75zY2ZTMyUr//3RCwPwahrIs/3iL1IC6BUuvJE9QfJRy1GENt7YOb79PvcI4
 GUe1Ym/N+jKTQcxQHlY+LNPJKNMAzRE6bKP/pz4zsb0zy208zS4gZpbdE2ZeSbEbZ1PDXDK3R8
 EEuFh18kA64U6gNz4sfOad44H28UqM1yIXvY4D9oBWnjLG972VWjCI/gAkBLbJ4dvaAckVRFiX
 gN4rxYrYlJoPV7Hl2BJ6CeOL9FT4u9Q4XQldWOYPKbgcVouepKmwFZePAWU98szHW7dovLbTz3
 Iac=
X-SBRS: None
X-MesageID: 31365326
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31365326"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>
Subject: [PATCH v1 2/4] automation/: add Ubuntu:focal container
Date: Tue, 17 Nov 2020 18:24:10 +0000
Message-ID: <42b2b80779e264d60fa3daf01110fece34f00696.1605636800.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <cover.1605636799.git.edvin.torok@citrix.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 automation/build/ubuntu/focal.dockerfile | 50 ++++++++++++++++++++++++
 automation/scripts/containerize          |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 automation/build/ubuntu/focal.dockerfile

diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
new file mode 100644
index 0000000000..1f014b67bc
--- /dev/null
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -0,0 +1,50 @@
+FROM ubuntu:20.04
+LABEL maintainer.name="The Xen Project " \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        zlib1g-dev \
+        libncurses5-dev \
+        libssl-dev \
+        python-dev \
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
+        gettext \
+        acpica-tools \
+        bin86 \
+        bcc \
+        liblzma-dev \
+        libc6-dev-i386 \
+        libnl-3-dev \
+        ocaml-nox \
+        libfindlib-ocaml-dev \
+        libsystemd-dev \
+        markdown \
+        transfig \
+        pandoc \
+        checkpolicy \
+        wget \
+        git \
+        nasm \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index ed991bb79c..94ff8b1ca8 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -29,6 +29,7 @@ case "_${CONTAINER}" in
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _centos72) CONTAINER="${BASE}/centos:7.2" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
+    _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
-- 
2.18.4


