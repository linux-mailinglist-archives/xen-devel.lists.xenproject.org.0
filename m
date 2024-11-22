Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86D9D6293
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 17:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841979.1257446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEWsC-0004Cm-FT; Fri, 22 Nov 2024 16:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841979.1257446; Fri, 22 Nov 2024 16:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEWsC-0004Ak-Ch; Fri, 22 Nov 2024 16:51:12 +0000
Received: by outflank-mailman (input) for mailman id 841979;
 Fri, 22 Nov 2024 16:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIkc=SR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tEWsA-0004AY-Pb
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 16:51:10 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f76e8385-a8f1-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 17:51:06 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9ed49ec0f1so381875166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 08:51:06 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b28f8a1sm118743866b.41.2024.11.22.08.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 08:51:04 -0800 (PST)
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
X-Inumbo-ID: f76e8385-a8f1-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY3NmU4Mzg1LWE4ZjEtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjk0MjY2LjUyMTQ1NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732294265; x=1732899065; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=81E9chfxVe/haFwsGpGAYWMCWngQMTzLIgGBkui4lPg=;
        b=kQ8VcNAt6ew0at402QRPYhjeto0145A2UCIQiz/mxrh05Ch1QkRJJgOLy1zhrwyObi
         5GfJbwTtWd6yS3Ojh9EFeu3HrZExOg7Rm2H3FvCTz3D8RR75nKleW9DU0i0ieD+XjpQH
         lX9n33IbbymC2iLyP6DZDnckV6sEuRQV+hGSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294265; x=1732899065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81E9chfxVe/haFwsGpGAYWMCWngQMTzLIgGBkui4lPg=;
        b=lR0OsWBIwYMARZ2cbMxgin4yK7Vhl2159Ye6ZhH2UV07G/6om8Vzv6vxF+tTlWTFl+
         cfVxUBoWDq8eQA4bOptduxrcPwXGVvvORo4hRJmNISSR7EvwndkwKuIIgugxglT2dFgf
         85ucwxfRAgtuhWsz8KG1Iqn1mQSUgtDSKibv1aCLhwSxCsvsfwyqfLK1P/b2VCjjqelA
         uQH49Jt2wuKi4xCL0ccE+gr4L5mjMWyznjeML1vW2uoyRhOm01jCEwn+1BYg3Y3R56qE
         m24e083eJcUQJdoXFAtwG42fIvsGXMT4z+MBoGkL6kt64yySF/4Ef/ji7uE7JJSDSKQn
         Jf2w==
X-Gm-Message-State: AOJu0Yyr+iwZ5Ds3pVoUPJb7F1+DeTdJF+KuD70Mn81iNUacEAOXj4eC
	0KcEIBiHO1QcHMKeoXnG5Y9cvkj89dMSV89FzbZUD7U9UphM413IfKpIqlyfjf15Yr6cJiVMzi8
	C
X-Gm-Gg: ASbGncs4ZDD9GOZQeryBIoRzIEPZRjQt1NuOjeTXJNOin3D7/DMsRplKtePnrzOOtQw
	hP93dgX06DTSL54XBzT1QZuNU9xS/IOLlDFSWWel1mHzgBO8RxCqwUZxBza4slr4xSa6fgJ1ERk
	1sqG7Lh6Ztj7VoXuDIeOEi79qT6G1uO8Z8DVOWU6ot3oFaK4EYgntlghOVokQXbINf7FGZmoHrB
	ggOjsHQyBtGCsO7AOt9cYKQ3UGstza0+UVwRVS8l6/ut+vl05FCrpvu5CBoXkrW9hSHt6Lhz9dl
X-Google-Smtp-Source: AGHT+IEyKZi7aOMN1UcA6IIzOe+i6MNwwZgL1QrkGh7fEy+e6RoCOwlRo4gnUlUSXBo2D8ImLkRMfA==
X-Received: by 2002:a17:906:314c:b0:a9a:2a56:91e with SMTP id a640c23a62f3a-aa509975d39mr288237666b.6.1732294265581;
        Fri, 22 Nov 2024 08:51:05 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] docs/sphinx: Refresh config for newer Sphinx
Date: Fri, 22 Nov 2024 16:51:02 +0000
Message-Id: <20241122165102.3240758-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sphinx 5.0 and newer objects to language = None.  Switch to 'en'.

Also update the copyright year.  Use %Y to avoid this problem in the future,
and provide compatibility for versions of Sphinx prior to 8.1 which don't
support the syntax.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

This is in prepartion to get a Gitlab CI docs job, and to activate Sphinx's
-Werror equivelent.
---
 docs/conf.py | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 50e41501db8f..5d2e97944900 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -3,9 +3,8 @@
 #
 # Configuration file for the Sphinx documentation builder.
 #
-# This file does only contain a selection of the most common options. For a
-# full list see the documentation:
-# http://www.sphinx-doc.org/en/master/config
+# For the full list of built-in configuration values, see the documentation:
+# https://www.sphinx-doc.org/en/master/usage/configuration.html
 
 # -- Path setup --------------------------------------------------------------
 
@@ -19,11 +18,18 @@
 
 
 # -- Project information -----------------------------------------------------
+# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
+
+import sphinx
 
 project = u'Xen'
-copyright = u'2019, The Xen development community'
+copyright = u'2019-%Y, The Xen development community'
 author = u'The Xen development community'
 
+if sphinx.version_info < (8, 1):
+    from datetime import datetime
+    copyright = datetime.today().strftime(copyright)
+
 # Pull the Xen version straight out of the Makefile
 try:
     xen_ver = xen_subver = xen_extra = None
@@ -45,6 +51,7 @@ finally:
         version = release = u"unknown version"
 
 # -- General configuration ---------------------------------------------------
+# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration
 
 # If your documentation needs a minimal Sphinx version, state it here.
 #
@@ -69,10 +76,7 @@ master_doc = 'index'
 
 # The language for content autogenerated by Sphinx. Refer to documentation
 # for a list of supported languages.
-#
-# This is also used if you do content translation via gettext catalogs.
-# Usually you set "language" from the command line for these cases.
-language = None
+language = 'en'
 
 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
@@ -86,6 +90,7 @@ primary_domain = 'c'
 highlight_language = 'none'
 
 # -- Options for HTML output -------------------------------------------------
+# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for
 # a list of builtin themes.

base-commit: c0bf8816c9e2a4701c925d8b23abfda5990a0087
prerequisite-patch-id: b4ef4fc3ee5669c078aa0b9c7501ac7ef673966c
-- 
2.39.5


