Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE0A7E802
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 19:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940736.1340397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1q8f-0005lD-6M; Mon, 07 Apr 2025 17:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940736.1340397; Mon, 07 Apr 2025 17:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1q8f-0005j8-2h; Mon, 07 Apr 2025 17:20:01 +0000
Received: by outflank-mailman (input) for mailman id 940736;
 Mon, 07 Apr 2025 17:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1q8d-0005j2-8d
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 17:19:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 845795cb-13d4-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 19:19:52 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso31534825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 10:19:52 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec3429f67sm141643715e9.7.2025.04.07.10.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 10:19:51 -0700 (PDT)
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
X-Inumbo-ID: 845795cb-13d4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744046392; x=1744651192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AOrt6gFXRKfZ9/vtnU1sIrxsNlxRCjPliy5l5ShI3rc=;
        b=PJ2VCkySuWlbFf4R0eyHQnG6gKFporMJ/MeykKNyETJ+1uyP1x7fjeuWlDj37NJm0L
         lxvTbG8nAmJ4dlMrtMbT38hNA731ZRyZL6h0yuCAukn1Wu57Kf4j+n+i9NZAVGpi1f8O
         0PzmS/KXd5ZXwuJnstBcYul1P5LxKnxAKkmVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744046392; x=1744651192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOrt6gFXRKfZ9/vtnU1sIrxsNlxRCjPliy5l5ShI3rc=;
        b=YuBFDRdHuuuJ6VJfBOuvYRnicGE0RaWPYXpu2AAUmM7qfKFOc657G0ydfnJjaowPUx
         Bfpytaf3G17vqZf1h6JALJ3rGWYmN3IPbpynszC9PLg36AyuG3pdheHfdXhPHU8U7ipa
         5jxzh+Dki49lNx/0b1MUWvN5P1lBHGjwoImg3aeOAeAzg7Mhx825PpZuKePBIO+JFKmN
         NyMguV8Y3NwsUnnzxkL4hiSel41a4P+W0uIYa5j7WVB1DVKRjYNiI+gb3DyRs5ALD6Ag
         Ym2nwUz3S9n3/G4/DFGM09LXWK9ny2qCNf0EKnN/Nm9B5PwlhJWaqD/kliaZEyN5UhCt
         KKIw==
X-Gm-Message-State: AOJu0YyKRzPmjnouPvrw2sfNcuaTwgYZeLcdHoYkVvS8OyhWzhcoMJHz
	wQBjmLrLSF9mnVsO2tur690fQgZHiWX8N4hF2nweWSVYcX4mQOKs/HTen9lY2ch2Yhx1TgfAngK
	kIXA=
X-Gm-Gg: ASbGncujbMYb/PuqOSwd7mB3Y6B7uvH9x+fMmukHYdLBPjjOTNd0EdCiFOQKunnaoNR
	uC3wiBZay45nn4rAQ3GvE4d4fzYk3kxLFslHonszwnnqPdRSd5yRWDS857lEuQnb8K7GmC3JI/5
	Ognjdqaeundr2/KeWV+twVHvyQo3qBCUV/8JfBMR6yZ680b6PDtwIsuVJkP4wUKUAjfKVbaxePB
	Vcxjw1zi6tK1LQEX73pEwwGnbAIWhUjDSt56VXjQGvWzjHniRkATTKPMxACkWRviZP+LFZM5nmD
	xTblAcYa6o7jSYkeU/cg+Xbgb6iR2T66qSEk3c0ElUhlIN8w3Bt2GC+WKiv20hWmY7rrzD0RRch
	yOWB3Z5XdR1FYLhOhwA==
X-Google-Smtp-Source: AGHT+IGNt8NYH/9TwN2yTSuVdKqvpl+p7ur5oVey4BqVwDf0herXXuqW31H27GwNvCXbMTI/URjSzQ==
X-Received: by 2002:a05:600c:c07:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-43ecf81c5a4mr136824705e9.4.1744046391623;
        Mon, 07 Apr 2025 10:19:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Drop stale test-artifacts/alpine/3.18.dockerfile
Date: Mon,  7 Apr 2025 18:19:49 +0100
Message-Id: <20250407171949.1865294-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should have been dropped too, as the authoritative copy lives in another
repo now.

Fixes: babe11b46c1a ("CI: Drop alpine-3.18-rootfs-export and use test-artefacts")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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

base-commit: a235f856e4bbd270b085590e1f5fc9599234dcdf
-- 
2.39.5


