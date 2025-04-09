Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E2A82C99
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944345.1342870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQN-0005oB-1s; Wed, 09 Apr 2025 16:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944345.1342870; Wed, 09 Apr 2025 16:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQM-0005k6-Pr; Wed, 09 Apr 2025 16:37:14 +0000
Received: by outflank-mailman (input) for mailman id 944345;
 Wed, 09 Apr 2025 16:37:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQL-0004du-GQ
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:13 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3873bf4-1560-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 18:37:13 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so47453455e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:13 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:11 -0700 (PDT)
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
X-Inumbo-ID: e3873bf4-1560-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216632; x=1744821432; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IltmhtHT5BBVSpsleYVnDmlWB3S52pBC6IXbUI4pNWI=;
        b=AK5staHq0nth2sCdNcGTytOj1Tl8l7+R88tjEXHf95zrS+j+b5O7FLmL2o4awBtLo2
         UQA/sWIYNvibLf7SKSPdd/FIHIdMFWMDrzkq4ONjhy9ZZlwQuSn2DnoowvTgA92xF0s3
         93QOO8pXpfQTH1D+I3eEmDVHns6qIH8ZdrpJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216632; x=1744821432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IltmhtHT5BBVSpsleYVnDmlWB3S52pBC6IXbUI4pNWI=;
        b=GLrH4jm3y3H4TTvEqRWmKpCOdVibwoJwwacwY2thCNdUoaVfcEL0UsaRhIBqqltK32
         mdt4hd8afD3gdIQjVP/GbR9MimodE7pKxM/tx2M3qosg5ANow1aPYfYvVfOMFn84NK8y
         GKz8Scog2/4dpcCzApnfUwWuU+g4ZjAZ18hAGSnujPn11+R1EmZgS8WdmEm4dyYkQfEc
         wZCBJrvnH2fuoUdBnlJDyGcZ2l0tvM2qgs8UYNmuXZ7lK3Tuh7vXj7HFXVumCdCpVHWw
         4YWIGqE7wHUA+mgOwb/2gpd28+fWkdezg560Ox7blLZMmV0T8z+I1ZXjYJCqRBuZlZ8g
         pGwA==
X-Gm-Message-State: AOJu0YxVZxZMgNSonAvj6RhAvnR8uhIviB0Zd0UlKqLqalfwb1c4Uxi1
	U9kS9ToQcJzHhr3NitxEs0Pxk9+uVsFxZ7P1rZCzp3afNS83vzWbQGW8BTxz+sdcUU8TSv+KQrh
	9xUQ=
X-Gm-Gg: ASbGncvCrw+VMJF1LXzjiEdZsWoflovsyoXrBgT+JQCTxw+YEzurRWndUtjxg+SjD9u
	MfsxBG9Xl8GO6waznamcC/T2rz7RGxZtnXEX3Wb5LbkPUUndJWnRAtKxXd0UOrxHPO1Eaw+9vun
	+RZ9syhg/63jmAWLKNzmDqOcd3oWtGcJLa48fCpRLmQDv/WANjHh3y0JSx6t+aS0EPrFy1cPoLc
	GlUZxlnYIewVrdyvzkuhD6e6E2UiZ35anKY05vLmwWovJD25fDYdBoJMj2qbRFON4IA6xjd/Ni/
	C7L4qtR2OIRxeQ6txhG0KNarAo2zFL1gxctW01JXxcT308eQfgBEOfl5w78CaGz/ws1SeEOS3og
	3HAHop6bKwEGt/4ZUD1HOs0e+
X-Google-Smtp-Source: AGHT+IEWpUEEFYkSqnG+ZB6hcoZyumqk8nW6Xhw9oFU/OuNIS9ePZMvLjHfUbXh/CYGghUEQluNSXQ==
X-Received: by 2002:a05:600c:46ca:b0:43d:fa58:700d with SMTP id 5b1f17b1804b1-43f1ed6f0abmr33987875e9.32.1744216632086;
        Wed, 09 Apr 2025 09:37:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 6/8] Factor our x86-isms in the linux build script
Date: Wed,  9 Apr 2025 17:37:00 +0100
Message-Id: <20250409163702.2037301-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation to use it for arm64 too.  Rename the script.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml                                |  3 +-
 ...{x86_64-kernel-linux.sh => build-linux.sh} | 34 +++++++++++++------
 2 files changed, 24 insertions(+), 13 deletions(-)
 rename scripts/{x86_64-kernel-linux.sh => build-linux.sh} (55%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5a0a853e551d..ff8dce7be05d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -31,8 +31,7 @@ stages:
 #
 x86_64-kernel-linux-6.6.56:
   extends: .x86_64-artifacts
-  script:
-    - . scripts/x86_64-kernel-linux.sh
+  script: ./scripts/build-linux.sh
   variables:
     LINUX_VERSION: 6.6.56
 
diff --git a/scripts/x86_64-kernel-linux.sh b/scripts/build-linux.sh
similarity index 55%
rename from scripts/x86_64-kernel-linux.sh
rename to scripts/build-linux.sh
index 5a0160655bea..5e25e958c0f3 100755
--- a/scripts/x86_64-kernel-linux.sh
+++ b/scripts/build-linux.sh
@@ -9,6 +9,7 @@ set -ex -o pipefail
 
 WORKDIR="${PWD}"
 COPYDIR="${WORKDIR}/binaries/"
+UNAME=$(uname -m)
 
 # Build Linux
 MAJOR=${LINUX_VERSION%%.*}
@@ -16,17 +17,28 @@ curl -fsSLO \
     https://cdn.kernel.org/pub/linux/kernel/v"${MAJOR}".x/linux-"${LINUX_VERSION}".tar.xz
 tar oxf linux-"${LINUX_VERSION}".tar.xz
 cd linux-"${LINUX_VERSION}"
-make ARCH=x86 defconfig
-make ARCH=x86 xen.config
+
+make defconfig
 ./scripts/config --enable BRIDGE
 ./scripts/config --enable IGC
 ./scripts/config --enable TUN
-cp .config .config.orig
-cat .config.orig \
-    | grep 'XEN' \
-    | grep '=m' \
-    | sed 's/=m/=y/g' \
-    >> .config
-make ARCH=x86 olddefconfig
-make -s -j "$(nproc)" ARCH=x86
-cp arch/x86/boot/bzImage "${COPYDIR}"
+
+case $UNAME in
+    x86_64)
+        make xen.config
+        cp .config .config.orig
+        cat .config.orig \
+            | grep 'XEN' \
+            | grep '=m' \
+            | sed 's/=m/=y/g' >> .config
+        ;;
+esac
+
+make olddefconfig
+
+case $UNAME in
+    x86_64)
+        make -j$(nproc) bzImage
+        cp arch/x86/boot/bzImage "${COPYDIR}"
+        ;;
+esac
-- 
2.39.5


