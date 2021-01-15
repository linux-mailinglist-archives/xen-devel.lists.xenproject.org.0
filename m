Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864872F8875
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68679.123036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xbt-0007Og-Fr; Fri, 15 Jan 2021 22:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68679.123036; Fri, 15 Jan 2021 22:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Xbt-0007O8-BS; Fri, 15 Jan 2021 22:30:25 +0000
Received: by outflank-mailman (input) for mailman id 68679;
 Fri, 15 Jan 2021 22:30:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0Xbs-00062b-8r
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:30:24 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef7b5529-d612-4839-bc0f-62c474490687;
 Fri, 15 Jan 2021 22:29:59 +0000 (UTC)
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
X-Inumbo-ID: ef7b5529-d612-4839-bc0f-62c474490687
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610749799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ChX2rsVn5ssD/dNJKc5/y7eY+C7iouZky4Y2USpFMDg=;
  b=H6sUoNR2i7+FwKh1s7RElUORLN1i5UTL7SXUSmU8OMyW7NLHrAUo9pI9
   9N9vYG6l9WEgmhNLKHK51QOMHMWU5L3GMPWDlUtfGfDs2rqQ/GW7wIy5U
   KESqckmy5KrKdmgSf7s0yoKt2FKuTYg4aUVPVFkvhQjmLqhm7Zd6Ju2f3
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mHx+RKLkQwzT3oeD7dsMnyR42Pl540jrfqcz7L7sfXLrey9EYa01zjmVv4vetuOp0N8lNlWXUG
 UczC7I/oZuEu7xb9VYVO9QS9+nyEy89N9W1YJGoC1vp/IDoQwxAN3g+u4eYnFv5FQW+8GE4Bw2
 iEZ7VTKFerwgBtIkj4y2c/gyoAnhia0FmkOdnZHkk/iOO/FVAqVf9U5Ca+CJOett8qdCSdiz3V
 D0b5qENmEU3sBb+AZGYy3neH6v5o9rtq4VmTZRNnco8te6VujdIjgUTu/oNUCMHpnPZzoDURY/
 lDw=
X-SBRS: 5.1
X-MesageID: 35434458
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35434458"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Pau Ruiz Safont
	<pau.safont@citrix.com>
Subject: [PATCH v2 6/8] tools/ocaml/xenstored: add cooperative live-update command
Date: Fri, 15 Jan 2021 22:28:48 +0000
Message-ID: <0ed42a4cb25f53620c31594de9949f150c4833cc.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See docs/misc/xenstore.txt for documentation on live-update command.
Validate that the binary exists and that the cmdline is valid,
to prevent typos from taking down xenstore
(if live-update fails there is no way back due to the use of execve).

Live update only proceeds if there are no active transactions,
and no unprocess input or unflushed output.
It is not yet possible to force the live-update.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Reviewed-by: Pau Ruiz Safont <pau.safont@citrix.com>
Reviewed-by: Christian Lindig <christian.lindig@citrix.com>

---
Changed since V1:
* post publicly now that the XSA is out
---
 tools/ocaml/xenstored/process.ml | 112 +++++++++++++++++++++++++++++++
 tools/ocaml/xenstored/stdext.ml  |   6 ++
 2 files changed, 118 insertions(+)

diff --git a/tools/ocaml/xenstored/process.ml b/tools/ocaml/xenstored/process.ml
index 437d2dcf9e..c3c5dc58c0 100644
--- a/tools/ocaml/xenstored/process.ml
+++ b/tools/ocaml/xenstored/process.ml
@@ -15,6 +15,7 @@
  *)
 
 let error fmt = Logging.error "process" fmt
+let warn fmt = Logging.warn "process" fmt
 let info fmt = Logging.info "process" fmt
 let debug fmt = Logging.debug "process" fmt
 
@@ -84,11 +85,122 @@ let create_implicit_path t perm path =
 		List.iter (fun s -> Transaction.mkdir ~with_watch:false t perm s) ret
 	)
 
