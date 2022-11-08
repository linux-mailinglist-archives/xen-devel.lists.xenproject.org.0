Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E00621881
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 16:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440162.694281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhR-0007Jb-Ts; Tue, 08 Nov 2022 15:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440162.694281; Tue, 08 Nov 2022 15:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osQhR-0007Gn-Pu; Tue, 08 Nov 2022 15:39:41 +0000
Received: by outflank-mailman (input) for mailman id 440162;
 Tue, 08 Nov 2022 15:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OwR=3I=citrix.com=prvs=304cef38d=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1osQhQ-0007Fx-Dg
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 15:39:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d4e3290-5f7b-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 16:39:39 +0100 (CET)
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
X-Inumbo-ID: 8d4e3290-5f7b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667921978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hQno2BG9QzWV381/kBdkjocEF/Hky2yAxo4hwyxhbW8=;
  b=JiG3Z1Flq52+kfeCl1udaItI2Lijp/awhDhrsN6iQfsZ03wLHs/mvsYi
   EupEGgSRKMiz/iMr9hCRP9AUFTQtRQPGVgp/ZYMmEYJ1ExLlJN3+HgUd6
   LaMY4hw8vVArcV2hipHLPuLMOeTTdqWeGp/kM1nR3v/n5Awb8Ohm1b6sr
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 83478170
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sesTT64v/yz9bk3iZOQfzgxRtDTHchMFZxGqfqrLsTDasY5as4F+v
 mdLUTrQOPyMN2LxKI1+bIiwp0sE6p6Byd8ySQZkpSo8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKkT7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 NY0JmA3NBO5nvuRw7eZQcMxhZhkBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAi3XhcjsetFWPoqkf6GnP1g1hlrPqNbI5f/TaHpkKzh/H/
 goq+Uz5KUsVaeetywGl0W3zmebPmwrqd40rQejQGvlC3wTImz175ActfVeyv/SRkEO1XNNbb
 UsO9UIGsqwa5EGtCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcWSDowx
 xm2ltXmLTV1tfueTnf1y1uPhWrsY25PdzZEPHJaC1teizX+nG0tpi/lYtgzKvS2tMTsPjL14
 Tug8StiwJxG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZ0+9pWGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcx6By+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romxezP
 ic/WisLvve/2UdGiocmC79d8+xwkcDd+S3ND5g5rrNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FL5n8UShDUfw9kmreqwIhPVgDn35W+I8ubcqjk0TPPUS2OBZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8QWmKZNRW03wY8TXMGr9JYMLbbTe2KL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:aepYbK7oWaexfs/5UgPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="83478170"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v3 13/15] tools/ocaml/xenstored: set uncaught exception handler
Date: Tue, 8 Nov 2022 15:34:05 +0000
Message-ID: <a370618057664382fe9e6e503e0dc0be8818e5ce.1667920496.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667920496.git.edvin.torok@citrix.com>
References: <cover.1667920496.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Helps debug fatal errors during live update

Previously this would've just gone to /dev/null, because:
* daemonize reopens stderr as /dev/null
* systemd redirects stderr to /dev/null too

Previously the only way to debug this was to manually run oxenstored with
--no-fork, but when you have a fatal error and oxenstored just
disappears you'd want to know why.
There has been at least one observed instance of a bug where oxenstored
just disappeared inexplicably (it was believed due to an OOM exception).

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Reason for inclusion in 4.17:
- avoids losing crucial information during a fatal error (e.g. during
  live update)

Changes since v2:
- new in v3
---
 tools/ocaml/xenstored/logging.ml   | 33 ++++++++++++++++++++++++++++++
 tools/ocaml/xenstored/xenstored.ml |  3 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/logging.ml b/tools/ocaml/xenstored/logging.ml
index 021ebc465b..cced038c48 100644
--- a/tools/ocaml/xenstored/logging.ml
+++ b/tools/ocaml/xenstored/logging.ml
@@ -342,3 +342,36 @@ let xb_answer ~tid ~con ~ty data =
 let watch_not_fired ~con perms path =
   let data = Printf.sprintf "EPERM perms=[%s] path=%s" perms path in
   access_logging ~tid:0 ~con ~data Watch_not_fired ~level:Info
+
+let print_flush msg =
+  prerr_endline msg;
+  flush stderr
+
+let msg_of exn bt =
+  Printf.sprintf "Fatal exception: %s\n%s\n" (Printexc.to_string exn)
+    (Printexc.raw_backtrace_to_string bt)
+
+let fallback_exception_handler exn bt =
+  (* stderr goes to /dev/null, so use the logger where possible,
+     but always print to stderr too, in case everything else fails,
+     e.g. this can be used to debug with --no-fork
+
+     this function should try not to raise exceptions, but if it does
+     the ocaml runtime should still print the exception, both the original,
+     and the one from this function, but to stderr this time
+  *)
+  let msg = msg_of exn bt in
+  print_flush msg;
+  (* See Printexc.set_uncaught_exception_handler, need to flush,
+     so has to call stop and flush *)
+  match !xenstored_logger with
+  | Some l -> error "xenstored-fallback" "%s" msg; l.stop ()
+  | None ->
+    (* Too early, no logger set yet.
+       We normally try to use the configured logger so we don't flood syslog
+       during development for example, or if the user has a file set
+    *)
+    try Syslog.log Syslog.Daemon Syslog.Err msg
+    with e ->
+      let bt = Printexc.get_raw_backtrace () in
+      print_flush @@ msg_of e bt
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 78177b116f..6828764f92 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -357,7 +357,8 @@ let tweak_gc () =
   Gc.set { (Gc.get ()) with Gc.max_overhead = !Define.gc_max_overhead }
 
 
-let _ =
+let () =
+  Printexc.set_uncaught_exception_handler Logging.fallback_exception_handler;
   let cf = do_argv in
   let pidfile =
     if Sys.file_exists (config_filename cf) then
-- 
2.34.1


