Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF5258A65
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 10:34:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD1jY-00024n-0Y; Tue, 01 Sep 2020 08:33:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD1jW-00024f-Hy
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 08:33:38 +0000
X-Inumbo-ID: d1ef4771-92f6-419a-b15e-4d34f3e57533
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1ef4771-92f6-419a-b15e-4d34f3e57533;
 Tue, 01 Sep 2020 08:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598949214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZgbkUHppbVaFHJoTWftMMI+riUpDxpQUtdzYOwYpFo=;
 b=db4fqPaWpKS7305zTqX3qOenpDB734uM8XeFfiqeCkaLqYHp2v+C4h25
 WwcH1s4UGv6e/0DsNewpm47PjHAznU+siceAeugo+dNFxFRa2mRDrUVtw
 elnSTVIoxPy9Ge4PcJH8LyFnIrtdsxrF/0e6J8q8QNlwPhndGk643OAq3 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cM4zDigjOx5W+U9PfM8X4dGURvU3pFhihoT4/kzOKFmMv+VWCTdQtas5xawpzM5dwmh2WBKCXD
 J3KgPKcLbPgw/J/AkETo5yRrRgHNYQIrptYe+E50/om0jSsflT+YVVnASwQuMo1fFGRw4+nBTr
 ljhngveVpU4IYDSm4yJjDG6vwD7oF6qJPhIgYFNbB0Zb9a+Dymp+msraD2fMi6DETOnlCYESgp
 QmP+eeUBO+E/wVGBOpQyyIBPA+z+lI9RyM9K7oZQwXlfKzK7qq+r8UujL3yFwrGttfqOGADEB4
 1q0=
X-SBRS: 2.7
X-MesageID: 26017046
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26017046"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: [PATCH v5 1/3] xen/balloon: add header guard
Date: Tue, 1 Sep 2020 10:33:24 +0200
Message-ID: <20200901083326.21264-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901083326.21264-1-roger.pau@citrix.com>
References: <20200901083326.21264-1-roger.pau@citrix.com>
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

In order to protect against the header being included multiple times
on the same compilation unit.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
This is required as a pre-patch to use ZONE_DEVICE, or else the
fallback of including the balloon header might not work properly.
---
 include/xen/balloon.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/xen/balloon.h b/include/xen/balloon.h
index 6fb95aa19405..6dbdb0b3fd03 100644
--- a/include/xen/balloon.h
+++ b/include/xen/balloon.h
@@ -2,6 +2,8 @@
 /******************************************************************************
  * Xen balloon functionality
  */
+#ifndef _XEN_BALLOON_H
+#define _XEN_BALLOON_H
 
 #define RETRY_UNLIMITED	0
 
@@ -34,3 +36,5 @@ static inline void xen_balloon_init(void)
 {
 }
 #endif
+
+#endif	/* _XEN_BALLOON_H */
-- 
2.28.0


