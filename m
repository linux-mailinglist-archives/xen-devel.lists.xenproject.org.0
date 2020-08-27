Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1917B254C4D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:37:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLpb-0005Ov-DJ; Thu, 27 Aug 2020 17:36:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLpa-00056c-0J
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:36:58 +0000
X-Inumbo-ID: 6990dd88-6f27-4001-922d-1a3a32cc50f3
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6990dd88-6f27-4001-922d-1a3a32cc50f3;
 Thu, 27 Aug 2020 17:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mWLLcEM3KuhXqTWbywzax5b+e9ih3SppJNnYJlMGEg=;
 b=aJFgkjholoeo+UncEj0lV1M/IXxpK8LocA0tSNbbkWpsFsKS7pbFrkfC
 oS8sekeSdEVN3gxxtM+RNheGueOW4XJCAdFgZFs0ls3bEA+6JTdxFyBxy
 Is16WcKk3gQd6ztECILRsLo7ms5ig7M4xJYoHylfOxQtEju9qGMZk6qXv 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: r6a2SDZbVuXc6oMj/1D9PlLdNo15+/KNJ5S35/XTRWul9lAoFmEE519cqihA9iY26Cge9KW/IB
 PswDTG5Uw77a2XA/FkoMk1u15htj7YFobH/uXnV4qcvI5vYhzTsYZgWcnBUjWIK5kJ1rv0SMwR
 vCz+zYxQHv7rVLY52ky4VAjigVuffLZSriWIMa54JCeLWCJjtLhXK6y+9Ri63kVh6G2mGN8CSV
 r6j3rzom2JDR+Q05aO53N2+J9ZOHXeTzqjqdhIxznOQYS64C6/IOveIHP4gu1AjdmUAPzI6jSl
 UUI=
X-SBRS: 2.7
X-MesageID: 25758540
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25758540"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 5/9] tools/ocaml: safer Xenmmap interface
Date: Thu, 27 Aug 2020 18:35:56 +0100
Message-ID: <e1a9fd47047791ab88b14880fe2b2d97947c4440.1598548832.git.edvin.torok@citrix.com>
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

Xenmmap.mmap_interface is created from multiple places:
* via mmap(), which needs to be unmap()-ed
* xc_map_foreign_range
* xengnttab_map_grant_ref

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/mmap/xenmmap.ml  | 14 ++++++++++++--
 tools/ocaml/libs/mmap/xenmmap.mli | 11 ++++++++---
 tools/ocaml/libs/xb/xb.ml         | 10 +++++-----
 tools/ocaml/libs/xb/xb.mli        |  4 ++--
 tools/ocaml/libs/xc/xenctrl.ml    |  6 ++++--
 tools/ocaml/libs/xc/xenctrl.mli   |  5 ++---
 tools/ocaml/xenstored/domain.ml   |  2 +-
 tools/ocaml/xenstored/gnt.ml      | 14 ++++++++------
 tools/ocaml/xenstored/gnt.mli     |  3 ++-
 9 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/tools/ocaml/libs/mmap/xenmmap.ml b/tools/ocaml/libs/mmap/xenmmap.ml
index 44b67c89d2..af258942a0 100644
--- a/tools/ocaml/libs/mmap/xenmmap.ml
+++ b/tools/ocaml/libs/mmap/xenmmap.ml
@@ -15,17 +15,27 @@
  *)
 
 type mmap_interface
+type t = mmap_interface * (mmap_interface -> unit)
+
 
 type mmap_prot_flag = RDONLY | WRONLY | RDWR
 type mmap_map_flag = SHARED | PRIVATE
 
 (* mmap: fd -> prot_flag -> map_flag -> length -> offset -> interface *)
-external mmap: Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
+external mmap': Unix.file_descr -> mmap_prot_flag -> mmap_map_flag
 		-> int -> int -> mmap_interface = "stub_mmap_init"
-external unmap: mmap_interface -> unit = "stub_mmap_final"
 (* read: interface -> start -> length -> data *)
 external read: mmap_interface -> int -> int -> string = "stub_mmap_read"
 (* write: interface -> data -> start -> length -> unit *)
 external write: mmap_interface -> string -> int -> int -> unit = "stub_mmap_write"
 (* getpagesize: unit -> size of page *)
