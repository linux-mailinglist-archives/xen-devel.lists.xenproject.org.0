Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFC9E9DAF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 18:58:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851795.1265811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKi1E-0007uu-59; Mon, 09 Dec 2024 17:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851795.1265811; Mon, 09 Dec 2024 17:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKi1E-0007qk-2M; Mon, 09 Dec 2024 17:58:04 +0000
Received: by outflank-mailman (input) for mailman id 851795;
 Mon, 09 Dec 2024 17:58:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VMJQ=TC=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1tKi1C-0007nO-PI
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 17:58:02 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2178b8c1-b657-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 18:58:01 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso852409566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 09:58:01 -0800 (PST)
Received: from CSGPROD238885.citrite.net
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa66c646e64sm353428266b.25.2024.12.09.09.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 09:58:00 -0800 (PST)
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
X-Inumbo-ID: 2178b8c1-b657-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733767080; x=1734371880; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YerkWU1ZVB8kQItSuG2bqWDj4eonv2Uu+iny4UeDLCk=;
        b=ZUfIzAbjOZu1gtjSELpYWz5BYFVdkSGDNIDJ9ZMF5J7kpYti6+eA30xqD43HAgzAEz
         rSgvg8RvxbP38d8YCnxNkbPfwUNG9nWZRSSS91QVl2YXs0/PB9UKayVRcmGvRx76PF/w
         lhp8gi88yPLbG6zwYRB4i79+jyT1UZ3Xh8nM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733767080; x=1734371880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YerkWU1ZVB8kQItSuG2bqWDj4eonv2Uu+iny4UeDLCk=;
        b=WZAMwBv9Xch4QZK/IPxnYufEWHq9NAH/nLT4jjwE/+Jz5gQN2kTzrSJmNqcFHrJ3WP
         kL0ZYMi+33HhzSLMzCst9N/AJytjzV8ePqVXOliwNMUq+j6MO+hNGbYgSsQEBT7UbXcI
         iuFAFD9YHZ3LF2HaRIQM7yO608J8iegtAwndaJbosYJjP5xVDpunlfPTqW/MfkQk/WwX
         4JPhmbP3v9pb8ILilxkxyxKKMnOyBN7LMJFf3djxB8VCLwugySpCVNXMiWvrYShjGEED
         gieiPsjgiqAZPiW+uvukhkUhSZvPgNznf+CfxasMXDIdQqLnqmKisVbIlPnDuyJvZPO3
         Dfbg==
X-Gm-Message-State: AOJu0Yw80OHJ1hT3h9WpHcIPoCUgeKjmkoc438ik4DbFVt66kiB2z70g
	sCg6OwVefBRUdGhOxBxdwqPQXxTO1EVN2ED2LPvVXVc0TqSLO4VIl/cpLPIOgXTA7BzMUZncZ99
	+
X-Gm-Gg: ASbGncteSpaXQZV2pOSrI+Hg4I4lAbLG+rCjJL3nsiPS5JaLe65RdPanBrQXHJ/NDZq
	/f1o+F9YKgmy7+M9nh6hpvNDYr3XBrUkcYvmUxPFCBk6mYE56/iN/Q/HWr3Rc/lH090d6EzW9FN
	KBitd7WllU+lwdlMQo5bm0w13uKSRlSF8uVHEA6wSHohgWXP1fENThJxgIcPl11u9+cuvpB58x0
	jiPRgVnCABhYSUtJL3SUXigX3WMXcq3dLw51EDiXY2Tvp/J+wfeV6nthDBvoDW6VJVYO9HyAeID
	guMbv7CDT0wliWSbv1o6EHUALV63P8OQ+ZuxHuQSbfNGULapqiY3OYF4skkW
X-Google-Smtp-Source: AGHT+IEogXZhboHVMPmdjZ8yCiLJxlJzcc3LoD1MI9vI4Je9KBT2G3r487MOZujzsYqPvjKBfQN34g==
X-Received: by 2002:a17:907:619f:b0:aa6:6696:4072 with SMTP id a640c23a62f3a-aa69ce89910mr131820466b.49.1733767080410;
        Mon, 09 Dec 2024 09:58:00 -0800 (PST)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Fernando Rodrigues <alpha@sigmasquadron.net>,
	Christian Lindig <christian.lindig@cloud.com>
Subject: [PATCH v2 1/1] tools/ocaml: Specify rpath correctly for ocamlmklib
Date: Mon,  9 Dec 2024 17:57:49 +0000
Message-Id: <e2caa6648a0b6c429349a9826d8fbc4338222482.1733766758.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733766758.git.andrii.sultanov@cloud.com>
References: <cover.1733766758.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ocamlmklib has special handling for C-like '-Wl,-rpath' option, but does
not know how to handle '-Wl,-rpath-link', as evidenced by warnings like:
"Unknown option
-Wl,-rpath-link=$HOME/xen/tools/ocaml/libs/eventchn/../../../../tools/libs/toollog"
Pass this option directly to the compiler with -ccopt instead.

Also pass -L directly to the linker with -ldopt. This prevents embedding absolute
paths from buildtime into binary's RPATH.

Fixes: f7b4e4558b42 ("tools/ocaml: Fix OCaml libs rules")
Reported-by: Fernando Rodrigues <alpha@sigmasquadron.net>
Tested-by: Fernando Rodrigues <alpha@sigmasquadron.net>
Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
---
Changes in v2:
- Pass -L directly to the linker
---
 tools/ocaml/Makefile.rules | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index b9d4b51f0a..43f7add072 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -63,7 +63,7 @@ mk-caml-lib-bytecode = $(call quiet-command, $(OCAMLC) $(OCAMLCFLAGS) -a -o $1 $
 
 mk-caml-stubs = $(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a` $2,MKLIB,$1)
 mk-caml-lib-stubs = \
-	$(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a | sed -e 's/^lib//'` $2 $3,MKLIB,$1)
+	$(call quiet-command, $(OCAMLMKLIB) -o `basename $1 .a | sed -e 's/^lib//'` $2 `echo $3 | sed -e 's/-ccopt -l/-l/g' | sed -e 's/-ccopt -L/-ldopt -L/g'`,MKLIB,$1)
 
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


