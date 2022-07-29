Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C45854C6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 19:54:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377688.611000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBi-00079y-NR; Fri, 29 Jul 2022 17:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377688.611000; Fri, 29 Jul 2022 17:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHUBi-00076c-Jg; Fri, 29 Jul 2022 17:54:14 +0000
Received: by outflank-mailman (input) for mailman id 377688;
 Fri, 29 Jul 2022 17:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UihI=YC=citrix.com=prvs=202bfa127=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oHUBg-0006a9-SJ
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 17:54:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73981336-0f67-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 19:54:11 +0200 (CEST)
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
X-Inumbo-ID: 73981336-0f67-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659117251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YsqAUruZxEJZb5m63knmpMxcbbh9Lwsahf6qP5J6SRg=;
  b=csiKeO3Qi3BK7huzdBDZRIfrD21iNnMzO0rF22E5T++Ui8ZVT9tRzwBy
   y2nSUVUj/bWBsuvmzpY5e5xEqx9ruzhBXOGENRAzIEbPH54lyANAungxW
   sSjncoCZq4hIek7L3zkruR+dSzBr9Z67/UBY0Uuw5VOA/MLvOxrYBl9t4
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76954909
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AFxXJPawBzM7eICQM0pF6t4n5zX0HO/c/ZkZSj?=
 =?us-ascii?q?0bt7gibmJ9p5j4zwXa+PPA8n6MSOj+oBzLS1YKs1foezaYk266aquEDHqvKj?=
 =?us-ascii?q?qCfOsM6bLDre/KbNWdY6s4SBA5s+mKOzHkOM/ISFHkvY9UAfsMjU7+bXqUrz?=
 =?us-ascii?q?JLSLOobNlPUVXVjmdP4dYsj+QTJro8s6wH8SPKjhKP/YcDZk/OMio2BbITP5?=
 =?us-ascii?q?Sk/mVEVEC/+6spRb7BO+yISBg7gNFo9fF4k303rZYrP0QGJb7w/GSNHejqED?=
 =?us-ascii?q?sOBjtxvSfUyR5ARWgdXeWV3FBaoO3SsojjwVn74Akjg7VDFHt7otLIq4LLWr?=
 =?us-ascii?q?N6NnvAWNCzNtmH6yy2SQu3grTMhNJLPI6Izdr16gWc34e9VdK2K9LgeEuOl4?=
 =?us-ascii?q?GZ5WWYZCoi+TUjAx/JGPH+cWD15qx2vw0c598Cu+viJjz2YCMAOPdCtPLKcu?=
 =?us-ascii?q?p8e2HXIjRioyrACeSWohFQXNNjQFnCuaTnwR8dBnuRRuio2HAQoVRwtaDD0O?=
 =?us-ascii?q?URJcGGl7vRdiWg9fGpp1wPGN6MpnDfpfE/IB20JBP9OBHmroLfYyWeGG7zYC?=
 =?us-ascii?q?BNHn3eYGDdQALzSkTy9kS/uAdFAodWgePyLBXQe7yBmktTgTlZjbGPnRz0gP?=
 =?us-ascii?q?p19xduFE8kyxkMrSVKOWUK/vee/yekHhEa9Ob9Gf8fGg6cbo+5/iAs4Skg/y?=
 =?us-ascii?q?AUUXdtmDCWwAxLkRWRwYdYy9ozzj9+rB0f2GFwYXDuXliuH9Q+QgBUnFYOUU?=
 =?us-ascii?q?qlBFJIeSzQcMY90r56TctOM/YK8r/kQaro5YCKeyrTDitMy1lxRR1j2EN1+j?=
 =?us-ascii?q?gU7u2d4mvnasCpWMvOeWdh1v/WUv74XKHkLE4fCTcqvVK3BZW9RPPhD/mvWA?=
 =?us-ascii?q?6Qf9ihRhgeXotRkpacgwqcXT5aJa7bssCOzV/WlFUgzQuiJ28zyUFmcxmz4o?=
 =?us-ascii?q?O1NifmzVivdJCz9DFP29c9pFRYW6N7Xwe6d7vu7q9T4Iy8zJqe9qg1dooGbl?=
 =?us-ascii?q?W0hXuGZozhqjADDB9i3TTVm3q7lu60ghVMCU8XBVse6dgD2t15zocwtNz4xM?=
 =?us-ascii?q?YtFTNfpj/N+ZycDmqzp2+e38F5w/eG7b9IrPOgE1IMliP169Qi0KA9RZPUEe?=
 =?us-ascii?q?7kYCX6q9gnj1KOQyINCmhthEwnCDNstzggbKejBflewiF9a3MhmKKE9hO5og?=
 =?us-ascii?q?yTvCiWw436pKs8FTB3SrOpyrag69lFO05JZX2TDizkkoTyMAP7JMwQ9zIlJH?=
 =?us-ascii?q?doaclgtTWRX6GDvFK8/+3R+MttnM7ezZBi9YkQJZt6VRxf+YuIUzRVjvCzEf?=
 =?us-ascii?q?px4HBEdi1NYRIsEWqPPD29Q6sF3t68gbHAiFiSwsv+rMjAmrs3EnLGvJkXwB?=
 =?us-ascii?q?ijPLXEkpWaIGdioh7B3NS/BZd481N/S6jctN6WdVp2wVHcT9cuQ1Kcb1TG9v?=
 =?us-ascii?q?+z/mnwvXvB8D4se0sp5NbtaZxXGfCF9M+3+TaIjLDCMy+qAwiR2hiIlHByze?=
 =?us-ascii?q?bq7ryODLonhLuEBs5kBGcN9hucVrqDelGdmnA3EfKQqFkUP8WxscT5i3M5fn?=
 =?us-ascii?q?rky7x2I/aJwLz1rlPkOv2JFlBa0rXZPMKFRPlt4ZcW63OEEg4SrEv2vyiGQ2?=
 =?us-ascii?q?rG/cbtw1QGuFG2Bqratc9jv2GnctgtE3eLIdVEE444P/j77nDfW2V5p6c2n9?=
 =?us-ascii?q?7hSij7N6AFwFZlfOXLC/pSJtQwOsTVCX0rlhNzowWeiyQzbUFS0eJpo6YPN8?=
 =?us-ascii?q?vGdqA+/Mn86OHMQTKx6EyqBrNZIU/zfKerQw5IwQKJbejFpDtQ7gCUqV3eJ7?=
 =?us-ascii?q?irjqN5vaNES26vwawBGid0FvNOyQVJOvDnuaaetC5UR9jXwlcxM34xnZVmbU?=
 =?us-ascii?q?OTTN5TtzoAcGtE2J2uNLY1WwYra0ZxAuVatbl5x5k/myEFyWsnYeaSbe79Ar?=
 =?us-ascii?q?0N5j4s8hzRB2LEulgbGTqGqtNxL9PRFDbf4pWk0X2dY/ddRkti0jBdjd4gez?=
 =?us-ascii?q?lJXFCZerst/RA5sZ434r3yLYVDK+dXiks3v3W2omjYQ2+R2lcpTHl6DCVKqK?=
 =?us-ascii?q?NgifenREYzc+klASUeo6iWtLAcMlinvc26ZHWnuvu2e6QlmDxIGoTToqFoBb?=
 =?us-ascii?q?DNsPo5pVxQbRQYPhBVXz7Z07t2f4f0W7oL9ffCjYmeJQo9rjTvpp7ZfuJmxs?=
 =?us-ascii?q?GhASa5YY3CHieSCaINgW+T8l3LGhGfMNtKgQt68ZOIqulAmrbySx1V7dJ8mI?=
 =?us-ascii?q?WZEAn8VUx7I5MzosyOD45h8uuDNbYGXr2QAGVtzXTdvR6WNiuAGS9co53jXm?=
 =?us-ascii?q?MhV6bWrj9OJD1vaMUmMsxtxwbEFQqb3C7yva8Mk8PL2W0hUnE9Q5+ZDmCkRj?=
 =?us-ascii?q?/jLxmZa0WFsD9RfONd8a6wfTxRGs/m4iYgSEn8pRKi/44wXhJU/jxRvaltMP?=
 =?us-ascii?q?oyVgYe/YO3tZG3XoPGK+wAI+ir33oRb+7towEfPcBMM6P750lZSVNvBZ4jJS?=
 =?us-ascii?q?k0cMiDKBqeTaIek3TmCwHvtoR4CdrPj0D+5sDfEIixf1r3PWkqAkcTqKS4Jo?=
 =?us-ascii?q?gNLkyagnvPfrWUKNyy/TIeq5d/hVEPwT4A3KcsDFvb+EWuHMlmVNjJNQSy2F?=
 =?us-ascii?q?qTaMnTZazeVsAKlYH9VgAAljGMBiNJEY0iPbcLrw3k0cLtc8FUVuDb05y0GA?=
 =?us-ascii?q?FCHwDKWouSBN3kqp5WEXPc8Nr7ObtOzp+EhvKFB32wk9rH1h1bUMHtJdIBLV?=
 =?us-ascii?q?lMqrK6Xt863KErEZqkoojaR8oFHZy5hq8cP3z1lQVDCOOmylyDtQA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,201,1654574400"; 
   d="scan'208";a="76954909"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 6/7] tools/ocaml/libs/xb: hide type of Xb.t
