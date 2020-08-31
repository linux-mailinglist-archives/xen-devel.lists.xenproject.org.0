Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439AF2638BB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:54:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG82v-0000e6-A2; Wed, 09 Sep 2020 21:54:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG82t-0000c5-8O
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:54:27 +0000
X-Inumbo-ID: 9b897bcd-38c0-48ac-936d-585f8b8b5679
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b897bcd-38c0-48ac-936d-585f8b8b5679;
 Wed, 09 Sep 2020 21:54:25 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LsBuK039257
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:54:17 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LsBrQ039256;
 Wed, 9 Sep 2020 14:54:11 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092154.089LsBrQ039256@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Mon, 31 Aug 2020 16:01:08 -0700
Subject: [PATCH 10/11 RFC] gitignore: Create .gitignore file for tools/
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

The portion of .gitignore associated with tools/ is rather large, create
a new directory-specific .gitignore file for tools/.

git's ignore format include shell globs, but not the extensions many
shells provide.  "/include/xen-foreign/*.(c|h|size)" doesn't work.

With a bunch of headers.chk files being present, use
"/libs/*/headers.chk" to merge them all into a single line.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
This is certainly *not* the final version.  Problem is there are a bunch
of adjustments which are needed, but I don't want to include in a patch
without advice.

Notably, earlier in this series underscore patterns have come up.  There
are *many* entries in here which specify underscores.

I also note several entries featuring "/build/", while the toplevel
.gitignore includes "build-*".  This also features "/qemu-xen-build"
which is similar.

Should "/hotplug/**/*xencommons" and "/hotplug/**/*xen*domain*" be
added?

What of "/fuzz/x86_instruction_emulator/x86[-_]emulate*"?

Should also merge things to "/libxl/[ds]sdt*".

A final step would simply sort these patterns.
---
 .gitignore       | 152 -----------------------------------------------
 tools/.gitignore | 144 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 152 deletions(-)
 create mode 100644 tools/.gitignore

