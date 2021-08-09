Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3C3E47E7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 16:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165019.301561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Zh-0005uG-F9; Mon, 09 Aug 2021 14:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165019.301561; Mon, 09 Aug 2021 14:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD6Zh-0005qU-Av; Mon, 09 Aug 2021 14:48:21 +0000
Received: by outflank-mailman (input) for mailman id 165019;
 Mon, 09 Aug 2021 14:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFlj=NA=cs.pub.ro=costin.lupu@srs-us1.protection.inumbo.net>)
 id 1mD6Zf-0005Xf-Ge
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 14:48:19 +0000
Received: from mx.upb.ro (unknown [141.85.13.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d27da33c-f920-11eb-9f1d-12813bfff9fa;
 Mon, 09 Aug 2021 14:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id CE741B5600AA;
 Mon,  9 Aug 2021 17:48:12 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CAUH5v2Ckw_F; Mon,  9 Aug 2021 17:48:11 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by mx.upb.ro (Postfix) with ESMTP id 1CFBBB56008E;
 Mon,  9 Aug 2021 17:48:11 +0300 (EEST)
Received: from mx.upb.ro ([127.0.0.1])
 by localhost (mx.upb.ro [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hRHX9oMMHtlN; Mon,  9 Aug 2021 17:48:11 +0300 (EEST)
Received: from localhost.localdomain (unknown [86.121.144.181])
 by mx.upb.ro (Postfix) with ESMTPSA id 446D8B560068;
 Mon,  9 Aug 2021 17:48:10 +0300 (EEST)
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
X-Inumbo-ID: d27da33c-f920-11eb-9f1d-12813bfff9fa
X-Virus-Scanned: amavisd-new at upb.ro
From: Costin Lupu <costin.lupu@cs.pub.ro>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 2/4] libs/ctrl: Use Xen values for XC_PAGE_* definitions
Date: Mon,  9 Aug 2021 17:47:57 +0300
Message-Id: <f9eff76553c564e2cd27251af60b130f39034933.1628519855.git.costin.lupu@cs.pub.ro>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628519855.git.costin.lupu@cs.pub.ro>
References: <cover.1628519855.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We use the values provided by the Xen public interface for defining the
XC_PAGE_* macros.

Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
---
 tools/include/xenctrl.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 14adaa0c10..90bb969fa0 100644
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


