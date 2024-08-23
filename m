Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787095CB02
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782251.1191733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtm-0004MO-MW; Fri, 23 Aug 2024 10:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782251.1191733; Fri, 23 Aug 2024 10:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtm-0004FR-J2; Fri, 23 Aug 2024 10:52:06 +0000
Received: by outflank-mailman (input) for mailman id 782251;
 Fri, 23 Aug 2024 10:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shRtl-0004CD-9b
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:52:05 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb8864cb-613d-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 12:52:04 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a86933829dcso212815966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 03:52:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f47d1c3sm239923866b.169.2024.08.23.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:52:01 -0700 (PDT)
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
X-Inumbo-ID: bb8864cb-613d-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724410322; x=1725015122; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu11yvtztHSjwdPJuoKFnudbRkELxQKDuzUDZ3yJLxc=;
        b=IDp46kymVn6k3qkXOx+cpoo4wM1b8u2uNIDW18AxC4OFQ5qCBEX2g8ZwgUJgOUSO6i
         RUBIN8KLlLk0hqgliCdCkVnM2E5C/YlC5FO/kpyDhB6DXuV5LARD6EJCzb520lddC7C1
         0Fhcy6+gOyb1kIG/Xa7lIGNyheHAT2BeAvoX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410322; x=1725015122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu11yvtztHSjwdPJuoKFnudbRkELxQKDuzUDZ3yJLxc=;
        b=vWcDfVb5WdNR526al8Jhph02vBNsrCewA++tUhcP4gAEqOLdhcRN4qHjMAslDoA0AP
         ZpcOjfzCW66IGsgGmxcRYih3L0SXr69bHJaEBPaTR9xgIR/s8KSwfaTsJBJx6R3+k9y8
         aJH4YL4HTKD9zI3hMtwww9dyL2dky1EkljIADcg50ioR22vqx46UzM3yU1BkUoRzdP86
         2yRQUo+RuP84CdZu5TijfvXKR/ouP2Ntx34XTr+DdMM0GEra++UkB2eP/0pjvWpYVhCU
         TqY83qcJoUYNckxibZHFwTPYJqpHvPxefUbg/H4ppV2SA4sFSqmlPHIFj80W1M9JPrZ1
         s6Eg==
X-Gm-Message-State: AOJu0Yw70tq1UmNDTnDpwTX7842m/0CJUuw1RtYk9XB+yADWUFH2HAYd
	JPIJNTUg0lqMhLBSxuIWJuqWdBVte0hpPwS7shWry8Lg9FETcJG1O15qN3ndlfvOCpYYXDt1R3u
	r
X-Google-Smtp-Source: AGHT+IGQ+JoB81mPv9dDN2BOVPwh58EKGChp4BOMiReGZ27ERwvaB7ZAh/R8vb7/dSvTncYXTEOvRQ==
X-Received: by 2002:a17:907:1c1f:b0:a86:941f:49ac with SMTP id a640c23a62f3a-a86a54dfaedmr124981666b.67.1724410321964;
        Fri, 23 Aug 2024 03:52:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/3] tools/ocaml: Drop OCAMLOPTFLAG_G invocation
Date: Fri, 23 Aug 2024 11:51:55 +0100
Message-Id: <20240823105157.991275-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240823105157.991275-1-andrew.cooper3@citrix.com>
References: <20240823105157.991275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These days, `ocamlopt -h` asks you whether you meant --help instead, meaning
that the $(shell ) invocation here isn't going end up containing '-g'.

Make it unconditional, like it is in OCAMLCFLAGS already.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Andrii Sultanov <andrii.sultanov@cloud.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/ocaml/common.make | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index cc126b749f56..708d74617c8d 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -11,8 +11,7 @@ OCAMLFIND ?= ocamlfind
 
 CFLAGS += -fPIC -I$(shell ocamlc -where)
 
-OCAMLOPTFLAG_G := $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\) .*/\1/p')
-OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
+OCAMLOPTFLAGS = -g -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
 OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
 
 VERSION := 4.1
-- 
2.39.2


