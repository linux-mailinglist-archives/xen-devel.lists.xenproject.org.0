Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9288019C1EC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 15:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJzdA-0007dM-DC; Thu, 02 Apr 2020 13:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OjdR=5S=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jJzd9-0007dH-2H
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 13:11:35 +0000
X-Inumbo-ID: 791a6ed2-74e3-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 791a6ed2-74e3-11ea-b58d-bc764e2007e4;
 Thu, 02 Apr 2020 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585833094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OgFQkZch/oM5un8LEmRzT+QveAnBoTeas/B8j4hRfYQ=;
 b=gPCXJ1uqMCKaKPYBW1gFQGvX6Wl5xGKdYvmOa2knnk/FhfGTYdYUeEtK
 J7NCMfzfoNI8kxOve8WT6oCEcUlNg8Q9smXY3ojqigIkH8fTT+r2qizvn
 0WblYoDbd+CoS5luXej6hhyJYSA3qKKxUVybaebY8lEv910TX/HPpdzug s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jrYCned0zzmId+3VG51uzDweAkYLKQvprNqgL3yH1dIw8ng0jdhCsTvy25IqzPnpxc4bRNChfr
 Y8Xmx+YTn/ac1cxN7kEjcDL+8SEboZc8wq3Kf3hbwuiEj0npO+0qxWFbX7TkmUAAx5GhYWyRkN
 noiN67KleqeMSoAxSApvDCkzcy0ODUukA56ZKBKld6tHlUdC1PS1RMLxdGrbq9p/v0kam0aniv
 00hfdjBg09FKh4nRPXym0f6CtUJlbLcv/3sJyytjdnVJWcqJLecS+N7odzBYScy+oaqEleLrsM
 /ic=
X-SBRS: 2.7
X-MesageID: 15286998
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15286998"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-5.0] xen-block: Fix double qlist remove
Date: Thu, 2 Apr 2020 14:08:19 +0100
Message-ID: <20200402130819.1216125-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-stable@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit a31ca6801c02 ("qemu/queue.h: clear linked list pointers on
remove") revealed that a request was removed twice from a list, once
in xen_block_finish_request() and a second time in
xen_block_release_request() when both function are called from
xen_block_complete_aio(). But also, the `requests_inflight' counter is
decreased twice, and thus became negative.

This is a bug that was introduced in bfd0d6366043, where a `finished'
list was removed.

This patch simply re-add the `finish' parameter of
xen_block_release_request() so that we can distinguish when we need to
remove a request from the inflight list and when not.

Fixes: bfd0d6366043 ("xen-block: improve response latency")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/dataplane/xen-block.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 288a87a814ad..6cc089fc561f 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -123,15 +123,19 @@ static void xen_block_finish_request(XenBlockRequest *request)
     dataplane->requests_inflight--;
 }
 
-static void xen_block_release_request(XenBlockRequest *request)
+static void xen_block_release_request(XenBlockRequest *request, bool finish)
 {
     XenBlockDataPlane *dataplane = request->dataplane;
 
-    QLIST_REMOVE(request, list);
+    if (!finish) {
+        QLIST_REMOVE(request, list);
+    }
     reset_request(request);
     request->dataplane = dataplane;
     QLIST_INSERT_HEAD(&dataplane->freelist, request, list);
-    dataplane->requests_inflight--;
+    if (!finish) {
+        dataplane->requests_inflight--;
+    }
 }
 
 /*
@@ -316,7 +320,7 @@ static void xen_block_complete_aio(void *opaque, int ret)
             error_report_err(local_err);
         }
     }
-    xen_block_release_request(request);
+    xen_block_release_request(request, true);
 
     if (dataplane->more_work) {
         qemu_bh_schedule(dataplane->bh);
@@ -585,7 +589,7 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
                     error_report_err(local_err);
                 }
             }
-            xen_block_release_request(request);
+            xen_block_release_request(request, false);
             continue;
         }
 
-- 
Anthony PERARD


