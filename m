Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A25E64F108
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464933.723500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FY5-0003ZA-0h; Fri, 16 Dec 2022 18:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464933.723500; Fri, 16 Dec 2022 18:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FY4-0003WV-Tt; Fri, 16 Dec 2022 18:35:08 +0000
Received: by outflank-mailman (input) for mailman id 464933;
 Fri, 16 Dec 2022 18:35:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FPp-0006tv-EH
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:26:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bd7e4d5-7d6f-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 19:26:36 +0100 (CET)
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
X-Inumbo-ID: 2bd7e4d5-7d6f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lmJV+nEfac8rYyZCNOKz1/JoPqyiGxHHzDskfJ+N8QM=;
  b=VPavDk1DGl+nq8AYa+J7GpFLXH+M7yut5r74LOA37h2UEUB5WVSFZ5m9
   NwhDBNsy4LgkZFtjIV1211Y7nWiLdBzF3syvl6dvCyg8CqFEtajxln6er
   yeHUl38VSkWIQZ7HESNOskWTnYw4GtvTceSsEGQdavLgmZ36tw4swAn1r
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88310945
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:olIxF6Mj6laDLiTvrR2rl8FynXyQoLVcMsEvi/4bfWQNrUomhGNWy
 WEfDDvUP/bfYDfyKdElbI+//R4AuZHQndVgTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5wJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rdvCmxz9
 eYeEikiYkCtod6c0OOHSeY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJ8yguauwGX4aTpbgFmUubA28y7YywkZPL3FYIqOI4TbGZg9ckCwg
 mz3217bASEhEfuSkCWM1VHym8SQknauMG4VPOLhraM76LGJ/UQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdxGxvnOspBMXXNtUVeog52ml1a788wufQG8eQVZ8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1p6+foA6yIy4vNEAONQEicSEVsuXgr9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNT9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQQ3d3XC3273k5JGQWy3yG8WGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq6D6mOP4MfMsAtKmdrGR2CgmbJjwjQfLUEy/lja
 f93j+7yZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePiNKjiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacicSBqWM2q9pIIJoZu4GNOQQkcNhMY+pt5E6QNokifvrugE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:Y/k3x63gGj01MHQBzg5v4AqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="88310945"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 10/11] tools/ocaml/xenstored: validate config file before live update
Date: Fri, 16 Dec 2022 18:25:19 +0000
Message-ID: <a9414ef542c7c5c7f1423efdf1a117431ae569b6.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The configuration file can contain typos or various errors that could prevent
live update from succeeding (e.g. a flag only valid on a different version).
Unknown entries in the config file would be ignored on startup normally,
add a strict --config-test that live-update can use to check that the config file
is valid *for the new binary*.

For compatibility with running old code during live update recognize
--live --help as an equivalent to --config-test.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changes since v2:
* repost of lost patch from 2021: https://patchwork.kernel.org/project/xen-devel/patch/a53934dfa8ef984bffa858cc573cc7a6445bbdc0.1620755942.git.edvin.torok@citrix.com/
---
 tools/ocaml/xenstored/parse_arg.ml | 26 ++++++++++++++++++++++++++
 tools/ocaml/xenstored/xenstored.ml | 11 +++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/xenstored/parse_arg.ml b/tools/ocaml/xenstored/parse_arg.ml
index 1a85b14ef5..b159b91f00 100644
--- a/tools/ocaml/xenstored/parse_arg.ml
+++ b/tools/ocaml/xenstored/parse_arg.ml
@@ -26,8 +26,14 @@ type config =
     restart: bool;
     live_reload: bool;
     disable_socket: bool;
+    config_test: bool;
   }
 
+let get_config_filename config_file =
+  match config_file with
+  | Some name -> name
+  | None      -> Define.default_config_dir ^ "/oxenstored.conf"
+
 let do_argv =
   let pidfile = ref "" and tracefile = ref "" (* old xenstored compatibility *)
   and domain_init = ref true
@@ -38,6 +44,8 @@ let do_argv =
   and restart = ref false
   and live_reload = ref false
   and disable_socket = ref false
+  and config_test = ref false
+  and help = ref false
   in
 
   let speclist =
@@ -55,10 +63,27 @@ let do_argv =
       ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
       ("--restart", Arg.Set restart, "Read database on starting");
       ("--live", Arg.Set live_reload, "Read live dump on startup");
+      ("--config-test", Arg.Set config_test, "Test validity of config file");
       ("--disable-socket", Arg.Unit (fun () -> disable_socket := true), "Disable socket");
+      ("--help", Arg.Set help, "Display this list of options")
     ] in
   let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket]" in
   Arg.parse speclist (fun _ -> ()) usage_msg;
+  let () =
+    if !help then begin
+      if !live_reload then
+        (*
+          Transform --live --help into --config-test for backward compat with
+          running code during live update.
+          Caller will validate config and exit
+        *)
+        config_test := true
+      else begin
+        Arg.usage_string speclist usage_msg |> print_endline;
+        exit 0
+      end
+    end
+  in
   {
     domain_init = !domain_init;
     activate_access_log = !activate_access_log;
@@ -70,4 +95,5 @@ let do_argv =
     restart = !restart;
     live_reload = !live_reload;
     disable_socket = !disable_socket;
+    config_test = !config_test;
   }
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 366437b396..1aaa3e995e 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -88,7 +88,7 @@ let default_pidfile = Paths.xen_run_dir ^ "/xenstored.pid"
 
 let ring_scan_interval = ref 20
 
-let parse_config filename =
+let parse_config ?(strict=false) filename =
   let pidfile = ref default_pidfile in
   let options = [
     ("merge-activate", Config.Set_bool Transaction.do_coalesce);
@@ -129,11 +129,12 @@ let parse_config filename =
     ("xenstored-port", Config.Set_string Domains.xenstored_port); ] in
   begin try Config.read filename options (fun _ _ -> raise Not_found)
     with
-    | Config.Error err -> List.iter (fun (k, e) ->
+    | Config.Error err as e -> List.iter (fun (k, e) ->
         match e with
         | "unknown key" -> eprintf "config: unknown key %s\n" k
         | _             -> eprintf "config: %s: %s\n" k e
       ) err;
+      if strict then raise e
     | Sys_error m -> eprintf "error: config: %s\n" m;
   end;
   !pidfile
@@ -358,6 +359,12 @@ let tweak_gc () =
 let () =
   Printexc.set_uncaught_exception_handler Logging.fallback_exception_handler;
   let cf = do_argv in
+  if cf.config_test then begin
+    let path = config_filename cf in
+    let _pidfile:string = parse_config ~strict:true path in
+    Printf.printf "Configuration valid at %s\n%!" path;
+    exit 0
+  end;
   let pidfile =
     if Sys.file_exists (config_filename cf) then
       parse_config (config_filename cf)
-- 
2.34.1


