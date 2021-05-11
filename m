Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C303B37ADD4
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 20:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125909.237063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmw-0003LR-1S; Tue, 11 May 2021 18:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125909.237063; Tue, 11 May 2021 18:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWmv-0003Ge-Sc; Tue, 11 May 2021 18:07:21 +0000
Received: by outflank-mailman (input) for mailman id 125909;
 Tue, 11 May 2021 18:07:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFnS=KG=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgWmu-0001nY-DX
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 18:07:20 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f8c4a83-831a-40ed-8f89-f3d2965861df;
 Tue, 11 May 2021 18:07:10 +0000 (UTC)
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
X-Inumbo-ID: 6f8c4a83-831a-40ed-8f89-f3d2965861df
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620756430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p0W19jtbXsU+HwGFf/dzsvYLrPw4HfB2Wm1ke3VJSTU=;
  b=dQMd3S3Sh1uwjZz11L+p0WZJChMX7GaGF7J6k85HWSKjfLzhEFGL5iRL
   Yo2pTQXXwISgXE6xH9onF5WBFRWYXD/O05R2T/mMB08JTlo4PKp92qirt
   kR5CB9AWLI4Mm1J6taOI84LMctdfsxRnGVQuOSk2h0nTTgEepL4D5dMTO
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kFob7Ev9G9Y0/Z94owD+Jbmq1srgk7MQRmvTxVjkheEbgfYfIYGrsES29esGjpru6VOo6Ms2Fj
 hnpvqhiBExUTY88zyv6g5xoAf2Ub94Y3+Olbbof+howte6Bx1X63++ZmL48iyZq5Eo8ATVkWIT
 +HrnHtJsz+KmkrHR+F/ShE9BNc5cP1J/6P9zyYSSt+w3QgHlhR0SNjy7MKIKQGdoCS0obasASc
 5M1yS0iVLBq+bCSgZr4ujmoj5A7RpVUqrdLvyGRCixyUsy+XEDekU8jYHQ2C4c9FoOeZWXeeor
 b7Y=
X-SBRS: 5.1
X-MesageID: 45101013
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jrcCBa6OcVqvAPVt+QPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.82,291,1613451600"; 
   d="scan'208";a="45101013"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/17] tools/ocaml/xenstored: validate config file before live update
Date: Tue, 11 May 2021 19:05:20 +0100
Message-ID: <a53934dfa8ef984bffa858cc573cc7a6445bbdc0.1620755942.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620755942.git.edvin.torok@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The configuration file can contain typos or various errors that could prevent
live update from succeeding (e.g. a flag only valid on a different version).
Unknown entries in the config file would be ignored on startup normally,
add a strict --config-test that live-update can use to check that the config file
is valid *for the new binary*.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/parse_arg.ml | 4 ++++
 tools/ocaml/xenstored/process.ml   | 2 +-
 tools/ocaml/xenstored/xenstored.ml | 9 +++++++--
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/xenstored/parse_arg.ml b/tools/ocaml/xenstored/parse_arg.ml
index 965cb9ebeb..588970825f 100644
--- a/tools/ocaml/xenstored/parse_arg.ml
+++ b/tools/ocaml/xenstored/parse_arg.ml
@@ -26,6 +26,7 @@ type config =
 	restart: bool;
 	live_reload: bool;
 	disable_socket: bool;
+	config_test: bool;
 }
 
 let do_argv () =
@@ -38,6 +39,7 @@ let do_argv () =
 	and restart = ref false
 	and live_reload = ref false
 	and disable_socket = ref false
+	and config_test = ref false
 	in
 
 	let speclist =
@@ -55,6 +57,7 @@ let do_argv () =
 		  ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
 		  ("--restart", Arg.Set restart, "Read database on starting");
 		  ("--live", Arg.Set live_reload, "Read live dump on startup");
+		  ("--config-test", Arg.Set config_test, "Test validity of config file");
 		  ("--disable-socket", Arg.Unit (fun () -> disable_socket := true), "Disable socket");
 		] in
 	let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket]" in
@@ -70,4 +73,5 @@ let do_argv () =
 		restart = !restart;
 		live_reload = !live_reload;
 		disable_socket = !disable_socket;
+		config_test = !config_test;
 	}
diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 27790d4a5c..d573c88685 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -121,7 +121,7 @@ let launch_exn t =
 
 let validate_exn t =
 	(* --help must be last to check validity of earlier arguments *)
-	let t' = {t with cmdline= t.cmdline @ ["--help"]} in
+	let t' = {t with cmdline= t.cmdline @ ["--config-test"]} in
 	let cmd = string_of_t t' in
 	debug "Executing %s" cmd ;
 	match Unix.fork () with
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 2aa0dbc0e1..34e706910e 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -88,7 +88,7 @@ let default_pidfile = Paths.xen_run_dir ^ "/xenstored.pid"
 
 let ring_scan_interval = ref 20
 
-let parse_config filename =
+let parse_config ?(strict=false) filename =
 	let pidfile = ref default_pidfile in
 	let options = [
 		("merge-activate", Config.Set_bool Transaction.do_coalesce);
@@ -126,11 +126,12 @@ let parse_config filename =
 		("xenstored-port", Config.Set_string Domains.xenstored_port); ] in
 	begin try Config.read filename options (fun _ _ -> raise Not_found)
 	with
-	| Config.Error err -> List.iter (fun (k, e) ->
+	| Config.Error err as e -> List.iter (fun (k, e) ->
 		match e with
 		| "unknown key" -> eprintf "config: unknown key %s\n" k
 		| _             -> eprintf "config: %s: %s\n" k e
 		) err;
+		if strict then raise e
 	| Sys_error m -> eprintf "error: config: %s\n" m;
 	end;
 	!pidfile
@@ -408,6 +409,10 @@ end
 
 let main () =
 	let cf = do_argv () in
+	if cf.config_test then begin
+	  let _pidfile:string = parse_config ~strict:true (config_filename cf) in
+	  exit 0
+	end;
 	let pidfile =
 		if Sys.file_exists (config_filename cf) then
 			parse_config (config_filename cf)
-- 
2.25.1


