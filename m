Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B23BBA64E97
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916764.1321812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Sx-0007SN-Ca; Mon, 17 Mar 2025 12:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916764.1321812; Mon, 17 Mar 2025 12:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Sx-0007QR-9L; Mon, 17 Mar 2025 12:21:11 +0000
Received: by outflank-mailman (input) for mailman id 916764;
 Mon, 17 Mar 2025 12:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9Op-0000kV-0P
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:16:55 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b64d7557-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:16:54 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-225fbdfc17dso21339335ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-737115511f3sm7690950b3a.55.2025.03.17.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:16:51 -0700 (PDT)
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
X-Inumbo-ID: b64d7557-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213812; x=1742818612; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX8IrmOnO/Mqfj+9j1/LqPJTY9srk7N80PH03XyLFjw=;
        b=csVc16NRWkyi0DO17uS2hmLpttaHLy4zpxko1aGoTaybIxVJBpMrfjEGzLshK0jD8G
         DAtn1cwtviyNj+gqqP/esD7ppOT/apl9/iOEDRrUgiWaUUDm6CVZgGCCpQGev0HulMKA
         BCoepPP5NBhdJJojX6gnWFi1ZAoM2SZ8rFyyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213812; x=1742818612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EX8IrmOnO/Mqfj+9j1/LqPJTY9srk7N80PH03XyLFjw=;
        b=uqZBNSSGpUcnsRq5PaU1smbYZCwFyjUecEfmmH6nP6iyNxyj4eu8aRDkNiINmhkoGq
         hCcodS6EybM4com008OF5tyYW4JXc2VsRnW0GqRQ+bDbKHDF/4P5i0ElmHQOL9VHtKEc
         68AT2GWqoIzrr3aE2q/IwL7B7xSsMvtaKUIKwxaYwtQ2vOZ3HlQxjkXoAql+f7zGgEVU
         3jUhxpSdzPXVpHT10PqHkOH2ULAH6DOg2UYbL07eMRf3PykEQwxtIpL8of2oOmY4sqj4
         PFi63xv90F8NYS1YhPcujuGSutsi5pe4919lqizyuGLUpwpvmvzLYwrWLa7FegyDpR4j
         pVQg==
X-Gm-Message-State: AOJu0YwVfkFWbVyH1JsmburXUyqJ1Ta91QDgcbdx6dDy+wnsKTyzeRzP
	e7/odDyosd69DDSf/wG7VEqet17kRA8e7AaMTEySjDM3/s3b/giROyTeYAfHT402kufetZ4h0g4
	r
X-Gm-Gg: ASbGnctM6pI2izEZkveOBKXrDCYuVnv5Xz019KAVOAgIMIWeydTsagDjhttsHzGvVbf
	Kq8DwNZIioITVCGWY47Bm9Lv6ssRDJztnwt2mK7hVzQEfmAa13Ee271GF/P1nt31YSpyq6EVO9x
	F5L9NlWfSo1cC5P0ystJXKxwtCbraQ25aXCpsm5jX2g1wXKqiRD7lrY7iP6qdZKlhofIJPSBSyQ
	XHg682qxKP2n9kEHbtafU+xZtTKCbfl/XFobXcF1RGNxTmbg12XhAQh0LWLHegrlcKRqIZe+WzG
	2UjrntKw9uu7fRzMQwHwLzWDG/RnOxmAUgXIWD8EkOBicOJr6A8arRs=
X-Google-Smtp-Source: AGHT+IFrjdjdimcSXRB6aWsYlSOCLKChVlTGv1m2iDP52fe9oYmhxN7d5chkgEvfdMW5iEAVhpmb0Q==
X-Received: by 2002:a05:6a00:929e:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-7372238f6e7mr14725697b3a.7.1742213812002;
        Mon, 17 Mar 2025 05:16:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/8] automation/cirrus-ci: use matrix keyword to generate per-version build tasks
Date: Mon, 17 Mar 2025 13:16:12 +0100
Message-ID: <20250317121616.40687-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the current logic to use the matrix keyword to generate a task for
each version of FreeBSD we want to build Xen on.  The matrix keyword
however cannot be used in YAML aliases, so it needs to be explicitly used
inside of each task, which creates a bit of duplication.  At least abstract
the FreeBSD minor version numbers to avoid repetition of image names.

