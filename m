Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD71247233
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 20:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7k3j-0006Nc-Jd; Mon, 17 Aug 2020 18:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7k3i-0006KG-0W
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 18:40:38 +0000
X-Inumbo-ID: 45d39570-92d6-405a-a911-59ef7c0eb7d1
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45d39570-92d6-405a-a911-59ef7c0eb7d1;
 Mon, 17 Aug 2020 18:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597689633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jwr6W7VdvDSBzVBwOidlGCgXyRsM0JTbKS0k1mHOFbY=;
 b=GLWK0n8WqdONLNI0WjS7tamQI1pT0uIWRf2TrsmdxGH2UEhAKjGbqsS5
 W2mASVlWhzaxDHRJnrRXeSYlgFVW9ninHA2uLOY7fPatjEKch0QXiQxq4
 rMmjS0xzj4cvh5z6e8oUVApQ3SmCq+BGG1fYHD5MZN5n1mmvNZp9m+p+N 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EI5h0kvZl45u5ieBNH6sJI44dC0zrqtN/gMp2gs/uBBHfMHQPXkRuG8yZINEaNDl78pAJPImB0
 jWYy/R7EsqnNgnNRrMkznFvYzYQSWm01Rf9o5S6HQFvuuSjjmiV7N5ccWayJKGOffxl9n0FK2F
 o0ySVN02PBnmgW26UsPdNRdBIII11N+mxvg1UZ4QtXrFgb0nmTrtJ5bZJWreBW96mLJFKPM7jW
 EQC58zW4DmRBdpFcZ7oH6nOx2j2p2DRRcT7MaD39dSwa+yqLtMkZ0VU56MUhSRvpbIP6WO81Ne
 jTg=
X-SBRS: 2.7
X-MesageID: 24692807
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,324,1592884800"; d="scan'208";a="24692807"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/6] tools/ocaml/xenstored: drop select based socket
 watching
Date: Mon, 17 Aug 2020 19:39:52 +0100
Message-ID: <bb1423a37560bbb9b655fef116c7c31346665529.1597689211.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1597689211.git.edvin.torok@citrix.com>
References: <cover.1597689211.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Poll has been the default since 2014, I think we can safely say by now
that poll() works and we don't need to fall back to select().

This will allow fixing up the way we call poll to be more efficient
(and pave the way for introducing epoll support):
currently poll wraps the select API, which is inefficient.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
Changed since v1:
 * fix commit title
---
 tools/ocaml/xenstored/Makefile                 | 12 ++++++------
 tools/ocaml/xenstored/parse_arg.ml             |  7 ++-----
 tools/ocaml/xenstored/{select.ml => poll.ml}   | 14 ++------------
 tools/ocaml/xenstored/{select.mli => poll.mli} | 12 ++----------
 tools/ocaml/xenstored/xenstored.ml             |  4 +---
 5 files changed, 13 insertions(+), 36 deletions(-)
 rename tools/ocaml/xenstored/{select.ml => poll.ml} (85%)
 rename tools/ocaml/xenstored/{select.mli => poll.mli} (58%)

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index 68d35c483a..692a62584e 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -18,12 +18,12 @@ OCAMLINCLUDE += \
 	-I $(OCAML_TOPLEVEL)/libs/xc \
 	-I $(OCAML_TOPLEVEL)/libs/eventchn
 
-LIBS = syslog.cma syslog.cmxa select.cma select.cmxa
+LIBS = syslog.cma syslog.cmxa poll.cma poll.cmxa
 syslog_OBJS = syslog
 syslog_C_OBJS = syslog_stubs
-select_OBJS = select
-select_C_OBJS = select_stubs
-OCAML_LIBRARY = syslog select
+poll_OBJS = poll
+poll_C_OBJS = select_stubs
+OCAML_LIBRARY = syslog poll
 
 LIBS += systemd.cma systemd.cmxa
 systemd_OBJS = systemd
@@ -58,13 +58,13 @@ OBJS = paths \
 	process \
 	xenstored
 
-INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi select.cmi
+INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
 
 XENSTOREDLIBS = \
 	unix.cmxa \
 	-ccopt -L -ccopt . syslog.cmxa \
 	-ccopt -L -ccopt . systemd.cmxa \
-	-ccopt -L -ccopt . select.cmxa \
+	-ccopt -L -ccopt . poll.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/mmap $(OCAML_TOPLEVEL)/libs/mmap/xenmmap.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
diff --git a/tools/ocaml/xenstored/parse_arg.ml b/tools/ocaml/xenstored/parse_arg.ml
index 1803c3eda0..2c4b5a8528 100644
--- a/tools/ocaml/xenstored/parse_arg.ml
+++ b/tools/ocaml/xenstored/parse_arg.ml
@@ -25,7 +25,6 @@ type config =
 	tracefile: string option; (* old xenstored compatibility *)
 	restart: bool;
 	disable_socket: bool;
