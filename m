Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5DD9AE214
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825104.1239355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhx-000744-0z; Thu, 24 Oct 2024 10:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825104.1239355; Thu, 24 Oct 2024 10:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhw-0006zs-Pm; Thu, 24 Oct 2024 10:04:44 +0000
Received: by outflank-mailman (input) for mailman id 825104;
 Thu, 24 Oct 2024 10:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3uhu-0005hp-0w
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:04:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 620d4fbc-91ef-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 12:04:40 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c96df52c52so839244a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 03:04:40 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5482506a12.95.2024.10.24.03.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:04:39 -0700 (PDT)
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
X-Inumbo-ID: 620d4fbc-91ef-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729764279; x=1730369079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVlXuuK1xEQOAVzZHIn4SmM6Td3cV8czZgbgjjn4N1k=;
        b=Q8nrdOzGkK55Zmt2DPH5sQg8CdUGmhdInXPJyzy1C1oMbIqcZWnMLllmYCS/58tl3q
         XssAsKAqcHjJQVgorXXl/6NRQi1dVJnQjl2GOUU5sFv7J38pcsAlVmD24CSpJKnAunoH
         Xs3FHZQBj1+ZxXWxhWuCJmV69HYiaD+gFt8NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764279; x=1730369079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVlXuuK1xEQOAVzZHIn4SmM6Td3cV8czZgbgjjn4N1k=;
        b=gwLdybB/2NbnMaHoCV1YsbL2ZtRpu//Y7x30WOzjISaZBcwJ4dtHHSufyRUHE0mK4c
         ikw4ELglDhYSSKkBqjnlOXCFaAZpf0tlpT7lnnCQoQ9c4VQsY4RmISpSrxsGq7Pw3DYX
         e4UTrcA+kEbPAIyeZ+atGv/95rCKirIvM0viFbMhdG3qleRsst7+eRCUQ5t16hg5ta83
         JdT6ptxjFAY9bNde4gQ8RdjbzDCSGtfiwLAVaRBb+dasFN8qXQTNpqQape6QVJg8cGI2
         n/XFFLJcDxGryDquO+7/VWj9YwQs7id+UHgCQ+3p6hCn/fjz7GZRE9uf+09LvBzch7XR
         SDug==
X-Gm-Message-State: AOJu0Yyvpkl+beRaAlzKUbsklazZdxOsAO1kq7DtjPEn3682Sg7amTAj
	1eRpBIa8G5S3vWVkCdPT9mnr9Ti3GYm8bQxSwnYH9R9mbGPok851JGcWU3yEyxNISdsY55tdowg
	hETc=
X-Google-Smtp-Source: AGHT+IFRyLmoJZ+UKlceAWsFPEGXV05Q3R+N3UCSgoAj/TGPHmJLMNKyBsWpxxsHg+yLoujSrU3D1A==
X-Received: by 2002:a05:6402:280e:b0:5cb:7318:800d with SMTP id 4fb4d7f45d1cf-5cb8b26d8f1mr4678502a12.32.1729764279375;
        Thu, 24 Oct 2024 03:04:39 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 6/6] CI: Run the builds and tests that use the Debian 12 containers as a normal user
Date: Thu, 24 Oct 2024 11:04:21 +0100
Message-ID: <c6d8547d500ac419ee4590decb9392f32f1f0d02.1729760501.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1729760501.git.javi.merino@cloud.com>
References: <cover.1729760501.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR so that GitLab CI clones xen
using the user in the image, instead of as root[0].

In qemu-smoke-dom0*.sh and qemu-alpine-x86_64.sh, use fakeroot to
create the rootfs images that untar a tarball that create character
devices.  cpio replicates the block and character devices, as well as
preserving the uid and gid it sees in the current directory.  fakeroot
lets tar think that it is creating block and character devices, and
all files are owned by root, but it is all smokes and mirrors for
cpio.

[0] https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1736

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

