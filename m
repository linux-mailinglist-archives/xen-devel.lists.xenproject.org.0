Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BDA2638B5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG81z-0000B1-VF; Wed, 09 Sep 2020 21:53:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG81x-0000AW-Ph
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:29 +0000
X-Inumbo-ID: 15a718c3-f89b-49f9-8457-a384fd9681f1
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15a718c3-f89b-49f9-8457-a384fd9681f1;
 Wed, 09 Sep 2020 21:53:25 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LrAD3039189
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:16 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LrA2R039188;
 Wed, 9 Sep 2020 14:53:10 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089LrA2R039188@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Tue, 1 Sep 2020 18:08:46 -0700
Subject: [PATCH 03/11 RFC] gitignore: Add/Generalize entries
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

"stubdom/*.tar.gz" already existed as an entry.  Given the presence of
tarball ignore rules for tools, generalize the entry to match most
tarballs.  Tarballs should generally be left out of git repositories and
"-f" is appropriate for the very rare exception.

Multiple "config.h" entries had been present.  This is common enough to
add a common entry to cover the pattern everywhere.

Substantial numbers of pkg-config file ignore lines were present.  While
use of pkg-config is being reduced, ignoring such files in general seems
like an appropriate measure.

Python is growing in use, since patterns for underscore files seem likely
to be added, add a safety pattern to ensure Python double-underscore
files are preserved.

I'm pretty sure anything .old is unlikely to need to remain in history.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
Question I have is:  Should "_*.[chS]" or "_*" be added as ignore
patterns?

Underscore is frequently used to mark intermediate files used during
build, but not worthy of preservation.  There are a bunch of directories
where "_paths.h" is ignored, and some "_*.[ch]" entries.  Yet should this
be generalized to *all* underscore files?

Preparing for this I've added "!__*__.py" which will override such and
ensure "__init__.py" files are *not* ignored.  I forsee a future where
Python adds another similar filename.
---
 .gitignore | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/.gitignore b/.gitignore
index 0f0e79b6d1..507f1eb0cd 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
+!__*__.py
 .hg
 .*.cmd
 *.orig
@@ -12,11 +13,15 @@
 *.so.[0-9]*
 *.bin
 *.bak
+*.tar
+*.tar.*z*
 *.tmp
 *.spot
 *.spit
 *.gcno
 *.gcda
+*.old
+*.pc
 *.py[ocd]
 TAGS
 GTAGS
@@ -33,12 +38,12 @@ cscope.po.out
 .vscode
 
 dist
-stubdom/*.tar.gz
 
 autom4te.cache/
 config.log
 config.status
 config.cache
+config.h
 config/Toplevel.mk
 config/Paths.mk
 
@@ -89,33 +94,23 @@ stubdom/vtpm/vtpm_manager.h
 stubdom/xenstore
 stubdom/zlib-*
 tools/*/build/lib*/*.py
-tools/config.h
 config/Tools.mk
 config/Stubdom.mk
 config/Docs.mk
 tools/libs/toolcore/headers.chk
-tools/libs/toolcore/xentoolcore.pc
 tools/libs/toollog/headers.chk
-tools/libs/toollog/xentoollog.pc
 tools/libs/evtchn/headers.chk
-tools/libs/evtchn/xenevtchn.pc
 tools/libs/gnttab/headers.chk
-tools/libs/gnttab/xengnttab.pc
 tools/libs/hypfs/headers.chk
-tools/libs/hypfs/xenhypfs.pc
 tools/libs/call/headers.chk
-tools/libs/call/xencall.pc
 tools/libs/foreignmemory/headers.chk
-tools/libs/foreignmemory/xenforeignmemory.pc
 tools/libs/devicemodel/headers.chk
-tools/libs/devicemodel/xendevicemodel.pc
 tools/console/xenconsole
 tools/console/xenconsoled
 tools/console/client/_paths.h
 tools/console/daemon/_paths.h
 tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
 tools/debugger/gdb/gdb-6.2.1/*
-tools/debugger/gdb/gdb-6.2.1.tar.bz2
 tools/debugger/gdbsx/gdbsx
 tools/debugger/xenitp/xenitp
 tools/firmware/*/biossums
@@ -136,7 +131,6 @@ tools/firmware/rombios/rombios[^/]*.s
 tools/firmware/rombios/32bit/32bitbios_flat.h
 tools/firmware/vgabios/vbetables-gen
 tools/firmware/vgabios/vbetables.h
-tools/firmware/xen-dir/*.old
 tools/firmware/xen-dir/linkfarm.stamp*
 tools/firmware/xen-dir/xen-root
 tools/firmware/xen-dir/xen-shim
@@ -182,11 +176,8 @@ tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker
-tools/libvchan/xenvchan.pc
-tools/libxc/*.pc
 tools/libxl/_libxl.api-for-check
 tools/libxl/*.api-ok
-tools/libxl/*.pc
 tools/libxl/dsdt*
 tools/libxl/libxlu_cfg_y.output
 tools/libxl/mk_dsdt
@@ -232,7 +223,6 @@ tools/xenmon/xenbaked
 tools/xenpaging/xenpaging
 tools/xenpmd/xenpmd
 tools/xenstat/libxenstat/src/_paths.h
-tools/xenstat/libxenstat/xenstat.pc
 tools/xenstat/xentop/xentop
 tools/xenstore/xenstore
 tools/xenstore/xenstore-chmod
@@ -245,7 +235,6 @@ tools/xenstore/xenstore-control
 tools/xenstore/xenstore-ls
 tools/xenstore/xenstored
 tools/xenstore/xenstored_test
-tools/xenstore/xenstore.pc
 tools/xenstore/xs_tdb_dump
 tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
@@ -253,7 +242,6 @@ tools/xentrace/xenctx
 tools/xentrace/xentrace
 xen/.banner
 xen/.config
-xen/.config.old
 xen/.xen.elf32
 xen/System.map
 xen/arch/x86/asm-macros.i
@@ -284,7 +272,6 @@ xen/include/xen/*.new
 xen/include/xen/acm_policy.h
 xen/include/xen/compile.h
 xen/include/xen/lib/x86/cpuid-autogen.h
-xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
 xen/test/livepatch/*.livepatch
 xen/tools/symbols
@@ -327,7 +314,6 @@ tools/libxl/libxl-save-helper
 tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
 tools/firmware/etherboot/eb-roms.h
-tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
 tools/libvchan/vchan-node[12]
 tools/libvchan/vchan-socket-proxy
 tools/ocaml/*/.ocamldep.make
@@ -359,7 +345,6 @@ tools/ocaml/test/list_domains
 tools/ocaml/test/dmesg
 tools/ocaml/test/raise_exception
 tools/debugger/kdd/kdd
-tools/firmware/etherboot/ipxe.tar.gz
 tools/firmware/etherboot/ipxe/
 tools/python/xen/lowlevel/xl/_pyxl_types.c
 tools/python/xen/lowlevel/xl/_pyxl_types.h
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




