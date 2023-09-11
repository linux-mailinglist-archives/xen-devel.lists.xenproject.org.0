Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D92379AA5A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599649.935163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk94-0005zR-AY; Mon, 11 Sep 2023 16:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599649.935163; Mon, 11 Sep 2023 16:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk94-0005x8-79; Mon, 11 Sep 2023 16:52:18 +0000
Received: by outflank-mailman (input) for mailman id 599649;
 Mon, 11 Sep 2023 16:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfk92-0005g0-Dm
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:52:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fccec2d-50c3-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 18:52:15 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-403004a96a4so26106895e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 09:52:15 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c11cd00b003fefcbe7fa8sm10578124wmi.28.2023.09.11.09.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:52:14 -0700 (PDT)
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
X-Inumbo-ID: 8fccec2d-50c3-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694451135; x=1695055935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuvtUcntTTNou/RWe1jYCTA4tsoauev6PPJ3eOrOD8c=;
        b=Qc3jxJr91UQX5/ONOoA8OsK90rGQLLHJ8JVckiTSXDYfeD21Nuiwg8PSpsIDw51twt
         WSKw+1vaRyLu51oN/I8Fr3fxPfxy6MCdF+MknAAc0E7PIaagt5d4lNaGmeqr8pTE52WD
         JwUSkeGqQPqxVs8ByssdGQNzgIc1tGLZzq6L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451135; x=1695055935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuvtUcntTTNou/RWe1jYCTA4tsoauev6PPJ3eOrOD8c=;
        b=IM/Y4SxepMCF3+zvYgDE/KYdRUWQbUm/1x5QTmF0o2ktS73XrB3ebvHX6CnF5WOUby
         F2Pqi22t/W7KL+bCSh3aqG0DtHM91Bl3WTC1iXHGazawzDtEE1ynTi38iZjzLZXxekgE
         keiAw4ohv7RifGzgfOtZh6ccwozY+5qAvk9nM6r/9AGjpmC/mNqcX6fhoKCYvNqDAWB/
         IqeelE4PXFjIw7oxn7JoL+DkcocdG/6Ohv64k53nxyBxtbbmxUlhP3XWd27hMepX4V+g
         r7G2J3nluyfXntaWTnT4ghBKpIbwnF933sE8s80bTm/0dFRyNH8sFgKSE4Mze1Dizkh1
         9YQg==
X-Gm-Message-State: AOJu0Yy5sGhDQwX685VJ3LFcaGxeEUjWdTZTobt6NG5MVwV68LHr2fHY
	cC7jWiKqWimyD6VssLyoCaaYNerSKi9sB5AhR2k=
X-Google-Smtp-Source: AGHT+IH3VUlWpvWhKwFfVjAunfmbfPAjFMwQRqfEV8Zt1XdCfIfN4XxL421AivE9o3up8hNxGQPJyw==
X-Received: by 2002:a1c:7719:0:b0:401:bf87:989c with SMTP id t25-20020a1c7719000000b00401bf87989cmr9080614wmi.34.1694451134981;
        Mon, 11 Sep 2023 09:52:14 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 1/5] automation: add python3's setuptools to containers
Date: Mon, 11 Sep 2023 17:51:00 +0100
Message-ID: <4f14ea4aeb44c234d9930578614a35234769fa41.1694450145.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694450145.git.javi.merino@cloud.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation of dropping python distutils and moving to setuptools,
add the python3 setuptools module to the containers that need it.

The centos7 container was building using python2.  Change it to build
python scripts using python3.

Debian Stretch is no longer debian oldstable, so move to the archive
repositories.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/alpine/3.18.dockerfile        |  1 +
 automation/build/archlinux/current.dockerfile  |  1 +
 automation/build/centos/7.dockerfile           |  3 ++-
 automation/build/debian/bookworm.dockerfile    |  1 +
 automation/build/debian/stretch.dockerfile     | 11 ++++++++++-
 automation/build/suse/opensuse-leap.dockerfile |  1 +
 automation/build/ubuntu/bionic.dockerfile      |  1 +
 automation/build/ubuntu/focal.dockerfile       |  1 +
 automation/build/ubuntu/trusty.dockerfile      |  1 +
 automation/build/ubuntu/xenial.dockerfile      |  1 +
 10 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index ca5756955e..5d2a69a060 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -34,6 +34,7 @@ RUN apk --no-cache add \
   ocaml-findlib \
   patch  \
   python3-dev \
+  py3-setuptools \
   texinfo \
   util-linux-dev \
   xz-dev \
diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 13fb472d9e..47e79637a4 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -34,6 +34,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         pixman \
         pkgconfig \
         python \
+        python-setuptools \
         sdl \
         sdl2 \
         spice \
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 69dcefb2f0..f14f70014a 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -22,7 +22,8 @@ RUN yum -y update \
         ncurses-devel \
         zlib-devel \
         openssl-devel \
-        python-devel \
+        python3-devel \
+        python3-setuptools \
         libuuid-devel \
         pkgconfig \
         flex \
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index f8415425e6..ae008c8d46 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -16,6 +16,7 @@ RUN apt-get update && \
         libncurses5-dev \
         libssl-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 1af6c691f8..9f4b91a9e3 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:stretch
+FROM debian/eol:stretch
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
@@ -8,6 +8,14 @@ ENV USER root
 RUN mkdir /build
 WORKDIR /build
 
+# Debian stretch is now archived.  Fetch packages from
+# archive.debian.org and skip the stretch-updates repository, as it is
+# not longer valid.
+RUN sed -i \
+    -e 's/deb.debian.org/archive.debian.org/' \
+    -e '/stretch-updates/d' \
+    /etc/apt/sources.list
+
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
@@ -17,6 +25,7 @@ RUN apt-get update && \
         libssl-dev \
         python-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 98ee42970d..7010b71aca 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -60,6 +60,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
         python3-devel \
+        python3-setuptools \
         systemd-devel \
         tar \
         transfig \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index e15f54431e..9cceb11ef9 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -17,6 +17,7 @@ RUN apt-get update && \
         libssl-dev \
         python-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 9c851c0620..e3d11194ee 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -16,6 +16,7 @@ RUN apt-get update && \
         libncurses5-dev \
         libssl-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index 22e294c20c..7e819c8e4e 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -17,6 +17,7 @@ RUN apt-get update && \
         libssl-dev \
         python-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 2d2ba3e31f..19464eead8 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -17,6 +17,7 @@ RUN apt-get update && \
         libssl-dev \
         python-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
-- 
2.41.0


