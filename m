Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB91FA8B7FF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955724.1349404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QB-0008Bk-Tp; Wed, 16 Apr 2025 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955724.1349404; Wed, 16 Apr 2025 11:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QB-00082F-C5; Wed, 16 Apr 2025 11:59:15 +0000
Received: by outflank-mailman (input) for mailman id 955724;
 Wed, 16 Apr 2025 11:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51Q9-0006At-0Z
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 363bbcde-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:12 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso68171225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:12 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:11 -0700 (PDT)
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
X-Inumbo-ID: 363bbcde-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804752; x=1745409552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZBy1HYwNbyvSgffQY0Av0rirqEVUXWQRNDyNJH/e8=;
        b=jddy8dA45gqnIVnEEjl/bVB8s0PRO6gZPHoa4Os5rkRH0gg9eOAlDTE2Vzfs8hToq1
         ihJ7imG9aHPx0cEcb+BiR1Aq+Fo0PBmSA9QLR1ouBVYTzWlIPqoorcnFiQ6zYgP8Pj4B
         swuIHEygHT+57l7KxxdFy2bHz88nuTBWzP77c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804752; x=1745409552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmZBy1HYwNbyvSgffQY0Av0rirqEVUXWQRNDyNJH/e8=;
        b=fTgzxCIJssxt6hgBTTsCfJTxzQdl+ebsdJtEvEDdE4Is/Amu6/T+jv7RUFQKLb/yRm
         PxY5ipbiq1L60tf0Nn6PLc0ocGGuSCWqUk8xlTnf2lRNB1MUuxGXLKLNgfHnzUjz/JK4
         8c1DQd9/trAkP8XyfSZ7TuepijJkMo12MFCmwPtJ1Jvzr8RsdLwv6ldN0/GEz1QIiP8g
         woWjNnTwbhkkcSfN3rRHrBtclooyuevjOzsoAofDpeAMV9HDJQdVMkJJtHHtmfVkTsGJ
         M19L8D8Tvelg7DdCE8ZuuKDX8+qorulyLsDnc8qrkZZIBx4s1YOmiVeOiwfElELSSy+M
         hFBg==
X-Gm-Message-State: AOJu0Yzv1ulsGAUw/EsEfXkC84SJyz/XHuvtQbjcetEAHDcGWZ8DfD73
	D1bPnMEsEjK3AFCgf6y25rTBn2egUdLHrL9Pxb8YQKs4DA+VB6Nd0NNfVFrYbZVICYMa9T7GkRI
	QcoU=
X-Gm-Gg: ASbGncufQ/zb7PS6mKSXxk7wfif+vITdlG1AUubR5rFY9Lo7XMesOYrDVXxcgTO2gxe
	pGsSi04UyECUO3L6B28RRgReaOR1mD2tleWXut4Fq/i6CQp4uEnZ5f4R8LnxkGRoubQ+2O0J2re
	jTUYP6RwEaeUyXOq/8rUVwN4G50b1bJZQ5YCY+hcQonU/1LTlvU+EvguEnsDVhUlIPbAvrHj+lv
	pOBixSxcyndzuHYO+4XQiTB38EQ9cZs6rQ22+mjRQm6ZoO5IwNRzTzCGF6VLTR8SIZWTwKiZ/za
	lfOTTh7/QqkcGDTpbww4L5PnsTw6T09u/qkJ+mCOLwyhVzT5PEzS7t9cgMVg5RG1lk9q9WQ1zA8
	3c+y7GQ40S5tl/w==
X-Google-Smtp-Source: AGHT+IFkBawxMNVHejaCD1UUjlp6EMAu1xH4XI62dkEJnQI4hxsoWxwWdgur4xV+uXPofj2ZjToCrg==
X-Received: by 2002:a05:600c:350e:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4405f2fae8fmr11744555e9.10.1744804751848;
        Wed, 16 Apr 2025 04:59:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 10/15] xsm/flask: Switch {asm -> xen}/byteorder.h
Date: Wed, 16 Apr 2025 12:58:55 +0100
Message-Id: <20250416115900.2491661-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sort the includes while at it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/xsm/flask/ss/avtab.c       | 4 ++--
 xen/xsm/flask/ss/conditional.c | 9 ++++-----
 xen/xsm/flask/ss/ebitmap.c     | 9 ++++-----
 xen/xsm/flask/ss/policydb.c    | 7 +++----
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index 9761d028d82d..2d07917e79e5 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -19,11 +19,11 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
+#include <xen/byteorder.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
-#include <xen/errno.h>
 
 #include "avtab.h"
 #include "policydb.h"
diff --git a/xen/xsm/flask/ss/conditional.c b/xen/xsm/flask/ss/conditional.c
index d314f772b405..a0d255596204 100644
--- a/xen/xsm/flask/ss/conditional.c
+++ b/xen/xsm/flask/ss/conditional.c
@@ -9,15 +9,14 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <xen/lib.h>
-#include <xen/types.h>
+#include <xen/byteorder.h>
 #include <xen/errno.h>
-#include <xen/string.h>
+#include <xen/lib.h>
 #include <xen/spinlock.h>
+#include <xen/string.h>
+#include <xen/types.h>
 #include <xen/xmalloc.h>
 
-#include <asm/byteorder.h>
-
 #include "security.h"
 #include "conditional.h"
 
diff --git a/xen/xsm/flask/ss/ebitmap.c b/xen/xsm/flask/ss/ebitmap.c
index 1db69d9ad1bd..1ced81ea0287 100644
--- a/xen/xsm/flask/ss/ebitmap.c
+++ b/xen/xsm/flask/ss/ebitmap.c
@@ -10,13 +10,12 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <xen/lib.h>
-#include <xen/xmalloc.h>
+#include <xen/bitmap.h>
+#include <xen/byteorder.h>
 #include <xen/errno.h>
+#include <xen/lib.h>
 #include <xen/spinlock.h>
-#include <xen/bitmap.h>
-
-#include <asm/byteorder.h>
+#include <xen/xmalloc.h>
 
 #include "ebitmap.h"
 #include "policydb.h"
diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
index 5af45fdc2783..165304c1331c 100644
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -22,13 +22,12 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
+#include <xen/byteorder.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
+#include <xen/string.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
-#include <xen/string.h>
-#include <xen/errno.h>
-
-#include <asm/byteorder.h>
 
 #include <conditional.h>
 #include "security.h"
-- 
2.39.5


