Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BB2466B6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 14:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ed5-0006o8-5i; Mon, 17 Aug 2020 12:52:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wKSP=B3=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1k7ed3-0006o0-Qr
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 12:52:45 +0000
X-Inumbo-ID: b2560a18-d09d-4961-b6d7-5d16a525c404
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2560a18-d09d-4961-b6d7-5d16a525c404;
 Mon, 17 Aug 2020 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597668765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yO69ZFlS7owSlGndvZAq/2WxUZewbuuPF5HOBciFkJE=;
 b=CwIuatu4BDrGn53gFRvCcFf7devc3ELIMOTV0msKb+X6HysMbVKYZBSL
 kHzFwAq3Mvbwjz8HpuYOUg8plFZ4FSi22b37dO33oPdzH8uYsMY19hcLL
 gSFY2xpQTgeeLh3TCvKD+fu6R3XZhWNC96YPp1pt2nrESYIyyu3A8zImA 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: voOMi8ApA6pqfCEHzetCf1ymY/y84j5TC6D2xM2RC4dNApCKNeCiN+XxT+4CqHG/ZpDzru80zi
 Dh3NKzX5o6RVAkN4Ss793/C2MMy5opUnDAGOIIakN+8qPkNWhERjUG+ZVnjuU+MMm+JFyNgxN3
 lvxd3BuZ8JB1Rynq4Av75M7EwpotVpcaU4FZ0Oz5SjazfwfBgdg1tepfHpnU1acN2SPPKkyM2b
 YSMaecOhSHHyoGbyExrd6VVq3GVgZw2QI5jsjx3Me2rSdeSzYxP1yCHbKFA1TjAemKrL6LnMdi
 9zA=
X-SBRS: 2.7
X-MesageID: 24686249
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24686249"
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH v1 5/6] tools/ocaml/xenstored: use more efficient node
 trees
Thread-Topic: [PATCH v1 5/6] tools/ocaml/xenstored: use more efficient node
 trees
Thread-Index: AQHWcohKw/Zift3OKUSHXeXs5CJIpKk8Q3c4
Date: Mon, 17 Aug 2020 12:52:40 +0000
Message-ID: <1597668760460.95626@citrix.com>
References: <cover.1597442238.git.edvin.torok@citrix.com>,
 <f2aff7b39137518d56ef99ea9faf7ce959c81ab9.1597442238.git.edvin.torok@citrix.com>
In-Reply-To: <f2aff7b39137518d56ef99ea9faf7ce959c81ab9.1597442238.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

+let compare a b =3D=0A=
+  if equal a b then 0=0A=
+  else -(String.compare a b)=0A=
=0A=
I think this bit could use an inline comment why the sort order is reversed=
. This could be also simplified to -(String.compare a b) because this goes =
to the internal (polymorphic) compare implemented in C which does a physica=
l equivalence check first.=0A=
=0A=
-- C=0A=
=0A=
________________________________________=0A=
From: Edwin Torok=0A=
Sent: 14 August 2020 23:14=0A=
To: xen-devel@lists.xenproject.org=0A=
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu=0A=
Subject: [PATCH v1 5/6] tools/ocaml/xenstored: use more efficient node tree=
s=0A=
=0A=
This changes the output of xenstore-ls to be sorted.=0A=
Previously the keys were listed in the order in which they were inserted=0A=
in.=0A=
docs/misc/xenstore.txt doesn't specify in what order keys are listed.=0A=
=0A=
Map.update is used to retain semantics with replace_child:=0A=
only an existing child is replaced, if it wasn't part of the original=0A=
map we don't add it.=0A=
Similarly exception behaviour is retained for del_childname and related=0A=
functions.=0A=
=0A=
Entries are stored in reverse sort order, so that upon Map.fold the=0A=
constructed list is sorted in ascending order and there is no need for a=0A=
List.rev.=0A=
=0A=
Signed-off-by: Edwin T=F6r=F6k <edvin.torok@citrix.com>=0A=
---=0A=
 tools/ocaml/xenstored/store.ml   | 46 +++++++++++++++-----------------=0A=
 tools/ocaml/xenstored/symbol.ml  |  4 +++=0A=
 tools/ocaml/xenstored/symbol.mli |  3 +++=0A=
 3 files changed, 29 insertions(+), 24 deletions(-)=0A=
=0A=
diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.m=
l=0A=
index 45659a23ee..d9dfa36045 100644=0A=
--- a/tools/ocaml/xenstored/store.ml=0A=
+++ b/tools/ocaml/xenstored/store.ml=0A=
@@ -16,17 +16,19 @@=0A=
  *)=0A=
 open Stdext=0A=
=0A=
+module SymbolMap =3D Map.Make(Symbol)=0A=
+=0A=
 module Node =3D struct=0A=
=0A=
 type t =3D {=0A=
        name: Symbol.t;=0A=
        perms: Perms.Node.t;=0A=
        value: string;=0A=
-       children: t list;=0A=
+       children: t SymbolMap.t;=0A=
 }=0A=
=0A=
 let create _name _perms _value =3D=0A=
-       { name =3D Symbol.of_string _name; perms =3D _perms; value =3D _val=
ue; children =3D []; }=0A=
+       { name =3D Symbol.of_string _name; perms =3D _perms; value =3D _val=
ue; children =3D SymbolMap.empty; }=0A=
=0A=
 let get_owner node =3D Perms.Node.get_owner node.perms=0A=
 let get_children node =3D node.children=0A=
@@ -42,38 +44,34 @@ let set_value node nvalue =3D=0A=
 let set_perms node nperms =3D { node with perms =3D nperms }=0A=
