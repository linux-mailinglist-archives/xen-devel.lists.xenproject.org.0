Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A537AE41
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125964.237136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWz9-0000ac-TA; Tue, 11 May 2021 18:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125964.237136; Tue, 11 May 2021 18:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWz9-0000Wx-NC; Tue, 11 May 2021 18:19:59 +0000
Received: by outflank-mailman (input) for mailman id 125964;
 Tue, 11 May 2021 18:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWz7-0007g6-Gk
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:19:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fc6e699-2fa5-47e5-895a-4b2c4772b8ec;
 Tue, 11 May 2021 18:19:51 +0000 (UTC)
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
X-Inumbo-ID: 7fc6e699-2fa5-47e5-895a-4b2c4772b8ec
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620757191;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=44hyZ/ZaZ9beZ9T4JdjVPbP63rTAyQBALalI4rEKkk4=;
  b=dm97E3F89Yp8Q820UOGMinnPdbQPQ4MellCAizbdPabh79ARGeBBctsK
   bQTAApzBdUwUvTRdIJ5ghiglkIhiz1f28QFm+iVLduldEIwoiMy1grXfJ
   SaAtyiB3Ny7Sitl72mBNt1NI7b/90oAJNKaAfMp0qyBG0klPrTiGidMCh
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fbrcHgMwOJSde12PXOvnKypdUGN+tM9wSfZye82uYj9Hza/31CRLKi/YN/2NpBIrEBKFYsIn9X
 2CQYrY7cNjFS4lAvIpJOpEg9wND4gvg6Ltj9++Kp9wTO3pzidE5QnmoIqM6sNg2CVLQTKYp/Sa
 Tpg2ZMHRVAMNwEtsG8xfefZZPpotufj1qBRaYXlyamq3Wkc5QUaRNRcAMNR5xffFC6AD0HdbTP
 fw7yWehjbKCKtOyTAo7FLZuLfoMkL/XyoUThkKGvziwssD4qVugM62lhSbLpucryoMkzwIFMvX
 bPk=
X-SBRS: 5.1
X-MesageID: 43580607
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+jZYZq+keJzTGnCyxNxuk+DiI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re5MjztCWE8Qr5N0tQ+uxoVJPufZqYz+8Q3WBzB8bFYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IOc+EYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43580607"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 13/17] tools/ocaml/libs/xb: import gnttab stubs from mirage
Date: Tue, 11 May 2021 19:05:26 +0100
Message-ID: <d298ca3e3f9f57075d9100645e0ff986127689d7.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Upstream URL: https://github.com/mirage/ocaml-gnt
Mirage is part of the Xen project and the license is compatible,
copyright headers are retained.

Changes from upstream:
* cut down dependencies: dropped Lwt, replaced Io_page with Xenmmap
* only import Gnttab and not Gntshr

This is for xenstored's use only which needs a way to grant map
the xenstore ring without using xenctrl.

The gnt code is added into libs/mmap because it uses mmap_stubs.h.
Also this makes it possible to mock out gnttab in the unit tests:
replace it with code that just mmaps /dev/zero.
For the mocking to work gnt.ml needs to be in a dir other than xenstored/.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/Makefile                   |   1 +
 tools/ocaml/libs/mmap/Makefile         |  19 +++--
 tools/ocaml/libs/mmap/dune             |  10 +++
 tools/ocaml/libs/mmap/gnt.ml           |  60 ++++++++++++++
 tools/ocaml/libs/mmap/gnt.mli          |  86 ++++++++++++++++++++
 tools/ocaml/libs/mmap/gnttab_stubs.c   | 106 +++++++++++++++++++++++++
 tools/ocaml/xenstored/Makefile         |   1 +
 tools/ocaml/xenstored/dune             |   6 +-
 tools/ocaml/xenstored/test/gnt.ml      |  52 ++++++++++++
 tools/ocaml/xenstored/test/testable.ml |   3 +-
 tools/ocaml/xenstored/xenstored.ml     |  10 +--
 11 files changed, 339 insertions(+), 15 deletions(-)
 create mode 100644 tools/ocaml/libs/mmap/gnt.ml
 create mode 100644 tools/ocaml/libs/mmap/gnt.mli
 create mode 100644 tools/ocaml/libs/mmap/gnttab_stubs.c
 create mode 100644 tools/ocaml/xenstored/test/gnt.ml

