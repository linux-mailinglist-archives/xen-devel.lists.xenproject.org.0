Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8021C2F8904
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:59:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68784.123287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3b-0003RR-D5; Fri, 15 Jan 2021 22:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68784.123287; Fri, 15 Jan 2021 22:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Y3b-0003Q2-4d; Fri, 15 Jan 2021 22:59:03 +0000
Received: by outflank-mailman (input) for mailman id 68784;
 Fri, 15 Jan 2021 22:59:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xyb-0001Wj-20
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:53:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f837a99d-1af1-4c1c-824d-9255f0634186;
 Fri, 15 Jan 2021 22:52:44 +0000 (UTC)
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
X-Inumbo-ID: f837a99d-1af1-4c1c-824d-9255f0634186
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ebh7/z6kphJEF6Rxb6nhmacurC8cMZYuwIblENECTxE=;
  b=HX1tPbTGN6I3xHzCspGXnEklPWoBBEfLzpMdFWA0fPPc/aizW3hs8KjK
   8RDTLwNHHOwj0e8kFWipA2O1RI6d2dIQpeKfvEJm7YJqAOTs9dZWPj+sI
   7zJYeQXXMZVK5aVWdV33JWQonM50avau3n8XUBtM2sPuiG5mmEXQP6sSg
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ibHTxdOY10XEerFTAmHhhTKCDnAU/J5U4ykkAT7G1ZY/lwi+3HCbrMkFW9GkFslX2WHb7qNtsP
 IfErVuBdk3msIjTdzmpgrUltAr64mWnFQDvbvgF/L6C7K1egWRQE7iDwW3RTtkcHcYeOD5LR6X
 cRl6RRMH5EIM0ZFdpv2X0PrKDSw214iyu1/AOMX0lDPRAEmeJk1KiwVBhBmymCBfSJQvNIuOna
 c26aNuz/oxLAKRYRwKBuuZJ353DuVKpyiusj1oPh3UZFOdAr5bIuvTspxEB2A7BKHueJjPTEaZ
 g2s=
X-SBRS: 5.1
X-MesageID: 35206335
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35206335"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Edvin Torok <edvint@eddie2.eng.citrite.net>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Pau Ruiz Safont
	<pau.safont@citrix.com>
Subject: [PATCH v2 8/8] tools/ocaml/xenstored: Implement live update for socket connections
Date: Fri, 15 Jan 2021 22:28:50 +0000
Message-ID: <07cb0ca9b2d48c74bc499cd92d61ac9313bbbbf0.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edvin Torok <edvint@eddie2.eng.citrite.net>

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
Reviewed-by: Christian Lindig <christian.lindig@citrix.com>

---
Changed since V1
* post publicly now that the XSA is out
---
 tools/ocaml/xenstored/connection.ml | 25 +++++---
 tools/ocaml/xenstored/parse_arg.ml  |  4 ++
 tools/ocaml/xenstored/process.ml    | 51 ++++++++++++-----
 tools/ocaml/xenstored/store.ml      |  2 +-
 tools/ocaml/xenstored/utils.ml      | 12 ++++
 tools/ocaml/xenstored/xenstored.ml  | 88 +++++++++++++++++++++--------
 6 files changed, 138 insertions(+), 44 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index bd02060cd0..eb23c3af7a 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -281,6 +281,9 @@ let get_transaction con tid =
 
 let do_input con = Xenbus.Xb.input con.xb
 let has_input con = Xenbus.Xb.has_in_packet con.xb
+let has_partial_input con = match con.xb.Xenbus.Xb.partial_in with
+	| HaveHdr _ -> true
+	| NoHdr (n, _) -> n < Xenbus.Partial.header_size ()
 let pop_in con = Xenbus.Xb.get_in_packet con.xb
 let has_more_input con = Xenbus.Xb.has_more_input con.xb
 
@@ -309,12 +312,13 @@ let is_bad con = match con.dom with None -> false | Some dom -> Domain.is_bad_do
    Restrictions below can be relaxed once xenstored learns to dump more
    of its live state in a safe way *)
 let has_extra_connection_data con =
