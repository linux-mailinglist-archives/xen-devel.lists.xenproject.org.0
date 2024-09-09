Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591DE9718E3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 14:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794382.1203297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6n-000189-As; Mon, 09 Sep 2024 12:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794382.1203297; Mon, 09 Sep 2024 12:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd6n-00016D-4j; Mon, 09 Sep 2024 12:03:05 +0000
Received: by outflank-mailman (input) for mailman id 794382;
 Mon, 09 Sep 2024 12:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/dp=QH=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1snd6l-0000ce-Ha
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 12:03:03 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 770a7cff-6ea3-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 14:03:02 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso10152064a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 05:03:03 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65742sm331603066b.216.2024.09.09.05.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 05:03:01 -0700 (PDT)
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
X-Inumbo-ID: 770a7cff-6ea3-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725883382; x=1726488182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5YgYhePmve9+WOG0QJ+xJp2hifKt7rcNXrTDKjPMNw=;
        b=MgGAIX6hUaiLb09g1jFQlzIg/AkeAECQhpvsoa0irwd2cJYvDMrEGj+ii/nun8A981
         AO6erf6Vz2nLrs/8r5u0pJcVKxRYaea+X1LKQQO09Qbrv6icorWgAgRpjtikdF2t9Obj
         vBURs3LbmnodxHAOtFQvNcdm7H8Q4n9KxqbSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883382; x=1726488182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5YgYhePmve9+WOG0QJ+xJp2hifKt7rcNXrTDKjPMNw=;
        b=Gn8LeaC/zSxEi4WmnwQu1jMrU+RVseEeVKNjFxkasal0ONond6uPXUa98URhtxUBlo
         ragqLJvV2IxCNOm1kBECQ0A6mI/zyQzvrOuZj4zmTp5AjXviA+O7eyAWoyb6rTCeoROs
         XSiQ3Vv6Fsb7pkPcnWoaR6Xybi1oL4uP8sy3r/KeEPD/+lZBrgl/lUmB8mncRW6yEtXX
         hzEOZUY+x2SHKM0uPCcd4yN+emJtl4UyQ9uP7A83d3iooqNbt7xqYp6sasYYaj5HDoaW
         1POIyjxnuZqJOM+BHdhw8KcQZoTMzD/Sr2W04Pfdmt8nQ/OvcQrWP7uqeygTBnH+TuRv
         yX0A==
X-Gm-Message-State: AOJu0YwJr/3+eA+fmGqWhZunqb6lAiHmBc8ggwYPX5FF39DB4KlWbVL9
	zm3V8PiI4JDOCipUxIgpUXiDjRBjG5lO+RK42SMNmZy4AIIn/ABOwSNyqJ+aRsPPRq8KQQ/Zu43
	4
X-Google-Smtp-Source: AGHT+IEhKat/dVQxAoOE6/dZlJtqBM9eMnI0VlNRo38sAf0RhyCh7F+7UXxIYtY5adE1nPVHc/monQ==
X-Received: by 2002:a17:907:7ba3:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a8d63722f43mr166834066b.18.1725883381675;
        Mon, 09 Sep 2024 05:03:01 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v3 2/3] tools/oxenstored: Load the plugin for Xenctrl.domain_getinfo
Date: Mon,  9 Sep 2024 13:02:41 +0100
Message-Id: <4da0d29b49325f3684c283219144f9fbf3c241d3.1725881488.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725881488.git.andrii.sultanov@cloud.com>
References: <cover.1725881488.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Oxenstored dynamically loads the plugin provided in ocaml/libs/xsd_glue.
The plugin is verified to be providing the specified plugin_interface
during its loading.

If a V2 of the plugin is produced, V1 will still be present, and a new
version should only be loaded if it's verified to exist
(New oxenstored can run in an environment with only V1 of the plugin).

