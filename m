Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q1AHMvFNKGqhBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D18662FA7
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=wb4NMY+5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1333728.1596923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0ID-0004X4-6m; Tue, 09 Jun 2026 17:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333728.1596923; Tue, 09 Jun 2026 17:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0ID-0004UT-3G; Tue, 09 Jun 2026 17:31:13 +0000
Received: by outflank-mailman (input) for mailman id 1333728;
 Tue, 09 Jun 2026 17:31:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wX0IA-00042T-H3
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:31:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX0I9-005Nrm-UB
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:31:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dca-2eae-0a2a0a5409dd-0a2a4501ddfe-30
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:09 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284ddd-c1f2-0a2a45010019-d1558034a5a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:09 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so48778055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:31:09 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm113509696f8f.27.2026.06.09.10.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:31:08 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781026269; x=1781631069; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yot+K2Nwc6JWDlJ/XUTkOnFrW9IKjFfRr7/6DQ5TcJY=;
        b=wb4NMY+5c/TvlgjGmdjrnhE/MbiJkLUHYamiqiyJ9ciQiBXhI/VzntCcsHA0riIaRA
         Wh9pbT/yP3QNrSS4O8gSMUtaZQyb6lJQqUxj4r8J/16ri28EErX9DZVGMVBuwpsLKEV9
         bY6sMybJQr0cK6ecz39Q8UnrCzt+SNlKfuCn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026269; x=1781631069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yot+K2Nwc6JWDlJ/XUTkOnFrW9IKjFfRr7/6DQ5TcJY=;
        b=elU4W2sD5w+iZmCJA09rdI0qGRO8/9XiER5pQuhb7u2etOPrION7q/AeRKo5VbXzHP
         1QSIolZk7YdzWx6JRE5ReO5WRMH+JFCjAnMr3zAhJG73eZBEO/ikq8jl/6j/UUUU3uIo
         2wWpLarv1oLX9rHsmgtx+tv1HndIH1jTG44cDxPd5ZrODMqu0IlqeTsQSAxzYHJ0e8s/
         cKrWzKGbpIvLBOFCHo6CCDcaUaekRKkgI/EQvQ+0F/ND5Hykn+oICmxroByPwF88YBtu
         GzUj4A1Htu7u6rG2m3arsA2Jg7iOcRoU5mxcHfLpYL1fYBsZJg9otO+Fm/bGHJ1QBCWn
         0vew==
X-Gm-Message-State: AOJu0Yyl6Vh3/1s8lqaotZqgXLmNTiYQHMoQYJob6t5kR0UMLtSCi+ou
	XTWKPo0T4tpbJGV1zQfFjr/3hfsRWG/Vz9lJ+2quAqawxrvNCSk9Bdqga4NgnRzIfSxjHEouuLO
	lv+vq
X-Gm-Gg: Acq92OFFCghrECWdVxtvs1TpbE8r6BpFh+mUJftz7jqHeLVayf5mwrnTVm/i4D9Ud7v
	dnUWK3N7JHvkrm/mCH5ilVZNl74zMK1umYefsHFpOJRDPX3khzNMbZqNvwcYR1nwoPZxVwP62yO
	nJISoVkzyg/zHdhwCL+oSrCQnCsLnqazkPSbOZzG76xc217q/XIB71fATSTSPfSXhVGp9Lrgfof
	6uS/OzoSp0YzAgrV08lFMwCmAJnwm/hPpfY6sTdElu4MX9DMfTnTIKf3WfupeAogc2ExlImO6Ih
	myJ1axDawa2dMarnuvHGtkgfGC9BZQgmJtgSQMvCL7mt9XUlGIkn7OyYJ3zQI+StAsKRb00CHdx
	30q9HqqJ5peM0t6QaeagveckT1bMWlMM+tdsoZRpayi3tNzTjUuKZdS1Yg7SpbDk2m4FURpBBMt
	jxZwG/CisSESG33TYeF/MUUdy4i7bTwb/nAJK9VnDJW3VwF6I4IqdbVxF/VODOU+dkFvp2fAoGS
	92OEaA9upGXfgQ=
X-Received: by 2002:a05:600c:4183:b0:490:ae36:4835 with SMTP id 5b1f17b1804b1-490c2d2002fmr158367255e9.17.1781026269128;
        Tue, 09 Jun 2026 10:31:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/4] CI: Rework the archlinux container
