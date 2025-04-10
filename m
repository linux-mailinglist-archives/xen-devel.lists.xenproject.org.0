Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D36D8A84F3F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946382.1344296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaX-0008OO-Q3; Thu, 10 Apr 2025 21:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946382.1344296; Thu, 10 Apr 2025 21:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zaX-0008Lz-MQ; Thu, 10 Apr 2025 21:37:33 +0000
Received: by outflank-mailman (input) for mailman id 946382;
 Thu, 10 Apr 2025 21:37:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2zaW-0008Lk-Jh
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:37:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01c67ee5-1654-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 23:37:31 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso9589305e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:37:31 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae9780a0sm100427f8f.50.2025.04.10.14.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 14:37:30 -0700 (PDT)
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
X-Inumbo-ID: 01c67ee5-1654-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744321050; x=1744925850; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV671OWsZPCz48qmFfXSAWovXOQaZ6EW+7MHCndadN0=;
        b=IgCwI6NdaoATUmngf/vNYe+x9mttRVhvS6B0pBIpPuo5uRAQWE9v0y3BQ2GuSs++9k
         9xg+CxQj3xu/60WaCuy4nfLC6/rzDWEylxeCz6F5I7uNfhouLSY9xfrcq5siYzqLgaAe
         Yd47yvVsdrR5UJAlV6ZoGwGhpc49aHQAj4us8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744321050; x=1744925850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xV671OWsZPCz48qmFfXSAWovXOQaZ6EW+7MHCndadN0=;
        b=Esyvcr+cLT5xL7DzSP18Ry8Tn/e75H9kaaYN0+ZJyvULV2AQ0sqPcBQz1WQpeeU8Sq
         Foodk2+gHzoeDMAF1VPTfVvxWPKBfO2sjbhKxCW4A7R06zCg6HR9+Oh1opl3D6bWFiEd
         aEKysxMQKn9mtSZSzodiFXdb5XysTUgelwmq/ihZkfd5WpVwoQ2pUlcJfH+S49Q8XcJr
         A0k1S4qdj0/Q5V5Qcp7fBhBCMlRHFbbSlDytaJ+dJsOW6SGkeUa7X6w1l+jGW2xNLFK6
         TM9hiHw9mKImVYe4CCZpFrCuVGoTxub+s3HVO2VZl8hSEm5r4ogkD25YoDE/wSwcyFlL
         9eIw==
X-Gm-Message-State: AOJu0YzbCgOX068IpA/6TefyPVD8PPDFpVOpYQIhhYwRak+EBnGfFt3j
	Tw8DVYUgu+k1IgBLjtYqtFl3BoKUWkKf+MtpTJpLi6hl9lsRHjK7BET/6BT26t3xuOjP04PxE5v
	kfuk=
X-Gm-Gg: ASbGncsCkmzn/6l1izjfT4S5i89vdrAT4rcPsbn3j4sfj+ihzyEq6NB3Cxu93s4h8F+
	IKaGxWbZ/qEZjS3SjJd0AgL66+C06+0I7Bsjk9iQD6CVehwd4oJh9rjxXwgua4fqrTeasHDuqhK
	dDr+5gDoHZ7WsDAusWOehHwOIEOaMJZ73PoAL+vCXBGHxISSBUQucb2OpobhkDFM1nffYdd8WVz
	g9AUZCzV4Um5AbNjIUwAnTxZ1IInka7gT3h+ExyeHXUnD7dDdbpcJyWCwGybHzO9osHePxozJih
	1H1k5P5FaC4iIbAfhbqilN/Q5rPEzFy8J3REKSlkxMbBjlYVbxufnPbUzYItNznYbvx4SlD7O0C
	EYoefV9wPMaxtvMMgOqm0z1tH
X-Google-Smtp-Source: AGHT+IECMtO23JY0XskOeZwL58XeaLKbykah1JSxnjUgUWHdV33sbRKTKFF0RSZnnD+qP1yrqYe5Mg==
X-Received: by 2002:a05:600c:3baa:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43f3a9b0285mr936615e9.28.1744321050452;
        Thu, 10 Apr 2025 14:37:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/4] Overhaul how Argo is built and packged
Date: Thu, 10 Apr 2025 22:37:22 +0100
Message-Id: <20250410213724.2098383-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
References: <20250410213724.2098383-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, the argo artefacts are a pile of files which the test has to turn
back into something which resembles a filesystem.  Furthermore, because we do
not build modules for the main kernel, it is extra important to make sure that
xen-argo.ko doesn't get out of sync.

Build argo unconditionally as part of the linux artefact.  It's ~100kb all
together, compared to ~14M for the kernel.

Produce a single argo.cpio.gz with xen-argo.ko in the standard location.
Prune userspace down to just the executables and libraries.