The plugin is not switched to as of yet, the old Xenctrl stubs are still
used.

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
* This commit is a result of the split of one oxenstored commit into two.
* Remove configure and paths.m4 defines as suggested.
* Reformat files appropriately
* Use libexec/ocaml as the plugin root dir instead of libexec/bin

 tools/ocaml/xenstored/Makefile    |  5 ++++-
 tools/ocaml/xenstored/domains.ml  | 28 ++++++++++++++++++++++++++++
 tools/ocaml/xenstored/paths.ml.in |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/Makefile b/tools/ocaml/xenstored/Makefile
index fa45305d8c..5e8210a906 100644
--- a/tools/ocaml/xenstored/Makefile
+++ b/tools/ocaml/xenstored/Makefile
@@ -15,7 +15,8 @@ OCAMLINCLUDE += \
 	-I $(OCAML_TOPLEVEL)/libs/xb \
 	-I $(OCAML_TOPLEVEL)/libs/mmap \
 	-I $(OCAML_TOPLEVEL)/libs/xc \
-	-I $(OCAML_TOPLEVEL)/libs/eventchn
+	-I $(OCAML_TOPLEVEL)/libs/eventchn \
+	-I $(OCAML_TOPLEVEL)/libs/xsd_glue
 
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
+	-ccopt -L -ccopt $(OCAML_TOPLEVEL)/libs/xsd_glue $(OCAML_TOPLEVEL)/libs/xsd_glue/plugin_interface_v1.cmxa \
 	-ccopt -L -ccopt $(XEN_ROOT)/tools/libs/ctrl
 
 PROGRAMS = oxenstored
diff --git a/tools/ocaml/xenstored/domains.ml b/tools/ocaml/xenstored/domains.ml
index 7a3056c364..c233065711 100644
--- a/tools/ocaml/xenstored/domains.ml
+++ b/tools/ocaml/xenstored/domains.ml
@@ -20,6 +20,34 @@ let warn fmt  = Logging.warn  "domains" fmt
 
 let xc = Xenctrl.interface_open ()
 
+let load_plug fname =
+  let fail_with fmt = Printf.ksprintf failwith fmt in
+  let fname = Dynlink.adapt_filename fname in
+  if Sys.file_exists fname then
+    try Dynlink.loadfile fname with
+    | Dynlink.Error err as e ->
+      error "ERROR loading plugin '%s': %s\n%!" fname
+        (Dynlink.error_message err);
+      raise e
+    | _ -> fail_with "Unknown error while loading plugin"
+  else fail_with "Plugin file '%s' does not exist" fname
+
+let () =
+  let plugins_dir = Paths.libexec ^ "/ocaml/xsd_glue/xenctrl_plugin/" in
+  let filepath = plugins_dir ^ "domain_getinfo_v1.cmxs" in
+  debug "Trying to load plugin '%s'\n%!" filepath;
+  let list_files = Sys.readdir plugins_dir in
+  debug "Directory listing of '%s'\n%!" plugins_dir ;
+  Array.iter (fun x -> debug "\t%s\n%!" x) list_files;
+  Dynlink.allow_only [ "Plugin_interface_v1" ];
+  load_plug filepath
+
+module Plugin =
+  (val Plugin_interface_v1.get_plugin_v1 ()
+    : Plugin_interface_v1.Domain_getinfo_V1)
+
+let handle = Plugin.interface_open ()
+
 type domains = {
   eventchn: Event.t;
   table: (Xenctrl.domid, Domain.t) Hashtbl.t;
diff --git a/tools/ocaml/xenstored/paths.ml.in b/tools/ocaml/xenstored/paths.ml.in
index 37949dc8f3..acb6ea4ca7 100644
--- a/tools/ocaml/xenstored/paths.ml.in
+++ b/tools/ocaml/xenstored/paths.ml.in
@@ -2,3 +2,4 @@ let xen_log_dir = "@XEN_LOG_DIR@"
 let xen_config_dir = "@XEN_CONFIG_DIR@"
 let xen_run_dir = "@XEN_RUN_DIR@"
 let xen_run_stored = "@XEN_RUN_STORED@"
+let libexec = "@LIBEXEC@"
-- 
2.39.2


