Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13697A135EB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 09:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873344.1284316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLiQ-0004BQ-IJ; Thu, 16 Jan 2025 08:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873344.1284316; Thu, 16 Jan 2025 08:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYLiQ-00049E-EN; Thu, 16 Jan 2025 08:59:02 +0000
Received: by outflank-mailman (input) for mailman id 873344;
 Thu, 16 Jan 2025 08:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYLiP-0003um-Ic
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 08:59:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2014eea3-d3e8-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 09:58:59 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso594853f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 00:59:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383882sm20023637f8f.34.2025.01.16.00.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 00:58:58 -0800 (PST)
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
X-Inumbo-ID: 2014eea3-d3e8-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737017939; x=1737622739; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWuBh6NbZj0G7Aav5UDhxeeK6hgEHL+iGW447R+C6nc=;
        b=SyvRILaMg0F7QeQTsDyPFLXfj2h8xQ1JcKHFBNAXB7Gxtrc1TYSF+nCFhoNMN+sfPh
         3wUGSWfcdKMcN6wfD7CX3jA//zHUeuGFD1WYkB4bbC20Ts45BF60wssfCzkSnVcst5bu
         cvBPs9ChRJ0QglBA2Uyk07ET/wHKL6qeqvDPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737017939; x=1737622739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWuBh6NbZj0G7Aav5UDhxeeK6hgEHL+iGW447R+C6nc=;
        b=cw0gr4E6WH1R/5h96r9EeeVYAnQiG+et6TNeP83Wydxu7oh/bvTieHpYiyx0i0GyWn
         udU7dQugDzCdaON7mxVLGEwMll2PnE3fZYKohzDqhNGF09UtYpyahJoP55E4BqZjb9Qt
         z+QHUMl8+jhHY/4ugo1CXZZ0I7sKjsiX/4V2ZTb9W0Wu41KNSVubDPJAGP1rBj1e1wsk
         sOoAVtPT7/iY713e0VkHFvWTuxlBQgXCva0PFqJyKkg985RsnBiMH2qZ8DKF8LjQ0mlV
         2b3EdyckpVNscykvSSWS7QGCSzgssz3gO+NTs1FucF2q+Xa5AMJwAIyJ0LNnDtjhIPvB
         7uMQ==
X-Gm-Message-State: AOJu0Yz5oIMR88ewO2uFGaOtPGWkstcGQkk+YpRLvov/goaAxEI1oXdm
	QDIyALlByALJfl4tokln/gq5o0TD2K43AkwBpZUWpxerWse4ObGJmCR2chlV/lGPL4iguknNjaj
	6
X-Gm-Gg: ASbGncsD/GktMF2yVxq42OLpJRMtwk8SmhmmSkTaoq4O4BJxPGafXVavtd46LcKwFH0
	7Y6vebW0GkT4iTKa2nys0pblP5/fYiF3nAflDaQ4pFdztSg5SiZGtzPrtKYv91t4TFFg3Cdm1O9
	741lU/1pPZjB+gPVUxyA7sGsFozlgF1cuN7gOEYXeQct2A4MW5T0HturinLXu5fJPPp0I+c3Er1
	ivZeGYMrUX/SneT6lErlDL0mtee8c8pO0P4F0qbAZLQBu/49EC/BCDYiDGatqFLZzs=
X-Google-Smtp-Source: AGHT+IF4+4FlyXkEnXHTctrloTCmtrIYFnJLn9eEyputKWuDkHbUuyqvN0VEVtIOoYCqt1X0VCwIFw==
X-Received: by 2002:a5d:47c9:0:b0:385:f66a:4271 with SMTP id ffacd0b85a97d-38a872fbcefmr23189409f8f.4.1737017938641;
        Thu, 16 Jan 2025 00:58:58 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 2/2] automation/cirrus-ci: introduce FreeBSD randconfig builds
Date: Thu, 16 Jan 2025 09:58:51 +0100
Message-ID: <20250116085852.78273-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250116085852.78273-1-roger.pau@citrix.com>
References: <20250116085852.78273-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new randconfig job for each FreeBSD version.  This requires some
rework of the template so common parts can be shared between the full and
the randconfig builds.  Such randconfig builds are relevant because FreeBSD
is the only tested system that has a full non-GNU toolchain.

While there remove the stale `python` package install in the full build
case: this is no longer needed if `python311` is also specified.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 64 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index ee80152890f2..f3ea29102cbf 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,11 +1,24 @@
 # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
-freebsd_template: &FREEBSD_TEMPLATE
+freebsd_13: &FREEBSD_13
+  freebsd_instance:
+    image_family: freebsd-13-4
+freebsd_14: &FREEBSD_14
+  freebsd_instance:
+    image_family: freebsd-14-2
+freebsd_15: &FREEBSD_15
+  freebsd_instance:
+    image_family: freebsd-15-0-snap
+
+freebsd_template: &FREEBSD_ENV
   environment:
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
 
+freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
+  << : *FREEBSD_ENV
+
   install_script: pkg install -y seabios gmake ninja bash
-                                 pkgconf python bison perl5
+                                 pkgconf bison perl5
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git python311
 
@@ -15,20 +28,43 @@ freebsd_template: &FREEBSD_TEMPLATE
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
+freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
+  << : *FREEBSD_ENV
+
+  install_script: pkg install -y gmake python bison
+
+  build_script:
+    - cc --version
+    - gmake -j`sysctl -n hw.ncpu` -C xen clang=y \
+            KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
+    - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
+
 task:
-  name: 'FreeBSD 13'
-  freebsd_instance:
-    image_family: freebsd-13-4
-  << : *FREEBSD_TEMPLATE
+  name: 'FreeBSD 13: full build'
+  << : *FREEBSD_13
+  << : *FREEBSD_FULL_BUILD_TEMPLATE
 
 task:
-  name: 'FreeBSD 14'
-  freebsd_instance:
-    image_family: freebsd-14-2
-  << : *FREEBSD_TEMPLATE
+  name: 'FreeBSD 14: full build'
+  << : *FREEBSD_14
+  << : *FREEBSD_FULL_BUILD_TEMPLATE
 
 task:
-  name: 'FreeBSD 15'
-  freebsd_instance:
-    image_family: freebsd-15-0-snap
-  << : *FREEBSD_TEMPLATE
+  name: 'FreeBSD 15: full build'
+  << : *FREEBSD_15
+  << : *FREEBSD_FULL_BUILD_TEMPLATE
+
+task:
+  name: 'FreeBSD 13: randconfig'
+  << : *FREEBSD_13
+  << : *FREEBSD_RANDCONFIG_TEMPLATE
+
+task:
+  name: 'FreeBSD 14: randconfig'
+  << : *FREEBSD_14
+  << : *FREEBSD_RANDCONFIG_TEMPLATE
+
+task:
+  name: 'FreeBSD 15: randconfig'
+  << : *FREEBSD_15
+  << : *FREEBSD_RANDCONFIG_TEMPLATE
-- 
2.46.0


