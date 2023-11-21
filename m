Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93C7F3335
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637951.994124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THh-00037a-A1; Tue, 21 Nov 2023 16:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637951.994124; Tue, 21 Nov 2023 16:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THh-00035A-5N; Tue, 21 Nov 2023 16:07:33 +0000
Received: by outflank-mailman (input) for mailman id 637951;
 Tue, 21 Nov 2023 16:07:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THf-0002HT-Sj
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:31 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13103ef7-8888-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:07:31 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32deb2809daso3806328f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:31 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 s5-20020a5d6a85000000b0032d9f32b96csm14853384wru.62.2023.11.21.08.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:29 -0800 (PST)
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
X-Inumbo-ID: 13103ef7-8888-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582850; x=1701187650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zve9S/zNHdwBw2V30BXX0bI9hFa3laVbPQCXzgAwKZY=;
        b=azPRsnV+JIiizgLQB8SbiL3mOOeueurCv3iZiiR6VrU4dug2YnuvO+Wr5YxV005ZDs
         Lk4xRDgsdhr4EETJSxr3snmgiNovjeSfxQfwFhJ40UE5EuZ30dkWt2XucGnUzjINMgAr
         B4VQsmPxzUl3GZMktJ0tpgE7MzL6A0EslEU9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582850; x=1701187650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zve9S/zNHdwBw2V30BXX0bI9hFa3laVbPQCXzgAwKZY=;
        b=K3W+M4jfmuGB1mVLIsbXDSoU+dgl+hEsjA4pto/M9Tk/2qP2YNNJdrYJgLx30/lt+o
         sIW9zDSrx5QibXCJ4Mbo45bZLlfm0PuyLJcE2EMBn1+K3choGKGeMwlBjifxzJLQCU1f
         gCTnP0PDsmhmomfOcXjt4vi+Z6p4vHnl2M2eQxfJqN3qnAejVbbn830G7w8/YGcAmFV+
         sVaQSCJgpGuY2cghBgmNMhaALRxfngJCwxD64jO2fka4W5v3K7DK5Hzte7Ie3aX4uFwJ
         Yg8syDkE6B9x5p6QJ4rouKZ9EsLSSyaVdGJz33C0qxF6qYLedv8Xw/+7YyJWo2UzmBfa
         q/QA==
X-Gm-Message-State: AOJu0YxkU4EFtbQ2WKvTL0pyT8ocPMjHyyrvqY62ml38EDc91akB3LIU
	WR8yLDrjtWX+HFR1eybRDG0DFydf2yHiIoIw83s=
X-Google-Smtp-Source: AGHT+IErMobG9xL0h/z8EpKFSlRL3LMKoISqgo9hKlJGkrTges2KLrZlwxs2ppW3XLytsTXK8kRhYg==
X-Received: by 2002:adf:d1c3:0:b0:332:c60a:95b5 with SMTP id b3-20020adfd1c3000000b00332c60a95b5mr4203509wrd.54.1700582850088;
        Tue, 21 Nov 2023 08:07:30 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/7] automation: fix jessie/stretch images to use archive.debian.org apt repos
Date: Tue, 21 Nov 2023 17:03:55 +0100
Message-ID: <20231121160358.8080-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Otherwise it's impossible to build the images.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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


