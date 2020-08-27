Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4C2638B6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 23:53:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG81f-00006t-C1; Wed, 09 Sep 2020 21:53:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG81d-00006m-Tx
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:09 +0000
X-Inumbo-ID: 9c2a3557-f0b5-43e9-a03b-30eec45fc989
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c2a3557-f0b5-43e9-a03b-30eec45fc989;
 Wed, 09 Sep 2020 21:53:08 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089Lqrk6039177
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:52:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LqrKZ039176;
 Wed, 9 Sep 2020 14:52:53 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092152.089LqrKZ039176@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Date: Thu, 27 Aug 2020 12:09:05 -0700
Subject: [PATCH 01/11 v2] gitignore: Move ignores from global to subdirectories
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

Subdirectories which have .gitignore files should not be referenced in
the global .gitignore files.  Move several lines to appropriate subdirs.

When moved to the subdirectories the slash after the directory name is
left on as otherwise the names potentially become unanchored (without a
leading slash, "foo" also matches "bar/foo").

As a final step these were either sorted or formatted to match existing
file format.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
Changes in v2:
- More information in commit message
- Rebased onto correct branch before submission
---
 .gitignore                   | 31 -------------------------------
 tools/misc/.gitignore        | 23 ++++++++++++++++++++++-
 xen/tools/kconfig/.gitignore |  6 ++++++
 xen/xsm/flask/.gitignore     |  9 ++++++++-
 4 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/.gitignore b/.gitignore
index 36ce2ea104..429a484ecc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -204,21 +204,6 @@ tools/libxl/ssdt*
 tools/libxl/testenum
 tools/libxl/testenum.c
 tools/libxl/tmp.*
-tools/misc/cpuperf/cpuperf-perfcntr
-tools/misc/cpuperf/cpuperf-xen
-tools/misc/xc_shadow
-tools/misc/xen_cpuperf
-tools/misc/xen-cpuid
-tools/misc/xen-detect
-tools/misc/xen-diag
-tools/misc/xen-tmem-list-parse
-tools/misc/xen-livepatch
-tools/misc/xenperf
-tools/misc/xenpm
-tools/misc/xen-hvmctx
-tools/misc/xenlockprof
-tools/misc/lowmemd
-tools/misc/xencov
 tools/pkg-config/*
 tools/qemu-xen-build
 tools/xentrace/xenalyze
@@ -315,17 +300,7 @@ xen/include/xen/lib/x86/cpuid-autogen.h
 xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
 xen/test/livepatch/*.livepatch
-xen/tools/kconfig/.tmp_gtkcheck
-xen/tools/kconfig/.tmp_qtcheck
 xen/tools/symbols
-xen/xsm/flask/flask-policy.S
-xen/xsm/flask/include/av_perm_to_string.h
-xen/xsm/flask/include/av_permissions.h
-xen/xsm/flask/include/class_to_string.h
-xen/xsm/flask/include/flask.h
-xen/xsm/flask/include/initial_sid_to_string.h
-xen/xsm/flask/policy.*
-xen/xsm/flask/xenpolicy-*
 tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
 xen/xen
@@ -357,8 +332,6 @@ tools/include/xen-foreign/arm32.h
 tools/include/xen-foreign/arm64.h
 
 .git
-tools/misc/xen-hptool
-tools/misc/xen-mfndump
 tools/libs/toolcore/include/_*.h
 tools/libxc/_*.[ch]
 tools/libxl/_*.[ch]
@@ -370,10 +343,6 @@ tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
 tools/firmware/etherboot/eb-roms.h
 tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
-tools/misc/xenhypfs
-tools/misc/xenwatchdogd
-tools/misc/xen-hvmcrash
-tools/misc/xen-lowmemd
 tools/libvchan/vchan-node[12]
 tools/libvchan/vchan-socket-proxy
 tools/ocaml/*/.ocamldep.make
diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index c5fe2cfccd..f909ceccb1 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1 +1,22 @@
-xen-ucode
+/cpuperf/cpuperf-perfcntr
+/cpuperf/cpuperf-xen
+/lowmemd
+/xc_shadow
+/xen-cpuid
+/xen-detect
+/xen-diag
+/xen-hptool
+/xen-hvmcrash
+/xen-hvmctx
+/xen-livepatch
+/xen-lowmemd
+/xen-mfndump
+/xen-tmem-list-parse
+/xen-ucode
+/xen_cpuperf
+/xencov
+/xenhypfs
+/xenlockprof
+/xenperf
+/xenpm
+/xenwatchdogd
diff --git a/xen/tools/kconfig/.gitignore b/xen/tools/kconfig/.gitignore
index 9638790613..e289215d27 100644
--- a/xen/tools/kconfig/.gitignore
+++ b/xen/tools/kconfig/.gitignore
@@ -15,3 +15,9 @@ mconf
 nconf
 qconf
 gconf
+
+#
+# temporary build tool checking files
+#
+/.tmp_gtkcheck
+/.tmp_qtcheck
diff --git a/xen/xsm/flask/.gitignore b/xen/xsm/flask/.gitignore
index 024edbe0ba..f186747c51 100644
--- a/xen/xsm/flask/.gitignore
+++ b/xen/xsm/flask/.gitignore
@@ -1 +1,8 @@
-/policy.c
+/flask-policy.S
+/include/av_perm_to_string.h
+/include/av_permissions.h
+/include/class_to_string.h
+/include/flask.h
+/include/initial_sid_to_string.h
+/policy.*
+/xenpolicy-*
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




