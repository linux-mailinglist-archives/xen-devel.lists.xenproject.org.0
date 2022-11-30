Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E963DB1C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450020.707160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMc-0002Uv-4W; Wed, 30 Nov 2022 16:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450020.707160; Wed, 30 Nov 2022 16:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QMb-0002Kg-VW; Wed, 30 Nov 2022 16:55:13 +0000
Received: by outflank-mailman (input) for mailman id 450020;
 Wed, 30 Nov 2022 16:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvFK=36=citrix.com=prvs=3260afb21=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0QMZ-0001h8-TM
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:55:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bffddb96-70cf-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 17:55:10 +0100 (CET)
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
X-Inumbo-ID: bffddb96-70cf-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669827310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=dD1YNLn+pJ3fr6aL1kBtVoehn7b49zfM4pfTGJrb8DE=;
  b=heBqp1BQSb8OnPyyurxJ0kIzfDRfUz7j2czMhN4ywcmQdozdkU6OMvqP
   3qPKp0KGfkl72LToYz8Jzo5FPeqyGHnOAutHtyIXWHjbCo04JLoUXPx25
   zEuucMzaSO1VXtrD//8zC9fGB5KV7KbKrFMmfnTogJhcyYTSYuzWlu25j
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85899597
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y0M+66lAKnZxRRQmg86dt07o5gyMJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWCzjSa/rcNzH3Lt9+aYq38xsCv5XcyYdmSwI+rHw8QiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5weGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 f4EGS8PSiibvuOzx761DbNco/59cMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zhvI9
 zObrjuR7hcyBtODkzu8zG6XvfaUsHrRRqYgNrGx+as/6LGU7jNKU0BHPbehmtG1g1Czc8hSI
 EsV/mwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9S26s6bWwlSuLOC0SIWFFPx8hd1VZ7Iy2yG0stS7nQtFmGa+zq9T6HzDs3
 jyHxBQDa6UvYd0jjPviow2e6964jt2QF1NuuF2LNo6wxlkhDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGeE6bKMN8N7n9hIx5JEVd443d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa+RIu5CK6JMIYSPPCdkTNrGgk0PSZ8OEi0wCARfVwXY
 8/HIa5A815FYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrUyDg5B
 v4Db6NmPT0DCryhCsQWmKZPRW03wY8TXMun8ZUIJrPbe2KL2ggJUpfs/F/oQKQ994w9qwsC1
 i3VtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:YlkT2KobVUVd3nNO11rWDYMaV5oZeYIsimQD101hICG9E/bo9f
 xG+c5x6faaslsssR0b9exoQZPwOU80lqQFgrX5X43CYOCOggLBRr2Ki7GM/9SKIU3DH4Bmu5
 uIPJIObOEYSWIK6/oT3WGDYrMdKObuytHQuQ/9p00dKj1XVw==
X-IronPort-AV: E=Sophos;i="5.96,207,1665460800"; 
   d="scan'208";a="85899597"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling to use port_pair
Date: Wed, 30 Nov 2022 16:54:54 +0000
Message-ID: <20221130165455.31125-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221130165455.31125-1-andrew.cooper3@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Inter-domain event channels are always a pair of local and remote ports.
Right now the handling is asymmetric, caused by the fact that the evtchn is
bound after the associated Domain object is constructed.

First, move binding of the event channel into the Domain.make() constructor.
This means the local port no longer needs to be an option.  It also removes
the final callers of Domain.bind_interdomain.

Next, introduce a new port_pair type to encapsulate the fact that these two
should be updated together, and replace the previous port and remote_port
fields.  This refactoring also changes the Domain.get_port interface (removing
an option) so take the opportunity to name it get_local_port instead.

Also, this fixes a use-after-free risk with Domain.close.  Once the evtchn has
been unbound, the same local port number can be reused for a different
purpose, so explicitly invalidate the ports to prevent their accidental misuse
in the future.

This also cleans up some of the debugging, to always print a port pair.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

v2:
 * New
---
 tools/ocaml/xenstored/connections.ml |  9 +----
 tools/ocaml/xenstored/domain.ml      | 75 ++++++++++++++++++------------------
 tools/ocaml/xenstored/domains.ml     |  2 -
 3 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index 7d68c583b43a..a80ae0bed2ce 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -48,9 +48,7 @@ let add_domain cons dom =
 	let xbcon = Xenbus.Xb.open_mmap ~capacity (Domain.get_interface dom) (fun () -> Domain.notify dom) in
 	let con = Connection.create xbcon (Some dom) in
 	Hashtbl.add cons.domains (Domain.get_id dom) con;
