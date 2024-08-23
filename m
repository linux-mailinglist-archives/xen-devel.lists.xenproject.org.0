Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF895CB01
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782252.1191747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtn-0004hC-Ue; Fri, 23 Aug 2024 10:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782252.1191747; Fri, 23 Aug 2024 10:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtn-0004fY-QI; Fri, 23 Aug 2024 10:52:07 +0000
Received: by outflank-mailman (input) for mailman id 782252;
 Fri, 23 Aug 2024 10:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shRtl-0004CD-V1
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:52:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbd76ab1-613d-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 12:52:04 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8677ae5a35so220457066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 03:52:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f47d1c3sm239923866b.169.2024.08.23.03.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:52:02 -0700 (PDT)
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
X-Inumbo-ID: bbd76ab1-613d-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724410323; x=1725015123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkmqzo+FkSOQbrEOiUy8aC0COpKqGUWCpQCBif5I/0E=;
        b=UfFlb9peOR83wCMpgSL8IM6EIgZoGrT8fn+6OtQkdcI1mkm/bRmLK5zj/WuYKO8Xbb
         wBINtuuSn8V13RfkqeZNsKSeCGa0H8+qO+UVYKPRYeKLGwa6hTdhRYkTUbdrX8g2EtcY
         Eh48w89Bh2r9BQx7XP08fwb8W34XVqJcDUNbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410323; x=1725015123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkmqzo+FkSOQbrEOiUy8aC0COpKqGUWCpQCBif5I/0E=;
        b=fUcilPa6n5AFW4pc/BhKZ8CALBbmQvXOK4m4b3F24pLNV+2q5HrTkeQznlglTgnfD5
         BbC6FOX7FIrbtb8+jMDc5nUfXlL/qSfPXR9spT1uViSmh3NeupmmwlxgUV+KefPqDjKG
         avsNjfBzyYAa9loEAZQiDo9nBJXwmpgfOSOWsmlpom30tYXUQuELO8mOp1LIy60ribs6
         8Lhkd7xyPG5BlpI/A8PAn0EnuFirnxT4FcnonaZzmmxVM4kk1QTyzQamFSxxURJ4wpR+
         pLpYrd/GIW/lyd3iJKcE1BjX1O/hDYJ9eoL9CCl/x4SoGcl8cfMZRMa6IL9bHpA90Y2R
         q8Kg==
X-Gm-Message-State: AOJu0YwRKcBxdp9520NhcMxaf9CQl2OPK5yt8SMFc6YTePHx+mbRQsQ2
	2w1oXen8IOmDXzebUjcJH0kBqa1hOJub0kayxU+G/KTbXv/gwuiQwRLwMTzkgV70FhsywepD6RX
	2
X-Google-Smtp-Source: AGHT+IGlQ1yte3xGjuGnwK9O4z3ou2vvpqXd81DCNTbUTe8SM3S0T2YqVc+EgRMHpNXdEbOnbmkjYw==
X-Received: by 2002:a17:906:d264:b0:a86:a1cd:5a8c with SMTP id a640c23a62f3a-a86a52bb759mr120712666b.22.1724410323102;
        Fri, 23 Aug 2024 03:52:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 2/3] tools/ocaml: Drop o= rune
Date: Fri, 23 Aug 2024 11:51:56 +0100
Message-Id: <20240823105157.991275-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240823105157.991275-1-andrew.cooper3@citrix.com>
References: <20240823105157.991275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This hides a shell redirection which is quite rude.  It also opencodes
$(move-if-changed) without the benefit of short-circuiting dependent logic
when the content hasn't changed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Andrii Sultanov <andrii.sultanov@cloud.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/ocaml/Makefile.rules | 5 +++--
 tools/ocaml/common.make    | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/Makefile.rules b/tools/ocaml/Makefile.rules
index 5638193edf8a..5d534d8754bf 100644
--- a/tools/ocaml/Makefile.rules
+++ b/tools/ocaml/Makefile.rules
@@ -40,13 +40,14 @@ ALL_OCAML_OBJS ?= $(OBJS)
 	$(call quiet-command, $(CC) $(CFLAGS) -c -o $@ $<,CC,$@)
 
 META: META.in
-	sed 's/@VERSION@/$(VERSION)/g' < $< $o
+	sed 's/@VERSION@/$(VERSION)/g' < $< > $@.tmp
+	$(call move-if-changed,$@.tmp,$@)
 
 ALL_OCAML_OBJ_SOURCES=$(addsuffix .ml, $(ALL_OCAML_OBJS))
 
 ifneq ($(MAKECMDGOALS),clean)
 .ocamldep.make: $(ALL_OCAML_OBJ_SOURCES) Makefile $(OCAML_TOPLEVEL)/Makefile.rules
-	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli $o,MLDEP,)
+	$(call quiet-command, $(OCAMLDEP) $(ALL_OCAML_OBJ_SOURCES) *.mli > $@.tmp; $(call move-if-changed,$@.tmp,$@),MLDEP,)
 endif
 
 clean: $(CLEAN_HOOKS)
diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index 708d74617c8d..979cbe08459b 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -17,5 +17,3 @@ OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
 VERSION := 4.1
 
 OCAMLDESTDIR ?= $(DESTDIR)$(shell $(OCAMLFIND) printconf destdir)
-
-o= >$@.new && mv -f $@.new $@
-- 
2.39.2


