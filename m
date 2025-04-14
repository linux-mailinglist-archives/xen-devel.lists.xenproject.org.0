Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B997AA87E7E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949712.1346195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgc-0000Yb-Pi; Mon, 14 Apr 2025 11:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949712.1346195; Mon, 14 Apr 2025 11:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgc-0000S2-LZ; Mon, 14 Apr 2025 11:09:10 +0000
Received: by outflank-mailman (input) for mailman id 949712;
 Mon, 14 Apr 2025 11:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hgb-0000MU-DQ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e31b2929-1920-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:09:09 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso2479598f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:08 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:06 -0700 (PDT)
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
X-Inumbo-ID: e31b2929-1920-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628948; x=1745233748; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcs0mTf05pW6RsmqLWTa0rpSF3biapjjXDW/JQKGWb0=;
        b=SVPckvHlozuZ/+7j/W06TA5YvWS8qtW4XpxFkTGZvU5fxfa/ArP7hxuonGF3gMP0vP
         byZwyJxI4WApi8zfJNB2Q5SktHSE6eo8JmDNIHMYqmPUUu6P78iMFf8c1ZSsFAe3j+em
         k8qZbaVRDFjL6azg4hHMxy98mZC5UCNqBpmqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628948; x=1745233748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcs0mTf05pW6RsmqLWTa0rpSF3biapjjXDW/JQKGWb0=;
        b=uzM+0Mm6B2Am0Rmmg1p5bGPzCmB68Jxr7v5RxL6fTzWdQ627We81s8XHnWlNEZO8D/
         udt8zpC5wrnaJJJQzbhsCY1RcZ+5bLTfK7NLgaw81axaviHOI3Q3BXhO1+AnT2Lt0AU3
         v3S2Y4fnEgm6dQQqLAMpXwCuIX9m8WvgYlmaQbzDXkfoOdxrqwuAS/iO/kqAW9q3cwp4
         jf1im3cY82q7LbdyVy6i8MlDRjfilO/dkkyDBFUAWtlCxowiP/GlWPQGv3ghQ/fIxBs2
         jq5qpE8ARGCwtMcN7Uqk6bHqcmuh5OihquJBVZxMVkslyva4kK0XZJ5Ryc/qEYr3fKAJ
         CU8w==
X-Gm-Message-State: AOJu0YyGznQwRyh3mzYUJwcytIu5ukbBARWCT/lxZeq3X7q8nBVT5xSl
	ca+AWHbkJsmJEF2CPtDcBIThXrS+T+lxRv1ftTQdm2a+B2y/xKOJE9sZ/G9AFUfUwYw3gGDwWqq
	lKjU=
X-Gm-Gg: ASbGncucxAGTHm41UkQQpURQ/JE/9m5T3oHShQQX49nQqPOpv0nk3sUY3XWQ2H+PJCT
	fShsDZhxkSXJQYfprfgsNvAiR66a6QmhqurDz8QQKeGRGPYaLuvE40RoPHB3zGIEa1YI6mMcNdE
	IWwPEQjTlM/nEE9Dks2pdvm494UhX5ijw3O2TEE776bXDdSfzoR96+7jQc7SZ/Jii8ljnsgza6m
	LBqCRTo4Hdwk3x7RgLojBRmG2vrPJ9/KneW1rKFY8SvzJoi61XYDVoTgya5kVR9tLOqHMXbdMs3
	h5b8fQsdlMAZ64xQt+7Zs7mCcOu7zgMK1BLxam73BYI61zbpKLDMLObIveYcKQzkx2GxiMwcIX8
	H+D44MbqrK+gLMQ==
X-Google-Smtp-Source: AGHT+IHtaAmj4fRrSlvKNznngr25ISRl0Roii0RJOq2qhjEzvgcD98P9wOdKRiTnBj/DSjmDt9NCcw==
X-Received: by 2002:a5d:584f:0:b0:39c:1257:c7a2 with SMTP id ffacd0b85a97d-39eaaecae92mr9048984f8f.58.1744628948004;
        Mon, 14 Apr 2025 04:09:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 2/6] CI: avoid repacking initrd as part of the test job
Date: Mon, 14 Apr 2025 12:08:59 +0100
Message-Id: <20250414110903.2355303-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Use the new test-artifacts which provide rootfs.cpio.gz rather than
initrd.tar.gz.  rootfs.cpio.gz also has all the necessary top-level
directories, and includes the rc_verbose setting, so these modifications can
be dropped.

