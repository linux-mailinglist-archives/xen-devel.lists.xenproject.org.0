Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8D5EC0D4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412490.655835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Ym-0007iK-DN; Tue, 27 Sep 2022 11:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412490.655835; Tue, 27 Sep 2022 11:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Ym-0007dA-9G; Tue, 27 Sep 2022 11:15:32 +0000
Received: by outflank-mailman (input) for mailman id 412490;
 Tue, 27 Sep 2022 11:15:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1od8Yk-0007aQ-BB
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:15:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b14c2f06-3e55-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 13:15:28 +0200 (CEST)
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
X-Inumbo-ID: b14c2f06-3e55-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664277329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PA8SwB/EvHlNCm3CPVr6Dv8QaMWrEqHTBibfZeLpZrQ=;
  b=bg2v8w06Z0DCpgbYABuDdrN5x8S35H3y3z/ndKp6nVIPSuEQ0asw2hB3
   5wO/N6SvYh/XWoNB6sTZfJ8OLwJ7ZvC5FjURV09AGLcrlpXgcnpmKq+Cz
   VslvjNtkxbBA6eBHybwcDAz9pNeRjqNhAZPwhJBW8/+8wvnm+iVqrMLou
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81413305
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9abglqpLPTlzFuHWH9Dlo4pqBOheBmJnZRIvgKrLsJaIsI4StFCzt
 garIBmGOPqMajH0f94kbd/kox4BvJPTy4U2TVNorS49H3gQoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 8BfeAxObjW6u/Owy7KwE+BqtM8xFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAi3XhcjsetFWPoqkf6GnP1g1hlrPqNbI5f/TaHJkMxR3A+
 woq+UyhPxUxKO7DzgOE81f83eTvuz3jQqsrQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 0Ad5CcGt6U5802vCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxusBW9FESwCQBY4XA0O49K6qYcBhQD2G4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrWzFF52LJ9o4DNRCyKBBba45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIQSOMEuKV7XrXk/DaJ144wKuBdErE3CE
 c3DLZbE4YgyUMyLMwZat89CiOR2l0jSNEvYRIzhzgTP7IdykEW9EO5dWGZim8hjs8toVi2Jr
 IsEXyZLoj0DONDDjt7/qtdLcQ1WcCRT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:vuTbzqMvuyJ0fcBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81413305"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 5/5] tools/ocaml/libs/{xb, mmap}: use Data_abstract_val wrapper
Date: Tue, 27 Sep 2022 12:15:01 +0100
Message-ID: <58b6cb7c02d8b06d90dd419727572abb0cd41d75.1664276827.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664276827.git.edvin.torok@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is not strictly necessary since it is essentially a no-op
currently: a cast to void* and value*, even in OCaml 5.0.

However it does make it clearer that what we have here is not a regular
OCaml value, but one allocated with Abstract_tag or Custom_tag,
and follows the example from the manual more closely:
https://v2.ocaml.org/manual/intfc.html#ss:c-outside-head

It also makes it clearer that these modules have been reviewed for
compat with OCaml 5.0.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 2 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index e2ce088e25..141dedb78c 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -28,7 +28,7 @@
 #include <caml/fail.h>
 #include <caml/callback.h>
 
-#define Intf_val(a) ((struct mmap_interface *) a)
+#define Intf_val(a) ((struct mmap_interface *) Data_abstract_val(a))
 
 static int mmap_interface_init(struct mmap_interface *intf,
                                int fd, int pflag, int mflag,
diff --git a/tools/ocaml/libs/xb/xs_ring_stubs.c b/tools/ocaml/libs/xb/xs_ring_stubs.c
index 7a91fdee75..cc9114029f 100644
--- a/tools/ocaml/libs/xb/xs_ring_stubs.c
+++ b/tools/ocaml/libs/xb/xs_ring_stubs.c
@@ -35,7 +35,7 @@
 #include <sys/mman.h>
 #include "mmap_stubs.h"
 
-#define GET_C_STRUCT(a) ((struct mmap_interface *) a)
+#define GET_C_STRUCT(a) ((struct mmap_interface *) Data_abstract_val(a))
 
 /*
  * Bytes_val has been introduced by Ocaml 4.06.1. So define our own version
-- 
2.34.1


