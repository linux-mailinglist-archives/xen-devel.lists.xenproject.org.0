Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726D621884
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440166.694325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhc-0000Au-6K; Tue, 08 Nov 2022 15:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440166.694325; Tue, 08 Nov 2022 15:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhc-00008s-14; Tue, 08 Nov 2022 15:39:52 +0000
Received: by outflank-mailman (input) for mailman id 440166;
 Tue, 08 Nov 2022 15:39:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQhZ-0007Fx-Tg
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:39:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93b83a42-5f7b-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:39:48 +0100 (CET)
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
X-Inumbo-ID: 93b83a42-5f7b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=buzE9ePYEDLC+F92TEeWnEnqUW11FTaxYumtDUDu/aE=;
  b=UYS14wTsgvW/RfheV6UQLyr3NozmQ6b2CO/VPrcR6eEoikZaK0nDs13+
   cRpGSt5Fcrd6BK9L1jgWSL1oD7nQIVkqo7oOi9t/uSMKmiFntpa/6PZcy
   BJ3yCFOiF4ljbtN0PxS5/pWR0vROD326FmMPmjfDLJPZIN2givlltQXyl
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 86935397
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ozS7OKi+0ZyiXbU8r9SIKVtVX161bBAKZh0ujC45NGQN5FlHY01je
 htvUTiAPKuCY2D3f94gYdmy90wBucfXndMxSFdqqC82Rigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QeOzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQyDCofTD+Fo9m1g72UVvNTuuIyI5fkadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHyfyNZrhSJorAw4EDYzRBr0airO93QEjCPbZULzx3F/
 TOZl4j/KiEZa/zP+TC9yHm1rPXkvXnGRtMbG7Lto5aGh3XMnzdOWXX6T2CTrfCnh2akVtlYK
 khS/TAhxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebRwn0
 EWY2ezgAzNHuaeQD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznZPJ5AoyaiPnOGnL/7
 CyQkxQYlrpNgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWN0e+yzMUJVJdPUUOQS9PZNijS5fK8fekJr9iNBjeOC7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjyUiZGV/0/lGDoF4/xNIPHIQhnmwvuqW3TlUz7gdJymlbJIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WO0HqHE96BQ5iEEXX8riv+pEILLXYelo/cIzjYteIqY4cl0Vet/w9vo/1E
 ruVASe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:LLMWWKp+zp4ZbGFS6aj+SJIaV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="86935397"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 10/15] tools/ocaml/xenstored: keep eventchn FD open across live update
Date: Tue, 8 Nov 2022 15:34:02 +0000
Message-ID: <17575704fceda409bd5bb0056a94664ddc3ac2e1.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It has been discovered that the Windows PV drivers rebind their local
port of the xenstore evtchn post migrate,
which changes the eventchn port from e.g.
the default of 3 (nVCPUs+1) to 1 without oxenstored knowing about it.
And oxenstored goes and tries to rebind port 3, which is already in use
by something else.

The guest also writes to HVMPARAM, however there is a race condition
between it resetting the eventchn port and writing to HVMPARAM, thus it
is not possible to atomically obtain the guest's eventchn port for
xenstore.

It is possible to recover such a guest manually from a failed live update by
running introduceDomain from Dom0 with the correct port number obtain
using 'xen-vmdebug <domid> hvmparam'.

There is also a small race condition window between closing the evtchn
FD and reopening it where guest drivers would get an unbound evtchn port
error from Xen when trying to talk to xenstore during live update.

Avoid this by trying to keep the eventchn file descriptor open across
live updates, using the new xenevtchn_fdopen API, similar to how C
xenstored works.

However an old enough oxenstored won't have kept the evtchn fd open and
won't have saved it in the update stream, so handle that case by
reopening the evtchn as a fallback.

A followup commit will avoid rebind the guest remote port (we cannot
rely on the remote port staying the same, e.g. the windows PV drivers
change it)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- fixes live update in oxenstored, making future security updates easier
  if the base code already has this patch

Changes since v2:
- new in v3
---
 tools/ocaml/xenstored/domains.ml   |  1 +
 tools/ocaml/xenstored/event.ml     |  7 ++-
 tools/ocaml/xenstored/xenstored.ml | 71 +++++++++++++++++++++---------
 3 files changed, 56 insertions(+), 23 deletions(-)

diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index a36b531663..d5c452d26c 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -56,6 +56,7 @@ let exist doms id = Hashtbl.mem doms.table id
 let find doms id = Hashtbl.find doms.table id
 let number doms = Hashtbl.length doms.table
 let iter doms fct = Hashtbl.iter (fun _ b -> fct b) doms.table
+let eventchn doms = doms.eventchn
 
 let rec is_empty_queue q =
   Queue.is_empty q ||
diff --git a/tools/ocaml/xenstored/event.ml b/tools/ocaml/xenstored/event.ml
index b10027f004..190ca6fcbf 100644
--- a/tools/ocaml/xenstored/event.ml
+++ b/tools/ocaml/xenstored/event.ml
@@ -20,7 +20,12 @@ type t = {
   mutable virq_port: Xeneventchn.t option;
 }
 
-let init () = { handle = Xeneventchn.init (); virq_port = None; }
+let init ?fd () =
+  let handle = match fd with
+    | None -> Xeneventchn.init ~cloexec:false ()
+    | Some fd -> Xeneventchn.fdopen fd
+  in
+  { handle; virq_port = None }
 let fd eventchn = Xeneventchn.fd eventchn.handle
 let bind_dom_exc_virq eventchn = eventchn.virq_port <- Some (Xeneventchn.bind_dom_exc_virq eventchn.handle)
 let bind_interdomain eventchn domid port = Xeneventchn.bind_interdomain eventchn.handle domid port
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 34612814e1..cdd5b5ac67 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -144,7 +144,7 @@ module DB = struct
 
   let dump_format_header = "$xenstored-dump-format"
 
-  let from_channel_f chan global_f socket_f domain_f watch_f store_f =
+  let from_channel_f chan global_f event_f socket_f domain_f watch_f store_f =
     let unhexify s = Utils.unhexify s in
     let getpath s =
       let u = Utils.unhexify s in
@@ -165,6 +165,8 @@ module DB = struct
             (* there might be more parameters here,
                e.g. a RO socket from a previous version: ignore it *)
             global_f ~rw
+          | "eventchnfd" :: eventfd :: [] ->
+            event_f ~eventfd
           | "socket" :: fd :: [] ->
             socket_f ~fd:(int_of_string fd)
           | "dom" :: domid :: mfn :: port :: []->
@@ -189,10 +191,27 @@ module DB = struct
     done;
     info "Completed loading xenstore dump"
 
