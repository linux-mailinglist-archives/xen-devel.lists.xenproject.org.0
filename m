Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DA63DB1D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450017.707138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMX-0001yZ-UR; Wed, 30 Nov 2022 16:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450017.707138; Wed, 30 Nov 2022 16:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMX-0001wa-Qi; Wed, 30 Nov 2022 16:55:09 +0000
Received: by outflank-mailman (input) for mailman id 450017;
 Wed, 30 Nov 2022 16:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0QMW-0001h8-Gm
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:55:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd83c3e6-70cf-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 17:55:07 +0100 (CET)
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
X-Inumbo-ID: bd83c3e6-70cf-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669827307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mzelpp6BGU6o/XUMBaOnSaYdaYXaC5D7r7SG8hFEgRM=;
  b=iP9CtfXsTZQCMSs5Jf87J60B6MgimTwM3YnkRyHTVQnhHKfKEGTgqG1I
   z0UzQRlx0ulMt6XN2rlfdlpynf6FTzCPVSg1f30CAUih1B0WJHHlMRbpe
   1Q9qrT1rR3f1q2mMgwwmQV/rKyTF2m0eYzPfYmTrGodCuxgGiwGsyn388
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86305928
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QoajPqIRyYI7XtnQFE+R3JUlxSXFcZb7ZxGr2PjKsXjdYENS1WMEz
 2IfXT+Eb//fajH8fd5/Ot61pk0GvcDRyoJrHFNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wdmPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5+GVlq3
 MQEOAorQQGoieWLnIuASLNz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUozUHp0IzxzIz
 o7A11rgLj8gFJuO8CrG1W+Bp+LAp3nRdKtHQdVU8dY12QbOlwT/EiY+WVKlrNGjh0W5WtYZL
 FYbkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTV3iJm8cW6NzJG7vBi8PhVJFFQAPzBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pnzv55p0xWG2zaD+qXNEBzzk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvVZV1kfa+SIq5Cq68gj9yjn5ZLlfvEMZGPB744owQuBJ0zfFX1
 WmzLq5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FZqX1bMEe1tGALXPogEAFas/F29H
 yB3a5HblH2ykYTWPkHqzGLkBQlRfCJiWsCr85U/myzqClMOJVzNwsT5mdsJE7GJVYwP/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:3f9LKqgEOMqhZWJZVPiYILU51XBQXusji2hC6mlwRA09TyXBrb
 HLoB1p726StN9xYgBZpTnuAsm9qB/nmKKdpLNhWItKPzOWw1dATrsSjrcKqgeIc0aVygce79
 YDT0EUMrLN5C1B7PoSlzPXLz9P+rW6GeuT9IHjJj9WPHhXV50=
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="86305928"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH v2 3/6] tools/oxenstored: Rename some 'port' variables to 'remote_port'
Date: Wed, 30 Nov 2022 16:54:52 +0000
Message-ID: <20221130165455.31125-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221130165455.31125-1-andrew.cooper3@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This will make the logic clearer when we plumb local_port through these
functions.

While changing this, simplify the construct in Domains.create0 to separate the
remote port handling from the interface.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

v2:
 * New.
---
 tools/ocaml/xenstored/domains.ml   | 26 ++++++++++++--------------
 tools/ocaml/xenstored/process.ml   | 12 ++++++------
 tools/ocaml/xenstored/xenstored.ml |  8 ++++----
 3 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index 17fe2fa25772..26018ac0dd3d 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -122,9 +122,9 @@ let cleanup doms =
 let resume _doms _domid =
 	()
 
-let create doms domid mfn port =
+let create doms domid mfn remote_port =
 	let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
-	let dom = Domain.make domid mfn port interface doms.eventchn in
+	let dom = Domain.make domid mfn remote_port interface doms.eventchn in
 	Hashtbl.add doms.table domid dom;
 	Domain.bind_interdomain dom;
 	dom
@@ -133,18 +133,16 @@ let xenstored_kva = ref ""
 let xenstored_port = ref ""
 
 let create0 doms =
