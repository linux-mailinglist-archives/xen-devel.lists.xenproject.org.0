Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657B247234
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k3X-0006KA-93; Mon, 17 Aug 2020 18:40:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k3V-0006K5-Qm
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:40:25 +0000
X-Inumbo-ID: 9bf707cf-6c98-468e-96b8-490889284081
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bf707cf-6c98-468e-96b8-490889284081;
 Mon, 17 Aug 2020 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r8ehkDegyME6bv9QcJZhEj/RknOtin3F+AcEEK7wbxw=;
 b=MWE82+INTaJBnRbTe978ZL/23XmkRBS+yJhMWA3U0OBFDtTYOvKRUkwZ
 AiSvqQ6dE43JrhvYQMNkI+ypILIU+vcNOaKve3vke8MkwMZd8BZ80jjRq
 VEQ5r3G5rzI8TobVf26w6WsRPxDOJDcRn9K7dz0tT6WnwRbb1dHZ/AOFt E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GEKFl1RY6r9S2WxbaO4GuKaiven2flbz0LjsJ+xRqOL7TeQ1/Mqt9PWyOlFhz8ite47J6VEhBU
 QToFiF1nv++vaET6ILU6LU1e318XVrDBWGTPWAerbQkSR8uECzQlW+kWaYE8Fjnq05vKaZyuEz
 aUlN9I8kEodrGTQBHix42ihhqh75wCY2pncrKfhOlfgyCthuRmrSqHPjceW2XEzdUE9jPvD504
 pa+opujcYcKhdC4O4svX7iR6BY/RyPbqvjY8/lMminVmGUyxFQOHOv/q0+mBKLBSJu2w7fwN+d
 fRA=
X-SBRS: 2.7
X-MesageID: 24692782
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24692782"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/6] tools/ocaml/xenstored: replace hand rolled GC with
 weak GC references
Date: Mon, 17 Aug 2020 19:39:51 +0100
Message-ID: <174a56a8d6541e3f908d227c493c52b1fdeb9287.1597689211.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597689211.git.edvin.torok@citrix.com>
References: <cover.1597689211.git.edvin.torok@citrix.com>
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

The code here is attempting to reduce memory usage by sharing common
substrings in the tree: it replaces strings with ints, and keeps a
string->int map that gets manually garbage collected using a hand-rolled
mark and sweep algorithm.

This is unnecessary: OCaml already has a mark-and-sweep Garbage
Collector runtime, and sharing of common strings in tree nodes
can be achieved through Weak references: if the string hasn't been seen
yet it gets added to the Weak reference table, and if it has we use the
entry from the table instead, thus storing a string only once.
When the string is no longer referenced OCaml's GC will drop it from the
weak table: there is no need to manually do a mark-and-sweep, or to tell
OCaml when to drop it.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connection.ml |  3 --
 tools/ocaml/xenstored/history.ml    | 14 ------
 tools/ocaml/xenstored/store.ml      | 11 ++---
 tools/ocaml/xenstored/symbol.ml     | 68 ++++++-----------------------
 tools/ocaml/xenstored/symbol.mli    | 21 ++-------
 tools/ocaml/xenstored/xenstored.ml  | 16 +------
 6 files changed, 24 insertions(+), 109 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 24750ada43..aa6dd95501 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -271,9 +271,6 @@ let has_more_work con =
 
 let incr_ops con = con.stat_nb_ops <- con.stat_nb_ops + 1
 
-let mark_symbols con =
-	Hashtbl.iter (fun _ t -> Store.mark_symbols (Transaction.get_store t)) con.transactions
-
 let stats con =
 	Hashtbl.length con.watches, con.stat_nb_ops
 
