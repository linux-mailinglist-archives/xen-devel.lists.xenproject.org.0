Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2F2F88E7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68734.123180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxf-000256-03; Fri, 15 Jan 2021 22:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68734.123180; Fri, 15 Jan 2021 22:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxe-00024B-Sb; Fri, 15 Jan 2021 22:52:54 +0000
Received: by outflank-mailman (input) for mailman id 68734;
 Fri, 15 Jan 2021 22:52:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xxc-0001Wj-VU
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3292c6ea-e169-483b-a6ed-ac21b2d470a0;
 Fri, 15 Jan 2021 22:52:32 +0000 (UTC)
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
X-Inumbo-ID: 3292c6ea-e169-483b-a6ed-ac21b2d470a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZLD/rdH++y685dPBFUYhilMOR3v1G6op5GSP1Bi+bUQ=;
  b=OR1Frk0ybUU8Vu5fsT96CFzE4CAwQofmTXch2JvWLyAPet0Yndd0Ahw5
   Z4KyiF9fEGzr4YCH+1sP9fkFBbq0dI/Nx03zRXLtBfcvqy7MZstwX84w/
   HTqg0e57ETl/0Ww5MZlPKc/PKYS2ktCQWgMrxwcNDcCzkW/OzYhhCWrGp
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: dDuZDu7tcut9zupgjwfW01a6YpUEC3otCm/2Zm69JWBoi2OMLrP8pQja1SSsIXjKZ81+OoThSt
 5ncmLmhhvem4ZBG7agWEXCX86T5zWILAWRX3qf/OxTOquUx7vb7MHyVEmAWR21oYk04rHRWoFw
 qCf+2pksUisd2/hV+Bnkr3IncvSPAa9AO2ovpTYH5liKznm8lRaWJY8h7do9oTpq8LKwQusewO
 n+wRLhyi7xsnAZ2zgGu11RewGaxPK9yfBbAvvgLW+S5bdoKU6QIryNYG/qBLpKpyKgwH6MZHNs
 na4=
X-SBRS: 5.1
X-MesageID: 35591680
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35591680"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 3/4] tools/ocaml/xenstored: use more efficient node trees
Date: Fri, 15 Jan 2021 22:28:57 +0000
Message-ID: <fd9d707e59c62c4ff9f3af24cbb9cd208ece4b32.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

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

This changes the semantics and is not suitable as is for a backport.
It reveals bugs in buggy clients that depend on xenstore entry order,
however those clients should be fixed.
(We found one such bug in our internal testsuite where the first
 xenstore entry from a subtree was always dropped, and changing the
 listing order changed what key got dropped making the test fail)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Changed since V3:
* repost after XSA to avoid conflicts
---
 tools/ocaml/xenstored/store.ml   | 48 +++++++++++++++-----------------
 tools/ocaml/xenstored/symbol.ml  |  4 +++
 tools/ocaml/xenstored/symbol.mli |  3 ++
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index 9c226e4ef7..5f155f45eb 100644
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
@@ -87,12 +85,12 @@ let check_owner node connection =
 		raise Define.Permission_denied;
 	end
 
-let rec recurse fct node = fct node; List.iter (recurse fct) node.children
+let rec recurse fct node = fct node; SymbolMap.iter (fun _ -> recurse fct) node.children
 
 (** [recurse_map f tree] applies [f] on each node in the tree recursively *)
 let recurse_map f =
 	let rec walk node =
-		f { node with children = List.rev_map walk node.children |> List.rev }
+		  f { node with children = SymbolMap.map walk node.children }
 	in
 	walk
 
@@ -336,7 +334,7 @@ let ls store perm path =
 				Node.check_perm cnode perm Perms.READ;
 				cnode.Node.children in
 			Path.apply store.root path do_ls in
-	List.rev (List.map (fun n -> Symbol.to_string n.Node.name) children)
+	SymbolMap.fold (fun k _ accu -> Symbol.to_string k :: accu) children []
 
 let getperms store perm path =
 	if path = [] then (
@@ -366,7 +364,7 @@ let traversal root_node f =
 	let rec _traversal path node =
 		f path node;
 		let node_path = Path.of_path_and_name path (Symbol.to_string node.Node.name) in
-		List.iter (_traversal node_path) (List.rev node.Node.children)
+		SymbolMap.iter (fun _ -> _traversal node_path) node.Node.children
 		in
 	_traversal [] root_node
 
diff --git a/tools/ocaml/xenstored/symbol.ml b/tools/ocaml/xenstored/symbol.ml
index 2b41d120f6..301639f16f 100644
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
2.29.2


