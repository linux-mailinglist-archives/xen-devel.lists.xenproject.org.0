Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF6F37ADD6
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125901.237016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWml-0001pp-1j; Tue, 11 May 2021 18:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125901.237016; Tue, 11 May 2021 18:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmk-0001no-Sk; Tue, 11 May 2021 18:07:10 +0000
Received: by outflank-mailman (input) for mailman id 125901;
 Tue, 11 May 2021 18:07:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmi-0000hb-Pw
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:07:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09254c1f-cd3b-4beb-961a-f31b7ee5b6c1;
 Tue, 11 May 2021 18:06:58 +0000 (UTC)
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
X-Inumbo-ID: 09254c1f-cd3b-4beb-961a-f31b7ee5b6c1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aZQnD/ue/pcqfGJ1B3U3Ds8P1LU7rkGdfiBQesXOyvs=;
  b=Bsh+joSp9ubehxyeFsp0OBKM3X1ildEv2941iLvMNt+MTErlGwDwYW/p
   g/XiY0bojUGXd0Al2vPQ4s9/ZzJ7VbFWfTgOZ/7p0VbrZ1utHoplHJMlc
   BQruwQC6LAGVwoRa1eWheZELF3ZQv+VS6dToa09FyvoksrpFV9Ho5kdJN
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zddHIAFWfMIgeURa1CfnJgKd/RtNaAjlYYDng/ZSmL96M1P9iL7XVVnUwfVNXKI67vgaI+LOVI
 +kEyw35KXTccct8VYNlMCmVHBiAeY27lj7enqNJnrnpljdPiDwu6Nj6m46bSJw8bdfLnpgAPAo
 7Ddgcf+wRafZruBAr3ZLFVtFQrYXhskO2O/eYJfDoUEMBuun9opdi5wEBn5YveW6LwDeELYP3e
 RpNQKMu7T/0ynbzt2qTbhDt6VBqWyTCXJcg/ShFStmQxeZyXgM6CmXg0QYXqHS+EL0tQeKFpov
 OFY=
X-SBRS: 5.1
X-MesageID: 43954237
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7s5/Ra98dAr91pxwh6puk+Hxdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8bpYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOReEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3CcFkzOQrArGrUWShWNwyEGT3vDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw1RgVyuK4IC2CrHDE10bKUNRj/UC3WrFuIIO5bbZviH+9Na1wVx4SxLpXYN
 WGPfuskcq+K2nqHkwxllMfs+BEcE5DYCu7fg==
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43954237"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/17] tools/ocaml: add unit test skeleton with Dune build system
Date: Tue, 11 May 2021 19:05:15 +0100
Message-ID: <f51e272a5255fe130ca511f081302f51203ccebf.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Based on initial work by Christian Lindig

Doing oxenstored development, especially fuzzing/unit tests requires
an incremental and fast build system.

Dune is the preferred upstream build system for OCaml, and has been in
use by the XAPI project for years.
Is is incremental and also generates editor integration files (.merlin).

Usage:
./xs-reconfigure.sh
cd tools/ocaml
make clean
make check

There are some other convenience targets as well:
make dune-clean
make dune-syntax-check
make dune-build-oxenstored

There are some files that are generated by Make, these are created
by a 'dune-pre' target, they are too closely tied to make and
cannot yet be generated by Dune itself.

The various Makefile targets are used as entrypoints into Dune
that set the needed env vars (for C include files and libraries)
and ensure that the generated files are available.

The unit tests do not require Xen to be available, so add mock
eventchn and xenctrl libraries for the unit test to use,
and copy the non-system specific modules from xenstored/ to
xenstored/test/.

Xenstored had to be split into Xenstored and Xenstored_main,
so that we can use the functions defined in Xenstored without
actually starting up the daemon in a unit test.
Similarly argument parsing had to be delayed until after daemon startup.

