Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB6A87D5E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949554.1346073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtx-0005qx-4u; Mon, 14 Apr 2025 10:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949554.1346073; Mon, 14 Apr 2025 10:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Gtx-0005pG-0l; Mon, 14 Apr 2025 10:18:53 +0000
Received: by outflank-mailman (input) for mailman id 949554;
 Mon, 14 Apr 2025 10:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Gtv-0005Nh-OW
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:18:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc23f48b-1919-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 12:18:51 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so3268719f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 03:18:51 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a2f08sm171340495e9.12.2025.04.14.03.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 03:18:49 -0700 (PDT)
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
X-Inumbo-ID: dc23f48b-1919-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744625930; x=1745230730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Banuvmf0avtg5GZqgl/5tNKpXlLxwAiYOanpenznEWY=;
        b=InSDfBjOi0Dp/gZZzOGM3AuiHXcMXiMuPGW11IV2QbKcniYWNYIQ06R4VPQnfg+80i
         xofDR/IbcXN4t9+8DSj2UrJ4KiPRabnHt11zKXPyAXVHJWiAStm3dzTZoat3QgTlZQAD
         KA/aEvPd6Z1ZQet+HUZV6ZN3TdT8gRQltN6DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625930; x=1745230730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Banuvmf0avtg5GZqgl/5tNKpXlLxwAiYOanpenznEWY=;
        b=fJl3lwPBIZD7LDdHy6IhjFD6L2sZ6vzvhMPGazJ+fUllsGJUKF35AbkTqZuqymXQRw
         hp5mb7kKPkdel464gWopNwcOjrNGV1VJns0iWBxA7Zr8z93grWNlnaPpPkCZkv3b6Yxo
         bgFlhAHlK/fSC0H8KDOjGRrgZ8i4SSPCcQjeFYMU1BEb8fR5RgfVisSZ/7GtWJii5xeO
         uf1le4ddAeAptw6xLYbAgzf3E2lsn+dUN7gztbZ7pw6XGJXewSmuJIYa4sPrDOYX+cYE
         OY43jso7pzK3lRSMoxLdhyJknwpyldzmVkDDmAjl0NX3paDMfENPBvvY0jf8pf5zORZQ
         Q1ow==
X-Gm-Message-State: AOJu0Yy21RP+8HGJl4X1lko1cudXTr5pU2bPGaGbuAlD56rsqon+Q7UV
	L5ZWN0IyxhPR+Rz0uC6AyUXioINyvPOSGFeiRzQQ4W43KVlV2wi/HT+sPG5HuFtlwO2FdADQNyT
	OPY0=
X-Gm-Gg: ASbGnctwroIEmmy8WecdKM/7vLHIr6l8AR5KCKL8K4tiPmODhzu+pFAmDUQmsBJBKOv
	0KLFW08CntNh83V+DKQBmQaPKZ7pqaUijiCczWE3dNcDZghRGTl3bm+UEDOkQL89mofOiUJC8c3
	PcsGg0jcjGfDhAa7APVAeGgPGJJYbw/YyksXSo/9lS+ZLVbKltoqdALaMDkvSi+jejV+Z3wAKMZ
	lz3ANSjPPWfD5DNSZp/dE9MMNMxIJtHKXSnG4Fj0kgaP+Lx7KIIMA+qHLaIeoC8PqW0lKRPj30Z
	VLOyIBpT3lhmSjPI1rsU2nDqlMyVlTbeCj9GslT8Rf3UTla5aVb7kKcbSM2orXSFFJew5IGDERc
	uolJT9YQtU5iF/g==
X-Google-Smtp-Source: AGHT+IEmJqI7t0Kh8X8h67YqDiQPbsg7zKhYbL8TN0p5wsbjshqI/5fQpkHN8lGUZSl8wj27xJBFyA==
X-Received: by 2002:a5d:648c:0:b0:39c:2c0b:8db4 with SMTP id ffacd0b85a97d-39d8f275fbamr12192494f8f.10.1744625929963;
        Mon, 14 Apr 2025 03:18:49 -0700 (PDT)
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
Subject: [PATCH v2 2/7] Overhaul how Argo is built and packged
Date: Mon, 14 Apr 2025 11:18:38 +0100
Message-Id: <20250414101843.2348330-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
References: <20250414101843.2348330-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, the argo artefacts are a pile of files which the test has to turn
back into something which resembles a filesystem.  Furthermore, because we do
not build modules for the main kernel, it is extra important to make sure that
xen-argo.ko doesn't get out of sync.

Build argo conditionally as part of the linux artefact.  It's ~100kb all
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

v2:
 * Only build conditionally.  Argo is bust with Linux 6.12, which is needed
   for new hardware runners.
 * Parallel build of xen-argo.ko and libargo.
 * Use -print0

I tried to make MODPOST work properly, but we don't build enough of it for the
kernel, and I didn't feel like adding an extra 10 mins to the build (all
modules) just to get the metadata right.
---
 .gitlab-ci.yml         |  2 ++
 scripts/build-argo.sh  | 67 ++++++++++++++++++++++++++++++++++++++++++
 scripts/build-linux.sh |  8 ++++-
 3 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100755 scripts/build-argo.sh

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
new file mode 100755
index 000000000000..ef7057d847d4
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
+make -j$(nproc) -C "linux-${LINUX_VERSION}" \
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
+make -j$(nproc)
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
+find . -print0 | cpio -0 -R 0:0 -H newc -o | gzip > "$COPYDIR/argo.cpio.gz"
+
+# Print the contents for the build log
+zcat "${COPYDIR}/argo.cpio.gz" | cpio -tv
diff --git a/scripts/build-linux.sh b/scripts/build-linux.sh
index 652fdba7b9d1..441b8721a490 100755
--- a/scripts/build-linux.sh
+++ b/scripts/build-linux.sh
@@ -8,7 +8,7 @@ fi
 set -ex -o pipefail
 
 WORKDIR="${PWD}"
-COPYDIR="${WORKDIR}/binaries/"
+COPYDIR="${WORKDIR}/binaries"
 UNAME=$(uname -m)
 
 # Build Linux
@@ -45,6 +45,12 @@ case $UNAME in
     x86_64)
         make -j$(nproc) bzImage
         cp arch/x86/boot/bzImage "${COPYDIR}"
+
+        # Build argo if requested
+        if [[ -n "${ARGO_SHA}" ]]; then
+            make modules_prepare
+            . "${WORKDIR}/scripts/build-argo.sh"
+        fi
         ;;
 
     aarch64)
-- 
2.39.5