Having that, do not repack the whole initrd, but only pack modified
files and rely on Linux handling of concatenated archives.
This allows packing just test-related files (which includes the whole
toolstack), instead of the whole initrd.

For xilinx-smoke-dom0-x86_64.sh, this involves instructing grub not to unzip
the archive, as doing so corrupts it.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v3:
 * Tested (bugfixed) on xilinx-* runners
 * Rearrange logic so the order of concantination is clearer (relevant for
   subsequent patches)

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1765676583
---
 automation/gitlab-ci/test.yaml                |  8 +++--
 automation/scripts/qemu-alpine-x86_64.sh      | 16 ++++------
 automation/scripts/qemu-smoke-dom0-arm64.sh   | 14 ++++----
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 15 ++++-----
 automation/scripts/qubes-x86-64.sh            | 32 +++++++------------
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 27 ++++++++--------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 30 +++++++----------
 7 files changed, 61 insertions(+), 81 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 59a2de28c864..51229cbe561d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -11,7 +11,9 @@
   - project: xen-project/hardware/test-artifacts
     job: linux-6.6.86-arm64
     ref: master
-  - alpine-3.18-arm64-rootfs-export
+  - project: xen-project/hardware/test-artifacts
+    job: alpine-3.18-arm64-rootfs
+    ref: master
   - qemu-system-aarch64-6.0.0-arm64-export
 
 .arm32-test-needs: &arm32-test-needs
@@ -22,7 +24,7 @@
     job: linux-6.6.56-x86_64
     ref: master
   - project: xen-project/hardware/test-artifacts
-    job: x86_64-rootfs-alpine-3.18
+    job: alpine-3.18-x86_64-rootfs
     ref: master
 
 .qemu-arm64:
@@ -243,7 +245,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
       job: x86_64-kernel-linux-6.6.56
       ref: master
     - project: xen-project/hardware/test-artifacts
-      job: x86_64-rootfs-alpine-3.18
+      job: alpine-3.18-x86_64-rootfs
       ref: master
     - project: xen-project/hardware/test-artifacts
       job: x86_64-argo-linux-6.6.56
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 569bd766d31e..c7dd12197862 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -28,16 +28,14 @@ cd initrd
 find . | cpio -H newc -o | gzip > ../domU-rootfs.cpio.gz
 cd ..
 
