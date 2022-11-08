Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B519B621882
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440165.694310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhZ-00089T-Rf; Tue, 08 Nov 2022 15:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440165.694310; Tue, 08 Nov 2022 15:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhZ-000807-OC; Tue, 08 Nov 2022 15:39:49 +0000
Received: by outflank-mailman (input) for mailman id 440165;
 Tue, 08 Nov 2022 15:39:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQhY-0007Fx-FQ
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:39:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93141a4b-5f7b-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:39:47 +0100 (CET)
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
X-Inumbo-ID: 93141a4b-5f7b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xndQpxaUgOTkOg9lUcdLHyryykFdZHp3J5lKgw8D8NA=;
  b=e/dWQRTj0pAPwmOhf9yva6MXLJgkWhiKlrlZDDRxyEI6+KRi3uRI+OoN
   0lw1KoBTrzUFdSb1X9A39IiwCgpp29WfvWNcuXhN2+XcUa18/dV2qZuMf
   H74++M+lEtrpqr7kXwYWsQMzLk3bLQN3dWM3cp5sISxxZ4F67jZODxoRr
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 86935398
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jPjP+630aAVB3id3FPbD5d9xkn2cJEfYwER7XKvMYLTBsI5bp2AHx
 zEbXDuHOPzeamf9ftwnaoq0oxgGuZfRx9Q2TQs/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVmNagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfK0VU5
 943LhQ2bVOMqP6s/46dW+YyiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWkeu2h3+5bzpCr1G9rqsr+WnDigd21dABNfKFJI3RGJ4Ezi50o
 ErAp1/AHxsqL+am9iap6GmLv/bGuRL0Ddd6+LqQqacx3Qz7KnYoIAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyAyL0LuS3A+fCUANVDsHY9sj3Oc6TCIn/
 kWElNToAXpoqrL9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iKsXlADtYdBHK632gfLpAw7M5
 SGF8idr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJ1cFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwIlpn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 8jLLZj1VS5AV/QPIN+KqwA1iOFD+8zD7TmLGcCTI+qPjdJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3Cid540w3bQA/CwGJmbMuwacidClmWsqt8JQHL4Zu4GNOQQkcNhMY+pt5E6QNokifvrygE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:r3pXR6C4zmoqEFXlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="86935398"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 14/15] tools/ocaml/xenstored/syslog_stubs.c: avoid potential NULL dereference
Date: Tue, 8 Nov 2022 15:34:06 +0000
Message-ID: <5da5b63bd6a0f8d0f6ad0281773eefb32de8164d.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If we are out of memory then strdup may return NULL, and passing NULL to
syslog may cause a crash.

Avoid this by using `caml_stat_strdup` which will raise an OCaml out of
memory exception instead.
This then needs to be paired with caml_stat_free.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- fixes a bug in out of memory situations

Changes since v2:
- new in v3
---
 tools/ocaml/xenstored/syslog_stubs.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
index 4e5e49b557..4ad85c8eb5 100644
--- a/tools/ocaml/xenstored/syslog_stubs.c
+++ b/tools/ocaml/xenstored/syslog_stubs.c
@@ -14,6 +14,7 @@
 
 #include <syslog.h>
 #include <string.h>
+#include <caml/fail.h>
 #include <caml/mlvalues.h>
 #include <caml/memory.h>
 #include <caml/alloc.h>
@@ -35,14 +36,16 @@ static int __syslog_facility_table[] = {
 value stub_syslog(value facility, value level, value msg)
 {
     CAMLparam3(facility, level, msg);
-    const char *c_msg = strdup(String_val(msg));
+    char *c_msg = strdup(String_val(msg));
     int c_facility = __syslog_facility_table[Int_val(facility)]
                    | __syslog_level_table[Int_val(level)];
 
+    if ( !c_msg )
+        caml_raise_out_of_memory();
     caml_enter_blocking_section();
     syslog(c_facility, "%s", c_msg);
     caml_leave_blocking_section();
 
-    free((void*)c_msg);
+    free(c_msg);
     CAMLreturn(Val_unit);
 }
-- 
2.34.1


