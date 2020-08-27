Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73056254C48
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpH-0005Ba-T5; Thu, 27 Aug 2020 17:36:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpG-00059U-4W
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:38 +0000
X-Inumbo-ID: 9973bd4d-58fb-4624-b4a9-1247d746f943
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9973bd4d-58fb-4624-b4a9-1247d746f943;
 Thu, 27 Aug 2020 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bMI8JnWD4W73B+ihNj5DipL0N00fLgZippQkv3VCzjA=;
 b=JuTq8K+Rg0ZctR8wafcgzR21rNBgdM0DCIcHq9YqUK0arfmBfC/ez5mx
 8nVb+jJRz4pOBI1BRC0dPTJqSoL2MsxKof1bQmc8uiQq5JsuojbYW9pgp
 6gSvq2t4W57/lE5zFMhob4thyeoTtwsJVp8HZPbEXLg34lvY1E29liM+U 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HljBeO9zi6Qm0Aq4dmatkf5eNa46RdzbNCy+42n5s7NI1n3O/Sx928IHmDzf9CH1LN2tTjjCmf
 lWz92HIwkvp4J4eAuwdDAxUTzfVtq6pMZE2ViCpZzWGt6hmjo43tRmlmIa/ji2a1BbqXAbkPWa
 /7Sl/6mT1cOrFm3CUmOftNiZKy2wt8qQ/BdzRni/uJseA8fbzfyKIuDQB2rzrSx2mllEI39jbm
 36nPA9fFnMN/6CFUbLFP11HcbsWVx1k6gTBdkqSPr7DvUNu5LlqONe3sSlla74vYRRGl5apL1b
 4oM=
X-SBRS: 2.7
X-MesageID: 25758543
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25758543"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 9/9] tools/ocaml/libs/mmap: Clean up unused read/write
Date: Thu, 27 Aug 2020 18:36:00 +0100
Message-ID: <9714a15d8ce558bd9017c6c7411b4e45f48f39b5.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548832.git.edvin.torok@citrix.com>
References: <cover.1598548832.git.edvin.torok@citrix.com>
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

Xenmmap is only modified by the ring functions,
these functions are unused.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap.ml      |  5 ----
 tools/ocaml/libs/mmap/xenmmap.mli     |  4 ---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 41 ---------------------------
 3 files changed, 50 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap.ml b/tools/ocaml/libs/mmap/xenmmap.ml
index af258942a0..e17a62e607 100644
--- a/tools/ocaml/libs/mmap/xenmmap.ml
+++ b/tools/ocaml/libs/mmap/xenmmap.ml
@@ -24,11 +24,6 @@ type mmap_map_flag = SHARED | PRIVATE
 (* mmap: fd -> prot_flag -> map_flag -> length -> offset -> interface *)
 external mmap': Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
 		-> int -> int -> mmap_interface = "stub_mmap_init"
-(* read: interface -> start -> length -> data *)
-external read: mmap_interface -> int -> int -> string = "stub_mmap_read"
-(* write: interface -> data -> start -> length -> unit *)
-external write: mmap_interface -> string -> int -> int -> unit = "stub_mmap_write"
-(* getpagesize: unit -> size of page *)
 external unmap': mmap_interface -> unit = "stub_mmap_final"
 (* getpagesize: unit -> size of page *)
 let make ?(unmap=unmap') interface = interface, unmap
diff --git a/tools/ocaml/libs/mmap/xenmmap.mli b/tools/ocaml/libs/mmap/xenmmap.mli
index 075b24eab4..abf2a50131 100644
--- a/tools/ocaml/libs/mmap/xenmmap.mli
+++ b/tools/ocaml/libs/mmap/xenmmap.mli
@@ -19,10 +19,6 @@ type mmap_interface
 type mmap_prot_flag = RDONLY | WRONLY | RDWR
 type mmap_map_flag = SHARED | PRIVATE
 
-external read : mmap_interface -> int -> int -> string = "stub_mmap_read"
-external write : mmap_interface -> string -> int -> int -> unit
-               = "stub_mmap_write"
-
 val mmap : Unix.file_descr -> mmap_prot_flag -> mmap_map_flag -> int -> int -> t
 val unmap : t -> unit
 
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index 21feceea0e..ec0431efb5 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -96,47 +96,6 @@ CAMLprim value stub_mmap_final(value intf)
 	CAMLreturn(Val_unit);
 }
 
-CAMLprim value stub_mmap_read(value intf, value start, value len)
-{
-	CAMLparam3(intf, start, len);
-	CAMLlocal1(data);
-	int c_start;
-	int c_len;
-
-	c_start = Int_val(start);
-	c_len = Int_val(len);
-
-	if (c_start > Intf_val(intf)->len)
-		caml_invalid_argument("start invalid");
-	if (c_start + c_len > Intf_val(intf)->len)
-		caml_invalid_argument("len invalid");
-
-	data = caml_alloc_string(c_len);
-	memcpy((char *) data, Intf_val(intf)->addr + c_start, c_len);
-
-	CAMLreturn(data);
-}
-
-CAMLprim value stub_mmap_write(value intf, value data,
-                               value start, value len)
-{
-	CAMLparam4(intf, data, start, len);
-	int c_start;
-	int c_len;
-
-	c_start = Int_val(start);
-	c_len = Int_val(len);
-
-	if (c_start > Intf_val(intf)->len)
-		caml_invalid_argument("start invalid");
-	if (c_start + c_len > Intf_val(intf)->len)
-		caml_invalid_argument("len invalid");
-
-	memcpy(Intf_val(intf)->addr + c_start, (char *) data, c_len);
-
-	CAMLreturn(Val_unit);
-}
-
 CAMLprim value stub_mmap_getpagesize(value unit)
 {
 	CAMLparam1(unit);
-- 
2.25.1


