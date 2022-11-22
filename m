Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A67634002
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447224.703215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5B-0000V6-Da; Tue, 22 Nov 2022 15:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447224.703215; Tue, 22 Nov 2022 15:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5B-0000SG-8m; Tue, 22 Nov 2022 15:21:09 +0000
Received: by outflank-mailman (input) for mailman id 447224;
 Tue, 22 Nov 2022 15:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV59-0000Pt-OP
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46312c9c-6a79-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:21:04 +0100 (CET)
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
X-Inumbo-ID: 46312c9c-6a79-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qRpT/sJXRqdzl+PXZvGGiTY+yIv7oFMfzWqn89Zz508=;
  b=CyftZprALvnpFOmmnF704TeXelRtISqcHVQ5rryv8cQtuPS0dDBrTQHE
   jnp/agjxzN01v5mOcp/EG9EErPGqOaGZ3ejaWl7q8JlVjh233HCm+s6m3
   Iqb6tiFu0r3Pw3WMknrDOABDBgmeE8Dr0wHse/3V7RdqjYXHIQD7ungTV
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85360546
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mqhl76D7YM3BDxVW/3vjw5YqxClBgxIJ4kV8jS/XYbTApDIk1jcCy
 GUbCmjQbviNZWSke492Ptuy80IE6pGAxoUwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC5ARiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/NgsEGB8t
 tAjMC0iP0qmtfidwonmY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKFJ4fUHZgJwC50o
 Erh+GvBIRckF+eV8mC43SuHje6fniTkDdd6+LqQqacx3Qz7KnYoIBEfS1aTu/SyjU+6HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvvO2d+sY/WZUmF65jF9xaAIwMXFjIrMHpsoRQ+3zXznG0ipkuREIc7QPXs34yd9SLYm
 G7T8nVn71kHpYtSjvjgowia6965jsKRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1uvHbXKAn1NOv1j8tpyRWF6bOvdrF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGN6FsMucEMZiX0Msebhr5d7OxzncDd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUMxaIfvfb7l17ILHMQhkmD+DHsmilUzPPHj3TCf9dIrp+WCmNogRhJ5oai2Pm
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:KzUus6F2ub7Cup9ipLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQtrJ
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="85360546"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 5/8] tools/oxenstored: Keep /dev/xen/evtchn open across live update
Date: Tue, 22 Nov 2022 15:20:40 +0000
Message-ID: <20221122152043.8518-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Closing the evtchn handle will unbind and free all local ports.  The new
xenstored would need to rebind all evtchns, which is work that we don't want
or need to be doing during the critical handover period.

However, it turns out that the Windows PV drivers also rebind their local port
too across suspend/resume, leaving (o)xenstored with a stale idea of the
remote port to use.  In this case, reusing the established connection is the
only robust option.

Therefore:
 * Have oxenstored open /dev/xen/evtchn without CLOEXEC at start of day
 * Extend the handover information with the evtchn fd, and the local port
   number for each domain connection.
 * Have (the new) oxenstored recover the open handle using Xeneventchn.fdopen,
   and use the provided local ports rather than trying to rebind them.

When this new information isn't present (i.e. live updating from an oxenstored
prior to this change), the best-effort status quo will have to do.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Merge two patches to retain bisectability.  Drop changes to the evtchn bindings.
---
 tools/ocaml/xenstored/domain.ml    |  6 ++-
 tools/ocaml/xenstored/domains.ml   | 14 +++++--
 tools/ocaml/xenstored/event.ml     |  8 +++-
 tools/ocaml/xenstored/xenstored.ml | 82 ++++++++++++++++++++++++++------------
 4 files changed, 78 insertions(+), 32 deletions(-)

diff --git a/tools/ocaml/xenstored/domain.ml b/tools/ocaml/xenstored/domain.ml
index 81cb59b8f1a2..527035ffdd32 100644
--- a/tools/ocaml/xenstored/domain.ml
+++ b/tools/ocaml/xenstored/domain.ml
@@ -61,7 +61,7 @@ let string_of_port = function
 | Some x -> string_of_int (Xeneventchn.to_int x)
 
 let dump d chan =
