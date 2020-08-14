Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E0244FC4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 00:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6hyJ-0000Af-Uy; Fri, 14 Aug 2020 22:14:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEIT=BY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k6hyI-00007n-P2
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 22:14:46 +0000
X-Inumbo-ID: f2dcc7ba-d036-4764-9056-17974c1d5988
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2dcc7ba-d036-4764-9056-17974c1d5988;
 Fri, 14 Aug 2020 22:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597443280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=if7OGWtVmhZh72IibrAy1nlT/ZT6plG+SikdsKX2czc=;
 b=JJ/bjhqZ5QwEu1kcgiUXc+mVKYBIvn/eg0PflKh/8pVrpG/wyvMDCUrb
 c9oOxANJ60xWuKPbaDwabuLOoIaHbcW+hfMwFdgoZcuX/z6EeWV8IKzso
 +5MTaHDKFK7PPh/STtYwyspXOwphdhuz+SRRNpbTBxpyAZ/UW3peQGaj1 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RP0nrB09qZOcsD1mSyafDyVlsizLVkFU4vgSZ9Lyr+IityS70NXuNoiZ1WfjjYwsO0ZqA2cODT
 HqwV8G4eRG+NsqjFM7M5D7ZALPwLIYtmkOMM3wud0qjAFk20rv28hIMTEo4fdqtAsp6iqEkNnL
 TAo75Gr1RSxOPPxBskvNOrz7HWoilS+//sNUVfqpPyr2qnVL+s52SSVmKNhD0GPU8KdHNFutRJ
 yH870z85/1YPlWoePTAqigPsk2gHbZezBuSNjSDMogPke4q10btLjiADD01MXfUyH42C2efK0l
 AZA=
X-SBRS: 2.7
X-MesageID: 24594802
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24594802"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 6/6] tools/ocaml/xenstored: use more efficient tries
Date: Fri, 14 Aug 2020 23:14:17 +0100
Message-ID: <9bb3bfc05610728017dbd6321470b5413302d717.1597442238.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597442238.git.edvin.torok@citrix.com>
References: <cover.1597442238.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FTLPEX02CAS01.citrite.net (10.13.99.120) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 tools/ocaml/xenstored/connections.ml |  2 +-
 tools/ocaml/xenstored/trie.ml        | 61 ++++++++++++----------------
 tools/ocaml/xenstored/trie.mli       | 26 ++++++------
 3 files changed, 41 insertions(+), 48 deletions(-)

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
diff --git a/tools/ocaml/xenstored/trie.ml b/tools/ocaml/xenstored/trie.ml
index dc42535092..f4ef97742f 100644
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
@@ -158,8 +151,8 @@ and set tree path value =
 				  let node = find_node tree h in
 				  replace_node tree h (set_node node t value)
 			  end else begin
-				  let node = Node.empty h in
-				  set_node node t value :: tree
+				  let node = Node._create h value in
+				  StringMap.add node.Node.key node tree
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


