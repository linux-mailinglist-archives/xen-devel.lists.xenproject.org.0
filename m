Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86034AB1F60
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 23:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980391.1366853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVcv-0004Cm-Tq; Fri, 09 May 2025 21:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980391.1366853; Fri, 09 May 2025 21:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDVcv-0004AC-Qh; Fri, 09 May 2025 21:51:29 +0000
Received: by outflank-mailman (input) for mailman id 980391;
 Fri, 09 May 2025 21:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDVct-0004A0-IL
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 21:51:27 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c17bd3b3-2d1f-11f0-9eb5-5ba50f476ded;
 Fri, 09 May 2025 23:51:26 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so18553275e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 14:51:26 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm4386885f8f.86.2025.05.09.14.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 14:51:25 -0700 (PDT)
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
X-Inumbo-ID: c17bd3b3-2d1f-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746827485; x=1747432285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puyW2vkhTBPYGEa87nOJrRiLle3OdvNnxy1k/upDuFI=;
        b=qO6BsFgxOjvOOyUulKUIxdPEpleYpX7lpzvLVnlCj/ZPDsUCCEORpoXS/foSMtnbjH
         okIMbvsbAyieKsxErvbKD69pHVPMsCGybkTM/FcyEzCiJhF8iyrEivnS+6LW5I9EOqbv
         IrLUa0Xn6MGgx6qwgWBxuO1PyIskahf+Fhl3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746827485; x=1747432285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puyW2vkhTBPYGEa87nOJrRiLle3OdvNnxy1k/upDuFI=;
        b=HrOVPr+RpHBL5dVY9V4yn6nVBV07UEDma+Yvwdj9xhNM1grMNiP+vDCbAg6tZjSFVL
         irs5b7yZnbl+aYkyIv3iQSr36Q9Gxkr2KwelqNHbvbHGzP7e4HIvd3jWNh/+nCmXL+Af
         g8yhuXuRPgUl+heLXZGJ/9iVSveddqoSkWDgNrAerILH8onmgwyqemVUEwXL2VR4dQ4k
         KGqEMcg/OgoYPSeTx97LMcg2mUWa1di+UfE5Cdr4A99rKQ9bY8SB7OeYO3hPghXRN2G5
         5+ahsjthXYKPPrMImIdPYUUVKxv8w82n3HyG1EaheepfPrsIM+CV2vVo4uFo3C11KRrQ
         Xngg==
X-Gm-Message-State: AOJu0YzgkY1fTjswdKJCNiUkEPVCkpKXYVmlyNyLTSK8U2QUm7jnPP3Z
	k3o5otzjHz++SdmPIFKuyFqX6XPms5xwZovb+xTLVbqJMrZXKz8wejHlCid5q+k+ZWybiUIza8A
	U
X-Gm-Gg: ASbGncuh1Z9BHK5fo3eAJRu16xiD87hmVQnCzdA7FMBbKR5X/reQkdk11EzqJi+HLJ3
	wLDltmp/WdMs2rVeOLEpDxcTkEkO16CRpqm/HF02wd8ySh0ICdc5wEABsaepaiHWL4VlZkO6+Tv
	6+bn5i4Vz9lRczlRAA1rj/VhBizC3DvE1dcX7mX7ewrZyX6GNFRB65KtT283pYrz02zPefzzDx9
	ALHLh3/uht2HMDUHs64guJlWxrju/5M2c2RVon8Ckoeq8/rbpiHThOSbdE/i6wDnI8D/LoOryVR
	WusuKK9j2uIY5/ZsNludGaWmCoSrA8ZlBOfNISFVkcZdE6tA/MAxWnpHORRaPWYCtkIQ77x/UgF
	MO3IVycz1MOlAKV3Qv76kUUx1ROpoytJ8QmU=
X-Google-Smtp-Source: AGHT+IHSbScHGB5tXvZEV6VUDzOsA9Fjb7Cc9PWIahWMLacRESeyabumfm3cTQPt6cX16xV6iEVR2Q==
X-Received: by 2002:a05:600c:510b:b0:442:e03b:58a9 with SMTP id 5b1f17b1804b1-442e03b59aamr578235e9.25.1746827485492;
        Fri, 09 May 2025 14:51:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH TEST-ARTEFACTS] Drop legacy jobs
Date: Fri,  9 May 2025 22:51:23 +0100
Message-Id: <20250509215123.2953401-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CI improvements have been backported to all Xen branches.

Remove the transitionary tar/cpio parameter in scripts/alpine-rootfs.sh

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 .gitlab-ci.yml               | 27 +---------------
 scripts/alpine-rootfs.sh     | 23 ++++---------
 scripts/x86_64-argo-linux.sh | 63 ------------------------------------
 3 files changed, 8 insertions(+), 105 deletions(-)
 delete mode 100755 scripts/x86_64-argo-linux.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index dcf76db6ec62..2e1aad800b95 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -52,7 +52,7 @@ linux-6.6.86-arm64:
 alpine-3.18-x86_64-rootfs:
   extends: .x86_64-artifacts
   script:
-    - ./scripts/alpine-rootfs.sh cpio
+    - ./scripts/alpine-rootfs.sh
   variables:
     CONTAINER: alpine:3.18-x86_64-base
 
@@ -67,28 +67,3 @@ linux-6.6.56-x86_64:
 microcode-x86:
   extends: .x86_64-artifacts
   script: ./scripts/x86-microcode.sh