+external unmap': mmap_interface -> unit = "stub_mmap_final"
+(* getpagesize: unit -> size of page *)
+let make ?(unmap=unmap') interface = interface, unmap
 external getpagesize: unit -> int = "stub_mmap_getpagesize"
+
+let to_interface (intf, _) = intf
+let mmap fd prot_flag map_flag length offset =
+	let map = mmap' fd prot_flag map_flag length offset in
+	make map ~unmap:unmap'
+let unmap (map, do_unmap) = do_unmap map
diff --git a/tools/ocaml/libs/mmap/xenmmap.mli b/tools/ocaml/libs/mmap/xenmmap.mli
index 8f92ed6310..075b24eab4 100644
--- a/tools/ocaml/libs/mmap/xenmmap.mli
+++ b/tools/ocaml/libs/mmap/xenmmap.mli
@@ -14,15 +14,20 @@
  * GNU Lesser General Public License for more details.
  *)
 
+type t
 type mmap_interface
 type mmap_prot_flag = RDONLY | WRONLY | RDWR
 type mmap_map_flag = SHARED | PRIVATE
 
-external mmap : Unix.file_descr -> mmap_prot_flag -> mmap_map_flag -> int -> int
-             -> mmap_interface = "stub_mmap_init"
-external unmap : mmap_interface -> unit = "stub_mmap_final"
 external read : mmap_interface -> int -> int -> string = "stub_mmap_read"
 external write : mmap_interface -> string -> int -> int -> unit
                = "stub_mmap_write"
 
+val mmap : Unix.file_descr -> mmap_prot_flag -> mmap_map_flag -> int -> int -> t
+val unmap : t -> unit
+
+val make: ?unmap:(mmap_interface -> unit) -> mmap_interface -> t 
+
+val to_interface: t -> mmap_interface
+
 external getpagesize : unit -> int = "stub_mmap_getpagesize"
diff --git a/tools/ocaml/libs/xb/xb.ml b/tools/ocaml/libs/xb/xb.ml
index 104d319d77..4ddf741420 100644
--- a/tools/ocaml/libs/xb/xb.ml
+++ b/tools/ocaml/libs/xb/xb.ml
@@ -28,7 +28,7 @@ let _ =
 
 type backend_mmap =
 {
-	mmap: Xenmmap.mmap_interface;     (* mmaped interface = xs_ring *)
+	mmap: Xenmmap.t;     (* mmaped interface = xs_ring *)
 	eventchn_notify: unit -> unit; (* function to notify through eventchn *)
 	mutable work_again: bool;
 }
@@ -59,7 +59,7 @@ let reconnect t = match t.backend with
 		(* should never happen, so close the connection *)
 		raise End_of_file
 	| Xenmmap backend ->
-		Xs_ring.close backend.mmap;
+		Xs_ring.close Xenmmap.(to_interface backend.mmap);
 		backend.eventchn_notify ();
 		(* Clear our old connection state *)
 		Queue.clear t.pkt_in;
@@ -77,7 +77,7 @@ let read_fd back _con b len =
 
 let read_mmap back _con b len =
 	let s = Bytes.make len '\000' in
-	let rd = Xs_ring.read back.mmap s len in
+	let rd = Xs_ring.read Xenmmap.(to_interface back.mmap) s len in
 	Bytes.blit s 0 b 0 rd;
 	back.work_again <- (rd > 0);
 	if rd > 0 then
@@ -93,7 +93,7 @@ let write_fd back _con b len =
 	Unix.write_substring back.fd b 0 len
 
 let write_mmap back _con s len =
-	let ws = Xs_ring.write_substring back.mmap s len in
+	let ws = Xs_ring.write_substring Xenmmap.(to_interface back.mmap) s len in
 	if ws > 0 then
 		back.eventchn_notify ();
 	ws
@@ -167,7 +167,7 @@ let open_fd fd = newcon (Fd { fd = fd; })
 
 let open_mmap mmap notifyfct =
 	(* Advertise XENSTORE_SERVER_FEATURE_RECONNECTION *)