Also had to disable setrlimit when running as non-root in poll.ml.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/.gitignore                       |  2 +
 tools/ocaml/Makefile                         | 33 +++++++++++++
 tools/ocaml/dune-project                     |  5 ++
 tools/ocaml/libs/eventchn/dune               |  8 ++++
 tools/ocaml/libs/mmap/dune                   |  8 ++++
 tools/ocaml/libs/xb/dune                     |  7 +++
 tools/ocaml/libs/xc/dune                     |  9 ++++
 tools/ocaml/libs/xs/dune                     |  4 ++
 tools/ocaml/xen.opam                         |  1 +
 tools/ocaml/xenstore.opam                    |  1 +
 tools/ocaml/xenstored.opam                   | 21 ++++++++
 tools/ocaml/xenstored/Makefile               |  3 +-
 tools/ocaml/xenstored/dune                   | 19 ++++++++
 tools/ocaml/xenstored/parse_arg.ml           |  2 +-
 tools/ocaml/xenstored/poll.ml                |  3 +-
 tools/ocaml/xenstored/test/dune              | 11 +++++
 tools/ocaml/xenstored/test/xenctrl.ml        | 48 +++++++++++++++++++
 tools/ocaml/xenstored/test/xeneventchn.ml    | 50 ++++++++++++++++++++
 tools/ocaml/xenstored/test/xenstored_test.ml |  2 +
 tools/ocaml/xenstored/xenstored.ml           |  4 +-
 tools/ocaml/xenstored/xenstored_main.ml      |  1 +
 21 files changed, 237 insertions(+), 5 deletions(-)
 create mode 100644 tools/ocaml/.gitignore
 create mode 100644 tools/ocaml/dune-project
 create mode 100644 tools/ocaml/libs/eventchn/dune
 create mode 100644 tools/ocaml/libs/mmap/dune
 create mode 100644 tools/ocaml/libs/xb/dune
 create mode 100644 tools/ocaml/libs/xc/dune
 create mode 100644 tools/ocaml/libs/xs/dune
 create mode 100644 tools/ocaml/xen.opam
 create mode 100644 tools/ocaml/xenstore.opam
 create mode 100644 tools/ocaml/xenstored.opam
 create mode 100644 tools/ocaml/xenstored/dune
 create mode 100644 tools/ocaml/xenstored/test/dune
 create mode 100644 tools/ocaml/xenstored/test/xenctrl.ml
 create mode 100644 tools/ocaml/xenstored/test/xeneventchn.ml
 create mode 100644 tools/ocaml/xenstored/test/xenstored_test.ml
 create mode 100644 tools/ocaml/xenstored/xenstored_main.ml

diff --git a/tools/ocaml/.gitignore b/tools/ocaml/.gitignore
new file mode 100644
index 0000000000..655e32b07c
--- /dev/null
+++ b/tools/ocaml/.gitignore
@@ -0,0 +1,2 @@
+_build
+.merlin
diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index a7c04b6546..53dd0a0f0d 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -34,3 +34,36 @@ build-tools-oxenstored:
 	$(MAKE) -s -C libs/xb
 	$(MAKE) -s -C libs/xc
 	$(MAKE) -C xenstored
