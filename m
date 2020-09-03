Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB12638B3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:53:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG82D-0000G1-My; Wed, 09 Sep 2020 21:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG82C-0000FX-77
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:44 +0000
X-Inumbo-ID: c84e87e5-fec7-422a-b89d-4224bad49334
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c84e87e5-fec7-422a-b89d-4224bad49334;
 Wed, 09 Sep 2020 21:53:43 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LrSQ9039208
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:34 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LrS8D039207;
 Wed, 9 Sep 2020 14:53:28 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089LrS8D039207@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: David Scott <dave@recoil.org>
Date: Wed, 2 Sep 2020 21:10:32 -0700
Subject: [PATCH 05/11 RFC] gitignore: Create .gitignore file for tools/ocaml/
X-Spam-Status: No, score=2.1 required=10.0 tests=DATE_IN_PAST_96_XX,
 KHOP_HELO_FCRDNS autolearn=no autolearn_force=no version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com
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

The portion of the global .gitignore attributeable to tools/ocaml/ is
significant.  As such, create a local .gitignore file.  Currently the
OCAML bits for Xen are also somewhat contained to this one area too.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
I have a suspicion several of the patterns *should* be more general
and/or the OCAML area could use some local ignore patterns.

In particular "*.annot", "*.cm[ixao]", "*.cmxa", ".ocamldep.make" and
"META" might be appropriate as general patterns for tools/ocaml/ and not
be restricted to subdirectories.
---
 .gitignore             | 28 ----------------------------
 tools/ocaml/.gitignore | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 28 deletions(-)
 create mode 100644 tools/ocaml/.gitignore

diff --git a/.gitignore b/.gitignore
index 08800a11d5..297cd59c5c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -284,34 +284,6 @@ tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
 tools/libvchan/vchan-node[12]
 tools/libvchan/vchan-socket-proxy
-tools/ocaml/*/.ocamldep.make
-tools/ocaml/*/*.cm[ixao]
-tools/ocaml/*/*.cmxa
-tools/ocaml/*/*.annot
-tools/ocaml/*/*/.ocamldep.make
-tools/ocaml/*/*/*.cm[ixao]
-tools/ocaml/*/*/*.cmxa
-tools/ocaml/*/*/*.annot
-tools/ocaml/*/*/META
-tools/ocaml/libs/xl/_libxl_types.inc
-tools/ocaml/libs/xl/_libxl_types.ml.in
-tools/ocaml/libs/xl/_libxl_types.mli.in
-tools/ocaml/libs/xl/xenlight.ml
-tools/ocaml/libs/xl/xenlight.mli
-tools/ocaml/libs/xentoollog/_xtl_levels.*
-tools/ocaml/libs/xentoollog/xentoollog.ml
-tools/ocaml/libs/xentoollog/xentoollog.mli
-tools/ocaml/libs/xs/paths.ml
-tools/ocaml/libs/xc/xenctrl_abi_check.h
-tools/ocaml/xenstored/_paths.h
-tools/ocaml/xenstored/oxenstored
-tools/ocaml/xenstored/oxenstored.conf
-tools/ocaml/xenstored/paths.ml
-tools/ocaml/test/xtl
-tools/ocaml/test/send_debug_keys
-tools/ocaml/test/list_domains
-tools/ocaml/test/dmesg
-tools/ocaml/test/raise_exception
 tools/debugger/kdd/kdd
 tools/python/xen/lowlevel/xl/_pyxl_types.c
 tools/python/xen/lowlevel/xl/_pyxl_types.h
diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore
new file mode 100644
index 0000000000..8b50454937
--- /dev/null
+++ b/tools/ocaml/.gitignore
@@ -0,0 +1,24 @@
+/*/**/*.annot
+/*/**/*.cm[ixao]
+/*/**/*.cmxa
+/*/**/.ocamldep.make
+/*/*/META
+/libs/xc/xenctrl_abi_check.h
+/libs/xentoollog/_xtl_levels.*
+/libs/xentoollog/xentoollog.ml
+/libs/xentoollog/xentoollog.mli
+/libs/xl/_libxl_types.inc
+/libs/xl/_libxl_types.ml.in
+/libs/xl/_libxl_types.mli.in
+/libs/xl/xenlight.ml
+/libs/xl/xenlight.mli
+/libs/xs/paths.ml
+/test/dmesg
+/test/list_domains
+/test/raise_exception
+/test/send_debug_keys
+/test/xtl
+/xenstored/_paths.h
+/xenstored/oxenstored
+/xenstored/oxenstored.conf
+/xenstored/paths.ml
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




