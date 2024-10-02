Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450AF98E63B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 00:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809082.1221229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw86F-0000s2-3g; Wed, 02 Oct 2024 22:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809082.1221229; Wed, 02 Oct 2024 22:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw86F-0000qB-11; Wed, 02 Oct 2024 22:45:39 +0000
Received: by outflank-mailman (input) for mailman id 809082;
 Wed, 02 Oct 2024 22:45:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw86D-0000q5-Lr
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 22:45:37 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09e91c26-8110-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 00:45:35 +0200 (CEST)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5c881aa669fso230422a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 15:45:36 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bcd7sm922644666b.169.2024.10.02.15.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 15:45:33 -0700 (PDT)
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
X-Inumbo-ID: 09e91c26-8110-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727909135; x=1728513935; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQKinIj+ao5XakTxYELDZMWrgaWd31i2wYJlaitgELo=;
        b=R0XU5zUvCq5hdLM31TFaaAddE1zrG7TelNmU8nPpIwlNtcfgcjy/Pb8sww4Oa0bl9N
         vXvRtSCWB4woS6DTbYe0y8MpGVXFojKM1+BrU7gjCSioNOy/pqhzRtPgSuzN9mY8IjE4
         jUrl1w186NbbJCVbH2s5wVmdKDkl90ZT1vp6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727909135; x=1728513935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQKinIj+ao5XakTxYELDZMWrgaWd31i2wYJlaitgELo=;
        b=abgBq6BxdUxrBGV3OS+TkJHU9Kf7DsXMvayhta6e4k0x5lZbPgwb6szUtLRmqdAHds
         aowJimmpgqAryjDLZoqcSz1GDfMVHi3eOPcLGpfRjWnbvuLeHK+kq5KEF0FfI3oE4vcu
         ZPSqITzAyHNnb1TUaL6LTQhgAZeIr7zkOeJufc3rq4v8znmN26oqO/RvzSpyi5BLXN1U
         dxEmk0OTi4Tsk8ndr6nIhh5GP4rtGo8vOgbW8AP1RVTlTuZXjBdbtlB7j5QhPT+17+z8
         qlYTeqecZkkrEyw6l+5syYqZeveTHYPQPX8N4/wltHxZyL8O7/2G0y/ZiTZoJtAai3N2
         vvrQ==
X-Gm-Message-State: AOJu0YyMVyIMPZctkW2+7PhjEXSWRrA54/NgiUjnqs+BxvAE1fbZUOiT
	3j5m8FPHXNZQQ9SccWvmvA/GaLQeEyuNmT6RHnXs8gRijIFmVmeJXS0+iR7OC+Q98zyFUOL58YP
	eTnOPpA==
X-Google-Smtp-Source: AGHT+IGfc0DbP0ymIcklqw1/Gm6EkY+/u+eOb82gmg3nt66glGRxeMogouIzOXE7s+wFgB0KcL4pVw==
X-Received: by 2002:a17:907:7fa7:b0:a8a:9195:922d with SMTP id a640c23a62f3a-a98f7fe6002mr519583366b.0.1727909134404;
        Wed, 02 Oct 2024 15:45:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH] stubdom: Fix newlib build with GCC-14
Date: Wed,  2 Oct 2024 23:45:31 +0100
Message-Id: <20241002224531.1966914-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on a fix from OpenSUSE, but adjusted to be Clang-compatible too.  Pass
-Wno-implicit-function-declaration library-wide rather than using local GCC
pragmas.

Fix of copy_past_newline() to avoid triggering -Wstrict-prototypes.

Link: https://build.opensuse.org/request/show/1178775
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Jan Beulich <JBeulich@suse.com>

The OpenSUSE Tumbleweed containers already reproduce this issue:

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1479445899

This wants backporting to all trees in due course.
---
 stubdom/Makefile                           |  2 ++
 stubdom/newlib-fix-copy_past_newline.patch | 10 ++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 stubdom/newlib-fix-copy_past_newline.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 8c503c2bf8de..f8c31fd35d0d 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -97,10 +97,12 @@ newlib-$(NEWLIB_VERSION): newlib-$(NEWLIB_VERSION).tar.gz
 	patch -d $@ -p1 < newlib-disable-texinfo.patch
 	patch -d $@ -p1 < newlib-cygmon-gmon.patch
 	patch -d $@ -p1 < newlib-makedoc.patch
+	patch -d $@ -p1 < newlib-fix-copy_past_newline.patch
 	find $@ -type f | xargs perl -i.bak \
 		-pe 's/\b_(tzname|daylight|timezone)\b/$$1/g'
 	touch $@
 
+NEWLIB_CFLAGS += -Wno-implicit-function-declaration
 NEWLIB_STAMPFILE=$(CROSS_ROOT)/$(GNU_TARGET_ARCH)-xen-elf/lib/libc.a
 .PHONY: cross-newlib
 cross-newlib: $(NEWLIB_STAMPFILE)
diff --git a/stubdom/newlib-fix-copy_past_newline.patch b/stubdom/newlib-fix-copy_past_newline.patch
new file mode 100644
index 000000000000..f8452480bc80
--- /dev/null
+++ b/stubdom/newlib-fix-copy_past_newline.patch
@@ -0,0 +1,10 @@
+--- newlib-1.16.0/newlib/doc/makedoc.c.orig
++++ newlib-1.16.0/newlib/doc/makedoc.c
+@@ -798,6 +798,7 @@ DEFUN( iscommand,(ptr, idx),
+ }
+
+
++static unsigned int
+ DEFUN(copy_past_newline,(ptr, idx, dst),
+       string_type *ptr AND
+       unsigned int idx AND

base-commit: 41190d2ceb03b12ffc17a66c04de519c26a6052a
-- 
2.39.5