-	fprintf chan "dom,%d,%nd,%d\n" d.id d.mfn d.remote_port
+	fprintf chan "dom,%d,%nd,%d,%s\n" d.id d.mfn d.remote_port (string_of_port d.port)
 
 let notify dom = match dom.port with
 | None ->
@@ -77,6 +77,10 @@ let bind_interdomain dom =
 	dom.port <- Some (Event.bind_interdomain dom.eventchn dom.id dom.remote_port);
 	debug "bound domain %d remote port %d to local port %s" dom.id dom.remote_port (string_of_port dom.port)
 
+let restore_interdomain dom localport =
+	assert (dom.port = None);
+	dom.port <- Some (Xeneventchn.of_int localport);
+	debug "restored interdomain %d remote port %d to local port %s" dom.id dom.remote_port (string_of_port dom.port)
 
 let close dom =
 	debug "domain %d unbound port %s" dom.id (string_of_port dom.port);
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index 17fe2fa25772..a91d2afd2a82 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -56,6 +56,7 @@ let exist doms id = Hashtbl.mem doms.table id
 let find doms id = Hashtbl.find doms.table id
 let number doms = Hashtbl.length doms.table
 let iter doms fct = Hashtbl.iter (fun _ b -> fct b) doms.table
+let eventchn doms = doms.eventchn
 
 let rec is_empty_queue q =
 	Queue.is_empty q ||
@@ -122,17 +123,22 @@ let cleanup doms =
 let resume _doms _domid =
 	()
 
-let create doms domid mfn port =
+let maybe_bind_interdomain restore_localport dom =
+	match restore_localport with
+	| None -> Domain.bind_interdomain dom
+	| Some p -> Domain.restore_interdomain dom p
+
+let create doms domid mfn ?restore_localport port =
 	let interface = Xenctrl.map_foreign_range xc domid (Xenmmap.getpagesize()) mfn in
 	let dom = Domain.make domid mfn port interface doms.eventchn in
 	Hashtbl.add doms.table domid dom;
-	Domain.bind_interdomain dom;
+	maybe_bind_interdomain restore_localport dom;
 	dom
 
 let xenstored_kva = ref ""
 let xenstored_port = ref ""
 
