Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DA92A846
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 19:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755534.1163958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsH1-0001J8-K7; Mon, 08 Jul 2024 17:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755534.1163958; Mon, 08 Jul 2024 17:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsH1-0001GM-Gp; Mon, 08 Jul 2024 17:35:35 +0000
Received: by outflank-mailman (input) for mailman id 755534;
 Mon, 08 Jul 2024 17:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQsGz-0000H0-Ru
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 17:35:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79c8dabd-3d50-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 19:35:32 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso247507366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 10:35:32 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc88csm11603666b.6.2024.07.08.10.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:30 -0700 (PDT)
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
X-Inumbo-ID: 79c8dabd-3d50-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720460131; x=1721064931; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4f91M354fClKBK9C+cxTehpG9qrbHFjq1S8H6hQbys=;
        b=tVritn+RvjUsNhvClXDkQ6ROulqzfl0Y4d2wh6AwF+2uU8drb8yhNNG7sSoc00XiDz
         0MYv4j4O5VlC9OVf0dcHpLGYEiNMVbsDxJHU0wBszN5L9+c+nXaThmppqeIxL3AYv/ZA
         W7VT9bTwpy82hbuueuyfSpsGfZf2pjf0EOEIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460131; x=1721064931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4f91M354fClKBK9C+cxTehpG9qrbHFjq1S8H6hQbys=;
        b=sULG/8y1HE5X8oa9ogD/mx11J4vjo3k4Gc0cyGU3ieGhkZs4ZS1kXvvDkCkKCz9VEh
         1o2RL+tkKz69GbmgRv3q7trYBrF+QWuBUkAyh9WGUnWqDOplcizVlnDkZlEmPXjoZcYf
         GroNOUKgZdgZZHo/LXqWmytFqeryJBmynMJc2m5Rrx85hPgRm9qFfExzVK5OEH/VEt4q
         pb8qMFLb+Y2w8Ohz7vOHzjXEU3qa8hQs3kgvDBycffCy3jdIwma52e/2nT5vxPokrIGX
         CASisbHrTRpUPdM+jyXyN5v4r7J8bDXZDQ9aM7TPElUuDWBMEIAk4itpCSyzW4uZRudF
         Rftg==
X-Gm-Message-State: AOJu0YxF1/ppJr1xtDw5JPfH9gpUkjRgI+Br5SvPyoftYp22PST9S9zM
	JsWERLdmYDSSlFeEE2QQdA86XUiWM93HJ7IqZE0kha07en46O6GsdBt+Mjiyuj2iDhZ6XHhyMnw
	/
X-Google-Smtp-Source: AGHT+IFZ7UULz4vxUyzkyIdVvhbt8bqRPpmCAPXGYYcuy6YcYeiqwPUEs6VBH9SOOPgLgxPPZaIEsQ==
X-Received: by 2002:a17:906:4ed6:b0:a77:c199:9cfc with SMTP id a640c23a62f3a-a780b8856e6mr15951166b.57.1720460131453;
        Mon, 08 Jul 2024 10:35:31 -0700 (PDT)
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
Subject: [PATCH 4/4] CI: Refresh bullseye-ppc64le
Date: Mon,  8 Jul 2024 18:35:22 +0100
Message-Id: <20240708173522.2218293-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
References: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in the style of bookworm-ppc64le

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
 .../build/debian/bullseye-ppc64le.dockerfile  | 51 ++++++++++---------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
index e166d205f38c..d846b670d02c 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -1,32 +1,33 @@
 # syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:bullseye-slim
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
 ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
+ENV CROSS_COMPILE=powerpc64le-linux-gnu-
+ENV XEN_TARGET_ARCH=ppc64
 
-# Add compiler path
-ENV CROSS_COMPILE powerpc64le-linux-gnu-
+RUN <<EOF
+#!/bin/bash
+    set -e
 
-RUN mkdir /build
-WORKDIR /build
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
+        gcc-powerpc64le-linux-gnu
+        python3-minimal
+    )
 
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes --no-install-recommends install \
-        bison \
-        build-essential \
-        checkpolicy \
-        flex \
-        gawk \
-        gcc-powerpc64le-linux-gnu \
-        make \
-        python3-minimal \
-        # QEMU runtime dependencies for test phase
-        libglib2.0-0 \
-        libpixman-1-0 \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
-- 
2.39.2


