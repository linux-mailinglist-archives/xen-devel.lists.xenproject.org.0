Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24779927D62
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 20:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753966.1162240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPRel-0002KP-9k; Thu, 04 Jul 2024 18:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753966.1162240; Thu, 04 Jul 2024 18:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPRel-0002HP-6m; Thu, 04 Jul 2024 18:58:11 +0000
Received: by outflank-mailman (input) for mailman id 753966;
 Thu, 04 Jul 2024 18:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU9=OE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPRek-0002HJ-0g
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 18:58:10 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59c4f8fb-3a37-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 20:58:07 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so1147483a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 11:58:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614d50da0sm8817406a12.59.2024.07.04.11.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 11:58:05 -0700 (PDT)
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
X-Inumbo-ID: 59c4f8fb-3a37-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720119486; x=1720724286; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAUXhW8ljvb1GC/0KvYwnZVvso8UaX0no4JxO0uGauw=;
        b=bICbmw7Q+adnzYinvgYArhTsPvumh2ada/kgV0aDM+mFnwa5wsjCyDS0qnHOckzgPb
         TYLxq7P96pnYnX1Xd3kZVeZucWf+8z0p19hBticn47gDiHYiF69aVh1UBjYazHXWAfno
         OZ7IhZAAZoDTiIe2jNZ15P3tB8KLCYJE3WdjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720119486; x=1720724286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAUXhW8ljvb1GC/0KvYwnZVvso8UaX0no4JxO0uGauw=;
        b=u/E69o5wkEAWCHVgrb/lYLDEAL8y9OUTTbD+kyesY0ofGxNrwmAbxOp8205GnyxQHo
         oBuTyXObLXiJ140aKZ1kRzLIdwSvLlx1qyi8ykzqPolLc7ANTnXT5zvLoXF+Ur9hcWgJ
         w0EHkyGQUX/F2La5LMsCO+o7/6k9Dlp5x50xWExkI8YPCanz12OTxPn4LsU/GOeuKjlr
         OiU4LbD4jrgku8Am0p/0Lbf4nTWz0TcJdqXykBnFO6+W4ay62ysz5Y+a2XIs46oNXUZf
         9Hs6MdUuC7WhvWWl0i2nXTmgR9hiP79ysIxWY3Ur5x7zWsJGJNShB9T1HWmDsKffo5yO
         zR0Q==
X-Gm-Message-State: AOJu0YzosHeAuSon3/pIZN7rPKkMS7Nzh4MWROVMnDhBbGH4BQdZ/XoS
	0KRy0x94oTH4ArDp9HJ6oikb2yrN3a0CLtwD+r8gRyWRXEDjrt/GTL/JkYr19o6K4N/nKKje4bW
	b
X-Google-Smtp-Source: AGHT+IFEnshHogOMkHyzf6cKdXD1vr/xLF/kh65QrkuBx5mABgIQoVKBIhvdqh60jUkyQTEwssRp8w==
X-Received: by 2002:a05:6402:1cc1:b0:58b:9363:97e2 with SMTP id 4fb4d7f45d1cf-58e5cd16134mr1882542a12.35.1720119486342;
        Thu, 04 Jul 2024 11:58:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roiger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.19 v2 4/4] CI: Rework the CentOS7 container
Date: Thu,  4 Jul 2024 19:58:03 +0100
Message-Id: <20240704185803.1833259-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703142002.1662874-5-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CentOS 7 is fully End-of-life as of 2024-06-30, and the Yum repo configuration
points at URLs which have become non-existent.

First, start by using a heredoc RUN for legibility.  It's important to use
`set -e` to offset the fact that we're no longer chaining every command
together with an &&.

Also, because we're using a single RUN command to perform all RPM operations,
we no longer need to work around the OverlayFS bug.

Adjust the CentOS-*.repo files to point at vault.centos.org.  This also
involves swapping mirrorlist= for baseurl= in the yum config.

Use a minor bashism to express the dependenices more coherently, and identify
why we have certain dependencies.  Some adjustments are:

 * We need bzip2-devel for the dombuilder.  bzip2 needs retaining stubdom or
   `tar` fails to unpack the .bz2 archives.
 * {lzo,lz4,ztd}-devel are new optional dependency since the last time this
   package list was refreshed.
 * openssl-devel hasn't been a dependency since Xen 4.6.
 * We long ago ceased being able to build Qemu and SeaBIOS in this container,
   so drop their dependencies too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Roger Pau Monné <roiger.pau@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Expand on the sed required to fix the config
 * Adjust the package list to actually build.  Passing job:
     https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7268879932
---
 automation/build/centos/7.dockerfile | 101 ++++++++++++++++-----------
 1 file changed, 62 insertions(+), 39 deletions(-)

diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 657550f308bb..f41dda732084 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -6,44 +6,67 @@ LABEL maintainer.name="The Xen Project" \
 RUN mkdir /build
 WORKDIR /build
 
-# work around https://github.com/moby/moby/issues/10180
-# and add EPEL for dev86
-RUN rpm --rebuilddb && \
-    yum -y install \
-        yum-plugin-ovl \
-        epel-release \
-    && yum clean all && \
-    rm -rf /var/cache/yum
+RUN <<EOF
+    set -e
+
+    # Fix up Yum config now that mirror.centos.org doesn't exist
+    sed -e 's/mirror.centos.org/vault.centos.org/g' \
+        -e 's/^#.*baseurl=https\?/baseurl=https/g' \
+        -e 's/^mirrorlist=https\?/#mirrorlist=https/g' \
+        -i /etc/yum.repos.d/*.repo
+
+    # Add the EPEL repo to get dev86
+    yum -y install epel-release
+
+    # Update everything (Base container is out of date)
+    yum -y update
+
+    DEPS=(
+        # Xen
+        binutils
+        gcc
+        make
+        python
+        # Kconfig
+        bison
+        flex
+        # Flask
+        checkpolicy
+
+        # Tools (general)
+        git
+        gzip
+        patch
+        perl
+        pkgconfig
+        wget
+        # libxenguest dombuilder
+        bzip2-devel
+        lz4-devel
+        lzo-devel
+        xz-devel
+        zlib-devel
+        zstd-devel
+        # libacpi
+        acpica-tools
+        # libxl
+        libuuid-devel
+        yajl-devel
+        # RomBIOS
+        dev86
+        # Header Check
+        gcc-c++
+        # xentop
+        ncurses-devel
+        # Python bindings
+        python-devel
+
+        # Stubdom download/extract
+        bzip2
+    )
+
+    yum -y install "${DEPS[@]}"
 
-# install Xen depends
-RUN yum -y update \
-    && yum -y install \
-        gcc \
-        gcc-c++ \
-        ncurses-devel \
-        zlib-devel \
-        openssl-devel \
-        python-devel \
-        libuuid-devel \
-        pkgconfig \
-        flex \
-        bison \
-        libaio-devel \
-        glib2-devel \
-        yajl-devel \
-        pixman-devel \
-        glibc-devel \
-        make \
-        binutils \
-        git \
-        wget \
-        acpica-tools \
-        python-markdown \
-        patch \
-        checkpolicy \
-        dev86 \
-        xz-devel \
-        bzip2 \
-        nasm \
-    && yum clean all && \
+    yum clean all
     rm -rf /var/cache/yum
+EOF
-- 
2.39.2


