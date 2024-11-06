Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213669BEF35
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831017.1246161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gEe-0001EG-9Q; Wed, 06 Nov 2024 13:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831017.1246161; Wed, 06 Nov 2024 13:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gEe-0001CA-6o; Wed, 06 Nov 2024 13:38:12 +0000
Received: by outflank-mailman (input) for mailman id 831017;
 Wed, 06 Nov 2024 13:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8gEd-00015Z-Jy
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:38:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b4d6f50-9c44-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:38:07 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9eaf93e40dso356109966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:38:07 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:05:25 -0800 (PST)
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
X-Inumbo-ID: 5b4d6f50-9c44-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjViNGQ2ZjUwLTljNDQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAwMjg3LjY5MTIwOCwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730900287; x=1731505087; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peW5Y0BE/jL0vQFydq7zr9i7yr2PvZQXqorRemV3er4=;
        b=km+GOEriso1AppnQLbfz/Mop2QcCUkeD6SlPWqyuuQqPg3BXxFhaf2+2CVehTh4X+v
         38SnEpjZE3GgSdXkCoeiYuGfuwWgj4vyrkaQbdlaQYU2cLBmw7QcwXSMyki0/klwb9TG
         k2UihkbWIOJoMMlSKv7NUiKr1RfoUcxZERTLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900287; x=1731505087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peW5Y0BE/jL0vQFydq7zr9i7yr2PvZQXqorRemV3er4=;
        b=R/dCREwzdSNh2I1gWAKCvGqb3nEMNMrrGtZDXkQ62IcLEkctP7rlpEk6muBmJMfEYI
         sKhXMwQXg3crb291UmnwIFRi9oO8qWDLg3z7pymGKc1/B8J+CdEVrXapmgkZNQteVBMK
         7zd6eTJltr9o9p4uRRm4d8K3zbi6kOcTwx/nNDmxXheAMpTlte0xFpFoaB7855MuKVp4
         NoaWE1v6YDWyuvsVkOA4rCBgO+3vJJn9mbQeKvY8j8wBlennrk7e0W/HdU8aw54OWBCg
         0uKnKPC6GWSDpTzvg8gLmW1spSgsmPsRCsCIe39Osx0iNbDo8L+xDZ+ho5Qmt11bDOIL
         l9gw==
X-Gm-Message-State: AOJu0YyE5ig0xu2FEAF7EngT44rJIo2VUaAJfIquqkjpL+HemV2aDE7V
	yKEDiir1ykPyHjl9VjRFFItdu2QEikSzq5l5Ln60MJNB6LPz4E5Vs9rztBnkhYFyo48PkJ5exF1
	QmoI=
X-Google-Smtp-Source: AGHT+IE4DeGUIKZP66PFcAsTbnGgrI+CzQUM2sfdqA9YjItR7oI4vwnPgzYyZ4Q2J7m6cPOM9oXRJw==
X-Received: by 2002:a2e:be20:0:b0:2fb:4951:172 with SMTP id 38308e7fff4ca-2fcbdf5f742mr181913701fa.2.1730898326619;
        Wed, 06 Nov 2024 05:05:26 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 6/6] CI: Don't use -y with apt-get update
Date: Wed,  6 Nov 2024 13:05:07 +0000
Message-ID: <67fbec9dd324802e1a1c5e3c38ae7853ede35e86.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730743077.git.javi.merino@cloud.com>
References: <cover.1730743077.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apt-get update refreshes the package lists.  -y doesn't do anything
here.  It is needed for "apt-get install" or "apt-get upgrade" but not
for apt-get update.  Drop it.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/debian/11-ppc64le.dockerfile        | 2 +-
 automation/build/debian/11-riscv64.dockerfile        | 2 +-
 automation/build/debian/12-ppc64le.dockerfile        | 2 +-
 automation/build/debian/12-riscv64.dockerfile        | 2 +-
 automation/build/debian/12-x86_64-gcc-ibt.dockerfile | 4 ++--
 automation/build/ubuntu/16.04-x86_64.dockerfile      | 2 +-
 automation/build/ubuntu/18.04-x86_64.dockerfile      | 2 +-
 automation/build/ubuntu/20.04-x86_64.dockerfile      | 2 +-
 automation/build/ubuntu/22.04-x86_64.dockerfile      | 2 +-
 automation/build/ubuntu/24.04-x86_64.dockerfile      | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/automation/build/debian/11-ppc64le.dockerfile b/automation/build/debian/11-ppc64le.dockerfile
