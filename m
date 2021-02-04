Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452E30EFC9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 10:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81193.149560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7b6H-0007Sm-G2; Thu, 04 Feb 2021 09:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81193.149560; Thu, 04 Feb 2021 09:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7b6H-0007SN-CW; Thu, 04 Feb 2021 09:38:57 +0000
Received: by outflank-mailman (input) for mailman id 81193;
 Thu, 04 Feb 2021 09:38:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YP8j=HG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l7b6F-0007Hi-Vc
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 09:38:56 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0c40b9a-baee-46d5-8e08-27dbeeb8f701;
 Thu, 04 Feb 2021 09:38:54 +0000 (UTC)
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
X-Inumbo-ID: d0c40b9a-baee-46d5-8e08-27dbeeb8f701
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612431534;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=qox4YjZUceF2TMkiPBfoCDiOTORg7BxGqT1rBEL0hUg=;
  b=DUFvfM4cs9zW50tU2bx+By9leYu95IxKhBMeJILexXPGZAmPz88p9GZ/
   s1a/rxj/ha8V2BXrCus5VvQaEieJizbGUCZ7Oic5+97b7Y2aXaWSC/WHu
   r1IqNCNiCSrODKG3Ix8zsvuPmZp55N0xrMJ0O8EAiDPxM+ayO6R7xBXKu
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8zP6IfrSXrZYzz3HL98vzNgx/6VEsJaiUkYtTih5juwE8rMg57+mSWE0OfAgTS2Qc+Dw+fC3Xe
 QOX4nQQl9dzqyILAxFWgOAOokQIq4LYR5NDSfR1NM+scDJFdT9aZ5zKvQFOLY8/nIdDk84lfJl
 9BBu6+Pyn+BNz+SpaHS8sDCaQ3Me8G9iFMM0xj4vTHHWSqUrenXJbzaPP6hNZXR2LL18Co5iI7
 wZYWeIsco06qa5a1fOnnJUS/unrTfD8WigdykABXSNnPzLS3QkCuCSY/vhJ6GWrrsS3N1LQl5l
 t1Y=
X-SBRS: 5.2
X-MesageID: 36915858
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,400,1602561600"; 
   d="scan'208";a="36915858"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuxQMCOGmGnOwZ9GB+ixpIeXiWythgscUS8+JrjI0tNqi9wTCE9Z+ZnpJ5GSJ9DiQZTx3FOpW0kI4iSD0V7v2//rZiW/VtsPsbQFurMj8WLctw6uOdD3TYDd9UUgAUe6j75KMsvqBd9LYLPh2lt6B5Rlo8Ybd3SH2xOaCBdKpZdZQli+eeyNgoReKqvo1Q85xQHsYMkRJQhwu4So2ZKFyWljZgti11OA+guXT47NQS768wRYrb8MevojOkc5zbmdGttM5cHztolO/Q2IngjPUWcW0wNFskQgpag65TqXeS3FVQS+780DSaLuEsmBuWtJAockkQA5ggvQAqjKMLTBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV6zQhox0t6WyZyOKRZdDZ0EWUIr6LMm4rPKFCDSIKM=;
 b=n+fzV0BVz7IC3oN3tThlirNiJmpu9L5svKWwjSCNBTSQN6CIWicGpYbobeIbeA9CGfIvHd7aSGh8D2VrnBuoZkkriyit78jyUGdnfN4B8uO2EWlvCSYxk/wvVC80cJmnWgdrC1hvMy+bwuRBNBZNFvrFfPLHq1XhQ77faye+WN4Y+uhjkgS8Z2ysihu6X5eAxtNIsp6Qr/CteGDgbyU+tZNyJpeGpsYKv417lzb09ErS3FCno9LS4vZKKy+Aj5GwKhn9x/MAqqU+bEEGXhezReiwMleOnk3MadcNfNReaTO96/cKWD5QX0Pb2MpEaq958AXKmaEciK+8DsyEhXBgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV6zQhox0t6WyZyOKRZdDZ0EWUIr6LMm4rPKFCDSIKM=;
 b=Tp1xO3HjQHfhqL9S3FECOtIypjttO2clthveRiNXL0/awJidMXh26N8n4kYiu1irpbqSKkC3z9vwmb2YSIzPnWMU/O19+AoWskW71AE6uwgN48gwiF6oS6F/oHvZSoBpC9zMaSGS3kcYGYOsig+M4DECLbDbcxHj+vGYLA7WP7E=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15] autoconf: check endian.h include path
