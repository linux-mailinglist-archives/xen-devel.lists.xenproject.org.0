Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B3A74B68
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930673.1333344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0v-00088G-TJ; Fri, 28 Mar 2025 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930673.1333344; Fri, 28 Mar 2025 13:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyA0v-00083a-Oe; Fri, 28 Mar 2025 13:44:49 +0000
Received: by outflank-mailman (input) for mailman id 930673;
 Fri, 28 Mar 2025 13:44:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyA0t-0005Dj-Sm
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 13:44:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf120adf-0bda-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 14:44:45 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-391342fc1f6so1826734f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 06:44:45 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8314f5c6sm73339085e9.40.2025.03.28.06.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 06:44:44 -0700 (PDT)
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
X-Inumbo-ID: cf120adf-0bda-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743169485; x=1743774285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZBy1HYwNbyvSgffQY0Av0rirqEVUXWQRNDyNJH/e8=;
        b=F+Q96Pz1YmVX7Z0eekUa67dddfXAaU3KT6aOr3p30LF3oiOPMjquX+kKs7nPcc/vVw
         SCmLigcmYzRokknBIeeEsljcDgLiIMMERynFnZje3lvJ/GEeqZhjW+qCgKqEA222wWma
         lPl/SJsUvXFeC4sXhciGk0RVj5Y9Z0DvVAAaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169485; x=1743774285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmZBy1HYwNbyvSgffQY0Av0rirqEVUXWQRNDyNJH/e8=;
        b=fMbyQxCO6G97CnkmDKJ7uG+9j5MpsM9Ki9otwGrSLBK4llHnjBNBnVduT29Zwqwbbs
         6J7+Y2YwlxMishm1cmXqJ2jDuCgPRjRdrN+S4wT6eq/1Y+sY9nq+QFVD48W36NCsGM7t
         Ej9r8V/7hW+GcIJPYXx9Fcono4Dg8gbJwFQvTtgoMB7OKP2pTiIb1/LvrTkpcE5A/Rzp
         XC+dN3s2OkXCqyGYn2UNK+KEd8vJtFh11mpGDyKteQRxn0oVBxwPzlq20u3uzsy/wVQS
         6GQcHaJbo7aAzOaZuKmsyU10k2u51Qi8mm80UkkU76cvJtRxqnmhbAO+3VtXLVc7TEbz
         706A==
X-Gm-Message-State: AOJu0Yy2eJ+9IH6mTdWi91UTf3LazuUMQOdvzsR65zYWkVnDoOGRL3RD
	Z1pumbyq1TqeZj7k1o7Vm/kvOuuKqqa0+HL8SCUOIbArTD/3nJQq9Ws9Zybz/bRi51319lK6F3s
	swno=
X-Gm-Gg: ASbGnctkFgskKwLnUfoZ+uE4sl+87gDhpT6v0luEPj8NYiYjpKc6ZNY8JZnvkIUGCZb
	WwoDysp4UDtYBBaGhr9MqMmWULAfSiMDFjCWn9iD3XjHEOCH1DWamRwHZlrL98lpUDQGceaOaaK
	MQNoBEuZPobGJL3E+MS1ru5F6eKMKR6vsKGe+T9kzhq3iHzFCS15kXq7VmAYOZvJZsSn7kpsEBV
	Wj2/rghFUZaQBE6qgdTUAGYDp3JwXCEI7pyWGTCTIPANlyRtPJ/wzWTGMu67LwfhzGNjZVs+4PR
	X8Vr3kGz4ZXIc6unIphWz+MS0LaNYRAcN/N045+ThiMd+sExw+ziT7mlyAKUpmc5geGYyyPQslo
	KVtgr4pccjstwOKfpLA==
X-Google-Smtp-Source: AGHT+IFUWweznwg116NpoWFi+yvyz0sRMtpeqzErO3aq4nIcbQSzH//8/f9PCMAH0h7dBSDzXA3q8g==
X-Received: by 2002:a5d:64ef:0:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-39ad17606d5mr7016727f8f.45.1743169484563;
        Fri, 28 Mar 2025 06:44:44 -0700 (PDT)
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
Subject: [PATCH v5 11/16] xsm/flask: Switch {asm -> xen}/byteorder.h
Date: Fri, 28 Mar 2025 13:44:22 +0000
Message-Id: <20250328134427.874848-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134427.874848-1-andrew.cooper3@citrix.com>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
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


