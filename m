Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364B3254C4C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:37:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpV-0005Jp-Ss; Thu, 27 Aug 2020 17:36:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpV-00056c-0E
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:53 +0000
X-Inumbo-ID: 9060909b-f396-445b-9829-df84f53e8d64
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9060909b-f396-445b-9829-df84f53e8d64;
 Thu, 27 Aug 2020 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ACzyLxoL+szrDB46//5+SmU0uasKhywmrfc1CGh9grA=;
 b=DLWS6JD8tT4d2twK8zTMyEWw3BtfsvyUyHApRaaiaZw/+lpP9Z5CUsLM
 sjuNAsUGcoFbOzzRUbv2kZFp19CuEMUb7L8CwcvblgODy2mXiVDlz9hmp
 qvar3MVqHIkktMS6SghHkH3T1XfZu0SBevmTHouwoROksfOj7xYGHnd2q A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tcW4Co/gKx1DSLTpa14Av1Dx/TIpcs/Ax5itm3T9VEsHOp9dtM9xwsESdXr+cZc+ynBUdl6eDL
 f7r0RSSuxhbt1V3nrntfoqZY66VBzTWl2KFAtYwdUHlJS7f7gtCb6byOkPB1iSrBGitZ/5OSi7
 z0iA6FfqYOFoMD1N+8IC8t8iy/NjrnG4+MKAesxHK5yaLfNZJGxiB8q/iiMgKxz52gBNcfE1Ot
 CjPdVTBPOlyr1A/EG834SYU+ZPWtiV9HE2wjggrAIjFHvLTMCKslDSnUUMjiJMfpxE4FBahhAm
 d4c=
X-SBRS: 2.7
X-MesageID: 25758537
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25758537"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 4/9] tools/ocaml/libs/xb: import gnttab stubs from mirage
Date: Thu, 27 Aug 2020 18:35:55 +0100
Message-ID: <1fa945a2edb1f26311ca81fcac497b4fb9d138b5.1598548832.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548832.git.edvin.torok@citrix.com>
References: <cover.1598548832.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Upstream URL: https://github.com/mirage/ocaml-gnt
Mirage is part of the Xen project and the license is compatible,
copyright headers are retained.

Changes from upstream:
* cut down dependencies: dropped Lwt, replaced Io_page with Xenmmap
* only import Gnttab and not Gntshr

This is for xenstored's use only which needs a way to grant map
the xenstore ring without using xenctrl.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/Makefile       |  11 ++-
 tools/ocaml/xenstored/gnt.ml         |  60 +++++++++++++++
 tools/ocaml/xenstored/gnt.mli        |  86 ++++++++++++++++++++++
 tools/ocaml/xenstored/gnttab_stubs.c | 106 +++++++++++++++++++++++++++
 4 files changed, 260 insertions(+), 3 deletions(-)
 create mode 100644 tools/ocaml/xenstored/gnt.ml
 create mode 100644 tools/ocaml/xenstored/gnt.mli
 create mode 100644 tools/ocaml/xenstored/gnttab_stubs.c

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 692a62584e..3490c4ff4e 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -7,6 +7,7 @@ CFLAGS += -include $(XEN_ROOT)/tools/config.h
 CFLAGS-$(CONFIG_SYSTEMD)  += $(SYSTEMD_CFLAGS)
 LDFLAGS-$(CONFIG_SYSTEMD) += $(SYSTEMD_LIBS)
 
+CFLAGS  += $(CFLAGS_libxengnttab) -I../libs/mmap
 CFLAGS  += $(CFLAGS-y)
 CFLAGS  += $(APPEND_CFLAGS)
 LDFLAGS += $(LDFLAGS-y)
@@ -18,12 +19,15 @@ OCAMLINCLUDE += \
 	-I $(OCAML_TOPLEVEL)/libs/xc \
 	-I $(OCAML_TOPLEVEL)/libs/eventchn
 
-LIBS = syslog.cma syslog.cmxa poll.cma poll.cmxa
+LIBS = syslog.cma syslog.cmxa poll.cma poll.cmxa gnt.cma gnt.cmxa
 syslog_OBJS = syslog
 syslog_C_OBJS = syslog_stubs
 poll_OBJS = poll
 poll_C_OBJS = select_stubs
-OCAML_LIBRARY = syslog poll
+gnt_OBJS = gnt
+gnt_C_OBJS = gnttab_stubs
+LIBS_gnt += $(LDLIBS_libxengnttab)
+OCAML_LIBRARY = syslog poll gnt
 
 LIBS += systemd.cma systemd.cmxa
 systemd_OBJS = systemd
@@ -58,7 +62,7 @@ OBJS = paths \
 	process \
 	xenstored
 
-INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
+INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi gnt.cmi
 
 XENSTOREDLIBS = \
 	unix.cmxa \
@@ -66,6 +70,7 @@ XENSTOREDLIBS = \
 	-ccopt -L -ccopt . systemd.cmxa \
 	-ccopt -L -ccopt . poll.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
+	-ccopt -L -ccopt . gnt.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xb $(OCAML_TOPLEVEL)/libs/xb/xenbus.cmxa \
diff --git a/tools/ocaml/xenstored/gnt.ml b/tools/ocaml/xenstored/gnt.ml
new file mode 100644
index 0000000000..65f0334b7c
--- /dev/null
+++ b/tools/ocaml/xenstored/gnt.ml
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
diff --git a/tools/ocaml/xenstored/gnt.mli b/tools/ocaml/xenstored/gnt.mli
new file mode 100644
index 0000000000..302e13b05d
--- /dev/null
+++ b/tools/ocaml/xenstored/gnt.mli
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
diff --git a/tools/ocaml/xenstored/gnttab_stubs.c b/tools/ocaml/xenstored/gnttab_stubs.c
new file mode 100644
index 0000000000..f0b4ab237f
--- /dev/null
+++ b/tools/ocaml/xenstored/gnttab_stubs.c
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
-- 
2.25.1


