Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC98146A4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 12:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655033.1022705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6Da-0002rH-CM; Fri, 15 Dec 2023 11:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655033.1022705; Fri, 15 Dec 2023 11:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE6Da-0002lu-7u; Fri, 15 Dec 2023 11:18:58 +0000
Received: by outflank-mailman (input) for mailman id 655033;
 Fri, 15 Dec 2023 11:18:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE6DZ-00024C-0m
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 11:18:57 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc62f88d-9b3b-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 12:18:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c38e292c8so2717515e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 03:18:56 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 y12-20020a5d614c000000b0033643505580sm5386737wrt.92.2023.12.15.03.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 03:18:54 -0800 (PST)
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
X-Inumbo-ID: bc62f88d-9b3b-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702639135; x=1703243935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZlPTOk9/t1OmWoVhIbxLZaJgIzAgwV+V3DWNDNFJhM=;
        b=f3BLzzv5ZsU/UZqlYbkCDjgpO7r3L5wQQtBjDqhDuJs8Y6ujcceFYbAQSvhTYFGR2l
         55VuGviFlAYAesWWedS/rWzi9Zt1ceNfj/GQVQkh0aBLj8ZsUpGSMGi5uyT/K1tQPd05
         uNn8h+vcot3p9cQtwV/l8M9QIcLZnSjucIugc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639135; x=1703243935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZlPTOk9/t1OmWoVhIbxLZaJgIzAgwV+V3DWNDNFJhM=;
        b=Z5MMlEJX8HUlQyQbwdNXUtf7W41sw1+TP9+GpuIfPCtUC687+H34p/iHvh6vufjUo7
         hUEujAKOxnKpAD1Kwtc7miYlEMKOlIsYGJ6dQEMLQ01wkBNVHauvFFQI0jSTrEdQZhLp
         Vyysb6NfNuo2d/0Q7b1gQt6qfSbbMV4STcHfbX4yI7wo8XucwDSqdoti8i3iARKpwlej
         tGzqsEUWl9/eSf6Lpz5NVYRu8b7xuZr9CRn6t7vUQ/ad3KF86CGvCa4MEeTR87wrgFiw
         pzB56KfE3PWJYM73dtV3xy3QcsWI826hj+14tIKDPgCUbOGNdLzswhwzWZ3VgVeQGV4c
         Ee3w==
X-Gm-Message-State: AOJu0Yzg8pLAxGWmDRqOsnZDWZsjdbLnIZsfeHqlf7PwSgyM5MC1AmvX
	l+upMLZ7ncsVCcBO6BCa+gNxWKTYscZeDKE85XM=
X-Google-Smtp-Source: AGHT+IHQcoXi5iRHcJl9BtkyYNoOiiLzn01aWEKXAHCv8Vq7W5AiqIeHGveqt0nuPd3l7VKX8C1RcA==
X-Received: by 2002:a05:600c:54e4:b0:40b:5e56:7b48 with SMTP id jb4-20020a05600c54e400b0040b5e567b48mr5458792wmb.145.1702639135024;
        Fri, 15 Dec 2023 03:18:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/4] automation: add x86-64 livepatching test
Date: Fri, 15 Dec 2023 12:18:42 +0100
Message-ID: <20231215111842.8009-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215111842.8009-1-roger.pau@citrix.com>
References: <20231215111842.8009-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a new gitlab tests for livepatching, using livepatch-build-tools,
which better reflects how downstreams build live patches rather than the
in-tree tests.

The tests applies the dummy in-tree patch example, checks that the patch is
applied correctly and then reverts and unloads it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