-  let from_channel store cons doms chan =
+  let from_channel store cons createdoms chan =
     (* don't let the permission get on our way, full perm ! *)
     let op = Store.get_ops store Perms.Connection.full_rights in
     let rwro = ref (None) in
+    let eventchnfd = ref (None) in
+    let doms = ref (None) in
+
+    let require_doms () =
+      match !doms with
+      | None ->
+        let missing_eventchnfd = !eventchnfd = None in
+        if missing_eventchnfd then
+          warn "No event channel file descriptor available in dump!";
+        let eventchn = Event.init ?fd:!eventchnfd () in
+        let domains = createdoms eventchn in
+        if missing_eventchnfd then
+          Event.bind_dom_exc_virq eventchn;
+        doms := Some domains;
+        domains
+      | Some d -> d
+    in
     let global_f ~rw =
       let get_listen_sock sockfd =
         let fd = sockfd |> int_of_string |> Utils.FD.of_int in
@@ -201,6 +220,10 @@ module DB = struct
       in
       rwro := get_listen_sock rw
     in
+    let event_f ~eventfd =
+      let fd = eventfd |> int_of_string |> Utils.FD.of_int in
+      eventchnfd := Some fd
+    in
     let socket_f ~fd =
       let ufd = Utils.FD.of_int fd in
       let is_valid = try (Unix.fstat ufd).Unix.st_kind = Unix.S_SOCK with _ -> false in
@@ -210,6 +233,7 @@ module DB = struct
         warn "Ignoring invalid socket FD %d" fd
     in
     let domain_f domid mfn port =
+      let doms = require_doms () in
       let ndom =
         if domid > 0 then
           Domains.create doms domid mfn port
@@ -229,8 +253,8 @@ module DB = struct
       op.Store.write path value;
       op.Store.setperms path perms
     in
-    from_channel_f chan global_f socket_f domain_f watch_f store_f;
-    !rwro
+    from_channel_f chan global_f event_f socket_f domain_f watch_f store_f;
+    !rwro, require_doms ()
 
   let from_file store cons doms file =
     info "Loading xenstore dump from %s" file;
@@ -238,7 +262,7 @@ module DB = struct
     finally (fun () -> from_channel store doms cons channel)
       (fun () -> close_in channel)
 
-  let to_channel store cons rw chan =
+  let to_channel store cons (rw, eventchn) chan =
     let hexify s = Utils.hexify s in
 
     fprintf chan "%s\n" dump_format_header;
@@ -247,6 +271,7 @@ module DB = struct
       Unix.clear_close_on_exec fd;
       Utils.FD.to_int fd in
     fprintf chan "global,%d\n" (fdopt rw);
+    fprintf chan "eventchnfd,%d\n" (Utils.FD.to_int @@ Event.fd eventchn);
 
     (* dump connections related to domains: domid, mfn, eventchn port/ sockets, and watches *)
     Connections.iter cons (fun con -> Connection.dump con chan);
@@ -367,7 +392,6 @@ let _ =
     | None         -> () end;
 
   let store = Store.create () in
-  let eventchn = Event.init () in
   let next_frequent_ops = ref 0. in
   let advance_next_frequent_ops () =
     next_frequent_ops := (Unix.gettimeofday () +. !Define.conflict_max_history_seconds)
@@ -375,16 +399,8 @@ let _ =
   let delay_next_frequent_ops_by duration =
     next_frequent_ops := !next_frequent_ops +. duration
   in
-  let domains = Domains.init eventchn advance_next_frequent_ops in
+  let domains eventchn = Domains.init eventchn advance_next_frequent_ops in
 
-  (* For things that need to be done periodically but more often
-   * than the periodic_ops function *)
-  let frequent_ops () =
-    if Unix.gettimeofday () > !next_frequent_ops then (
-      History.trim ();
-      Domains.incr_conflict_credit domains;
-      advance_next_frequent_ops ()
-    ) in
   let cons = Connections.create () in
 
   let quit = ref false in
@@ -393,15 +409,15 @@ let _ =
   List.iter (fun path ->
       Store.write store Perms.Connection.full_rights path "") Store.Path.specials;
 
-  let rw_sock =
+  let rw_sock, domains =
     if cf.restart && Sys.file_exists Disk.xs_daemon_database then (
-      let rwro = DB.from_file store domains cons Disk.xs_daemon_database in
+      let rw, domains = DB.from_file store domains cons Disk.xs_daemon_database in
       info "Live reload: database loaded";
-      Event.bind_dom_exc_virq eventchn;
       Process.LiveUpdate.completed ();
-      rwro
+      rw, domains
     ) else (
       info "No live reload: regular startup";
+      let domains = domains @@ Event.init () in
       if !Disk.enable then (
         info "reading store from disk";
         Disk.read store
@@ -411,11 +427,21 @@ let _ =
       if not (Store.path_exists store localpath) then
         Store.mkdir store (Perms.Connection.create 0) localpath;
 
+      let eventchn = Event.init () in
       if cf.domain_init then (
         Connections.add_domain cons (Domains.create0 domains);
         Event.bind_dom_exc_virq eventchn
       );
-      rw_sock
+      rw_sock, domains
+    ) in
+
+  (* For things that need to be done periodically but more often
+     	 * than the periodic_ops function *)
+  let frequent_ops () =
+    if Unix.gettimeofday () > !next_frequent_ops then (
+      History.trim ();
+      Domains.incr_conflict_credit domains;
+      advance_next_frequent_ops ()
     ) in
 
   (* required for xenstore-control to detect availability of live-update *)
@@ -433,10 +459,11 @@ let _ =
   Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
   if cf.activate_access_log then begin
-    let post_rotate () = DB.to_file store cons (None) Disk.xs_daemon_database in
+    let post_rotate () = DB.to_file store cons (None, Domains.eventchn domains) Disk.xs_daemon_database in
     Logging.init_access_log post_rotate
   end;
 
+  let eventchn = Domains.eventchn domains in
   let spec_fds =
     (match rw_sock with None -> [] | Some x -> [ x ]) @
     (if cf.domain_init then [ Event.fd eventchn ] else [])
@@ -594,7 +621,7 @@ let _ =
       live_update := Process.LiveUpdate.should_run cons;
       if !live_update || !quit then begin
         (* don't initiate live update if saving state fails *)
-        DB.to_file store cons (rw_sock) Disk.xs_daemon_database;
+        DB.to_file store cons (rw_sock, eventchn) Disk.xs_daemon_database;
         quit := true;
       end
     with exc ->
-- 
2.34.1