-	Xs_ring.set_server_features mmap (Xs_ring.Server_features.singleton Xs_ring.Server_feature.Reconnection);
+	Xs_ring.set_server_features (Xenmmap.to_interface mmap) (Xs_ring.Server_features.singleton Xs_ring.Server_feature.Reconnection);
 	newcon (Xenmmap {
 		mmap = mmap;
 		eventchn_notify = notifyfct;
diff --git a/tools/ocaml/libs/xb/xb.mli b/tools/ocaml/libs/xb/xb.mli
index 3a00da6cdd..0184d77ffc 100644
--- a/tools/ocaml/libs/xb/xb.mli
+++ b/tools/ocaml/libs/xb/xb.mli
@@ -59,7 +59,7 @@ exception Noent
 exception Invalid
 exception Reconnect
 type backend_mmap = {
-  mmap : Xenmmap.mmap_interface;
+  mmap : Xenmmap.t;
   eventchn_notify : unit -> unit;
   mutable work_again : bool;
 }
@@ -86,7 +86,7 @@ val output : t -> bool
 val input : t -> bool
 val newcon : backend -> t
 val open_fd : Unix.file_descr -> t
-val open_mmap : Xenmmap.mmap_interface -> (unit -> unit) -> t
+val open_mmap : Xenmmap.t -> (unit -> unit) -> t
 val close : t -> unit
 val is_fd : t -> bool
 val is_mmap : t -> bool
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 497ded7ce2..e80cacf22c 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -256,9 +256,11 @@ external domain_set_memmap_limit: handle -> domid -> int64 -> unit
 external domain_memory_increase_reservation: handle -> domid -> int64 -> unit
        = "stub_xc_domain_memory_increase_reservation"
 
-external map_foreign_range: handle -> domid -> int
+external map_foreign_range': handle -> domid -> int
                          -> nativeint -> Xenmmap.mmap_interface
-       = "stub_map_foreign_range"
+			 = "stub_map_foreign_range"
+let map_foreign_range handle domid port mfn =
+	Xenmmap.make (map_foreign_range' handle domid port mfn)
 
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
        = "stub_xc_domain_assign_device"
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index f7f6ec570d..9f268a87fa 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -196,9 +196,8 @@ external domain_set_memmap_limit : handle -> domid -> int64 -> unit
 external domain_memory_increase_reservation :
   handle -> domid -> int64 -> unit
   = "stub_xc_domain_memory_increase_reservation"
-external map_foreign_range :
-  handle -> domid -> int -> nativeint -> Xenmmap.mmap_interface
-  = "stub_map_foreign_range"
+val map_foreign_range :
+  handle -> domid -> int -> nativeint -> Xenmmap.t
 
 external domain_assign_device: handle -> domid -> (int * int * int * int) -> unit
        = "stub_xc_domain_assign_device"
diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index aeb185ff7e..2d9c1f5d09 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -23,7 +23,7 @@ type t =
 {
 	id: Xenctrl.domid;
 	mfn: nativeint;
-	interface: Xenmmap.mmap_interface;
+	interface: Xenmmap.t;
 	eventchn: Event.t;
 	mutable remote_port: int;
 	mutable port: Xeneventchn.t option;
diff --git a/tools/ocaml/xenstored/gnt.ml b/tools/ocaml/xenstored/gnt.ml
index 65f0334b7c..bef2d3e850 100644
--- a/tools/ocaml/xenstored/gnt.ml
+++ b/tools/ocaml/xenstored/gnt.ml
@@ -45,16 +45,18 @@ module Gnttab = struct
     ref: gntref;
   }
 
+  external unmap_exn : interface -> Xenmmap.mmap_interface -> unit = "stub_gnttab_unmap"
+
+  external map_fresh_exn: interface -> gntref -> domid -> bool -> Xenmmap.mmap_interface = "stub_gnttab_map_fresh"
+
   module Local_mapping = struct
     type t = Xenmmap.mmap_interface
 
-    let to_pages t = t
+    let to_pages interface t =
+      Xenmmap.make t ~unmap:(unmap_exn interface)
   end
 
-  external unmap_exn : interface -> Local_mapping.t -> unit = "stub_gnttab_unmap"
-
-  external map_fresh_exn: interface -> gntref -> domid -> bool -> Local_mapping.t = "stub_gnttab_map_fresh"
-
   let map_exn interface grant writable =
-      map_fresh_exn interface grant.ref grant.domid writable
+    map_fresh_exn interface grant.ref grant.domid writable
+
 end
diff --git a/tools/ocaml/xenstored/gnt.mli b/tools/ocaml/xenstored/gnt.mli
index 302e13b05d..13ab4c7ead 100644
--- a/tools/ocaml/xenstored/gnt.mli
+++ b/tools/ocaml/xenstored/gnt.mli
@@ -53,6 +53,7 @@ module Gnttab : sig
     ref: gntref;
     (** id which identifies the specific export in the foreign domain *)
   }
+
   (** A foreign domain must explicitly "grant" us memory and send us the
       "reference". The pair of (foreign domain id, reference) uniquely
       identifies the block of memory. This pair ("grant") is transmitted
@@ -63,7 +64,7 @@ module Gnttab : sig
     type t
     (** Abstract type representing a locally-mapped shared memory page *)
 
-    val to_pages: t -> Xenmmap.mmap_interface
+    val to_pages: interface -> t -> Xenmmap.t
   end
 
   val map_exn : interface -> grant -> bool -> Local_mapping.t
-- 
2.25.1


