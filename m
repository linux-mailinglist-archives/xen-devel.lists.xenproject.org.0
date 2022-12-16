Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF164F0EB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464886.723453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP5-0007k4-Pn; Fri, 16 Dec 2022 18:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464886.723453; Fri, 16 Dec 2022 18:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FP5-0007hs-Lq; Fri, 16 Dec 2022 18:25:51 +0000
Received: by outflank-mailman (input) for mailman id 464886;
 Fri, 16 Dec 2022 18:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FP3-0006tv-Sz
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:25:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1024ab95-7d6f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 19:25:48 +0100 (CET)
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
X-Inumbo-ID: 1024ab95-7d6f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=akUAll4puRfqcu6sGYOTdW3xpijmHRt6oI3ArvgLy24=;
  b=IsgjiO9YpHtJr0LyB3/eb7xcU8rcGp2wFje4iHuZik5ykLS8W/KnF4DU
   k/W/f84fXBor6W690SQg3Gln0htER5ms+1La+EiLRGxQzzCcdgxZRLIa7
   cALe324JR6ymfM0WD4DQL4jHndVndKnRfCGecwuAUfsUskNNClWQFpkSF
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88800474
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0bJHEqssU4ZmDNbJzFvwo0LoKOfnVFheMUV32f8akzHdYApBsoF/q
 tZmKWqDO/+NZ2D3c9kiO4W0oxtT6p/Qzd5gSABl/3hkEyoQ+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEGtQMindt8ONxZ2nVNNzvsBgLJbIM9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XfjFGqVTTua0t5Gv7xw1tyrn9dtHSf7RmQO0FzhbA/
 j6ZowwVBDkHP4a1kziM20iig77NnTqqcd1JBp+no6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0V9NOHsUg5QqKy66S5ByWbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwAtdjJeXHE0bDAAzMX9mp4LilHPEfVsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSbLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcoLVXWpXA+PRLOt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQLLr/ef1Y7Rj5xYxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:IopYJq1/R8Ip+0HqsYo6uwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="88800474"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 08/11] tools/ocaml/libs/mmap: mark mmap/munmap as blocking and raise Unix_error on failure
Date: Fri, 16 Dec 2022 18:25:17 +0000
Message-ID: <b3702512bd2e21aade04f9091951397e9ba3f234.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These functions can potentially take some time,
so allow other OCaml code to proceed meanwhile (if any).

Also raise a Unix_error based on `errno` if `mmap` fails, instead of just
calling failwith (which would lose the error reason).

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---

Changes since v2:
* repost of lost patch from 2020 (posted to ML on 2021
  https://patchwork.kernel.org/project/xen-devel/patch/294a60be29027d33b0a1d154b7d576237c7dd420.1620755942.git.edvin.torok@citrix.com/)
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index bf864a7c32..5b8c240ef9 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -27,6 +27,8 @@
 #include <caml/custom.h>
 #include <caml/fail.h>
 #include <caml/callback.h>
+#include <caml/unixsupport.h>
+#include <caml/signals.h>
 
 #define Intf_val(a) ((struct mmap_interface *) Data_abstract_val(a))
 
@@ -35,7 +37,9 @@ static int mmap_interface_init(struct mmap_interface *intf,
                                int len, int offset)
 {
     intf->len = len;
+    caml_enter_blocking_section();
     intf->addr = mmap(NULL, len, pflag, mflag, fd, offset);
+    caml_leave_blocking_section();
     return (intf->addr == MAP_FAILED) ? errno : 0;
 }
 
@@ -64,17 +68,22 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
     if (mmap_interface_init(Intf_val(result), Int_val(fd),
                             c_pflag, c_mflag,
                             Int_val(len), Int_val(offset)))
-        caml_failwith("mmap");
+        uerror("mmap", Nothing);
     CAMLreturn(result);
 }
 
 CAMLprim value stub_mmap_final(value intf)
 {
     CAMLparam1(intf);
+    struct mmap_interface interface = *Intf_val(intf);
 
-    if (Intf_val(intf)->addr != MAP_FAILED)
-        munmap(Intf_val(intf)->addr, Intf_val(intf)->len);
+    /* mark it as freed, in case munmap below fails, so we don't retry it */
     Intf_val(intf)->addr = MAP_FAILED;
+    if (interface.addr != MAP_FAILED) {
+        caml_enter_blocking_section();
+        munmap(interface.addr, interface.len);
+        caml_leave_blocking_section();
+    }
 
     CAMLreturn(Val_unit);
 }
-- 
2.34.1