Date: Thu,  4 Feb 2021 10:38:33 +0100
Message-ID: <20210204093833.91190-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PAZP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:21::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c2d7a57-23ee-4c44-13a7-08d8c8f0aa34
X-MS-TrafficTypeDiagnostic: DM6PR03MB3739:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB37398CB95A0CD2397D0F9AD78FB39@DM6PR03MB3739.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/VCgxIim3/78qDmYscbYzyUSFsscYIN6nCVbfSiwT3GEUEOinS8E1Ry9Sp1V2jBQpZZDwNe1xT30sFzvR+t3kVcjYfubNX1d7yzir3Ha2/zHiSALJQaUzbJjozXxksUlqsoT3TSX8aVG9AYHxcEeISf4Vyf8sFSnWHewxBeohGF2chAYEMbesaBWE+MQfND58aOedVYW/E7gHreNThuMUtmQFkDTkW9LDocgu6emPi3fHZPXVqj0r8xSPQHle1g4yoMrG/LNqs7Z6eouBCJFkIrBVMvMg07tkLc5/NhBM18gND5B9fbpopnF2Dfr805fmeyhsd3cgJDs5dmCY1oCg4FQ/+s2vCLE4gMVgDaxkQepgrVd5PRM4yqK3fq5+UuY29UY88SbrCrrMkZWZVT4LuUcUAtoYNMm9aCBOHK0vXi9fv3g6Wm3nPI8V/oOx758nsDNTXUs7hTZ6IEL5q3CoXzO3xYJREry53HiotlNpdAWNKrz8BKaDd1rIb1A1cFAF8xCPRlSGVqWpKTDd89Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(4326008)(478600001)(6916009)(316002)(66556008)(1076003)(5660300002)(86362001)(54906003)(83380400001)(6496006)(66946007)(8936002)(26005)(186003)(36756003)(8676002)(956004)(2906002)(6666004)(66476007)(16526019)(2616005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S1kzQjNnR3FibUxObWk3WEZTc3QyQ1hQQUVERkJFcDUxcVhNZURRZ0tUbGVk?=
 =?utf-8?B?N2RySUJEV0NRcG5jbEdzd200Kzl1ZWhWa2hHTmJacFB4LzgzQy92L2xXVVZM?=
 =?utf-8?B?bWVJTW9GQkFFUmRKTi9TK0RpUGRwOTZXd1kwWDYzdnhtY28vRWE4NFVxSlkr?=
 =?utf-8?B?cTJ4c0ZOUHpTMUhpUUtsb2xXa01qTGowb3I2c1g2WUtMRWE0L2t5TDk3Z1k0?=
 =?utf-8?B?NVFqNG50SFZRVFFLZEtoTU5vTjBUdmcvUGlMcVRvSG1yb1JFOWxlTUVFWGdq?=
 =?utf-8?B?YXhxeHgza0hPaFJCL2hVN0lIUSthV01QenF4cUFNcThCNEJRdzlhMFJtU2du?=
 =?utf-8?B?TGpKZ3ZFaUQ2UEwyeVdOSGtiOVBRMmNVclJCT0xYb1AwbEZpR2hMNWhpWDZh?=
 =?utf-8?B?T3lTRk5iSmd1aW1Xa2QyMVdtRHBjcDVQaFpMMzJMTDZjOCtqRE5EeHZQVERm?=
 =?utf-8?B?Qnc3c29IamRXS0lZVUltcjYzeU9XeXJhc0RmTnVEWlpmS29EN3hVcDZUVGEz?=
 =?utf-8?B?NXBLZml0Uk9yQkdaTzQ3dzJCWENQNER3Q01ha3c2amlZRDJNL3F0Y0RJOHps?=
 =?utf-8?B?Q1Q1c0QvVm5iN3hoT0JBcDlvTThVZUJUS3BKVm9oV240d21BemVuSFZxYmJQ?=
 =?utf-8?B?KzcwSzVIbUN4SGxNSUxsYVlHTXZYc0hkSktNVitGTUF3RGxPL3NQZVlJdVFo?=
 =?utf-8?B?NndaZ1hKc0FjL2FzZXBGcTg0REF1czJNQ3FHSnFRZDVoK2V1SmsvWWxqanl5?=
 =?utf-8?B?amVBYWU1bm5DT016VkFMR3ROWS9EUzM4eFNUSzIvdUlGU2E4U3hTVDhnakRN?=
 =?utf-8?B?Vy9nbGNiZStrbzAxQkxqbGZFK25EemJveTZkcUxjc1ducWVWVzlYZDJNOHZM?=
 =?utf-8?B?UmZqaGs3OFl0dW9KK3FhbG41NEhYVVlzSk1lQ25NMnVpQnBCaFZWV0dMM3JX?=
 =?utf-8?B?UXM1WmtReWVKRFJvVGxOak5ySmdOVzVpNFFkc0lidGJFNVdGb2ZlS01HSjRk?=
 =?utf-8?B?MndTYTREeDhZOEI5enVyOHA1MEZucVo1clpRcUtZYzVBSWdvbXRyZytzYTRH?=
 =?utf-8?B?Ym8yTWMyQUR0ZDhWTVNJSGhGUjlPMEttVnZxenNUaDNxVmYzYS9lL3lrTjlR?=
 =?utf-8?B?M0NlVEh6R2NvYmwwaUFWTzNVcDRNR05sdy83YzVEUnJYcGlZOWNTSzRyRUFK?=
 =?utf-8?B?cWJRME1zZkVlMlZQdDVpL29XODdaMGV3Y0NOSHI2UWpvdFZmUUdSc0VWMnp6?=
 =?utf-8?B?WnQva0p2UExoZnRCY1dZZHJKQjNCdVM1WHUzYWcwTVM1Q1hhUGVDRm5IVG1r?=
 =?utf-8?B?c1FNcUJGWXBpUE85N2xEZmJjVGxqRWxxK3RzS1N4QTRjTFd6dEQ0anUrdUZG?=
 =?utf-8?B?eXRha0NRZWorZTN1aFVGU0l6T3Y0Zi8xSmREVmNDNWphcC83bUdsZjVpRjFQ?=
 =?utf-8?B?YVVDTG9wZ0tnTndvbUpHRGt2K1JrUlpEZXVlV3c0ZytHcFBRL1Y3Y01aWHhC?=
 =?utf-8?B?c1dMK1I0TUh2MThiY1EwYXlmNFVIY2daZk10S2tVbzhyVXh6TVZ3YU9teXNk?=
 =?utf-8?B?ckl1blZQWDhCSUtoN3BwL2tQMExKbWtNWmRPNk1YTDJ4YnpiVmY5cE1MaFRZ?=
 =?utf-8?B?NFEwU2grcDZGTU5tL2t4eDlJVFYwVXFhZWVncThHNFBuQW5XUVRleFpEYTA1?=
 =?utf-8?B?V0ZBUVRxSkR2UzlqNndsMnBaY1RaWkk0UThZSU40TmQzYjFOSnBLM1cvR0Q2?=
 =?utf-8?Q?rBzCcGCJ9WCaXYckQXnNP+jT61lv80vRCzSioVv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2d7a57-23ee-4c44-13a7-08d8c8f0aa34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 09:38:44.8530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9CX/GT8dsPLqQFx/Wm5iGP2lhtsS0SwXVHc3bQhOduOP2r8oSbCmqq3GmFwchZknexT9cNIepP1aRX0fkVGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3739
X-OriginatorOrg: citrix.com

Introduce an autoconf macro to check for the include path of certain
headers that can be different between OSes.

Use such macro to find the correct path for the endian.h header, and
modify the users of endian.h to use the output of such check.

Suggested-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Please re-run autogen after applying.

The biggest risk for this would be some kind of configure or build
failure, and we should be able to catch it in either osstest or the
gitlab build tests.
---
 m4/header.m4                                      | 13 +++++++++++++
 tools/configure.ac                                |  3 +++
 tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c |  2 +-
 tools/libs/guest/xg_dom_decompress_unsafe_xz.c    |  2 +-
 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c  |  2 +-
 tools/xenstore/include/xenstore_state.h           |  6 +-----
 6 files changed, 20 insertions(+), 8 deletions(-)
 create mode 100644 m4/header.m4

diff --git a/m4/header.m4 b/m4/header.m4
new file mode 100644
index 0000000000..81d1d65194
--- /dev/null
+++ b/m4/header.m4
@@ -0,0 +1,13 @@
+AC_DEFUN([AX_FIND_HEADER], [
+ax_found=0
+m4_foreach_w([header], $2, [
+    AS_IF([test "$ax_found" = "0"], [
+        AC_CHECK_HEADER(header, [
+            AC_DEFINE($1, [<header>], [Header path for $1])
+            ax_found=1])
+    ])
+])
+AS_IF([test "$ax_found" = "0"], [
+    AC_MSG_ERROR([No header found from list $2])
+])
+])
diff --git a/tools/configure.ac b/tools/configure.ac
index 5b328700e0..3a3e7b4b2b 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -74,6 +74,7 @@ m4_include([../m4/ax_compare_version.m4])
 m4_include([../m4/paths.m4])
 m4_include([../m4/systemd.m4])
 m4_include([../m4/golang.m4])
+m4_include([../m4/header.m4])
 
 AX_XEN_EXPAND_CONFIG()
 
@@ -517,4 +518,6 @@ AC_ARG_ENABLE([pvshim],
 ])
 AC_SUBST(pvshim)
 
+AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
+
 AC_OUTPUT()
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
index a4f8ebd42d..e58c1b95ed 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_lzo1x.c
@@ -1,7 +1,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <inttypes.h>
-#include <endian.h>
+#include INCLUDE_ENDIAN_H
 #include <stdint.h>
 
 #include "xg_private.h"
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
index ff6824b38d..fc48198741 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
@@ -1,5 +1,5 @@
 #include <stdio.h>
-#include <endian.h>
+#include INCLUDE_ENDIAN_H
 #include <stdlib.h>
 #include <stddef.h>
 #include <stdint.h>
diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index 52558d2ffc..01eafaaaa6 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -1,5 +1,5 @@
 #include <stdio.h>
-#include <endian.h>
+#include INCLUDE_ENDIAN_H
 #include <stdlib.h>
 #include <stddef.h>
 #include <stdint.h>
diff --git a/tools/xenstore/include/xenstore_state.h b/tools/xenstore/include/xenstore_state.h
index f7e4da2b2c..ae0d053c8f 100644
--- a/tools/xenstore/include/xenstore_state.h
+++ b/tools/xenstore/include/xenstore_state.h
@@ -21,11 +21,7 @@
 #ifndef XENSTORE_STATE_H
 #define XENSTORE_STATE_H
 
-#if defined(__FreeBSD__) || defined(__NetBSD__)
-#include <sys/endian.h>
-#else
-#include <endian.h>
-#endif
+#include INCLUDE_ENDIAN_H
 #include <sys/types.h>
 
 #ifndef htobe32
-- 
2.29.2