diff --git a/tools/ocaml/Makefile b/tools/ocaml/Makefile
index de375820a3..1236b0e584 100644
--- a/tools/ocaml/Makefile
+++ b/tools/ocaml/Makefile
@@ -43,6 +43,7 @@ C_INCLUDE_PATH=$(XEN_libxenctrl)/include:$(XEN_libxengnttab)/include:$(XEN_libxe
 # in the parent directory (so it couldn't copy/use Config.mk)
 .PHONY: dune-pre
 dune-pre:
+	$(MAKE) clean
 	$(MAKE) -s -C ../../ build-tools-public-headers
 	$(MAKE) -s -C libs/xs paths.ml
 	$(MAKE) -s -C libs/xc xenctrl_abi_check.h
diff --git a/tools/ocaml/libs/mmap/Makefile b/tools/ocaml/libs/mmap/Makefile
index df45819df5..ed4903b48a 100644
--- a/tools/ocaml/libs/mmap/Makefile
+++ b/tools/ocaml/libs/mmap/Makefile
@@ -2,9 +2,7 @@ TOPLEVEL=$(CURDIR)/../..
 XEN_ROOT=$(TOPLEVEL)/../..
 include $(TOPLEVEL)/common.make
 
-OBJS = xenmmap
 INTF = $(foreach obj, $(OBJS),$(obj).cmi)
-LIBS = xenmmap.cma xenmmap.cmxa
 
 all: $(INTF) $(LIBS) $(PROGRAMS)
 
@@ -12,15 +10,26 @@ bins: $(PROGRAMS)
 
 libs: $(LIBS)
 
-xenmmap_OBJS = $(OBJS)
+# gnt is an internal library, not installed
+gnt_OBJS = gnt
+gnt_C_OBJS = gnttab_stubs
+gnt_LIBS = gnt.cma gnt.cmxa
+LIBS_gnt = $(LDLIBS_libxengnttab)
+CFLAGS += $(CFLAGS_libxengnttab)
+
+xenmmap_OBJS = xenmmap
 xenmmap_C_OBJS = xenmmap_stubs
-OCAML_LIBRARY = xenmmap
+xenmmap_LIBS = xenmmap.cma xenmmap.cmxa
+
+OCAML_LIBRARY = xenmmap gnt
+OBJS = $(xenmmap_OBJS) $(gnt_OBJS)
+LIBS = $(xenmmap_LIBS) $(gnt_LIBS)
 
 .PHONY: install
 install: $(LIBS) META
 	mkdir -p $(OCAMLDESTDIR)
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenmmap
-	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xenmmap META $(INTF) $(LIBS) *.a *.so *.cmx
+	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xenmmap META *xenmmap*.cmi $(xenmmap_LIBS) *xenmmap*.a *xenmmap*.so *xenmmap*.cmx
 
 .PHONY: uninstall
 uninstall:
diff --git a/tools/ocaml/libs/mmap/dune b/tools/ocaml/libs/mmap/dune
index a47de44e47..f4c98153c4 100644
--- a/tools/ocaml/libs/mmap/dune
+++ b/tools/ocaml/libs/mmap/dune
@@ -3,6 +3,16 @@
   (language c)
   (names xenmmap_stubs))
  (name xenmmap)
+ (modules xenmmap)
  (public_name xen.mmap)
  (libraries unix)
  (install_c_headers mmap_stubs))
