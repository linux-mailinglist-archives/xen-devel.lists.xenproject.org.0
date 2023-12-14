Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87371812CBE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654404.1021324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimr-0007Gx-FU; Thu, 14 Dec 2023 10:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654404.1021324; Thu, 14 Dec 2023 10:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDimr-0007FC-Ar; Thu, 14 Dec 2023 10:17:49 +0000
Received: by outflank-mailman (input) for mailman id 654404;
 Thu, 14 Dec 2023 10:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5bz=HZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rDimp-0006DQ-Dy
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:17:47 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062cf64c-9a6a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 11:17:45 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so2429645e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:17:45 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b0040b48690c49sm24179651wms.6.2023.12.14.02.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 02:17:44 -0800 (PST)
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
X-Inumbo-ID: 062cf64c-9a6a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702549064; x=1703153864; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhWfcBNxu2blCdsb5H8j6/TvKkbd8xdFJdTYrKG7mJg=;
        b=wbonGj0Kwk8uGuZs5Df6z/JKDA4ljr22cnEQoMVtufA+ApFOkmguKdQ9jNMADydugH
         PJSloC33xFi4p/PqrC3p3hCmaXXp0UEf5qv1W/Bmc6DT8al8eaq+YRswlf1aAlWzofjt
         u82pmecob7/9WsAGY+PDkczsurz2WQl1puSVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702549064; x=1703153864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhWfcBNxu2blCdsb5H8j6/TvKkbd8xdFJdTYrKG7mJg=;
        b=ARjpeD1qSg8YxiHI8kvM7uh9vb8Og9SStoTgxLoVHKqxIWcDbDDVAcaINvQMdT0Sk6
         cCVShmjABJkiJKiJi+qJd0aOvcgWGFz/EY8LAbfm/+1L76GEWyP3ElKXBvYCrb1IKGtE
         2jzFpyl+s/82OElxWPGIkhiczUryDpDPjL8opmDFt47qDhJOK6pjHcGUSWcXUh669mwd
         K+dcr0Mks2lZjl64DUkfUZ9CrxoMq4MxRjzK6ZhKR4mgC88yKaLa28WsvPZj1Vc2xy6m
         fiwtB2Xs6XXIdKIH7wYbQlh2yslWKG8PzSMsoSO03yUl3rcHh9YCFGxoN+/iZ22p04Pb
         rHdg==
X-Gm-Message-State: AOJu0YyN1ZEVehztzAXLCsRLjATDnx7s6sgVmKLYD3ttNvFLPLU8v9QI
	7paJWKJTxyiTSVCzlfoRStDQEsGmsQjOGbaZs/E=
X-Google-Smtp-Source: AGHT+IEc3PMulJYY6bnUPnHgqHCAJ8klvXR3bgb3dZiWTdxk4PHeDJW2ocvrQ8nVeSVg2y6jHgGuqw==
X-Received: by 2002:a05:600c:3b99:b0:40b:5e26:237b with SMTP id n25-20020a05600c3b9900b0040b5e26237bmr4736968wms.44.1702549064581;
        Thu, 14 Dec 2023 02:17:44 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/4] automation: add x86-64 livepatching test
Date: Thu, 14 Dec 2023 11:17:19 +0100
Message-ID: <20231214101719.18770-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101719.18770-1-roger.pau@citrix.com>
References: <20231214101719.18770-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a new gitlab tests for livepatching, using livepatch-build-tools,
which better reflects how downstreams build live patches rather than the
in-tree tests.

The tests applies the dummy in-tree patch example, checks that the patch is
applied correctly and then reverts and unloads it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Split livepatch build into a separate script.
---
 automation/gitlab-ci/build.yaml               |  9 +++
 automation/gitlab-ci/test.yaml                |  8 +++
 automation/scripts/build-livepatch            | 27 ++++++++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 +++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100755 automation/scripts/build-livepatch
 create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30ccedc9..d770bffb845e 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -358,6 +358,15 @@ alpine-3.18-gcc-debug:
   variables:
     CONTAINER: alpine:3.18
 
