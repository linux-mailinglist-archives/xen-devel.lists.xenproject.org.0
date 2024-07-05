Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC473928B89
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754383.1162842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkkD-0001dX-SL; Fri, 05 Jul 2024 15:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754383.1162842; Fri, 05 Jul 2024 15:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkkD-0001bY-P2; Fri, 05 Jul 2024 15:21:05 +0000
Received: by outflank-mailman (input) for mailman id 754383;
 Fri, 05 Jul 2024 15:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkkC-00005r-UZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:21:04 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30dcf5c9-3ae2-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 17:21:03 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a77c2d89af8so163401066b.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:21:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c8ad6c6esm78100366b.49.2024.07.05.08.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:20:57 -0700 (PDT)
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
X-Inumbo-ID: 30dcf5c9-3ae2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192860; x=1720797660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mBOORP0APxjA42q2fZJxxL6p1x9ELenOCs/p9DU+hM=;
        b=KC4aVeREmp86Nldjhk3GhyNFUBlTrXDstX9UdAWBmY1c973JEUNtOpkUUiE8i8Pl5M
         MrmpEq/NLHqi2Hcgnv2SFX0tZzig51qscXS0Cf86d1hExZMi6pQvYKt+ev4d2N7BhZmG
         6ZqBP4znYMz6U2cnbRQP201wXLxdg4UsRTarA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192860; x=1720797660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mBOORP0APxjA42q2fZJxxL6p1x9ELenOCs/p9DU+hM=;
        b=mMJMOm/II+IRtIJzvorWHyQbpoaRs0GayBdA/Qw+4tGtsUQZeDzqhx8LzqMEKeqHbj
         ts1rcxlajG7DMOLgmu+6/9lnaDB4s0Jpn1pJ4D6aGPXxQkcttdxiawB5dc/ug30Wquuh
         mrlq2tZFgkH3NAOyGidvUi1/Aq+oxIhuhbQdZY0elUvYUGCJo2UZHikCSaB0/SDL1ynE
         XXuYWQCbEl0yG2LEwpm5tVZZQLUXDCULOvEh2TMTNsdoFPV2AjMHmY3DBPly9hbK1Emm
         WWWv6vi0oLddUOyOKRMxN4oYae/nbH0Q5k8zqoWnf12A27kUIGQcdkU1mpMwm2LiaGvj
         D1mg==
X-Gm-Message-State: AOJu0Yy5O8PezLEaWJBWpclUK9l+9V338vFfFRZ2GNjReAY7PQrJketQ
	d2//BOHIZjYtRE35HVF71uygtmYQTQNJDpYFMXDj5HHxf3XHrWy4Bi13dBouekwRkKNHiWznt+b
	i
X-Google-Smtp-Source: AGHT+IH1z7OAs0N5y/GAUOVNaaeDtRhVTz+AmQPZ3nv9yzGggkSbfyVrVIFdtFZOmB0bXxODaz7lkA==
X-Received: by 2002:a17:906:2712:b0:a72:5f9a:159a with SMTP id a640c23a62f3a-a77ba44d1c1mr324831366b.2.1720192859992;
        Fri, 05 Jul 2024 08:20:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 6/6] build: Drop xorg-x11 as a build dependency
Date: Fri,  5 Jul 2024 16:20:37 +0100
Message-Id: <20240705152037.1920276-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The history on this one is complicated.  The note to README was added in
commit 1f95747a4f16 ("Add openssl-dev and xorg-x11-dev to README") in 2007.

At the time, there was a vendered version of Qemu in xen.git with a local
modification using <X11/keysymdef.h> to access the monitor console over VNC.

The final reference to keysymdef.h was dropped in commit 85896a7c4dc7 ("build:
add autoconf to replace custom checks in tools/check") in 2012.  The next
prior mention was in 2009 with commit a8ccb671c377 ("tools: fix x11 check")
noting that x11 was not a direct dependcy of Xen; it was transitive through
SDL for Qemu for source-based distros.

These days its only the Debian based dockerfiles which install xorg-x11, and
Qemu builds fine in these and others without x11.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This in particular should shrink the size of the containers somewhat.
---
 README                                              | 1 -
 automation/build/debian/bookworm-arm64v8.dockerfile | 1 -
 automation/build/debian/bookworm-i386.dockerfile    | 1 -
 automation/build/debian/bookworm.dockerfile         | 1 -
 automation/build/debian/jessie-i386.dockerfile      | 1 -
 automation/build/debian/jessie.dockerfile           | 1 -
 automation/build/debian/stretch-i386.dockerfile     | 1 -
 automation/build/debian/stretch.dockerfile          | 1 -
 automation/build/ubuntu/bionic.dockerfile           | 1 -
 automation/build/ubuntu/focal.dockerfile            | 1 -
 automation/build/ubuntu/trusty.dockerfile           | 1 -
 automation/build/ubuntu/xenial.dockerfile           | 1 -
 12 files changed, 12 deletions(-)

diff --git a/README b/README
index bf6b8cd4d658..560247e7103c 100644
--- a/README
+++ b/README
@@ -52,7 +52,6 @@ provided by your OS distributor:
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
-    * Development install of x11 (e.g. xorg-x11-dev)
     * Development install of uuid (e.g. uuid-dev)
     * Development install of yajl (e.g. libyajl-dev)
     * Development install of libaio (e.g. libaio-dev) version 0.3.107 or
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
index a36b04e75e95..11acc07bff0e 100644
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python3-dev \
         python3-setuptools \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
index 2ccf32193f26..66fa3121c54e 100644
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ b/automation/build/debian/bookworm-i386.dockerfile
@@ -19,7 +19,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python3-dev \
         python3-setuptools \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index d02e3df61f76..db866fde3074 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python3-dev \
         python3-setuptools \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index d66d0692029b..dfa6dae06cb8 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -25,7 +25,6 @@ RUN apt-get update && \
         zlib1g-dev \
         libncurses5-dev \
         python-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 53c3bb28f175..82dae9ec70c4 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -23,7 +23,6 @@ RUN apt-get update && \
         zlib1g-dev \
         libncurses5-dev \
         python-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index 36108335e5c7..905096ab0ef1 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -26,7 +26,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python-dev \
         python3-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index c5339d3c835f..b99d229acf14 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -24,7 +24,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python-dev \
         python3-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index c83624e8ca1e..c1effc725e17 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python-dev \
         python3-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index cabbebf37754..b49e53d185b4 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python3-dev \
         python3-setuptools \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index ecbcb71b1c21..1cda1bbd3fea 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python-dev \
         python3-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 13ecae7a0b81..aa8f560286b6 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         libncurses5-dev \
         python-dev \
         python3-dev \
-        xorg-dev \
         uuid-dev \
         libyajl-dev \
         libaio-dev \
-- 
2.39.2