Date: Fri, 29 Jul 2022 18:53:29 +0100
Message-ID: <74ab9ad3ed031654fbfc343f299cedba2ebe3ac9.1659116941.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1659116941.git.edvin.torok@citrix.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The only user of 'xb' that I can find is in-tree oxenstored.
Other code (e.g. xenopsd) would use the mirage 'xenstore' implementation
instead, so changing the API here shouldn't require anyone to update
their code.

Hiding the type will make it easier to change the implementation
in the future without breaking code that relies on it.

No functional change.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/libs/xb/xb.ml           | 3 +++
 tools/ocaml/libs/xb/xb.mli          | 9 ++-------
 tools/ocaml/xenstored/connection.ml | 8 ++------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/tools/ocaml/libs/xb/xb.ml b/tools/ocaml/libs/xb/xb.ml
index 104d319d77..8404ddd8a6 100644
--- a/tools/ocaml/libs/xb/xb.ml
+++ b/tools/ocaml/libs/xb/xb.ml
@@ -196,6 +196,9 @@ let peek_output con = Queue.peek con.pkt_out
 let input_len con = Queue.length con.pkt_in
 let has_in_packet con = Queue.length con.pkt_in > 0
 let get_in_packet con = Queue.pop con.pkt_in
+let has_partial_input con = match con.partial_in with
+	| HaveHdr _ -> true
+	| NoHdr (n, _) -> n < Partial.header_size ()
 let has_more_input con =
 	match con.backend with
 	| Fd _         -> false