+
+LIBRARY_PATH=$(XEN_libxenctrl):$(XEN_libxenguest):$(XEN_libxentoollog):$(XEN_libxencall):$(XEN_libxenevtchn):$(XEN_libxenforeignmemory):$(XEN_libxengnttab):$(XEN_libxendevicemodel):$(XEN_libxentoolcore)
+C_INCLUDE_PATH=$(XEN_libxenctrl)/include:$(XEN_libxengnttab)/include:$(XEN_libxenevtchn)/include:$(XEN_libxentoollog)/include:$(XEN_INCLUDE)
+
+# Files generated by the Makefile
+# These cannot be generated from dune, because dune cannot refer to files
+# in the parent directory (so it couldn't copy/use Config.mk)
+.PHONY: dune-pre
+dune-pre:
+	$(MAKE) -s -C ../../ build-tools-public-headers
+	$(MAKE) -s -C libs/xs paths.ml
+	$(MAKE) -s -C libs/xc xenctrl_abi_check.h
+	$(MAKE) -s -C xenstored paths.ml _paths.h
+
+.PHONY: check
+check: dune-pre
+	# --force isn't necessary here if the test is deterministic
+	OCAMLRUNPARAM=b C_INCLUDE_PATH=$(C_INCLUDE_PATH) dune runtest --profile=release --no-buffer --force
+
+# Convenience targets for development
+
+.PHONY: dune-clean
+dune-clean:
+	$(MAKE) clean
+	dune clean
+
+.PHONY: dune-syntax-check
+dune-syntax-check: dune-pre
+	LIBRARY_PATH=$(LIBRARY_PATH) C_INCLUDE_PATH=$(C_INCLUDE_PATH) dune build --profile=release @check
+
+.PHONY: build-oxenstored-dune
+dune-build-oxenstored: dune-pre
+	LD_LIBRARY_PATH=$(LIBRARY_PATH) LIBRARY_PATH=$(LIBRARY_PATH) C_INCLUDE_PATH=$(C_INCLUDE_PATH) dune build --profile=release @all
diff --git a/tools/ocaml/dune-project b/tools/ocaml/dune-project
new file mode 100644
index 0000000000..b41cfae68b
--- /dev/null
+++ b/tools/ocaml/dune-project
@@ -0,0 +1,5 @@
+(lang dune 2.0)
+
+(name xen)
+
+(formatting disabled)
diff --git a/tools/ocaml/libs/eventchn/dune b/tools/ocaml/libs/eventchn/dune
new file mode 100644
index 0000000000..e08bc76fdf
--- /dev/null
+++ b/tools/ocaml/libs/eventchn/dune
@@ -0,0 +1,8 @@
+(library
+ (foreign_stubs
+  (language c)
+  (names xeneventchn_stubs))
+ (name xeneventchn)
+ (public_name xen.eventchn)
+ (libraries unix)
+ (c_library_flags -lxenevtchn))
diff --git a/tools/ocaml/libs/mmap/dune b/tools/ocaml/libs/mmap/dune
new file mode 100644
index 0000000000..a47de44e47
--- /dev/null
+++ b/tools/ocaml/libs/mmap/dune
@@ -0,0 +1,8 @@
+(library
+ (foreign_stubs
+  (language c)
+  (names xenmmap_stubs))
+ (name xenmmap)
+ (public_name xen.mmap)
+ (libraries unix)
+ (install_c_headers mmap_stubs))
diff --git a/tools/ocaml/libs/xb/dune b/tools/ocaml/libs/xb/dune
new file mode 100644
index 0000000000..feb30adc01
--- /dev/null
+++ b/tools/ocaml/libs/xb/dune
@@ -0,0 +1,7 @@
+(library
+ (foreign_stubs
+  (language c)
+  (names xenbus_stubs xs_ring_stubs))
+ (name xenbus)
+ (public_name xen.bus)
+ (libraries unix xenmmap))
diff --git a/tools/ocaml/libs/xc/dune b/tools/ocaml/libs/xc/dune
new file mode 100644
index 0000000000..fb75ee8ff7
--- /dev/null
+++ b/tools/ocaml/libs/xc/dune
@@ -0,0 +1,9 @@
+(library
+ (foreign_stubs
+  (language c)
+  (names xenctrl_stubs))
+ (name xenctrl)
+ (public_name xen.ctrl)
+ (libraries unix xenmmap)
+ (c_library_flags -lxenctrl -lxenguest -lxencall -lxenforeignmemory
+   -lxengnttab))
diff --git a/tools/ocaml/libs/xs/dune b/tools/ocaml/libs/xs/dune
new file mode 100644
index 0000000000..c79ea75775
--- /dev/null
+++ b/tools/ocaml/libs/xs/dune
@@ -0,0 +1,4 @@
+(library
+ (name xenstore)
+ (public_name xen.store)
+ (libraries unix xenbus))
diff --git a/tools/ocaml/xen.opam b/tools/ocaml/xen.opam
new file mode 100644
index 0000000000..013b84db61
--- /dev/null
+++ b/tools/ocaml/xen.opam
@@ -0,0 +1 @@
+opam-version: "2.0"
diff --git a/tools/ocaml/xenstore.opam b/tools/ocaml/xenstore.opam
new file mode 100644
index 0000000000..013b84db61
--- /dev/null
+++ b/tools/ocaml/xenstore.opam
@@ -0,0 +1 @@
+opam-version: "2.0"
diff --git a/tools/ocaml/xenstored.opam b/tools/ocaml/xenstored.opam
new file mode 100644
index 0000000000..a226328e43
--- /dev/null
+++ b/tools/ocaml/xenstored.opam
@@ -0,0 +1,21 @@
+opam-version: "2.0"
+synopsis: "In-memory key-value store for the Xen hypervisor"
+maintainer: "lindig@gmail.com"
+authors: "lindig@gmail.com"
+license: "LGPL"
+homepage: "https://github.com/lindig/xen-ocaml-tools"
+bug-reports: "https://github.com/lindig/xen-ocaml-tools/issues"
+depends: [
+  "ocaml"
+  "dune" {build}
+  "base-unix"
+
+  "crowbar" {with-test}
+  "fmt" {with-test}
+
+  "crowbar"
+  "fmt"
+]
+build: ["dune" "build" "-p" name "-j" jobs]
+depexts: ["m4" "libxen-dev" "libsystemd-dev"] {os-distribution = "debian"}
+dev-repo: "git+https://github.com/lindig/xen-ocaml-tools.git"
diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 89ec3ec76a..9d2da206d8 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -56,7 +56,8 @@ OBJS = paths \
 	history \
 	parse_arg \
 	process \
