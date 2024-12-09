Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911289E9A32
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 16:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851517.1265585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfUp-00040Y-JC; Mon, 09 Dec 2024 15:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851517.1265585; Mon, 09 Dec 2024 15:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKfUp-0003xM-Fb; Mon, 09 Dec 2024 15:16:27 +0000
Received: by outflank-mailman (input) for mailman id 851517;
 Mon, 09 Dec 2024 15:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMJQ=TC=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tKfUn-0003j3-TV
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 15:16:25 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e4644ec-b640-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 16:16:25 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa5325af6a0so711518966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 07:16:25 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa663334906sm365993466b.72.2024.12.09.07.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 07:16:24 -0800 (PST)
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
X-Inumbo-ID: 8e4644ec-b640-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733757384; x=1734362184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4D25h9apZWWqcYaQPYHIl6EB6+ZFsV8yaOICIU50IY=;
        b=ZMaPOW6LR8gjbyle/Y7Gr3aXUr595Kd06lns4ItEMf9p4L6o8JdPTOulUAB29lYbpx
         nRTzYBtrPFAKmwSstojPdCxud5LbG4DGA9NJDTXp8M1uZIxHJ2pvNefqoeF7hmGHO/Ig
         0XwKIGiCsoseiGzoLSleZeMu4bFjZjQuKPbg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757384; x=1734362184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4D25h9apZWWqcYaQPYHIl6EB6+ZFsV8yaOICIU50IY=;
        b=VxN2xnYUfjXFMKqdSkIy/loKKtRt+L+INW4n/upH07AT+dyMQpAZSwysP3TlQSO999
         P/Kp5lqIlNo81lHIlrRhQWqQ0u4KMFUbVJjBIhZ+XFI67VxME009QSX4n5AUTIl496MB
         SmlfkIzDnulZdG+Mbg2boOOW3NcNSJY3zgl/NHbuFCiwWjYDbYXXfzbAI+1uma1up6pb
         3YSy9iyN+Hm6GHPUFNlEqd5ea98ERMBq7VttzGDVQ7KGw65hiMnuaK/GRCRwzEfS60Ug
         4liRCOA4e8wqdS9AU9PeujSRi+wrEy5uC6dxmGJ0/q5/8TO16j/h+0Tr62zK1dJQAVfc
         LNXg==
X-Gm-Message-State: AOJu0Ywf+ry9fOCLTsMverX8ux6/aiut8zetz8vzlpD9biHMY4v4e5IC
	0ck13zi5PZnI367YsjpQaxZ+r/aQSgn2av3Ep6MA1czluzBd03oSKz/MtGsFRbDCijfAcHBrZG2
	s
X-Gm-Gg: ASbGncsE4CqGEHXmWSoTj3X78C69tu+pDyT7R17xnVBWD+QBVfgLXPFN5a19jLSrx4S
	lpfkP7NVlNX7KcufJSTrHvNZ2yug52KX7u0bbnnzEbqxLZ7Ngjte2LbdH7E0J5pVpWAkom0STPF
	OAcSHBUPmdQ2cD7Z/+LOYwPAIZa7ThwN6EgI/KoNAmkf5Wi5CQ0NhUSUQyxzu6on9VFMDYGjLB1
	Z9/pLWftKK+EPkd3xVr3XNES0udg4QgzY2LSe3HF5OrsgFMB/wSEcLQpAa0f7iteh9c/0sI62IQ
	L9NYEfdVKIEL88iaR4l3E5jWiqKepfsJgkpZ2D4VNDYZ9+grGT0iIIgk
X-Google-Smtp-Source: AGHT+IG0PpfUHGsCTEXkTZY+j/ytG3AMW4kHEO+LHjVjuBPfDj20tnTHu7qMy+atj5jud5QjmEDCbg==
X-Received: by 2002:a17:906:2189:b0:aa5:391e:cadf with SMTP id a640c23a62f3a-aa69ce223c2mr91253666b.42.1733757384563;
        Mon, 09 Dec 2024 07:16:24 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 1/1] tools/ocaml: Specify rpath correctly for ocamlmklib
Date: Mon,  9 Dec 2024 15:16:18 +0000
Message-Id: <231f20e0c1dae7eadfeb4b806e1bb415f5f15b33.1733757256.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733757256.git.andrii.sultanov@cloud.com>
References: <cover.1733757256.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ocamlmklib has special handling for C-like '-Wl,-rpath' option, but does
not know how to handle '-Wl,-rpath-link', as evidenced by warnings like:
"Unknown option
-Wl,-rpath-link=$HOME/xen/tools/ocaml/libs/eventchn/../../../../tools/libs/toollog"
Pass this option directly to the compiler with -ccopt instead.

This prevents embedding absolute paths from buildtime into binary's RPATH.

Fixes: f7b4e4558b42 ("tools/ocaml: Fix OCaml libs rules")
Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/Makefile.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index b9d4b51f0a..055725d910 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -63,7 +63,7 @@ mk-caml-lib-bytecode = $(call quiet-command, $(OCAMLC) $(OCAMLCFLAGS) -a -o $1 $
 
 mk-caml-stubs = $(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a` $2,MKLIB,$1)
 mk-caml-lib-stubs = \
-	$(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a | sed -e 's/^lib//'` $2 $3,MKLIB,$1)
+	$(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a | sed -e 's/^lib//'` $2 `echo $3 | sed -e 's/-ccopt \(-l\|-L\)/\1/g'`,MKLIB,$1)
 
 # define a library target <name>.cmxa and <name>.cma
 define OCAML_LIBRARY_template
@@ -74,7 +74,7 @@ define OCAML_LIBRARY_template
  $(1)_stubs.a: $(foreach obj,$$($(1)_C_OBJS),$(obj).o)
 	$(call mk-caml-stubs,$$@, $$+)
  lib$(1)_stubs.a: $(foreach obj,$($(1)_C_OBJS),$(obj).o)
-	$(call mk-caml-lib-stubs,$$@, $$+, $(foreach lib,$(LIBS_$(1)),$(lib)))
+	$(call mk-caml-lib-stubs,$$@, $$+, $(foreach lib,$(LIBS_$(1)),-ccopt $(lib)))
 endef
 
 # Dynamically linked OCaml libraries ("plugins" in Dynlink parlance)
-- 
2.39.5


