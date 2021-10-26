Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E337943A9CA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216153.375648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBTa-0001cX-MF; Tue, 26 Oct 2021 01:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216153.375648; Tue, 26 Oct 2021 01:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBTa-0001a5-J9; Tue, 26 Oct 2021 01:42:06 +0000
Received: by outflank-mailman (input) for mailman id 216153;
 Tue, 26 Oct 2021 01:42:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7zbS=PO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfBTZ-0001Zx-Pf
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:42:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cad276e7-ccbb-4459-9680-8141b1dc6f86;
 Tue, 26 Oct 2021 01:42:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBA6961057;
 Tue, 26 Oct 2021 01:42:03 +0000 (UTC)
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
X-Inumbo-ID: cad276e7-ccbb-4459-9680-8141b1dc6f86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635212524;
	bh=RUYwi15asB7wOfxAWOMyV7/IDOyTDsG6KU/TPjlIGvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s8XUPMicLG5r3scOqPlya7YGhzh58wM9xME60beOxQuz5u8dzv0C/z2OQjJV/Y/f0
	 S5StysfqBTPbylRz4V2XWGYIGzWSl20D+4mBDSjupR4Qk/qMKZrpTY3A0v80LgjgDu
	 6KRSjQnWJEfv8nfDW1JmlCTurEVNuSlxtlL/yTLJMfZGc8cIVeymP+A2l92DFA4dDz
	 +kx0YrYMldXsQV+M5VXU57rt/Mx7emBxySVPzppaGHLKhQpRLQ+SOtbkkCwl93845M
	 O1bJFZvuQue6nJq5D7xCP/ELuipXpKJLwfWqM02FUh8UU6irFTIjiz2gA0PF5mmHE5
	 tdjL6wa8kf/dw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	iwj@xenproject.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 1/3] automation: add x86_64 alpine 3.12 test-artifact
Date: Mon, 25 Oct 2021 18:41:58 -0700
Message-Id: <20211026014200.32102-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

It is the same as the existing ARM64 alpine 3.12 test-artifact. It is
used to export an Alpine rootfs for Dom0 used for testing.

Also add the exporting job to build.yaml so that the binaries can be
used during gitlab-ci runs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes in 2:
- remove gettext
---
 automation/gitlab-ci/build.yaml               | 13 ++++
 .../tests-artifacts/alpine/3.12.dockerfile    | 66 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 automation/tests-artifacts/alpine/3.12.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d177da1710..76b73beead 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -596,3 +596,16 @@ qemu-system-aarch64-5.2.0-arm64-export:
   tags:
     - arm64
 
+
+# x86_64 test artifacts
+
+alpine-3.12-rootfs-export:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
+  script:
+    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+  artifacts:
+    paths:
+      - binaries/initrd.tar.gz
+  tags:
+    - x86_64
diff --git a/automation/tests-artifacts/alpine/3.12.dockerfile b/automation/tests-artifacts/alpine/3.12.dockerfile
new file mode 100644
index 0000000000..b3909996b4
--- /dev/null
+++ b/automation/tests-artifacts/alpine/3.12.dockerfile
@@ -0,0 +1,66 @@
+FROM alpine:3.12
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+RUN \
+  # apk
+  apk update && \
+  \
+  # xen runtime deps
+  apk add musl && \
+  apk add openrc && \
+  apk add busybox && \
+  apk add sudo && \
+  apk add dbus && \
+  apk add bash && \
+  apk add python2 && \
+  apk add zlib && \
+  apk add ncurses && \
+  apk add texinfo && \
+  apk add yajl && \
+  apk add libaio && \
+  apk add xz-dev && \
+  apk add util-linux && \
+  apk add argp-standalone && \
+  apk add libfdt && \
+  apk add glib && \
+  apk add pixman && \
+  apk add curl && \
+  apk add udev && \
+  \
+  # Xen
+  cd / && \
+  # Minimal ramdisk environment in case of cpio output
+  rc-update add udev && \
+  rc-update add udev-trigger && \
+  rc-update add udev-settle && \
+  rc-update add networking sysinit && \
+  rc-update add loopback sysinit && \
+  rc-update add bootmisc boot && \
+  rc-update add devfs sysinit && \
+  rc-update add dmesg sysinit && \
+  rc-update add hostname boot && \
+  rc-update add hwclock boot && \
+  rc-update add hwdrivers sysinit && \
+  rc-update add killprocs shutdown && \
+  rc-update add modloop sysinit && \
+  rc-update add modules boot && \
+  rc-update add mount-ro shutdown && \
+  rc-update add savecache shutdown && \
+  rc-update add sysctl boot && \
+  rc-update add local default && \
+  cp -a /sbin/init /init && \
+  echo "ttyS0" >> /etc/securetty && \
+  echo "hvc0" >> /etc/securetty && \
+  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
+  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
+  passwd -d "root" root && \
+  \
+  # Create rootfs
+  cd / && \
+  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
-- 
2.17.1


