Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C867F3331
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637948.994093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THd-0002JK-AY; Tue, 21 Nov 2023 16:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637948.994093; Tue, 21 Nov 2023 16:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THd-0002He-7M; Tue, 21 Nov 2023 16:07:29 +0000
Received: by outflank-mailman (input) for mailman id 637948;
 Tue, 21 Nov 2023 16:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THb-00021p-GH
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:27 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fbbaa00-8888-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 17:07:25 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso4230995e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 x18-20020a05600c421200b00406443c8b4fsm21325335wmh.19.2023.11.21.08.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:24 -0800 (PST)
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
X-Inumbo-ID: 0fbbaa00-8888-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582845; x=1701187645; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyHczbYeLDFcodZOosw2Bsnn9YyQbUPtyKgez7lH334=;
        b=cx9HQl6YymxWGOHPi5oF6bgbJi53aFxDVmkqDi6gLZZiH3PWUrAINCsHJLsy4er+4p
         zkR0hblAWhMJlCW5Lei+mEmmXPiq4KnkX2/PIejI8qR82rQV0cETY7YdGmnt4QzeJDZx
         zeN1iinRPHp6ulOERWzWYx6iX7c5XOc01yHMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582845; x=1701187645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyHczbYeLDFcodZOosw2Bsnn9YyQbUPtyKgez7lH334=;
        b=bDKp7OrN/fffyRyEVwkw1acfKmdg8Ulc/5xHWIXrUQE2LMyf8w+rvETobXvetw+F2a
         bRm2sbZvnUO2jn2dmLGmIBlU+hrwZrNxh2x9nKHwHOTm+FUgGkgqUGmPyfWEMJNxZ6YX
         AWbbj1TZ3Qro/Hw+Fme9bs5nVfQmL+ZBogOy0iSqtgFHc5b6hMkmMa5n7JoAKP2i0gzK
         UKRNiTZHfyvzpkOqE7a7OM+/TYev4ek/lHKhpaP30kf9GiDKOguvq5Y1H6sCDqRpBOd1
         IYahMwHTgawar+tRrQVXe4RBdM0ZAFtMwpUuBshntz+GJd+8olCMCoyaN3wofKQTDVTI
         GuOQ==
X-Gm-Message-State: AOJu0YwrbKKWn6QS96NkusiM8xfjEtYV6K8TZFvtsZC9UTWlfmP7XgoK
	tBQZJUH96LJiHO4j+5/vJByzKqvUs6guOKxSzQQ=
X-Google-Smtp-Source: AGHT+IGF3zGNzPN2SUkbkGYb+XSaNlHF+zriNTQCshiisKof9rgKjrHKyQblHwnsxukotcqyYKYNtA==
X-Received: by 2002:a05:600c:4743:b0:406:51a0:17ea with SMTP id w3-20020a05600c474300b0040651a017eamr2817864wmo.10.1700582844881;
        Tue, 21 Nov 2023 08:07:24 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/7] automation: remove CR characters from serial output
Date: Tue, 21 Nov 2023 17:03:52 +0100
Message-ID: <20231121160358.8080-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The gitlab CI webpage seems to have issues displaying the \CR\CR\LF "\r\r\n"
sequence on the web interface used as line returns by the Linux kernel serial
output.  This leads to the QEMU tests output looking like:

(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 664kB init memory
mapping kernel into physical memory
about to get started...
qemu-system-x86_64: terminating on signal 15 from pid 52 (timeout)

This not helpful, so strip the CR characters from the output that goes to
stdout, leaving the output in the serial output file untouched.

All usages of `tee` are adjusted to strip CR from the output.

Fixes: 3030a73bf849 ('automation: add a QEMU based x86_64 Dom0/DomU test')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v1:
 - Attempt to fix all usages of tee.
---
 automation/scripts/qemu-alpine-x86_64.sh          | 5 ++++-
 automation/scripts/qemu-smoke-dom0-arm32.sh       | 3 ++-
 automation/scripts/qemu-smoke-dom0-arm64.sh       | 3 ++-
 automation/scripts/qemu-smoke-dom0less-arm32.sh   | 3 ++-
 automation/scripts/qemu-smoke-dom0less-arm64.sh   | 3 ++-
 automation/scripts/qemu-smoke-riscv64.sh          | 2 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh     | 3 ++-
 automation/scripts/qubes-x86-64.sh                | 2 +-
 automation/scripts/xilinx-smoke-dom0less-arm64.sh | 2 +-
 9 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 8c8d0b0cd759..a1c41c030a47 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -84,7 +84,10 @@ qemu-system-x86_64 \
     -monitor none -serial stdio \
     -nographic \
     -device virtio-net-pci,netdev=n0 \
-    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& \
+        # Remove carriage returns from the stdout output, as gitlab
+        # interface chokes on them
+        tee smoke.serial | sed 's/\r//'
 
 set -e
 (grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index e6f303064a83..281cae38b4bd 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -91,7 +91,8 @@ timeout -k 1 720 \
    -no-reboot \
    -device virtio-net-pci,netdev=n0 \
    -netdev user,id=n0,tftp=./ \
-   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee ${serial_log}
+   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& \
+      tee ${serial_log} | sed 's/\r//'
 
 set -e
 (grep -q "Domain-0" ${serial_log} && grep -q "^/ #" ${serial_log}) || exit 1
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 0bf5cfdc61f9..bb3d3a6a816e 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -104,7 +104,8 @@ timeout -k 1 720 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
+        tee smoke.serial | sed 's/\r//'
 
 set -e
 (grep -q "Domain-0" smoke.serial && grep -q "BusyBox" smoke.serial) || exit 1
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index fb8f044a51f6..737adaf1a9ad 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -137,7 +137,8 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=./ \
-    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee ${serial_log}
+    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& \
+        tee ${serial_log} | sed 's/\r//'
 
 set -e
 (grep -q "${dom0_prompt}" ${serial_log} && grep -q "${passed}" ${serial_log}) || exit 1
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 75f575424a4e..b5ce7efdd44e 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -201,7 +201,8 @@ timeout -k 1 240 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
+        tee smoke.serial | sed 's/\r//'
 
 set -e
 (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 4008191302f9..f90df3c051e9 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -13,7 +13,7 @@ qemu-system-riscv64 \
     -nographic \
     -m 2g \
     -kernel binaries/xen \
-    |& tee smoke.serial
+    |& tee smoke.serial | sed 's/\r//'
 
 set -e
 (grep -q "All set up" smoke.serial) || exit 1
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 3ec9cf74e129..0c4578eda66e 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -61,7 +61,8 @@ timeout -k 1 120 \
     -no-reboot \
     -device virtio-net-pci,netdev=n0 \
     -netdev user,id=n0,tftp=binaries \
-    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& \
+        tee smoke.serial | sed 's/\r//'
 
 set -e
 (grep -q "${passed}" smoke.serial) || exit 1
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 51323b1ae040..adec0f1f25c7 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -200,7 +200,7 @@ cp -f binaries/dom0-rootfs.cpio.gz $TFTP/initrd-dom0
 # the console
 mkfifo /tmp/console-stdin
 cat /tmp/console-stdin |\
-ssh $CONTROLLER console | tee smoke.serial &
+ssh $CONTROLLER console | tee smoke.serial | sed 's/\r//' &
 
 # start the system pointing at gitlab-ci predefined config
 ssh $CONTROLLER gitlabci poweron
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
index 075305241c8d..2bf786f6ee86 100755
--- a/automation/scripts/xilinx-smoke-dom0less-arm64.sh
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -136,7 +136,7 @@ cd $START
 # connect to serial
 set +e
 stty -F /dev/ttyUSB0 115200
-timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial"
+timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial | sed 's/\r//'"
 
 # stop the board
 cd /scratch/gitlab-runner
-- 
2.42.0