+alpine-3.18-gcc-livepatch:
+  extends: .gcc-x86-64-build
+  script:
+    - ./automation/scripts/build-livepatch 2>&1 | tee build.log
+  variables:
+    CONTAINER: alpine:3.18
+    EXTRA_XEN_CONFIG: |
+      CONFIG_LIVEPATCH=y
+
 debian-stretch-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 6aabdb9d156f..58a90be5ed0e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -459,3 +459,11 @@ qemu-smoke-ppc64le-powernv9-gcc:
   needs:
     - qemu-system-ppc64-8.1.0-ppc64-export
     - debian-bullseye-gcc-ppc64le-debug
+
+qemu-alpine-x86_64-gcc-livepatch:
+  extends: .qemu-x86-64
+  script:
+    - ./automation/scripts/qemu-alpine-x86_64-livepatch.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86-64-test-needs
+    - alpine-3.18-gcc-livepatch
diff --git a/automation/scripts/build-livepatch b/automation/scripts/build-livepatch
new file mode 100755
index 000000000000..ac86b17ae5e4
--- /dev/null
+++ b/automation/scripts/build-livepatch
@@ -0,0 +1,27 @@
+#!/bin/bash -ex
+
+# Do a regular build first
+./automation/scripts/build
+
+# Build a test livepatch using livepatch-build-tools.
+
+if [[ "$XEN_TARGET_ARCH" != "x86_64" ]]; then
+    exit 1
+fi
+
+BASE=xen/arch/x86/test/smoc-lp.c
+ALT=xen/arch/x86/test/smoc-lp-alt.c
+
+[[ -f $BASE && -f $ALT ]]
+
+# git diff --no-index returns 0 if no differences, otherwise 1.
+git diff --no-index --output=test.patch $BASE $ALT && exit 1
+
+BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
+
+git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
+cd livepatch-build-tools
+make
+./livepatch-build -s ../ -p ../test.patch -o out -c ../xen/.config \
+    --depends $BUILDID --xen-depends $BUILDID
+cp out/test.livepatch ../binaries/test.livepatch
diff --git a/automation/scripts/qemu-alpine-x86_64-livepatch.sh b/automation/scripts/qemu-alpine-x86_64-livepatch.sh
new file mode 100755
index 000000000000..da478cac4376
--- /dev/null
+++ b/automation/scripts/qemu-alpine-x86_64-livepatch.sh
@@ -0,0 +1,68 @@
+#!/bin/bash
+
+set -ex
+
+cd binaries
+# initrd.tar.gz is Dom0 rootfs
+mkdir -p rootfs
+cd rootfs
+tar xvzf ../initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../dist/install/* .
+cp ../test.livepatch ./root/
+cat << "EOF" >> etc/local.d/xen-lp.start
+#!/bin/bash
+
+set -ex
+
+trap poweroff EXIT
+
+export LD_LIBRARY_PATH=/usr/local/lib
+
+xen-livepatch test && exit 1 || true
+
+xen-livepatch load /root/test.livepatch
+
+# Cannot fail now
+xen-livepatch test
+
+xen-livepatch revert test
+xen-livepatch unload test
+
+xen-livepatch test && exit 1 || true
+
+echo "SUCCESS"
+EOF
+chmod +x etc/local.d/xen-lp.start
+echo "rc_verbose=yes" >> etc/rc.conf
+# rebuild Dom0 rootfs
+find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
+cd ../..
+
+cat >> binaries/pxelinux.0 << EOF
+#!ipxe
+
+kernel xen console=com1 console_timestamps=boot
+module bzImage console=hvc0
+module xen-rootfs.cpio.gz
+boot
+EOF
+
+# Run the test
+rm -f smoke.serial
+timeout -k 1 360 \
+qemu-system-x86_64 \
+    -cpu qemu64,+svm \
+    -m 2G -smp 2 \
+    -monitor none -serial stdio \
+    -nographic \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
+        tee smoke.serial | sed 's/\r//'
+
+grep -q "SUCCESS" smoke.serial
+exit 0
-- 
2.43.0


