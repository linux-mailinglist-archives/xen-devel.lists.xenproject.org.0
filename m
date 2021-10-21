Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BF436E02
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 01:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214623.373244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhD2-0007Zy-Uc; Thu, 21 Oct 2021 23:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214623.373244; Thu, 21 Oct 2021 23:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdhD2-0007Xt-R4; Thu, 21 Oct 2021 23:10:52 +0000
Received: by outflank-mailman (input) for mailman id 214623;
 Thu, 21 Oct 2021 23:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXrv=PJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mdhD1-0007Xm-P4
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 23:10:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c14df914-64e6-4d8a-8d74-40ae67ce2d83;
 Thu, 21 Oct 2021 23:10:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03B7A610EA;
 Thu, 21 Oct 2021 23:10:49 +0000 (UTC)
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
X-Inumbo-ID: c14df914-64e6-4d8a-8d74-40ae67ce2d83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634857850;
	bh=+84313eWlrORG+Up0MBqnoQCkpcNEW5LOpum5NNFz1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CcOiyJckIwNtGdIPBIGB7Ht3P9HLMdYMeshqCtht7U3X6nhqBMkMO1wtkkDZnjnHk
	 Q18oeZuhsVJJRNzn8UFAKtyUKOAG0F/o3BpqP6n7CsfPxkpCyhlYrd2IfYE1IT1lJV
	 rHK5pN2wUM/2qfelhjCvIBCvcj26T6+QLbBJIu5GIGRo5lgcjkNW6GMV0Y65TiLwJB
	 gprCAltQFCoKq7sgb0VaKELDIxDeNzGpc8uDJNi5ofAZBX6+qSgYXE73kh31xVtNyo
	 7ByNiod6ZcpHl9AJo6kDrUCHjDWMiC1TXdGbtUNO0/5FnkTkaM/UJ1nh56S4GoFtZd
	 UHPPpSiDR5lzw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	iwj@xenproject.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 1/3] automation: add x86_64 alpine 3.12 test-artifact
Date: Thu, 21 Oct 2021 16:08:37 -0700
Message-Id: <20211021230839.10794-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

It is the same as the existing ARM64 alpine 3.12 test-artifact. It is
used to export an Alpine rootfs for Dom0 used for testing.

Also add the exporting job to build.yaml so that the binaries can be
used during gitlab-ci runs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/build.yaml               | 13 ++++
 .../tests-artifacts/alpine/3.12.dockerfile    | 68 +++++++++++++++++++
 2 files changed, 81 insertions(+)
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
index 0000000000..fbc26b9e36
--- /dev/null
+++ b/automation/tests-artifacts/alpine/3.12.dockerfile
@@ -0,0 +1,68 @@
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
+  # gettext for Xen < 4.13
+  apk add gettext && \
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