diff --git a/tools/ocaml/libs/xb/xb.mli b/tools/ocaml/libs/xb/xb.mli
index 3a00da6cdd..794e35bb34 100644
--- a/tools/ocaml/libs/xb/xb.mli
+++ b/tools/ocaml/libs/xb/xb.mli
@@ -66,13 +66,7 @@ type backend_mmap = {
 type backend_fd = { fd : Unix.file_descr; }
 type backend = Fd of backend_fd | Xenmmap of backend_mmap
 type partial_buf = HaveHdr of Partial.pkt | NoHdr of int * bytes
-type t = {
-  backend : backend;
-  pkt_in : Packet.t Queue.t;
-  pkt_out : Packet.t Queue.t;
-  mutable partial_in : partial_buf;
-  mutable partial_out : string;
-}
+type t
 val init_partial_in : unit -> partial_buf
 val reconnect : t -> unit
 val queue : t -> Packet.t -> unit
@@ -97,6 +91,7 @@ val has_output : t -> bool
 val peek_output : t -> Packet.t
 val input_len : t -> int
 val has_in_packet : t -> bool
+val has_partial_input : t -> bool
 val get_in_packet : t -> Packet.t
 val has_more_input : t -> bool
 val is_selectable : t -> bool
diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index a94d47cdc2..0ce54cd7f9 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -125,9 +125,7 @@ let get_perm con =
 let set_target con target_domid =
 	con.perm <- Perms.Connection.set_target (get_perm con) ~perms:[Perms.READ; Perms.WRITE] target_domid
 
-let is_backend_mmap con = match con.xb.Xenbus.Xb.backend with
-	| Xenbus.Xb.Xenmmap _ -> true
-	| _ -> false
+let is_backend_mmap con = Xenbus.Xb.is_mmap con.xb
 
 let send_reply con tid rid ty data =
 	if (String.length data) > xenstore_payload_max && (is_backend_mmap con) then
@@ -280,9 +278,7 @@ let get_transaction con tid =
 
 let do_input con = Xenbus.Xb.input con.xb
 let has_input con = Xenbus.Xb.has_in_packet con.xb
-let has_partial_input con = match con.xb.Xenbus.Xb.partial_in with
-	| HaveHdr _ -> true
-	| NoHdr (n, _) -> n < Xenbus.Partial.header_size ()
+let has_partial_input con = Xenbus.Xb.has_partial_input con.xb
 let pop_in con = Xenbus.Xb.get_in_packet con.xb
 let has_more_input con = Xenbus.Xb.has_more_input con.xb
 
-- 
2.34.1