-	let has_in = has_input con in
+	let has_in = has_input con || has_partial_input con in
 	let has_out = has_output con in
 	let has_socket = con.dom = None in
 	let has_nondefault_perms = make_perm con.dom <> con.perm in
 	has_in || has_out
-	|| has_socket (* dom0 sockets not dumped yet *)
+	(* TODO: what about SIGTERM, should use systemd to store FDS
+	 || has_socket (* dom0 sockets not * dumped yet *) *)
 	|| has_nondefault_perms (* set_target not dumped yet *)
 
 let has_transaction_data con =
@@ -337,16 +341,21 @@ let stats con =
 	Hashtbl.length con.watches, con.stat_nb_ops
 
 let dump con chan =
-	match con.dom with
+	let id = match con.dom with
 	| Some dom ->
 		let domid = Domain.get_id dom in
 		(* dump domain *)
 		Domain.dump dom chan;
-		(* dump watches *)
-		List.iter (fun (path, token) ->
-			Printf.fprintf chan "watch,%d,%s,%s\n" domid (Utils.hexify path) (Utils.hexify token)
-			) (list_watches con);
-	| None -> ()
+		domid
+	| None ->
+		let fd = con |> get_fd |> Utils.FD.to_int in
+		Printf.fprintf chan "socket,%d\n" fd;
+		-fd
+	in
+	(* dump watches *)
+	List.iter (fun (path, token) ->
+		Printf.fprintf chan "watch,%d,%s,%s\n" id (Utils.hexify path) (Utils.hexify token)
+		) (list_watches con)
 
 let debug con =
 	let domid = get_domstr con in
diff --git a/tools/ocaml/xenstored/parse_arg.ml b/tools/ocaml/xenstored/parse_arg.ml
index 2c4b5a8528..7c0478e76a 100644
--- a/tools/ocaml/xenstored/parse_arg.ml
+++ b/tools/ocaml/xenstored/parse_arg.ml
@@ -24,6 +24,7 @@ type config =
 	pidfile: string option; (* old xenstored compatibility *)
 	tracefile: string option; (* old xenstored compatibility *)
 	restart: bool;
+	live_reload: bool;
 	disable_socket: bool;
 }
 
@@ -35,6 +36,7 @@ let do_argv =
 	and reraise_top_level = ref false
 	and config_file = ref ""
 	and restart = ref false
+	and live_reload = ref false
 	and disable_socket = ref false
 	in
 
@@ -52,6 +54,7 @@ let do_argv =
 		  ("--pid-file", Arg.Set_string pidfile, ""); (* for compatibility *)
 		  ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
 		  ("--restart", Arg.Set restart, "Read database on starting");
+		  ("--live", Arg.Set live_reload, "Read live dump on startup");
 		  ("--disable-socket", Arg.Unit (fun () -> disable_socket := true), "Disable socket");
 		] in
 	let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket]" in
@@ -65,5 +68,6 @@ let do_argv =
 		pidfile = if !pidfile <> "" then Some !pidfile else None;
 		tracefile = if !tracefile <> "" then Some !tracefile else None;
 		restart = !restart;
+		live_reload = !live_reload;
 		disable_socket = !disable_socket;
 	}
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 3174d8ede5..dd50456ad5 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -91,19 +91,24 @@ type t =
 		; cmdline: string list
 		; deadline: float
 	; force: bool
+	; result: string list
 	; pending: bool }
 
 let state =
 	ref
 		{ binary= Sys.executable_name
-		; cmdline= []
+		; cmdline= (Sys.argv |> Array.to_list |> List.tl)
 		; deadline= 0.
 		; force= false
+		; result = []
 		; pending= false }
 
 let debug = Printf.eprintf
 
-let args_of_t t = (t.binary, "--restart" :: t.cmdline)
+let forced_args = ["--live"; "--restart"]
+let args_of_t t =
+	let filtered = List.filter (fun x -> not @@ List.mem x forced_args) t.cmdline in
+	(t.binary, forced_args @ filtered)
 
 let string_of_t t =
 	let executable, rest = args_of_t t in
@@ -117,12 +122,12 @@ let launch_exn t =
 
 let validate_exn t =
 	(* --help must be last to check validity of earlier arguments *)