-let create0 doms =
+let create0 ?restore_localport doms =
 	let port, interface =
 		(
 			let port = Utils.read_file_single_integer !xenstored_port
@@ -146,7 +152,7 @@ let create0 doms =
 		in
 	let dom = Domain.make 0 Nativeint.zero port interface doms.eventchn in
 	Hashtbl.add doms.table 0 dom;
-	Domain.bind_interdomain dom;
+	maybe_bind_interdomain restore_localport dom;
 	Domain.notify dom;
 	dom
 
diff --git a/tools/ocaml/xenstored/event.ml b/tools/ocaml/xenstored/event.ml
index ccca90b6fc4f..0159daac91f4 100644
--- a/tools/ocaml/xenstored/event.ml
+++ b/tools/ocaml/xenstored/event.ml
@@ -20,7 +20,13 @@ type t = {
 	mutable virq_port: Xeneventchn.t option;
 }
 
-let init () = { handle = Xeneventchn.init (); virq_port = None; }
+let init ?fd () =
+	let handle = match fd with
+		| None -> Xeneventchn.init ~cloexec:false ()
+		| Some fd -> Xeneventchn.fdopen fd
+	in
+	{ handle; virq_port = None }
+
 let fd eventchn = Xeneventchn.fd eventchn.handle
 let bind_dom_exc_virq eventchn = eventchn.virq_port <- Some (Xeneventchn.bind_dom_exc_virq eventchn.handle)
 let bind_interdomain eventchn domid port = Xeneventchn.bind_interdomain eventchn.handle domid port
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index c5dc7a28d082..6ceab02dee1e 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -144,7 +144,7 @@ exception Bad_format of string
 
 let dump_format_header = "$xenstored-dump-format"
 
-let from_channel_f chan global_f socket_f domain_f watch_f store_f =
+let from_channel_f chan global_f event_f socket_f domain_f watch_f store_f =
 	let unhexify s = Utils.unhexify s in
 	let getpath s =
 		let u = Utils.unhexify s in
@@ -165,12 +165,17 @@ let from_channel_f chan global_f socket_f domain_f watch_f store_f =
 					(* there might be more parameters here,
 					   e.g. a RO socket from a previous version: ignore it *)
 					global_f ~rw
+				| "eventfd" :: eventfd :: [] ->
+					event_f ~eventfd
 				| "socket" :: fd :: [] ->
 					socket_f ~fd:(int_of_string fd)
-				| "dom" :: domid :: mfn :: port :: []->
+				| "dom" :: domid :: mfn :: port :: rest ->
 					domain_f (int_of_string domid)
 					         (Nativeint.of_string mfn)
 					         (int_of_string port)
+						 (match rest with
+						  | [] -> None (* backward compat: old version didn't have it *)
+						  | localport :: _ -> Some (int_of_string localport))
 				| "watch" :: domid :: path :: token :: [] ->
 					watch_f (int_of_string domid)
 					        (unhexify path) (unhexify token)
@@ -189,10 +194,27 @@ let from_channel_f chan global_f socket_f domain_f watch_f store_f =
 	done;
 	info "Completed loading xenstore dump"
 
-let from_channel store cons doms chan =
+let from_channel store cons createdoms chan =
 	(* don't let the permission get on our way, full perm ! *)
 	let op = Store.get_ops store Perms.Connection.full_rights in
 	let rwro = ref (None) in
+	let eventchnfd = ref (None) in
+	let doms = ref (None) in
+
+	let require_doms () =
+		match !doms with
+		| None ->
+			let missing_eventchnfd = !eventchnfd = None in
+			if missing_eventchnfd then
+				warn "No event channel file descriptor available in dump!";
+			let eventchn = Event.init ?fd:!eventchnfd () in
+			let domains = createdoms eventchn in
+			if missing_eventchnfd then
+				Event.bind_dom_exc_virq eventchn;
+			doms := Some domains;
+			domains
+		| Some d -> d
+	in
 	let global_f ~rw =
 		let get_listen_sock sockfd =
 			let fd = sockfd |> int_of_string |> Utils.FD.of_int in
@@ -201,6 +223,10 @@ let from_channel store cons doms chan =
 		in
 		rwro := get_listen_sock rw
 	in
+	let event_f ~eventfd =
+		let fd = eventfd |> int_of_string |> Utils.FD.of_int in
+		eventchnfd := Some fd
+	in
 	let socket_f ~fd =
 		let ufd = Utils.FD.of_int fd in
 		let is_valid = try (Unix.fstat ufd).Unix.st_kind = Unix.S_SOCK with _ -> false in
@@ -209,12 +235,13 @@ let from_channel store cons doms chan =
 		else
 			warn "Ignoring invalid socket FD %d" fd
 	in
-	let domain_f domid mfn port =
+	let domain_f domid mfn port restore_localport =
+		let doms = require_doms () in
 		let ndom =
 			if domid > 0 then
-				Domains.create doms domid mfn port
+				Domains.create doms domid mfn ?restore_localport port
 			else
-				Domains.create0 doms
+				Domains.create0 ?restore_localport doms
 			in
 		Connections.add_domain cons ndom;
 		in
@@ -229,8 +256,8 @@ let from_channel store cons doms chan =
 		op.Store.write path value;
 		op.Store.setperms path perms
 		in
-	from_channel_f chan global_f socket_f domain_f watch_f store_f;
-	!rwro
+	from_channel_f chan global_f event_f socket_f domain_f watch_f store_f;
+	!rwro, require_doms ()
 
 let from_file store cons doms file =
 	info "Loading xenstore dump from %s" file;
@@ -238,7 +265,7 @@ let from_file store cons doms file =
 	finally (fun () -> from_channel store doms cons channel)
 	        (fun () -> close_in channel)
 
-let to_channel store cons rw chan =
+let to_channel store cons (rw, eventchn) chan =
 	let hexify s = Utils.hexify s in
 
 	fprintf chan "%s\n" dump_format_header;
@@ -247,6 +274,7 @@ let to_channel store cons rw chan =
 		Unix.clear_close_on_exec fd;
 		Utils.FD.to_int fd in
 	fprintf chan "global,%d\n" (fdopt rw);
+	fprintf chan "eventchnfd,%d\n" (Utils.FD.to_int @@ Event.fd eventchn);
 
 	(* dump connections related to domains: domid, mfn, eventchn port/ sockets, and watches *)
 	Connections.iter cons (fun con -> Connection.dump con chan);
@@ -367,7 +395,6 @@ let _ =
 	| None         -> () end;
 
 	let store = Store.create () in
-	let eventchn = Event.init () in
 	let next_frequent_ops = ref 0. in
 	let advance_next_frequent_ops () =
 		next_frequent_ops := (Unix.gettimeofday () +. !Define.conflict_max_history_seconds)
@@ -375,16 +402,8 @@ let _ =
 	let delay_next_frequent_ops_by duration =
 		next_frequent_ops := !next_frequent_ops +. duration
 	in
-	let domains = Domains.init eventchn advance_next_frequent_ops in
+	let domains eventchn = Domains.init eventchn advance_next_frequent_ops in
 
-	(* For things that need to be done periodically but more often
-	 * than the periodic_ops function *)
-	let frequent_ops () =
-		if Unix.gettimeofday () > !next_frequent_ops then (
-			History.trim ();
-			Domains.incr_conflict_credit domains;
-			advance_next_frequent_ops ()
-		) in
 	let cons = Connections.create () in
 
 	let quit = ref false in
@@ -393,15 +412,15 @@ let _ =
 	List.iter (fun path ->
 		Store.write store Perms.Connection.full_rights path "") Store.Path.specials;
 
-	let rw_sock =
+	let rw_sock, domains =
 	if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
-		let rwro = DB.from_file store domains cons Disk.xs_daemon_database in
+		let rw, domains = DB.from_file store domains cons Disk.xs_daemon_database in
 		info "Live reload: database loaded";
-		Event.bind_dom_exc_virq eventchn;
 		Process.LiveUpdate.completed ();
-		rwro
+		rw, domains
 	) else (
 		info "No live reload: regular startup";
+		let domains = domains @@ Event.init () in
 		if !Disk.enable then (
 			info "reading store from disk";
 			Disk.read store
@@ -411,13 +430,23 @@ let _ =
 		if not (Store.path_exists store localpath) then
 			Store.mkdir store (Perms.Connection.create 0) localpath;
 
+		let eventchn = Event.init () in
 		if cf.domain_init then (
 			Connections.add_domain cons (Domains.create0 domains);
 			Event.bind_dom_exc_virq eventchn
 		);
-		rw_sock
+		rw_sock, domains
 	) in
 
+	(* For things that need to be done periodically but more often
+	 * than the periodic_ops function *)
+	let frequent_ops () =
+		if Unix.gettimeofday () > !next_frequent_ops then (
+			History.trim ();
+			Domains.incr_conflict_credit domains;
+			advance_next_frequent_ops ()
+		) in
+
 	(* required for xenstore-control to detect availability of live-update *)
 	let tool_path = Store.Path.of_string "/tool" in
 	if not (Store.path_exists store tool_path) then
@@ -433,10 +462,11 @@ let _ =
 	Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
 	if cf.activate_access_log then begin
-		let post_rotate () = DB.to_file store cons (None) Disk.xs_daemon_database in
+		let post_rotate () = DB.to_file store cons (None, Domains.eventchn domains) Disk.xs_daemon_database in
 		Logging.init_access_log post_rotate
 	end;
 
+	let eventchn = Domains.eventchn domains in
 	let spec_fds =
 		(match rw_sock with None -> [] | Some x -> [ x ]) @
 		(if cf.domain_init then [ Event.fd eventchn ] else [])
@@ -595,7 +625,7 @@ let _ =
 			live_update := Process.LiveUpdate.should_run cons;
 			if !live_update || !quit then begin
 				(* don't initiate live update if saving state fails *)
-				DB.to_file store cons (rw_sock) Disk.xs_daemon_database;
+				DB.to_file store cons (rw_sock, eventchn) Disk.xs_daemon_database;
 				quit := true;
 			end
 		with exc ->
-- 
2.11.0