This is cribbed from the existing scripts/x86_64-linux-argo.sh, which stays in
place in the short term until Xen can be updated to use the new scheme.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

I tried to make MODPOST work properly, but we don't build enough of it for the
kernel, and I didn't feel like adding an extra 10 mins to the build (all
modules) just to get the metadata right.
---
 .gitlab-ci.yml         |  2 ++
 scripts/build-argo.sh  | 67 ++++++++++++++++++++++++++++++++++++++++++
 scripts/build-linux.sh |  6 +++-
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 scripts/build-argo.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fb997cc62162..790a6d9f9896 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -47,6 +47,8 @@ linux-6.6.56-x86_64:
   script: ./scripts/build-linux.sh
   variables:
     LINUX_VERSION: 6.6.56
+    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
+    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
 
 #
 # The jobs below here are legacy and being phased out.
diff --git a/scripts/build-argo.sh b/scripts/build-argo.sh
new file mode 100644
index 000000000000..0b4005f3b9a0
--- /dev/null
+++ b/scripts/build-argo.sh
@@ -0,0 +1,67 @@
+#
+# This is a partial script, sourced by build-linux.sh
+# It has expectations about the environment
+#
+
+cd "${WORKDIR}"
+
+#
+# We're going to collect everything in argo.cpio.gz.  Construct it under
+# $ARGODIR as we go.
+#
+ARGODIR="${WORKDIR}/argo-root"
+
+git clone https://github.com/OpenXT/linux-xen-argo.git --depth=1
+git -C "${WORKDIR}/linux-xen-argo" fetch origin "${ARGO_SHA}"
+git -C "${WORKDIR}/linux-xen-argo" switch --detach FETCH_HEAD
+
+# Build xen-argo.ko against the target kernel, and install it.  Install
+# linux/argo.h too because userspace needs it.
+make -C "linux-${LINUX_VERSION}" \
+     M="${WORKDIR}/linux-xen-argo/argo-linux" \
+     KBUILD_MODPOST_WARN=1 \
+     CFLAGS_MODULE="-Wno-error" \
+     modules
+install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/xen-argo.ko" \
+     "${ARGODIR}/lib/modules/${LINUX_VERSION}/updates/xen-argo.ko"
+install -D -m644 "${WORKDIR}/linux-xen-argo/argo-linux/include/linux/argo.h" \
+     "${ARGODIR}/usr/include/linux/argo.h"
+
+# Build and install libargo, applying fixes to build in Alpine Linux
+cd "${WORKDIR}/linux-xen-argo/libargo"
+sed -e "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" \
+    -i configure.ac
+sed -e "s/__SOCKADDR_COMMON (sxenargo_)/sa_family_t sxenargo_family/" \
+    -e "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" \
+    -i src/libargo.h
+
+autoreconf --install
+./configure --prefix=/usr CPPFLAGS="-I${PWD}/../argo-linux/include"
+make
+make install DESTDIR="${ARGODIR}"
+
+# Build and install argo-exec, modifying for xilinx argo test
+cd "${WORKDIR}"
+curl -fsSLO \
+    https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/recipes-openxt/argo-exec/argo-exec/argo-exec.c
+sed -e "/#include <xen\/xen.h>/d" \
+    -e "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" \
+    -i argo-exec.c
+
+gcc -I"${ARGODIR}/usr/include" -L"${ARGODIR}/usr/lib/" \
+    argo-exec.c -o "${ARGODIR}/usr/bin/argo-exec" -largo
+
+#
+# Building is now complete.  Strip the devel components and the nointerposer
+# lib, which we don't care to deploy to the test system.
+#
+cd $ARGODIR
+rm -r usr/include usr/lib/pkgconfig
+find usr/lib -name \*nointerposer\* -delete
+find usr/lib \( -name \*.a -o -name \*.so -o -name \*.la \) -delete
+
+# Package everything up
+find . | cpio -R 0:0 -H newc -o | gzip > "$COPYDIR/argo.cpio.gz"
+
+# Print the contents for the build log
+zcat "$COPYDIR/argo.cpio.gz" | cpio -tv
diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 652fdba7b9d1..49b5ebed6424 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -8,7 +8,7 @@ fi
 set -ex -o pipefail
 
 WORKDIR="${PWD}"
-COPYDIR="${WORKDIR}/binaries/"
+COPYDIR="${WORKDIR}/binaries"
 UNAME=$(uname -m)
 
 # Build Linux
@@ -45,6 +45,10 @@ case $UNAME in
     x86_64)
         make -j$(nproc) bzImage
         cp arch/x86/boot/bzImage "${COPYDIR}"
+
+        # Build argo
+        make modules_prepare
+        . "${WORKDIR}/scripts/build-argo.sh"
         ;;
 
     aarch64)
-- 
2.39.5