=0A=
 let add_child node child =3D=0A=
-       { node with children =3D child :: node.children }=0A=
+       let children =3D SymbolMap.add child.name child node.children in=0A=
+       { node with children }=0A=
=0A=
 let exists node childname =3D=0A=
        let childname =3D Symbol.of_string childname in=0A=
-       List.exists (fun n -> Symbol.equal n.name childname) node.children=
=0A=
+       SymbolMap.mem childname node.children=0A=
=0A=
 let find node childname =3D=0A=
        let childname =3D Symbol.of_string childname in=0A=
-       List.find (fun n -> Symbol.equal n.name childname) node.children=0A=
+       SymbolMap.find childname node.children=0A=
=0A=
 let replace_child node child nchild =3D=0A=
-       (* this is the on-steroid version of the filter one-replace one *)=
=0A=
-       let rec replace_one_in_list l =3D=0A=
-               match l with=0A=
-               | []                               -> []=0A=
-               | h :: tl when Symbol.equal h.name child.name -> nchild :: =
tl=0A=
-               | h :: tl                          -> h :: replace_one_in_l=
ist tl=0A=
-               in=0A=
-       { node with children =3D (replace_one_in_list node.children) }=0A=
+       { node with=0A=
+         children =3D SymbolMap.update child.name=0A=
+                    (function None -> None | Some _ -> Some nchild)=0A=
+                    node.children=0A=
+       }=0A=
=0A=
 let del_childname node childname =3D=0A=
        let sym =3D Symbol.of_string childname in=0A=
-       let rec delete_one_in_list l =3D=0A=
-               match l with=0A=
-               | []                        -> raise Not_found=0A=
-               | h :: tl when Symbol.equal h.name sym -> tl=0A=
-               | h :: tl                   -> h :: delete_one_in_list tl=
=0A=
-               in=0A=
-       { node with children =3D (delete_one_in_list node.children) }=0A=
+       { node with children =3D=0A=
+               SymbolMap.update sym=0A=
+                 (function None -> raise Not_found | Some _ -> None)=0A=
+                 node.children=0A=
+       }=0A=
=0A=
 let del_all_children node =3D=0A=
-       { node with children =3D [] }=0A=
+       { node with children =3D SymbolMap.empty }=0A=
=0A=
 (* check if the current node can be accessed by the current connection wit=
h rperm permissions *)=0A=
 let check_perm node connection request =3D=0A=
@@ -87,7 +85,7 @@ let check_owner node connection =3D=0A=
                raise Define.Permission_denied;=0A=
        end=0A=
=0A=
-let rec recurse fct node =3D fct node; List.iter (recurse fct) node.childr=
en=0A=
+let rec recurse fct node =3D fct node; SymbolMap.iter (fun _ -> recurse fc=
t) node.children=0A=
=0A=
 let unpack node =3D (Symbol.to_string node.name, node.perms, node.value)=
=0A=
=0A=
@@ -321,7 +319,7 @@ let ls store perm path =3D=0A=
                                Node.check_perm cnode perm Perms.READ;=0A=
                                cnode.Node.children in=0A=
                        Path.apply store.root path do_ls in=0A=
-       List.rev (List.map (fun n -> Symbol.to_string n.Node.name) children=
)=0A=
+       SymbolMap.fold (fun k _ accu -> Symbol.to_string k :: accu) childre=
n []=0A=
=0A=
 let getperms store perm path =3D=0A=
        if path =3D [] then=0A=
@@ -350,7 +348,7 @@ let traversal root_node f =3D=0A=
        let rec _traversal path node =3D=0A=
                f path node;=0A=
                let node_path =3D Path.of_path_and_name path (Symbol.to_str=
ing node.Node.name) in=0A=
-               List.iter (_traversal node_path) node.Node.children=0A=
+               SymbolMap.iter (fun _ -> _traversal node_path) node.Node.ch=
ildren=0A=
                in=0A=
        _traversal [] root_node=0A=
=0A=
diff --git a/tools/ocaml/xenstored/symbol.ml b/tools/ocaml/xenstored/symbol=
.ml=0A=
index dac6f9f819..2697915623 100644=0A=
--- a/tools/ocaml/xenstored/symbol.ml=0A=
+++ b/tools/ocaml/xenstored/symbol.ml=0A=
@@ -31,6 +31,10 @@ let equal a b =3D=0A=
   (* compare using physical equality, both members have to be part of the =
above weak table *)=0A=
   a =3D=3D b=0A=
=0A=
+let compare a b =3D=0A=
+  if equal a b then 0=0A=
+  else -(String.compare a b)=0A=
+=0A=
 let stats () =3D=0A=
   let len, entries, _, _, _, _ =3D WeakTable.stats tbl in=0A=
   len, entries=0A=
diff --git a/tools/ocaml/xenstored/symbol.mli b/tools/ocaml/xenstored/symbo=
l.mli=0A=
index 586ab57507..dd0f014796 100644=0A=
--- a/tools/ocaml/xenstored/symbol.mli=0A=
+++ b/tools/ocaml/xenstored/symbol.mli=0A=
@@ -32,6 +32,9 @@ val to_string : t -> string=0A=
 val equal: t -> t -> bool=0A=
 (** Compare two symbols for equality *)=0A=
=0A=
+val compare: t -> t -> int=0A=
+(** Compare two symbols *)=0A=
+=0A=
 (** {6 Statistics } *)=0A=
=0A=
 val stats : unit -> int * int=0A=
--=0A=
2.25.1=0A=
=0A=