-	match Domain.get_port dom with
-	| Some p -> Hashtbl.add cons.ports p con;
-	| None -> ()
+	Hashtbl.add cons.ports (Domain.get_local_port dom) con
 
 let select ?(only_if = (fun _ -> true)) cons =
 	Hashtbl.fold (fun _ con (ins, outs) ->
@@ -97,10 +95,7 @@ let del_domain cons id =
 		let con = find_domain cons id in
 		Hashtbl.remove cons.domains id;
 		(match Connection.get_domain con with
-		 | Some d ->
-		   (match Domain.get_port d with
-		    | Some p -> Hashtbl.remove cons.ports p
-		    | None -> ())
+		 | Some d -> Hashtbl.remove cons.ports (Domain.get_local_port d)
 		 | None -> ());
 		del_watches cons con;
 		Connection.close con
diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index d59a9401e211..ecdd65f3209a 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -19,14 +19,31 @@ open Printf
 let debug fmt = Logging.debug "domain" fmt
 let warn  fmt = Logging.warn  "domain" fmt
 
+(* An event channel port pair.  The remote port, and the local port it is
+   bound to. *)
+type port_pair =
+{
+	local: Xeneventchn.t;
+	remote: int;
+}
+
+(* Sentinal port_pair with both set to EVTCHN_INVALID *)
+let invalid_ports =
+{
+	local = Xeneventchn.of_int 0;
+	remote = 0
+}
+
+let string_of_port_pair p =
+	sprintf "(l %d, r %d)" (Xeneventchn.to_int p.local) p.remote
+
 type t =
 {
 	id: Xenctrl.domid;
 	mfn: nativeint;
 	interface: Xenmmap.mmap_interface;
 	eventchn: Event.t;
-	mutable remote_port: int;
-	mutable port: Xeneventchn.t option;
+	mutable ports: port_pair;
 	mutable bad_client: bool;
 	mutable io_credit: int; (* the rounds of ring process left to do, default is 0,
 	                           usually set to 1 when there is work detected, could
@@ -41,8 +58,8 @@ let is_dom0 d = d.id = 0
 let get_id domain = domain.id
 let get_interface d = d.interface
 let get_mfn d = d.mfn
-let get_remote_port d = d.remote_port
-let get_port d = d.port
+let get_remote_port d = d.ports.remote
+let get_local_port d = d.ports.local
 
 let is_bad_domain domain = domain.bad_client
 let mark_as_bad domain = domain.bad_client <- true
@@ -56,54 +73,36 @@ let is_paused_for_conflict dom = dom.conflict_credit <= 0.0
 
 let is_free_to_conflict = is_dom0
 
-let string_of_port = function
-	| None -> "None"
-	| Some x -> string_of_int (Xeneventchn.to_int x)
-
 let dump d chan =
-	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
+	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.ports.remote
 
 let rebind_evtchn d remote_port =
-	begin match d.port with
-	| None -> ()
-	| Some p -> Event.unbind d.eventchn p
-	end;
+	Event.unbind d.eventchn d.ports.local;
 	let local = Event.bind_interdomain d.eventchn d.id remote_port in
-	debug "domain %d rebind (l %s, r %d) => (l %d, r %d)"
-	      d.id (string_of_port d.port) d.remote_port
-	      (Xeneventchn.to_int local) remote_port;
-	d.remote_port <- remote_port;
-	d.port <- Some (local)
+	let ports = { local; remote = remote_port } in
+	debug "domain %d rebind %s => %s"
+	      d.id (string_of_port_pair d.ports) (string_of_port_pair ports);
+	d.ports <- ports
 
 let notify dom =
-	match dom.port with
-	| None -> warn "domain %d: attempt to notify on unknown port" dom.id
-	| Some port -> Event.notify dom.eventchn port
-
-let bind_interdomain dom =
-	begin match dom.port with
-	| None -> ()
-	| Some port -> Event.unbind dom.eventchn port
-	end;
-	dom.port <- Some (Event.bind_interdomain dom.eventchn dom.id dom.remote_port);
-	debug "bound domain %d remote port %d to local port %s" dom.id dom.remote_port (string_of_port dom.port)
-
+	Event.notify dom.eventchn dom.ports.local
 
 let close dom =
-	debug "domain %d unbound port %s" dom.id (string_of_port dom.port);
-	begin match dom.port with
-	| None -> ()
-	| Some port -> Event.unbind dom.eventchn port
-	end;
+	debug "domain %d unbind %s" dom.id (string_of_port_pair dom.ports);
+	Event.unbind dom.eventchn dom.ports.local;
+	dom.ports <- invalid_ports;
 	Xenmmap.unmap dom.interface
 
-let make id mfn remote_port interface eventchn = {
+let make id mfn remote_port interface eventchn =
+	let local = Event.bind_interdomain eventchn id remote_port in
+	let ports = { local; remote = remote_port } in
+	debug "domain %d bind %s" id (string_of_port_pair ports);
+{
 	id = id;
 	mfn = mfn;
-	remote_port = remote_port;
+	ports;
 	interface = interface;
 	eventchn = eventchn;
-	port = None;
 	bad_client = false;
 	io_credit = 0;
 	conflict_credit = !Define.conflict_burst_limit;
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index 26018ac0dd3d..2ab0c5f4d8d0 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -126,7 +126,6 @@ let create doms domid mfn remote_port =
 	let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
 	let dom = Domain.make domid mfn remote_port interface doms.eventchn in
 	Hashtbl.add doms.table domid dom;
-	Domain.bind_interdomain dom;
 	dom
 
 let xenstored_kva = ref ""
@@ -144,7 +143,6 @@ let create0 doms =
 
 	let dom = Domain.make 0 Nativeint.zero remote_port interface doms.eventchn in
 	Hashtbl.add doms.table 0 dom;
-	Domain.bind_interdomain dom;
 	Domain.notify dom;
 	dom
 
-- 
2.11.0


