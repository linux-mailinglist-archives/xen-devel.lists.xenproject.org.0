Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E1A8420C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 13:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945330.1343566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNF-0004Qz-N1; Thu, 10 Apr 2025 11:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945330.1343566; Thu, 10 Apr 2025 11:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qNF-0004LG-Hv; Thu, 10 Apr 2025 11:47:13 +0000
Received: by outflank-mailman (input) for mailman id 945330;
 Thu, 10 Apr 2025 11:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qND-0003hP-T5
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 11:47:11 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 888446a5-1601-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 13:47:09 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so5802565e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 04:47:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893776dfsm4651418f8f.33.2025.04.10.04.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 04:47:07 -0700 (PDT)
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
X-Inumbo-ID: 888446a5-1601-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744285628; x=1744890428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oR7MLPF5r2CabjIPs5otgDPIkflYO1C7gLrLM21PNY=;
        b=sJLnZvh9vLi6V8GIm5fSBerHHR2phkg4cNc0nZM6CptZbaztCW5hnPYxcIpLKr+dAq
         I0yIzRCGZOgb4CvllsJDSUmRqlE73CNddF+bJH4DZIeeEVf5FiCOwCFsoR2UHjW1wgmb
         G98n7OTd7pw2D5YjbkmCET1/7CnSTI7OHBlCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285628; x=1744890428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oR7MLPF5r2CabjIPs5otgDPIkflYO1C7gLrLM21PNY=;
        b=QxhKRvO6b6uMcOs3DCl2zue8/l/6AsXr2h4djybRuNk4Yd0Wn1KbbFM2U2fQywYpKq
         puA8JSFeb02Ermh8KT1GuKI/BLhB3tr1aVJtgOO10zsPJ/joEku/Z9lKrhnagICsXMj0
         IrrNZmoMLvcopOYCVnB6B2k/e79Epg7G8wtb81IWBCqRfv4Dmpz9u7ogRs2k536W5Wx+
         efSNHQbZ7jqLCGl+1oXu4qYEaC7/1AOg0M2jXFhvX/9YxhKUo0GgVrMAn8u8UgnQ68O9
         emTW26AmgxC6VPiLMAig3IEaThsQJm/5W0RtMJXtqvJitm7QIDdc363sXZkFKR+NaA16
         Hogg==
X-Gm-Message-State: AOJu0YzdG/U0W7iFTMDWJK5aY23DuxN+oyORf9spMUxtn8LANBC9ADv6
	XPuwlmHVsYCOgDW+4Eo3/kVwcBGbSXZAI0Ugx3w/OMMeI1vg3NQvpBsuAGSetLwGTkXYaLiYW+o
	BtNQ=
X-Gm-Gg: ASbGncvX3Pk1IhOaeqXMXfZo6hOoiojut3iK3fV0O1SHbTMnTR5kMsdg+vXU/0ZolA1
	Zal63Sj+hrJhJmhBvebwH84Dl8XqNmr0VMpFZHhzWHe4Rg3Y3vhaosOLqDKmUfIlP9MO+o44xLG
	4D1lzzAqj3xw561gxhuiWfWYFpmpCZu9ky2HWHzbz1mHCYOE6CrXzB2BNUUZIw0f5Nb7hkhUfk7
	UkUSvxCnlcLT9uLI65ZHOfBR/s8MLQHBFiwDSNXP1wns4ciIUhL45PbJTL4mdz9pb8hf2x/XmEP
	2S686vlNE8UTWMxtNakChH6JJE8Iksa4ZBIlsFNsEC0dP00WwMlGGSf0fS7dZqGqcNgvs+GLPjE
	XPqbnNYamaN+9JA==
X-Google-Smtp-Source: AGHT+IHp9CcvKpKQofVYiEDgkozYwHI52e8wyqB+JBcEyl6/M6yyPe4KENEfa71LNOyFUIVJLIVErg==
X-Received: by 2002:a05:600c:468b:b0:43d:fa58:700d with SMTP id 5b1f17b1804b1-43f2d99ac9bmr20222035e9.32.1744285628355;
        Thu, 10 Apr 2025 04:47:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 4/6] Factor our x86-isms in the linux build script
Date: Thu, 10 Apr 2025 12:46:26 +0100
Message-Id: <20250410114628.2060072-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation to use it for arm64 too.  Rename the script.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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
index 734f3982c46f..a8e56b165ed6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -28,8 +28,7 @@ stages:
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
index 5ed5608628bc..c78cd6ca46da 100755
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
 tar xf linux-"${LINUX_VERSION}".tar.xz
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


