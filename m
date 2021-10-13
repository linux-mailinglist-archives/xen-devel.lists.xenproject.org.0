Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A542BBC5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 11:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208135.364173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maahL-0002Kk-Rt; Wed, 13 Oct 2021 09:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208135.364173; Wed, 13 Oct 2021 09:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maahL-0002IV-Om; Wed, 13 Oct 2021 09:37:19 +0000
Received: by outflank-mailman (input) for mailman id 208135;
 Wed, 13 Oct 2021 09:37:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JNW=PB=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1maahJ-0002IL-Vh
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 09:37:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27164294-2c09-11ec-8168-12813bfff9fa;
 Wed, 13 Oct 2021 09:37:17 +0000 (UTC)
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
X-Inumbo-ID: 27164294-2c09-11ec-8168-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634117836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X1d67tW3T1V+2UmPYFDEiBHGd9qhuZ4HF5AmEfApezE=;
  b=dEZHDN+jsF1ZffTSgL5+wjpNK/jC2/HukQoBJA5xPWx4A19a5IIT8ltw
   Rg4BiDW4S+fnbn4RPbrWxqFJHQvZ6VGOYqPHPyWG3GYxRrjTGRHGycXbQ
   7fmVCHI2BY7EvcEra33TDSGkQa3sySLvFcKPDA4g5tcopIXdfa1eZWLC8
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: C8GaAYr0xpBO9Di5XEvpbEgmm/5uGNPwiTc3Yxzh6T53w+GSMW8sGDdv6ruYjoufL/N8mYCM7+
 RwVgYLHH7NVIsaYrPZUS4GC3sTls45X9AsO81Zb/ETidU6W+TQT0BpUUbbioS+j8qT3vg3jSKG
 wxPfvV2Th0t+RaanAVKZ7T/AvXGcZ1k5t0cNgxPnGR4DuEcmxsoSUL8Y0uCxbn5K6gVV2ZmiJF
 SdkT7D3nWRUFztR+VfxlF0wv2a9JILLK2ffpmDhw7ExmrogzuyQZddNl0r4EiGAFoOfmhcq5Wc
 NG6mxsv6nwlOJPjVE5DECEF0
X-SBRS: 5.1
X-MesageID: 55070596
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Pn0lwK/6SvCMeNKLiLWzDrUDanmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 TRKXjyEM/aDMzfxKN0la47l9EhS6JOBxt4xHlc9qX88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhX5
 f8TrrCvWD04P4rdp6cyaTBYEnlhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwAIdfqOsUkpnxuxDfeE94tQIzZQrWM7thdtNs1rp0TRamGO
 ptHAdZpRBrDbi0QZA43MZUjoLe6v37kYWN3pWvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/Xn9AxwcHMySz3yC6H3Eru3AhyTgQ6oJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH8QB+QsHOCpgQbWddbD6s98g7l90bPy1/HXC5eFGcHMYF48p9tLdA36
 rOXt/XEL2J0nKKEc2Oc0aar7hyIECgUdXBXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJJN3g/
 9yZhHNh3+tL3Kbnw43+pAqd22v9+fAlWyZsvl2PNl9J+D+Vc2JMi2aA0lPc8epbZLiQSl2Mr
 RDocODPsbhQU/lheMGLKdjh/Y1FBd7ZblUwYnY1RvHNEghBHVb4Iui8BxkkdS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKuINoQSOMArKFTblM2LWaJ29zuy+KTLuftuU
 ap3jO72VSpKYUiZ5GveqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/0NzLmXp
 SvhBhYwJZiWrSSvFDhmo0tLMNvHNauTZ1pnbUTA5H6khCouZ5iB9qAae8dldLUr7rU7n/V1U
 +MEa4OLBfEWEmbL/DEUbJ/cqo1+dUv02VLSbnT9ODVvLYR9QwHp+8P/ele9/ic5ESfq59A1p
 Ket112HTMNbFRhiFsvfdNmm00i14SoGgOt3UkaReotTdUzg/ZJEMSv0ivNrccgAJQ+anmmR1
 hqMAAderu7I+tdn/N7MjKGCjoGoD+ohQRYKQziFte67bHCI8HCizIlMVPezUQrcDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6BAmu1ZtA+xV
 h7d89VWI+zUasbsEVpXLws5dOWTk/oTn2CKv/gyJUz74g5x/aaGDhoOb0Xd1nQFIesnKp4hz
 McgpNUSul62hRcdO9qbijxZqjaXJXsaXqR77pwXDecHUObwJo2utXAENhLL3Q==
IronPort-HdrOrdr: A9a23:BpM6OaC/gN9STQDlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8/
 xG/c5rsyMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnOzfKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.85,370,1624334400"; 
   d="scan'208";a="55070596"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/tests: Make E2BIG non-fatal to xenstore unit test
Date: Wed, 13 Oct 2021 10:35:46 +0100
Message-ID: <20211013093546.17203-1-kevin.stefanov@citrix.com>
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
---
 tools/tests/xenstore/test-xenstore.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstore/test-xenstore.c
index d3574b3fa2..ec8c63a65d 100644
--- a/tools/tests/xenstore/test-xenstore.c
+++ b/tools/tests/xenstore/test-xenstore.c
@@ -110,8 +110,13 @@ static int call_test(struct test *tst, int iters, bool no_clock)
             break;
     }
 
-    if ( ret )
-        printf("%-10s: failed (ret = %d, stage %s)\n", tst->name, ret, stage);
+    /* Make E2BIG non-fatal to the test */
+    if ( ret ){
+	if( ret == 7 )
+            printf("%-10s: Not run - argument list too long\n", tst->name);
+        else      
+            printf("%-10s: failed (ret = %d, stage %s)\n", tst->name, ret, stage);
+    }
     else if ( !no_clock )
     {
         printf("%-10s:", tst->name);
-- 
2.25.1