-	let port, interface =
-		(
-			let port = Utils.read_file_single_integer !xenstored_port
-			and fd = Unix.openfile !xenstored_kva
-					       [ Unix.O_RDWR ] 0o600 in
-			let interface = Xenmmap.mmap fd Xenmmap.RDWR Xenmmap.SHARED
-						  (Xenmmap.getpagesize()) 0 in
-			Unix.close fd;
-			port, interface
-		)
-		in
-	let dom = Domain.make 0 Nativeint.zero port interface doms.eventchn in
+	let remote_port = Utils.read_file_single_integer !xenstored_port in
+
+	let interface =
+		let fd = Unix.openfile !xenstored_kva [ Unix.O_RDWR ] 0o600 in
+		let interface = Xenmmap.mmap fd Xenmmap.RDWR Xenmmap.SHARED (Xenmmap.getpagesize()) 0 in
+		Unix.close fd;
+		interface
+	in
+
+	let dom = Domain.make 0 Nativeint.zero remote_port interface doms.eventchn in
 	Hashtbl.add doms.table 0 dom;
 	Domain.bind_interdomain dom;
 	Domain.notify dom;
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 72a79e9328dd..b2973aca2a82 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -558,10 +558,10 @@ let do_transaction_end con t domains cons data =
 let do_introduce con t domains cons data =
 	if not (Connection.is_dom0 con)
 	then raise Define.Permission_denied;
-	let (domid, mfn, port) =
+	let (domid, mfn, remote_port) =
 		match (split None '\000' data) with
-		| domid :: mfn :: port :: _ ->
-			int_of_string domid, Nativeint.of_string mfn, int_of_string port
+		| domid :: mfn :: remote_port :: _ ->
+			int_of_string domid, Nativeint.of_string mfn, int_of_string remote_port
 		| _                         -> raise Invalid_Cmd_Args;
 		in
 	let dom =
@@ -569,18 +569,18 @@ let do_introduce con t domains cons data =
 			let edom = Domains.find domains domid in
 			if (Domain.get_mfn edom) = mfn && (Connections.find_domain cons domid) != con then begin
 				(* Use XS_INTRODUCE for recreating the xenbus event-channel. *)
-				edom.remote_port <- port;
+				edom.remote_port <- remote_port;
 				Domain.bind_interdomain edom;
 			end;
 			edom
 		else try
-			let ndom = Domains.create domains domid mfn port in
+			let ndom = Domains.create domains domid mfn remote_port in
 			Connections.add_domain cons ndom;
 			Connections.fire_spec_watches (Transaction.get_root t) cons Store.Path.introduce_domain;
 			ndom
 		with _ -> raise Invalid_Cmd_Args
 	in
-	if (Domain.get_remote_port dom) <> port || (Domain.get_mfn dom) <> mfn then
+	if (Domain.get_remote_port dom) <> remote_port || (Domain.get_mfn dom) <> mfn then
 		raise Domain_not_match
 
 let do_release con t domains cons data =
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 55071b49eccb..1f11f576b515 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -167,10 +167,10 @@ let from_channel_f chan global_f socket_f domain_f watch_f store_f =
 					global_f ~rw
 				| "socket" :: fd :: [] ->
 					socket_f ~fd:(int_of_string fd)
-				| "dom" :: domid :: mfn :: port :: []->
+				| "dom" :: domid :: mfn :: remote_port :: []->
 					domain_f (int_of_string domid)
 					         (Nativeint.of_string mfn)
-					         (int_of_string port)
+					         (int_of_string remote_port)
 				| "watch" :: domid :: path :: token :: [] ->
 					watch_f (int_of_string domid)
 					        (unhexify path) (unhexify token)
@@ -209,10 +209,10 @@ let from_channel store cons doms chan =
 		else
 			warn "Ignoring invalid socket FD %d" fd
 	in
-	let domain_f domid mfn port =
+	let domain_f domid mfn remote_port =
 		let ndom =
 			if domid > 0 then
-				Domains.create doms domid mfn port
+				Domains.create doms domid mfn remote_port
 			else
 				Domains.create0 doms
 			in
-- 
2.11.0


