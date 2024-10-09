Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FA996F71
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 17:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814783.1228465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYPW-0000O4-VI; Wed, 09 Oct 2024 15:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814783.1228465; Wed, 09 Oct 2024 15:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syYPW-0000MX-Rp; Wed, 09 Oct 2024 15:15:34 +0000
Received: by outflank-mailman (input) for mailman id 814783;
 Wed, 09 Oct 2024 15:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0zC=RF=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1syYPV-00005W-SX
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 15:15:33 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 537ab2b9-8651-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 17:15:32 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c876ed9c93so8500869a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 08:15:32 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c91fd5d187sm857407a12.82.2024.10.09.08.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:15:30 -0700 (PDT)
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
X-Inumbo-ID: 537ab2b9-8651-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728486931; x=1729091731; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ju2kM2mYSSWRFs2/nqiW60BKRRcAKuBu3INuqHaX0ug=;
        b=EDQJNe+Q+BykQPP00k7/TUQNsXZ4hUBsFNGZ0WwdktkSFWHwAgM5sGuV9azvm0KcSc
         u0Ft6Rht9VYsxEaW4RPUm+g9++O03As1dCpQZdprF6bQqWJUjj08JJcVs8KxjkESXogv
         QcNKrQOiW0BEMSbIHfsiey7ccDjBEWQdeJlYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728486931; x=1729091731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ju2kM2mYSSWRFs2/nqiW60BKRRcAKuBu3INuqHaX0ug=;
        b=OirOuu0RetNczuJ9knsHA/H0i7SsIZqsdFc8x1Mh5Mo0iV3QAyi8g3KXYtpcxD9gWK
         bBzUSHvStUFeQN0ZqWrnRdZNQrd5Vbo2nijpwxYkqF96qbiXdbgb2iIW43ZRrF0dxqSj
         dRWZ0rutHxKhQ8n05YFS4bj0LomPq5d/5K0ROAP9mbpcpOyfNUqSMBy4o6zRc6mwC5ym
         T+LhT+cSfHpiDMIboi/svt5rAX4PPtigD0vju1SgWmgNNTwuQR7+A5xdY2aQ7MXbm6om
         QxFt10FJAneSGKj1Ro5u6i42hfL6cdTMr35NEwvSF6aYmoBG5E2yW7iv+P9fth2q//gg
         Orsg==
X-Gm-Message-State: AOJu0Yz36rLR3hKxJIqCC0p9PuO9YuTgR4EI09e5ROSdpSjWoIkjQTMg
	R+xkWcmoQ22cMEokqbw5rEZz80hKuQHgxdAVPeu4qe1+qLCYpTG3AUSvlOB7YzlNHNTH2qvZx2L
	m
X-Google-Smtp-Source: AGHT+IGSXl+oLbFe9cCF3IuLKbiz9K5jDuAUlUZitTFFp76aXHMPXnePB8nzTyws9CF3wDxOpN2Xaw==
X-Received: by 2002:a05:6402:13d4:b0:5c9:29f3:fba3 with SMTP id 4fb4d7f45d1cf-5c929f3ffe1mr1365525a12.20.1728486931437;
        Wed, 09 Oct 2024 08:15:31 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Edwin Torok <edwin.torok@cloud.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 1/1] ocaml/libs: Remove xsd_glue_dev package, also install plugin_interface_v1.a
Date: Wed,  9 Oct 2024 16:15:20 +0100
Message-Id: <c9b47337615168e38fb6af2a80409f0a38ead901.1728471268.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1728471268.git.andrii.sultanov@cloud.com>
References: <cover.1728471268.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xsd_glue_dev packaging is inconsistent with the rest of OCaml packages
and isn't actually necessary. .a is needed alongside compiled bytecode
files during linking and was missed in the initial oxenstore plugin
work.

Specify OCAMLCFLAGS along with OCAMLOPTFLAGS.

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/libs/xsd_glue/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/libs/xsd_glue/Makefile b/tools/ocaml/libs/xsd_glue/Makefile
index f84291f7fe..be68642968 100644
--- a/tools/ocaml/libs/xsd_glue/Makefile
+++ b/tools/ocaml/libs/xsd_glue/Makefile
@@ -5,6 +5,7 @@ include $(OCAML_TOPLEVEL)/common.make
 SUBDIRS= domain_getinfo_plugin_v1
 
 CFLAGS += $(CFLAGS_xeninclude)
+OCAMLCFLAGS += -opaque
 OCAMLOPTFLAGS += -opaque
 
 OBJS = plugin_interface_v1
@@ -28,14 +29,11 @@ OCAML_NOC_LIBRARY = plugin_interface_v1
 install: $(LIBS) META subdirs-install
 	mkdir -p $(OCAMLDESTDIR)
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue
-	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_glue META $(INTF) $(LIBS)
-	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue_dev
-	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_glue_dev META $(INTF) $(LIBS) *.ml *.mli
+	$(OCAMLFIND) install -destdir $(OCAMLDESTDIR) -ldconf ignore xsd_glue META $(INTF) $(LIBS) *.a
 
 .PHONY: uninstall
 uninstall: subdirs-uninstall
 	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue
-	$(OCAMLFIND) remove -destdir $(OCAMLDESTDIR) xsd_glue_dev
 
 .PHONY: clean
 clean: subdirs-clean
-- 
2.39.5


