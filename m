Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBC37ADD1
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125903.237040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmp-0002Y4-5T; Tue, 11 May 2021 18:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125903.237040; Tue, 11 May 2021 18:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmo-0002Sg-Uq; Tue, 11 May 2021 18:07:14 +0000
Received: by outflank-mailman (input) for mailman id 125903;
 Tue, 11 May 2021 18:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmn-0000hb-QA
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:07:13 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26ebaf9d-3570-4e7d-92e8-e3ca2c9b182f;
 Tue, 11 May 2021 18:07:00 +0000 (UTC)
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
X-Inumbo-ID: 26ebaf9d-3570-4e7d-92e8-e3ca2c9b182f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=leCiJnwy6SsPHaP/NXfEhVjwwDD8mhaCyeX0SGCr7Vg=;
  b=bgXd0rvqL6y/C8IoIylLZc1P2NhbaAJ5Rz8DU9ETNX5V8i4v4kx2Ruic
   +Cm4f+r70GetafWRv8eMX4gua91Or3hKHir8TgmrbsGnN6kmQIO+khstR
   aSykWASmueZtVx1Rpbndc2B1FNL2w/+JdH2KclLYDJH1ZvNGPtaW/O/H8
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZzyOP/FQWeaVFS2+bnyM/30umDnoi1SJO3xpblwGzLyuHQW+Ojbj6/KwFP8dNHU7TuxYME0yzK
 9CYxYQnXlRCoGfvf4S31CzNXZKQp0nDcLJ/0WHEuCYnSgzOY1KJRJ2Rg/pgJHrr4Z7IMLUMnS2
 OKH3xeUB2tULtoTr0ry1j+fHJJ4x4vNDmZaPIa4UuMuwKxf3rqIYyHRi9hkHdJv8edy2NNbkG8
 OKlwsV8Hr56BGTTv3fLLzl7G41pW03FlyLsmxoVWCLhzRFSqJaglOy0i9DU9JYnIjscvduaoS7
 +jY=
X-SBRS: 5.1
X-MesageID: 43954245
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Y69OrKo8o7U7lY6P+EqWbLcaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="43954245"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 06/17] tools/ocaml/xenstored: add support for binary format
Date: Tue, 11 May 2021 19:05:19 +0100
Message-ID: <b79ae21f3b906ebc9a3f94e1a6c5cacb6ed2ee93.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

oxenstored already had support for loading a partial dump from a text format.
Add support for the binary format too.
We no longer dump the text format, but we support loading the text format for
backwards compatibility purposes.
(a version of oxenstored supporting live-update with the old text format has been
released as part of the security series)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/perms.ml     |   2 +
 tools/ocaml/xenstored/xenstored.ml | 202 ++++++++++++++++++++++++-----
 2 files changed, 174 insertions(+), 30 deletions(-)

diff --git a/tools/ocaml/xenstored/perms.ml b/tools/ocaml/xenstored/perms.ml
index e8a16221f8..61c1c60083 100644
--- a/tools/ocaml/xenstored/perms.ml
+++ b/tools/ocaml/xenstored/perms.ml
@@ -69,6 +69,8 @@ let remove_domid ~domid perm =
 
 let default0 = create 0 NONE []
 
+let acls t = (t.owner, t.other) :: t.acl
+
 let perm_of_string s =
 	let ty = permty_of_char s.[0]
 	and id = int_of_string (String.sub s 1 (String.length s - 1)) in
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index ae2eab498a..2aa0dbc0e1 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -141,7 +141,8 @@ exception Bad_format of string
 
 let dump_format_header = "$xenstored-dump-format"
 
-let from_channel_f chan global_f socket_f domain_f watch_f store_f =
+(* for backwards compatibility with already released live-update *)
+let from_channel_f_compat chan global_f socket_f domain_f watch_f store_f =
 	let unhexify s = Utils.unhexify s in
 	let getpath s =
 		let u = Utils.unhexify s in
@@ -186,7 +187,7 @@ let from_channel_f chan global_f socket_f domain_f watch_f store_f =
 	done;
 	info "Completed loading xenstore dump"
 
