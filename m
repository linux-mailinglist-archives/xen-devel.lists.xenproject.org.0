Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14277F5DBC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639619.997179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oI-0001aP-GU; Thu, 23 Nov 2023 11:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639619.997179; Thu, 23 Nov 2023 11:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67oI-0001V4-BA; Thu, 23 Nov 2023 11:23:54 +0000
Received: by outflank-mailman (input) for mailman id 639619;
 Thu, 23 Nov 2023 11:23:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r67oG-000197-Uw
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:23:52 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c77d390d-89f2-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 12:23:51 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32f737deedfso415805f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 03:23:51 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f6-20020adfc986000000b0032d829e10c0sm1381164wrh.28.2023.11.23.03.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 03:23:50 -0800 (PST)
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
X-Inumbo-ID: c77d390d-89f2-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700738631; x=1701343431; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLtx0ZHwxub7aYGGcUOFcd7W8DhSc9jxNrdpqnW0014=;
        b=YYtCi7hz0mHzHR0iLMcYiCwWvhe/mjIjNYY5cYdS7rowKTED8btPPpH8CGEPoj3f+o
         adbCDjgNbc5PIlEJIDRD+n4V1l6I6oTt5qJ0cCO59vtiCDLButFzJVqvImhe1dCKzFEW
         cQc3LXcBkUX8yDRcJQ+gKabjWTgn8Qvhuzzz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700738631; x=1701343431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLtx0ZHwxub7aYGGcUOFcd7W8DhSc9jxNrdpqnW0014=;
        b=SEgVhYx5/F3g+GE8b+B0xq8FscY8NpAxWuvTUpmcMT36QRgTVnf1eQIm0CJ5MsMsB8
         wzLKU6b9j3FrNrPTUmwmrb28GnOa8yYtPA0Z4zEOY3UJyA+ZMVOF6tZQzF8I/GoZuDl9
         3DfnDAic+bn6R4+lOB1J4bm364ucelDof+IdWewttRmsrneuuQLDrHOjbX5qbQfre9oO
         H57fmNohdRzjCHkbrUt8eAB/0abN0ews9EKWNxb5C6buDzAbsPG7/3mAPeUw+mTA/foW
         R+u4RL7FalciKn/0FOItKgHOtQFFb/Pp44xQn7MMGyzFtMLdaNoDgQUYsP+tN3cYUwoS
         wRQg==
X-Gm-Message-State: AOJu0YyTdCb9AjIgsVXTBkLUwsUznM6q3Np6OATA2EwHgNMViS9mPxSB
	exdgw6Wq+Bh3+u+ZESue2tUgasw7qMkh/bqgQ54=
X-Google-Smtp-Source: AGHT+IFTR9Y8VTBtZ4QDarawvzfpL5UEA4L3ZvECk1rwwNNM7ZbT9gStWQkkRtg7I7inMcGK8Z8I+w==
X-Received: by 2002:a5d:5609:0:b0:32f:b407:5b77 with SMTP id l9-20020a5d5609000000b0032fb4075b77mr2235018wrv.64.1700738631053;
        Thu, 23 Nov 2023 03:23:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] automation: add x86-64 livepatching test
Date: Thu, 23 Nov 2023 12:23:38 +0100
Message-ID: <20231123112338.14477-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123112338.14477-1-roger.pau@citrix.com>
References: <20231123112338.14477-1-roger.pau@citrix.com>
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
 automation/gitlab-ci/build.yaml               |  8 ++
 automation/gitlab-ci/test.yaml                |  8 ++
 automation/scripts/build                      | 13 +++
 .../scripts/qemu-alpine-x86_64-livepatch.sh   | 79 +++++++++++++++++++
 4 files changed, 108 insertions(+)
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
index b3c71fb6fb60..7ae735fc193e 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -103,3 +103,16 @@ else
     cp -r dist binaries/
     if [[ -f xen/xen ]] ; then cp xen/xen binaries/xen; fi
 fi
+
+if [[ "$LIVEPATCH" == "y" ]]; then
+    # Build a test livepatch using livepatch-build-tools.
+
+    BUILDID=$(readelf -Wn xen/xen-syms | sed -n -e 's/^.*Build ID: //p')
+
+    git clone https://xenbits.xen.org/git-http/livepatch-build-tools.git
+    cd livepatch-build-tools
+    make
+    ./livepatch-build -s ../ -p ../xen/test/livepatch/patches/test1.patch \
+        -o out -c ../xen/.config --depends $BUILDID --xen-depends $BUILDID
+    cp out/test1.livepatch ../binaries/test1.livepatch
+fi
diff --git a/automation/scripts/qemu-alpine-x86_64-livepatch.sh b/automation/scripts/qemu-alpine-x86_64-livepatch.sh
new file mode 100755
index 000000000000..9b27a01b07f0
--- /dev/null
+++ b/automation/scripts/qemu-alpine-x86_64-livepatch.sh
@@ -0,0 +1,79 @@
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
+cp ../test1.livepatch ./root/
+cat << "EOF" >> etc/local.d/xen.start
+#!/bin/bash
+
+set -ex
+
+trap poweroff EXIT
+
+export LD_LIBRARY_PATH=/usr/local/lib
+
+result=`xen-livepatch test`
+if [ "$result" != "1" ]; then
+    echo "FAIL"
+    exit 1
+fi
+
+xen-livepatch load /root/test1.livepatch
+
+result=`xen-livepatch test`
+if [ "$result" != "2" ]; then
+    echo "FAIL"
+    exit 1
+fi
+
+xen-livepatch revert test1
+xen-livepatch unload test1
+
+result=`xen-livepatch test`
+if [ "$result" != "1" ]; then
+    echo "FAIL"
+    exit 1
+fi
+
+echo "SUCCESS"
+EOF
+chmod +x etc/local.d/xen.start
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