-	xenstored
+	xenstored \
+	xenstored_main
 
 INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
 
diff --git a/tools/ocaml/xenstored/dune b/tools/ocaml/xenstored/dune
new file mode 100644
index 0000000000..714a2ae07e
--- /dev/null
+++ b/tools/ocaml/xenstored/dune
@@ -0,0 +1,19 @@
+(executable
+ (modes byte exe)
+ (name xenstored_main)
+ (modules (:standard \ syslog systemd))
+ (public_name oxenstored)
+ (package xenstored)
+ (flags (:standard -w -52))
+ (libraries unix xen.bus xen.mmap xen.ctrl xen.eventchn xenstubs))
+
+(library
+ (foreign_stubs
+  (language c)
+  (names syslog_stubs systemd_stubs select_stubs)
+  (flags (-DHAVE_SYSTEMD)))
+ (modules syslog systemd)
+ (name xenstubs)
+ (wrapped false)
+ (libraries unix)
+ (c_library_flags -lsystemd))
diff --git a/tools/ocaml/xenstored/parse_arg.ml b/tools/ocaml/xenstored/parse_arg.ml
index 7c0478e76a..965cb9ebeb 100644
--- a/tools/ocaml/xenstored/parse_arg.ml
+++ b/tools/ocaml/xenstored/parse_arg.ml
@@ -28,7 +28,7 @@ type config =
 	disable_socket: bool;
 }
 
-let do_argv =
+let do_argv () =
 	let pidfile = ref "" and tracefile = ref "" (* old xenstored compatibility *)
 	and domain_init = ref true
 	and activate_access_log = ref true
diff --git a/tools/ocaml/xenstored/poll.ml b/tools/ocaml/xenstored/poll.ml
index 26f8620dfc..92e0717ed2 100644
--- a/tools/ocaml/xenstored/poll.ml
+++ b/tools/ocaml/xenstored/poll.ml
@@ -64,4 +64,5 @@ let poll_select in_fds out_fds exc_fds timeout =
 			a r
 
 let () =
