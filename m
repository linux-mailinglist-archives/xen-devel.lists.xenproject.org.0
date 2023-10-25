Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1F7D6DD1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622912.970177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveP5-0008AO-5b; Wed, 25 Oct 2023 13:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622912.970177; Wed, 25 Oct 2023 13:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qveP5-00087i-2m; Wed, 25 Oct 2023 13:58:35 +0000
Received: by outflank-mailman (input) for mailman id 622912;
 Wed, 25 Oct 2023 13:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaZJ=GH=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qveP3-000866-Qp
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:58:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93f049c9-733e-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 15:58:30 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so8596939a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 06:58:30 -0700 (PDT)
Received: from edvint-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05640217ce00b0053e625da9absm9504855edy.41.2023.10.25.06.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 06:58:29 -0700 (PDT)
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
X-Inumbo-ID: 93f049c9-733e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698242310; x=1698847110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ktWD0ULeIfObsCztjTRvmpMByXxg4wg0bG8MtDIla98=;
        b=ken0wcsLxDMDlByKyqVmPL143DPP4Rb29jLHQoT7TrZJYjBlPjKKyAFEDU054b5cAX
         UxBL2C2xzyvnIHhLIJF5y+vtiG/u7p2I+Arj+tJaq4jDA7W4PQLYKbJ1xymWIF/sc4Ok
         la61ag6943KIAfeUQvK8a+ERpOKeiiQtRnYk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698242310; x=1698847110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktWD0ULeIfObsCztjTRvmpMByXxg4wg0bG8MtDIla98=;
        b=UW7Z6jZEtTs11ARDCGGZsKkpRseo6hiu17uEazUWzH6Ni38L6zW5b8T2141qzPwbQC
         ezqWrO6iDfTX8HSl5OGpCvEfD0zpJHswSsfGjgQ1K4/r7oVoOYRigl3U8UhbHionnTI/
         GuJqXrlYb6vPi6nRbPza23oAsu1muuaYAffz4TI6HwItYAsZtlqH2hKUGIwQDRGA4eW6
         PnRr6ayR89o5+FJy//tFkma1AtnjJAv8nIVIKxWdO4a9AcJq6MDtrbple6x94Y/ab/ry
         I4SS24r3A3IXfZhaVU7alLMlLmgYpJlWoZkxFfXgoQAxtI6LQtCI7r966i/0D7TtWflQ
         WiHw==
X-Gm-Message-State: AOJu0YzR/qg80VjkdEjzHMNiS7wSOHwehBUGc1tSCNBxbn11+SucLtR0
	l9YRqtj893QNQi3+nR/jGffGo2uiiQJ1YiWtZYS4MA==
X-Google-Smtp-Source: AGHT+IFXpXXDVT5c9mtN4o0TBbsxBF1R0REocRMLBpAZn768qkD/gUNToWgjMR2CKsB3qgvdZBfI2Q==
X-Received: by 2002:a05:6402:1d48:b0:540:cabb:de70 with SMTP id dz8-20020a0564021d4800b00540cabbde70mr1856323edb.38.1698242309808;
        Wed, 25 Oct 2023 06:58:29 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: edwin.torok@cloud.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH] tools/ocaml/Makefile.rules: use correct C flags when compiling OCaml C stubs
Date: Wed, 25 Oct 2023 14:58:29 +0100
Message-Id: <fd09742f7c2191be3cdfafbd4c7cccb10eb0e3a2.1698240589.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The code currently uses GCC to compile OCaml C stubs directly,
and although in most cases this works, it is not entirely correct.

This will fail if the OCaml runtime has been recompiled to use and link with ASAN for example
(or other situations where a flag needs to be used consistently in everything that is linked into the same binary).

Use the OCaml compiler instead, which knows how to invoke the correct C compiler with the correct flags,
and append the Xen specific CFLAGS to that instead.

Drop the explicit -fPIC and -I$(ocamlc -where): these will now be provided by the compiler as needed.

Use -verbose so we see the actuall full C compiler command line invocation done by the OCaml compiler.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 tools/ocaml/Makefile.rules | 2 +-
 tools/ocaml/common.make    | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 0d3c6ac839..74856e2282 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -37,7 +37,7 @@ ALL_OCAML_OBJS ?= $(OBJS)
 	$(call quiet-command, $(OCAMLYACC) -q $<,MLYACC,$@)
 
 %.o: %.c
-	$(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<,CC,$@)
+	$(call quiet-command, $(OCAMLOPT) -verbose $(addprefix -ccopt ,$(CFLAGS)) -c -o $@ $<,CC,$@)
 
 META: META.in
 	sed 's/@VERSION@/$(VERSION)/g' < $< $o
diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index 0c8a597d5b..629e4b3e66 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -9,8 +9,6 @@ OCAMLLEX ?= ocamllex
 OCAMLYACC ?= ocamlyacc
 OCAMLFIND ?= ocamlfind
 
-CFLAGS += -fPIC -I$(shell ocamlc -where)
-
 OCAMLOPTFLAG_G := $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\) .*/\1/p')
 OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -cc $(CC) -w F -warn-error F
 OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
-- 
2.41.0


