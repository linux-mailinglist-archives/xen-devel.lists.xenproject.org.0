Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6889D92A5EC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 17:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755510.1163889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqVg-0000xG-GZ; Mon, 08 Jul 2024 15:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755510.1163889; Mon, 08 Jul 2024 15:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqVg-0000v9-Ds; Mon, 08 Jul 2024 15:42:36 +0000
Received: by outflank-mailman (input) for mailman id 755510;
 Mon, 08 Jul 2024 15:42:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQqVe-0000v3-JS
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 15:42:34 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b178b632-3d40-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 17:42:33 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57cd26347d3so5299492a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 08:42:33 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5907e4d79ddsm3381893a12.59.2024.07.08.08.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 08:42:31 -0700 (PDT)
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
X-Inumbo-ID: b178b632-3d40-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720453352; x=1721058152; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpSzRaFB0fZ0TNSXZMScz/AWRyqjkNxX2geM0jCaqzw=;
        b=gPqEmy/gSk/b09+Vk0ho1lIDa1ZDxJ1OYnh0se6ex2XAqwIH66EPQPJrpPQgMZeQmu
         YUtKNwTodMWdanYFL6DUqey8MAGcGQtklR28cAOlGQjYCTuzjxZFvBIxSpN/YLQK0nuN
         xpaGMrmtOwLfvTvRcKiIObuZeEWe9xleTBSYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720453352; x=1721058152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpSzRaFB0fZ0TNSXZMScz/AWRyqjkNxX2geM0jCaqzw=;
        b=tIKxLswbxJ2KqYiLp/cbw6zZ7VnKDynG36A8ofIwXyx2uTDpIhR69IET7tQornPgBk
         0I4zzB/8bP4m0astiYzZ1aUbOTYAsuIjYtYU6SnQzj0XREoNpYAtdNTXy2SyUfzRS5Ss
         /8BFHi3MO6H7UJnpdb3RSSX2n2MXhvFUx7o6HNPcgOVQS282QCLk4d6mlgBwFbwsUGJH
         Moci8Yk5JDX3T1488JV1DKXW/WXgNPwGowdWkGg1r60TM4sWfMN8iYhuX6qczMEZcDxF
         SYdUNE+q4xXpSeUPBhgSag5wS9Q2LFmCDwq7zq1WPxKirn8r/JUR6hbJC2aIWi7uMAYb
         OG7w==
X-Gm-Message-State: AOJu0Ywys31caXg+YzKXHkTeWl8PFMIo46eG+7ftvRg23RgT/xAGEx0p
	OCrkd+M2hsThAQk5EJ6c/NrYLtjoBPSaWjBBYpeQ5ZFPMuNpo6Tq1iUTOWMsC2w9PhDSsNCUA+d
	k
X-Google-Smtp-Source: AGHT+IH0WfQHhxfXIQ5guCqkazyKBGkhO0QqTiv+Tsdu0BtxNwCsBn9GaKp3J67xaPH/dfvzf7BXcg==
X-Received: by 2002:a05:6402:3583:b0:573:5c4f:27a8 with SMTP id 4fb4d7f45d1cf-58e5cd1222fmr8688472a12.35.1720453352282;
        Mon, 08 Jul 2024 08:42:32 -0700 (PDT)
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
Subject: [PATCH for-4.19 v2 3/6] CI: Refresh the Coverity Github Action configuration
Date: Mon,  8 Jul 2024 16:42:28 +0100
Message-Id: <20240708154228.2177924-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705152037.1920276-4-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update to Ubuntu 24.04, and checkout@v4 as v2 is deprecated.

The build step goes out of it's way to exclude docs and stubdom (but include
plain MiniOS), so disable those at the ./configure stage and simplify the
build step somewhat.

Refresh the package list.  libbz2-dev was in there twice, and e2fslibs-dev is
a a transitional package to libext2fs-dev.  I'm not aware of libtool ever
having been a Xen dependency.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v2:
 * Simplify the build step too.

https://github.com/andyhhp/xen/actions/runs/9840942508/job/27166367683 (manually
terminated with an exit 1 because there's no --dry-run mode.)
---
 .github/workflows/coverity.yml | 38 ++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 60ac8dee5570..2b601c5f9b89 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -8,27 +8,39 @@ on:
 
 jobs:
   coverity:
-    runs-on: ubuntu-22.04
+    runs-on: ubuntu-24.04
     steps:
     - name: Install build dependencies
       run: |
-        sudo apt-get install -y wget git gawk \
-          libbz2-dev build-essential \
-          zlib1g-dev libncurses5-dev iasl \
-          libbz2-dev e2fslibs-dev uuid-dev ocaml \
-          ocaml-findlib libyajl-dev \
-          autoconf libtool liblzma-dev \
-          python3-dev golang libsystemd-dev
+        sudo apt-get install -y \
+          build-essential \
+          git-core \
+          golang \
+          iasl \
+          libbz2-dev \
+          libext2fs-dev \
+          liblzma-dev \
+          libncurses5-dev \
+          libyajl-dev \
+          libzstd-dev \
+          ocaml \
+          ocaml-findlib \
+          python3-dev \
+          uuid-dev \
+          zlib1g-dev \
 
-    - uses: actions/checkout@v2
+    - uses: actions/checkout@v4
       with:
         ref: staging
 
     - name: Configure Xen
       run: |
-        ./configure --with-system-qemu=/bin/true \
-                    --with-system-seabios=/bin/true \
-                    --with-system-ovmf=/bin/true
+        ./configure \
+          --disable-docs \
+          --disable-stubdom \
+          --with-system-qemu=/bin/true \
+          --with-system-seabios=/bin/true \
+          --with-system-ovmf=/bin/true \
 
     - name: Pre build stuff
       run: |
@@ -36,7 +48,7 @@ jobs:
 
     - uses: vapier/coverity-scan-action@v1
       with:
-        command: make -j`nproc` build-xen build-tools && make -j`nproc` -C extras/mini-os/
+        command: make -j`nproc` build && make -j`nproc` -C extras/mini-os/
         project: XenProject
         email: ${{ secrets.COVERITY_SCAN_EMAIL }}
         token: ${{ secrets.COVERITY_SCAN_TOKEN }}
-- 
2.39.2