-	use_select: bool;
 }
 
 let do_argv =
@@ -37,7 +36,7 @@ let do_argv =
 	and config_file = ref ""
 	and restart = ref false
 	and disable_socket = ref false
-	and use_select = ref false in
+	in
 
 	let speclist =
 		[ ("--no-domain-init", Arg.Unit (fun () -> domain_init := false),
@@ -54,9 +53,8 @@ let do_argv =
 		  ("-T", Arg.Set_string tracefile, ""); (* for compatibility *)
 		  ("--restart", Arg.Set restart, "Read database on starting");
 		  ("--disable-socket", Arg.Unit (fun () -> disable_socket := true), "Disable socket");
-		  ("--use-select", Arg.Unit (fun () -> use_select := true), "Use select instead of poll"); (* for backward compatibility and testing *)
 		] in
-	let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket] [--use-select]" in
+	let usage_msg = "usage : xenstored [--config-file <filename>] [--no-domain-init] [--help] [--no-fork] [--reraise-top-level] [--restart] [--disable-socket]" in
 	Arg.parse speclist (fun _ -> ()) usage_msg;
 	{
 		domain_init = !domain_init;
@@ -68,5 +66,4 @@ let do_argv =
 		tracefile = if !tracefile <> "" then Some !tracefile else None;
 		restart = !restart;
 		disable_socket = !disable_socket;
-		use_select = !use_select;
 	}
diff --git a/tools/ocaml/xenstored/select.ml b/tools/ocaml/xenstored/poll.ml
similarity index 85%
rename from tools/ocaml/xenstored/select.ml
rename to tools/ocaml/xenstored/poll.ml
index 0455e163e3..26f8620dfc 100644
--- a/tools/ocaml/xenstored/select.ml
+++ b/tools/ocaml/xenstored/poll.ml
@@ -63,15 +63,5 @@ let poll_select in_fds out_fds exc_fds timeout =
 			 (if event.except then fd :: x else x))
 			a r
 
-(* If the use_poll function is not called at all, we default to the original Unix.select behavior *)
-let select_fun = ref Unix.select
-
-let use_poll yes =
-	let sel_fun, max_fd =
-		if yes then poll_select, get_sys_fs_nr_open ()
-		else Unix.select, 1024 in
-	select_fun := sel_fun;
-	set_fd_limit max_fd
-
-let select in_fds out_fds exc_fds timeout =
-	(!select_fun) in_fds out_fds exc_fds timeout
+let () =
+        set_fd_limit (get_sys_fs_nr_open ())
diff --git a/tools/ocaml/xenstored/select.mli b/tools/ocaml/xenstored/poll.mli
similarity index 58%
rename from tools/ocaml/xenstored/select.mli
rename to tools/ocaml/xenstored/poll.mli
index 3912779172..f73465b99f 100644
--- a/tools/ocaml/xenstored/select.mli
+++ b/tools/ocaml/xenstored/poll.mli
@@ -13,15 +13,7 @@
  *)
 
 
-(** Same interface and semantics as [Unix.select] but with an extra alternative
-    implementation based on poll. Switching implementations is done by calling
-     the [use_poll] function. *)
-val select:
+(** Same interface and semantics as [Unix.select], implemented using poll(3). *)
+val poll_select:
 	Unix.file_descr list -> Unix.file_descr list -> Unix.file_descr list -> float
 	-> Unix.file_descr list * Unix.file_descr list * Unix.file_descr list
-
-(** [use_poll true] will use poll based select with max fds number limitation
-   eliminated; [use_poll false] will use standard [Unix.select] with max fd
-   number set to 1024; not calling this function at all equals to use the
-   standard [Unix.select] with max fd number setting untouched. *)
-val use_poll: bool -> unit
diff --git a/tools/ocaml/xenstored/xenstored.ml b/tools/ocaml/xenstored/xenstored.ml
index 047e093555..f3e4697dea 100644
--- a/tools/ocaml/xenstored/xenstored.ml
+++ b/tools/ocaml/xenstored/xenstored.ml
@@ -308,8 +308,6 @@ let _ =
 		);
 	);
 
-	Select.use_poll (not cf.use_select);
-
 	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
 	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ -> quit := true));
 	Sys.set_signal Sys.sigusr1 (Sys.Signal_handle (fun _ -> sigusr1_handler store));
@@ -441,7 +439,7 @@ let _ =
 		let inset, outset = Connections.select ~only_if:is_peaceful cons in
 		let rset, wset, _ =
 		try
-			Select.select (spec_fds @ inset) outset [] timeout
+			Poll.poll_select (spec_fds @ inset) outset [] timeout
 		with Unix.Unix_error(Unix.EINTR, _, _) ->
 			[], [], [] in
 		let sfds, cfds =
-- 
2.25.1


