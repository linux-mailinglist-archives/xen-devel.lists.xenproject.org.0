Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95008A87D5A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949555.1346084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gty-00068f-CR; Mon, 14 Apr 2025 10:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949555.1346084; Mon, 14 Apr 2025 10:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gty-00066I-7k; Mon, 14 Apr 2025 10:18:54 +0000
Received: by outflank-mailman (input) for mailman id 949555;
 Mon, 14 Apr 2025 10:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gtw-0005Nh-OX
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:52 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dca5438c-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:18:51 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so25789315e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:51 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:50 -0700 (PDT)
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
X-Inumbo-ID: dca5438c-1919-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625931; x=1745230731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY27kwUeC0aHdjJMCw3sLatm4tQzjVnnxCoVdjVXbD0=;
        b=B6IuDxLqou4Xy83jA7+GhRD9EuQos3td7i2HrQAztXP74wgvwLWPYmz8pXjndN37dQ
         tZuhYgZF2PtsC8L9aj7z6toOUewfzI/M2LWt9ICBAvjsdGTt6x4OO2LwT+rXX3YEwiSC
         bURjqhBsTSqr+FsMf5XpHMdd5ZaiXgFurx9wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625931; x=1745230731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY27kwUeC0aHdjJMCw3sLatm4tQzjVnnxCoVdjVXbD0=;
        b=UJ2dtenEzsFrftLfydNgjVTgu6ygeKlgTslNP0pUWGsM3dTgPr+O/QP2TjQvnauPbL
         1tvq9N171WqLL4z8/8BJ/WyUiIOvsOpDEwDr557EuZrjlkU3EBRQYcrGSb+t8Eir0T+c
         vUs/HQ0QMZzi/P80bq/7iXuHccDfmgaMMUtCQ00YKA62mfOKEGayyZFzOjcQhfAfu3D5
         f/19exDh9glR4v0FPjAPc6Keg3Xg96fmc4psnxpHETKtseADEEF9oHijzm+MRvHZfHP2
         e160CnhG0BM5BQK63h1/LzXs7GT9v0ysOsg70n/QjMfVbl7sklDxln9KrUMaIWJeZBG8
         miKg==
X-Gm-Message-State: AOJu0YzHdasUu8BYCAqJL8HNbEtU8KlcAVXV1oI5Au1H8hcdmeyMyoHr
	F1MkmeJCMAa02wO2kBL/mLG098IM7hiaWYR3e6ymOSEZAranVYvms0ZepXYSNET94ZZzx1K8SdP
	m9FU=
X-Gm-Gg: ASbGncsXFZSsChUSgmKlRY4oCxMu5uVKD1n3yzOnfY4wPb2EIQO0tNPAWyUiD5L+D0J
	2Ljz5KOnywYWDJext8hBPT296Py6EsAPHPkaE0+HmC6AWItbE24qRWZZ1UG/Jn/VTv8CUrBqm21
	0xDKBZ2/OpPcxEH/DW5bk5YQph4AFTOtTu5RSpJr/VykGfWvhs6jRPGSILnuv6re/Z3KG8QxTeb
	6UF+HF5G5ncL6COiH007jtt/52IPyOs65IBPPfE2Vj9eJpTF5OtrFrke+0cG8HE5SxobA7SY3pV
	EgMyQSO1mbSYtedwC9SiAZo18Us0xaI9gaM0VVrHTWqrlN1nM4qtfj6OCiMN29YMuKKEFFpiKX4
	mefKF/BwW1IlI9pzk3YNKai8V
X-Google-Smtp-Source: AGHT+IHlhWTC657aAMaj6w7SXwH//jsWWtI2psvQ130N/dELSD5E/ipKReX8rEgxNL5sTAFtLI/UVA==
X-Received: by 2002:a7b:ce90:0:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43f337c2b5bmr112863215e9.3.1744625930811;
        Mon, 14 Apr 2025 03:18:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 3/7] Rework rootfs generation to make a cpio archive
Date: Mon, 14 Apr 2025 11:18:39 +0100
Message-Id: <20250414101843.2348330-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename the script as we're going to use it for ARM64 shortly, and have it take
a tar or cpio parameter to determine the output format.

Turn it into a proper bash script, and provide the cpio form under the new
artefact naming scheme.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * Use -print0
 * Don't dedup $PATHS.  It's going to change between cpio and tar in
   subsequent patches.
---
 .gitlab-ci.yml                                |  9 +++++++-
 ...6_64-rootfs-alpine.sh => alpine-rootfs.sh} | 21 +++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)
 rename scripts/{x86_64-rootfs-alpine.sh => alpine-rootfs.sh} (71%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 790a6d9f9896..b7d187168df2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -42,6 +42,13 @@ linux-6.6.86-arm64:
 #
 # x86_64 artifacts
 #
+alpine-3.18-x86_64-rootfs:
+  extends: .x86_64-artifacts
+  script:
+    - ./scripts/alpine-rootfs.sh cpio
+  variables:
+    CONTAINER: alpine:3.18-x86_64-base
+
 linux-6.6.56-x86_64:
   extends: .x86_64-artifacts
   script: ./scripts/build-linux.sh
@@ -62,7 +69,7 @@ x86_64-kernel-linux-6.6.56:
 x86_64-rootfs-alpine-3.18:
   extends: .x86_64-artifacts
   script:
-    - . scripts/x86_64-rootfs-alpine.sh
+    - ./scripts/alpine-rootfs.sh tar
   variables:
     CONTAINER: alpine:3.18-x86_64-base
 
diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/alpine-rootfs.sh
similarity index 71%
rename from scripts/x86_64-rootfs-alpine.sh
rename to scripts/alpine-rootfs.sh
index b70b3a54ede5..75e2f8648ce5 100755
--- a/scripts/x86_64-rootfs-alpine.sh
+++ b/scripts/alpine-rootfs.sh
@@ -1,4 +1,9 @@
+#!/bin/bash
+
+set -eu
+
 WORKDIR="${PWD}"
+COPYDIR="${WORKDIR}/binaries"
 
 apk update
 
@@ -56,5 +61,17 @@ passwd -d "root" root
 
 # Create rootfs
 cd /
-tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
-    bin dev etc home init lib mnt opt root sbin usr var
+case $1 in
+    cpio)
+        PATHS="bin dev etc home init lib mnt opt root sbin usr var"
+        find $PATHS -print0 | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
+
+        # Print the contents for the build log
+        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
+        ;;
+
+    tar)
+        PATHS="bin dev etc home init lib mnt opt root sbin usr var"
+        tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
+        ;;
+esac
-- 
2.39.5


