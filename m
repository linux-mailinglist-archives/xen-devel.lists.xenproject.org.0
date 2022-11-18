Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE562FB07
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 18:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445854.701272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow4ky-0007f2-KZ; Fri, 18 Nov 2022 17:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445854.701272; Fri, 18 Nov 2022 17:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow4ky-0007d6-Hh; Fri, 18 Nov 2022 17:02:24 +0000
Received: by outflank-mailman (input) for mailman id 445854;
 Fri, 18 Nov 2022 17:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DmIt=3S=citrix.com=prvs=314707d18=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ow4kw-0007ck-CN
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 17:02:22 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c22b1981-6762-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 18:02:20 +0100 (CET)
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
X-Inumbo-ID: c22b1981-6762-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668790940;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=megvoOBEwOx7JByp5KjUWgWt+wIQJv3ptW72mSIUpLA=;
  b=UVkRgbiFry/6YnIl+/9h5naJvCL9LurW62XB6tG/fqpVlR9t8hKiU5CT
   TsG0vthueXKx7Yvthuyf0hhbjD9HdZEPYz6brFQl79dFi1kdojcY5Unie
   X0MW4I+A0Xo81vr4HRouQbn7P93pKx8d4uNOd0DkHGAYMWO/1KL6V2kxa
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85151333
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lJne0qjbEDnRF5YiXRy9rAJdX161EBAKZh0ujC45NGQN5FlHY01je
 htvWmCDPPeDZzGkeN0kYN6/pkxXsceAyYViSQBt+C5hEiwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QaOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQoBgBKRS2stdiVye+mbrBDm/w/E+jSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthbF/
 z+fpD+iav0cHNXY233eqmKjuszszCXpA6EzTJGc19c/1TV/wURMUUZLBDNXu8KRqkO4QcMZF
 EUS9QInt610/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3oe6nXSZBAcnF0wLODIgFCQY28Xcgbhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3Y1QfHNFBz3oRZPmLy8BxkgTHqFyu5eJVfUj
 Lb74Gu8JPZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPMguLlLaoXswPBb4M4XRfK4Ey/lX1
 XCzKJfEMJrnIf4/kGreqxk1jtfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrlR0U5FyS2Lm
 +ti2zyikUgGD7SlOnaJrOb+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:ZM28DazsAvRosXqsUVGYKrPwOr1zdoMgy1knxilNoRw8SKKlfq
 GV7ZMmPHDP6Ar5NEtNpTniAtjlfZq/z+8X3WB5B97LN2OKhILBFvAG0WKI+Vzd8kPFmdK1rZ
 0QEZRDNA==
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="85151333"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.17] tools/libxl: Correct error message units in libxl__domain_set_paging_mempool_size()
Date: Fri, 18 Nov 2022 17:02:13 +0000
Message-ID: <20221118170213.2872-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The error message accidentally printed the bytes value as if it were kB.

Fixes: 7c3bbd940dd8 ("xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m mempool hypercalls")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>

For 4.17.  This is a low risk change, and makes an error message accurate.
---
 tools/libs/light/libxl_dom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index b59bbe00bb30..68ad9763b6ba 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1459,7 +1459,8 @@ int libxl__domain_set_paging_mempool_size(
     int r = xc_set_paging_mempool_size(CTX->xch, domid, shadow_mem);
     if (r) {
         LOGED(ERROR, domid,
-              "Failed to set paging mempool size to %"PRIu64"kB", shadow_mem);
+              "Failed to set paging mempool size to %lukB",
+              d_config->b_info.shadow_memkb);
         return ERROR_FAIL;
     }
 
-- 
2.11.0


