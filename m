Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D396095B12A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 11:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781629.1191136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nL-0003bA-O9; Thu, 22 Aug 2024 09:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781629.1191136; Thu, 22 Aug 2024 09:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nL-0003RG-Iy; Thu, 22 Aug 2024 09:07:51 +0000
Received: by outflank-mailman (input) for mailman id 781629;
 Thu, 22 Aug 2024 09:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8+D=PV=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1sh3mI-0002Rz-46
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 09:06:46 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db150d48-6065-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 11:06:45 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8682bb5e79so84090066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 02:06:45 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2e6717sm88948266b.96.2024.08.22.02.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 02:06:44 -0700 (PDT)
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
X-Inumbo-ID: db150d48-6065-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724317605; x=1724922405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC1kK8nz8HkQxKR7SEj5x2jWrRcksrvnhTGjt2Y7Jm0=;
        b=Ct8oVTsOgGyNIzbVsr2+HYumQqPbQG7YupRH6TU4GykhlcWy1aiHBNPGZ4RBMSZM9q
         YrQSpfvagb5mj+wSlcUOOTW7OghmW6rZQpirl2IG21qU+72fmKSLQzsLS+phhCsnCABB
         12s8W7a1tWjmmgPWEU260xNjIZu0U6J1iYSEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724317605; x=1724922405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zC1kK8nz8HkQxKR7SEj5x2jWrRcksrvnhTGjt2Y7Jm0=;
        b=uYWEiP1pnk8a0SLqGY6rwyQxFXfDqwU4DhkGG4Voa6Wo18Tlcx+L3LRDHcfnHU/jrK
         RRGuKeZJ3THZZ1/Kz2vOJUJULm5mZ0E+7U7dxTUG9lT1KH2LV+NP1wBCuM1tv9m+o7lc
         W3l//XOe2qjtyk8+y6/SWLddmAom9EQSz5KTnawub6/QyIgZm/Mk76BU2+WkXKkCfYTT
         dX2ertkcUbcPa0mV52j9KEbIedrzrL1TfG5RxGiGZ0Lh7quz6/41FenM+L0nOkkMTBIg
         1RfuX4PjbKwV41ilHg7bNLys4dd+gS2kM44S0e2/HF0GtVaIyO856QNjfiexw/VQIRFv
         STVQ==
X-Gm-Message-State: AOJu0YxTR+RtQrlqMymeZ/CvL374Sc8aktJGXlWC2ud6TprdD9+FiFNn
	9YEJucM+h1SyDURyKb8qDjGxssIhQJg3LAEwVZICmB+Ovy9HmMpfsvvwBoFURN8GNB6lpc4IrL8
	p
X-Google-Smtp-Source: AGHT+IElPbcnHvnSCRtgGX92MGchEdfdBCL53x2SJ5xhZmDJgNNrDED3WbicO7q4ifC1QOYuvtSDVw==
X-Received: by 2002:a17:907:7f1f:b0:a86:89ea:ee6c with SMTP id a640c23a62f3a-a8689eaefe8mr191195266b.30.1724317604700;
        Thu, 22 Aug 2024 02:06:44 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 4/4] Makefile.rules: Fix OCaml libs
Date: Thu, 22 Aug 2024 10:06:05 +0100
Message-Id: <9c9eac180468d1c4044048094956951bcc2edaa6.1724314239.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724314239.git.andrii.sultanov@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit upstreams the pre-existing patch from
https://github.com/xenserver/xen.pg/blob/XS-8/patches/fix-ocaml-libs.patch

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/Makefile.rules | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 0444e95f17..84f5ecafe7 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -62,18 +62,18 @@ mk-caml-lib-bytecode = $(call quiet-command, $(OCAMLC) $(OCAMLCFLAGS) -a -o $1 $
 
 mk-caml-stubs = $(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a` $2,MKLIB,$1)
 mk-caml-lib-stubs = \
-	$(call quiet-command, $(AR) rcs $1 $2 && $(OCAMLMKLIB) -o `basename $1 .a | sed -e 's/^lib//'` $2,MKLIB,$1)
+	$(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a | sed -e 's/^lib//'` $2 $3,MKLIB,$1)
 
 # define a library target <name>.cmxa and <name>.cma
 define OCAML_LIBRARY_template
  $(1).cmxa: lib$(1)_stubs.a $(foreach obj,$($(1)_OBJS),$(obj).cmx)
 	$(call mk-caml-lib-native,$$@, -cclib -l$(1)_stubs $(foreach lib,$(LIBS_$(1)),-cclib $(lib)), $(foreach obj,$($(1)_OBJS),$(obj).cmx))
  $(1).cma: $(foreach obj,$($(1)_OBJS),$(obj).cmo)
-	$(call mk-caml-lib-bytecode,$$@, -dllib dll$(1)_stubs.so -cclib -l$(1)_stubs, $$+)
+	$(call mk-caml-lib-bytecode,$$@, -dllib dll$(1)_stubs.so -cclib -l$(1)_stubs $(foreach lib,$(LIBS_$(1)),-cclib $(lib)), $$+)
  $(1)_stubs.a: $(foreach obj,$$($(1)_C_OBJS),$(obj).o)
 	$(call mk-caml-stubs,$$@, $$+)
  lib$(1)_stubs.a: $(foreach obj,$($(1)_C_OBJS),$(obj).o)
-	$(call mk-caml-lib-stubs,$$@, $$+)
+	$(call mk-caml-lib-stubs,$$@, $$+, $(foreach lib,$(LIBS_$(1)),$(lib)))
 endef
 
 # Dynamically linked OCaml libraries ("plugins" in Dynlink parlance)
-- 
2.39.2


