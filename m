Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1016D72E645
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 16:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548194.856028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95MG-0003bD-W8; Tue, 13 Jun 2023 14:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548194.856028; Tue, 13 Jun 2023 14:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q95MG-0003Yr-QD; Tue, 13 Jun 2023 14:50:56 +0000
Received: by outflank-mailman (input) for mailman id 548194;
 Tue, 13 Jun 2023 14:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IDdR=CB=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q95ME-0003AR-MI
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 14:50:54 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b136b793-09f9-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 16:50:53 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id CF0D443CEA;
 Tue, 13 Jun 2023 07:50:19 -0700 (PDT)
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
X-Inumbo-ID: b136b793-09f9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686667820; bh=qfGcTUScEPS/kn+AZiR+Dr4t3spHBjWMGqcd4ljzqZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i2vG7ZUdVuDLhBinWwevrPFWJ+oHgSqjStzlOsGiUPov+glIJhTRJa3TVON35pU97
	 LchwQIME5uzHR4nQ59+oeyidkalbBhN1nMAf6T9kJ9ZHlOzurC83i8t24vctpMHhU/
	 2em7eEF4hHjZdhb0b0lgtisi3nIQRQ9EO+kyufHTKOxlnQ9RtIqsM75ch6kxBNrmzQ
	 zRyOTPnheKdk+IKHvfzc0q3pfVqwLvz+yn4clQdmQ8n0i0hv8tqUDauGUT0iqNE7na
	 n04Kx6q8wDKCYnvDFlz4cgOIkJyYKz4UCvljs3IAj+0vEfi6KCyuL8bg4gtFZZCSbA
	 OPgLvOQ4tVgZw==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 1/4] automation: Add container for ppc64le builds
Date: Tue, 13 Jun 2023 09:49:59 -0500
Message-Id: <b970696f4f38fdf69ff112812c61f5537591d86f.1686667191.git.shawn@anastas.io>
In-Reply-To: <cover.1686667191.git.shawn@anastas.io>
References: <cover.1686667191.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a container for cross-compiling xen for ppc64le.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 .../build/debian/bullseye-ppc64le.dockerfile  | 28 +++++++++++++++++++
 automation/scripts/containerize               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 automation/build/debian/bullseye-ppc64le.dockerfile

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
new file mode 100644
index 0000000000..8a87631b52
--- /dev/null
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -0,0 +1,28 @@
+FROM debian:bullseye-slim
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
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
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 5476ff0ea1..6d46f63665 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -33,6 +33,7 @@ case "_${CONTAINER}" in
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _jessie) CONTAINER="${BASE}/debian:jessie" ;;
     _jessie-i386) CONTAINER="${BASE}/debian:jessie-i386" ;;
+    _bullseye-ppc64le) CONTAINER="${BASE}/debian:bullseye-ppc64le" ;;
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _stretch-i386) CONTAINER="${BASE}/debian:stretch-i386" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
-- 
2.30.2


