Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E167695B12C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 11:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781627.1191131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nL-0003Qx-CV; Thu, 22 Aug 2024 09:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781627.1191131; Thu, 22 Aug 2024 09:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nL-0003Ha-5m; Thu, 22 Aug 2024 09:07:51 +0000
Received: by outflank-mailman (input) for mailman id 781627;
 Thu, 22 Aug 2024 09:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8+D=PV=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1sh3mG-00031f-CA
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 09:06:44 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d946fc37-6065-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 11:06:42 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so73624966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 02:06:42 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2e6717sm88948266b.96.2024.08.22.02.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 02:06:41 -0700 (PDT)
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
X-Inumbo-ID: d946fc37-6065-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724317602; x=1724922402; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apMXWG5KKVJZvsURjvsfLTCaQHUpHrA7Cdja1G+UXWs=;
        b=AruAVyGQhVxatR+S7RPsTdJQbBYUU+BuJeSW0pwuA7OM11GEVF8vwWfBe4vGyUFF4Q
         jmtskHDsuzH8VrvuAgbmE0O72JC1iE01jZXI0lQUXVgJ/6RahRxa0fei/7dyYMmpLle/
         ZyqmmO4sTkg3oaokOLosDQnNQgv9uPaT2FZ5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724317602; x=1724922402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apMXWG5KKVJZvsURjvsfLTCaQHUpHrA7Cdja1G+UXWs=;
        b=CwHSREgkjHOMDXbS6eYHJFmFIGqIwb1GN5KQqgCmgf3DV+hu0hTzyUPNBoC8fQ5x7w
         I0DfvVU1jUogULuhRH8duxZQTeIJSM7fEcCQyhgUxGbiAji7OMOfTY8LBrL71u/Lpeib
         HD82cibKeEELiBXf/tR/yq02UyvXo46s1QyRPcFS7o60SnVHo+61rpHwZBpfcPATk06G
         lWP5u3c9b6LOsJuOh38C93J0TYRw2IDu9K2oZYYnjgiCH5/zkS+mO8CUDX7ZxVS+wJKb
         bz7sdOeFyHIXX2A0PG2doLbuT4y+u1BNCNIqJ1xIXvVTzGcjmFnrVWqNMVZjNc36vcsd
         vzpg==
X-Gm-Message-State: AOJu0Yw9Owy8/RWXqh/eeqsBWc7lKo6xbqZGrvcyiX3NWptEwW8ucwqZ
	h/hMXoBUYAYKlIIRBcaCI2E5SQKLJ03scXRWv6zjsjnhMIBj4XBDy8vNO7dr53jOka8CP8LO5z+
	T7mA=
X-Google-Smtp-Source: AGHT+IErlCYaMdMcS77XZoDN4Dk2S07zgJchi44QkpyQRX2Xr3FKCRaBdbA86xHlcke/JOJlC4Ge8A==
X-Received: by 2002:a17:907:808:b0:a77:e48d:bc8 with SMTP id a640c23a62f3a-a866f27a0d1mr448033366b.21.1724317601732;
        Thu, 22 Aug 2024 02:06:41 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v1 3/4] tools/oxenstored: Use the plugin for Xenctrl.domain_getinfo
Date: Thu, 22 Aug 2024 10:06:04 +0100
Message-Id: <c40ed2c49f0d72d227a1ab2ef90be0e24e17382c.1724314239.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724314239.git.andrii.sultanov@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Oxenstored dynamically loads the plugin provided in
ocaml/libs/xenstoredglue.
The plugin is verified to be providing the specified plugin_interface
during its loading.

If a V2 of the plugin is produced, V1 will still be present, and a new
version should only be loaded if it's verified to exist
(New oxenstored can run in an environment with only V1 of the plugin).

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 Config.mk                         |  2 +-
 configure                         |  7 ++++
 m4/paths.m4                       |  4 ++
 tools/configure                   |  7 ++++
 tools/ocaml/xenstored/Makefile    |  5 ++-
 tools/ocaml/xenstored/domains.ml  | 63 +++++++++++++++++++++----------
 tools/ocaml/xenstored/paths.ml.in |  1 +
 7 files changed, 68 insertions(+), 21 deletions(-)

diff --git a/Config.mk b/Config.mk
index 1a3938b6c4..4be7d8a573 100644
--- a/Config.mk
+++ b/Config.mk
@@ -160,7 +160,7 @@ endef
 BUILD_MAKE_VARS := sbindir bindir LIBEXEC LIBEXEC_BIN libdir SHAREDIR \
                    XENFIRMWAREDIR XEN_CONFIG_DIR XEN_SCRIPT_DIR XEN_LOCK_DIR \
                    XEN_RUN_DIR XEN_PAGING_DIR XEN_DUMP_DIR XEN_LOG_DIR \