Regarding building the rootfs, I have chosen to use a fakeroot
subshell for the entire process.  automation/scripts/qubes-x86-64.sh
takes a different approach, it just uses fakeroot for the tar/cpio
commands.  I prefer to do it this way but I am happy to be overridden
if `fakeroot -s ../save tar` and `fakeroot -i ../save cpio` are
preferred.

 automation/build/debian/12-arm64v8.dockerfile   | 5 ++++-
 automation/build/debian/12-x86_64.dockerfile    | 5 ++++-
 automation/gitlab-ci/test.yaml                  | 4 ++++
 automation/scripts/qemu-alpine-x86_64.sh        | 4 +++-
 automation/scripts/qemu-smoke-dom0-arm64.sh     | 7 +++++--
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 5 +++--
 6 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
index 4da1b074aedb..c2617956ed77 100644
--- a/automation/build/debian/12-arm64v8.dockerfile
+++ b/automation/build/debian/12-arm64v8.dockerfile
@@ -10,6 +10,8 @@ RUN <<EOF
 #!/bin/bash
     set -eu
 
+    useradd --create-home user
+
     apt-get update
     DEPS=(
         # Xen
@@ -53,6 +55,7 @@ RUN <<EOF
         curl
         device-tree-compiler
         expect
+        fakeroot
         u-boot-qemu
         # for imagebuilder
         file
@@ -64,5 +67,5 @@ RUN <<EOF
     rm -rf /var/lib/apt/lists*
 EOF
 
-USER root
+USER user
 WORKDIR /build
diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index e0ca8b7e9c91..98b23ea3eaa4 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -10,6 +10,8 @@ RUN <<EOF
 #!/bin/bash
     set -eu
 
+    useradd --create-home user
+
     apt-get update
     DEPS=(
         # Xen
@@ -54,6 +56,7 @@ RUN <<EOF
         # for qemu-alpine-x86_64-gcc
         busybox-static
         cpio
+        fakeroot
 
         # For *-efi jobs
         ovmf
@@ -64,5 +67,5 @@ RUN <<EOF
     rm -rf /var/lib/apt/lists*
 EOF
 
-USER root
+USER user
 WORKDIR /build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 42baa82fe36f..71f2beb68c4f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,6 +1,10 @@
 .test-jobs-common:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    # Clone xen as the user in the docker images, not root
+    # See https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1736
+    FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR: true
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 1ff689b577e3..2660403ab2b8 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -29,6 +29,7 @@ find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
 cd ..
 
 # initrd.tar.gz is Dom0 rootfs
+fakeroot <<EOF
 mkdir -p rootfs
 cd rootfs
 tar xvzf ../initrd.tar.gz
@@ -63,7 +64,8 @@ chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 # rebuild Dom0 rootfs
 find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
-cd ../..
+EOF
+cd ..
 
 cat >> binaries/pxelinux.0 << EOF
 #!ipxe
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 4d22a124df11..8f9bfd620ee3 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -27,8 +27,10 @@ cd initrd
 find . | cpio --create --format='newc' | gzip > ../initrd.cpio.gz
 cd ..
 
-mkdir -p rootfs
+fakeroot <<EOF
+mkdir rootfs
 cd rootfs
+
 tar xvzf ../initrd.tar.gz
 mkdir proc
 mkdir run
@@ -58,7 +60,8 @@ xl create -c /root/test.cfg
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 find . |cpio -H newc -o|gzip > ../xen-rootfs.cpio.gz
-cd ../..
+EOF
+cd ..
 
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
 curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 83e1866ca6c5..2d60f22d68b7 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -112,7 +112,8 @@ find . | cpio --create --format='newc' | gzip > ../binaries/initrd
 cd ..
 
 # DOM0 rootfs
-mkdir -p rootfs
+fakeroot <<EOF
+mkdir rootfs
 cd rootfs
 tar xzf ../binaries/initrd.tar.gz
 mkdir proc
@@ -141,7 +142,7 @@ ${dom0_check}
 chmod +x etc/local.d/xen.start
 echo "rc_verbose=yes" >> etc/rc.conf
 find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
-cd ..
+EOF
 
 # ImageBuilder
 echo 'MEMORY_START="0x40000000"
-- 
2.45.2


