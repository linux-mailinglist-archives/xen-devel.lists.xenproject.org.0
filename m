Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC57337A0
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 19:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550337.859346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYd-0001lo-8q; Fri, 16 Jun 2023 17:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550337.859346; Fri, 16 Jun 2023 17:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qADYd-0001ig-5Z; Fri, 16 Jun 2023 17:48:23 +0000
Received: by outflank-mailman (input) for mailman id 550337;
 Fri, 16 Jun 2023 17:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r/i=CE=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qADYb-0001iV-MI
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 17:48:21 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7cea49-0c6d-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 19:48:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 893518285513;
 Fri, 16 Jun 2023 12:48:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bTrGxnN3Vp94; Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 93ECF82857D3;
 Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3XTbkHY92eNK; Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 235DC8285717;
 Fri, 16 Jun 2023 12:48:17 -0500 (CDT)
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
X-Inumbo-ID: fa7cea49-0c6d-11ee-b232-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 93ECF82857D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1686937697; bh=sLLo5kuznR7Ll5zQ+dKN851VkZneROX7L26Gc4um15c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=KtRfZlmiXnT1Y1Z6FyePEZHcZgxovZ3dxbt8VRuLsp76rgsVg0mCLqQ7r2I2ORMRq
	 hE3ru1ZuvQ217jOuywuSaoCiehx5ZxDy/Ntc/0W1tVF2plfluC1bVlFCsLWn9N0lhL
	 nj/gIwxrqQmAzuieHJ8s/Yxtkh7CrBGrqy12r1s8=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v4 1/4] automation: Add container for ppc64le builds
Date: Fri, 16 Jun 2023 12:48:00 -0500
Message-Id: <0d59b5eb8de2b00839204c36a2a45eebab994369.1686936278.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1686936278.git.sanastasio@raptorengineering.com>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a container for cross-compiling xen for ppc64le.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 .../build/debian/bullseye-ppc64le.dockerfile  | 28 +++++++++++++++++++
 automation/scripts/containerize               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 automation/build/debian/bullseye-ppc64le.dockerfile

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automa=
tion/build/debian/bullseye-ppc64le.dockerfile
new file mode 100644
index 0000000000..8a87631b52
--- /dev/null
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -0,0 +1,28 @@
+FROM debian:bullseye-slim
+LABEL maintainer.name=3D"The Xen Project" \
+      maintainer.email=3D"xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=3Dnoninteractive
+ENV USER root
+
+# Add compiler path
+ENV CROSS_COMPILE powerpc64le-linux-gnu-
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes --no-install-recommends install \
+        bison \
+        build-essential \
+        checkpolicy \
+        flex \
+        gawk \
+        gcc-powerpc64le-linux-gnu \
+        make \
+        python3-minimal \
+        && \
+        apt-get autoremove -y && \
+        apt-get clean && \
+        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/scripts/containerize b/automation/scripts/contain=
erize
index 5476ff0ea1..6d46f63665 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -33,6 +33,7 @@ case "_${CONTAINER}" in
     _focal) CONTAINER=3D"${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER=3D"${BASE}/debian:jessie" ;;
     _jessie-i386) CONTAINER=3D"${BASE}/debian:jessie-i386" ;;
+    _bullseye-ppc64le) CONTAINER=3D"${BASE}/debian:bullseye-ppc64le" ;;
     _stretch|_) CONTAINER=3D"${BASE}/debian:stretch" ;;
     _stretch-i386) CONTAINER=3D"${BASE}/debian:stretch-i386" ;;
     _buster-gcc-ibt) CONTAINER=3D"${BASE}/debian:buster-gcc-ibt" ;;
--=20
2.30.2


