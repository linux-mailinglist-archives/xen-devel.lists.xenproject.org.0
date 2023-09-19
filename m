Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D17A59F5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604372.941722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUGA-0004Bw-KY; Tue, 19 Sep 2023 06:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604372.941722; Tue, 19 Sep 2023 06:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUGA-00049d-GY; Tue, 19 Sep 2023 06:30:58 +0000
Received: by outflank-mailman (input) for mailman id 604372;
 Tue, 19 Sep 2023 06:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72lO=FD=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiUG8-000365-7E
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:30:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15f4f1f1-56b6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 08:30:54 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-403012f276dso57094825e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 23:30:55 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003fe17901fcdsm17068780wmf.32.2023.09.18.23.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:30:54 -0700 (PDT)
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
X-Inumbo-ID: 15f4f1f1-56b6-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695105054; x=1695709854; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qAv5TR4Jv8y9/IqrcBV7oAsUEo56bvO6XuiR+P26ck=;
        b=Dj4Uba0/uO3kgF+0WJkf3KThH9xm58sFemj2Au4nLUjCVFGLZteoMYfNn6D4sQaSwk
         QvB7rdSU7+g5m0aJNqa/MToZKE+PFqVkfEXtN1SF6LApMzSZA5Ta3hQGkJhqymIVU1UH
         Vz/AfrF2fWcTb+6cgYCW9SvjeByX5rctAiJjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105054; x=1695709854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qAv5TR4Jv8y9/IqrcBV7oAsUEo56bvO6XuiR+P26ck=;
        b=jXEipjwQUf21wtZqTKb+yqrYG41kn+S7w+gf9xWFq3BZkDbq3LrznSommJmWYlI6V4
         dVNPB5W3S1G7YOT13yICcRfJ5Dp+4Uf8z/dWpb5zMt/sFr4+V7PmWcRW/EdLSlHrPXgF
         lcYKLYp6L/6je9nZO8296Po4z4tPvkKzFI7naOm6glWh6/j+aBtphr/K/uWZMUUSg3ZX
         JMZmaokij0hy7VEGkevk7rO033aTxRBJTvNLPXGiHpOmbuPFLTtxygDmpZMZcW2mDCDr
         qkVlhJmNG9lXjess1292yZRGakAW2mHR94NpY4TLOMpVEfYfFp9nPwlxpfE2Zv8XH1xV
         nhCA==
X-Gm-Message-State: AOJu0YxMjwz2jJ6dVeaqGE7Ykymg3x6KKr225Zcyw/uAAskPMP8Z315O
	9RsAxvus+Sg425BopDsDM+ymafSnKls9S2ivXOo=
X-Google-Smtp-Source: AGHT+IF3F5TicFY2bZaPPfxI3vbGtjet1LnUeRlgKhqZkuTP7saiA9lgz54eojjPaWL++bqqsbFuOA==
X-Received: by 2002:a05:600c:c8:b0:402:f5c2:c6d9 with SMTP id u8-20020a05600c00c800b00402f5c2c6d9mr10181859wmm.37.1695105054480;
        Mon, 18 Sep 2023 23:30:54 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v3 2/4] tools: convert setup.py to use setuptools if available
Date: Tue, 19 Sep 2023 07:30:27 +0100
Message-ID: <761d876ad8755a98824ed7705afaed2cdb545dd8.1695104399.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1695104399.git.javi.merino@cloud.com>
References: <cover.1695104399.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Python distutils is deprecated and is going to be removed in Python
3.12. Add support for setuptools.

Setuptools in Python 3.11 complains:

  SetuptoolsDeprecationWarning: setup.py install is deprecated. Use build and pip and other standards-based tools.

Keep using setup.py anyway to build the C extension.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 tools/pygrub/setup.py | 7 +++++--
 tools/python/setup.py | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
index 502aa4df2d..c9cac47eee 100644
--- a/tools/pygrub/setup.py
+++ b/tools/pygrub/setup.py
@@ -1,5 +1,8 @@
-from distutils.core import setup, Extension
-from distutils.ccompiler import new_compiler
+# Prefer setuptools, fall back to distutils
+try:
+    from setuptools import setup, Extension
+except ImportError:
+    from distutils.core import setup, Extension
 import os
 import sys
 
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 721a3141d7..02354f6986 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -1,5 +1,8 @@
-
-from distutils.core import setup, Extension
+# Prefer setuptools, fall back to distutils
+try:
+    from setuptools import setup, Extension
+except ImportError:
+    from distutils.core import setup, Extension
 import os, sys
 
 XEN_ROOT = "../.."
-- 
2.42.0