+module LiveUpdate = struct
+type t =
+	{ binary: string
+		; cmdline: string list
+		; deadline: float
+	; force: bool
+	; pending: bool }
+
+let state =
+	ref
+		{ binary= Sys.executable_name
+		; cmdline= []
+		; deadline= 0.
+		; force= false
+		; pending= false }
+
+let debug = Printf.eprintf
+
+let args_of_t t = (t.binary, "--restart" :: t.cmdline)
+
+let string_of_t t =
+	let executable, rest = args_of_t t in
+	Filename.quote_command executable rest
+
+let launch_exn t =
+	let executable, rest = args_of_t t in
+	let args = Array.of_list (executable :: rest) in
+	Unix.execv args.(0) args
+
+let validate_exn t =
+	(* --help must be last to check validity of earlier arguments *)
+	let t = {t with cmdline= t.cmdline @ ["--help"]} in
+	let cmd = string_of_t t in
+	debug "Executing %s" cmd ;
+	match Unix.fork () with
+	| 0 ->
+		 ( try launch_exn t with _ -> exit 2 )
+	| pid -> (
+	match Unix.waitpid [] pid with
+		| _, Unix.WEXITED 0 ->
+				debug "Live update validated cmdline %s" cmd;
+		t
+	| _, Unix.WEXITED n ->
+		invalid_arg (Printf.sprintf "Command %s exited with code %d" cmd n)
+	| _, Unix.WSIGNALED n ->
+		invalid_arg
+		  (Printf.sprintf "Command %s killed by ocaml signal number %d" cmd n)
+	| _, Unix.WSTOPPED n ->
+		invalid_arg
+		  (Printf.sprintf "Command %s stopped by ocaml signal number %d" cmd n)
+	)
+
+let parse_live_update args =
+	try
+	(state :=
+		match args with
+		| ["-f"; file] ->
+			validate_exn {!state with binary= file}
+		| ["-a"] ->
+			debug "Live update aborted" ;
+			{!state with pending= false}
+		| "-c" :: cmdline ->
+			validate_exn {!state with cmdline}
+		| "-s" :: _ ->
+			let timeout = ref 60 in
+			let force = ref false in
+			Arg.parse_argv ~current:(ref 1) (Array.of_list args)
+				[ ( "-t"
+				, Arg.Set_int timeout
+				, "timeout in seconds to wait for active transactions to finish"
+				)
+			(*; ( "-F"
+				, Arg.Set force
+				, "force live update to happen even with running transactions \
+				   after timeout elapsed" )*) ]
+			(fun x -> raise (Arg.Bad x))
+			"live-update -s" ;
+			debug "Live update process queued" ;
+				{!state with deadline = Unix.gettimeofday () +. float !timeout
+				; force= !force; pending= true}
+		| _ ->
+			invalid_arg ("Unknown arguments: " ^ String.concat " " args)) ;
+	None
+	with
+	| Arg.Bad s | Arg.Help s | Invalid_argument s ->
+		Some s
+	| Unix.Unix_error (e, fn, args) ->
+		Some (Printf.sprintf "%s(%s): %s" fn args (Unix.error_message e))
+
+	let should_run cons =
+		let t = !state in
+		if t.pending then begin
+			match Connections.prevents_quit cons with
+			| [] -> true
+			| _ when Unix.gettimeofday () < t.deadline -> false
+			| l ->
+				 info "Live update timeout reached: %d active connections" (List.length l);
+				 List.iter (fun con -> warn "%s prevents live update" (Connection.get_domstr con)) l;
+				 if t.force then begin
+					 warn "Live update forced, some domain connections may break!";
+					 true
+				 end else begin
+					 warn "Live update aborted, try migrating or shutting down the domains/toolstack";
+					 state := { t with pending = false };
+					 false
+				end
+		end else false
+end
+
 (* packets *)
 let do_debug con t _domains cons data =
 	if not (Connection.is_dom0 con) && not !allow_debug
 	then None
 	else try match split None '\000' data with
+	| "live-update" :: params ->
+		LiveUpdate.parse_live_update params
 	| "print" :: msg :: _ ->
 		Logging.xb_op ~tid:0 ~ty:Xenbus.Xb.Op.Debug ~con:"=======>" msg;
 		None
diff --git a/tools/ocaml/xenstored/stdext.ml b/tools/ocaml/xenstored/stdext.ml
index 4f2f3a2c8c..e1567c4dfa 100644
--- a/tools/ocaml/xenstored/stdext.ml
+++ b/tools/ocaml/xenstored/stdext.ml
@@ -44,6 +44,12 @@ let default d v =
 let maybe f v =
 	match v with None -> () | Some x -> f x
 
+module Filename = struct
+	include Filename
+	let quote_command cmd args =
+		cmd :: args |> List.map quote |> String.concat " "
+end
+
 module String = struct include String
 
 let of_char c = String.make 1 c
-- 
2.29.2


