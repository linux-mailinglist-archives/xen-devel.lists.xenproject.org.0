Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A42472A7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:46:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k9C-00078m-Ie; Mon, 17 Aug 2020 18:46:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k9B-00077W-6w
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:46:17 +0000
X-Inumbo-ID: 8845624d-2fd2-4170-a630-9b91c4da73b4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8845624d-2fd2-4170-a630-9b91c4da73b4;
 Mon, 17 Aug 2020 18:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Q7mZezmkZDXxgdfVrSnPIVAXJc1OwrHZVcWnmgusxs=;
 b=DVeDuCty+UhY9xS0+jO+Vsv5Z8qN4EmaPPeaQSGlAG9yiQpr/DP+M5Fo
 RsBcajEodeJiThPYGwNG6Oi/ZwsPnkGI86Yny1boL8nnFRpGxbr9/nq8h
 3uVbun/NDgBWI9l3NWyymuun31GFqhR/r7x5kvC4E9+KXgOHEoy+xc8g+ I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PgIs/TnBiUf2teGp1uBfYwKa5Y9oTd4pGCsjQ9IgUbourgJeyQYMFGyvI0aAgDDixwZM6M6nZI
 aBpxydnKaVGWy3v/3GMM73kM7xsNb8Kg1/4dF3enCJEcxE9VTehWBi8k341l6q4vBxDU5v0zku
 V6awyOaZDuM3opGNPFKZx9olV1lErTBM3pS235jd9pEWFCVVuDlRrbddtgxYbifoe9LTHyvj1Q
 NJ2Y/9M6N2XiTztpb49Q/Buoq2SQRYbBSb+ytX8MVolF7E3rKP+NO+pMsXEt40voR4sK9zI9mU
 onA=
X-SBRS: 2.7
X-MesageID: 24693220
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24693220"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
Subject: [PATCH v3 5/6] tools/ocaml/xenstored: use more efficient node trees
Date: Mon, 17 Aug 2020 19:45:48 +0100
Message-ID: <b0b4093cc7360ed013af1f17b7aabfb5c9f0cf9c.1597689796.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597689796.git.edvin.torok@citrix.com>
References: <cover.1597689796.git.edvin.torok@citrix.com>
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

This changes the output of xenstore-ls to be sorted.
Previously the keys were listed in the order in which they were inserted
in.
docs/misc/xenstore.txt doesn't specify in what order keys are listed.

Map.update is used to retain semantics with replace_child:
only an existing child is replaced, if it wasn't part of the original
map we don't add it.
Similarly exception behaviour is retained for del_childname and related
functions.

Entries are stored in reverse sort order, so that upon Map.fold the
constructed list is sorted in ascending order and there is no need for a
List.rev.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/store.ml   | 46 +++++++++++++++-----------------
 tools/ocaml/xenstored/symbol.ml  |  4 +++
 tools/ocaml/xenstored/symbol.mli |  3 +++
 3 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 45659a23ee..d9dfa36045 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -16,17 +16,19 @@
  *)
 open Stdext
 
+module SymbolMap = Map.Make(Symbol)
+
 module Node = struct
 
 type t = {
 	name: Symbol.t;
 	perms: Perms.Node.t;
 	value: string;
-	children: t list;
+	children: t SymbolMap.t;
 }
 
 let create _name _perms _value =
-	{ name = Symbol.of_string _name; perms = _perms; value = _value; children = []; }
+	{ name = Symbol.of_string _name; perms = _perms; value = _value; children = SymbolMap.empty; }
 
 let get_owner node = Perms.Node.get_owner node.perms
 let get_children node = node.children
@@ -42,38 +44,34 @@ let set_value node nvalue =
 let set_perms node nperms = { node with perms = nperms }
 
 let add_child node child =
-	{ node with children = child :: node.children }
+	let children = SymbolMap.add child.name child node.children in
+	{ node with children }
 
 let exists node childname =
 	let childname = Symbol.of_string childname in
