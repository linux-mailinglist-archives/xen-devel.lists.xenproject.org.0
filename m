Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AC1F53A7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:41:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiz60-00072R-Hu; Wed, 10 Jun 2020 11:40:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5j5l=7X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jiz5z-00072M-0B
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:40:39 +0000
X-Inumbo-ID: 3430a6b2-ab0f-11ea-b41d-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3430a6b2-ab0f-11ea-b41d-12813bfff9fa;
 Wed, 10 Jun 2020 11:40:38 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: t9rVQnIHDd6yrsoHZWvM0TI2z14Ed1Vt5XVEPjdstZiajg6cBUftHMPaD/I16IjqFhSuweDzdL
 laGEO4lCD5q9lrz4PDPZi9dxBAy234cb4hm1aqyPMmVANykIkoY55/sawbain79LMmx/hbN88d
 Cf1FCBpLGl6iopnwtqRvROkWv8xLMis7Mi1dnFI6z60y3FCMYL7BrbGgFJvWQxUia+b+wMrQUj
 FYOu+/eQFC6kuKoa2OEDBmzqMWJfG0Qh9Y+P4A+Ptou71iqH9AHthZhgQBvi713LSKZudVsO6F
 VTc=
X-SBRS: 2.7
X-MesageID: 19914725
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="19914725"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
Date: Wed, 10 Jun 2020 12:40:04 +0100
Message-ID: <20200610114004.30023-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
but failed to fix up the error path.

c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
_open()" fixed up the xencall_open() aspect of the error path (missing the
osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
incorrectly, creating the same pattern proved to be problematic by c/s
30a72f02870 "tools: fix error path of xenhypfs_open()".

Reposition xtl_logger_destroy(), and introduce the missing
osdep_xendevicemodel_close().

Fixes: 6902cb00e03 ("tools/libxendevicemodel: extract functions and add a compat layer")
Fixes: f68c7c618a3 ("libs/devicemodel: free xencall handle in error path in _open()")
Backport: 4.9+
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <Ian.Jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Paul Durrant <paul@xen.org>

RFC - this is still broken.

Failure to create the logger will still hit the NULL deference, in all of the
stable libs, not just devicemodel.

Also, unless I'd triple checked the history, I was about to reintroduce the
deadlock from c/s 9976f3874d4, because it totally counterintuitive wrong to
expect setup and teardown in opposite orders.
---
 tools/libs/devicemodel/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
index db501d9e80..4d4063956d 100644
--- a/tools/libs/devicemodel/core.c
+++ b/tools/libs/devicemodel/core.c
@@ -67,9 +67,10 @@ xendevicemodel_handle *xendevicemodel_open(xentoollog_logger *logger,
     return dmod;
 
 err:
-    xtl_logger_destroy(dmod->logger_tofree);
+    osdep_xendevicemodel_close(dmod);
     xentoolcore__deregister_active_handle(&dmod->tc_ah);
     xencall_close(dmod->xcall);
+    xtl_logger_destroy(dmod->logger_tofree);
     free(dmod);
     return NULL;
 }
-- 
2.11.0