+
+(library
+ (foreign_stubs
+  (language c)
+  (names gnttab_stubs))
+ (name xengnt)
+ (modules gnt)
+ (wrapped false) 
+ (libraries unix xen.mmap))
diff --git a/tools/ocaml/libs/mmap/gnt.ml b/tools/ocaml/libs/mmap/gnt.ml
new file mode 100644
index 0000000000..65f0334b7c
--- /dev/null
+++ b/tools/ocaml/libs/mmap/gnt.ml
@@ -0,0 +1,60 @@
+(*
+ * Copyright (c) 2010 Anil Madhavapeddy <anil@recoil.org>
+ * Copyright (C) 2012-2014 Citrix Inc
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ *)
+
+type gntref = int
+type domid = int
+
+let console = 0 (* public/grant_table.h:GNTTAB_RESERVED_CONSOLE *)
+let xenstore = 1 (* public/grant_table.h:GNTTAB_RESERVED_XENSTORE *)
+
+type grant_handle (* handle to a mapped grant *)
+
+module Gnttab = struct
+  type interface
+
+  external interface_open': unit -> interface = "stub_gnttab_interface_open"
+
+  let interface_open () =
+    try
+      interface_open' ()
+    with e ->
+      Printf.fprintf stderr "Failed to open grant table device: ENOENT\n";
+      Printf.fprintf stderr "Does this system have Xen userspace grant table support?\n";
+      Printf.fprintf stderr "On linux try:\n";
+      Printf.fprintf stderr "  sudo modprobe xen-gntdev\n%!";
+      raise e
+
+  external interface_close: interface -> unit = "stub_gnttab_interface_close"
+
+  type grant = {
+    domid: domid;
+    ref: gntref;
+  }
+
+  module Local_mapping = struct
+    type t = Xenmmap.mmap_interface
+
+    let to_pages t = t
+  end
+
+  external unmap_exn : interface -> Local_mapping.t -> unit = "stub_gnttab_unmap"
+
+  external map_fresh_exn: interface -> gntref -> domid -> bool -> Local_mapping.t = "stub_gnttab_map_fresh"
+
+  let map_exn interface grant writable =
+      map_fresh_exn interface grant.ref grant.domid writable
+end
diff --git a/tools/ocaml/libs/mmap/gnt.mli b/tools/ocaml/libs/mmap/gnt.mli
new file mode 100644
index 0000000000..302e13b05d
--- /dev/null
+++ b/tools/ocaml/libs/mmap/gnt.mli
@@ -0,0 +1,86 @@
+(*
+ * Copyright (c) 2010 Anil Madhavapeddy <anil@recoil.org>
+ * Copyright (C) 2012-2014 Citrix Inc
+ * 
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ *)
+
+(** Allow a local xen domain to read/write memory exported ("granted")
+    from foreign domains. Safe memory sharing is a building block of all
+    xen inter-domain communication protocols such as those for virtual
+    network and disk devices.
+
+    Foreign domains will explicitly "grant" us access to certain memory
+    regions such as disk buffers. These regions are uniquely identified
+    by the pair of (foreign domain id, integer reference) which is
+    passed to us over some existing channel (typically via xenstore keys
+    or via structures in previously-shared memory region).
+*)
+
+(** {2 Common interface} *)
+
+type gntref = int
+(** Type of a grant table index, called a grant reference in
+    Xen's terminology. *)
+
+(** {2 Receiving foreign pages} *)
+
+module Gnttab : sig
+  type interface
+  (** A connection to the grant device, needed for mapping/unmapping *)
+
+  val interface_open: unit -> interface
+  (** Open a connection to the grant device. This must be done before any
+      calls to map or unmap. *)
+
+  val interface_close: interface -> unit
+  (** Close a connection to the grant device. Any future calls to map or
+      unmap will fail. *)
+
+  type grant = {
+    domid: int;
+    (** foreign domain who is exporting memory *)
+    ref: gntref;
+    (** id which identifies the specific export in the foreign domain *)
+  }
+  (** A foreign domain must explicitly "grant" us memory and send us the
+      "reference". The pair of (foreign domain id, reference) uniquely
+      identifies the block of memory. This pair ("grant") is transmitted
+      to us out-of-band, usually either via xenstore during device setup or
+      via a shared memory ring structure. *)
+
+  module Local_mapping : sig
+    type t
+    (** Abstract type representing a locally-mapped shared memory page *)
+
+    val to_pages: t -> Xenmmap.mmap_interface
+  end
+
+  val map_exn : interface -> grant -> bool -> Local_mapping.t
+  (** [map_exn if grant writable] creates a single mapping from
+      [grant] that will be writable if [writable] is [true]. *)
+
+  val unmap_exn: interface -> Local_mapping.t -> unit
+  (** Unmap a single mapping (which may involve multiple grants). Throws a
+      Failure if unsuccessful. *)
+end
+
+val console: gntref
+(** In xen-4.2 and later, the domain builder will allocate one of the
+    reserved grant table entries and use it to pre-authorise the console
+    backend domain. *)
+
+val xenstore: gntref
+(** In xen-4.2 and later, the domain builder will allocate one of the
+    reserved grant table entries and use it to pre-authorise the xenstore
+    backend domain. *)
diff --git a/tools/ocaml/libs/mmap/gnttab_stubs.c b/tools/ocaml/libs/mmap/gnttab_stubs.c
new file mode 100644
index 0000000000..f0b4ab237f
--- /dev/null
+++ b/tools/ocaml/libs/mmap/gnttab_stubs.c
@@ -0,0 +1,106 @@
+/*
+ * Copyright (C) 2012-2013 Citrix Inc
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ */
+
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <errno.h>
+
+/* For PROT_READ | PROT_WRITE */
+#include <sys/mman.h>
+
+#define CAML_NAME_SPACE
+#include <caml/alloc.h>
+#include <caml/memory.h>
+#include <caml/signals.h>
+#include <caml/fail.h>
+#include <caml/callback.h>
+#include <caml/bigarray.h>
+
+#include "xengnttab.h"
+#include "mmap_stubs.h"
+
+#ifndef Data_abstract_val
+#define Data_abstract_val(v) ((void*) Op_val(v))
+#endif
+
+#define _G(__g) (*((xengnttab_handle**)Data_abstract_val(__g)))
+
+CAMLprim value stub_gnttab_interface_open(void)
+{
+	CAMLparam0();
+	CAMLlocal1(result);
+	xengnttab_handle *xgh;
+
+	xgh = xengnttab_open(NULL, 0);
+	if (xgh == NULL)
+		caml_failwith("Failed to open interface");
+	result = caml_alloc(1, Abstract_tag);
+	_G(result) = xgh;
+
+	CAMLreturn(result);
+}
+
+CAMLprim value stub_gnttab_interface_close(value xgh)
+{
+	CAMLparam1(xgh);
+
+	xengnttab_close(_G(xgh));
+
+	CAMLreturn(Val_unit);
+}
+
+#define _M(__m) ((struct mmap_interface*)Data_abstract_val(__m))
+#define XEN_PAGE_SHIFT 12
+
+CAMLprim value stub_gnttab_unmap(value xgh, value array)
+{
+	CAMLparam2(xgh, array);
+	int result;
+
+	caml_enter_blocking_section();
+	result = xengnttab_unmap(_G(xgh), _M(array)->addr, _M(array)->len >> XEN_PAGE_SHIFT);
+	caml_leave_blocking_section();
+
+	if(result!=0) {
+		caml_failwith("Failed to unmap grant");
+	}
+
+	CAMLreturn(Val_unit);
+}
+
+CAMLprim value stub_gnttab_map_fresh(
+	value xgh,
+	value reference,
+	value domid,
+	value writable
+	)
+{
+	CAMLparam4(xgh, reference, domid, writable);
+	CAMLlocal1(contents);
+	void *map;
+
+	caml_enter_blocking_section();
+	map = xengnttab_map_grant_ref(_G(xgh), Int_val(domid), Int_val(reference),
+		Bool_val(writable)?PROT_READ | PROT_WRITE:PROT_READ);
+	caml_leave_blocking_section();
+
+	if(map==NULL) {
+		caml_failwith("Failed to map grant ref");
+	}
+	contents = stub_mmap_alloc(map, 1 << XEN_PAGE_SHIFT);
+	CAMLreturn(contents);
+}
diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 9d2da206d8..689a8fb07d 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -67,6 +67,7 @@ XENSTOREDLIBS = \
 	-ccopt -L -ccopt . systemd.cmxa \
 	-ccopt -L -ccopt . poll.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/gnt.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xb $(OCAML_TOPLEVEL)/libs/xb/xenbus.cmxa \
diff --git a/tools/ocaml/xenstored/dune b/tools/ocaml/xenstored/dune
index 714a2ae07e..81a6bf7a4a 100644
--- a/tools/ocaml/xenstored/dune
+++ b/tools/ocaml/xenstored/dune
@@ -1,17 +1,17 @@
 (executable
- (modes byte exe)
+ (modes exe)
  (name xenstored_main)
  (modules (:standard \ syslog systemd))
  (public_name oxenstored)
  (package xenstored)
  (flags (:standard -w -52))
- (libraries unix xen.bus xen.mmap xen.ctrl xen.eventchn xenstubs))
+ (libraries unix xen.bus xen.mmap xen.ctrl xen.eventchn xenstubs xengnt))
 
 (library
  (foreign_stubs
   (language c)
   (names syslog_stubs systemd_stubs select_stubs)
-  (flags (-DHAVE_SYSTEMD)))
+  (flags (-DHAVE_SYSTEMD -I../libs/mmap/)))
  (modules syslog systemd)
  (name xenstubs)
  (wrapped false)
