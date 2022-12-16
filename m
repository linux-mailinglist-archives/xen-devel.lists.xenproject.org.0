Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D518B64F106
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464943.723522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FYA-00048M-Ly; Fri, 16 Dec 2022 18:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464943.723522; Fri, 16 Dec 2022 18:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FYA-00045z-Id; Fri, 16 Dec 2022 18:35:14 +0000
Received: by outflank-mailman (input) for mailman id 464943;
 Fri, 16 Dec 2022 18:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FPv-0008JE-R8
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:26:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2faf6d38-7d6f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 19:26:42 +0100 (CET)
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
X-Inumbo-ID: 2faf6d38-7d6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CG01Ym3JdeGOajBJXCwb2DSCwADHqYLVBH4PspSY8t4=;
  b=PumSt9ei+qFPWVzDw35nxAlZ6t7V5CXNURLdHtyGOTd7COgtN4uFVuLH
   vuJ/Hkn1AtrbXnMbiCxaOQ+sYpJ6bRJ2useHR1h6z1u3w0JvcrYz8Lrkr
   N0oclHfF17ce6QrBx107H6d8zSUzLQ9ov8E95tF+pZBMv2GUQUU1YCkRs
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89196238
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eOu/0qsLfcxAOp4K2gFheW1dIufnVFheMUV32f8akzHdYApBsoF/q
 tZmKWyFOq7bYWTxf9l/YInnpkNVvMeAmIBhTFY4qS40FyJB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHySFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwNDQdXDq9rOWP8om2Fe5+q55zPvTXBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XfjFGqVTTua0t5Gv7xw1tyrn9dtHSf7RmQO0Fzx/J+
 DidrwwVBDlHLdGd8R/d0E6woeXUxyW4Ut0+KIeRo6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80iYns6Ua7kGgSdj5GRqirxasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwAJKX8wTxEvSjI32NS8p5Me1ELdc+paRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSbLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMcoLVXWpXA+PRLOt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQLLr/ef1Y7Rj5xYxITqJt4E7FYc21uvr+g1
 hmAtoVwmTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:c7rWG6wBgPE0eKs+LT7gKrPwy71zdoMgy1knxilNoEpuA6qlfq
 GV88jzsCWftN9/Yh0dcLy7SdK9qDbnhOZICOoqU4tKPjOW31dAd7sSj7cKqgeIcxEWtNQttp
 uIFZIObeEYZmIK9PoSjjPUL/8QhPGb9eSRmevDw1dBJDsaEZ1I3kNQFwOSCFd3TA4DIZI4Ed
 656tBcrzStPVQbB/7bOlA1G8DfotXQjpLvZlojDx4jrDSUhTSz4LTmEx6emjcSOgku/V8tmV
 K19zARtp/Jj82G
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="89196238"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 11/11] tools/ocaml/libs/xb: drop Xs_ring.write
Date: Fri, 16 Dec 2022 18:25:20 +0000
Message-ID: <ce0700a52e79eaa265f7044007d469369cacf4fe.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Unused, only Xs_ring.write_substring is used.
Also the bytes/string conversion here is backwards: the C stub implements the
bytes version and then we use a Bytes.unsafe_of_string to convert a string into
bytes.

However the operation here really is read-only: we read from the string and
write it to the ring, so the C stub should implement the read-only string
version, and if needed we could use Bytes.unsafe_to_string to be able to send
'bytes'. However that is not necessary as the 'bytes' version is dropped above.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changes:
* new patch
---
 tools/ocaml/libs/xb/xs_ring.ml      | 5 +----
 tools/ocaml/libs/xb/xs_ring_stubs.c | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/xb/xs_ring.ml b/tools/ocaml/libs/xb/xs_ring.ml
index 2a27aa56c2..87c6b243e4 100644
--- a/tools/ocaml/libs/xb/xs_ring.ml
+++ b/tools/ocaml/libs/xb/xs_ring.ml
@@ -25,14 +25,11 @@ module Server_features = Set.Make(struct
   end)
 
 external read: Xenmmap.mmap_interface -> bytes -> int -> int = "ml_interface_read"
-external write: Xenmmap.mmap_interface -> bytes -> int -> int = "ml_interface_write"
+external write_substring: Xenmmap.mmap_interface -> string -> int -> int = "ml_interface_write"
 
 external _internal_set_server_features: Xenmmap.mmap_interface -> int -> unit = "ml_interface_set_server_features" [@@noalloc]
 external _internal_get_server_features: Xenmmap.mmap_interface -> int = "ml_interface_get_server_features" [@@noalloc]
 
-let write_substring mmap buff len =
-  write mmap (Bytes.unsafe_of_string buff) len
-
 let get_server_features mmap =
   (* NB only one feature currently defined above *)
   let x = _internal_get_server_features mmap in
diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 28c79ee139..dca6059b0d 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -119,7 +119,7 @@ CAMLprim value ml_interface_write(value ml_interface,
     CAMLlocal1(ml_result);
 
     struct mmap_interface *interface = GET_C_STRUCT(ml_interface);
-    const unsigned char *buffer = Bytes_val(ml_buffer);
+    const char *buffer = String_val(ml_buffer);
     int len = Int_val(ml_len);
     int result;
 
-- 
2.34.1


