Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02D5854CC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377691.611021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBn-0007lj-8i; Fri, 29 Jul 2022 17:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377691.611021; Fri, 29 Jul 2022 17:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBn-0007jh-4O; Fri, 29 Jul 2022 17:54:19 +0000
Received: by outflank-mailman (input) for mailman id 377691;
 Fri, 29 Jul 2022 17:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBl-0006a9-Bo
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75963896-0f67-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 19:54:16 +0200 (CEST)
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
X-Inumbo-ID: 75963896-0f67-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RkbRUEdOWEaCHa9+/Ptg/amm9wD5Jpr8o1Ls9yYeJ4s=;
  b=gN5sn3moo+oRFf86iejqDq7FlUjbatC2OJyxQ1g0DRDlFXogVjcZB1ws
   pMj5OLQg39fqcGR0yHAiNuSSO2kJHKXPw6VgmyHi/Rcr/UjJGINKO1BKN
   eFj68MGpwU3v3KF6QoF71s3ZDl04OGDQs05d0cv6IY0buWEamcGJZliDT
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77388875
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CWTGF6ooLySU/BLxNlG4Siz64opeBmJ7ZRIvgKrLsJaIsI4StFCzt
 garIBmBb/aPZWfzftgjbYSyp04G6sSDmIJnGQdppSk2EXgU+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q52lJ5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU80PhLMGYV9
 MdBLS4ucFOOiPKz4rmSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8aBIw/mqG0gWP4cBVTqU6PpLpx6G/WpOB0+Oeya4qFKoPXLSlTtkiZn
 Vr50UrDOCwXLNGW7TGI9ky8j/CayEsXX6pNTeblp5aGmma7ymUNBTUMWFC8oP3/jVSxM/pAL
 2QE9yxoqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYVa36IulqmizAnEQM0wcJiILXQ4n6PC29enfkSnzosZf/L+d14OoSGmtk
 m3S/UDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK514AvMQIZyv2MvUoC25UNyjN5fG6fekJq9iONoYeCnSPXFTvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUsn5VBc5GPvH481jO50rh3SMEuJGvgXOTz7jufFDJNUIJ9ZWGazghcRtv/d+VWNq
 IoCXyZIoj0GONDDjuDs2dZ7BTg3wbITXPgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:BZPhpqzw6gv8Rot2yYapKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="77388875"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: [PATCH v1 3/7] tools/ocaml/*/dune: dune based build system
Date: Fri, 29 Jul 2022 18:53:26 +0100
Message-ID: <0f2c08734668626a618767680493a006827e123b.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Based on Christian Lindig's work.

Initially this will be used to build unit tests, and to make development
easier.

Dune supports proper incremental builds and editor integration with
merlin/LSP.

For now the Makefile based build system is retained too: this is not a
hard dependency on Dune.

Using version 2.1 of Dune build language here, because that is the one
available in Ubuntu Focal (part of the CI here).

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/.gitignore               |  7 +++++
 tools/dune                     |  5 ++++
 tools/dune-project             |  1 +
 tools/ocaml/dune-project       | 27 ++++++++++++++++++
 tools/ocaml/libs/eventchn/dune | 11 ++++++++
 tools/ocaml/libs/mmap/dune     |  9 ++++++
 tools/ocaml/libs/xb/dune       | 10 +++++++
 tools/ocaml/libs/xc/dune       | 16 +++++++++++
 tools/ocaml/libs/xs/dune       | 15 ++++++++++
 tools/ocaml/xenstored/dune     | 51 ++++++++++++++++++++++++++++++++++
 10 files changed, 152 insertions(+)
 create mode 100644 tools/.gitignore
 create mode 100644 tools/dune
 create mode 100644 tools/dune-project
 create mode 100644 tools/ocaml/dune-project
 create mode 100644 tools/ocaml/libs/eventchn/dune
 create mode 100644 tools/ocaml/libs/mmap/dune
 create mode 100644 tools/ocaml/libs/xb/dune
 create mode 100644 tools/ocaml/libs/xc/dune
 create mode 100644 tools/ocaml/libs/xs/dune
 create mode 100644 tools/ocaml/xenstored/dune

diff --git a/tools/.gitignore b/tools/.gitignore
new file mode 100644
index 0000000000..c211749a3b
--- /dev/null
+++ b/tools/.gitignore
@@ -0,0 +1,7 @@
+dune-workspace*
+_build/
+.merlin
+*.h.gch
+*.opam
+ocaml/*.install
+include/_xentoolcore_list.h
diff --git a/tools/dune b/tools/dune
new file mode 100644
index 0000000000..febbd078f0
--- /dev/null
+++ b/tools/dune
@@ -0,0 +1,5 @@
+; only look inside ocaml and include subdirectory, speeds up the build
+; since dune doesn't need to copy/hash/monitor all the other files
+(dirs ocaml)
+
+(data_only_dirs include libs)
diff --git a/tools/dune-project b/tools/dune-project
new file mode 100644
index 0000000000..cd8d4e3d86
--- /dev/null
+++ b/tools/dune-project
@@ -0,0 +1 @@
+(lang dune 2.1)
diff --git a/tools/ocaml/dune-project b/tools/ocaml/dune-project
new file mode 100644
index 0000000000..1dae7b0acb
--- /dev/null
+++ b/tools/ocaml/dune-project
@@ -0,0 +1,27 @@
+(lang dune 2.1)
+
+(name xen)
+
+(formatting (enabled_for dune))
+(generate_opam_files true)
+
+(maintainers christian.lindig@citrix.com)
+(license LGPL)
+
+(package
+ (name xen)
+ (synopsis "Xen interfaces")
+ (depends
+  base-unix
+  (dune (>= 2.1))
+ )
+)
+
+(package
+ (name xenstored)
+ (synopsis "In-memory key-value store for the Xen hypervisor")
+ (depends
+  base-unix
+  (dune (>= 2.1))
+ )
+)
diff --git a/tools/ocaml/libs/eventchn/dune b/tools/ocaml/libs/eventchn/dune
new file mode 100644
index 0000000000..4468f2e769
--- /dev/null
+++ b/tools/ocaml/libs/eventchn/dune
@@ -0,0 +1,11 @@
+(library
+ (foreign_stubs
+  (language c)
+  (names xeneventchn_stubs)
+  (extra_deps ../../../include/xen/xen.h ../../../libs/evtchn/libxenevtchn.so)
+  (include_dirs ../../../include))
+ (name xeneventchn)
+ (public_name xen.eventchn)
+ (libraries unix)
+ (no_dynlink)
+ (c_library_flags -lxenevtchn))
diff --git a/tools/ocaml/libs/mmap/dune b/tools/ocaml/libs/mmap/dune
new file mode 100644
index 0000000000..57a8ab5b9b
--- /dev/null
+++ b/tools/ocaml/libs/mmap/dune
@@ -0,0 +1,9 @@
+(library
+ (foreign_stubs
+  (language c)
+  (names xenmmap_stubs))
+ (name xenmmap)
+ (public_name xen.mmap)
+ (libraries unix)
+ (no_dynlink)
+ (install_c_headers mmap_stubs))
diff --git a/tools/ocaml/libs/xb/dune b/tools/ocaml/libs/xb/dune
new file mode 100644
index 0000000000..13a507ea87
--- /dev/null
+++ b/tools/ocaml/libs/xb/dune
@@ -0,0 +1,10 @@
+(library
+ (foreign_stubs
+  (language c)
+  (extra_deps ../../../include/xen/xen.h)
+  (include_dirs ../../../include)
+  (names xenbus_stubs xs_ring_stubs))
+ (name xenbus)
+ (public_name xen.bus)
+ (no_dynlink)
+ (libraries unix xenmmap))
diff --git a/tools/ocaml/libs/xc/dune b/tools/ocaml/libs/xc/dune
new file mode 100644
index 0000000000..6f9450cd27
--- /dev/null
+++ b/tools/ocaml/libs/xc/dune
@@ -0,0 +1,16 @@
+(rule
+ (with-stdout-to
+  xenctrl_abi_check.h
+  (run perl -w %{dep:abi-check} %{dep:xenctrl_stubs.c} %{dep:xenctrl.ml})))
+
+(library
+ (foreign_stubs
+  (language c)
+  (names xenctrl_stubs)
+  (extra_deps ../../../include/xen/xen.h ../../../libs/ctrl/libxenctrl.so)
+  (include_dirs ../../../include))
+ (name xenctrl)
+ (public_name xen.ctrl)
+ (libraries unix xenmmap)
+ (no_dynlink)
+ (c_library_flags -lxenctrl -lxenguest))
diff --git a/tools/ocaml/libs/xs/dune b/tools/ocaml/libs/xs/dune
new file mode 100644
index 0000000000..086259f51d
--- /dev/null
+++ b/tools/ocaml/libs/xs/dune
@@ -0,0 +1,15 @@
+; fallback mode: the files may have been generated by configure already
+
+(rule
+ (targets paths.ml)
+ (deps paths.ml.in)
+ (mode fallback)
+ (action
+  (run ../../../config.status --file=paths.ml)))
+
+(library
+ ; avoid conflict with mirage lib: name it differently
+ (name xenstore_xen)
+ (public_name xen.store)
+ (no_dynlink)
+ (libraries unix xenbus))
diff --git a/tools/ocaml/xenstored/dune b/tools/ocaml/xenstored/dune
new file mode 100644
index 0000000000..d71decebcf
--- /dev/null
+++ b/tools/ocaml/xenstored/dune
@@ -0,0 +1,51 @@
+; fallback mode: the files may have been generated by configure already
+; also for fallback mode either all files must be present or none
+; hence the 2 separate rules here
+
+(rule
+ (targets oxenstored.conf)
+ (deps oxenstored.conf.in)
+ (mode fallback)
+ (action
+  (run ../../config.status --file=oxenstored.conf)))
+
+(rule
+ (targets paths.ml)
+ (deps paths.ml.in)
+ (mode fallback)
+ (action
+  (run ../../config.status --file=paths.ml)))
+
+(executable
+ (modes native)
+ (name xenstored)
+ (modules
+  (:standard \ syslog systemd))
+ (flags
+  (:standard -w -52))
+ (libraries unix xen.bus xen.mmap xen.ctrl xen.eventchn xenstubs))
+
+(install
+ (package xenstored)
+ (section sbin)
+ (files
+  (xenstored.exe as oxenstored)))
+
+(install
+ (package xen)
+ (section etc)
+ (files oxenstored.conf))
+
+(library
+ (foreign_stubs
+  (language c)
+  (names syslog_stubs systemd_stubs select_stubs)
+  (extra_deps ../../dune-workspace)
+  (flags
+   (:standard -DHAVE_SYSTEMD)))
+ (modules syslog systemd)
+ (name xenstubs)
+ (wrapped false)
+ (libraries unix)
+ (no_dynlink)
+ (c_library_flags -lsystemd))
-- 
2.34.1


