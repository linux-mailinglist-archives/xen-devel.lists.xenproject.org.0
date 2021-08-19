Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08083F2026
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169065.308829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6F-0000xQ-NQ; Thu, 19 Aug 2021 18:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169065.308829; Thu, 19 Aug 2021 18:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn6F-0000us-KG; Thu, 19 Aug 2021 18:49:11 +0000
Received: by outflank-mailman (input) for mailman id 169065;
 Thu, 19 Aug 2021 18:49:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ErsO=NK=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mGn6D-0000ek-W7
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:49:10 +0000
Received: from mx.upb.ro (unknown [141.85.13.220])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec046c42-f40c-4421-ab0f-9ede3a08fa76;
 Thu, 19 Aug 2021 18:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 4B2D5B5601C1;
 Thu, 19 Aug 2021 21:49:07 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id h5aI7n1J83Tp; Thu, 19 Aug 2021 21:49:05 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id C5F2AB56023C;
 Thu, 19 Aug 2021 21:34:02 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jZuGbMaUYKKK; Thu, 19 Aug 2021 21:34:02 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 5AC46B5609E2;
 Thu, 19 Aug 2021 20:50:18 +0300 (EEST)
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
X-Inumbo-ID: ec046c42-f40c-4421-ab0f-9ede3a08fa76
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 2/4] libs/ctrl: Use Xen values for XC_PAGE_* definitions
Date: Thu, 19 Aug 2021 20:50:10 +0300
Message-Id: <c70025ff145d9a4ef16ef62c0cbd67eba41d48e7.1629395092.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629395092.git.costin.lupu@cs.pub.ro>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We use the values provided by the Xen public interface for defining the
XC_PAGE_* macros.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/include/xenctrl.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index b77726eab7..2031308458 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -54,10 +54,11 @@
 #include <xen/foreign/x86_64.h>
 #include <xen/arch-x86/xen-mca.h>
 #endif
+#include <xen/page.h>
=20
-#define XC_PAGE_SHIFT           12
-#define XC_PAGE_SIZE            (1UL << XC_PAGE_SHIFT)
-#define XC_PAGE_MASK            (~(XC_PAGE_SIZE-1))
+#define XC_PAGE_SHIFT           XEN_PAGE_SHIFT
+#define XC_PAGE_SIZE            XEN_PAGE_SIZE
+#define XC_PAGE_MASK            XEN_PAGE_MASK
=20
 #define INVALID_MFN  (~0UL)
=20
--=20
2.20.1