-let from_channel store cons doms chan =
+let from_channel_compat ~live store cons doms chan =
 	(* don't let the permission get on our way, full perm ! *)
 	let op = Store.get_ops store Perms.Connection.full_rights in
 	let rwro = ref (None) in
@@ -226,43 +227,183 @@ let from_channel store cons doms chan =
 		op.Store.write path value;
 		op.Store.setperms path perms
 		in
-	from_channel_f chan global_f socket_f domain_f watch_f store_f;
+	from_channel_f_compat chan global_f socket_f domain_f watch_f store_f;
 	!rwro
 
-let from_file store cons doms file =
-	info "Loading xenstore dump from %s" file;
-	let channel = open_in file in
-	finally (fun () -> from_channel store doms cons channel)
+module LR = Disk.LiveRecord
+
+let from_channel_f_bin chan on_global_data on_connection_data on_watch_data on_transaction_data on_node_data =
+	Disk.BinaryIn.read_header chan;
+	let quit = ref false in
+	let on_end () = quit := true in
+	let errors = ref 0 in
+	while not !quit
+	do
+		try
+			LR.read_record chan ~on_end ~on_global_data ~on_connection_data ~on_watch_data ~on_transaction_data ~on_node_data
+		with exn ->
+			let bt = Printexc.get_backtrace () in
+			incr errors;
+			Logging.warn "xenstored" "restoring: ignoring faulty record (exception: %s): %s" (Printexc.to_string exn) bt
+	done;
+        info "Completed loading xenstore dump";
+	!errors
+
+
+let from_channel_bin ~live store cons doms chan =
+	(* don't let the permission get on our way, full perm ! *)
+	let maintx = Transaction.make ~internal:true Transaction.none store in
+	let fullperm = Perms.Connection.full_rights in
+	let fds = ref None in
+	let allcons = Hashtbl.create 1021 in
+	let contxid_to_op = Hashtbl.create 1021 in
+	let global_f ~rw_sock =
+		(* file descriptors are only valid on a live-reload, a cold restart won't have them *)
+		if live then
+			fds := Some rw_sock
+	in
+	let domain_f ~conid ~conn ~in_data ~out_data ~out_resp_len =
+		let con = match conn with
+		| LR.Domain { LR.id = 0; _ } ->
+			(* Dom0 is precreated *)
+			Connections.find_domain cons 0
+		| LR.Domain d ->
+			debug "Recreating domain %d, port %d" d.id d.remote_port; 
+			(* FIXME: gnttab *)
+			Domains.create doms d.id 0n d.remote_port
+			|> Connections.add_domain cons;
+			Connections.find_domain cons d.id
+		| LR.Socket fd ->
+			debug "Recreating open socket";
+			(* TODO: rw/ro flag *)
+			Connections.add_anonymous cons fd;
+			Connections.find cons fd
+		in
+		Hashtbl.add allcons conid con
+	in
+	let watch_f ~conid ~wpath ~token =
+		let con = Hashtbl.find allcons conid in
+		ignore (Connections.add_watch cons con wpath token);
+		()
+		in
+	let transaction_f ~conid ~txid =
+		let con = Hashtbl.find allcons conid in
+		con.Connection.next_tid <- txid;
+		let id = Connection.start_transaction con store in
+		assert (id = txid);
+		let txn = Connection.get_transaction con txid in
+		Hashtbl.add contxid_to_op (conid, txid) txn
+	in
+	let store_f ~txaccess ~perms ~path ~value =
+		let txn, op = match txaccess with
+		| None -> maintx, LR.W
+		| Some (conid, txid, op) ->
+			 let (txn, _) as r = Hashtbl.find contxid_to_op (conid, txid), op in
+     	 (* make sure this doesn't commit, even as RO *)
+			 Transaction.mark_failed txn;
+			 r
+        in
+	let get_con id =
+		if id < 0 then Connections.find cons (Utils.FD.of_int (-id))
+		else Connections.find_domain cons id
+	in
+	let watch_f id path token =
+		ignore (Connections.add_watch cons (get_con id) path token)
+		in
+		let path = Store.Path.of_string path in
+		try match op with
+		| LR.R ->
+			 Logging.debug "xenstored" "TR %s %S" (Store.Path.to_string path) value;
+			(* these are values read by the tx, potentially
+				 no write access here. Make the tree match. *)
+			Transaction.write txn fullperm path value; 
+			Transaction.setperms txn fullperm path perms;
+		| LR.W | LR.RW ->
+			 Logging.debug "xenstored" "TW %d %s %S" (Transaction.get_id txn) (Store.Path.to_string path) value;
+			 (* We started with empty tree, create parents.
+			    All the implicit mkdirs from the original tx should be explicit already for quota purposes.
+			 *)
+			 Process.create_implicit_path txn fullperm path;
+ 			 Transaction.write txn fullperm path value; 
+			 Transaction.setperms txn fullperm path perms;
+			 Logging.debug "xenstored" "TWdone %s %S" (Store.Path.to_string path) value;
+		| LR.Del ->
+			 Logging.debug "xenstored" "TDel %s " (Store.Path.to_string path);
+			Transaction.rm txn fullperm path
+		with Not_found|Define.Doesnt_exist|Define.Lookup_Doesnt_exist _ -> ()
+		in
+	(* make sure we got a quota entry for Dom0, so that setperms on / doesn't cause quota to be off-by-one *)
+	Transaction.mkdir maintx fullperm (Store.Path.of_string "/local");
+	let errors = from_channel_f_bin chan global_f domain_f watch_f transaction_f store_f in
+	(* do not fire any watches, but this makes a tx RO *)
+(*	Transaction.clear_wops maintx; *)
+	let errors = if not @@ Transaction.commit ~con:"live-update" maintx then begin
+		Logging.warn "xenstored" "live-update: failed to commit main transaction";
+		errors + 1
+	end else errors
+	in
+	!fds, errors
+
+let from_channel = from_channel_bin (* TODO: detect and accept text format *)
+
+let from_file ~live store cons doms file =
+	let channel = open_in_bin file in
+	finally (fun () -> from_channel_bin ~live store doms cons channel)
 	        (fun () -> close_in channel)
 
-let to_channel store cons rw chan =
-	let hexify s = Utils.hexify s in
+let to_channel rw_sock store cons chan =
+	let t = Disk.BinaryOut.write_header chan in
 
-	fprintf chan "%s\n" dump_format_header;
-	let fdopt = function None -> -1 | Some fd ->
-		(* systemd and utils.ml sets it close on exec *)
-		Unix.clear_close_on_exec fd;
-		Utils.FD.to_int fd in
-	fprintf chan "global,%d\n" (fdopt rw);
-
-	(* dump connections related to domains: domid, mfn, eventchn port/ sockets, and watches *)
-	Connections.iter cons (fun con -> Connection.dump con chan);
+	(match rw_sock with
+	| Some rw_sock ->
+		LR.write_global_data t ~rw_sock
+	| _ -> ());
 
 	(* dump the store *)
 	Store.dump_fct store (fun path node ->
-		let name, perms, value = Store.Node.unpack node in
-		let fullpath = Store.Path.to_string (Store.Path.of_path_and_name path name) in
-		let permstr = Perms.Node.to_string perms in
-		fprintf chan "store,%s,%s,%s\n" (hexify fullpath) (hexify permstr) (hexify value)
+		Transaction.write_node t None path node
 	);
+
+	(* dump connections related to domains and sockets; domid, mfn, eventchn port, watches *)
+	Connections.iter cons (fun con -> Connection.dump con store t);
+
+	LR.write_end t;
 	flush chan;
 	()
 
+let validate_f ch =
+	let conids = Hashtbl.create 1021 in
+	let txids = Hashtbl.create 1021 in
+	let global_f ~rw_sock = () in
+	let domain_f ~conid ~conn ~in_data ~out_data ~out_resp_len =
+		Hashtbl.add conids conid ()
+	in
+	let watch_f ~conid ~wpath ~token =
+		Hashtbl.find conids conid
+	in
+	let transaction_f ~conid ~txid =
+		Hashtbl.find conids conid;
+		Hashtbl.add txids (conid, txid) ()
+	in 
+	let store_f ~txaccess ~perms ~path ~value =
+		match txaccess with
+		| None -> ()
+		| Some (conid, txid, _) ->
+			Hashtbl.find conids conid;
+			Hashtbl.find txids (conid, txid)
+	in
+	let errors = from_channel_f_bin ch global_f domain_f watch_f transaction_f store_f in
+	if errors > 0 then
+		failwith (Printf.sprintf "Failed to re-read dump: %d errors" errors)
 
-let to_file store cons fds file =
-	let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; ] 0o600 file in
-	finally (fun () -> to_channel store cons fds channel)
-	        (fun () -> close_out channel)
+let to_file fds store cons file =
+	let channel = open_out_gen [ Open_wronly; Open_creat; Open_trunc; Open_binary ] 0o600 file in
+	finally (fun () -> to_channel fds store cons channel)
+					(fun () -> close_out channel);
+	let channel = open_in_bin file in
+	finally (fun () -> validate_f channel)
+	        (fun () -> close_in channel)
+	
 end
 
 let main () =
@@ -329,8 +470,9 @@ let main () =
 
 	let rw_sock =
 	if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
-		let rwro = DB.from_file store domains cons Disk.xs_daemon_database in
-		info "Live reload: database loaded";
+		Connections.add_domain cons (Domains.create0 domains);
+		let rwro, errors = DB.from_file ~live:cf.live_reload store domains cons Disk.xs_daemon_database in
+		info "Live reload: database loaded (%d errors)" errors;
 		Event.bind_dom_exc_virq eventchn;
 		Process.LiveUpdate.completed ();
 		rwro
@@ -360,7 +502,7 @@ let main () =
 	Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
 	if cf.activate_access_log then begin
-		let post_rotate () = DB.to_file store cons (None) Disk.xs_daemon_database in
+		let post_rotate () = DB.to_file None store cons Disk.xs_daemon_database in
 		Logging.init_access_log post_rotate
 	end;
 
@@ -521,7 +663,7 @@ let main () =
 			live_update := Process.LiveUpdate.should_run cons;
 			if !live_update || !quit then begin
 				(* don't initiate live update if saving state fails *)
-				DB.to_file store cons (rw_sock) Disk.xs_daemon_database;
+				DB.to_file rw_sock store cons Disk.xs_daemon_database;
 				quit := true;
 			end
 		with exc ->
-- 
2.25.1


