Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7A6838AD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487847.755593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC6-00019m-9F; Tue, 31 Jan 2023 21:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487847.755593; Tue, 31 Jan 2023 21:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC6-000159-4P; Tue, 31 Jan 2023 21:29:34 +0000
Received: by outflank-mailman (input) for mailman id 487847;
 Tue, 31 Jan 2023 21:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC4-0000Nb-Kh
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58eef30c-a1ae-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 22:29:31 +0100 (CET)
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
X-Inumbo-ID: 58eef30c-a1ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h6tenPYxyZVuTbfcgU9nfxQU9sqSsuEBVjFHdCiT8ok=;
  b=ZqQqvOdX5KKbbBc3TH9V8JrKxTvwFWztDm1k7EmLlFMal2Qc2wD+TqMZ
   MZj+V/IaN4scW7KbBhxfC/5ayssWolx4KVrtyEtccb5tDt0lvvDBvtvEV
   N8h6tAFJtwyY9c0q7TKebPETQ/bQV7g9QRc9QqhlA2PoLcfTTsmXI2xWG
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95499179
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dbqxyaKz/vJ8W1YuFE+R0JUlxSXFcZb7ZxGr2PjKsXjdYENShDMOz
 2QcXGCPaPuNajDyKNkiPYmy8E1S6JTWm4MyQVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wdnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5eGUQWx
 7s6NgkUZx2Po7nq6YCJW9BF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbGJkEzx/H9
 woq+UziPB9CZYSR+AaI91ypgM70xDrZcYE7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasshcCVvJKHuY96QXLzbDbizt1HUBdEGQHMoZ/8pZrG3pzj
 AThc87V6SJHmaWwEUDa1KmttDq/NQxOcUYwVz49ZF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6zdWNE/qQQ1d3XEy9hK0yDLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp1kPGxTYy9C6qOMbKih6SdkyferElTibO4hTixwCDAb4lgU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HPjGI+Cc+ePGPha9EO5VWGZim8hltMtoVi2Jq
 YcAXyZLoj0DONDDjt7/qtdPcwtVcCRhVfgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:x/ZWIKsggLX9ZL7yRf0m/2E77skCb4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H5BEGBKUm9yXcH2/hrAV7CZniuhILGFvAH0WKP+VPd8mjFh5dgPM
 RbAuBD4b/LfD9HZK/BiWHVfOrIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcWeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoZ8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KEuZj1kIMUjgY1q3MwiFXBuYdQ99eXBmcIa+d
 xVfYDhDTBtABanhj7izy1SKZeXLw4O91+9MzU/U4quonVrdTlCvjcl7d1akXEa+J0nTZ5Yo+
 zCL6RzjblLCtQbdKRnGY46ML+K40H2MGDx2VipUCHaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXLhfRwg2bwaXT4WS6oxtBV5pB/tLG5TL33MTebQFRrl8e7uf0QDsDSRv
 72MpNLBP3oK3foBO9yrnrDcogXLWNbXNweu949VV7LqsXXKpfyvuiea/rXLKqFK0dWZoo+OA
 pyYNHeHrQw0qnwYA6GvPH4YQKSRnDC
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95499179"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 2/7] tools/ocaml/libs: Allocate the correct amount of memory for Abstract_tag
Date: Tue, 31 Jan 2023 21:29:08 +0000
Message-ID: <20230131212913.6199-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

caml_alloc() takes units of Wsize (word size), not bytes.  As a consequence,
we're allocating 4 or 8 times too much memory.

Ocaml has a helper, Wsize_bsize(), but it truncates cases which aren't an
exact multiple.  Use a BUILD_BUG_ON() to cover the potential for truncation,
as there's no rounding-up form of the helper.

Fixes: 8b7ce06a2d34 ("ocaml: Add XC bindings.")
Fixes: d3e649277a13 ("ocaml: add mmap bindings implementation.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/mmap/Makefile        | 2 ++
 tools/ocaml/libs/mmap/xenmmap_stubs.c | 6 +++++-
 tools/ocaml/libs/xc/xenctrl_stubs.c   | 5 ++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/libs/mmap/Makefile b/tools/ocaml/libs/mmap/Makefile
index a62153713571..855b8b2c9877 100644
--- a/tools/ocaml/libs/mmap/Makefile
+++ b/tools/ocaml/libs/mmap/Makefile
@@ -2,6 +2,8 @@ OCAML_TOPLEVEL=$(CURDIR)/../..
 XEN_ROOT=$(OCAML_TOPLEVEL)/../..
 include $(OCAML_TOPLEVEL)/common.make
 
+CFLAGS += $(CFLAGS_xeninclude)
+
 OBJS = xenmmap
 INTF = $(foreach obj, $(OBJS),$(obj).cmi)
 LIBS = xenmmap.cma xenmmap.cmxa
diff --git a/tools/ocaml/libs/mmap/xenmmap_stubs.c b/tools/ocaml/libs/mmap/xenmmap_stubs.c
index e03951d781bb..d623ad390e40 100644
--- a/tools/ocaml/libs/mmap/xenmmap_stubs.c
+++ b/tools/ocaml/libs/mmap/xenmmap_stubs.c
@@ -21,6 +21,8 @@
 #include <errno.h>
 #include "mmap_stubs.h"
 
+#include <xen-tools/libs.h>
+
 #include <caml/mlvalues.h>
 #include <caml/memory.h>
 #include <caml/alloc.h>
@@ -59,7 +61,9 @@ CAMLprim value stub_mmap_init(value fd, value pflag, value mflag,
 	default: caml_invalid_argument("maptype");
 	}
 
-	result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
+	BUILD_BUG_ON((sizeof(struct mmap_interface) % sizeof(value)) != 0);
+	result = caml_alloc(Wsize_bsize(sizeof(struct mmap_interface)),
+			    Abstract_tag);
 
 	if (mmap_interface_init(Intf_val(result), Int_val(fd),
 	                        c_pflag, c_mflag,
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 728818445975..fd1f306f0202 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -1031,7 +1031,10 @@ CAMLprim value stub_map_foreign_range(value xch, value dom,
 	uint32_t c_dom;
 	unsigned long c_mfn;
 
-	result = caml_alloc(sizeof(struct mmap_interface), Abstract_tag);
+	BUILD_BUG_ON((sizeof(struct mmap_interface) % sizeof(value)) != 0);
+	result = caml_alloc(Wsize_bsize(sizeof(struct mmap_interface)),
+			    Abstract_tag);
+
 	intf = (struct mmap_interface *) result;
 
 	intf->len = Int_val(size);
-- 
2.11.0