-	let t = {t with cmdline= t.cmdline @ ["--help"]} in
-	let cmd = string_of_t t in
+	let t' = {t with cmdline= t.cmdline @ ["--help"]} in
+	let cmd = string_of_t t' in
 	debug "Executing %s" cmd ;
 	match Unix.fork () with
 	| 0 ->
-		 ( try launch_exn t with _ -> exit 2 )
+		 ( try launch_exn t' with _ -> exit 2 )
 	| pid -> (
 	match Unix.waitpid [] pid with
 		| _, Unix.WEXITED 0 ->
@@ -146,10 +151,14 @@ let parse_live_update args =
 			validate_exn {!state with binary= file}
 		| ["-a"] ->
 			debug "Live update aborted" ;
-			{!state with pending= false}
+			{!state with pending= false; result = []}
 		| "-c" :: cmdline ->
-			validate_exn {!state with cmdline}
+			validate_exn {!state with cmdline = !state.cmdline @ cmdline}
 		| "-s" :: _ ->
+			(match !state.pending, !state.result with
+			| true, _ -> !state (* no change to state, avoid resetting timeout *)
+			| false, _ :: _ -> !state (* we got a pending result to deliver *)
+			| false, [] ->
 			let timeout = ref 60 in
 			let force = ref false in
 			Arg.parse_argv ~current:(ref 0) (Array.of_list args)
@@ -165,10 +174,16 @@ let parse_live_update args =
 			"live-update -s" ;
 			debug "Live update process queued" ;
 				{!state with deadline = Unix.gettimeofday () +. float !timeout
-				; force= !force; pending= true}
+				; force= !force; pending= true})
 		| _ ->
 			invalid_arg ("Unknown arguments: " ^ String.concat "," args)) ;
-	None
+		match !state.pending, !state.result with
+		| true, _ -> Some "BUSY"
+		| false, (_ :: _ as result) ->
+				(* xenstore-control has read the result, clear it *)
+				state := { !state with result = [] };
+				Some (String.concat "\n" result)
+		| false, [] -> None
 	with
 	| Arg.Bad s | Arg.Help s | Invalid_argument s ->
 		Some s
@@ -182,17 +197,27 @@ let parse_live_update args =
 			| [] -> true
 			| _ when Unix.gettimeofday () < t.deadline -> false
 			| l ->
-				 info "Live update timeout reached: %d active connections" (List.length l);
-				 List.iter (fun con -> warn "%s prevents live update" (Connection.get_domstr con)) l;
+				 warn "timeout reached: have to wait, migrate or shutdown %d domains:" (List.length l);
+				 let msgs = List.rev_map (fun con -> Printf.sprintf "%s: %d tx, in: %b, out: %b, perm: %s"
+					 (Connection.get_domstr con)
+					 (Connection.number_of_transactions con)
+					 (Connection.has_input con)
+					 (Connection.has_output con)
+					 (Connection.get_perm con |> Perms.Connection.to_string)
+					) l in
+				 List.iter (warn "Live-update: %s") msgs;
 				 if t.force then begin
 					 warn "Live update forced, some domain connections may break!";
 					 true
 				 end else begin
-					 warn "Live update aborted, try migrating or shutting down the domains/toolstack";
-					 state := { t with pending = false };
+					 warn "Live update aborted (see above for domains preventing it)";
+					 state := { t with pending = false; result = msgs};
 					 false
 				end
 		end else false
+
+	let completed () =
+		state := { !state with result = ["OK"] }
 end
 
 (* packets *)
diff --git a/tools/ocaml/xenstored/store.ml b/tools/ocaml/xenstored/store.ml
index e20767372f..a3be2e6bbe 100644
--- a/tools/ocaml/xenstored/store.ml
+++ b/tools/ocaml/xenstored/store.ml
@@ -366,7 +366,7 @@ let traversal root_node f =
 	let rec _traversal path node =
 		f path node;
 		let node_path = Path.of_path_and_name path (Symbol.to_string node.Node.name) in
-		List.iter (_traversal node_path) node.Node.children
+		List.iter (_traversal node_path) (List.rev node.Node.children)
 		in
 	_traversal [] root_node
 
