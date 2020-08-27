Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56180254C41
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 19:36:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBLoP-0004sp-5u; Thu, 27 Aug 2020 17:35:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCk+=CF=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kBLoO-0004rt-2A
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 17:35:44 +0000
X-Inumbo-ID: cf6abffc-1cb1-40b9-ba43-eccd69afc856
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf6abffc-1cb1-40b9-ba43-eccd69afc856;
 Thu, 27 Aug 2020 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598549738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7hWEapjYocjJvSlH395vbK2zM9LXuSeRl6Q8PsG4SWY=;
 b=PhaJ1RBoIwgkz8BU0P5+8JI8BzYZ7drQoJuTavoTUhetmi6YxVKu5Fkf
 WnHOHUd41wqCkmt3L/IMLA6oskHRfIfbD8+IB7AEHD1uMHB6fdqBvqy7Z
 WgkdSqd6PFxkV/hGbdd1Son1k5eC4MicmH2PlVVj6X9eWt388joZzjKFd g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XxqxiNINzuojLKJrSIi/92+CJfnfQQTe/l7R50MqeOiA6jEbNuwGnnvNH87L/FTplRj8cA2had
 FNkbAyNJ+POufE/8W/eSirwgSaSt7hpGZ/4lRz5PXlAVdf9D7xtt8OWRbvHmljS3iFGqk3u5SC
 fs+jYp9WG5QohanzX5UkrVBx8Xtp0med6+5dHvpnGLQ0VAuV2h/sdj99y04ZqqWl723CNwqzo/
 x8XwWget1+imzOzckVFS99RMzMXz0+hiObq132zrI+lQqCScGQ43wKVXbL5LNUAkTCSO5ZiFCY
 0wE=
X-SBRS: 2.7
X-MesageID: 25758462
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,360,1592884800"; d="scan'208";a="25758462"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/4] Map: backport find_opt/update from 4.06
Date: Thu, 27 Aug 2020 18:35:17 +0100
Message-ID: <72b1f39ce900870819630cc7ba5bcb1f6610de77.1598548188.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1598548188.git.edvin.torok@citrix.com>
References: <cover.1598548188.git.edvin.torok@citrix.com>
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

We are currently on OCaml 4.02 as minimum version.
To make the followup optimizations compile backport these functions from
OCaml 4.06.

This implementation is less efficient than the one in the 4.06 standard
library which has access to the internals of the Map.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changes since V3:
* this patch is new in V4
---
 tools/ocaml/xenstored/stdext.ml | 21 +++++++++++++++++++++
 tools/ocaml/xenstored/trie.ml   |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/tools/ocaml/xenstored/stdext.ml b/tools/ocaml/xenstored/stdext.ml
index 4f2f3a2c8c..5bebe2aa27 100644
--- a/tools/ocaml/xenstored/stdext.ml
+++ b/tools/ocaml/xenstored/stdext.ml
@@ -44,6 +44,27 @@ let default d v =
 let maybe f v =
 	match v with None -> () | Some x -> f x
 
+module Map = struct
+module Make(Ord: Map.OrderedType) = struct
+
+include Map.Make(Ord)
+
+let find_opt k t =
+	(* avoid raising exceptions, they can be expensive *)
+	if mem k t then Some (find k t) else None
+
+let update k f t =
+  let r = find_opt k t in
+  let r' = f r in
+  match r, r' with
+  | None, None -> t
+  | Some _, None -> remove k t
+  | Some r, Some r' when r == r' -> t
+  | _, Some r' -> add k r' t
+
+end
+end
+
 module String = struct include String
 
 let of_char c = String.make 1 c
diff --git a/tools/ocaml/xenstored/trie.ml b/tools/ocaml/xenstored/trie.ml
index dc42535092..f513f4e608 100644
--- a/tools/ocaml/xenstored/trie.ml
+++ b/tools/ocaml/xenstored/trie.ml
@@ -13,6 +13,8 @@
  * GNU Lesser General Public License for more details.
  *)
 
+open Stdext
+
 module Node =
 struct
 	type ('a,'b) t =  {
-- 
2.25.1


