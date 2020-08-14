Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A03244FC3
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 00:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6hyF-00009R-Kf; Fri, 14 Aug 2020 22:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uEIT=BY=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k6hyD-00007n-P3
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 22:14:41 +0000
X-Inumbo-ID: 6909c582-9f4e-44d7-bc8b-509c7e7097c7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6909c582-9f4e-44d7-bc8b-509c7e7097c7;
 Fri, 14 Aug 2020 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597443279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Q7mZezmkZDXxgdfVrSnPIVAXJc1OwrHZVcWnmgusxs=;
 b=Ubu10ISKPvXSxvDbqWooK3wDw9jmlzJkNWwyHPHkDSF9b1vesulhAHIy
 wYR9ju6rcm8XR0PZ905IEmQ+lmQNHwR1kB/vxYlymFc9CuRVUxzFZ1Xu0
 8X1BXjvgec00cVC3VLOirYDV9v56btTD4jS8CLd4cpMvPJp1tjqJVYeak 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1LBNtNrPDNlAwaIFp3ww/RJ8dePjBdmQ0essod3qtkvnJPnEVBiqMl1hKXPllR4ZYmiy1lI3F/
 Eqplq86CoKTMeW25/bjvz5DHqLiHCmGaUnEM9peONsiFysBH6acXcGbUqbawUMP8PHHXu6tZIp
 3WXil2ha5g3nBxtKCRSVsnj8K49F584Wkvt8zqPAe47A9Pn9aBIsgidXVULJre/zoKxoM1staa
 Vy0LFVOdm79M53gol2JlGpkLmyIh8J9/F4UZb+FSbEY9drbncn5bn3F1Oo/8IixIaOIyil3hjk
 EoY=
X-SBRS: 2.7
X-MesageID: 24917872
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24917872"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 5/6] tools/ocaml/xenstored: use more efficient node trees
Date: Fri, 14 Aug 2020 23:14:16 +0100
Message-ID: <f2aff7b39137518d56ef99ea9faf7ce959c81ab9.1597442238.git.edvin.torok@citrix.com>
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


