Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4765926342
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753086.1161387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qE-00056c-Fl; Wed, 03 Jul 2024 14:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753086.1161387; Wed, 03 Jul 2024 14:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qE-00053a-C7; Wed, 03 Jul 2024 14:20:14 +0000
Received: by outflank-mailman (input) for mailman id 753086;
 Wed, 03 Jul 2024 14:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP0qC-00047x-DL
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:20:12 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd6dfb8-3947-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 16:20:11 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e38027so2422295a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:20:11 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm7114707a12.34.2024.07.03.07.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:20:10 -0700 (PDT)
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
X-Inumbo-ID: 5bd6dfb8-3947-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720016411; x=1720621211; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9D47f17k0eWnVPOyYgELEIOXuEmzzN+VDIAEXj1vpPQ=;
        b=O8x84oyLdlyWlnvbqO+1f3x4yOfri05IZjPnD0l+nEpNcjoSvCmArq9uKbzhIW14X9
         mQXki1fASNHaKxVP/MZI3jbJ0s446Lunqm2XrDYdqjF4OvdCCsPmqCsMVs2qNE4LBlM1
         Mcb6rVZSl79iq+RoCnbr4i2buVoqUhbNNDKBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720016411; x=1720621211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9D47f17k0eWnVPOyYgELEIOXuEmzzN+VDIAEXj1vpPQ=;
        b=bbzSQyQRlg7UBXZtM2UODmETDoXx5Rcna21LWXkqS3gp3ZunHkCAw3zM2IIiVb8o7V
         j5BEwoQugOrR8GfDlX/eZ1P+sL+8FOc/bkNLjPWtxvDk8MeL+g37nmglUxQZrsMAdRgP
         CPzGGon8F9I0llSfjTyDBr38fgiJCKeyxYUUT9C/JTxUhYdSxPiqU4E/rS4lI4+eQH2l
         bWnfmtJWbWSe4RtQCMMpCA0iYl5qFpFeirSCSwjC1HmDLuB9G66K+Ca99noHYV97KYmi
         DTdTc3A89FNAtaB+EgSTaVusk+XbyoLrRSyX0QrbridjlaumVR5K+Z3/X0aKDxlbe+w4
         49gw==
X-Gm-Message-State: AOJu0YyeFgQQgk6alk+BOUTtCKO6/j+lkaTL+tZuncJi7Qrk3k8ilCFu
	/k81rnGhv33+AwUNjqUSvV9dvPku4NQmEF8fYcufA+wALTE+f3Dypxq1rTZotH76xH8DbVCn8h8
	LiDo=
X-Google-Smtp-Source: AGHT+IGWWOVGP2we9jH3vEZEr5UZXzsR4iV4LLvrc9gpKb7HCwr01s27knTyH/lqEHZ1BTsGm8OBgg==
X-Received: by 2002:a05:6402:42c8:b0:58c:34cb:16a9 with SMTP id 4fb4d7f45d1cf-58c34cb1aeamr2572465a12.16.1720016411055;
        Wed, 03 Jul 2024 07:20:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 4/4] CI: Rework the CentOS7 container
Date: Wed,  3 Jul 2024 15:20:02 +0100
Message-Id: <20240703142002.1662874-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
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

Adjust the CentOS-*.repo files to point at vault.centos.org.

Take the opportunity to split the Xen deps from Tools deps, and to adjust the
other packages we use:

 * We need bzip2-devel for the dombuilder, not just bzip2.
 * zstd-devel is another optional dependency since the last time this package
   list was refreshed.
 * openssl-devel hasn't been a dependency since Xen 4.6.
 * We long ago ceased being able to build Qemu and SeaBIOS in this container,
   so drop their dependencies too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/centos/7.dockerfile | 70 +++++++++++++++-------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 657550f308bb..9e66d72a5bd5 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -6,44 +6,48 @@ LABEL maintainer.name="The Xen Project" \
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
+    yum -y update
 
-# install Xen depends
-RUN yum -y update \
-    && yum -y install \
+    # Xen deps
+    yum -y install \
+        bison \
+        binutils \
+        checkpolicy \
+        flex \
         gcc \
+        make \
+
+    # Tools/stubdom/docs deps
+    yum -y install \
+        acpica-tools \
+        bzip2-devel \
+        dev86 \
         gcc-c++ \
-        ncurses-devel \
-        zlib-devel \
-        openssl-devel \
-        python-devel \
+        git \
         libuuid-devel \
+        ncurses-devel \
+        patch \
         pkgconfig \
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
+        python-devel \
         python-markdown \
-        patch \
-        checkpolicy \
-        dev86 \
+        wget \
         xz-devel \
-        bzip2 \
-        nasm \
-    && yum clean all && \
+        yajl-devel \
+        zlib-devel \
+        zstd-devel \
+
+    yum clean all
     rm -rf /var/cache/yum
+EOF
-- 
2.39.2