-        set_fd_limit (get_sys_fs_nr_open ())
+        if Unix.geteuid () = 0 then
+          set_fd_limit (get_sys_fs_nr_open ())
diff --git a/tools/ocaml/xenstored/test/dune b/tools/ocaml/xenstored/test/dune
new file mode 100644
index 0000000000..2a3eb2b7df
--- /dev/null
+++ b/tools/ocaml/xenstored/test/dune
@@ -0,0 +1,11 @@
+(copy_files# ../*.ml{,i})
+
+(test
+ (modes native)
+ (ocamlopt_flags -afl-instrument)
+ (name xenstored_test)
+ (modules (:standard \ syslog systemd))
+ (package xenstored)
+ (flags (:standard -w -52))
+ ;;(action (run %{test} -v --seed 364172147))
+ (libraries unix xen.bus xen.mmap xenstubs crowbar xen.store fmt fmt.tty))
diff --git a/tools/ocaml/xenstored/test/xenctrl.ml b/tools/ocaml/xenstored/test/xenctrl.ml
new file mode 100644
index 0000000000..37d6da0a47
--- /dev/null
+++ b/tools/ocaml/xenstored/test/xenctrl.ml
@@ -0,0 +1,48 @@
+(*
+ * Copyright (C) 2006-2007 XenSource Ltd.
+ * Copyright (C) 2008      Citrix Ltd.
+ * Author Vincent Hanquez <vincent.hanquez@eu.citrix.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *)
+
+(** *)
+type domid = int
+
+(* ** xenctrl.h ** *)
+
+
+type domaininfo =
+{
+	domid             : domid;
+	dying             : bool;
+	shutdown          : bool;
+	shutdown_code     : int;
+}
+
+exception Error of string
+
+type handle = unit
+
+let interface_open () = ()
+let interface_close () = ()
+
+let domain_getinfo () domid = {
+  domid = domid;
+  dying = false;
+  shutdown = false;
+  shutdown_code = 0;
+}
+
+let devzero = Unix.openfile "/dev/zero" [] 0
+let  nullmap () = Xenmmap.mmap devzero Xenmmap.RDWR Xenmmap.PRIVATE 4096 0
+
+let map_foreign_range _ _ _ _ = nullmap ()
diff --git a/tools/ocaml/xenstored/test/xeneventchn.ml b/tools/ocaml/xenstored/test/xeneventchn.ml
new file mode 100644
index 0000000000..6612722dc2
--- /dev/null
+++ b/tools/ocaml/xenstored/test/xeneventchn.ml
@@ -0,0 +1,50 @@
+(*
+ * Copyright (C) 2006-2007 XenSource Ltd.
+ * Copyright (C) 2008      Citrix Ltd.
+ * Author Vincent Hanquez <vincent.hanquez@eu.citrix.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ *)
+
+type handle = Unix.file_descr * int ref
+
+let devnull = Unix.openfile "/dev/null" [] 0
+let init () = devnull, ref 0
+let fd (h, _) = h
+
+type t = int
+
+type virq_t =
+  | Timer        (* #define VIRQ_TIMER      0 *)
+  | Debug        (* #define VIRQ_DEBUG      1 *)
+  | Console      (* #define VIRQ_CONSOLE    2 *)
+  | Dom_exc      (* #define VIRQ_DOM_EXC    3 *)
+  | Tbuf         (* #define VIRQ_TBUF       4 *)
+  | Reserved_5   (* Do not use this value as it's not defined *)
+  | Debugger     (* #define VIRQ_DEBUGGER   6 *)
+  | Xenoprof     (* #define VIRQ_XENOPROF   7 *)
+  | Con_ring     (* #define VIRQ_CON_RING   8 *)
+  | Pcpu_state   (* #define VIRQ_PCPU_STATE 9 *)
+  | Mem_event    (* #define VIRQ_MEM_EVENT  10 *)
+  | Xc_reserved  (* #define VIRQ_XC_RESERVED 11 *)
+  | Enomem       (* #define VIRQ_ENOMEM     12 *)
+  | Xenpmu       (* #define VIRQ_XENPMU     13 *)
+
+let notify _h _ = ()
+let bind_interdomain (_h, port) domid remote_port = incr port; !port
+let bind_virq (_h, port) _ = incr port; !port
+let bind_dom_exc_virq handle = bind_virq handle Dom_exc
+let unbind _ _ = ()
+let pending (_h, port) = !port
+let unmask _ _ = ()
+
+let to_int x = x
+let of_int x = x
diff --git a/tools/ocaml/xenstored/test/xenstored_test.ml b/tools/ocaml/xenstored/test/xenstored_test.ml
new file mode 100644
index 0000000000..e86b68e867
--- /dev/null
+++ b/tools/ocaml/xenstored/test/xenstored_test.ml
@@ -0,0 +1,2 @@
+open Xenstored
+let () = ()
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index d44ae673c4..ae2eab498a 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -265,8 +265,8 @@ let to_file store cons fds file =
 	        (fun () -> close_out channel)
 end
 
-let _ =
-	let cf = do_argv in
+let main () =
+	let cf = do_argv () in
 	let pidfile =
 		if Sys.file_exists (config_filename cf) then
 			parse_config (config_filename cf)
diff --git a/tools/ocaml/xenstored/xenstored_main.ml b/tools/ocaml/xenstored/xenstored_main.ml
new file mode 100644
index 0000000000..929dd62fb4
--- /dev/null
+++ b/tools/ocaml/xenstored/xenstored_main.ml
@@ -0,0 +1 @@
+let () = Xenstored.main ()
-- 
2.25.1