diff --git a/tools/ocaml/xenstored/test/gnt.ml b/tools/ocaml/xenstored/test/gnt.ml
new file mode 100644
index 0000000000..ae71e2aaef
--- /dev/null
+++ b/tools/ocaml/xenstored/test/gnt.ml
@@ -0,0 +1,52 @@
+(*
+ * Copyright (c) 2010 Anil Madhavapeddy <anil@recoil.org>
+ * Copyright (C) 2012-2014 Citrix Inc
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ *)
+
+type gntref = int
+type domid = int
+
+let console = 0 (* public/grant_table.h:GNTTAB_RESERVED_CONSOLE *)
+let xenstore = 1 (* public/grant_table.h:GNTTAB_RESERVED_XENSTORE *)
+
+type grant_handle (* handle to a mapped grant *)
+
+module Gnttab = struct
+  type interface = unit
+
+  let interface_open () = ()
+  let interface_close () = ()
+
+  type grant = {
+    domid: domid;
+    ref: gntref;
+  }
+
+  let unmap_exn () _ = () (* FIXME: leak *)
+  let devzero = Unix.openfile "/dev/zero" [] 0
+  let  nullmap () = Xenmmap.mmap devzero Xenmmap.RDWR Xenmmap.PRIVATE 4096 0
+  let map_fresh_exn () _ _ _ = Xenmmap.to_interface (nullmap())
+
+  module Local_mapping = struct
+    type t = Xenmmap.mmap_interface
+
+    let to_pages interface t =
+      Xenmmap.make t ~unmap:(unmap_exn interface)
+  end
+
+  let map_exn interface grant writable : Local_mapping.t =
+    map_fresh_exn interface grant.ref grant.domid writable
+
+end
diff --git a/tools/ocaml/xenstored/test/testable.ml b/tools/ocaml/xenstored/test/testable.ml
index 2fa749fbb3..37042356b8 100644
--- a/tools/ocaml/xenstored/test/testable.ml
+++ b/tools/ocaml/xenstored/test/testable.ml
@@ -169,7 +169,8 @@ let () =
 let create ?(live_update = false) () =
   let store = Store.create () in
   let cons = Connections.create () in
