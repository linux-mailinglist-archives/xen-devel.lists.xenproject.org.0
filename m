Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314B24C488C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279299.477038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKw-0002oq-C1; Fri, 25 Feb 2022 15:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279299.477038; Fri, 25 Feb 2022 15:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKv-0002XG-JN; Fri, 25 Feb 2022 15:16:49 +0000
Received: by outflank-mailman (input) for mailman id 279299;
 Fri, 25 Feb 2022 15:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcIf-0007Bf-NL
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:14:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8be35f-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:14:27 +0100 (CET)
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
X-Inumbo-ID: 9e8be35f-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kVfi8O5fUs5vOwYORwAwSsIcv2wq/KeyJm02u0brLh8=;
  b=B13VtlZNDjEy4Lrb9Kncz0B4+D3s/zKtSIl04Sx2+vyytNnTwG81aSR3
   i+MH9Y8Tk3/7SUmkAfZpCoh3u32CBzDijK0NzepCPpKw2lqR7Dbqo50q5
   5cm0JDqcfdzS1mlTbY4LQpp4vcOcLAIYRoQjhlgLT2+YRktpLvx83auid
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64998443
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:42XmkqOCEpmHjzzvrR3fl8FynXyQoLVcMsEvi/4bfWQNrUor3zEHx
 mcbDD2CPv/eYGX2ed0naIm0oBlVsZfVmNZlSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 /t3t7GoaAkSIrzhnt8+fitID2ZYMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQaePN
 5ZFMlKDajzcURNWZQhQNa4sxvXvo0vwVAVJ72ua8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12jwHBwyLtGUzjuBtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYHdeBSPvUb5jqR24fS2CW0NHgYCRhOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgPQ1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGwheB41b55cIWeBj
 KrvVeV5vs470JyCN/IfXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3C7WvMnGKqtdIdTjn7xETXPjLliCeTcbbSiIOJY3rI6K5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:0gL9g6jOi35dwX2lbuVCiV4eEHBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64998443"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v2 29/29] tools/ocaml: fix build dependency target
Date: Fri, 25 Feb 2022 15:13:21 +0000
Message-ID: <20220225151321.44126-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

They are two competiting spelling for the variable holding the path to
"tools/ocaml", $(TOPLEVEL) and $(OCAML_TOPLEVEL). The "Makefile.rules"
which is included in all ocaml Makefiles have one rule which make use
of that variable which is then sometime unset. When building
"ocaml/xenstored", make isn't capable of generating ".ocamldep.make"
because $(TOPLEVEL) isn't defined in this case.

This can fail with an error like this when paths.ml have been
regenerated:
    Error: Files define.cmx and paths.cmx
       make inconsistent assumptions over interface Paths

This patch fix ".ocamldep.make" rule by always spelling the variable
$(OCAML_TOPLEVEL).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - new patch

 tools/ocaml/libs/eventchn/Makefile   | 8 ++++----
 tools/ocaml/libs/mmap/Makefile       | 8 ++++----
 tools/ocaml/libs/xb/Makefile         | 8 ++++----
 tools/ocaml/libs/xc/Makefile         | 8 ++++----
 tools/ocaml/libs/xentoollog/Makefile | 8 ++++----
 tools/ocaml/libs/xl/Makefile         | 8 ++++----
 tools/ocaml/libs/xs/Makefile         | 8 ++++----
 tools/ocaml/Makefile.rules           | 2 +-
 8 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/tools/ocaml/libs/eventchn/Makefile b/tools/ocaml/libs/eventchn/Makefile
index 154efd4a8e..7362a28d9e 100644
--- a/tools/ocaml/libs/eventchn/Makefile
+++ b/tools/ocaml/libs/eventchn/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_xeninclude)
 
@@ -31,5 +31,5 @@ install: $(LIBS) META
 uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xeneventchn
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
 
