Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9C77E947
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 21:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584871.915740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLov-0007kN-NA; Wed, 16 Aug 2023 19:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584871.915740; Wed, 16 Aug 2023 19:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWLov-0007iS-Jh; Wed, 16 Aug 2023 19:04:41 +0000
Received: by outflank-mailman (input) for mailman id 584871;
 Wed, 16 Aug 2023 19:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yqiy=EB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qWLou-0007iM-2i
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 19:04:40 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0c9787-3c67-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 21:04:38 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1692212672218899.0068057217877;
 Wed, 16 Aug 2023 12:04:32 -0700 (PDT)
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
X-Inumbo-ID: be0c9787-3c67-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1692212674; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y8QBW0PZpMT5oEnpiHxECI5j/A5kiEruZ7qmqswTEqUZN0Ro12sXN6vuzEJjBlcf98L78bMVYzEGJu5jGWpKq89ImzGCWzeTHcFY7F3Q3WKHInwSBa3CX5Eq5oUWZbWPxmp7h0PMTU6O0tyqgNTMlEGh6p9ehXX4e7dfzwJ6PiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692212674; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=0B+TURNoxibXnqrsJG4uYUSmg30KfiNoqPQSfNhYhak=; 
	b=c3Rq8HhoON/RXXQFvhRfKtRxMF4o4czU/nC2s5hoiNwxRMFmo0YkNrQF7isqxFlXfjCuJlY6KZIUYb9j/S6p8Stg2KTndoxmEFzybyy4bjOSQAzitRcZC2APAuzvSSQh+Whv4hz3vrKoyXbIS7j6jl/ptk+Wh3GBvb7Rm7DYKKA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692212674;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=0B+TURNoxibXnqrsJG4uYUSmg30KfiNoqPQSfNhYhak=;
	b=RK1lCvCnTHVQ2+7ZaNjjZKHwMo3/rQJvAJ8h4Nkak+lxJ0IybTtevovREEbdaMWf
	srgmQEPOPvRPLyL6b0OP0gLZ1zLJAeN4sN352eaDmnRDzYyQ3lTMrHglaYNCjn9mjE8
	0NSVC+Ov6aQp4KsXtk4/8DMo9ra/7wzhUgalYyJg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xsm: removing inclusion of byteorder.h
Date: Wed, 16 Aug 2023 15:04:25 -0400
Message-Id: <20230816190425.8160-1-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is to complement patch 'common: move Linux-inherited fixed width type
decls to common header' by removing the unnecessary include of
'asm/byteorder.h'. In the process of removing these includes, the ordering was
corrected to comply with current coding style.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/flask/ss/avtab.c       | 3 +--
 xen/xsm/flask/ss/conditional.c | 9 ++++-----
 xen/xsm/flask/ss/ebitmap.c     | 8 ++++----
 xen/xsm/flask/ss/policydb.c    | 9 ++++-----
 4 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/xen/xsm/flask/ss/avtab.c b/xen/xsm/flask/ss/avtab.c
index 9761d028d8..732004b010 100644
--- a/xen/xsm/flask/ss/avtab.c
+++ b/xen/xsm/flask/ss/avtab.c
@@ -19,11 +19,10 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
+#include <xen/errno.h>
 #include <xen/lib.h>
-#include <asm/byteorder.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
-#include <xen/errno.h>
 
 #include "avtab.h"
 #include "policydb.h"
diff --git a/xen/xsm/flask/ss/conditional.c b/xen/xsm/flask/ss/conditional.c
index e74fc01746..f948c6172d 100644
--- a/xen/xsm/flask/ss/conditional.c
+++ b/xen/xsm/flask/ss/conditional.c
@@ -9,16 +9,15 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
-#include <xen/lib.h>
-#include <xen/types.h>
 #include <xen/errno.h>
-#include <xen/string.h>
+#include <xen/lib.h>
 #include <xen/spinlock.h>
+#include <xen/string.h>
+#include <xen/types.h>
 #include <xen/xmalloc.h>
 
-#include "security.h"
 #include "conditional.h"
+#include "security.h"
 
 /*
  * cond_evaluate_expr evaluates a conditional expr
diff --git a/xen/xsm/flask/ss/ebitmap.c b/xen/xsm/flask/ss/ebitmap.c
index e1d0a586a7..2cca25b775 100644
--- a/xen/xsm/flask/ss/ebitmap.c
+++ b/xen/xsm/flask/ss/ebitmap.c
@@ -10,12 +10,12 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
-#include <xen/lib.h>
-#include <xen/xmalloc.h>
+#include <xen/bitmap.h>
 #include <xen/errno.h>
+#include <xen/lib.h>
 #include <xen/spinlock.h>
-#include <xen/bitmap.h>
+#include <xen/xmalloc.h>
+
 #include "ebitmap.h"
 #include "policydb.h"
 
diff --git a/xen/xsm/flask/ss/policydb.c b/xen/xsm/flask/ss/policydb.c
index 7f232f92fa..fd51a5a35d 100644
--- a/xen/xsm/flask/ss/policydb.c
+++ b/xen/xsm/flask/ss/policydb.c
@@ -22,18 +22,17 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#include <asm/byteorder.h>
+#include <xen/errno.h>
 #include <xen/lib.h>
+#include <xen/string.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
-#include <xen/string.h>
-#include <xen/errno.h>
 #include <conditional.h>
-#include "security.h"
 
-#include "policydb.h"
 #include "conditional.h"
 #include "mls.h"
+#include "policydb.h"
+#include "security.h"
 
 #define _DEBUG_HASHES
 
-- 
2.20.1


