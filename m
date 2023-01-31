Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD26838AC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487851.755625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC9-0001nr-95; Tue, 31 Jan 2023 21:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487851.755625; Tue, 31 Jan 2023 21:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC9-0001j6-1L; Tue, 31 Jan 2023 21:29:37 +0000
Received: by outflank-mailman (input) for mailman id 487851;
 Tue, 31 Jan 2023 21:29:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC6-0000Nb-Km
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5908c139-a1ae-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 22:29:32 +0100 (CET)
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
X-Inumbo-ID: 5908c139-a1ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DuMXyrr37uOetL3gBS1wPn+orSXwgbl8VJbcI3sGhvc=;
  b=Ualea35HX4y91C5TstnZbZvNo7xjd/wVtHCYkgPb/79wLexkIhn8FGS5
   8R4yewTlbnn0PswKqrQ/g7D0IHilaEizMxQ6vDJIjf3ws1B5d4bAblvpB
   wiH7KwSZcNP7JRuBueqnDJ+RSW7lczhNEY1DcYk9YJYgjhYTlQBZOoFgT
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95499184
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Gk3+MazYHRxfxxsTyDp6t+c2xirEfRIJ4+MujC+fZmUNrF6WrkUGz
 2MYWjuBPKmIYTH8L4onOYvjo0gE75SDydNhSAc5rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnPqkT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUhW0
 KQqbxITVwmKiu6Sm+6SeNt9v+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZQIwhfJ/
 zKal4j/Ki8lNMbA6AurzmKDueXSkg/ZXZwxEYTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYQUsRdO/c34waMzuzT+QnxO4QfZmcfMpp87pZwHGF0k
 AbTxLsFGACDrpW8UVfFxPC2swqrMCUZCTReTB02XDIstoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStamW0bb1HRcNJG9GRF5mLI+htDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/e9TIW9DqiJNIARCnSUSONg1Hg+DXN8Iki3yBR8+U3BE
 cjznTmQ4YYyVv08kWveqxY12r433CEurV4/triipylLJYG2PSbPIZ9caQvmUwzMxP/cyOkj2
 4oFZpTiJtQ2eLGWXxQ7BqZIdAxUdidmWcqmwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:nQbdZ6p2m/YJiPBfwBbHvWUaV5syLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ki90KnpexPhHO1OkPIs1NaZLUDbUQSTXeVfBOfZrQEIXheOj9K1tp
 0QO5SWaueAamSS5PySiGXWLz9j+qjgzEnCv5a8854Zd3AOV0gW1XYaNu/0KCxLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ac/nfq8bNnJfGZwdDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWw4VKlMDnwt5jAtXJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKR/ZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS3tL7zkYvH7f2WoUh7bD3z3klU6vo2xiKqrzPJd
 MeTf00IswmNG9yIUqp+lWHi+bcJEjbVi32P3Tq/PblngS+1UoJs3cw1YgRmGwN+4k6TIQB7+
 PYMr5wnLULVcMOa7lhbd1xNfdfJ1a9My4kCljiVGjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DEXElDvWA/dkryAYnWtac7hCzlUSG4R3Dg28te7592tvn1Q6fqKzSKTBQrn9G7q/sSD8XHU7
 K4OY5QAfXkMWzycLw5qDHWSt1XMz0TQccVstE0VxaHpd/KMJTjsqjBfPPaNNPWYEUZs6PEcw
 s+tRTIVbR9BxqQKwDFaTDqKg3QRnA=
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95499184"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 6/7] tools/ocaml/xc: Don't reference Abstract_Tag objects with the GC lock released
Date: Tue, 31 Jan 2023 21:29:12 +0000
Message-ID: <20230131212913.6199-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The intf->{addr,len} references in the xc_map_foreign_range() call are unsafe.
From the manual:

  https://ocaml.org/manual/intfc.html#ss:parallel-execution-long-running-c-code

"After caml_release_runtime_system() was called and until
caml_acquire_runtime_system() is called, the C code must not access any OCaml
data, nor call any function of the run-time system, nor call back into OCaml
code."

More than what the manual says, the intf pointer is (potentially) invalidated
by caml_enter_blocking_section() if another thread happens to perform garbage
collection at just the right (wrong) moment.

Rewrite the logic.  There's no need to stash data in the Ocaml object until
the success path at the very end.

Fixes: 8b7ce06a2d34 ("ocaml: Add XC bindings.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Note: the mmap stub has a similar pattern when constructing a mmap_interface,
but, but it's not actually unsafe because it doesn't drop the GC lock.

_H() is buggy too, but this patch needs backporting further than that fix.
---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 291663bb278a..e5277f6f19a2 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1028,26 +1028,25 @@ CAMLprim value stub_map_foreign_range(value xch, value dom,
 	CAMLparam4(xch, dom, size, mfn);
 	CAMLlocal1(result);
 	struct mmap_interface *intf;
-	uint32_t c_dom;
-	unsigned long c_mfn;
+	unsigned long c_mfn = Nativeint_val(mfn);
+	int len = Int_val(size);
+	void *ptr;
 
 	BUILD_BUG_ON((sizeof(struct mmap_interface) % sizeof(value)) != 0);
 	result = caml_alloc(Wsize_bsize(sizeof(struct mmap_interface)),
 			    Abstract_tag);
 
-	intf = (struct mmap_interface *) result;
-
-	intf->len = Int_val(size);
-
-	c_dom = _D(dom);
-	c_mfn = Nativeint_val(mfn);
 	caml_enter_blocking_section();
-	intf->addr = xc_map_foreign_range(_H(xch), c_dom,
-	                                  intf->len, PROT_READ|PROT_WRITE,
-	                                  c_mfn);
+	ptr = xc_map_foreign_range(_H(xch), _D(dom), len,
+				   PROT_READ|PROT_WRITE, c_mfn);
 	caml_leave_blocking_section();
-	if (!intf->addr)
+
+	if (!ptr)
 		caml_failwith("xc_map_foreign_range error");
+
+	intf = Data_abstract_val(result);
+	*intf = (struct mmap_interface){ ptr, len };
+
 	CAMLreturn(result);
 }
 
-- 
2.11.0


