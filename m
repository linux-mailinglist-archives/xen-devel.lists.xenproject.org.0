Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14695CB00
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 12:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782253.1191758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtp-0004xn-AZ; Fri, 23 Aug 2024 10:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782253.1191758; Fri, 23 Aug 2024 10:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shRtp-0004v0-5X; Fri, 23 Aug 2024 10:52:09 +0000
Received: by outflank-mailman (input) for mailman id 782253;
 Fri, 23 Aug 2024 10:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shRto-0004C8-2B
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 10:52:08 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd18eb0d-613d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 12:52:06 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53349ee42a9so2238683e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 03:52:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f47d1c3sm239923866b.169.2024.08.23.03.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:52:03 -0700 (PDT)
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
X-Inumbo-ID: bd18eb0d-613d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724410325; x=1725015125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOO1eSHIi4Cp4U+gzj0SV1mncIJwBvzbwJEtLZVYyyo=;
        b=LXqrBm9jc3iTF4uWJ2V/OtooWfFilQ9V0Gvd+6roQs+EVErcWvgJH+v3ylTHkNWtc5
         9FXVfzycbKDgQnlKJra+YTb5vEXRm0Fg90umkb/BXw0ZLw2vPw3klzNIF6gW6hJfJm4r
         AjNGJw+mns0RZblHQFb5b7a9vsvgOmTK307VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410325; x=1725015125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOO1eSHIi4Cp4U+gzj0SV1mncIJwBvzbwJEtLZVYyyo=;
        b=FZag2Fk1NsanwK3sFFrkkd6aYpdAfeOQ7ZY5Q+POAYPhWyK/zRqMy/eFaj9RFppzyZ
         2j33hbiXFuMfpnsttbnkRm83drlJIr+7FGOzKlF1yVTo5bjJ1qrYAILJ5yqP3sSpaCEP
         XUlv+rBI8TqvEt9DjZOHPfnNqR4sSHdv/D641MfAXZVsV02YLoEUV+0oXxKLkgVi+Ox9
         E8zKYJ+4CeLsH0MWL/rlaIndn+PBGiSA4+4vZwr/I9dVaezbpqqzZ66P8sOAwDymw5HC
         f2xY2GFQkIIOdmZBI1eENXd9UHgbk6bw4wHiKcrJ8lgHPMeveSE9sxMgWxsqQ2Fr6uf1
         47JA==
X-Gm-Message-State: AOJu0Yx/Un3a+cy8icUFztwDyKGlCsu3ADLKtvqVz7qEzUzyCWqkBbN+
	0JoeyiiC5Ye2emd3HacqKF1x0pAzqEewkb3dFbh45u9x/9UbZ71t2nTHVoJZ/dDvsH+l7xvHRXx
	3
X-Google-Smtp-Source: AGHT+IEm3ot/zVxHC2E2B3CkRESeaW8QA/4ox9ba7+IvF9XuWYo+sm2A4tYv/MY/idy8qxh+1UeJcw==
X-Received: by 2002:a05:6512:6cf:b0:52f:413:7e8c with SMTP id 2adb3069b0e04-5343877870fmr1472471e87.14.1724410325081;
        Fri, 23 Aug 2024 03:52:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Rob Hoes <Rob.Hoes@citrix.com>,
	Andrii Sultanov <andrii.sultanov@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/3] tools/ocaml: Fix the version embedded in META files
Date: Fri, 23 Aug 2024 11:51:57 +0100
Message-Id: <20240823105157.991275-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240823105157.991275-1-andrew.cooper3@citrix.com>
References: <20240823105157.991275-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen 4.1 is more than a decade stale now.  Use the same mechanism as elsewhere
in the tree to get the current version number.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
CC: Andrii Sultanov <andrii.sultanov@cloud.com>
CC: Anthony PERARD <anthony.perard@vates.tech>

We could use autoconf for this, but it's rather more invasive and there's
going to be a reasonable amount of churn in this area anyway.
---
 tools/ocaml/common.make | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index 979cbe08459b..c7eefceeb42b 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -14,6 +14,6 @@ CFLAGS += -fPIC -I$(shell ocamlc -where)
 OCAMLOPTFLAGS = -g -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
 OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
 
-VERSION := 4.1
+VERSION := $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 
 OCAMLDESTDIR ?= $(DESTDIR)$(shell $(OCAMLFIND) printconf destdir)
-- 
2.39.2