Date: Tue,  9 Jun 2026 18:31:02 +0100
Message-Id: <20260609173102.2908514-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
References: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781026269-AFB56FF4-603457DD/10/63158204843
X-purgate-type: spam
X-purgate-size: 5894
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cardoe.com:email,invisiblethingslab.com:email,vates.tech:email,xenproject.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79D18662FA7

Rename it to have an x86_64 suffix, updating the build job names and scheduled
rebuild task.

Apply standard cleanups.  Trim the package list down to what is actually
needed.  Archlinux's base-devel contains most libraries, but some of those
packages have never been dependenices for Xen, and a lot are QEMU dependenices
which aren't useful owing to the lack of the ninja package.

This shrinks the container from 533MB to 427MB.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 .../build/archlinux/current-x86_64.dockerfile | 33 ++++++++++++
 automation/build/archlinux/current.dockerfile | 53 -------------------
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/gitlab-ci/containers.yaml          |  4 +-
 automation/scripts/containerize               |  2 +-
 5 files changed, 40 insertions(+), 60 deletions(-)
 create mode 100644 automation/build/archlinux/current-x86_64.dockerfile
 delete mode 100644 automation/build/archlinux/current.dockerfile

diff --git a/automation/build/archlinux/current-x86_64.dockerfile b/automation/build/archlinux/current-x86_64.dockerfile
new file mode 100644
index 000000000000..bbd5fa72d2d6
--- /dev/null
+++ b/automation/build/archlinux/current-x86_64.dockerfile
@@ -0,0 +1,33 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 archlinux:base-devel
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    pacman-key --init
+
+    DEPS=(
+        # Tools (general)
+        git
+        wget
+        # libxenguest dombuilder
+        lzo
+        # libacpi
+        iasl
+        # Python bindings
+        python-setuptools
+        # Golang bindings
+        go
+    )
+
+    pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed "${DEPS[@]}"
+    pacman -S --clean --clean
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
deleted file mode 100644
index a25702777204..000000000000
--- a/automation/build/archlinux/current.dockerfile
+++ /dev/null
@@ -1,53 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 archlinux:base-devel
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-RUN pacman-key --init
-
-RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
-        bzip2 \
-        cpio \
-        discount \
-        dtc \
-        e2fsprogs \
-        ghostscript \
-        git \
-        gnutls \
-        go \
-        iasl \
-        inetutils \
-        iproute \
-        libaio \
-        libcacard \
-        libgl \
-        libjpeg-turbo \
-        libnl \
-        libpng \
-        libseccomp \
-        net-tools \
-        nss \
-        perl \
-        pixman \
-        pkgconfig \
-        python \
-        python-setuptools \
-        sdl \
-        sdl2 \
-        spice \
-        spice-protocol \
-        # systemd for Xen < 4.19
-        systemd \
-        transfig \
-        usbredir \
-        wget \
-        xz \
-        yajl \
-        zlib \
-    && yes | pacman -S --clean --clean
-
-ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
-
-RUN useradd --create-home user
-USER user
-WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index acd4acf13138..9eda40dc6e57 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -523,16 +523,16 @@ alpine-3.18-clang-debug:
   variables:
     CONTAINER: alpine:3.18
 
-archlinux-gcc:
+archlinux-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: archlinux:current
+    CONTAINER: archlinux:current-x86_64
   allow_failure: true
 
-archlinux-gcc-debug:
+archlinux-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: archlinux:current
+    CONTAINER: archlinux:current-x86_64
   allow_failure: true
 
 debian-12-x86_64-gcc-ibt:
diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
index 8b702a1d8209..8e1c42a0c5a2 100644
--- a/automation/gitlab-ci/containers.yaml
+++ b/automation/gitlab-ci/containers.yaml
@@ -16,11 +16,11 @@
   after_script:
     - docker logout
 
-container-archlinux-current:
+container-archlinux-current-x86_64:
   extends:
     - .container-build-tmpl
   variables:
-    CONTAINER: "archlinux:current"
+    CONTAINER: "archlinux:current-x86_64"
 
 container-opensuse-tumbleweed-x86_64:
   extends:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 70494645e09f..f3c2b48b113f 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -26,7 +26,7 @@ BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
-    _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
+    _archlinux|_arch) CONTAINER="${BASE}/archlinux-x86_64:current" ;;
     _fedora) CONTAINER="${BASE}/fedora:43-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
-- 
2.39.5


