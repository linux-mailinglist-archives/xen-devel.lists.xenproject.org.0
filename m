Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B302F8873
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68672.123024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xbk-0007FG-2P; Fri, 15 Jan 2021 22:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68672.123024; Fri, 15 Jan 2021 22:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xbj-0007EV-Tj; Fri, 15 Jan 2021 22:30:15 +0000
Received: by outflank-mailman (input) for mailman id 68672;
 Fri, 15 Jan 2021 22:30:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xbi-00062b-8V
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:30:14 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c25cd1b-d022-4c55-b81e-1987ddc0eda6;
 Fri, 15 Jan 2021 22:29:51 +0000 (UTC)
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
X-Inumbo-ID: 1c25cd1b-d022-4c55-b81e-1987ddc0eda6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tcW6aJFjdLYT7/rMoBR/lbzSOmMTuN1isJgOl/8Ingw=;
  b=akKWxwMIyITjsxNgoj6lcnUZVcd/siduO90sC/CSM2/QCLoXCdAhcEN0
   ERwqdwpTRhMFj0gJQEMVhDjvV0eLeWKtYXO8O+FYa3QeC6+6mbMjey2L0
   X38yUJbYWqYSjzFWOf1XHstjkfdBU89EWX6JvrRduSSzSZfh8QGQLDVbt
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QSb8iFPrZC3nCgPcKdjmYn5SsNfAh0MxCe+2gLLmR50bxDKGKv0z2ojfYb16wVO5I7tys1TMcv
 l9nOggz0RQr4H77k/lBFmtA2yvZkNOBj7/iWFsfsX+p6P8DrYq3u6zzqWoAVXNg8jgUrQU3wrV
 +8SsQRMlgnT5gsxYtlrYjBY5id7DBotUbLqNt9Mu0SIW4NTa4CJoHHrI7aOgFqBwGBuPSmmyj2
 UWGL2dimOLlBdaYa0UKkQiAva54vIff2xsl2/JzZ+v742yeK1U7ho6FNHEtg99gDSj4ZhXdWDk
 85U=
X-SBRS: 5.1
X-MesageID: 35216601
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35216601"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Pau Ruiz Safont <pau.safont@citrix.com>
Subject: [PATCH v2 4/8] tools/ocaml/xenstored: only quit on SIGTERM when a reload is possible
Date: Fri, 15 Jan 2021 22:28:46 +0000
Message-ID: <023574503750d06132e3ca260848c364ff439001.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently when oxenstored receives SIGTERM it dumps its state and quits.
It is possible to then restart it if --restart is given, however that is
not always safe:

* domains could have active transactions, and after a restart they would
either reuse transaction IDs of already open transactions, or get an
error back that the transaction doesn't exist

* there could be pending data to send to a VM still in oxenstored's
  queue which would be lost

* there could be pending input to be processed from a VM in oxenstored's
  queue which would be lost

Prevent shutting down oxenstored via SIGTERM in the above situations.
Also ignore domains marked as bad because oxenstored would never talk
to them again.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
Reviewed-by: Christian Lindig <christian.lindig@citrix.com>

---
Changed since V1:
* post publicly now that the XSA is out
---
 tools/ocaml/xenstored/connection.ml  | 35 ++++++++++++++++++++++++++++
 tools/ocaml/xenstored/connections.ml |  8 +++++++
 tools/ocaml/xenstored/xenstored.ml   | 13 +++++++++--
 tools/xenstore/xenstored_core.c      |  7 +++++-
 4 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index fa0d3c4d92..bd02060cd0 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -290,6 +290,41 @@ let has_new_output con = Xenbus.Xb.has_new_output con.xb
 let peek_output con = Xenbus.Xb.peek_output con.xb
 let do_output con = Xenbus.Xb.output con.xb
 
