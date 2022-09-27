Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138A5EC0D5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412494.655876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Z2-0000Oc-0N; Tue, 27 Sep 2022 11:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412494.655876; Tue, 27 Sep 2022 11:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Z1-0000FD-NZ; Tue, 27 Sep 2022 11:15:47 +0000
Received: by outflank-mailman (input) for mailman id 412494;
 Tue, 27 Sep 2022 11:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1od8Z0-0008Aw-Jz
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:15:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9910872-3e55-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 13:15:44 +0200 (CEST)
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
X-Inumbo-ID: b9910872-3e55-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664277344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EI190skp2HLPj9zpnRLco5ZASbbq/qUufYWOpErCNvM=;
  b=GVNIQf3I0LM+eqNrps+byviqavEBSGaZtrP0knvd7hutPQmjHELU5OjK
   UKDdMxydmLrmyjKbQLfIvucP6R4XrGCRzEyVpayA/2TFYKBpiykVKyRmf
   RDdTfT/sHK2mv080DNDV429XjXDE1WAIFIfJU8zgKZDCxLtRQh7yv1Agn
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81083781
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:36/VN6y4nGSVEvk/mE96t+dIxirEfRIJ4+MujC+fZmUNrF6WrkUBy
 GsbD2/UbqmLMGD0eohyboiwpEwE6JKBz941HQRp+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFsMpvlDs15K6o4GJC4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw48FwDDxR1
 94jAjFKV0Czh+asz7XqVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/BZ4gneHumn7ldD5wo1OJv6snpWPUyWSd1ZC9aYKFIYPaHK25mG6qr
 3jIpGnyXisAC/GN7B2D+WCHoO7AyHaTtIU6S+Tjq68CbEeo7nMXIA0bUx28u/bRokK3Rd93M
 UEf/Ssq668o+ySDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qE0bCZ8CyQGxM/LCg7NR8ESREK5Ij89dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N/02wYH83oJrW7FF5ufkWd4v1lDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4q5DKmLM4seM8AgHONiwM2JTRH44owQuBJ0zfFX1
 WmzKK5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOPGDEN5vJ9fbzNimMhls/7fyOgUm
 v4DX/a3J+J3C7SmPnSLrNJ7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23://nxoaiO/RlwLrJne6wMXW2sEnBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81083781"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Date: Tue, 27 Sep 2022 12:15:00 +0100
Message-ID: <7b88cbda20e068bbce1c5dfb0a18af3f4e4b6865.1664276827.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664276827.git.edvin.torok@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Follow the manual to avoid naked pointers:
https://v2.ocaml.org/manual/intfc.html#ss:c-outside-head

No functional change, except on OCaml 5.0 where it is a bugfix.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 19335bdf45..7ff4e00314 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -37,7 +37,7 @@
 
 #include "mmap_stubs.h"
 
-#define _H(__h) ((xc_interface *)(__h))
+#define _H(__h) *((xc_interface **) Data_abstract_val(__h))
 #define _D(__d) ((uint32_t)Int_val(__d))
 
 #ifndef Val_none
@@ -70,14 +70,15 @@ static void Noreturn failwith_xc(xc_interface *xch)
 CAMLprim value stub_xc_interface_open(void)
 {
 	CAMLparam0();
-        xc_interface *xch;
+	CAMLlocal1(result);
 
+	result = caml_alloc(1, Abstract_tag);
 	/* Don't assert XC_OPENFLAG_NON_REENTRANT because these bindings
 	 * do not prevent re-entrancy to libxc */
-        xch = xc_interface_open(NULL, NULL, 0);
-        if (xch == NULL)
+	_H(result) = xc_interface_open(NULL, NULL, 0);
+	if (_H(result) == NULL)
 		failwith_xc(NULL);
-        CAMLreturn((value)xch);
+	CAMLreturn(result);
 }
 
 
-- 
2.34.1


