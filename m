Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A325532A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 04:58:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBUah-0003j8-2q; Fri, 28 Aug 2020 02:58:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cd5S=CG=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kBUaf-0003j3-QC
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 02:58:09 +0000
X-Inumbo-ID: 0f673ddb-2825-42c2-851e-6118865cf03a
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f673ddb-2825-42c2-851e-6118865cf03a;
 Fri, 28 Aug 2020 02:58:08 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07S2vox5025296
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 27 Aug 2020 22:57:56 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07S2vlWp025295;
 Thu, 27 Aug 2020 19:57:47 -0700 (PDT) (envelope-from ehem)
Date: Thu, 27 Aug 2020 19:57:47 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH] gitignore: Move ignores from global to subdirectories
Message-ID: <20200828025747.GA25246@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
 autolearn=unavailable autolearn_force=no version=3.4.4
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

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
Hopefully the commit message covers it.  When moved to the subdirectories
I'm using "./<file>" as otherwise any file sharing the name in a deeper
subdirectory would be subject to the match.

---
 .gitignore                   | 29 -----------------------------
 tools/misc/.gitignore        | 22 +++++++++++++++++++++-
 xen/tools/kconfig/.gitignore |  6 ++++++
 xen/xsm/flask/.gitignore     |  8 +++++++-
 4 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/.gitignore b/.gitignore
index bb0fb64d32..c8529bc858 100644
--- a/.gitignore
+++ b/.gitignore
@@ -201,21 +201,6 @@ tools/libxl/ssdt*
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
@@ -312,16 +297,7 @@ xen/test/livepatch/xen_bye_world.livepatch
 xen/test/livepatch/xen_hello_world.livepatch
 xen/test/livepatch/xen_nop.livepatch
 xen/test/livepatch/xen_replace_world.livepatch
-xen/tools/kconfig/.tmp_gtkcheck
-xen/tools/kconfig/.tmp_qtcheck
 xen/tools/symbols
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
@@ -357,8 +333,6 @@ tools/include/xen-foreign/arm32.h
 tools/include/xen-foreign/arm64.h
 
 .git
-tools/misc/xen-hptool
-tools/misc/xen-mfndump
 tools/libs/toolcore/include/_*.h
 tools/libxc/_*.[ch]
 tools/libxl/_*.[ch]
@@ -370,9 +344,6 @@ tools/libxl/test_timedereg
 tools/libxl/test_fdderegrace
 tools/firmware/etherboot/eb-roms.h
 tools/firmware/etherboot/gpxe-git-snapshot.tar.gz
-tools/misc/xenwatchdogd
-tools/misc/xen-hvmcrash
-tools/misc/xen-lowmemd
 tools/libvchan/vchan-node[12]
 tools/ocaml/*/.ocamldep.make
 tools/ocaml/*/*.cm[ixao]
diff --git a/tools/misc/.gitignore b/tools/misc/.gitignore
index c5fe2cfccd..b561bb023e 100644
--- a/tools/misc/.gitignore
+++ b/tools/misc/.gitignore
@@ -1 +1,21 @@
-xen-ucode
+./cpuperf/cpuperf-perfcntr
+./cpuperf/cpuperf-xen
+./lowmemd
+./xc_shadow
+./xen-cpuid
+./xen-detect
+./xen-diag
+./xen-hptool
+./xen-hvmcrash
+./xen-hvmctx
+./xen-livepatch
+./xen-lowmemd
+./xen-mfndump
+./xen-tmem-list-parse
+./xen-ucode
+./xen_cpuperf
+./xencov
+./xenlockprof
+./xenperf
+./xenpm
+./xenwatchdogd
diff --git a/xen/tools/kconfig/.gitignore b/xen/tools/kconfig/.gitignore
index ca38e983d6..69780c04cd 100644
--- a/xen/tools/kconfig/.gitignore
+++ b/xen/tools/kconfig/.gitignore
@@ -16,3 +16,9 @@ mconf
 nconf
 qconf
 gconf
+
+#
+# temporary build tool checking files
+#
+./.tmp_gtkcheck
+./.tmp_qtcheck
diff --git a/xen/xsm/flask/.gitignore b/xen/xsm/flask/.gitignore
index 024edbe0ba..b10754e646 100644
--- a/xen/xsm/flask/.gitignore
+++ b/xen/xsm/flask/.gitignore
@@ -1 +1,7 @@
-/policy.c
+./include/av_perm_to_string.h
+./include/av_permissions.h
+./include/class_to_string.h
+./include/flask.h
+./include/initial_sid_to_string.h
+./policy.*
+./xenpolicy-*
-- 
2.20.1




-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