diff --git a/tools/ocaml/xenstored/utils.ml b/tools/ocaml/xenstored/utils.ml
index eb79bf0146..6c1603c276 100644
--- a/tools/ocaml/xenstored/utils.ml
+++ b/tools/ocaml/xenstored/utils.ml
@@ -115,3 +115,15 @@ let path_validate path connection_path =
 	if len > !Define.path_max then raise Define.Invalid_path;
 
 	abs_path
+
+module FD : sig
+     type t = Unix.file_descr
+     val of_int: int -> t
+     val to_int : t -> int
+end = struct
+    type t = Unix.file_descr
+    (* This is like Obj.magic but just for these types,
+       and relies on Unix.file_descr = int *)
+    external to_int : t -> int = "%identity"
+    external of_int : int -> t = "%identity"
+end
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 22413271fb..5893af2caa 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -141,9 +141,12 @@ exception Bad_format of string
 
 let dump_format_header = "$xenstored-dump-format"
 
-let from_channel_f chan domain_f watch_f store_f =
+let from_channel_f chan global_f socket_f domain_f watch_f store_f =
 	let unhexify s = Utils.unhexify s in
-	let getpath s = Store.Path.of_string (Utils.unhexify s) in
+	let getpath s =
+		let u = Utils.unhexify s in
+		debug "Path: %s" u;
+		Store.Path.of_string u in
 	let header = input_line chan in
 	if header <> dump_format_header then
 		raise (Bad_format "header");
@@ -155,6 +158,12 @@ let from_channel_f chan domain_f watch_f store_f =
 			let l = String.split ',' line in
 			try
 				match l with
+				| "global" :: rw :: _ ->
+					(* there might be more parameters here,
+						e.g. a RO socket from a previous version: ignore it *)
+					global_f ~rw
+				| "socket" :: fd :: [] ->
+					socket_f ~fd:(int_of_string fd)
 				| "dom" :: domid :: mfn :: port :: []->
 					domain_f (int_of_string domid)
 					         (Nativeint.of_string mfn)
@@ -175,12 +184,28 @@ let from_channel_f chan domain_f watch_f store_f =
 		with End_of_file ->
 			quit := true
 	done;
-	()
+	info "Completed loading xenstore dump"
 
 let from_channel store cons doms chan =
 	(* don't let the permission get on our way, full perm ! *)
 	let op = Store.get_ops store Perms.Connection.full_rights in
-
+	let rwro = ref (None) in
+	let global_f ~rw =
+		let get_listen_sock sockfd =
+			let fd = sockfd |> int_of_string |> Utils.FD.of_int in
+			Unix.listen fd 1;
+			Some fd
+		in
+		rwro := get_listen_sock rw
+	in
+	let socket_f ~fd =
+		let ufd = Utils.FD.of_int fd in
+		let is_valid = try (Unix.fstat ufd).Unix.st_kind = Unix.S_SOCK with _ -> false in
+		if is_valid then
+			Connections.add_anonymous cons ufd
+		else
+			warn "Ignoring invalid socket FD %d" fd
+	in
 	let domain_f domid mfn port =
 		let ndom =
 			if domid > 0 then
@@ -190,28 +215,38 @@ let from_channel store cons doms chan =
 			in
 		Connections.add_domain cons ndom;
 		in
-	let watch_f domid path token =
-		let con = Connections.find_domain cons domid in
-		ignore (Connections.add_watch cons con path token)
+	let get_con id =
+		if id < 0 then Connections.find cons (Utils.FD.of_int (-id))
+		else Connections.find_domain cons id
+	in
+	let watch_f id path token =
+		ignore (Connections.add_watch cons (get_con id) path token)
 		in
 	let store_f path perms value =
 		op.Store.write path value;
 		op.Store.setperms path perms
 		in
-	from_channel_f chan domain_f watch_f store_f
+	from_channel_f chan global_f socket_f domain_f watch_f store_f;
+	!rwro
 
 let from_file store cons doms file =
+	info "Loading xenstore dump from %s" file;
 	let channel = open_in file in
 	finally (fun () -> from_channel store doms cons channel)
 	        (fun () -> close_in channel)
 
-let to_channel store cons chan =
+let to_channel store cons rw chan =
 	let hexify s = Utils.hexify s in
 
 	fprintf chan "%s\n" dump_format_header;
+	let fdopt = function None -> -1 | Some fd ->
+		(* systemd and utils.ml sets it close on exec *)
+		Unix.clear_close_on_exec fd;
+		Utils.FD.to_int fd in
+	fprintf chan "global,%d\n" (fdopt rw);
 
-	(* dump connections related to domains; domid, mfn, eventchn port, watches *)
-	Connections.iter_domains cons (fun con -> Connection.dump con chan);
+	(* dump connections related to domains: domid, mfn, eventchn port/ sockets, and watches *)
+	Connections.iter cons (fun con -> Connection.dump con chan);
 
 	(* dump the store *)
 	Store.dump_fct store (fun path node ->
@@ -224,9 +259,9 @@ let to_channel store cons chan =
 	()
 
 
-let to_file store cons file =
+let to_file store cons fds file =
 	let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ] 0o600 file in
-	finally (fun () -> to_channel store cons channel)
+	finally (fun () -> to_channel store cons fds channel)
 	        (fun () -> close_out channel)
 end
 
@@ -246,13 +281,13 @@ let _ =
 	);
 
 	let rw_sock =
