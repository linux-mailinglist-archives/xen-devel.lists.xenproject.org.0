Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E867EE079
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634149.989463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFX-0004MN-SC; Thu, 16 Nov 2023 12:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634149.989463; Thu, 16 Nov 2023 12:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFX-0004JF-O3; Thu, 16 Nov 2023 12:13:35 +0000
Received: by outflank-mailman (input) for mailman id 634149;
 Thu, 16 Nov 2023 12:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFV-0003ZM-Oe
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:33 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f9e50a9-8479-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 13:13:33 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40a48775c58so5886665e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:33 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o16-20020adfe810000000b0032326908972sm13472921wrm.17.2023.11.16.04.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:32 -0800 (PST)
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
X-Inumbo-ID: 8f9e50a9-8479-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136812; x=1700741612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0bmgl9yK7YH8+Hj03ggPyfIEX7PvitHOBp8VhTAhFU=;
        b=lErMVfPjCebdMH8ZrhWs3D0qAx0ECKrXj11C+k0NCUidAtZuf/9EUTyZTUyLOF02lN
         2GiQyB4VdiqdjyyIaFdDagXY4tbUoGZhDVZNwkpWj7Bs/nryQcSX8+bfe6qTBaevNI1k
         pnUgFbKgCtJUbwT5oWkxAa4p/T8vTN7yf9Rcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136812; x=1700741612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0bmgl9yK7YH8+Hj03ggPyfIEX7PvitHOBp8VhTAhFU=;
        b=pXsdZB3AmVIFg4C3DGyE4RT33znQibG+y2hcd1+j2ti8W267neRoNrsqbmDoHMSoaU
         TJTSDGHDc0BHl8HAjMEltz57xEROAjGVzP6rUxH5TAbkh+ofeVMqEVrLp7TjRZ+8jSHm
         dZ0wMaM+oUTflG+WFPEtAqILPq3QZiWZkqfhbImHnJT7aVyl/CLbtJHWHF0SyHwMkCcr
         qXnaAVWk3bHlwo9zHsm9HUR8MaMPau/n5GLd6L22HFuM3vHMX7js8w0NHVj2j6OabqkC
         OVkMA3O3fTHawlxSmHQpWYZMwOiUQ5TJj4mq7bxwZZHNQJNZLWKeGw+H+H+HIwr2uz0V
         //CA==
X-Gm-Message-State: AOJu0YyiIE1PoKYcGfeciK0K5Xfe5v802qEv8zpwym4ap8ST7VprXjKF
	ST8VNBO17/ll+qSltAp/GYh3ksknA7+iuhOXJ7U=
X-Google-Smtp-Source: AGHT+IETLbMti1Gyp8pApyF1dVt6a45SnxUHbphWpaGyU7mEM8/ccsOZ9Zl6ZDyB4U9b5STaukoGsw==
X-Received: by 2002:a05:600c:1e11:b0:408:3f61:cb4f with SMTP id ay17-20020a05600c1e1100b004083f61cb4fmr1633844wmb.23.1700136812534;
        Thu, 16 Nov 2023 04:13:32 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/6] automation: fix jessie/stretch images to use archive.debian.org apt repos
Date: Thu, 16 Nov 2023 13:13:07 +0100
Message-ID: <20231116121310.72210-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116121310.72210-1-roger.pau@citrix.com>
References: <20231116121310.72210-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise it's impossible to build the images.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/build/debian/jessie-i386.dockerfile  | 7 +++++++
 automation/build/debian/jessie.dockerfile       | 7 +++++++
 automation/build/debian/stretch-i386.dockerfile | 7 +++++++
 automation/build/debian/stretch.dockerfile      | 7 +++++++
 4 files changed, 28 insertions(+)

diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index c9ac15a3ffd6..a8dec82bb299 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -10,6 +10,13 @@ WORKDIR /build
 
 ENTRYPOINT ["linux32"]
 
+# replace repos in archive as release is EOL
+RUN cat <<"END" > /etc/apt/sources.list
+deb http://archive.debian.org/debian/ jessie main contrib non-free
+deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
+deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
+END
+
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 63b2c1e5b771..5c71c3e3ea75 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -8,6 +8,13 @@ ENV USER root
 RUN mkdir /build
 WORKDIR /build
 
+# replace repos in archive as release is EOL
+RUN cat <<"END" > /etc/apt/sources.list
+deb http://archive.debian.org/debian/ jessie main contrib non-free
+deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
+deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
+END
+
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index d93f74c979ef..9739651e25dd 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -10,6 +10,13 @@ WORKDIR /build
 
 ENTRYPOINT ["linux32"]
 
+# replace repos in archive as release is EOL
+RUN cat <<"END" > /etc/apt/sources.list
+deb http://archive.debian.org/debian/ stretch main contrib non-free
+deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
+deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
+END
+
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 1af6c691f8f4..2f1a99f45017 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -8,6 +8,13 @@ ENV USER root
 RUN mkdir /build
 WORKDIR /build
 
+# replace repos in archive as release is EOL
+RUN cat <<"END" > /etc/apt/sources.list
+deb http://archive.debian.org/debian/ stretch main contrib non-free
+deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
+deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
+END
+
 # build depends
 RUN apt-get update && \
     apt-get --quiet --yes install \
-- 
2.42.0


