Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F33F4EF0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170502.311297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDLq-0001JL-J2; Mon, 23 Aug 2021 17:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170502.311297; Mon, 23 Aug 2021 17:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDLq-0001H9-Bb; Mon, 23 Aug 2021 17:03:10 +0000
Received: by outflank-mailman (input) for mailman id 170502;
 Mon, 23 Aug 2021 17:03:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvRo=NO=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mIDLo-0001Gx-R4
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:03:08 +0000
Received: from mx.upb.ro (unknown [141.85.13.241])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc001ef7-0433-11ec-a879-12813bfff9fa;
 Mon, 23 Aug 2021 17:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 10526B5600B7;
 Mon, 23 Aug 2021 20:03:06 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4lcgr9anX_5F; Mon, 23 Aug 2021 20:03:04 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 39269B56008F;
 Mon, 23 Aug 2021 20:03:04 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0_98ZgINJCV6; Mon, 23 Aug 2021 20:03:04 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 9049AB56005B;
 Mon, 23 Aug 2021 20:03:03 +0300 (EEST)
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
X-Inumbo-ID: fc001ef7-0433-11ec-a879-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v3 2/4] libs/ctrl: Use Xen values for XC_PAGE_* definitions
Date: Mon, 23 Aug 2021 20:02:54 +0300
Message-Id: <d5f02f07e9d8847a00cfe78a0e45703fdac7cd1f.1629737453.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629737453.git.costin.lupu@cs.pub.ro>
References: <cover.1629737453.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We use the values provided by the Xen public interface for defining the
XC_PAGE_* macros.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/include/xenctrl.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index b77726eab7..52a1768ee7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -55,9 +55,9 @@
 #include <xen/arch-x86/xen-mca.h>
 #endif
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