Note that the full build uses matrix over an env variable instead of using
it directly in image_family.  This is so that the alias can also be set
based on the FreeBSD version, in preparation for adding further tasks that
will depend on the full build having finished.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I could alternatively name FREEBSD_15 FREEBSD_CURRENT or FREEBSD_HEAD or
something versionless, however I don't know about the other versions.

Assuming there will only be 3 versions tested at all times I could use:
FREEBSD_HEAD, FREEBSD_PRODUCTION and FREEBSD_LEGACY, as to avoid having to
specify versions in the task definitions.
---
 .cirrus.yml | 78 +++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 41 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 490f214f0460..bda4dbe86a7c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -1,13 +1,9 @@
 # https://cirrus-ci.org/guide/tips-and-tricks/#sharing-configuration-between-tasks
-freebsd_13: &FREEBSD_13
-  freebsd_instance:
-    image_family: freebsd-13-5
-freebsd_14: &FREEBSD_14
-  freebsd_instance:
-    image_family: freebsd-14-2
-freebsd_15: &FREEBSD_15
-  freebsd_instance:
-    image_family: freebsd-15-0-snap
+freebsd_versions: &FREEBSD_VERSIONS
+  env:
+    FREEBSD_13: freebsd-13-5
+    FREEBSD_14: freebsd-14-2
+    FREEBSD_15: freebsd-15-0-snap
 
 freebsd_template: &FREEBSD_ENV
   environment:
@@ -24,7 +20,24 @@ freebsd_configure_artifacts: &FREEBSD_CONFIGURE_ARTIFACTS
       path: xen-config
       type: text/plain
 
-freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
+task:
+  name: 'FreeBSD: full build'
+
+  # It's not possible to use the matrix keyword in YAML aliases, as they
+  # keyword usage is restricted to task, docker_builder or pipe.  Attempting to
+  # use a YAML alias with the duplicated keys doesn't work either. Use an env
+  # variable so the version can also be appended to the task alias.
+  << : *FREEBSD_VERSIONS
+  env:
+    matrix:
+      FREEBSD_VERSION: $FREEBSD_13
+      FREEBSD_VERSION: $FREEBSD_14
+      FREEBSD_VERSION: $FREEBSD_15
+
+  alias: freebsd_full_$FREEBSD_VERSION
+  freebsd_instance:
+    image_family: $FREEBSD_VERSION
+
   << : *FREEBSD_ENV
 
   install_script: pkg install -y seabios gmake ninja bash
@@ -42,7 +55,20 @@ freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
   build_script:
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
-freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
+task:
+  name: 'FreeBSD: randconfig build'
+
+  # It's not possible to use the matrix keyword in YAML aliases, as they
+  # keyword usage is restricted to task, docker_builder or pipe.  Attempting to
+  # use a YAML alias with the duplicated `image_family` keys doesn't work
+  # either. Abstract the version numbers at least.
+  << : *FREEBSD_VERSIONS
+  freebsd_instance:
+    matrix:
+      image_family: $FREEBSD_13
+      image_family: $FREEBSD_14
+      image_family: $FREEBSD_15
+
   << : *FREEBSD_ENV
 
   install_script: pkg install -y gmake python3 bison
@@ -56,33 +82,3 @@ freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
 
   build_script:
     - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
-
-task:
-  name: 'FreeBSD 13: full build'
-  << : *FREEBSD_13
-  << : *FREEBSD_FULL_BUILD_TEMPLATE
-
-task:
-  name: 'FreeBSD 14: full build'
-  << : *FREEBSD_14
-  << : *FREEBSD_FULL_BUILD_TEMPLATE
-
-task:
-  name: 'FreeBSD 15: full build'
-  << : *FREEBSD_15
-  << : *FREEBSD_FULL_BUILD_TEMPLATE
-
-task:
-  name: 'FreeBSD 13: randconfig'
-  << : *FREEBSD_13
-  << : *FREEBSD_RANDCONFIG_TEMPLATE
-
-task:
-  name: 'FreeBSD 14: randconfig'
-  << : *FREEBSD_14
-  << : *FREEBSD_RANDCONFIG_TEMPLATE
-
-task:
-  name: 'FreeBSD 15: randconfig'
-  << : *FREEBSD_15
-  << : *FREEBSD_RANDCONFIG_TEMPLATE
-- 
2.48.1