diff --git a/.gitignore b/.gitignore
index 877c2579ab..5c17736c2e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -49,158 +49,6 @@ build-*
 dist/*
 extras/mini-os*
 install/*
-tools/*/build/lib*/*.py
-tools/libs/toolcore/headers.chk
-tools/libs/toollog/headers.chk
-tools/libs/evtchn/headers.chk
-tools/libs/gnttab/headers.chk
-tools/libs/hypfs/headers.chk
-tools/libs/call/headers.chk
-tools/libs/foreignmemory/headers.chk
-tools/libs/devicemodel/headers.chk
-tools/console/xenconsole
-tools/console/xenconsoled
-tools/console/client/_paths.h
-tools/console/daemon/_paths.h
-tools/debugger/gdb/gdb-6.2.1-linux-i386-xen/*
-tools/debugger/gdb/gdb-6.2.1/*
-tools/debugger/gdbsx/gdbsx
-tools/debugger/xenitp/xenitp
-tools/flask/utils/flask-getenforce
-tools/flask/utils/flask-get-bool
-tools/flask/utils/flask-loadpolicy
-tools/flask/utils/flask-setenforce
-tools/flask/utils/flask-set-bool
-tools/flask/utils/flask-label-pci
-tools/fuzz/libelf/afl-libelf-fuzzer
-tools/fuzz/x86_instruction_emulator/asm
-tools/fuzz/x86_instruction_emulator/afl-harness
-tools/fuzz/x86_instruction_emulator/afl-harness-cov
-tools/fuzz/x86_instruction_emulator/wrappers.c
-tools/fuzz/x86_instruction_emulator/x86_emulate
-tools/fuzz/x86_instruction_emulator/x86-emulate.[ch]
-tools/helpers/_paths.h
-tools/helpers/init-xenstore-domain
-tools/helpers/xen-init-dom0
-tools/hotplug/common/hotplugpath.sh
-tools/hotplug/FreeBSD/rc.d/xencommons
-tools/hotplug/FreeBSD/rc.d/xendriverdomain
-tools/hotplug/Linux/init.d/sysconfig.xencommons
-tools/hotplug/Linux/init.d/sysconfig.xendomains
-tools/hotplug/Linux/init.d/xen-watchdog
-tools/hotplug/Linux/init.d/xencommons
-tools/hotplug/Linux/init.d/xendomains
-tools/hotplug/Linux/init.d/xendriverdomain
-tools/hotplug/Linux/launch-xenstore
-tools/hotplug/Linux/systemd/*.conf
-tools/hotplug/Linux/systemd/*.mount
-tools/hotplug/Linux/systemd/*.socket
-tools/hotplug/Linux/systemd/*.service
-tools/hotplug/Linux/vif-setup
-tools/hotplug/Linux/xen-backend.rules
-tools/hotplug/Linux/xen-hotplug-common.sh
-tools/hotplug/Linux/xendomains
-tools/hotplug/NetBSD/rc.d/xencommons
-tools/hotplug/NetBSD/rc.d/xendriverdomain
-tools/include/acpi
-tools/include/xen/*
-tools/include/xen-xsm/*
-tools/include/xen-foreign/*.(c|h|size)
-tools/include/xen-foreign/checker
-tools/libxl/_libxl.api-for-check
-tools/libxl/*.api-ok
-tools/libxl/dsdt*
-tools/libxl/libxlu_cfg_y.output
-tools/libxl/mk_dsdt
-tools/libxl/ssdt*
-tools/libxl/testenum
-tools/libxl/testenum.c
-tools/libxl/tmp.*
-tools/pkg-config/*
-tools/qemu-xen-build
-tools/xentrace/xenalyze
-tools/pygrub/build/*
-tools/python/build/*
-tools/security/secpol_tool
-tools/security/xen/*
-tools/security/xensec_tool
-tools/tests/depriv/depriv-fd-checker
-tools/tests/x86_emulator/32/x86_emulate
-tools/tests/x86_emulator/3dnow*.[ch]
-tools/tests/x86_emulator/asm
-tools/tests/x86_emulator/avx*.[ch]
-tools/tests/x86_emulator/blowfish.h
-tools/tests/x86_emulator/fma*.[ch]
-tools/tests/x86_emulator/*sse*.[ch]
-tools/tests/x86_emulator/test_x86_emulator
-tools/tests/x86_emulator/x86_emulate
-tools/tests/x86_emulator/xop*.[ch]
-tools/tests/xen-access/xen-access
-tools/tests/xenstore/xs-test
-tools/tests/regression/installed/*
-tools/tests/regression/build/*
-tools/tests/regression/downloads/*
-tools/tests/mem-sharing/memshrtool
-tools/tests/mce-test/tools/xen-mceinj
-tools/tests/vpci/list.h
-tools/tests/vpci/vpci.[hc]
-tools/tests/vpci/test_vpci
-tools/xcutils/lsevtchn
-tools/xcutils/readnotes
-tools/xenbackendd/_paths.h
-tools/xenbackendd/xenbackendd
-tools/xenmon/xentrace_setmask
-tools/xenmon/xenbaked
-tools/xenpaging/xenpaging
-tools/xenpmd/xenpmd
-tools/xenstat/libxenstat/src/_paths.h
-tools/xenstat/xentop/xentop
-tools/xenstore/xenstore
-tools/xenstore/xenstore-chmod
-tools/xenstore/xenstore-exists
-tools/xenstore/xenstore-list
-tools/xenstore/xenstore-read
-tools/xenstore/xenstore-rm
-tools/xenstore/xenstore-write
-tools/xenstore/xenstore-control
-tools/xenstore/xenstore-ls
-tools/xenstore/xenstored
-tools/xenstore/xenstored_test
-tools/xenstore/xs_tdb_dump
-tools/xentrace/xentrace_setsize
-tools/xentrace/tbctl
-tools/xentrace/xenctx
-tools/xentrace/xentrace
-tools/flask/policy/policy.conf
-tools/flask/policy/xenpolicy-*
 LibVNCServer*
 
-tools/qemu-xen-dir-remote
-tools/qemu-xen-dir
-
-tools/qemu-xen-traditional-dir-remote
-tools/qemu-xen-traditional-dir
-
-tools/include/xen-foreign/checker.c
-tools/include/xen-foreign/x86_32.h
-tools/include/xen-foreign/x86_64.h
-tools/include/xen-foreign/arm32.h
-tools/include/xen-foreign/arm64.h
-
 .git
-tools/libs/toolcore/include/_*.h
-tools/libxc/_*.[ch]
-tools/libxl/_*.[ch]
-tools/libxl/testidl
-tools/libxl/testidl.c
-tools/libxl/libxl-save-helper
-tools/libxl/test_timedereg
-tools/libxl/test_fdderegrace
-tools/libvchan/vchan-node[12]
-tools/libvchan/vchan-socket-proxy
-tools/debugger/kdd/kdd
-tools/python/xen/lowlevel/xl/_pyxl_types.c
-tools/python/xen/lowlevel/xl/_pyxl_types.h
-tools/xenstore/xenstore-watch
-tools/xl/_paths.h
-tools/xl/xl
diff --git a/tools/.gitignore b/tools/.gitignore
new file mode 100644
index 0000000000..02fb665cf6
--- /dev/null
+++ b/tools/.gitignore
@@ -0,0 +1,144 @@
+/*/build/lib*/*.py
+/libs/*/headers.chk
+/console/xenconsole
+/console/xenconsoled
+/console/client/_paths.h
+/console/daemon/_paths.h
+/debugger/gdb/gdb-6.2.1-linux-i386-xen/
+/debugger/gdb/gdb-6.2.1/
+/debugger/gdbsx/gdbsx
+/debugger/xenitp/xenitp
+/flask/utils/flask-getenforce
+/flask/utils/flask-get-bool
+/flask/utils/flask-loadpolicy
+/flask/utils/flask-setenforce
+/flask/utils/flask-set-bool
+/flask/utils/flask-label-pci
+/fuzz/libelf/afl-libelf-fuzzer
+/fuzz/x86_instruction_emulator/asm
+/fuzz/x86_instruction_emulator/afl-harness
+/fuzz/x86_instruction_emulator/afl-harness-cov
+/fuzz/x86_instruction_emulator/wrappers.c
+/fuzz/x86_instruction_emulator/x86_emulate
+/fuzz/x86_instruction_emulator/x86-emulate.[ch]
+/helpers/_paths.h
+/helpers/init-xenstore-domain
+/helpers/xen-init-dom0
+/hotplug/common/hotplugpath.sh
+/hotplug/FreeBSD/rc.d/xencommons
+/hotplug/FreeBSD/rc.d/xendriverdomain
+/hotplug/Linux/init.d/sysconfig.xencommons
+/hotplug/Linux/init.d/sysconfig.xendomains
+/hotplug/Linux/init.d/xen-watchdog
+/hotplug/Linux/init.d/xencommons
+/hotplug/Linux/init.d/xendomains
+/hotplug/Linux/init.d/xendriverdomain
+/hotplug/Linux/launch-xenstore
+/hotplug/Linux/systemd/*.conf
+/hotplug/Linux/systemd/*.mount
+/hotplug/Linux/systemd/*.socket
+/hotplug/Linux/systemd/*.service
+/hotplug/Linux/vif-setup
+/hotplug/Linux/xen-backend.rules
+/hotplug/Linux/xen-hotplug-common.sh
+/hotplug/Linux/xendomains
+/hotplug/NetBSD/rc.d/xencommons
+/hotplug/NetBSD/rc.d/xendriverdomain
+/include/acpi
+/include/xen/
+/include/xen-xsm/
+/include/xen-foreign/checker
+/libxl/_libxl.api-for-check
+/libxl/*.api-ok
+/libxl/dsdt*
+/libxl/libxlu_cfg_y.output
+/libxl/mk_dsdt
+/libxl/ssdt*
+/libxl/testenum
+/libxl/testenum.c
+/libxl/tmp.*
+/pkg-config/
+/qemu-xen-build
+/xentrace/xenalyze
+/pygrub/build/
+/python/build/
+/security/secpol_tool
+/security/xen/
+/security/xensec_tool
+/tests/depriv/depriv-fd-checker
+/tests/x86_emulator/32/x86_emulate
+/tests/x86_emulator/3dnow*.[ch]
+/tests/x86_emulator/asm
+/tests/x86_emulator/avx*.[ch]
+/tests/x86_emulator/blowfish.h
+/tests/x86_emulator/fma*.[ch]
+/tests/x86_emulator/*sse*.[ch]
+/tests/x86_emulator/test_x86_emulator
+/tests/x86_emulator/x86_emulate
+/tests/x86_emulator/xop*.[ch]
+/tests/xen-access/xen-access
+/tests/xenstore/xs-test
+/tests/regression/installed/
+/tests/regression/build/
+/tests/regression/downloads/
+/tests/mem-sharing/memshrtool
+/tests/mce-test/tools/xen-mceinj
+/tests/vpci/list.h
+/tests/vpci/vpci.[hc]
+/tests/vpci/test_vpci
+/xcutils/lsevtchn
+/xcutils/readnotes
+/xenbackendd/_paths.h
+/xenbackendd/xenbackendd
+/xenmon/xentrace_setmask
+/xenmon/xenbaked
+/xenpaging/xenpaging
+/xenpmd/xenpmd
+/xenstat/libxenstat/src/_paths.h
+/xenstat/xentop/xentop
+/xenstore/xenstore
+/xenstore/xenstore-chmod
+/xenstore/xenstore-exists
+/xenstore/xenstore-list
+/xenstore/xenstore-read
+/xenstore/xenstore-rm
+/xenstore/xenstore-write
+/xenstore/xenstore-control
+/xenstore/xenstore-ls
+/xenstore/xenstored
+/xenstore/xenstored_test
+/xenstore/xs_tdb_dump
+/xentrace/xentrace_setsize
+/xentrace/tbctl
+/xentrace/xenctx
+/xentrace/xentrace
+/flask/policy/policy.conf
+/flask/policy/xenpolicy-*
+
+/qemu-xen-dir-remote
+/qemu-xen-dir
+
+/qemu-xen-traditional-dir-remote
+/qemu-xen-traditional-dir
+
+/include/xen-foreign/checker.c
+/include/xen-foreign/x86_32.h
+/include/xen-foreign/x86_64.h
+/include/xen-foreign/arm32.h
+/include/xen-foreign/arm64.h
+
+/libs/toolcore/include/_*.h
+/libxc/_*.[ch]
+/libxl/_*.[ch]
+/libxl/testidl
+/libxl/testidl.c
+/libxl/libxl-save-helper
+/libxl/test_timedereg
+/libxl/test_fdderegrace
+/libvchan/vchan-node[12]
+/libvchan/vchan-socket-proxy
+/debugger/kdd/kdd
+/python/xen/lowlevel/xl/_pyxl_types.[ch]
+/xenstore/xenstore-watch
+/xl/_paths.h
+/xl/xl
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




