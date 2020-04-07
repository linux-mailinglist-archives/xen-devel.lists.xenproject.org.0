Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A71A101A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 17:23:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLq3z-0005e5-7s; Tue, 07 Apr 2020 15:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DsZW=5X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLq3x-0005dz-0b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 15:22:53 +0000
X-Inumbo-ID: a3390742-78e3-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3390742-78e3-11ea-b58d-bc764e2007e4;
 Tue, 07 Apr 2020 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586272967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qg827KIvdKEzs6jvNwGqMNXyL08iW2Xpsw7/s+ZIo+U=;
 b=NAlyRtDBCStIB2MhWCpu9WXHiCFu58eFDpy9cpRVUYxy0ZO6dd8nx5sZ
 Uvoo+r5bOPZhovwYzSQa6BlRgqQ3TXTGrdxVxqyUUXwAdcPdMeNVuwo8/
 SIWFb4LCUC2UwY12IlDjEzSy4buv4DMelBjK3GlC1pKfn0yDp5pmvw0+G I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kEEUF3m5QJdGP+nVunsvGYsRB0qPKBIMKb/0kGJ3Ad5qvTmdLxzqw07ltbH+HjkMS71Lrl6qAZ
 yaqI6F3eG7Ljvf+RIJ4y5SPiYNj2f/YSQoguctmkfywB1hHd8dYISMCx2YiySk4t6THD2BQCLP
 knLe7MnbkruiyE3zrnKMGimmjyRfL/DuVm0FlJIL58nV+zkLXePqoukx+rwJVM+fHTfww1YqlB
 xHvSG8Zx8+xBzBZrflAGWY1Q724URub+FE+lbwk29Fg0NiOIHzB4pSav/fbtBaxYHZbvF4WFqP
 4ps=
X-SBRS: 2.7
X-MesageID: 15974527
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15974527"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 2/3] xen-block: Fix uninitialized variable
Date: Tue, 7 Apr 2020 16:22:36 +0100
Message-ID: <20200407152237.1468704-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200407152237.1468704-1-anthony.perard@citrix.com>
References: <20200407152237.1468704-1-anthony.perard@citrix.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Since 7f5d9b206d1e ("object-add: don't create return value if
failed"), qmp_object_add() don't write any value in 'ret_data', thus
has random data. Then qobject_unref() fails and abort().

Fix by initialising 'ret_data' properly.

Fixes: 5f07c4d60d09 ("qapi: Flatten object-add")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200406164207.1446817-1-anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 07bb32e22b51..99cb4c67cb09 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -860,7 +860,7 @@ static XenBlockIOThread *xen_block_iothread_create(const char *id,
     XenBlockIOThread *iothread = g_new(XenBlockIOThread, 1);
     Error *local_err = NULL;
     QDict *opts;
-    QObject *ret_data;
+    QObject *ret_data = NULL;
 
     iothread->id = g_strdup(id);
 
-- 
Anthony PERARD