-# initrd.tar.gz is Dom0 rootfs
+# Dom0 rootfs
+cp rootfs.cpio.gz dom0-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
 cp -ar ../dist/install/* .
+mkdir -p root etc/local.d
 mv ../domU-rootfs.cpio.gz ./root
 cp ../bzImage ./root
 echo "name=\"domU\"
@@ -60,9 +58,7 @@ xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-# rebuild Dom0 rootfs
-find . | cpio -H newc -o | gzip > ../dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
 cd ../..
 
 cat >> binaries/pxelinux.0 << EOF
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index e8e49ded245a..c0cf61ff8f7b 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -27,15 +27,14 @@ cd initrd
 find . | cpio -H newc -o | gzip > ../domU-rootfs.cpio.gz
 cd ..
 
+# Dom0 rootfs
+cp rootfs.cpio.gz dom0-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xvzf ../initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
 cp -ar ../dist/install/* .
+mkdir -p etc/local.d root
 mv ../domU-rootfs.cpio.gz ./root
 cp ../Image ./root
 echo "name=\"domU\"
@@ -56,8 +55,7 @@ xl -vvv create -c /root/domU.cfg
 
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
 cd ../..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index f72d20936181..8e939f0b7214 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -114,16 +114,14 @@ cd initrd
 find . | cpio --create --format='newc' | gzip > ../binaries/initrd
 cd ..
 
-# DOM0 rootfs
+# Dom0 rootfs
+cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
 cp -ar ../binaries/dist/install/* .
+mkdir -p etc/local.d
 
 echo "#!/bin/bash
 
@@ -142,8 +140,7 @@ xl network-attach 1 type=vif
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # ImageBuilder
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index c4be71464246..e2376cb51cb4 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -164,16 +164,13 @@ ${domU_extra_config}
 "
 
 if [ -n "$domU_check" ]; then
-    # DomU
+    # DomU rootfs
+    cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
+
+    # test-local configuration
     mkdir -p rootfs
     cd rootfs
-    # fakeroot is needed to preserve device nodes in rootless podman container
-    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
-    mkdir proc
-    mkdir run
-    mkdir srv
-    mkdir sys
-    rm var/run
+    mkdir -p etc/local.d
     echo "#!/bin/sh
 
 echo 8 > /proc/sys/kernel/printk
@@ -181,26 +178,22 @@ echo 8 > /proc/sys/kernel/printk
 ${domU_check}
 " > etc/local.d/xen.start
     chmod +x etc/local.d/xen.start
-    echo "rc_verbose=yes" >> etc/rc.conf
     echo "domU Welcome to Alpine Linux
 Kernel \r on an \m (\l)
 
 " > etc/issue
-    find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+    find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
     cd ..
     rm -rf rootfs
 fi
 
-# DOM0 rootfs
+# Dom0 rootfs
+cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
-mkdir boot
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
+mkdir -p boot etc/local.d
 cp -ar ../binaries/dist/install/* .
 cp -ar ../binaries/tests .
 cp -a ../automation/scripts/run-tools-tests tests/
@@ -237,7 +230,6 @@ fi
 chmod +x etc/local.d/xen.start
 echo "$domU_config" > etc/xen/domU.cfg
 
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
@@ -245,7 +237,7 @@ cp ../binaries/bzImage boot/vmlinuz
 if [ -n "$domU_check" ]; then
     cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 fi
-find . | fakeroot -i ../fakeroot-save cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 7e5382931b85..1fc52d78db16 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -80,6 +80,7 @@ argo-exec -l -p 28333 -- /bin/echo
 "
 copy_dom0_files ()
 {
+    mkdir -p root usr/local/lib usr/local/bin
     cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
     cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
     cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
@@ -89,12 +90,13 @@ else
     fatal "Unknown test: ${TEST}"
 fi
 
-# Set up domU rootfs.
+# DomU rootfs
+cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
-mkdir proc run srv sys
-rm var/run
+mkdir -p etc/local.d
 echo "#!/bin/sh
 set -x
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -102,22 +104,22 @@ PATH=/usr/local/bin:/usr/local/sbin:\$PATH
 ${DOMU_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "domU Welcome to Alpine Linux
 Kernel \r on an \m (\l)
 
 " > etc/issue
 copy_domU_files
-find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
-# Set up dom0 rootfs.
+# Dom0 rootfs
+cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
-mkdir boot proc run srv sys
-rm var/run
+mkdir -p boot etc/local.d
 cp -ar ../binaries/dist/install/* .
 echo "#!/bin/bash
 set -x
@@ -127,14 +129,13 @@ ${DOM0_CMD}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
 echo "${DOMU_CFG}${DOMU_CFG_EXTRA}" > etc/xen/domU.cfg
-echo "rc_verbose=yes" >> etc/rc.conf
 echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
 echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
 copy_dom0_files
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 # Load software into TFTP server directory.
@@ -147,7 +148,7 @@ echo "
 net_default_server=10.0.6.1
 multiboot2 (tftp)/${TEST_BOARD}/xen ${XEN_CMDLINE} sync_console
 module2 (tftp)/${TEST_BOARD}/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
-module2 (tftp)/${TEST_BOARD}/initrd-dom0
+module2 --nounzip (tftp)/${TEST_BOARD}/initrd-dom0
 boot
 " > ${TFTP}/${TEST_BOARD}/grub.cfg
 
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 3e1fcf6bf93c..a3031ecab0dc 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -38,36 +38,31 @@ echo \"${passed}\"
 "
 fi
 
-# DomU
+# DomU rootfs
+cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
+mkdir -p etc/local.d
 echo "#!/bin/sh
 
 ${domU_check}
 /bin/sh" > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
-# DOM0 rootfs
+# Dom0 rootfs
+cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+
+# test-local configuration
 mkdir -p rootfs
 cd rootfs
-tar xzf ../binaries/initrd.tar.gz
-mkdir proc
-mkdir run
-mkdir srv
-mkdir sys
-rm var/run
 cp -ar ../binaries/dist/install/* .
 
+mkdir -p etc/local.d
 echo "#!/bin/bash
 
 export LD_LIBRARY_PATH=/usr/local/lib
@@ -78,8 +73,7 @@ bash /etc/init.d/xencommons start
 ${dom0_check}
 " > etc/local.d/xen.start
 chmod +x etc/local.d/xen.start
-echo "rc_verbose=yes" >> etc/rc.conf
-find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
 
-- 
2.39.5