index d846b670d02c..385a0a071db2 100644
--- a/automation/build/debian/11-ppc64le.dockerfile
+++ b/automation/build/debian/11-ppc64le.dockerfile
@@ -13,7 +13,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/debian/11-riscv64.dockerfile b/automation/build/debian/11-riscv64.dockerfile
index 1c99bc89ea1a..a55047c5019a 100644
--- a/automation/build/debian/11-riscv64.dockerfile
+++ b/automation/build/debian/11-riscv64.dockerfile
@@ -13,7 +13,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/debian/12-ppc64le.dockerfile b/automation/build/debian/12-ppc64le.dockerfile
index 1d5b486bb47f..da518aab4e10 100644
--- a/automation/build/debian/12-ppc64le.dockerfile
+++ b/automation/build/debian/12-ppc64le.dockerfile
@@ -13,7 +13,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/debian/12-riscv64.dockerfile b/automation/build/debian/12-riscv64.dockerfile
index 8d7233d6757d..bce8f1015f7c 100644
--- a/automation/build/debian/12-riscv64.dockerfile
+++ b/automation/build/debian/12-riscv64.dockerfile
@@ -13,7 +13,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/debian/12-x86_64-gcc-ibt.dockerfile b/automation/build/debian/12-x86_64-gcc-ibt.dockerfile
index 3ce60e7d9466..9b5d11fca648 100644
--- a/automation/build/debian/12-x86_64-gcc-ibt.dockerfile
+++ b/automation/build/debian/12-x86_64-gcc-ibt.dockerfile
@@ -6,7 +6,7 @@ ENV DEBIAN_FRONTEND=noninteractive
 RUN <<EOF
 #!/bin/bash
     set -e
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         bison
@@ -62,7 +62,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/ubuntu/16.04-x86_64.dockerfile b/automation/build/ubuntu/16.04-x86_64.dockerfile
index d8617bfade5e..9cc8ca89e8e0 100644
--- a/automation/build/ubuntu/16.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/16.04-x86_64.dockerfile
@@ -11,7 +11,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/ubuntu/18.04-x86_64.dockerfile b/automation/build/ubuntu/18.04-x86_64.dockerfile
index 336697ad954b..aefe52125a22 100644
--- a/automation/build/ubuntu/18.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/18.04-x86_64.dockerfile
@@ -11,7 +11,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/ubuntu/20.04-x86_64.dockerfile b/automation/build/ubuntu/20.04-x86_64.dockerfile
index 39fb297519ee..1ee20a13ac6b 100644
--- a/automation/build/ubuntu/20.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/20.04-x86_64.dockerfile
@@ -11,7 +11,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/ubuntu/22.04-x86_64.dockerfile b/automation/build/ubuntu/22.04-x86_64.dockerfile
index 6aa3c4d1881d..a9a9b84930fb 100644
--- a/automation/build/ubuntu/22.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/22.04-x86_64.dockerfile
@@ -11,7 +11,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
diff --git a/automation/build/ubuntu/24.04-x86_64.dockerfile b/automation/build/ubuntu/24.04-x86_64.dockerfile
index c46d152abf10..2005723b31ad 100644
--- a/automation/build/ubuntu/24.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/24.04-x86_64.dockerfile
@@ -11,7 +11,7 @@ RUN <<EOF
 
     useradd --create-home user
 
-    apt-get -y update
+    apt-get update
 
     DEPS=(
         # Xen
-- 
2.45.2


