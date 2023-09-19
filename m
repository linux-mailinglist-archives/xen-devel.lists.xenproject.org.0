Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF1B7A59F6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604371.941713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUG9-0003vo-BY; Tue, 19 Sep 2023 06:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604371.941713; Tue, 19 Sep 2023 06:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUG9-0003tS-7K; Tue, 19 Sep 2023 06:30:57 +0000
Received: by outflank-mailman (input) for mailman id 604371;
 Tue, 19 Sep 2023 06:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72lO=FD=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiUG7-000365-77
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:30:55 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15834304-56b6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 08:30:54 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3216ba1b01eso43069f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 23:30:54 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003fe17901fcdsm17068780wmf.32.2023.09.18.23.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:30:53 -0700 (PDT)
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
X-Inumbo-ID: 15834304-56b6-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695105053; x=1695709853; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbXhdLFbcKxuR4bu4gNNOrR4FaAxxc2YusNyZEuxj94=;
        b=D6wMLE6+JvuGZZrCb9uhp42jYU1uzMX8xGLlsBT8eSUXp3CKhdnqv5bHSjUD0ZlU+Z
         ygmSEYMg+eyiLZwdtiy6mAzFhdm6Xlc5BIp623zrc8YCqbsDuTNZcm1yxjrQH0W5Bju6
         EMsVed/CRDXkg4FbCYSD51oufyJSQKdFDarZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105053; x=1695709853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbXhdLFbcKxuR4bu4gNNOrR4FaAxxc2YusNyZEuxj94=;
        b=DZlTE9AW3YGd4OWC/gwGazxKpKgT0SrjOrgEvPJ8jYhSrFYrepz29fhm1I1BXt+HMV
         mKX8pUqzWPYj12/dPCSkQpu873TlHgtBEh8Wnj7QvtZOEx0hUGrHfJSd0EPfe+kWt8xg
         tjx9QUlanB/eqXlsBtEyE1iUeIOPItMa5zdcVh5zwqgmJ9Yuopufr2EoQ5FtqQi9hLeB
         dIZH5+vCMWT60MMZYxDMzDO1ctTy+WrC1EiIEruMg7xGMiydW/c8oXvLhWXdbEhrqXPr
         Gg12dQ5eaUXnp1Ak+z7ggexa8a8iwdaxbWi7kLRCwZD9J8rQvU3fPupJfwcqcTDPBHT4
         F3AQ==
X-Gm-Message-State: AOJu0YwbPljVet7SoLEU/f+IPgMMFKl0vStUmTY+yPZIgzWZ2u0oeNH/
	PqnXnAbn2MXZHUFIRHeA//w+xWZC8AWgYcyfXx4=
X-Google-Smtp-Source: AGHT+IFmQF902aG8kG+pWr5CTNfjQKM3oCoZlzWo8/JW8bbcr9L8kaz2unjZPw+BNhmwgwTxarBiMQ==
X-Received: by 2002:a5d:5091:0:b0:317:dada:2417 with SMTP id a17-20020a5d5091000000b00317dada2417mr8670791wrt.31.1695105053601;
        Mon, 18 Sep 2023 23:30:53 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v3 1/4] automation: add python3's setuptools to containers
Date: Tue, 19 Sep 2023 07:30:26 +0100
Message-ID: <3abf37902cb921edabf0882e463e6fa6f8b3dee7.1695104399.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1695104399.git.javi.merino@cloud.com>
References: <cover.1695104399.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation of supporting both distutils and setuptools, add the
python3 setuptools module to the containers that have recent python3
installations.

Debian Stretch, Ubuntu trusty (14.04), Ubuntu xenial (16.04) and
Ubuntu bionic (18.04) are kept without setuptools on purpose, to test
installations that don't have it.

Centos 7 in particular is kept with python2 only.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/alpine/3.18-arm64v8.dockerfile      | 1 +
 automation/build/alpine/3.18.dockerfile              | 1 +
 automation/build/archlinux/current.dockerfile        | 1 +
 automation/build/debian/bookworm-arm64v8.dockerfile  | 1 +
 automation/build/debian/bookworm-i386.dockerfile     | 1 +
 automation/build/debian/bookworm.dockerfile          | 1 +
 automation/build/suse/opensuse-leap.dockerfile       | 1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile | 1 +
 automation/build/ubuntu/focal.dockerfile             | 1 +
 9 files changed, 9 insertions(+)

diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
index ce198f7d04..470f5d72a9 100644
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ b/automation/build/alpine/3.18-arm64v8.dockerfile
@@ -32,6 +32,7 @@ RUN apk --no-cache add \
   ocaml-findlib \
   patch  \
   python3-dev \
+  py3-setuptools \
   texinfo \
   util-linux-dev \
   xz-dev \
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
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
index a6d4246d96..640b1e0ead 100644
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -16,6 +16,7 @@ RUN apt-get update && \
         libncurses5-dev \
         libssl-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
index eb1c732f53..559bf670f0 100644
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ b/automation/build/debian/bookworm-i386.dockerfile
@@ -18,6 +18,7 @@ RUN apt-get update && \
         libncurses5-dev \
         libssl-dev \
         python3-dev \
+        python3-setuptools \
         xorg-dev \
         uuid-dev \
         libyajl-dev \
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
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index aed81f0240..959e1f6939 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -63,6 +63,7 @@ RUN zypper install -y --no-recommends \
         'pkgconfig(sdl)' \
         'pkgconfig(sdl2)' \
         python3-devel \
+        python3-setuptools \
         systemd-devel \
         tar \
         transfig \
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
-- 
2.42.0


