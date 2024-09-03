Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7A969C40
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788996.1198522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRy1-0007n7-6i; Tue, 03 Sep 2024 11:45:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788996.1198522; Tue, 03 Sep 2024 11:45:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slRy1-0007iF-3K; Tue, 03 Sep 2024 11:45:01 +0000
Received: by outflank-mailman (input) for mailman id 788996;
 Tue, 03 Sep 2024 11:44:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rbyx=QB=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1slRxz-0007g4-Tf
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:44:59 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f22425b1-69e9-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 13:44:58 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8684c31c60so578905166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:44:58 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feacd7sm673794266b.34.2024.09.03.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:44:56 -0700 (PDT)
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
X-Inumbo-ID: f22425b1-69e9-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725363897; x=1725968697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcvn7ewWKMXwk4/Zri2I75vp6w3p2veK6Jesxqi/v5s=;
        b=JxdeqH47NXviRhncG0sLzhugP35kRvGklTONcz1Hz7WSua8QWfCTWrDtHQy+bos06E
         RiaDQaSQa6+ASxqMqlAA2O1R3FPmLnRfusE6YVtZdhpmS0In5eDhmMwTZRfOUfLt1KXB
         pE/Mri319bO3zcRAWwfQkeFvR+K4qjT5HhNSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363897; x=1725968697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcvn7ewWKMXwk4/Zri2I75vp6w3p2veK6Jesxqi/v5s=;
        b=lzowIeFRKmSouc87gd61nZUbIu6rgJgqlkdQ7tfcWzdYjv7y/P/+OyLy+O/iY8/dd3
         ra4SiVYuflWgg45rEtNRkO4JyF7DyW7Ucr+4lr4UZPumNW4i18E0sQ0uMD7yTxS4w1aE
         D6zeOsEmx3W4SaMDlcgQ7mNRhl10s06pcq07PLbo2FjQNily84o1mpk/aukO3kMhKf1f
         P3UstzrThg2+L0tKEfoe10qp9Yw6jEybV5lzSKQDlWko8pzCNv98vj3t178WxLt/qN5f
         o44BlwaXPjWfkzjTkBFVO7ajal9QfDiiXwN0CeS7x2qElKMRNifqczkyRpcX5ZsUSXcj
         E5ww==
X-Gm-Message-State: AOJu0YwDI9FExOrszlZngGsXDf2Ut2fOEhxTL1O8dDEJqUZ2pw2Tu/09
	AYtYYSWaFilktaPosqiquzEpllusNdKTaD7IOlrd/7aH2sq//3AQk4ZW0pF8g+DQzOLMhKPUKnb
	tLl8=
X-Google-Smtp-Source: AGHT+IFjofnkUaDWuSrGWKJ//n8zTMuZ04j7ne+hY7XPuL45UWwkwudFZknGhNxDEKqkyDYA1N1M/w==
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id a640c23a62f3a-a897f83a33bmr1258361766b.23.1725363897380;
        Tue, 03 Sep 2024 04:44:57 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 1/3] tools/ocaml: Build infrastructure for OCaml dynamic libraries
Date: Tue,  3 Sep 2024 12:44:42 +0100
Message-Id: <36a9b5cbaba9bfffe261b824388ee81bb3c0a260.1725363427.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725363427.git.andrii.sultanov@cloud.com>
References: <cover.1725363427.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dynamic libraries in OCaml require an additional compilation step on top
of the already specified steps for static libraries. Add an appropriate
template to Makefile.rules.

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/Makefile.rules | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 5d534d8754..b9d4b51f0a 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -51,12 +51,13 @@ ifneq ($(MAKECMDGOALS),clean)
 endif
 
 clean: $(CLEAN_HOOKS)
-	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
+	$(Q)rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs *.annot *.spot *.spit $(LIBS) $(PROGRAMS) $(GENERATED_FILES) .ocamldep.make META
 
 distclean: clean
 
 quiet-command = $(if $(V),$1,@printf " %-8s %s\n" "$2" "$3" && $1)
 
+mk-caml-shared-lib-native = $(call quiet-command, $(OCAMLOPT) $(OCAMLOPTFLAGS) -shared -linkall -o $1 $2 $3,MLA,$1)
 mk-caml-lib-native = $(call quiet-command, $(OCAMLOPT) $(OCAMLOPTFLAGS) -a -o $1 $2 $3,MLA,$1)
 mk-caml-lib-bytecode = $(call quiet-command, $(OCAMLC) $(OCAMLCFLAGS) -a -o $1 $2 $3,MLA,$1)
 
@@ -76,6 +77,19 @@ define OCAML_LIBRARY_template
 	$(call mk-caml-lib-stubs,$$@, $$+, $(foreach lib,$(LIBS_$(1)),$(lib)))
 endef
 
+# Dynamically linked OCaml libraries ("plugins" in Dynlink parlance)
+# need to compile an .cmxs file
+define OCAML_DYN_LIBRARY_template
+ $(1).cmxs: $(1).cmxa
+	$(call mk-caml-shared-lib-native,$$@, $(1).cmxa)
+ $(1).cmxa: lib$(1)_stubs.a $(foreach obj,$($(1)_OBJS),$(obj).cmx)
+	$(call mk-caml-lib-native,$$@, -cclib -l$(1)_stubs $(foreach lib,$(LIBS_$(1)),-cclib $(lib)), $(foreach obj,$($(1)_OBJS),$(obj).cmx))
+ $(1)_stubs.a: $(foreach obj,$$($(1)_C_OBJS),$(obj).o)
+	$(call mk-caml-stubs,$$@, $$+)
+ lib$(1)_stubs.a: $(foreach obj,$($(1)_C_OBJS),$(obj).o)
+	$(call mk-caml-lib-stubs,$$@, $$+)
+endef
+
 define OCAML_NOC_LIBRARY_template
  $(1).cmxa: $(foreach obj,$($(1)_OBJS),$(obj).cmx)
 	$(call mk-caml-lib-native,$$@, , $(foreach obj,$($(1)_OBJS),$(obj).cmx))
@@ -98,6 +112,7 @@ endef
 -include .ocamldep.make
 
 $(foreach lib,$(OCAML_LIBRARY),$(eval $(call OCAML_LIBRARY_template,$(lib))))
+$(foreach lib,$(OCAML_DYN_LIBRARY),$(eval $(call OCAML_DYN_LIBRARY_template,$(lib))))
 $(foreach lib,$(OCAML_NOC_LIBRARY),$(eval $(call OCAML_NOC_LIBRARY_template,$(lib))))
 $(foreach p,$(OCAML_PROGRAM),$(eval $(call OCAML_PROGRAM_template,$(p))))
 $(foreach p,$(C_PROGRAM),$(eval $(call C_PROGRAM_template,$(p))))
-- 
2.39.2


