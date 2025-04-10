Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD182A8426E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945477.1343687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qeu-0007vN-Py; Thu, 10 Apr 2025 12:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945477.1343687; Thu, 10 Apr 2025 12:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qeu-0007s3-Kx; Thu, 10 Apr 2025 12:05:28 +0000
Received: by outflank-mailman (input) for mailman id 945477;
 Thu, 10 Apr 2025 12:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qeu-00077g-12
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:05:28 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 165ac65e-1604-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:05:26 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4854655e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:05:26 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a6e7sm4522476f8f.44.2025.04.10.05.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 05:05:24 -0700 (PDT)
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
X-Inumbo-ID: 165ac65e-1604-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744286725; x=1744891525; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NScjdwRMuh0cAfczaxLlOkH95BY72u6QVj9j9EZf9sU=;
        b=clz+DUMoSHF1nnkiren4cwb2fb8YsJO415Exdp/+oJuVaoK5pmNXkj8Zjor/BmI2Rp
         Hhh416wEWPJu6ZGFs6QhB3Sklc+HZt0CgpELnhe9SLOHwmGdy4OPpwuBZoA0vQCUlNoi
         reE4r6COLsx0xy5MC12rdBuvA7GHX7Z3Xts0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286725; x=1744891525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NScjdwRMuh0cAfczaxLlOkH95BY72u6QVj9j9EZf9sU=;
        b=K/f6FPog7cBcVKt0M0wt0QChFlEH8A1Jnxzmgs8w8DOGoQjoxFyjUv9ARikzvVSvtE
         /9ik8HxjfqZeX04ESwMxPr1bvq+9xSAq8OMro5Hd0kch82z6DXXRIGia+2UjTjciHNOs
         oCMY+lCyGWBX6wC4RJ5if65Ox9kLcP9YPkvzk4vzoexl351CxUDyhoQlOv2t2+WnLaIs
         b0ZX7f5bQbb3zac4H2yCiuOGMOvVHkk0S2pqqNawo5JLr1LI+QxE2noUBvJGkqZHaAAa
         bOlpaRBUruZ8ehnGNZ1Iry19aBywFY1tyXCIxkeYBBsIVVl9ELEEMwjAsn1JNQXjnKt2
         6/mg==
X-Gm-Message-State: AOJu0YyPaxJTtJIKt524FD7kl0uqs02kw6P1Pg7mYWnkL7GxwUOtA00c
	RcG8QpALwzg5JT2Dxy+tELHWFbWs9+jBDyzutEh5eqKA0rPOCfHI6h9UtHh0aZdIrJ5IBClYd5q
	qZyk=
X-Gm-Gg: ASbGncv36t9m0nfTzUq6S6UvankJUiiA7Bi3W1eZ5oQnvn9gKokJIdnZxcVK8llMc9P
	N/VNGbEaWcf4sh6699LjPk9p2jPb0eaK/G7RnA3wPi789GXjVtqEg7xexf+4hik4Y3hGHI9VK2M
	Jz91sTqZRJnNP9G0CaoC2VSom2PYjg6l2HzqTUgzytk9JnUOipdNrM/a+vc3oHPO3JUZTxbAnZG
	oucEltmSQFGlNq1ChP/ZbVQNoGAKCVUanCgRaM0nlScFoWp38vvAGBZR9blcdVG/ZL5J2jlivUj
	SkcapUopkuKWRLxe2X4YgcQDdROcUJKq8tajeM94PuaPlfKuekoZ3G4RRt0mcZcyUIHEB9qbWv3
	57hL7lqp1+NXkKw==
X-Google-Smtp-Source: AGHT+IFYX4vhOkD0mziwJp624KZKszO+/lmYjn+avXi8lQ9zjs4xY+7qcs39wjPyqwbkvKk+bBroZA==
X-Received: by 2002:a05:600c:b90:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43f2f0bc8c3mr24596305e9.13.1744286725250;
        Thu, 10 Apr 2025 05:05:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/3] CI: Drop stale test-artifacts/alpine/3.18.dockerfile
Date: Thu, 10 Apr 2025 13:05:20 +0100
Message-Id: <20250410120520.2062328-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
References: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should have been dropped too, as the authoritative copy lives in another
repo now.

Fixes: babe11b46c1a ("CI: Drop alpine-3.18-rootfs-export and use test-artefacts")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Repost
---
 .../tests-artifacts/alpine/3.18.dockerfile    | 67 -------------------
 1 file changed, 67 deletions(-)
 delete mode 100644 automation/tests-artifacts/alpine/3.18.dockerfile

diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
deleted file mode 100644
index 311a92889b87..000000000000
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ /dev/null
@@ -1,67 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-RUN \
-  # apk
-  apk update && \
-  \
-  # xen runtime deps
-  apk add musl && \
-  apk add libgcc && \
-  apk add openrc && \
-  apk add busybox && \
-  apk add sudo && \
-  apk add dbus && \
-  apk add bash && \
-  apk add python3 && \
-  apk add zlib && \
-  apk add ncurses && \
-  apk add yajl && \
-  apk add libaio && \
-  apk add xz && \
-  apk add util-linux && \
-  apk add argp-standalone && \
-  apk add libfdt && \
-  apk add glib && \
-  apk add pixman && \
-  apk add curl && \
-  apk add udev && \
-  apk add pciutils && \
-  apk add libelf && \
-  \
-  # Xen
-  cd / && \
-  # Minimal ramdisk environment in case of cpio output
-  rc-update add udev && \
-  rc-update add udev-trigger && \
-  rc-update add udev-settle && \
-  rc-update add loopback sysinit && \
-  rc-update add bootmisc boot && \
-  rc-update add devfs sysinit && \
-  rc-update add dmesg sysinit && \
-  rc-update add hostname boot && \
-  rc-update add hwclock boot && \
-  rc-update add hwdrivers sysinit && \
-  rc-update add modules boot && \
-  rc-update add killprocs shutdown && \
-  rc-update add mount-ro shutdown && \
-  rc-update add savecache shutdown && \
-  rc-update add local default && \
-  cp -a /sbin/init /init && \
-  echo "ttyS0" >> /etc/securetty && \
-  echo "hvc0" >> /etc/securetty && \
-  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
-  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
-  echo > /etc/modules && \
-  passwd -d "root" root && \
-  \
-  # Create rootfs
-  cd / && \
-  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
-- 
2.39.5


