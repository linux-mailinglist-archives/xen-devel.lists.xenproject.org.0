Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C333634001
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447225.703226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5D-0000o1-1c; Tue, 22 Nov 2022 15:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447225.703226; Tue, 22 Nov 2022 15:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxV5C-0000jq-Q2; Tue, 22 Nov 2022 15:21:10 +0000
Received: by outflank-mailman (input) for mailman id 447225;
 Tue, 22 Nov 2022 15:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahN6=3W=citrix.com=prvs=318e6c854=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oxV5A-0000Pt-HL
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 15:21:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47ec3dae-6a79-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 16:21:06 +0100 (CET)
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
X-Inumbo-ID: 47ec3dae-6a79-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669130466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=alWsFEiT/W2vR+rSP2qESkFw75Vrqo0QEbh3ZtJ0hE4=;
  b=O0Clf8tI+2zo2sFTict72Q6P0A6uAiLP5BvrabDriYq0lyPgbly+hRrv
   BN3tOKRgve5PnP5Repa+bAM+VvHYjTwKue9YeT+Mr4x3oMJ1DXu6s7uYO
   Vo1g273n446AEx0KbA3iHg33Bs0GDnWkEqYtN25PKyfETYzcL/RmP9VwE
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85360549
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zzVsDauHIailmdrr4jvyaEIcUufnVAReMUV32f8akzHdYApBsoF/q
 tZmKTrQb/aNMDOheYsjYY2xpB4O6pHTmtZrHAFvpSk0F3xE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QaEzSFJZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCjwnUiqs3vuMwo20eO0yq+4MB867M9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27I+
 zmYpzmlU3n2MvTG8hvfzHS1gNTguh7kG9ouPaeJ/M9D1Qj7Kms7V0RNCArTTeOCokK3Rd93M
 UEf/Ssq668o+ySDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1q/+p2olxzrIBIXEmAwYXEpZyQu5Ins9dRbYg30cjpzLEKkpoSrR2Cok
 2vT/XlWa6Y71pBSifjilbzTq3f1/8WSEFZojunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Kz6zfWNEkqQQzd6TNDhz0k5NjFKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX0PPcqPtzuUZp0ksAM8OgJsdiNPrJzjmVZLlfbrEmCm2bNt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLqxQ1iNcWK+FX7T27eK0XODz9jObOPyfME+9t3ZnnRrlR0Z5oaT79q
 753X/ZmAT0GOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:EGspqaik0FwumPxo0MLjia6tSnBQXtwji2hC6mlwRA09TySZ//
 rAoB19726TtN9xYgBGpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFeaTN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.96,184,1665460800"; 
   d="scan'208";a="85360549"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 7/8] tools/oxenstored: Set uncaught exception handler
Date: Tue, 22 Nov 2022 15:20:42 +0000
Message-ID: <20221122152043.8518-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221122152043.8518-1-andrew.cooper3@citrix.com>
References: <20221122152043.8518-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Unhandled exceptions go to stderr by default, but this doesn't typically work
for oxenstored because:
 * daemonize reopens stderr as /dev/null
 * systemd redirects stderr to /dev/null too

Debugging an unhandled exception requires reproducing the issue locally when
using --no-fork, and is not conducive to figuring out what went wrong on a
remote system.

Install a custom handler which also tries to render the backtrace to the
configured syslog facility, and DAEMON|ERR otherwise.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>

Drop print_flush as prerr_endline already flushes.
---
 tools/ocaml/xenstored/logging.ml   | 29 +++++++++++++++++++++++++++++
 tools/ocaml/xenstored/xenstored.ml |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/logging.ml b/tools/ocaml/xenstored/logging.ml
index 39c3036155a2..255051437d60 100644
--- a/tools/ocaml/xenstored/logging.ml
+++ b/tools/ocaml/xenstored/logging.ml
@@ -342,3 +342,32 @@ let xb_answer ~tid ~con ~ty data =
 let watch_not_fired ~con perms path =
 	let data = Printf.sprintf "EPERM perms=[%s] path=%s" perms path in
 	access_logging ~tid:0 ~con ~data Watch_not_fired ~level:Info
+
+let msg_of exn bt =
+	Printf.sprintf "Fatal exception: %s\n%s\n" (Printexc.to_string exn)
+		(Printexc.raw_backtrace_to_string bt)
+
+let fallback_exception_handler exn bt =
+	(* stderr goes to /dev/null, so use the logger where possible,
+	   but always print to stderr too, in case everything else fails,
+	   e.g. this can be used to debug with --no-fork
+
+	   this function should try not to raise exceptions, but if it does
+	   the ocaml runtime should still print the exception, both the original,
+	   and the one from this function, but to stderr this time
+	 *)
+	let msg = msg_of exn bt in
+	prerr_endline msg;
+	(* See Printexc.set_uncaught_exception_handler, need to flush,
+	   so has to call stop and flush *)
+	match !xenstored_logger with
+	| Some l -> error "xenstored-fallback" "%s" msg; l.stop ()
+	| None ->
+		(* Too early, no logger set yet.
+		   We normally try to use the configured logger so we don't flood syslog
+		   during development for example, or if the user has a file set
+		 *)
+		try Syslog.log Syslog.Daemon Syslog.Err msg
+		with e ->
+			let bt = Printexc.get_raw_backtrace () in
+			prerr_endline @@ msg_of e bt
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 23621bd49397..257481285f05 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -357,7 +357,8 @@ let tweak_gc () =
 	Gc.set { (Gc.get ()) with Gc.max_overhead = !Define.gc_max_overhead }
 
 
-let _ =
+let () =
+	Printexc.set_uncaught_exception_handler Logging.fallback_exception_handler;
 	let cf = do_argv in
 	let pidfile =
 		if Sys.file_exists (config_filename cf) then
-- 
2.11.0