-	List.exists (fun n -> Symbol.equal n.name childname) node.children
+	SymbolMap.mem childname node.children
 
 let find node childname =
 	let childname = Symbol.of_string childname in
-	List.find (fun n -> Symbol.equal n.name childname) node.children
+	SymbolMap.find childname node.children
 
 let replace_child node child nchild =
-	(* this is the on-steroid version of the filter one-replace one *)
-	let rec replace_one_in_list l =
-		match l with
-		| []                               -> []
-		| h :: tl when Symbol.equal h.name child.name -> nchild :: tl
-		| h :: tl                          -> h :: replace_one_in_list tl
-		in
-	{ node with children = (replace_one_in_list node.children) }
+	{ node with
+	  children = SymbolMap.update child.name
+		     (function None -> None | Some _ -> Some nchild)
+		     node.children
+	}
 
 let del_childname node childname =
 	let sym = Symbol.of_string childname in
-	let rec delete_one_in_list l =
-		match l with
-		| []                        -> raise Not_found
-		| h :: tl when Symbol.equal h.name sym -> tl
-		| h :: tl                   -> h :: delete_one_in_list tl
-		in
-	{ node with children = (delete_one_in_list node.children) }
+	{ node with children =
+		SymbolMap.update sym
+		  (function None -> raise Not_found | Some _ -> None)
+		  node.children
+	}
 
 let del_all_children node =
-	{ node with children = [] }
+	{ node with children = SymbolMap.empty }
 
 (* check if the current node can be accessed by the current connection with rperm permissions *)
 let check_perm node connection request =
@@ -87,7 +85,7 @@ let check_owner node connection =
 		raise Define.Permission_denied;
 	end
 
-let rec recurse fct node = fct node; List.iter (recurse fct) node.children
+let rec recurse fct node = fct node; SymbolMap.iter (fun _ -> recurse fct) node.children
 
 let unpack node = (Symbol.to_string node.name, node.perms, node.value)
 
@@ -321,7 +319,7 @@ let ls store perm path =
 				Node.check_perm cnode perm Perms.READ;
 				cnode.Node.children in
 			Path.apply store.root path do_ls in
-	List.rev (List.map (fun n -> Symbol.to_string n.Node.name) children)
+	SymbolMap.fold (fun k _ accu -> Symbol.to_string k :: accu) children []
 
 let getperms store perm path =
 	if path = [] then
@@ -350,7 +348,7 @@ let traversal root_node f =
 	let rec _traversal path node =
 		f path node;
 		let node_path = Path.of_path_and_name path (Symbol.to_string node.Node.name) in
-		List.iter (_traversal node_path) node.Node.children
+		SymbolMap.iter (fun _ -> _traversal node_path) node.Node.children
 		in
 	_traversal [] root_node
 
diff --git a/tools/ocaml/xenstored/symbol.ml b/tools/ocaml/xenstored/symbol.ml
index dac6f9f819..2697915623 100644
--- a/tools/ocaml/xenstored/symbol.ml
+++ b/tools/ocaml/xenstored/symbol.ml
@@ -31,6 +31,10 @@ let equal a b =
   (* compare using physical equality, both members have to be part of the above weak table *)
   a == b
 
+let compare a b =
+  if equal a b then 0
+  else -(String.compare a b)
+
 let stats () =
   let len, entries, _, _, _, _ = WeakTable.stats tbl in
   len, entries
diff --git a/tools/ocaml/xenstored/symbol.mli b/tools/ocaml/xenstored/symbol.mli
index 586ab57507..dd0f014796 100644
--- a/tools/ocaml/xenstored/symbol.mli
+++ b/tools/ocaml/xenstored/symbol.mli
@@ -32,6 +32,9 @@ val to_string : t -> string
 val equal: t -> t -> bool
 (** Compare two symbols for equality *)
 
+val compare: t -> t -> int
+(** Compare two symbols *)
+
 (** {6 Statistics } *)
 
 val stats : unit -> int * int
-- 
2.25.1


