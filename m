Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00602B5520D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122092.1466025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50x-0005W6-Pf; Fri, 12 Sep 2025 14:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122092.1466025; Fri, 12 Sep 2025 14:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50x-0005PA-JY; Fri, 12 Sep 2025 14:44:39 +0000
Received: by outflank-mailman (input) for mailman id 1122092;
 Fri, 12 Sep 2025 14:44:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50w-0004JT-3p
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:38 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018a5300-8fe7-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 16:44:37 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3e7643b0ab4so1116023f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:37 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:36 -0700 (PDT)
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
X-Inumbo-ID: 018a5300-8fe7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688277; x=1758293077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoTkLLzczgfJCAgT/pEdPHpSfLp9QlUgMwmAH0OgjKI=;
        b=KGPHkxMN0yexB2GGHtqTvvyTLWv5/C+76aFJ2s/78mrdthWgObhsmJ4JFuTiDEAqLW
         K+R/XjdRLdX81y+sleVf5sgkILIJ8PnDcQTV55BvkiJFzBmqyfioKFd9Z2koUBSx2v1W
         7r9cVzBFcAlIPioJo7Ks7fi56QEMoXhGYS/h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688277; x=1758293077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoTkLLzczgfJCAgT/pEdPHpSfLp9QlUgMwmAH0OgjKI=;
        b=gPtbM2CiozQinqRMg/w1VlpXxQ+Z1YckuHO6rUeYTGPwQqYGUshRIY4ddrvhnQzHcs
         k7f805ZhUDrxWdT5B+TLebXv/tPO0nWQCNudVDyJn5dxNkXTiPcSgPM09bGah2XgZz59
         Cfpey/6KYHzJPQIqtY+pPTF22PlHc15/VAphVcbR3ezIYedyBisun4RqaT9zVf4wOj9D
         Wguqkm8o79pdcn5hFobVc202kr880vABvEQUmTu6F42DcEC0QckLugfvB/lA3U2MJ/Pj
         c3l9BSQsTC2ffiWFUzuqP9GgSjY1t4hiS9WmHOl4Z/lsd+1ZkSGGWXLRfkKQFeGFczuV
         KQIA==
X-Gm-Message-State: AOJu0YyJ11T3eAyYTmF8PgTPJiIk85+jkVSfC64U/IdkmutiCmoFblSX
	isIIB6jZ4SRVL+DjH4W9vwy/lRSxgFwT4NfMTHPcIXu/nqwsDSi238D2KsNUnyGsxWm74qtdV+X
	HQ351
X-Gm-Gg: ASbGncsjJNUE9ErN0legYeyeUrGEh50JZwEBiBZ/6+pdV19dnAJLGD931xvawN+82mh
	/QoNE+hMpt6p0e6XYnbTI38AThScXRcJ++AD6nyaciYy9r2RC6AcpoFF8fCuFKun4AunoIVpsDi
	ZFJKYWPicdYmCUavdHnncqCNMtBpbtjxQ1hy8LBzjs/Xxc5pO8ppjcSJ+244iy8Y9cibe/ai2e1
	nj98kt6Jft2joHJMCZ9AM+is8olLkDLgroieboKwVBa5M8EvZlUeXgia4TvrvXUV8kP4FsqyFBu
	DxKO4H8HsPt7q7TbP/510bKxqUwAA8tP2jW4ewKVbLnQlnThvGlZH6TGhEs7jHT2DZgNXiqoOd/
	tYU86MJXrKivOVMxAqGnU4E6KLJE+SNWUM1WgNdQ4xP4h9Q5uWUuskercbBSle+yP/Dp+tA44jT
	HYMHchBPsJoquPZMn5fDfc/A==
X-Google-Smtp-Source: AGHT+IHujJvcSHrLmVnyhhPcSJgTM1tAhBqsElDCkNGpTY6jV0fsEGre6zSrxLSpmMlrywVyLYecqw==
X-Received: by 2002:a05:6000:2885:b0:3e3:c5a8:a1be with SMTP id ffacd0b85a97d-3e76552eb61mr3131530f8f.0.1757688276676;
        Fri, 12 Sep 2025 07:44:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v4 6/8] CI: Use pipefail in scripts/build
Date: Fri, 12 Sep 2025 15:44:25 +0100
Message-Id: <20250912144427.1905141-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marek noticed that some builds were failing with:

  + cd dist/install
  + find
  + cpio -R 0:0 -o -H newc
  ./automation/scripts/build: line 111: cpio: command not found
  + gzip

but succeeding overall, and producing a zero length xen-tools.cpio.gz as an
artefact.

In fact, it's all of:

  archlinux:current
  debian:12-x86_32
  fedora:41
  opensuse:tumbleweed
  ubuntu (all versions)

Add cpio into all of these containers, including opensuse leap for good
measure, and use pipefail in the build script.

