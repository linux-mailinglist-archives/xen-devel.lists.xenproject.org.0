Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B42F88EC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68748.123226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxy-0002Wt-TS; Fri, 15 Jan 2021 22:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68748.123226; Fri, 15 Jan 2021 22:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xxy-0002W9-ON; Fri, 15 Jan 2021 22:53:14 +0000
Received: by outflank-mailman (input) for mailman id 68748;
 Fri, 15 Jan 2021 22:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xxx-0001Wj-04
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:53:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f5fe6cd-fc20-48c5-bbed-42ec3f69d494;
 Fri, 15 Jan 2021 22:52:35 +0000 (UTC)
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
X-Inumbo-ID: 3f5fe6cd-fc20-48c5-bbed-42ec3f69d494
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X7XyD2V6jMFkw/QtmgQYzQRGshY0fkhqbVCJVUmwv1A=;
  b=QcxUH91eX51ccsFO6ttyQ4QWcuP1q6imal2VhHnuzrVS2GIDine7IJYs
   utvgQS8DDbDO9RU4qh0IUNKz/lq3eQzSOyB1MEiENyLTA+z+uttcmGviC
   YJ+uJ7WycUuOb+bVq/g3B4Qike6UgQW45btGMUJhNB1LACAQiMKu5CP3Z
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: amcrpVM51Xv+RMjduqtrDS7MY7GC3tzNnjjQlLbMq9NBB+U8ZEzJlWvUdV0GFczUC6uhPSfocp
 gLKU4kTmfYL8q7IqXireAozZ99Q6m6Hf1kanzVWQWEvh97GqDCRZ1acdQb9jlb7q6wuUVKJKP5
 GpjiC0Ry//tbpKFHTJFpD3YB7wGYWrLl+jJdaqiEEuRglyaIifl0cPpUtB659nFj6q9OZFrei4
 f8Ci8wweyx6pUz4RmDyOVPyZMP29SenWvGF1wXO6r4LqeRWuesDFtYghRsnPts4RrIYO2nlGrR
 Fns=
X-SBRS: 5.1
X-MesageID: 35435269
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35435269"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 2/4] tools/ocaml/xenstored: backport find_opt/update from 4.06
Date: Fri, 15 Jan 2021 22:28:56 +0000
Message-ID: <a5006eed2196e9645e0704bf606836e8a9a7114a.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We are currently on OCaml 4.02 as minimum version.
To make the followup optimizations compile backport these functions from
OCaml 4.06.

This implementation is less efficient than the one in the 4.06 standard
library which has access to the internals of the Map.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changed since V3:
* repost after XSA to avoid conflicts
---
 tools/ocaml/xenstored/stdext.ml | 19 +++++++++++++++++++
 tools/ocaml/xenstored/trie.ml   |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/tools/ocaml/xenstored/stdext.ml b/tools/ocaml/xenstored/stdext.ml
index e1567c4dfa..0640602449 100644
--- a/tools/ocaml/xenstored/stdext.ml
+++ b/tools/ocaml/xenstored/stdext.ml
@@ -50,6 +50,25 @@ module Filename = struct
 		cmd :: args |> List.map quote |> String.concat " "
 end
 
+module Map = struct
+module Make(Ord: Map.OrderedType) = struct
+
+include Map.Make(Ord)
+
+let find_opt k t = try Some (find k t) with Not_found -> None
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
2.29.2


