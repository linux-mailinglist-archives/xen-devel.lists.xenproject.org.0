Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1642F050
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210434.367312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM6c-0003a3-0T; Fri, 15 Oct 2021 12:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210434.367312; Fri, 15 Oct 2021 12:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM6b-0003XD-Sx; Fri, 15 Oct 2021 12:14:33 +0000
Received: by outflank-mailman (input) for mailman id 210434;
 Fri, 15 Oct 2021 12:14:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1Iv=PD=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mbM6Z-0003Vn-TU
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:14:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72fbfd62-2db1-11ec-8231-12813bfff9fa;
 Fri, 15 Oct 2021 12:14:30 +0000 (UTC)
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
X-Inumbo-ID: 72fbfd62-2db1-11ec-8231-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634300070;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YYWuWAVeA6+IHR6oFqCP4UO+MQc3A44zw+1QAAoBvB0=;
  b=gAO/vMquM1Y8agx8v+FCklcr1sokZ12pFUCsJVhJlfe0x0tcnXdgjNBj
   13XCDIuNergMocbSp0tKlyeJoGcggt+YQhbHogL6vVDp8xNoTx76NUhhj
   yjFIcm4hF5GuiSnrlJKGzDdUzP2mjF6il1xTCLd06Eg9d4RJLghleVpt2
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6DVR2/cz0CG6qbFLu3FmvdYkc15Eo/CKY93zqgCwgYJSPOQbtG1MalTK4Aa7MzX6U8NuEuRpk/
 XuM239J+Wl4xBZ3IKW7vLxD2EaXlNAvLN3IG2NmgcEX8TW5o+1RBnsusQ6JPdkgdeE16LUzZxc
 OwbDelZgJEYH+00/qKAYFUo0uDkdl/8AelYiuFLeHjTUJkupT+2jtZtO+nvPkNd+x2p0Vgq0a1
 c/IldJC23de/RXFVTwgoTrslIZ3LMO8PMbfsQ7+MsELCRQ6GV93blPNhE2Lcp0Re/4bxWbpZyV
 oj3o5HHUnXHrb7nhaLeJPB50
X-SBRS: 5.1
X-MesageID: 54844375
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:clFLQalkXiHsf+aZtimkWhfo5gxqIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCDzXP/6IZWOkedx0a4mw8R8HupXdydFjTwU4pS9kHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tc12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NZyvKaPRQ4OArfRwLRFSBZaPiRfFKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBOrmIoIZ/Ep8wD/QC/E4aZvCX7/L9ZlT2zJYasVmQKqOO
 5ZCNmcHgBLoeiNhJkYtIb0HhsSaoFPQS2R3lXGyuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7HxUbOdq32TeDtHW2iYfnnyzhX5kJPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdxynolaUsxgEQd1SHuYmrgaXxcLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BBgNmioKZQFWh7KrM/WupNio4KE4ranpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OpL05Zav0mv1RWe2Wj0/8mWJuIgzlyPBjrN0+9vWGKyi2VEA3Dg5vFcMJ3RcFCFu
 HUV8yR1xLFTVc/T/MBhreNkIV1I2xpnGGGD6bKMN8N4n9hIx5JFVdsNiN2ZDB04WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKNYYUOcIqKVbXpn8GiausM4bFyxVEfUYXY
 s/zTCpRJSxCVfQPIMSeFo/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zbmVo
 CvkAREFkTISRxTvcG23V5yqU5u3Nb4XkJ7xFXJE0Y+A1ydxbICxwr0YcpdrL7Ar+PY6lax/T
 uUfetXGCfNKE2yV9zMYZJj7jYpjaBX02l7eY3v7OGAyL8x6WgjE2t74ZQ+zpiMAOTW66Jklq
 Lq62wKFHZdaH1Z+DNzbYe6Exk+quSRPg/p7WkbFe4EBeEjl/IVwBTb2i/s7f5MFJRnZn2PI3
 AeKGxYI4+LKptZtotXOgKmFqaavEvd/QRUGTzWKs+7uOHCDrGS5wIJGXOKZRhznVTv5qPe4e
 OFY7/DgK/lbzlxEhJVxTuRwxqUk6tqx+7IDllZ4HG/GZkiAA697JiXUxtFGs6BAy+MLuQayX
 U7TqNBWNa/QZZHgGV8VYgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYlYpk4x
 eoBudIN713tgxUnBd+KkyRI+jneNXcHSagm6skXDYKDZtDHEb2ejUgw0hPL3aw=
IronPort-HdrOrdr: A9a23:Nz4HRq8mCyOhktjIHiNuk+ESdb1zdoMgy1knxilNoERuA6qlfr
 OV7Y0mPHjP+XAssRAb6Je90ca7MBfhHPJOgLX5Xo3SBTUO2lHYS72KhLGKq1eMd0KRygc079
 Y5T0EUMqySMbEOt7ee3ODOKadD/DDoysCVbbi09RxQpEpRGtldBk9Ce32m++dNNVN77NwCZc
 GhDjYsnUvoRZzpBP7LcEXsoYL41qr2fdvdEGQ772VO0njHsdt0gISKVyRxDn8lInZy6KZn/m
 7fnwPj4KK/9/m91x/HzmfWq49bgd3717J4dbixY2cuW0vRYyuTFfZcsoe5zUUISK3F0idbrP
 Dc5xM7e8hj4XLYeW+45RH33RP7zToo43j+jVeFnHrqu6XCNXkHItsEgZgcfgrS6kImst052r
 lMxXiFu51eCg6FlDjh5sLPSwphmiOP0DAfead6tQ0RbWNpAIUh47D20ihuYdY99GOT0vFrLA
 EYZPusqMq/UTihHjDkVhoG+q3uYp0XJGb2fqEvgL3o79FmpgEL86JD/r1jop4pzuNDd3GSj9
 60cJhVqA==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="54844375"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] tools/tests: Make E2BIG non-fatal to xenstore unit test
Date: Fri, 15 Oct 2021 13:14:09 +0100
Message-ID: <20211015121409.24434-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Xenstore's unit test fails on read and write of big numbers if
quota-maxsize is set to a lower number than those test cases use.

Output a special warning instead of a failure message in such cases
and make the error non-fatal to the unit test.

Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>

v2: Adhere to coding style, use E2BIG instead of 7, set ret to 0
---
 tools/tests/xenstore/test-xenstore.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index d3574b3fa2..f8423e568e 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -110,8 +110,17 @@ static int call_test(struct test *tst, int iters, bool no_clock)
             break;
     }
 
+    /* Make E2BIG non-fatal to the test */
     if ( ret )
-        printf("%-10s: failed (ret = %d, stage %s)\n", tst->name, ret, stage);
+    {
+	if ( ret == E2BIG )
+        {
+            printf("%-10s: Not run - argument list too long\n", tst->name);
+            ret = 0;
+        }
+        else      
+            printf("%-10s: failed (ret = %d, stage %s)\n", tst->name, ret, stage);
+    }
     else if ( !no_clock )
     {
         printf("%-10s:", tst->name);
-- 
2.25.1


