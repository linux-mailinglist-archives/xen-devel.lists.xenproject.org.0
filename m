Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CBC6C86CB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514419.796627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfnys-00059m-GM; Fri, 24 Mar 2023 20:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514419.796627; Fri, 24 Mar 2023 20:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfnys-00057S-Cz; Fri, 24 Mar 2023 20:25:46 +0000
Received: by outflank-mailman (input) for mailman id 514419;
 Fri, 24 Mar 2023 20:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfnyr-00053T-4q
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:25:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bb95e46-ca82-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 21:25:42 +0100 (CET)
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
X-Inumbo-ID: 0bb95e46-ca82-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679689542;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kP8agbsRfeEZ/mjeOjEF+gH//aIU1MuGD6Oj+7MKO18=;
  b=YRgkndCls/Spus2iTgnaB/r6xv7kwjczb/NNuCov2tZe7YmKOVVDL239
   KeXqgKPYs2Sz9yi4N2k6xFLAfNFr7xmoY8TqxJsVrgrJRRBB1Ja+eVZwc
   5vfoLbUvCFcO9S/HPO8+1M+AyDjiPNlPxbifR2FmIc2kVvUktmM+TSzcB
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101066355
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:aApet6sWXQmktaqBv0+MpbAJtOfnVDleMUV32f8akzHdYApBsoF/q
 tZmKTqPaKqMYGX1e993YYu38UtQusLTmodlHVY6+303EitD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASEyyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBAAJPizeiPyNmbODV/QrmocGHeq7BdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zqfpzqnWUxHXDCZ4QiY+3emguTBoT7iRIYQBpikq95qnnTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U24R+A4rDZ6AGYAi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2U169V5VE5x6J+4nTfiBXUaM1RbZBcZUEwZoPzSg9EK20enoslYLEKlsjHkMWiun
 GHU8nVk3O17Yd0jjPviow2e6964jt2QF1NuuF2KNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpmGGeG6bKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEMbSX6NvcuMtnoVqzGKJQM8vy7Ps04k/IUOsQhHON51HgGibGsM5DFzxF3zPBX1
 WazesewF3cKYZlaIM6Nb75Fi9cDn3lurV4/sLinl3xLJ5LCPi/KIVrEWXPSBt0EAFSs/1uOr
 IwPb5LQo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:XA7kMK35uokzUb8i3mvzhgqjBHUkLtp133Aq2lEZdPRUGvbo8f
 xG/c566faQsl0ssR4b+OxoVJPwJE80lqQFmLX5X43SJDUO0VHARO4N0WKL+UyaJ8SUzJ846U
 4PSdkYNPTASXVBoILdxiLQKbodKd+8mpyAtKPl400oZydMRIFP0zxQNya8NQlNaDQuP+tbKL
 OsosVGoja7eWcadK2Aa0UtVfTYutvOmInHTHc9dnwa1DU=
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="101066355"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH] tools/ocaml/mmap: Drop the len parameter from Xenmmap.write
Date: Fri, 24 Mar 2023 20:25:25 +0000
Message-ID: <20230324202525.3256586-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Strings in Ocaml carry their own length.  Absolutely nothing good can come
from having caml_string_length(data) be different to len.

Use the appropriate accessor, String_val(), but retain the workaround for the
Ocaml -safe-string constness bug in the same way as we've done elsewhere in
Xen.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap.ml      |  4 ++--
 tools/ocaml/libs/mmap/xenmmap.mli     |  2 +-
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 11 +++++------
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap.ml b/tools/ocaml/libs/mmap/xenmmap.ml
index fd6735649f4c..746ca6e21c52 100644
--- a/tools/ocaml/libs/mmap/xenmmap.ml
+++ b/tools/ocaml/libs/mmap/xenmmap.ml
@@ -25,7 +25,7 @@ external mmap: Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
 external unmap: mmap_interface -> unit = "stub_mmap_final"
 (* read: interface -> start -> length -> data *)
 external read: mmap_interface -> int -> int -> string = "stub_mmap_read"
-(* write: interface -> data -> start -> length -> unit *)
-external write: mmap_interface -> string -> int -> int -> unit = "stub_mmap_write"
+(* write: interface -> data -> start -> unit *)
+external write: mmap_interface -> string -> int -> unit = "stub_mmap_write"
 (* getpagesize: unit -> size of page *)
 external getpagesize: unit -> int = "stub_mmap_getpagesize"
diff --git a/tools/ocaml/libs/mmap/xenmmap.mli b/tools/ocaml/libs/mmap/xenmmap.mli
index d097b68a8fdf..5d6aa19ca6cb 100644
--- a/tools/ocaml/libs/mmap/xenmmap.mli
+++ b/tools/ocaml/libs/mmap/xenmmap.mli
@@ -22,7 +22,7 @@ external mmap : Unix.file_descr -> mmap_prot_flag -> mmap_map_flag -> int -> int
   -> mmap_interface = "stub_mmap_init"
 external unmap : mmap_interface -> unit = "stub_mmap_final"
 external read : mmap_interface -> int -> int -> string = "stub_mmap_read"
-external write : mmap_interface -> string -> int -> int -> unit
+external write : mmap_interface -> string -> int -> unit
   = "stub_mmap_write"
 
 external getpagesize : unit -> int = "stub_mmap_getpagesize"
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index c85b1fcce7d5..c15a565aaa52 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -99,27 +99,26 @@ CAMLprim value stub_mmap_read(value intf, value start, value len)
 		caml_invalid_argument("len invalid");
 
 	data = caml_alloc_string(c_len);
-	memcpy((char *) data, Intf_val(intf)->addr + c_start, c_len);
+	memcpy((char *)String_val(data), Intf_val(intf)->addr + c_start, c_len);
 
 	CAMLreturn(data);
 }
 
-CAMLprim value stub_mmap_write(value intf, value data,
-                               value start, value len)
+CAMLprim value stub_mmap_write(value intf, value data, value start)
 {
-	CAMLparam4(intf, data, start, len);
+	CAMLparam3(intf, data, start);
 	int c_start;
 	int c_len;
 
 	c_start = Int_val(start);
-	c_len = Int_val(len);
+	c_len = caml_string_length(data);
 
 	if (c_start > Intf_val(intf)->len)
 		caml_invalid_argument("start invalid");
 	if (c_start + c_len > Intf_val(intf)->len)
 		caml_invalid_argument("len invalid");
 
-	memcpy(Intf_val(intf)->addr + c_start, (char *) data, c_len);
+	memcpy(Intf_val(intf)->addr + c_start, String_val(data), c_len);
 
 	CAMLreturn(Val_unit);
 }
-- 
2.30.2


