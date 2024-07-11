Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D992E5C5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757329.1166230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlu-0001Gg-RN; Thu, 11 Jul 2024 11:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757329.1166230; Thu, 11 Jul 2024 11:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlu-0001CZ-Lz; Thu, 11 Jul 2024 11:15:34 +0000
Received: by outflank-mailman (input) for mailman id 757329;
 Thu, 11 Jul 2024 11:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlt-0007rD-Iz
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:33 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a2f2c4-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:33 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-585e774fd3dso1047240a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:33 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:30 -0700 (PDT)
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
X-Inumbo-ID: e3a2f2c4-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696532; x=1721301332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RL63T9x2NC9K+sPMKqGW4jz6nO38f+CeHmJOCnQFiPo=;
        b=EYaZ0U2bBd/mQNFUaoMY7aeHdz4b2GP34jqAuVJUDHw2qfchgg3vuEY5+3m2259SvX
         HsgpHgWTZXgNNvS8XY4jopfVVhUqJmv5vNScqmRTSgUfTwVNFa5Sl1gXZwNjY09aL+NW
         8bMlSrYYZuCl1VEYk4KIrXPqAsP0q4fnzV8iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696532; x=1721301332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RL63T9x2NC9K+sPMKqGW4jz6nO38f+CeHmJOCnQFiPo=;
        b=v+rQqmAfkr6KSzs08eQEaWbgW2HhU7SKVMW3CxrXj7bJ+0/lVyn3hLc3gtVU2AUx8/
         ekqXKiAlvPRFBc9ap/Pnn5gtzeg3ICMO98dv7ijCnHCf6XTMlgnBEMxv2x1SgP4sutOx
         Hfo28oZDO6Gv9/eOUur+AtffsP0xqfqb1K/xWDNwQs9mlzdBVs0hYzKzm5IPLKTljtio
         hVdU+nhOADP7gWWU0NAvRFJ8pYRVTU/9mufj5QMXnszFivM3GwooB5N/EDzH2tZJ8OY7
         6UFx6pL04Cs67rCtvLQ2muXtmPN7xktuy67Pkiud+WLUANEISlKutu+vB6v3xIiLP7Et
         fX1A==
X-Gm-Message-State: AOJu0YxzJ+YyWgbtHUUMa5wfsELX7rMWfK+ZUAmBcbAgf2abcOxg/aEx
	y/pINriafcxigSvn8ymZ2DFR95dEKYaMb85m0GFLhTLfn00L5RotzU5uT9tNAefz8aQlpHOe/Mh
	e
X-Google-Smtp-Source: AGHT+IGupRV+XUgG2IowOX9DRoGWBEplDxEEQEoprzyI0WvvhM+VDMnqnqeyKw+Ly3em6CtOtziqMg==
X-Received: by 2002:a17:906:b319:b0:a72:676a:7d7b with SMTP id a640c23a62f3a-a780b688906mr677491866b.9.1720696532239;
        Thu, 11 Jul 2024 04:15:32 -0700 (PDT)
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
Subject: [PATCH 07/12] CI: Introduce a debian:12-ppc64le container
Date: Thu, 11 Jul 2024 12:15:12 +0100
Message-Id: <20240711111517.3064810-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make it non-root by default, and set XEN_TARGET_ARCH=ppc64 too.

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
 automation/build/debian/12-ppc64le.dockerfile | 36 +++++++++++++++++++
 automation/scripts/containerize               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 automation/build/debian/12-ppc64le.dockerfile

diff --git a/automation/build/debian/12-ppc64le.dockerfile b/automation/build/debian/12-ppc64le.dockerfile
new file mode 100644
index 000000000000..3b311e675ef5
--- /dev/null
+++ b/automation/build/debian/12-ppc64le.dockerfile
@@ -0,0 +1,36 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bookworm-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=powerpc64le-linux-gnu-
+ENV XEN_TARGET_ARCH=ppc64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
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
+
+        # Qemu for test phase
+        qemu-system-ppc
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index e9ad20aa0c80..aa3433f0dc98 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -32,6 +32,7 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:29";;
     _focal) CONTAINER="${BASE}/ubuntu:focal" ;;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:bullseye-ppc64le" ;;
+    _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _bookworm|_) CONTAINER="${BASE}/debian:bookworm" ;;
     _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
-- 
2.39.2


