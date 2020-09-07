Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C825F7A6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 12:18:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFEE2-0001zT-MO; Mon, 07 Sep 2020 10:18:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5qx=CQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kFEE0-0001zO-Nw
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 10:18:12 +0000
X-Inumbo-ID: f1497921-c18c-46b7-ac19-d9ec4d5151c2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1497921-c18c-46b7-ac19-d9ec4d5151c2;
 Mon, 07 Sep 2020 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599473891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fwCriKOeajbwDI2TH66+ytVc0CU3ED0sZ9N5cVrjArA=;
 b=ZIdRjjmBWzojYnplikcH8DO87BARGPtoTQK4PdTI1cXOpgAN8mEjl6YI
 jc8Ehfz2U35fSOSz+3bTvKaUUB28SeloReAuzxpg010CY03AjMxF1Z1dA
 T/BYwQaO98o3su+uH8GoVWLqxhgPXcLFNVQVJAiesABQW99OG6jWd+6+O s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +wJ7efdrW2oh/MGm9QbKrEZ63toeQqBcvM4h5RPGl2NamMAPoOX+cZYF8DeEDHyCePkpNiIEDJ
 zFBRtXwL9bq1gWn2sKhXVsPB5v/dAKFqzPdZnQnxH4rgliVFNEQpFQE1CkxRS62pfCW84hzgDB
 WK8pV/t7En32vGMWNCOw8rbxv2tTWpc6f/csV6+rr5fdeu85CuKLQ8UEDRf9wa5Y7kebZSm0zn
 YbwK9Q5xzxSkDldjdxLA0cItHOnTfBRbKc3a8j6WURpEPWBcvZpalTpwzn1S5nL3OcIeesiiKk
 JrQ=
X-SBRS: 2.7
X-MesageID: 26129224
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,401,1592884800"; d="scan'208";a="26129224"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Wei Liu <wl@xen.org>
Subject: [PATCH] libgnttab/freebsd: add tools libs.h
Date: Mon, 7 Sep 2020 12:18:05 +0200
Message-ID: <20200907101805.58458-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In order to get the ROUNDUP macro, or else the build fails. I assume
ROUNDUP would previously get included from a different header.

Seeing as Linux does explicitly include libs.h do the same for
FreeBSD.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/gnttab/freebsd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index 0588501d0f..768af701c6 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -30,6 +30,8 @@
 
 #include <xen/sys/gntdev.h>
 
+#include <xen-tools/libs.h>
+
 #include "private.h"
 
 #define PAGE_SHIFT           12
-- 
2.28.0


