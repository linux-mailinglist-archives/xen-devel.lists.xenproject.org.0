Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20562F8905
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68790.123307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3d-0003WI-Fr; Fri, 15 Jan 2021 22:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68790.123307; Fri, 15 Jan 2021 22:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3c-0003U4-V3; Fri, 15 Jan 2021 22:59:04 +0000
Received: by outflank-mailman (input) for mailman id 68790;
 Fri, 15 Jan 2021 22:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XyH-0001Wj-15
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:53:33 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26887bda-f300-44c6-b71d-4f5718b9a07b;
 Fri, 15 Jan 2021 22:52:37 +0000 (UTC)
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
X-Inumbo-ID: 26887bda-f300-44c6-b71d-4f5718b9a07b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mh4+eKEr9LhDfKwKuYHJiWolDcWugUyUrf0m4DtFF4M=;
  b=dUdVDx1Jvg1MGm8O96LNDjYjkOeAhPtlqisB+ygg91emNkoLRhFtLEg0
   JB/a8/Lx6BB9XI5DYgkY2/zm1bT/7o7UQJbRPdTm20gdymwck4iThNWP1
   kfCYXsroyeMIfMdgtHKeeeyfD23kljq8dv7f5CbI3PSr5q+LbE3OmPUuv
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OQrlBuPf51cLcdff5hNyHoPZHagzmyyWFcZmbAOfqoa1NLXnXB76PV9XrB271TBirbhWHLsiGx
 E9W9Mx4CLtVXJpUxeoyUyQy0aA0NwTNjSdrrShM7AHsYpYJaypv1tXyfprLi6zyAnZ5ueT345Y
 mNpdPBpeRKmI8ivPcE4366fj1uYr9jcQNSSBJtJRM9OV1z3HNE/c77vjr2oEchC+ZpOEZzSA9I
 cdZOTyyEh6vsCb69XaQsot/RfhgdST1L6JMboQ6Z8DsU1tMuFZJeAvPu5fm+kKk+BH0tYI8XKJ
 IIk=
X-SBRS: 5.1
X-MesageID: 35217499
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35217499"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 4/4] tools/ocaml/xenstored: use more efficient tries
Date: Fri, 15 Jan 2021 22:28:58 +0000
Message-ID: <fbb31b73a2cede4df3c799c092963cfb1d3a3adb.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

No functional change, just an optimization.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Changed since V3:
* repost after XSA to avoid conflicts
---
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/symbol.ml      |  6 +--
 tools/ocaml/xenstored/trie.ml        | 59 ++++++++++++----------------
 tools/ocaml/xenstored/trie.mli       | 26 ++++++------
 4 files changed, 43 insertions(+), 50 deletions(-)

diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index 82988f7e8d..8a66eeec3a 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -21,7 +21,7 @@ type t = {
 	anonymous: (Unix.file_descr, Connection.t) Hashtbl.t;
 	domains: (int, Connection.t) Hashtbl.t;
 	ports: (Xeneventchn.t, Connection.t) Hashtbl.t;
-	mutable watches: (string, Connection.watch list) Trie.t;
+	mutable watches: Connection.watch list Trie.t;
 }
 
 let create () = {
diff --git a/tools/ocaml/xenstored/symbol.ml b/tools/ocaml/xenstored/symbol.ml
index 301639f16f..72a84ebf80 100644
--- a/tools/ocaml/xenstored/symbol.ml
+++ b/tools/ocaml/xenstored/symbol.ml
@@ -31,9 +31,9 @@ let equal a b =
   (* compare using physical equality, both members have to be part of the above weak table *)
   a == b
 
-let compare a b =
-  if equal a b then 0
-  else -(String.compare a b)
+(* the sort order is reversed here, so that Map.fold constructs a list
+   in ascending order *)
+let compare a b = String.compare b a
 
 let stats () =
   let len, entries, _, _, _, _ = WeakTable.stats tbl in
diff --git a/tools/ocaml/xenstored/trie.ml b/tools/ocaml/xenstored/trie.ml
index f513f4e608..ad2aed5123 100644
--- a/tools/ocaml/xenstored/trie.ml
+++ b/tools/ocaml/xenstored/trie.ml
@@ -15,24 +15,26 @@
 
 open Stdext
 
+module StringMap = Map.Make(String)
+
 module Node =
 struct
-	type ('a,'b) t =  {
-		key: 'a;
-		value: 'b option;
-		children: ('a,'b) t list;
+	type 'a t =  {
+		key: string;
+		value: 'a option;
+		children: 'a t StringMap.t;
 	}
 
 	let _create key value = {
 		key = key;
 		value = Some value;
-		children = [];
+		children = StringMap.empty;
 	}
 
 	let empty key = {
 		key = key;
 		value = None;
-		children = []
+		children = StringMap.empty;
 	}
 
 	let _get_key node = node.key
@@ -49,41 +51,31 @@ struct
 		{ node with children = children }
 
 	let _add_child node child =
-		{ node with children = child :: node.children }
+		{ node with children = StringMap.add child.key child node.children }
 end
 
-type ('a,'b) t = ('a,'b) Node.t list
+type 'a t = 'a Node.t StringMap.t
 
 let mem_node nodes key =
-	List.exists (fun n -> n.Node.key = key) nodes
+	StringMap.mem key nodes
 
 let find_node nodes key =
-	List.find (fun n -> n.Node.key = key) nodes
+	StringMap.find key nodes
 
 let replace_node nodes key node =
-	let rec aux = function
-		| []                            -> []
-		| h :: tl when h.Node.key = key -> node :: tl
-		| h :: tl                       -> h :: aux tl
-	in
-	aux nodes
+	StringMap.update key (function None -> None | Some _ -> Some node) nodes
 
 let remove_node nodes key =
-	let rec aux = function
-		| []                            -> raise Not_found
-		| h :: tl when h.Node.key = key -> tl
-		| h :: tl                       -> h :: aux tl
-	in
-	aux nodes
+	StringMap.update key (function None -> raise Not_found | Some _ -> None) nodes
 
-let create () = []
+let create () = StringMap.empty
 
 let rec iter f tree =
-	let aux node =
-		f node.Node.key node.Node.value;
+	let aux key node =
+		f key node.Node.value;
 		iter f node.Node.children
 	in
-	List.iter aux tree
+	StringMap.iter aux tree
 
 let rec map f tree =
 	let aux node =
@@ -94,13 +86,14 @@ let rec map f tree =
 		in
 		{ node with Node.value = value; Node.children = map f node.Node.children }
 	in
-	List.filter (fun n -> n.Node.value <> None || n.Node.children <> []) (List.map aux tree)
+	tree |> StringMap.map aux
+	|> StringMap.filter (fun _ n -> n.Node.value <> None || not (StringMap.is_empty n.Node.children) )
 
 let rec fold f tree acc =
-	let aux accu node =
-		fold f node.Node.children (f node.Node.key node.Node.value accu)
+	let aux key node accu =
+		fold f node.Node.children (f key node.Node.value accu)
 	in
-	List.fold_left aux acc tree
+	StringMap.fold aux tree acc
 
 (* return a sub-trie *)
 let rec sub_node tree = function
@@ -117,7 +110,7 @@ let rec sub_node tree = function
 
 let sub tree path =
 	try (sub_node tree path).Node.children
-	with Not_found -> []
+	with Not_found -> StringMap.empty
 
 let find tree path =
 	Node.get_value (sub_node tree path)
@@ -161,7 +154,7 @@ and set tree path value =
 				  replace_node tree h (set_node node t value)
 			  end else begin
 				  let node = Node.empty h in
-				  set_node node t value :: tree
+				  StringMap.add node.Node.key (set_node node t value) tree
 			  end
 
 let rec unset tree = function
@@ -176,7 +169,7 @@ let rec unset tree = function
 				  then Node.set_children (Node.empty h) children
 				  else Node.set_children node children
 			  in
-			  if children = [] && new_node.Node.value = None
+			  if StringMap.is_empty children && new_node.Node.value = None
 			  then remove_node tree h
 			  else replace_node tree h new_node
 		  end else
diff --git a/tools/ocaml/xenstored/trie.mli b/tools/ocaml/xenstored/trie.mli
index 5dc53c1cb1..27785154f5 100644
--- a/tools/ocaml/xenstored/trie.mli
+++ b/tools/ocaml/xenstored/trie.mli
@@ -15,46 +15,46 @@
 
 (** Basic Implementation of polymorphic tries (ie. prefix trees) *)
 
-type ('a, 'b) t
-(** The type of tries. ['a list] is the type of keys, ['b] the type of values.
+type 'a t
+(** The type of tries. ['a] the type of values.
 	Internally, a trie is represented as a labeled tree, where node contains values
-	of type ['a * 'b option]. *)
+	of type [string * 'a option]. *)
 
-val create : unit -> ('a,'b) t
+val create : unit -> 'a t
 (** Creates an empty trie. *)
 
-val mem : ('a,'b) t -> 'a list -> bool
+val mem : 'a t -> string list -> bool
 (** [mem t k] returns true if a value is associated with the key [k] in the trie [t].
 	Otherwise, it returns false. *)
 
-val find : ('a, 'b) t -> 'a list -> 'b
+val find : 'a t -> string list -> 'a
 (** [find t k] returns the value associated with the key [k] in the trie [t].
 	Returns [Not_found] if no values are associated with [k] in [t]. *)
 
-val set : ('a, 'b) t -> 'a list -> 'b -> ('a, 'b) t
+val set : 'a t -> string list -> 'a -> 'a t
 (** [set t k v] associates the value [v] with the key [k] in the trie [t]. *)
 
-val unset : ('a, 'b) t -> 'a list -> ('a, 'b) t
+val unset : 'a t -> string list -> 'a t
 (** [unset k v] removes the association of value [v] with the key [k] in the trie [t].
 	Moreover, it automatically clean the trie, ie. it removes recursively
 	every nodes of [t] containing no values and having no chil. *)
 
-val iter : ('a -> 'b option -> unit) -> ('a, 'b) t -> unit
+val iter : (string -> 'a option -> unit) -> 'a t -> unit
 (** [iter f t] applies the function [f] to every node of the trie [t].
 	As nodes of the trie [t] do not necessary contains a value, the second argument of
 	[f] is an option type. *)
 
-val iter_path : ('a -> 'b option -> unit) -> ('a, 'b) t -> 'a list -> unit
+val iter_path : (string -> 'a option -> unit) -> 'a t -> string list -> unit
 (** [iter_path f t p] iterates [f] over nodes associated with the path [p] in the trie [t].
 	If [p] is not a valid path of [t], it iterates on the longest valid prefix of [p]. *)
 
-val fold : ('a -> 'b option -> 'c -> 'c) -> ('a, 'b) t -> 'c -> 'c
+val fold : (string -> 'a option -> 'c -> 'c) -> 'a t -> 'c -> 'c
 (** [fold f t x] fold [f] over every nodes of [t], with [x] as initial value. *)
 
-val map : ('b -> 'c option) -> ('a,'b) t -> ('a,'c) t
+val map : ('a -> 'b option) -> 'a t -> 'b t
 (** [map f t] maps [f] over every values stored in [t]. The return value of [f] is of type 'c option
 	as one may wants to remove value associated to a key. This function is not tail-recursive. *)
 
-val sub : ('a, 'b) t -> 'a list -> ('a,'b) t
+val sub : 'a t -> string list -> 'a t
 (** [sub t p] returns the sub-trie associated with the path [p] in the trie [t].
 	If [p] is not a valid path of [t], it returns an empty trie. *)
-- 
2.29.2


