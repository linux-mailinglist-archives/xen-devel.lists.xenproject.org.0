Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8893A13B79
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 15:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873606.1284613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQPq-0000Ny-Ur; Thu, 16 Jan 2025 14:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873606.1284613; Thu, 16 Jan 2025 14:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQPq-0000L6-SD; Thu, 16 Jan 2025 14:00:10 +0000
Received: by outflank-mailman (input) for mailman id 873606;
 Thu, 16 Jan 2025 14:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PV9y=UI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYQPp-0000Kw-Fm
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 14:00:09 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30f58cec-d412-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 15:00:06 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso1359346a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 06:00:06 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95b09b2sm925387266b.146.2025.01.16.06.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 06:00:05 -0800 (PST)
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
X-Inumbo-ID: 30f58cec-d412-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737036006; x=1737640806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt5tZUxfG2TMA2CB2W1W3RklLqcWU+NHY2yBLyCbl7Q=;
        b=pE2lmswfRKU0rbCCiIuRyryaDyk7F0GHycpvJEWP0i6V59nbSVoExjPPuAcJEo3Sy7
         dHJSugvGxMXeeSTOEXtt1K+ttGAN4jeqnkWSd9ZBFN8iOCJBhPE7MFGy0tqlIFvORckx
         UtNFm/WCnCmaUGKyBZDKH9zYRaX0U/qCCkywg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036006; x=1737640806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt5tZUxfG2TMA2CB2W1W3RklLqcWU+NHY2yBLyCbl7Q=;
        b=LqicrjggXAGPNAS1IlH5KR6AdNTnbO4kAeKRBilxEqO2uhYS/ZDoTcdvHSDsxLqe46
         cS6Y2LjWFgJxQcoDeA6zmV18IZCWdWBOeHvsu8iPn09j+6DVcMpcxg+tH/5HBftLyYwc
         MYxFfqvmPINsA5Ho7T05BkLlt0g4xXfQRyeVxls//yJSQ5Ol+RY5WvudHCE5h3+ssIHq
         gx1FksJrN7+yQ0oPOp0OYGziqC5uHn0+cCuWyy5xC5uRQEWrtvYIub2aTiBrRkZCfBuK
         5SwJNVmdCnbUe0niSeQ0mf2xXyS3k5ix058Va1qU9YYJExm3GVBZrlCN9zAqmbuG2Wfn
         lbtQ==
X-Gm-Message-State: AOJu0YyiDQm679JEaGpCv+DAQTJoOVffSvYtuz/Ko3c+3hFqkSMX+ZvU
	lZEY64YtKIxX+oWhHpmrAXM4Di3+260WTRTJrJyNbPedHUfy/wD5go4wIXDg2cwPsZyLDu8VHZB
	m
X-Gm-Gg: ASbGncsjqyS8DsOoGyQTlZQt0j9bDqUI0IzTrZw3JL7n7YFqbiTtwBycAtsbvm/UE3i
	01g/vejTdah3PWm95jtbyTs/wVgx9ctleRGHtYpVlb7YJjujcWnZB29f8eSpeAI0wS15FF4/XvB
	ubZMUfQCFt1BZk1Sl/B6HVPA6+FyRy1lNLtq7xtBBaloA9RQAlIAVJL3QEspbCJJPFBg7CZ73ay
	Otz66sWmCRxHjHZPSMVrrfAh0GqWPUfD3cQqwVCB2Vg8vjBLxXSM6R5mNf9eA==
X-Google-Smtp-Source: AGHT+IEboO17plnsAbiFBo3crdNvP5rGg2eOQ55fSCqSCS10u6Da+mHBa2rkD2GfhU94TOK+fO1aBQ==
X-Received: by 2002:a17:907:968e:b0:aa6:7662:c56d with SMTP id a640c23a62f3a-ab2ab709415mr3117921766b.30.1737036005690;
        Thu, 16 Jan 2025 06:00:05 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 v2 2/2] automation/cirrus-ci: introduce FreeBSD randconfig builds
Date: Thu, 16 Jan 2025 14:59:57 +0100
Message-ID: <20250116135957.80826-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <Z4j4s-1iK2CH4ssK@macbook.local>
References: <Z4j4s-1iK2CH4ssK@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new randconfig job for each FreeBSD version.  This requires some
rework of the template so common parts can be shared between the full and
the randconfig builds.  Such randconfig builds are relevant because FreeBSD
is the only tested system that has a full non-GNU toolchain.

While there replace the usage of the python311 package with python3, which is
already using 3.11, and remove the install of the plain python package for full
builds.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 67 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 16 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index ee80152890f2..7216729b6993 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,34 +1,69 @@
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
-                                 libxml2 glib git python311
+                                 libxml2 glib git python3
 
   build_script:
     - cc --version
-    - export PYTHON=/usr/local/bin/python3.11
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
+freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
+  << : *FREEBSD_ENV
+
+  install_script: pkg install -y gmake python3 bison
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