Fixes: 4611ae6fb8f9 ("CI: save toolstack artifact as cpio.gz")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

v4:
 * New

I have already deployed the updated containers.

All failures:
  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2036157692
---
 automation/build/archlinux/current.dockerfile          | 1 +
 automation/build/debian/12-x86_32.dockerfile           | 1 +
 automation/build/fedora/41-x86_64.dockerfile           | 1 +
 automation/build/opensuse/leap-15.6-x86_64.dockerfile  | 1 +
 automation/build/opensuse/tumbleweed-x86_64.dockerfile | 1 +
 automation/build/ubuntu/16.04-x86_64.dockerfile        | 1 +
 automation/build/ubuntu/18.04-x86_64.dockerfile        | 1 +
 automation/build/ubuntu/20.04-x86_64.dockerfile        | 1 +
 automation/build/ubuntu/22.04-x86_64.dockerfile        | 1 +
 automation/build/ubuntu/24.04-x86_64.dockerfile        | 1 +
 automation/scripts/build                               | 2 ++
 11 files changed, 12 insertions(+)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 657ddd77a85c..4e53c835fa50 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -8,6 +8,7 @@ RUN pacman-key --init
 RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         bridge-utils \
         bzip2 \
+        cpio \
         discount \
         dtc \
         e2fsprogs \
diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/12-x86_32.dockerfile
index ef7a2571556b..447152d7e5e4 100644
--- a/automation/build/debian/12-x86_32.dockerfile
+++ b/automation/build/debian/12-x86_32.dockerfile
@@ -23,6 +23,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         pkg-config
         wget
diff --git a/automation/build/fedora/41-x86_64.dockerfile b/automation/build/fedora/41-x86_64.dockerfile
index 8032a2098632..e33329aedc9e 100644
--- a/automation/build/fedora/41-x86_64.dockerfile
+++ b/automation/build/fedora/41-x86_64.dockerfile
@@ -23,6 +23,7 @@ RUN <<EOF
         checkpolicy
 
         # Tools (general)
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/opensuse/leap-15.6-x86_64.dockerfile b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
index 97890dfc006c..33db3ecd634b 100644
--- a/automation/build/opensuse/leap-15.6-x86_64.dockerfile
+++ b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
@@ -29,6 +29,7 @@ RUN <<EOF
         python311
 
         # Tools (general)
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/opensuse/tumbleweed-x86_64.dockerfile b/automation/build/opensuse/tumbleweed-x86_64.dockerfile
index 61e840fc67da..218bc45294c1 100644
--- a/automation/build/opensuse/tumbleweed-x86_64.dockerfile
+++ b/automation/build/opensuse/tumbleweed-x86_64.dockerfile
@@ -28,6 +28,7 @@ RUN <<EOF
         python3
 
         # Tools (general)
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/ubuntu/16.04-x86_64.dockerfile b/automation/build/ubuntu/16.04-x86_64.dockerfile
index 9cc8ca89e8e0..72a46389fa0d 100644
--- a/automation/build/ubuntu/16.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/16.04-x86_64.dockerfile
@@ -24,6 +24,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/ubuntu/18.04-x86_64.dockerfile b/automation/build/ubuntu/18.04-x86_64.dockerfile
index aefe52125a22..2634856c8980 100644
--- a/automation/build/ubuntu/18.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/18.04-x86_64.dockerfile
@@ -24,6 +24,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/ubuntu/20.04-x86_64.dockerfile b/automation/build/ubuntu/20.04-x86_64.dockerfile
index 1ee20a13ac6b..9ec57eb975e1 100644
--- a/automation/build/ubuntu/20.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/20.04-x86_64.dockerfile
@@ -24,6 +24,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/ubuntu/22.04-x86_64.dockerfile b/automation/build/ubuntu/22.04-x86_64.dockerfile
index a9a9b84930fb..6ae7f4faa859 100644
--- a/automation/build/ubuntu/22.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/22.04-x86_64.dockerfile
@@ -24,6 +24,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/build/ubuntu/24.04-x86_64.dockerfile b/automation/build/ubuntu/24.04-x86_64.dockerfile
index 2005723b31ad..84777d188c0d 100644
--- a/automation/build/ubuntu/24.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/24.04-x86_64.dockerfile
@@ -24,6 +24,7 @@ RUN <<EOF
 
         # Tools (general)
         ca-certificates
+        cpio
         git-core
         gzip
         patch
diff --git a/automation/scripts/build b/automation/scripts/build
index d0511843e7ea..7a81d229decd 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -1,5 +1,7 @@
 #!/bin/bash -ex
 
+set -o pipefail
+
 test -f /etc/os-release && cat "$_"
 
 # Construct $cc such that it matches what `make` will chose when taking
-- 
2.39.5


