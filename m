Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DB926344
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753084.1161363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qC-0004RX-QT; Wed, 03 Jul 2024 14:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753084.1161363; Wed, 03 Jul 2024 14:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qC-0004NU-KE; Wed, 03 Jul 2024 14:20:12 +0000
Received: by outflank-mailman (input) for mailman id 753084;
 Wed, 03 Jul 2024 14:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP0qB-00047x-2S
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:20:11 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a70b626-3947-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 16:20:09 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57cc30eaf0aso1869514a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:20:09 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm7114707a12.34.2024.07.03.07.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:20:08 -0700 (PDT)
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
X-Inumbo-ID: 5a70b626-3947-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720016408; x=1720621208; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvtNDTqYHADux5W5ocofKnMkBGfiU5QPPfJXj51wIBM=;
        b=drRurYpwNJGU6MJwYl6R5wMUD9WD7/Vh0m5hYhEArAyEU7VCitn54X8CN4evLigLd+
         e9Qmetaa/rys/BaIIbOGfn6Pg/TLX6pmvDxWJa8Mbtiip608nG45Suomk07kDqbmF/Dp
         IFTi1npCjdyOREi1tnziGuu+Qf7KdL4CXdzgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720016408; x=1720621208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvtNDTqYHADux5W5ocofKnMkBGfiU5QPPfJXj51wIBM=;
        b=qfsd/oAHfilIKvk4QPox1bmEu3cFWQa4XdLdtsXQL7N51mSYCubCEZd0sT7caKY1qw
         3u+O0a3QVkeYm+XA7JYKimzhkS1IO0XH54kao+FpdutkwaFKoeULiPESGbBoGvDaylU1
         2ljDP7tAys6h7BOCfZE8I7Pw/AplDGceDr3Bq9oPWmBd+41jny2pJQ8pRitWR7kiYUib
         pIOTtVoAADTzn6bpJGYcTrONUW95UUXd6EFtog7PEpzyLBeB8ugLKW7S1HHM7Eo8tP2B
         9yiiqfUKBSVuucOGFb/IGky9M2V097EoOu0y8nnZyCa/DGISrFSsuLnHTtM8PZ/4qsOQ
         378g==
X-Gm-Message-State: AOJu0YwXnJVYj+UDNCgR9liARUgrlS16ipWtmjFHbNyRqT2wI7JnPV9X
	GFw9a/NXevQvT7CPAwm3bNzzBohHmlGFqW7rBqT8c5gxf9NT1XWKOuFynsZfJDStPJ0O9slmqjq
	3H64=
X-Google-Smtp-Source: AGHT+IFqmUSdJZCkTH4i1WdxPdXjaDXOvrWfDnUPTz+/TvaNRmkBILQn52UweyaMVG0TeClF2LUWeQ==
X-Received: by 2002:a05:6402:5203:b0:57d:1696:fd14 with SMTP id 4fb4d7f45d1cf-5879ede2704mr11274311a12.8.1720016408500;
        Wed, 03 Jul 2024 07:20:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 2/4] CI: Adjust the usage of inline files
Date: Wed,  3 Jul 2024 15:20:00 +0100
Message-Id: <20240703142002.1662874-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per:

  https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/reference.md#here-documents

For inline files, use COPY with a heredoc, rather than opencoding it through
/bin/sh.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/debian/jessie-i386.dockerfile  | 2 +-
 automation/build/debian/jessie.dockerfile       | 2 +-
 automation/build/debian/stretch-i386.dockerfile | 2 +-
 automation/build/debian/stretch.dockerfile      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index f6eaa94ee523..1eb7ff11c7d3 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -12,7 +12,7 @@ WORKDIR /build
 ENTRYPOINT ["linux32"]
 
 # replace repos in archive as release is EOL
-RUN cat <<"END" > /etc/apt/sources.list
+COPY <<"END" /etc/apt/sources.list
 deb http://archive.debian.org/debian/ jessie main contrib non-free
 deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
 deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index a870e743fcaf..4c0ffe66f8fe 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -10,7 +10,7 @@ RUN mkdir /build
 WORKDIR /build
 
 # replace repos in archive as release is EOL
-RUN cat <<"END" > /etc/apt/sources.list
+COPY <<"END" /etc/apt/sources.list
 deb http://archive.debian.org/debian/ jessie main contrib non-free
 deb http://archive.debian.org/debian/ jessie-backports main contrib non-free
 deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index ad8db692aaf2..8ec9c3a24667 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -12,7 +12,7 @@ WORKDIR /build
 ENTRYPOINT ["linux32"]
 
 # replace repos in archive as release is EOL
-RUN cat <<"END" > /etc/apt/sources.list
+COPY <<"END" /etc/apt/sources.list
 deb http://archive.debian.org/debian/ stretch main contrib non-free
 deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
 deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 4dfd40b54277..2db4552662de 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -10,7 +10,7 @@ RUN mkdir /build
 WORKDIR /build
 
 # replace repos in archive as release is EOL
-RUN cat <<"END" > /etc/apt/sources.list
+COPY <<"END" /etc/apt/sources.list
 deb http://archive.debian.org/debian/ stretch main contrib non-free
 deb http://archive.debian.org/debian/ stretch-backports main contrib non-free
 deb http://archive.debian.org/debian-security/ stretch/updates main contrib non-free
-- 
2.39.2


