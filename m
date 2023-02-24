Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4E6A1D0D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 14:37:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501051.772629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVYFr-0004O7-VI; Fri, 24 Feb 2023 13:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501051.772629; Fri, 24 Feb 2023 13:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVYFr-0004LH-Sa; Fri, 24 Feb 2023 13:36:55 +0000
Received: by outflank-mailman (input) for mailman id 501051;
 Fri, 24 Feb 2023 13:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iPiP=6U=citrix.com=prvs=412d30f06=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1pVYFr-0004LB-BQ
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 13:36:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1705b0-b448-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 14:36:53 +0100 (CET)
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
X-Inumbo-ID: 4b1705b0-b448-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677245813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sligjGhE8zp3txxXLxxDw/E3mUVI6/l5sCV442ETKLo=;
  b=XjM+ceeAEadGfmuMioL1cD8i2lFx5yS9XYBaXOJmFac086JL8d8eCbz3
   e+KpLSKcrTw2E5ClvXY5lEE7+0mrqa8rvx/cbcYPXJfMnsWlfyMlvVEEK
   e+RC6/3AGc8cFSVNYaAr13PaqH/rKo/4lgKFBych82HHJHMaV4BfBA65s
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98414694
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:qXFGeKnnYVUdPMvBgjz2wvbo5gyJJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWWmCOf6LY2f9fN10PN7k9E0HsZ/UndVrSgVopC01EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fkeczU0dznavMfo+5ucZc9Kq/ghA/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHyfyNZrhSJorAw4EDYzRBr0airO93QEjCPbZQFwh/E+
 DOal4j/KggbP86w0DWnzlyh2qzGx3LKQ6ciNYTto5aGh3XMnzdOWXX6T2CTo/ajjVWlc8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAQKzQHXDYtFDAgveLKh64VqD/zTPlaRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSPLkWN4umsWyKJV3iEsKFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcuLVDYpn4zNB7Bt4wIrKTLuftiU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQOLLbbfVA5RTBxYxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:RSlYHal907ntCY/7oo0jx1/d/pLpDfI93DAbv31ZSRFFG/Fw9v
 rCoB1/73SftN9/YgBCpTn+AtjjfZqxz/BICOoqUYtKPjOHhILAFugL0WKI+VLd8kPFl9K13J
 0QFpRDNA==
X-IronPort-AV: E=Sophos;i="5.97,324,1669093200"; 
   d="scan'208";a="98414694"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [PATCH v1 0/2] fix memory leaks reported by GCC -fanalyzer
Date: Fri, 24 Feb 2023 13:36:44 +0000
Message-ID: <cover.1677245356.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

Using GCC 12.2.1 with -fanalyzer it has shown some memory leaks:

This is how I enabled -fanalyzer (adding it to CFLAGS for toplevel
configure didn't seem to work):

```
CFLAGS += $(call cc-option,$(CC),-fanalyzer)
```

Note that there are more errors shown than fixed here, but they seem to
be false positives (which is why this flag cannot, yet, be enabled by
default).

Edwin Török (2):
  xc_core_arch_map_p2m_tree_rw: fix memory leak
  backup_ptes: fix leak on realloc failure

 tools/libs/guest/xg_core_x86.c     | 2 ++
 tools/libs/guest/xg_offline_page.c | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.39.1


