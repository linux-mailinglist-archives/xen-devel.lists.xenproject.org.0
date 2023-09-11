Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6079AA5C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 18:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599652.935175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk9I-0006TZ-Na; Mon, 11 Sep 2023 16:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599652.935175; Mon, 11 Sep 2023 16:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfk9I-0006Pm-JX; Mon, 11 Sep 2023 16:52:32 +0000
Received: by outflank-mailman (input) for mailman id 599652;
 Mon, 11 Sep 2023 16:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zO6f=E3=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qfk9H-0006IO-Im
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 16:52:31 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9829e386-50c3-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 18:52:29 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401d80f4ef8so50431035e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Sep 2023 09:52:29 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c11cd00b003fefcbe7fa8sm10578124wmi.28.2023.09.11.09.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 09:52:28 -0700 (PDT)
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
X-Inumbo-ID: 9829e386-50c3-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1694451149; x=1695055949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPUcGvGyoZtUdDG2Nxa8yoBsHfZ5dRgf57gwUnI5hXg=;
        b=OxXvUGee6XZyf3z33ttMhQ1oYU8QNHmOxJ3rite7IR8Lur8pl1Anj9D1/2jGZa+wpJ
         8y9Sr0ZsvqAnSyNFX+k2joaJIX7bhenF/l0pHL2DJ4gcBGm06SeWU3+MVOnByCX5wNhO
         9jUNu32+z735aEgk+kyzuure9AbgS9mQKonc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694451149; x=1695055949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPUcGvGyoZtUdDG2Nxa8yoBsHfZ5dRgf57gwUnI5hXg=;
        b=biD1nki3UAV9Mvee/HZviB7fz6zAcHCzy6Qo0R+vuOKWbK5/kDA81vU9P6Nm1CEyS9
         lELOdOexwtjc2ZBSsmWIfYVN1QFdOebZk4ujDjTyVCoiFHP6fIdb3c3rjVLCCqkmKIv9
         UJyBjCqQcZnxgerCWRXczZXVGaqKMbcsYeElkGQh96T8FCw2lXZPbpN+pDnPKkHC/4sA
         hfpy/eceChhwPYTex86sW8k6BbClsl3UuUroSzDHOmvzOkM0MM7WMYi/JcL8C4BSvyCf
         r7xEyKZHO6G9EmxWbEGSgfNKKEChFjvVDHzqr+40ePsjE6OmimuqxdoUlEQMRvhRhdHF
         6lWQ==
X-Gm-Message-State: AOJu0Yx8GqcV+aUs5nPlLSziW93OgFwTG4zsI1I7txwnCh6HNgcIOTLa
	9L7SfdEwbkGiRg9Nq9tOBxRdqrCB10cjAA8YOLA=
X-Google-Smtp-Source: AGHT+IHN/ovhaR6mjY3qL7uU8D/wrB7TP/wwMhxYq9QMHykbkMHUUDv0lt3Jsem2HVW0/ZkkpQYncw==
X-Received: by 2002:a05:600c:1e14:b0:401:d1a3:d7f7 with SMTP id ay20-20020a05600c1e1400b00401d1a3d7f7mr8340896wmb.30.1694451149168;
        Mon, 11 Sep 2023 09:52:29 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v2 2/5] tools: convert setup.py to use setuptools
Date: Mon, 11 Sep 2023 17:51:01 +0100
Message-ID: <9bbf71efc710dc869baf0c5ba926630e81181620.1694450145.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694450145.git.javi.merino@cloud.com>
References: <cover.1694450145.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Python distutils is deprecated and is going to be removed in Python
3.12. Migrate to setuptools.
Setuptools in Python 3.11 complains:
SetuptoolsDeprecationWarning: setup.py install is deprecated. Use build and pip and other standards-based tools.
Keep using setup.py anyway to build C extension.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/pygrub/setup.py | 8 ++++++--
 tools/python/setup.py | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
index 502aa4df2d..f9e8feb2e6 100644
--- a/tools/pygrub/setup.py
+++ b/tools/pygrub/setup.py
@@ -1,5 +1,9 @@
-from distutils.core import setup, Extension
-from distutils.ccompiler import new_compiler
+try:
+    from setuptools import setup, Extension
+except ImportError:
+    # distutils was removed in Python 3.12.  If this import fails,
+    # install setuptools.
+    from distutils.core import setup, Extension
 import os
 import sys
 
diff --git a/tools/python/setup.py b/tools/python/setup.py
index 721a3141d7..e8111bd098 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -1,5 +1,9 @@
-
-from distutils.core import setup, Extension
+try:
+    from setuptools import setup, Extension
+except ImportError:
+    # distutils was removed in Python 3.12.  If this import fails,
+    # install setuptools.
+    from distutils.core import setup, Extension
 import os, sys
 
 XEN_ROOT = "../.."
-- 
2.41.0