diff --git a/tools/ocaml/libs/mmap/Makefile b/tools/ocaml/libs/mmap/Makefile
index df45819df5..a621537135 100644
--- a/tools/ocaml/libs/mmap/Makefile
+++ b/tools/ocaml/libs/mmap/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 OBJS = xenmmap
 INTF = $(foreach obj, $(OBJS),$(obj).cmi)
@@ -26,5 +26,5 @@ install: $(LIBS) META
 uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenmmap
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
 
diff --git a/tools/ocaml/libs/xb/Makefile b/tools/ocaml/libs/xb/Makefile
index be4499147e..ff4428af6d 100644
--- a/tools/ocaml/libs/xb/Makefile
+++ b/tools/ocaml/libs/xb/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 CFLAGS += -I../mmap
 CFLAGS += $(CFLAGS_libxenctrl) # For xen_mb()
@@ -49,4 +49,4 @@ install: $(LIBS) META
 uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenbus
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/libs/xc/Makefile b/tools/ocaml/libs/xc/Makefile
index b6da4fdbaf..67acc46bee 100644
--- a/tools/ocaml/libs/xc/Makefile
+++ b/tools/ocaml/libs/xc/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 CFLAGS += -I../mmap $(CFLAGS_libxenctrl) $(CFLAGS_libxenguest)
 CFLAGS += $(APPEND_CFLAGS)
@@ -38,4 +38,4 @@ xenctrl_abi_check.h: abi-check xenctrl_stubs.c xenctrl.ml
 
 GENERATED_FILES += xenctrl_abi_check.h
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/libs/xentoollog/Makefile b/tools/ocaml/libs/xentoollog/Makefile
index 593f9e9e9d..9ede2fd124 100644
--- a/tools/ocaml/libs/xentoollog/Makefile
+++ b/tools/ocaml/libs/xentoollog/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 # allow mixed declarations and code
 CFLAGS += -Wno-declaration-after-statement
@@ -62,4 +62,4 @@ install: $(LIBS) META
 uninstall:
 	ocamlfind remove -destdir $(OCAMLDESTDIR) xentoollog
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/libs/xl/Makefile b/tools/ocaml/libs/xl/Makefile
index cbe1569cc5..7c1c4edced 100644
--- a/tools/ocaml/libs/xl/Makefile
+++ b/tools/ocaml/libs/xl/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 # ignore unused generated functions and allow mixed declarations and code
 CFLAGS += -Wno-unused -Wno-declaration-after-statement
@@ -68,4 +68,4 @@ install: $(LIBS) META
 uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenlight
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
diff --git a/tools/ocaml/libs/xs/Makefile b/tools/ocaml/libs/xs/Makefile
index 572efb76c4..e934bbb550 100644
--- a/tools/ocaml/libs/xs/Makefile
+++ b/tools/ocaml/libs/xs/Makefile
@@ -1,6 +1,6 @@
-TOPLEVEL=$(CURDIR)/../..
-XEN_ROOT=$(TOPLEVEL)/../..
-include $(TOPLEVEL)/common.make
+OCAML_TOPLEVEL=$(CURDIR)/../..
+XEN_ROOT=$(OCAML_TOPLEVEL)/../..
+include $(OCAML_TOPLEVEL)/common.make
 
 OCAMLINCLUDE += -I ../xb/
 OCAMLOPTFLAGS += -for-pack Xenstore
@@ -43,7 +43,7 @@ install: $(LIBS) META
 uninstall:
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xenstore
 
-include $(TOPLEVEL)/Makefile.rules
+include $(OCAML_TOPLEVEL)/Makefile.rules
 
 genpath-target = $(call buildmakevars2module,paths.ml)
 $(eval $(genpath-target))
diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index abfbc64ce0..7e4db457a1 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -44,7 +44,7 @@ META: META.in
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
-.ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(TOPLEVEL)/Makefile.rules
+.ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
 	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
 
 clean: $(CLEAN_HOOKS)
-- 
Anthony PERARD