diff --git a/tools/ocaml/xenstored/history.ml b/tools/ocaml/xenstored/history.ml
index f39565bff5..029802bd15 100644
--- a/tools/ocaml/xenstored/history.ml
+++ b/tools/ocaml/xenstored/history.ml
@@ -22,20 +22,6 @@ type history_record = {
 
 let history : history_record list ref = ref []
 
-(* Called from periodic_ops to ensure we don't discard symbols that are still needed. *)
-(* There is scope for optimisation here, since in consecutive commits one commit's `after`
- * is the same thing as the next commit's `before`, but not all commits in history are
- * consecutive. *)
-let mark_symbols () =
-	(* There are gaps where dom0's commits are missing. Otherwise we could assume that
-	 * each element's `before` is the same thing as the next element's `after`
-	 * since the next element is the previous commit *)
-	List.iter (fun hist_rec ->
-			Store.mark_symbols hist_rec.before;
-			Store.mark_symbols hist_rec.after;
-		)
-		!history
-
 (* Keep only enough commit-history to protect the running transactions that we are still tracking *)
 (* There is scope for optimisation here, replacing List.filter with something more efficient,
  * probably on a different list-like structure. *)
diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index f299ec6461..45659a23ee 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -46,18 +46,18 @@ let add_child node child =
 
 let exists node childname =
 	let childname = Symbol.of_string childname in
-	List.exists (fun n -> n.name = childname) node.children
+	List.exists (fun n -> Symbol.equal n.name childname) node.children
 
 let find node childname =
 	let childname = Symbol.of_string childname in
-	List.find (fun n -> n.name = childname) node.children
+	List.find (fun n -> Symbol.equal n.name childname) node.children
 
 let replace_child node child nchild =
 	(* this is the on-steroid version of the filter one-replace one *)
 	let rec replace_one_in_list l =
 		match l with
 		| []                               -> []
-		| h :: tl when h.name = child.name -> nchild :: tl
+		| h :: tl when Symbol.equal h.name child.name -> nchild :: tl
 		| h :: tl                          -> h :: replace_one_in_list tl
 		in
 	{ node with children = (replace_one_in_list node.children) }
@@ -67,7 +67,7 @@ let del_childname node childname =
 	let rec delete_one_in_list l =
 		match l with
 		| []                        -> raise Not_found
-		| h :: tl when h.name = sym -> tl
+		| h :: tl when Symbol.equal h.name sym -> tl
 		| h :: tl                   -> h :: delete_one_in_list tl
 		in
 	{ node with children = (delete_one_in_list node.children) }
@@ -463,9 +463,6 @@ let copy store = {
 	quota = Quota.copy store.quota;
 }
 
-let mark_symbols store =
-	Node.recurse (fun node -> Symbol.mark_as_used node.Node.name) store.root
-
 let incr_transaction_coalesce store =
 	store.stat_transaction_coalesce <- store.stat_transaction_coalesce + 1
 let incr_transaction_abort store =
diff --git a/tools/ocaml/xenstored/symbol.ml b/tools/ocaml/xenstored/symbol.ml
index 4420c6a4d7..dac6f9f819 100644
--- a/tools/ocaml/xenstored/symbol.ml
+++ b/tools/ocaml/xenstored/symbol.ml
@@ -14,63 +14,23 @@
  * GNU Lesser General Public License for more details.
  *)
 
-type t = int
+module WeakTable = Weak.Make(struct
+    type t = string
+    let equal = String.equal
+    let hash = Hashtbl.hash
+end)
 
-type 'a record = { data: 'a; mutable garbage: bool }
-let int_string_tbl : (int,string record) Hashtbl.t = Hashtbl.create 1024
-let string_int_tbl : (string,int) Hashtbl.t = Hashtbl.create 1024
+type t = string
 
-let created_counter = ref 0
-let used_counter = ref 0
+let tbl = WeakTable.create 1024
 
-let count = ref 0
-let rec fresh () =
-	if Hashtbl.mem int_string_tbl !count
-	then begin
-		incr count;
-		fresh ()
-	end else
-		!count
+let of_string s = WeakTable.merge tbl s
+let to_string s = s
 