-
-#
-# The jobs below here are legacy and being phased out.
-#
-x86_64-kernel-linux-6.6.56:
-  extends: .x86_64-artifacts
-  script: ./scripts/build-linux.sh
-  variables:
-    LINUX_VERSION: 6.6.56
-
-x86_64-rootfs-alpine-3.18:
-  extends: .x86_64-artifacts
-  script:
-    - ./scripts/alpine-rootfs.sh tar
-  variables:
-    CONTAINER: alpine:3.18-x86_64-base
-
-x86_64-argo-linux-6.6.56:
-  extends: .x86_64-artifacts
-  script:
-    - . scripts/x86_64-argo-linux.sh
-  variables:
-    LINUX_VERSION: 6.6.56
-    ARGO_SHA: "705a7a8a624b42e13e655d3042059b8a85cdf6a3"
-    ARGOEXEC_SHA: "d900429f6640acc6f68a3d3a4c945d7da60625d8"
diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
index 13d39e8846e7..c304e2ebfbd9 100755
--- a/scripts/alpine-rootfs.sh
+++ b/scripts/alpine-rootfs.sh
@@ -77,20 +77,11 @@ passwd -d "root" root
 
 # Create rootfs
 cd /
-case $1 in
-    cpio)
-        {
-            PATHS="bin etc home init lib mnt opt root sbin srv usr var"
-            find $PATHS -print0
-            echo -ne "dev\0proc\0run\0sys\0"
-        } | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
+{
+    PATHS="bin etc home init lib mnt opt root sbin srv usr var"
+    find $PATHS -print0
+    echo -ne "dev\0proc\0run\0sys\0"
+} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"
 
-        # Print the contents for the build log
-        zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
-        ;;
-
-    tar)
-        PATHS="bin dev etc home init lib mnt opt root sbin usr var"
-        tar cvzf "${COPYDIR}/initrd.tar.gz" $PATHS
-        ;;
-esac
+# Print the contents for the build log
+zcat "${COPYDIR}/rootfs.cpio.gz" | cpio -tv
diff --git a/scripts/x86_64-argo-linux.sh b/scripts/x86_64-argo-linux.sh
deleted file mode 100755
index a110a3378192..000000000000
--- a/scripts/x86_64-argo-linux.sh
+++ /dev/null
@@ -1,63 +0,0 @@
-#!/usr/bin/env bash
-
-if test -z "${LINUX_VERSION}"
-then
-    >&2 echo "LINUX_VERSION must be set"; exit 1
-fi
-
-set -ex -o pipefail
-
-BUILDDIR="${PWD}"
-COPYDIR="${BUILDDIR}/binaries/"
-
-# Prepare Linux sources
-curl -fsSLO \
-    https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"${LINUX_VERSION}".tar.xz
-tar xJf linux-"${LINUX_VERSION}".tar.xz
-cd linux-"${LINUX_VERSION}"
-make ARCH=x86 defconfig
-make ARCH=x86 xen.config
-./scripts/config --enable BRIDGE
-./scripts/config --enable IGC
-./scripts/config --enable TUN
-cp .config .config.orig
-cat .config.orig \
-    | grep 'XEN' \
-    | grep '=m' \
-    | sed 's/=m/=y/g' \
-    >> .config
-make ARCH=x86 olddefconfig
-make ARCH=x86 modules_prepare
-
-# Build Linux kernel module for Xen Argo
-cd "${BUILDDIR}"
-git clone \
-    --depth=1 --branch=master \
-    https://github.com/OpenXT/linux-xen-argo.git
-git -C "${BUILDDIR}/linux-xen-argo" switch --detach "${ARGO_SHA}"
-make -C "linux-${LINUX_VERSION}" M="${BUILDDIR}/linux-xen-argo/argo-linux" \
-    CFLAGS_MODULE="-Wno-error" KBUILD_MODPOST_WARN=1
-cp "linux-xen-argo/argo-linux/xen-argo.ko" "${COPYDIR}/xen-argo.ko"
-
-# Build Linux libargo shared library, applying fixes to build in Alpine Linux
-cd "${BUILDDIR}/linux-xen-argo/libargo"
-sed -i "s|AM_INIT_AUTOMAKE|AC_CONFIG_AUX_DIR(.)\nAM_INIT_AUTOMAKE|" configure.ac
-sed -i "s/__SOCKADDR_COMMON (sxenargo_)/sa_family_t sxenargo_family/" src/libargo.h
-sed -i "s/__SOCKADDR_COMMON_SIZE/(sizeof (unsigned short int))/" src/libargo.h
-autoreconf --install
-./configure --prefix="${COPYDIR}" CPPFLAGS="-I${PWD}/../argo-linux/include"
-make
-make install
-
-# Build Linux user program, modifying for xilinx argo test
-cd "${BUILDDIR}"
-wget "https://raw.githubusercontent.com/OpenXT/xenclient-oe/${ARGOEXEC_SHA}/\
-recipes-openxt/argo-exec/argo-exec/argo-exec.c"
-sed -i "s|#include <xen/xen.h>||" argo-exec.c
-sed -i "s|ret = shuffle(s, fds\[0\], fds\[1\]);|ret = shuffle(s, 0, 1);|" \
-    argo-exec.c
-gcc -I"${BUILDDIR}/linux-xen-argo/libargo/src" \
-    -I"${BUILDDIR}/linux-xen-argo/argo-linux/include" \
-    -L"${COPYDIR}/lib/" \
-    -o argo-exec argo-exec.c -largo
-cp argo-exec "${COPYDIR}"

base-commit: 683a1f67a82e8ea151c818d74a50522ca2e67236
-- 
2.39.5


