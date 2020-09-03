Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA52638B4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG824-0000Cg-8P; Wed, 09 Sep 2020 21:53:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG823-0000CP-78
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:35 +0000
X-Inumbo-ID: a1277cf1-3f12-40f6-8239-64eef8707e85
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1277cf1-3f12-40f6-8239-64eef8707e85;
 Wed, 09 Sep 2020 21:53:34 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LrJoQ039197
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:25 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LrJm8039196;
 Wed, 9 Sep 2020 14:53:19 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089LrJm8039196@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Wed, 2 Sep 2020 20:59:11 -0700
Subject: [PATCH 04/11 RFC] gitignore: Create .gitignore file for
 tools/firmware/
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

The portion of the global .gitignore attributeable to tools/firmware/ is
significant.  As such, create a local .gitignore file.

Several duplicate lines have been filtered out.

Several overlapping lines were merged ("_rombios*_.c" and "rombios*.s"
cover more than previous authors thought).

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
Looking at this later, I'm pretty sure a "*.sym" entry should be added.
"/*.sym" and "/rombios/rombios.sym" exist, that seems a likely name for
an assembler informational output file.

I also notice this curious pattern with "mk_dsdt" and "[ds]sdt*".  Those
show in tools/libxl and tools/firmware/hvmloader.  Alas these are
distinct .gitignore files.

---
 .gitignore                | 33 ---------------------------------
 tools/firmware/.gitignore | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 33 deletions(-)
 create mode 100644 tools/firmware/.gitignore

diff --git a/.gitignore b/.gitignore
index 507f1eb0cd..08800a11d5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -113,28 +113,6 @@ tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
 tools/debugger/gdbsx/gdbsx
 tools/debugger/xenitp/xenitp
-tools/firmware/*/biossums
-tools/firmware/*.sym
-tools/firmware/*bios/*bios*.txt
-tools/firmware/etherboot/gpxe/*
-tools/firmware/extboot/extboot.img
-tools/firmware/extboot/signrom
-tools/firmware/hvmloader/dsdt*
-tools/firmware/hvmloader/hvmloader
-tools/firmware/hvmloader/mk_dsdt
-tools/firmware/hvmloader/roms.h
-tools/firmware/hvmloader/roms.inc
-tools/firmware/hvmloader/ssdt*
-tools/firmware/rombios/BIOS-bochs-[^/]*
-tools/firmware/rombios/_rombios[^/]*_.c
-tools/firmware/rombios/rombios[^/]*.s
-tools/firmware/rombios/32bit/32bitbios_flat.h
-tools/firmware/vgabios/vbetables-gen
-tools/firmware/vgabios/vbetables.h
-tools/firmware/xen-dir/linkfarm.stamp*
-tools/firmware/xen-dir/xen-root
-tools/firmware/xen-dir/xen-shim
-tools/firmware/xen-dir/xen-shim-syms
 tools/flask/utils/flask-getenforce
 tools/flask/utils/flask-get-bool
 tools/flask/utils/flask-loadpolicy
@@ -289,15 +267,6 @@ tools/qemu-xen-dir
 tools/qemu-xen-traditional-dir-remote
 tools/qemu-xen-traditional-dir
 
-tools/firmware/seabios-dir-remote
-tools/firmware/seabios-dir
-
-tools/firmware/ovmf-dir-remote
-tools/firmware/ovmf-dir
-
-tools/firmware/rombios/_rombios_.c
-tools/firmware/rombios/rombios.s
-tools/firmware/rombios/rombios.sym
 tools/include/xen-foreign/checker.c
 tools/include/xen-foreign/x86_32.h
 tools/include/xen-foreign/x86_64.h
@@ -313,7 +282,6 @@ tools/libxl/testidl.c
 tools/libxl/libxl-save-helper
 tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
-tools/firmware/etherboot/eb-roms.h
 tools/libvchan/vchan-node[12]
 tools/libvchan/vchan-socket-proxy
 tools/ocaml/*/.ocamldep.make
@@ -345,7 +313,6 @@ tools/ocaml/test/list_domains
 tools/ocaml/test/dmesg
 tools/ocaml/test/raise_exception
 tools/debugger/kdd/kdd
-tools/firmware/etherboot/ipxe/
 tools/python/xen/lowlevel/xl/_pyxl_types.c
 tools/python/xen/lowlevel/xl/_pyxl_types.h
 tools/xenstore/xenstore-watch
diff --git a/tools/firmware/.gitignore b/tools/firmware/.gitignore
new file mode 100644
index 0000000000..8a1a83e44b
--- /dev/null
+++ b/tools/firmware/.gitignore
@@ -0,0 +1,29 @@
+/*.sym
+/*/biossums
+/*bios/*bios*.txt
+/etherboot/eb-roms.h
+/etherboot/gpxe/
+/etherboot/ipxe/
+/extboot/extboot.img
+/extboot/signrom
+/hvmloader/dsdt*
+/hvmloader/hvmloader
+/hvmloader/mk_dsdt
+/hvmloader/roms.h
+/hvmloader/roms.inc
+/hvmloader/ssdt*
+/ovmf-dir
+/ovmf-dir-remote
+/rombios/32bit/32bitbios_flat.h
+/rombios/BIOS-bochs-[^/]*
+/rombios/_rombios*_.c
+/rombios/rombios*.s
+/rombios/rombios.sym
+/seabios-dir
+/seabios-dir-remote
+/vgabios/vbetables-gen
+/vgabios/vbetables.h
+/xen-dir/linkfarm.stamp*
+/xen-dir/xen-root
+/xen-dir/xen-shim
+/xen-dir/xen-shim-syms
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