-  let doms = Domains.init (Event.init ()) ignore in
+  let gnt = Gnt.Gnttab.interface_open () in (* dummy *)
+  let doms = Domains.init (Event.init ()) gnt ignore in
   let dom0 = Domains.create0 doms in
   let txidtbl = Hashtbl.create 47 in
   Connections.add_domain cons dom0 ;
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 34e706910e..a6b86b167c 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -166,9 +166,8 @@ let from_channel_f_compat chan global_f socket_f domain_f watch_f store_f =
 					global_f ~rw
 				| "socket" :: fd :: [] ->
 					socket_f ~fd:(int_of_string fd)
-				| "dom" :: domid :: mfn :: port :: []->
+				| "dom" :: domid :: _mfn :: port :: []->
 					domain_f (int_of_string domid)
-					         (Nativeint.of_string mfn)
 					         (int_of_string port)
 				| "watch" :: domid :: path :: token :: [] ->
 					watch_f (int_of_string domid)
@@ -208,10 +207,10 @@ let from_channel_compat ~live store cons doms chan =
 		else
 			warn "Ignoring invalid socket FD %d" fd
 	in
-	let domain_f domid mfn port =
+	let domain_f domid port =
 		let ndom =
 			if domid > 0 then
-				Domains.create doms domid mfn port
+				Domains.create doms domid port
 			else
 				Domains.create0 doms
 			in
@@ -270,8 +269,7 @@ let from_channel_bin ~live store cons doms chan =
 			Connections.find_domain cons 0
 		| LR.Domain d ->
 			debug "Recreating domain %d, port %d" d.id d.remote_port; 
-			(* FIXME: gnttab *)
-			Domains.create doms d.id 0n d.remote_port
+			Domains.create doms d.id d.remote_port
 			|> Connections.add_domain cons;
 			Connections.find_domain cons d.id
 		| LR.Socket fd ->
-- 
2.25.1