-		if cf.disable_socket then
+		if cf.disable_socket || cf.live_reload then
 			None
 		else
 			Some (Unix.handle_unix_error Utils.create_unix_socket Define.xs_daemon_socket)
 		in
 
-	if cf.daemonize then
+	if cf.daemonize && not cf.live_reload then
 		Unixext.daemonize ()
 	else
 		printf "Xen Storage Daemon, version %d.%d\n%!"
@@ -292,10 +327,15 @@ let _ =
 	List.iter (fun path ->
 		Store.write store Perms.Connection.full_rights path "") Store.Path.specials;
 
+	let rw_sock =
 	if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
-		DB.from_file store domains cons Disk.xs_daemon_database;
-		Event.bind_dom_exc_virq eventchn
-	) else (
+		let rwro = DB.from_file store domains cons Disk.xs_daemon_database in
+		info "Live reload: database loaded";
+		Event.bind_dom_exc_virq eventchn;
+		Process.LiveUpdate.completed ();
+		rwro
+ 	) else (
+		info "No live reload: regular startup";
 		if !Disk.enable then (
 			info "reading store from disk";
 			Disk.read store
@@ -309,10 +349,13 @@ let _ =
 			Connections.add_domain cons (Domains.create0 domains);
 			Event.bind_dom_exc_virq eventchn
 		);
-	);
+		rw_sock
+	) in
 
 	(* required for xenstore-control to detect availability of live-update *)
-	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string "/tool");
+	let toolpath = Store.Path.of_string "/tool" in
+	if not (Store.path_exists store toolpath) then
+		Store.mkdir store Perms.Connection.full_rights toolpath;
 	Store.write store Perms.Connection.full_rights
 		(Store.Path.of_string "/tool/xenstored") Sys.executable_name;
 
@@ -324,7 +367,7 @@ let _ =
 	Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
 	if cf.activate_access_log then begin
-		let post_rotate () = DB.to_file store cons Disk.xs_daemon_database in
+		let post_rotate () = DB.to_file store cons (None) Disk.xs_daemon_database in
 		Logging.init_access_log post_rotate
 	end;
 
@@ -367,6 +410,7 @@ let _ =
 	let ring_scan_checker dom =
 		(* no need to scan domains already marked as for processing *)
 		if not (Domain.get_io_credit dom > 0) then
+			debug "Looking up domid %d" (Domain.get_id dom);
 			let con = Connections.find_domain cons (Domain.get_id dom) in
 			if not (Connection.has_more_work con) then (
 				Process.do_output store cons domains con;
@@ -496,7 +540,7 @@ let _ =
 			live_update := Process.LiveUpdate.should_run cons;
 			if !live_update || !quit then begin
 				(* don't initiate live update if saving state fails *)
-				DB.to_file store cons Disk.xs_daemon_database;
+				DB.to_file store cons (rw_sock) Disk.xs_daemon_database;
 				quit := true;
 			end
 		with exc ->
-- 
2.29.2