-                   XEN_LIB_DIR XEN_RUN_STORED
+                   XEN_LIB_DIR XEN_RUN_STORED XEN_CTRL_DOMAININFO_PLUGIN
 
 buildmakevars2file = $(eval $(call buildmakevars2file-closure,$(1)))
 define buildmakevars2file-closure
diff --git a/configure b/configure
index 2d7b20aa50..1a473ad2dd 100755
--- a/configure
+++ b/configure
@@ -631,6 +631,7 @@ XEN_PAGING_DIR
 XEN_LOCK_DIR
 INITD_DIR
 SHAREDIR
+XEN_CTRL_DOMAININFO_PLUGIN
 XEN_LIB_DIR
 XEN_RUN_STORED
 XEN_LOG_DIR
@@ -2199,6 +2200,12 @@ XEN_LIB_DIR=$localstatedir/lib/xen
 printf "%s\n" "#define XEN_LIB_DIR \"$XEN_LIB_DIR\"" >>confdefs.h
 
 
+XEN_CTRL_DOMAININFO_PLUGIN=$LIBEXEC_BIN/xenctrl_plugin
+
+
+printf "%s\n" "#define XEN_CTRL_DOMAININFO_PLUGIN \"$XEN_CTRL_DOMAININFO_PLUGIN\"" >>confdefs.h
+
+
 SHAREDIR=$prefix/share
 
 
