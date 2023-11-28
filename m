Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41A7FB6A0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 11:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642879.1002697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwv-0003nl-6Z; Tue, 28 Nov 2023 10:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642879.1002697; Tue, 28 Nov 2023 10:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7uwv-0003k6-2m; Tue, 28 Nov 2023 10:04:13 +0000
Received: by outflank-mailman (input) for mailman id 642879;
 Tue, 28 Nov 2023 10:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7uwt-0001sW-70
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 10:04:11 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 789cfc28-8dd5-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 11:04:08 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so3556602f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 02:04:09 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfea04000000b003296b488961sm14424366wrm.31.2023.11.28.02.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 02:04:08 -0800 (PST)
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
X-Inumbo-ID: 789cfc28-8dd5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701165849; x=1701770649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnuz0Skbms73/IaPgLyxoHfzJBbgmoe2G5CAGghY1zE=;
        b=EvyUOAyWFfQeUKqPPAvz7cGbCtL7Kd8tNXqur5RZOegb6soTcpJAQR86EIltYITbig
         udhtyWbMjKz5Z4vJfeE2G/OF2H/K9bYP3B3B35W+Hinh56BJHyIkEErScWA5r0gSwzpQ
         sAtgXrA5TttkKYcb3SKfCnaXbxqfUyUWf1vxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165849; x=1701770649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnuz0Skbms73/IaPgLyxoHfzJBbgmoe2G5CAGghY1zE=;
        b=iRfMOFVFKsZ3FGDJIRBul5ZgsVvsNbOrmOF+789uerC4V37ut9wppImas6svZcY1zc
         sRsS+NHg6OWkjPXLp2IaQDPA7Gp305Dd6rgFKa+jLc1j1rmBOB8qKaMKpkwGLLPam+/V
         YIWVJ3+tZjtl4qxSzg+kz1emaLi3SxzbFq5AZFRSqqtcXdM1YI/ctpyD9o5oEVD1rAyi
         2Lwynr/yPIKCTaVS1ndSQhX/WEZhbF+8AjeDMzLzU8rfU5/j0guWuHOzvyJzK/QFlkbJ
         QWsnT6LRgJaM/5DKiiKzxrMnnjk6uuHIVTlr1rKv7XB01FQzc4JX6uWYURNr0TQuX6So
         0UYw==
X-Gm-Message-State: AOJu0YxbkNV5hfCX7uoWmjU1MUltjGk0ETC0AjTtq8X5Nlzg3Bf1Ktni
	yL0Xa/QT2ChbotasjVGuy5JY1MkuMJj+Yr60Bbc=
X-Google-Smtp-Source: AGHT+IHueuC4uSA1qK/jZqwfC/DCqs0QYWMuzHDFCxW3pLiIfFHCUM1C9WKXGeqKkljXCWPSFTQk1w==
X-Received: by 2002:a5d:6a42:0:b0:332:c585:400a with SMTP id t2-20020a5d6a42000000b00332c585400amr10615660wrw.44.1701165848859;
        Tue, 28 Nov 2023 02:04:08 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 5/5] automation: add x86-64 livepatching test
Date: Tue, 28 Nov 2023 11:03:52 +0100
Message-ID: <20231128100352.35430-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231128100352.35430-1-roger.pau@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
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
 automation/gitlab-ci/build.yaml               |  8 +++
 automation/gitlab-ci/test.yaml                |  8 +++
 automation/scripts/build                      | 21 ++++++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 68 +++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100755 automation/scripts/qemu-alpine-x86_64-livepatch.sh

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30ccedc9..22026df51b87 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -358,6 +358,14 @@ alpine-3.18-gcc-debug:
   variables:
     CONTAINER: alpine:3.18
 
+alpine-3.18-gcc-livepatch:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: alpine:3.18
+    LIVEPATCH: y
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
diff --git a/automation/scripts/build b/automation/scripts/build
index b3c71fb6fb60..0a0a6dceb08c 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -103,3 +103,24 @@ else
     cp -r dist binaries/
     if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
 fi
+
+if [[ "$LIVEPATCH" == "y" ]]; then
+    # Build a test livepatch using livepatch-build-tools.
+
+    if [[ "$XEN_TARGET_ARCH" != "x86_64" ]]; then
+        exit 1
+    fi
+
+    # git diff --no-index returns 0 if no differences, otherwise 1.
+    git diff --no-index --output=test.patch xen/arch/x86/test-smc-lp.c \
+                                            xen/arch/x86/test-smc-lp-alt.c && exit 1
+
+    BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
+
+    git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
+    cd livepatch-build-tools
+    make
+    ./livepatch-build -s ../ -p ../test.patch -o out -c ../xen/.config \
+        --depends $BUILDID --xen-depends $BUILDID
+    cp out/test.livepatch ../binaries/test.livepatch
+fi
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


