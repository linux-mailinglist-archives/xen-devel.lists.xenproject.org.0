Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE04255685
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 10:30:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBZm9-0001Zh-4w; Fri, 28 Aug 2020 08:30:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqDx=CG=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kBZm8-0001Zc-5j
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 08:30:20 +0000
X-Inumbo-ID: 113721b6-3e26-4559-8608-d2fe85005938
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 113721b6-3e26-4559-8608-d2fe85005938;
 Fri, 28 Aug 2020 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598603419;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r2Y9yQAdP72ybxRjlqz+cruf/jyLrIIfP2IsJskvmfs=;
 b=FphK5eE/UkhYHarFfaqxysrq8XJ4I/iRJqVkfyOaxO00RYtqfYq49w4+
 bOZ5wxhTQ1NxLvrdJxBVIeKOpx10IIBfQ2ZuvQek+qEIOSuJ+lDSnCJCJ
 hOUX7Rmd2+4e3yZvenHvu15O/o6Oh0EhlUGn/SSlWMlGy5IQxgr38mUFk 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6BBq2OSfzTHTgUDDAqY8//GSvjuwtQyDBtEyxkOmb/WxbcYL2T8AVzeg+gY5zjOmTinhzpNxy0
 vN80Mi0kHs9elAB44hFnlB2gGI4XKWeLojul9noXLRmQM4hVYWSDuRaxFjRQi/xx+nq1kiu6lu
 oicNinB5m84yGFwB9VLOD5AF6QoI085+uU+iUePp5/tUJ6Y9Lwg+P7OMzUGFGnXzItG/vFBqPy
 +DdM4Cp97c86bErnnNpgoLen36ckS0rMFppgK+xUyIju59wxmOkkk6/Q2SrfbaezccuYTET+ML
 8eQ=
X-SBRS: 2.7
X-MesageID: 25489716
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,363,1592884800"; d="scan'208";a="25489716"
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
CC: David Scott <dave@recoil.org>, Ian Jackson <Ian.Jackson@citrix.com>, "Wei
 Liu" <wl@xen.org>
Subject: Re: [PATCH v4 2/4] Map: backport find_opt/update from 4.06
Thread-Topic: [PATCH v4 2/4] Map: backport find_opt/update from 4.06
Thread-Index: AQHWfJh3uKZDw4ZJUUWej1tdtQi326lNL7ix
Date: Fri, 28 Aug 2020 08:30:15 +0000
Message-ID: <1598603415021.35327@citrix.com>
References: <cover.1598548188.git.edvin.torok@citrix.com>,
 <72b1f39ce900870819630cc7ba5bcb1f6610de77.1598548188.git.edvin.torok@citrix.com>
In-Reply-To: <72b1f39ce900870819630cc7ba5bcb1f6610de77.1598548188.git.edvin.torok@citrix.com>
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

=0A=
________________________________________=0A=
From: Edwin T=F6r=F6k <edvin.torok@citrix.com>=0A=
Sent: 27 August 2020 18:35=0A=
To: xen-devel@lists.xenproject.org=0A=
Cc: Edwin Torok; Christian Lindig; David Scott; Ian Jackson; Wei Liu=0A=
Subject: [PATCH v4 2/4] Map: backport find_opt/update from 4.06=0A=
=0A=
We are currently on OCaml 4.02 as minimum version.=0A=
To make the followup optimizations compile backport these functions from=0A=
OCaml 4.06.=0A=
=0A=
This implementation is less efficient than the one in the 4.06 standard=0A=
library which has access to the internals of the Map.=0A=
=0A=
Signed-off-by: Edwin T=F6r=F6k <edvin.torok@citrix.com>=0A=
---=0A=
Changes since V3:=0A=
* this patch is new in V4=0A=
---=0A=
 tools/ocaml/xenstored/stdext.ml | 21 +++++++++++++++++++++=0A=
 tools/ocaml/xenstored/trie.ml   |  2 ++=0A=
 2 files changed, 23 insertions(+)=0A=
=0A=
diff --git a/tools/ocaml/xenstored/stdext.ml b/tools/ocaml/xenstored/stdext=
.ml=0A=
index 4f2f3a2c8c..5bebe2aa27 100644=0A=
--- a/tools/ocaml/xenstored/stdext.ml=0A=
+++ b/tools/ocaml/xenstored/stdext.ml=0A=
@@ -44,6 +44,27 @@ let default d v =3D=0A=
 let maybe f v =3D=0A=
        match v with None -> () | Some x -> f x=0A=
=0A=
+module Map =3D struct=0A=
+module Make(Ord: Map.OrderedType) =3D struct=0A=
+=0A=
+include Map.Make(Ord)=0A=
+=0A=
+let find_opt k t =3D=0A=
+       (* avoid raising exceptions, they can be expensive *)=0A=
+       if mem k t then Some (find k t) else None=0A=
=0A=
I disagree with this argument. Exceptions in OCaml are cheap because they d=
on't walk the stack and cut to the exception handler directly. Is there a r=
eason why they could be expensive here? In any case, the code is correct.=
=0A=
=0A=
+=0A=
+let update k f t =3D=0A=
+  let r =3D find_opt k t in=0A=
+  let r' =3D f r in=0A=
+  match r, r' with=0A=
+  | None, None -> t=0A=
+  | Some _, None -> remove k t=0A=
+  | Some r, Some r' when r =3D=3D r' -> t=0A=
+  | _, Some r' -> add k r' t=0A=
=0A=
This looks correct to me.=0A=
=0A=
+=0A=
+end=0A=
+end=0A=
+=0A=
 module String =3D struct include String=0A=
=0A=
 let of_char c =3D String.make 1 c=0A=
diff --git a/tools/ocaml/xenstored/trie.ml b/tools/ocaml/xenstored/trie.ml=
=0A=
index dc42535092..f513f4e608 100644=0A=
--- a/tools/ocaml/xenstored/trie.ml=0A=
+++ b/tools/ocaml/xenstored/trie.ml=0A=
@@ -13,6 +13,8 @@=0A=
  * GNU Lesser General Public License for more details.=0A=
  *)=0A=
=0A=
+open Stdext=0A=
+=0A=
 module Node =3D=0A=
 struct=0A=
        type ('a,'b) t =3D  {=0A=
--=0A=
2.25.1=0A=
=0A=
-- =0A=
Acked-by: Christian Lindig <christian.lindig@citrix.com>=0A=

