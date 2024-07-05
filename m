Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD48928B86
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754380.1162812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkk4-0000hJ-UN; Fri, 05 Jul 2024 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754380.1162812; Fri, 05 Jul 2024 15:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkk4-0000eE-Qr; Fri, 05 Jul 2024 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 754380;
 Fri, 05 Jul 2024 15:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkk3-00005r-GL
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:20:55 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b806a58-3ae2-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 17:20:54 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77cc73d35fso128052866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:20:53 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c8ad6c6esm78100366b.49.2024.07.05.08.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:20:50 -0700 (PDT)
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
X-Inumbo-ID: 2b806a58-3ae2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192852; x=1720797652; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RsY7qHLBDpmN5RBhIFj+m8bA6KpQJwlop/AqMRUPys=;
        b=Xfff/cU/BebwGydq29rDiWpeICpYMNiaW0tb94/6T9WRea35zU5L7BMysbSC95I/Dg
         OW/zEhggVzrC3VCreqjX/wQvRwlosZddlGeeIgqubmabAr6KMl38XrItJagfn6quqax8
         GcezK4EbrHOesMZ/mxJ+thdYoD1SyqwU5m2qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192852; x=1720797652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RsY7qHLBDpmN5RBhIFj+m8bA6KpQJwlop/AqMRUPys=;
        b=BgKCTibr9Yu/3qaJXvQLsDZ3Es7wAkj5RuPyy+5BHCRebX0mChK3jXD0p8wLcZ+2Ay
         4IWhTDWjPgyMr597q7ckgluL188OtIgpF8ZqlaQPIAF5toPFKkr7bkNxRwJUWi5WfbDv
         8OEoEIbmET+agqjLRIu1ltBmi+52WiwRhYBC727dMIhb0CWBm5cQK+HN2zJGfrSvsqGy
         eddmY5YDpnghpANMTbVfjstEnreE0X2zNPGYqvVzksv4E0o7oH0T/ZOTNlXyguuhzpFn
         7psK8OkhmXQbOC307ub5BCOsnVl0Bf/5BwZBaN63nCJzXuwyDZWOsWqjxe2KWRIDtmm5
         zCMQ==
X-Gm-Message-State: AOJu0YwR9iQKoZOZ+6ie5Z1C9iObsNHIkt81ahHO/GSWthrrTsAmzc1K
	Ro9j1ObIOT40TlpJ5EXURhiU1/pKEbGSnFTGjRsoG2NCQrX1zmhUrwsCHrThfzAXLWHMc52C7r2
	S
X-Google-Smtp-Source: AGHT+IEUqicLhTF2Vy7ebyBcpumBY34rI/HzX0ZtYduWTO6rLzH+96/Ci2l71kCnHj9CWuF107L6gQ==
X-Received: by 2002:a17:906:2b15:b0:a77:cdae:6a59 with SMTP id a640c23a62f3a-a77cdae6ab2mr166683766b.21.1720192852558;
        Fri, 05 Jul 2024 08:20:52 -0700 (PDT)
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
Subject: [PATCH for-4.19 3/6] CI: Refresh the Coverity Github Action configuration
Date: Fri,  5 Jul 2024 16:20:34 +0100
Message-Id: <20240705152037.1920276-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update to Ubuntu 24.04, and checkout@v4 as v2 is deprecated.

The build step goes out of it's way to exclude docs and stubdom (but include
plain MiniOS), so disable those at the ./configure stage.

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
---
 .github/workflows/coverity.yml | 36 ++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 60ac8dee5570..984636eb4635 100644
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
-- 
2.39.2