-let new_record v = { data=v; garbage=false }
-
-let of_string name =
-	if Hashtbl.mem string_int_tbl name
-	then begin
-		incr used_counter;
-		Hashtbl.find string_int_tbl name
-	end else begin
-		let i = fresh () in
-		incr created_counter;
-		Hashtbl.add string_int_tbl name i;
-		Hashtbl.add int_string_tbl i (new_record name);
-		i
-	end
-
-let to_string i =
-	(Hashtbl.find int_string_tbl i).data
-
-let mark_all_as_unused () =
-	Hashtbl.iter (fun _ v -> v.garbage <- true) int_string_tbl
-
-let mark_as_used symb =
-	let record1 = Hashtbl.find int_string_tbl symb in
-		record1.garbage <- false
-
-let garbage () =
-	let records = Hashtbl.fold (fun symb record accu ->
-		if record.garbage then (symb, record.data) :: accu else accu
-	) int_string_tbl [] in
-	let remove (int,string) =
-		Hashtbl.remove int_string_tbl int;
-		Hashtbl.remove string_int_tbl string
-	in
-	created_counter := 0;
-	used_counter := 0;
-	List.iter remove records
+let equal a b =
+  (* compare using physical equality, both members have to be part of the above weak table *)
+  a == b
 
 let stats () =
-	Hashtbl.length string_int_tbl
-
-let created () = !created_counter
-let used () = !used_counter
+  let len, entries, _, _, _, _ = WeakTable.stats tbl in
+  len, entries
diff --git a/tools/ocaml/xenstored/symbol.mli b/tools/ocaml/xenstored/symbol.mli
index c3c9f6e2f8..586ab57507 100644
--- a/tools/ocaml/xenstored/symbol.mli
+++ b/tools/ocaml/xenstored/symbol.mli
@@ -29,24 +29,11 @@ val of_string : string -> t
 val to_string : t -> string
 (** Convert a symbol into a string. *)
 
-(** {6 Garbage Collection} *)
-
-(** Symbols need to be regulary garbage collected. The following steps should be followed:
--     mark all the knowns symbols as unused (with [mark_all_as_unused]);
--     mark all the symbols really usefull as used (with [mark_as_used]); and
--     finally, call [garbage] *)
-
-val mark_all_as_unused : unit -> unit
-val mark_as_used : t -> unit
-val garbage : unit -> unit
+val equal: t -> t -> bool
+(** Compare two symbols for equality *)
 
 (** {6 Statistics } *)
 
-val stats : unit -> int
-(** Get the number of used symbols. *)
+val stats : unit -> int * int
+(** Get the table size and number of entries. *)
 
-val created : unit -> int
-(** Returns the number of symbols created since the last GC. *)
-
-val used : unit -> int
-(** Returns the number of existing symbols used since the last GC *)
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index a4466c5b5c..047e093555 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -378,18 +378,6 @@ let _ =
 
 	let periodic_ops now =
 		debug "periodic_ops starting";
-		(* we garbage collect the string->int dictionary after a sizeable amount of operations,
-		 * there's no need to be really fast even if we got loose
-		 * objects since names are often reuse.
-		 *)
-		if Symbol.created () > 1000 || Symbol.used () > 20000
-		then begin
-			Symbol.mark_all_as_unused ();
-			Store.mark_symbols store;
-			Connections.iter cons Connection.mark_symbols;
-			History.mark_symbols ();
-			Symbol.garbage ()
-		end;
 
 		(* scan all the xs rings as a safenet for ill-behaved clients *)
 		if !ring_scan_interval >= 0 && now > (!last_scan_time +. float !ring_scan_interval) then
@@ -407,11 +395,11 @@ let _ =
 			let (lanon, lanon_ops, lanon_watchs,
 			     ldom, ldom_ops, ldom_watchs) = Connections.stats cons in
 			let store_nodes, store_abort, store_coalesce = Store.stats store in
-			let symtbl_len = Symbol.stats () in
+			let symtbl_len, symtbl_entries = Symbol.stats () in
 
 			info "store stat: nodes(%d) t-abort(%d) t-coalesce(%d)"
 			     store_nodes store_abort store_coalesce;
-			info "sytbl stat: %d" symtbl_len;
+			info "sytbl stat: length(%d) entries(%d)" symtbl_len symtbl_entries;
 			info "  con stat: anonymous(%d, %d o, %d w) domains(%d, %d o, %d w)"
 			     lanon lanon_ops lanon_watchs ldom ldom_ops ldom_watchs;
 			info "  mem stat: minor(%.0f) promoted(%.0f) major(%.0f) heap(%d w, %d c) live(%d w, %d b) free(%d w, %d b)"
-- 
2.25.1


