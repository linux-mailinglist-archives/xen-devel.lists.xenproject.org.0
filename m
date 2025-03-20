Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D8A6A9A1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:21:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922518.1326426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhm-0000XW-DT; Thu, 20 Mar 2025 15:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922518.1326426; Thu, 20 Mar 2025 15:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhm-0000Rv-9I; Thu, 20 Mar 2025 15:21:10 +0000
Received: by outflank-mailman (input) for mailman id 922518;
 Thu, 20 Mar 2025 15:21:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvHhl-0000Nz-HA
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:21:09 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2bcf8e2-059e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:21:08 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so369632166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:21:08 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3149cffdasm1165959566b.117.2025.03.20.08.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:21:07 -0700 (PDT)
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
X-Inumbo-ID: f2bcf8e2-059e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484068; x=1743088868; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X0qYtTtABHw8MowEHTXklbqdS7We/e+J6NalhnMJv0=;
        b=PDaQtjqz5qJodDcp/jIVe3iz3mHSianQbMvgaFK4Sm00iSJ325Ohf1R9aOnXEaYjVq
         Q+mblCODNqY27Qxg6ogA77ABBVFixThFbJghGWZ2GsasxG13RfrVUaSsyP1Wldwy9/ZD
         +9a4Brt08Mn0v/ohzFmTw+dxiCByaJbaLVvqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484068; x=1743088868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X0qYtTtABHw8MowEHTXklbqdS7We/e+J6NalhnMJv0=;
        b=r6M1IsLjxrwSLrj1DjyoI+NFHFh/oFUe6JhnCF5E5Jb1iDohXoa2N9WDNQvA5xSvOU
         r8tNnJF+2YggKGPOgsY/HR+zTKqJeZ4oaOcF1fnyw1mfElg1A4KlmPKmYACgqoN/ZkBx
         j4WMzhsb7jA31Cekfq2WcWR5Q0a7xV2b+5LfLC3jWOYadES6n6bQ/WLQW/7OqC0zTegh
         Qsi9xiF+EcHE5q7ZYPO0Pi6M9fPAftdM5JzV/8CoDVtuAbPVRV5ieZ+b2LKLhhACuEyL
         kEIWT1ezJGEpwve5kD8PD1XvFL7WWRMHMLLWL3fhTd+TTJtRqtsqPf7xmEYCVFHgwb4k
         4eBA==
X-Gm-Message-State: AOJu0YxAULraQ2XLoP75gQJJVqwNJo4M6JgFRJkmuQHeeUDAG2uEJ9o7
	77ZL71L+rFjrohNiLS6PBb8IDzItbAVdgIk5WA36pAoJytw4xGF7P9iqnfaW4i7szDAC5mOZ9Mn
	N
X-Gm-Gg: ASbGncuqmwvb5aV2AyEB0/sr8XuENj8Fr3MHMy+LswSV/RLPjwQvzRT/To/ZQ9wmjRC
	lK/SJs2NAW8hcrcm42gq+Z3mWQAB4/wc0V2w9Wc+UUrG83PqMzTOS7NH7D0qMJUE5NTiBM0zoI6
	qrt0QXjJSabVdJ4moIPKWy/R6/+1ZHhVahqYA4bSGrvQZp5jxxyjZQsaTxe1nVJmXuJ3i5uCJIe
	P4EPQMhIEROXnc9PghXrX+VZhBl7MGBAvpAsUKmG9M3T0oZnD8tIkYw8GdwzFVm3ZjvZgiVGZ1F
	boJJcu4R1VAu9fFSl3zWqiN20G75mt/vsYalSizPmcgjFoaFbg==
X-Google-Smtp-Source: AGHT+IHzn2bikDVGhfevnafbAr5Ufv4v8b2QvTd8dhMPyFkjAo5/pNTccKeQUlhbWBc8FLEza3g6Wg==
X-Received: by 2002:a17:907:6d21:b0:ac2:32a:ee2f with SMTP id a640c23a62f3a-ac3cdf883e6mr317505366b.17.1742484067519;
        Thu, 20 Mar 2025 08:21:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/4] automation/cirrus-ci: use matrix keyword to generate per-version build tasks
Date: Thu, 20 Mar 2025 16:20:17 +0100
Message-ID: <20250320152020.88526-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320152020.88526-1-roger.pau@citrix.com>
References: <20250320152020.88526-1-roger.pau@citrix.com>
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
Changes since v1:
 - Use FreeBSD_{LEGACY,PRODUCTION,CURRENT} to refer to development release,
   current release, and current release - 1.
---
 .cirrus.yml | 78 +++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 41 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 490f214f0460..95d2d2d3db2e 100644
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
+    FREEBSD_LEGACY:     freebsd-13-5
+    FREEBSD_PRODUCTION: freebsd-14-2
+    FREEBSD_CURRENT:    freebsd-15-0-snap
 
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
+      FREEBSD_VERSION: $FREEBSD_LEGACY
+      FREEBSD_VERSION: $FREEBSD_PRODUCTION
+      FREEBSD_VERSION: $FREEBSD_CURRENT
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
+      image_family: $FREEBSD_LEGACY
+      image_family: $FREEBSD_PRODUCTION
+      image_family: $FREEBSD_CURRENT
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


