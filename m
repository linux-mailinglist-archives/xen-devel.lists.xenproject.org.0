Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3814247232
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:40:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k3p-0006QS-70; Mon, 17 Aug 2020 18:40:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k3n-0006KG-0d
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:40:43 +0000
X-Inumbo-ID: 05d78877-7760-4e5c-98de-8822bc0157cd
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05d78877-7760-4e5c-98de-8822bc0157cd;
 Mon, 17 Aug 2020 18:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Bs+Fxq+yO/S2L4Mgyr+mCqf669K6A0XW3wC71rhZYE=;
 b=RvK7vF/c05vzQOMJFPE9I+m5RYv5cIlkCoqZJdte07PwiUvVUtG5hgPY
 6RHuyrfoxYQbuGP3FJ3Ko5ghYLdw7Zq7TXaq+9C6B07t7ohjZUZWh5Twy
 v1AZH9oc70DGF+cS3i6cRmrGEAroJ2WmZuCMZAzYipYf302tXz7H71ml6 s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: e3ERQzfQkkqXGDaH6kFPmXuXgtAqi6mQp+1e9NVy1LAEZXyr3LzAqHlvp77HHO7iOLW4vAU7Zo
 wiJUWkCQtoxZGQlUcVDfbJoir+vvrs8ZqJ2bWuiTBCkoF5C1oJGeCcnrdqSaQ4RBmrFGB+IW4h
 Vi5rryeyALE4V2VpigYELzoxED4ss4Xsi/p+L0ac9hYrUltFQGuoEtl4AFx5SCpIn9DL7w8dYl
 pElMnnNs4SHGXNZxygmnWBV+zkvCtgOQ+4MpVtjqFlJhf0fkKNI5xkaJVXHosZMT9EQep74EOP
 KTs=
X-SBRS: 2.7
X-MesageID: 24692808
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24692808"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 6/6] tools/ocaml/xenstored: use more efficient tries
Date: Mon, 17 Aug 2020 19:39:54 +0100
Message-ID: <d05ab27779525bfcd4c7d397efbff5d5cde41d02.1597689211.git.edvin.torok@citrix.com>
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

No functional change, just an optimization.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changed since v1:
 * fix missing 'set_node' in 'set' that got lost in conversion to map
 * simplify 'compare' function
---
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/symbol.ml      |  6 +--
 tools/ocaml/xenstored/trie.ml        | 59 ++++++++++++----------------
 tools/ocaml/xenstored/trie.mli       | 26 ++++++------
 4 files changed, 43 insertions(+), 50 deletions(-)

diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index f02ef6b526..4983c7370b 100644
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
index 2697915623..85b3f265de 100644
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
index dc42535092..5b4831cf02 100644
--- a/tools/ocaml/xenstored/trie.ml
+++ b/tools/ocaml/xenstored/trie.ml
@@ -13,24 +13,26 @@
  * GNU Lesser General Public License for more details.
  *)
 
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
@@ -47,41 +49,31 @@ struct
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
@@ -92,13 +84,14 @@ let rec map f tree =
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
@@ -115,7 +108,7 @@ let rec sub_node tree = function
 
 let sub tree path =
 	try (sub_node tree path).Node.children
-	with Not_found -> []
+	with Not_found -> StringMap.empty
 
 let find tree path =
 	Node.get_value (sub_node tree path)
@@ -159,7 +152,7 @@ and set tree path value =
 				  replace_node tree h (set_node node t value)
 			  end else begin
 				  let node = Node.empty h in
-				  set_node node t value :: tree
+				  StringMap.add node.Node.key (set_node node t value) tree
 			  end
 
 let rec unset tree = function
@@ -174,7 +167,7 @@ let rec unset tree = function
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
2.25.1