diff --git a/m4/paths.m4 b/m4/paths.m4
index 3f94c62efb..e538445810 100644
--- a/m4/paths.m4
+++ b/m4/paths.m4
@@ -144,6 +144,10 @@ XEN_LIB_DIR=$localstatedir/lib/xen
 AC_SUBST(XEN_LIB_DIR)
 AC_DEFINE_UNQUOTED([XEN_LIB_DIR], ["$XEN_LIB_DIR"], [Xen's lib dir])
 
+XEN_CTRL_DOMAININFO_PLUGIN=$LIBEXEC_BIN/xenctrl_plugin
+AC_SUBST(XEN_CTRL_DOMAININFO_PLUGIN)
+AC_DEFINE_UNQUOTED([XEN_CTRL_DOMAININFO_PLUGIN], ["$XEN_CTRL_DOMAININFO_PLUGIN"], [Xenctrl's plugin for Oxenstored])
+
 SHAREDIR=$prefix/share
 AC_SUBST(SHAREDIR)
 
diff --git a/tools/configure b/tools/configure
index 7f98303fdd..24b12a1f5d 100755
--- a/tools/configure
+++ b/tools/configure
@@ -743,6 +743,7 @@ XEN_PAGING_DIR
 XEN_LOCK_DIR
 INITD_DIR
 SHAREDIR
+XEN_CTRL_DOMAININFO_PLUGIN
 XEN_LIB_DIR
 XEN_RUN_STORED
 XEN_LOG_DIR
@@ -4530,6 +4531,12 @@ XEN_LIB_DIR=$localstatedir/lib/xen
 printf "%s\n" "#define XEN_LIB_DIR \"$XEN_LIB_DIR\"" >>confdefs.h
 
 
+XEN_CTRL_DOMAININFO_PLUGIN=$LIBEXEC_BIN/xenctrl_plugin
+
+
+printf "%s\n" "#define XEN_CTRL_DOMAININFO_PLUGIN \"$XEN_CTRL_DOMAININFO_PLUGIN\"" >>confdefs.h
+
+
 SHAREDIR=$prefix/share
 
 
diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index fa45305d8c..09896732ed 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -15,7 +15,8 @@ OCAMLINCLUDE += \
 	-I $(OCAML_TOPLEVEL)/libs/xb \
 	-I $(OCAML_TOPLEVEL)/libs/mmap \
 	-I $(OCAML_TOPLEVEL)/libs/xc \
-	-I $(OCAML_TOPLEVEL)/libs/eventchn
+	-I $(OCAML_TOPLEVEL)/libs/eventchn \
+	-I $(OCAML_TOPLEVEL)/libs/xenstoredglue
 
 LIBS = syslog.cma syslog.cmxa poll.cma poll.cmxa
 syslog_OBJS = syslog
@@ -59,6 +60,7 @@ INTF = symbol.cmi trie.cmi syslog.cmi systemd.cmi poll.cmi
 
 XENSTOREDLIBS = \
 	unix.cmxa \
+	dynlink.cmxa \
 	-ccopt -L -ccopt . syslog.cmxa \
 	-ccopt -L -ccopt . systemd.cmxa \
 	-ccopt -L -ccopt . poll.cmxa \
@@ -66,6 +68,7 @@ XENSTOREDLIBS = \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/eventchn $(OCAML_TOPLEVEL)/libs/eventchn/xeneventchn.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xc $(OCAML_TOPLEVEL)/libs/xc/xenctrl.cmxa \
 	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xb $(OCAML_TOPLEVEL)/libs/xb/xenbus.cmxa \
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xenstoredglue $(OCAML_TOPLEVEL)/libs/xenstoredglue/plugin_interface_v1.cmxa \
 	-ccopt -L -ccopt $(XEN_ROOT)/tools/libs/ctrl
 
 PROGRAMS = oxenstored
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index 7a3056c364..e3edee6de6 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -20,10 +20,36 @@ let warn fmt  = Logging.warn  "domains" fmt
 
 let xc = Xenctrl.interface_open ()
 
-type domains = {
-  eventchn: Event.t;
-  table: (Xenctrl.domid, Domain.t) Hashtbl.t;
+let load_plug fname =
+  let fail_with fmt = Printf.ksprintf failwith fmt in
+  let fname = Dynlink.adapt_filename fname in
+  if Sys.file_exists fname then
+    try Dynlink.loadfile fname with
+    | Dynlink.Error err as e ->
+        Printf.eprintf "ERROR loading plugin '%s': %s\n%!" fname
+          (Dynlink.error_message err);
+        raise e
+    | _ -> fail_with "Unknown error while loading plugin"
+  else fail_with "Plugin file '%s' does not exist" fname
+
+let () =
+  let filepath = Paths.xen_ctrl_plugin ^ "/domain_getinfo_v1.cmxs" in
+  Printf.printf "Trying to load plugin '%s'\n%!" filepath;
+  let list_files = Sys.readdir Paths.xen_ctrl_plugin in
+  Printf.printf "Directory listing of '%s'\n%!" Paths.xen_ctrl_plugin;
+  Array.iter (fun x -> Printf.printf "\t%s\n%!" x) list_files;
+  Dynlink.allow_only [ "Plugin_interface_v1" ];
+  load_plug filepath
+
+module Plugin =
+  (val Plugin_interface_v1.get_plugin_v1 ()
+      : Plugin_interface_v1.Domain_getinfo_V1)
+
+let handle = Plugin.interface_open ()
 
+type domains = {
+  eventchn : Event.t;
+  table : (Plugin.domid, Domain.t) Hashtbl.t;
   (* N.B. the Queue module is not thread-safe but oxenstored is single-threaded. *)
   (* Domains queue up to regain conflict-credit; we have a queue for
      	   domains that are carrying some penalty and so are below the
@@ -93,22 +119,21 @@ let cleanup doms =
   let notify = ref false in
   let dead_dom = ref [] in
 
-  Hashtbl.iter (fun id _ -> if id <> 0 then
-                   try
-                     let info = Xenctrl.domain_getinfo xc id in
-                     if info.Xenctrl.shutdown || info.Xenctrl.dying then (
-                       debug "Domain %u died (dying=%b, shutdown %b -- code %d)"
-                         id info.Xenctrl.dying info.Xenctrl.shutdown info.Xenctrl.shutdown_code;
-                       if info.Xenctrl.dying then
-                         dead_dom := id :: !dead_dom
-                       else
-                         notify := true;
-                     )
-                   with Xenctrl.Error _ ->
-                     debug "Domain %u died -- no domain info" id;
-                     dead_dom := id :: !dead_dom;
-               ) doms.table;
-  List.iter (fun id ->
+  Hashtbl.iter
+    (fun id _ ->
+      if id <> 0 then (
+        try
+          let info = Plugin.domain_getinfo handle id in
+          if info.Plugin.shutdown || info.Plugin.dying then (
+            debug "Domain %u died (dying=%b, shutdown %b -- code %d)" id
+              info.Plugin.dying info.Plugin.shutdown info.Plugin.shutdown_code;
+            if info.Plugin.dying then dead_dom := id :: !dead_dom else notify := true)
+        with Plugin.Error _ ->
+          debug "Domain %u died -- no domain info" id;
+          dead_dom := id :: !dead_dom))
+    doms.table;
+  List.iter
+    (fun id ->
       let dom = Hashtbl.find doms.table id in
       Domain.close dom;
       Hashtbl.remove doms.table id;
diff --git a/tools/ocaml/xenstored/paths.ml.in b/tools/ocaml/xenstored/paths.ml.in
index 37949dc8f3..67276dda94 100644
--- a/tools/ocaml/xenstored/paths.ml.in
+++ b/tools/ocaml/xenstored/paths.ml.in
@@ -2,3 +2,4 @@ let xen_log_dir = "@XEN_LOG_DIR@"
 let xen_config_dir = "@XEN_CONFIG_DIR@"
 let xen_run_dir = "@XEN_RUN_DIR@"
 let xen_run_stored = "@XEN_RUN_STORED@"
+let xen_ctrl_plugin = "@XEN_CTRL_DOMAININFO_PLUGIN@"
-- 
2.39.2