+let is_bad con = match con.dom with None -> false | Some dom -> Domain.is_bad_domain dom
+
+(* oxenstored currently only dumps limited information about its state.
+   A live update is only possible if any of the state that is not dumped would be empty.
+   Compared to https://xenbits.xen.org/docs/unstable/designs/xenstore-migration.html:
+     * GLOBAL_DATA: not strictly needed, systemd is giving the socket FDs to us
+     * CONNECTION_DATA: PARTIAL
+       * for domains: PARTIAL, see Connection.dump -> Domain.dump, only if data and tdomid is empty
+       * for sockets (Dom0 toolstack): NO
+     * WATCH_DATA: OK, see Connection.dump
+     * TRANSACTION_DATA: NO
+     * NODE_DATA: OK (except for transactions), see Store.dump_fct and DB.to_channel
+
+   Also xenstored will never talk to a Domain once it is marked as bad,
+   so treat it as idle for live-update.
+
+   Restrictions below can be relaxed once xenstored learns to dump more
+   of its live state in a safe way *)
+let has_extra_connection_data con =
+	let has_in = has_input con in
+	let has_out = has_output con in
+	let has_socket = con.dom = None in
+	let has_nondefault_perms = make_perm con.dom <> con.perm in
+	has_in || has_out
+	|| has_socket (* dom0 sockets not dumped yet *)
+	|| has_nondefault_perms (* set_target not dumped yet *)
+
+let has_transaction_data con =
+	let n = number_of_transactions con in
+	dbg "%s: number of transactions = %d" (get_domstr con) n;
+	n > 0
+
+let prevents_live_update con = not (is_bad con)
+	&& (has_extra_connection_data con || has_transaction_data con)
+
 let has_more_work con =
 	has_more_input con || not (has_old_output con) && has_new_output con
 
diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index 6ee3552ec2..82988f7e8d 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -194,3 +194,11 @@ let debug cons =
 	let anonymous = Hashtbl.fold (fun _ con accu -> Connection.debug con :: accu) cons.anonymous [] in
 	let domains = Hashtbl.fold (fun _ con accu -> Connection.debug con :: accu) cons.domains [] in
 	String.concat "" (domains @ anonymous)
+
+let filter ~f cons =
+	let fold _ v acc = if f v then v :: acc else acc in
+	[]
+	|> Hashtbl.fold fold cons.anonymous
+	|> Hashtbl.fold fold cons.domains
+
+let prevents_quit cons = filter ~f:Connection.prevents_live_update cons
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 39d6d767e4..6b5381962b 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -20,6 +20,7 @@ open Parse_arg
 open Stdext
 
 let error fmt = Logging.error "xenstored" fmt
+let warn fmt = Logging.warn "xenstored" fmt
 let debug fmt = Logging.debug "xenstored" fmt
 let info fmt = Logging.info "xenstored" fmt
 
@@ -312,7 +313,9 @@ let _ =
 	);
 
 	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
-	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ -> quit := true));
+	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
+		 info "Received SIGTERM";
+		 quit := true));
 	Sys.set_signal Sys.sigusr1 (Sys.Signal_handle (fun _ -> sigusr1_handler store));
 	Sys.set_signal Sys.sigpipe Sys.Signal_ignore;
 
@@ -424,6 +427,12 @@ let _ =
 		);
 		let elapsed = Unix.gettimeofday () -. now in
 		debug "periodic_ops took %F seconds." elapsed;
+		if !quit then
+		(match Connections.prevents_quit cons with
+		| [] -> ()
+		| domains ->
+		    List.iter (fun con -> warn "%s prevents live update" (Connection.get_domstr con)) domains
+		);
 		delay_next_frequent_ops_by elapsed
 	in
 
@@ -475,7 +484,7 @@ let _ =
 		in
 
 	Systemd.sd_notify_ready ();
-	while not !quit
+	while not (!quit && Connections.prevents_quit cons = [])
 	do
 		try
 			main_loop ()
diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
index 50986f8b29..b9495365c4 100644
--- a/tools/xenstore/xenstored_core.c
+++ b/tools/xenstore/xenstored_core.c
@@ -1970,6 +1970,7 @@ static struct option options[] = {
 	{ "internal-db", 0, NULL, 'I' },
 	{ "verbose", 0, NULL, 'V' },
 	{ "watch-nb", 1, NULL, 'W' },
+	{ "live-update", 0, NULL, 'U' },
 	{ NULL, 0, NULL, 0 } };
 
 extern void dump_conn(struct connection *conn); 
@@ -1984,11 +1985,12 @@ int main(int argc, char *argv[])
 	bool dofork = true;
 	bool outputpid = false;
 	bool no_domain_init = false;
+	bool live_update = false;
 	const char *pidfile = NULL;
 	int timeout;
 
 
-	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:", options,
+	while ((opt = getopt_long(argc, argv, "DE:F:HNPS:t:A:M:T:RVW:U", options,
 				  NULL)) != -1) {
 		switch (opt) {
 		case 'D':
@@ -2046,6 +2048,9 @@ int main(int argc, char *argv[])
 		case 'p':
 			priv_domid = strtol(optarg, NULL, 10);
 			break;
+		case 'U':
+			live_update = true;
+			break;
 		}
 	}
 	if (optind != argc)
-- 
2.29.2


