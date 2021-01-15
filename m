Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AF2F886D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68655.122928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbA-0005xv-TS; Fri, 15 Jan 2021 22:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68655.122928; Fri, 15 Jan 2021 22:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XbA-0005xZ-Q8; Fri, 15 Jan 2021 22:29:40 +0000
Received: by outflank-mailman (input) for mailman id 68655;
 Fri, 15 Jan 2021 22:29:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xb9-0005xU-Ad
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:29:39 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ce1b3db-d953-436e-bf8f-8b1765b1fc98;
 Fri, 15 Jan 2021 22:29:37 +0000 (UTC)
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
X-Inumbo-ID: 8ce1b3db-d953-436e-bf8f-8b1765b1fc98
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MRMXAAKCznyCgSXYTb+3ZlgjJBpHTfYOk0OXr6qFO7Y=;
  b=E2TTAMqWwbPocunA5yNxuEgTpf8fLBsqvXl/i79qNC/KDVkfoKFzyzX8
   J4An7SlAOl9S+p+UvF/XCmsTAa6WLDthWzLKomXu6K6n32Zf1fjSr6wKZ
   J8JbFMdMCYZLIm4RfGIMSa/c8Y90Q9Dc8WRlr0JxVL1m4Tb6HxyBIhaiz
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1lKwyqH+GPZE8/aqrvXeJpMTjLDHobceXdarvyMZcQUZSpFc7J+fDsqqO3qKJHvyeXoDI6GUEK
 bIISUC2e4qjKyFqKO3CNWCdV7xRoAJApaN4GkYYEIGu+lTf1wm3uVCfGt2hnnsB8LuNwGYXBU/
 g22/3UyZE79YprhgO8gGjTM5CmICHfnVei3y+B4j6PORGagVg2Xf3ZqhBFyg2pYgYW7rqv3Crg
 nRs8qVNRVfnTkSA1eyhZ6Z7JvhyAJO26BsvIXziY+44+lMF9oayFAfsxaphzsZFqhuajIWtj9Y
 Oro=
X-SBRS: 5.1
X-MesageID: 35590778
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35590778"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>
Subject: [PATCH v2 1/2] automation/: add Ubuntu:focal container
Date: Fri, 15 Jan 2021 22:28:40 +0000
Message-ID: <63bf3ced2500eb9be579674ff2f0016ac9d73e70.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Doug Goldstein <cardoe@cardoe.com>

---
Changed since v1:
* dropped python-dev and markdown
---
 automation/build/ubuntu/focal.dockerfile | 48 ++++++++++++++++++++++++
 automation/scripts/containerize          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 automation/build/ubuntu/focal.dockerfile

diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
new file mode 100644
index 0000000000..c1c1f8d58f
--- /dev/null
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -0,0 +1,48 @@
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
index c8c3c20fa2..da45baed4e 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -28,6 +28,7 @@ case "_${CONTAINER}" in
     _centos7) CONTAINER="${BASE}/centos:7" ;;
     _centos72) CONTAINER="${BASE}/centos:7.2" ;;
     _fedora) CONTAINER="${BASE}/fedora:29";;
+    _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
-- 
2.29.2


