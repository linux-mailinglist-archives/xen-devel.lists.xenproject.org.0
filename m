Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CD95B12B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 11:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781623.1191117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nK-0003DS-OZ; Thu, 22 Aug 2024 09:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781623.1191117; Thu, 22 Aug 2024 09:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh3nK-00037Y-Kt; Thu, 22 Aug 2024 09:07:50 +0000
Received: by outflank-mailman (input) for mailman id 781623;
 Thu, 22 Aug 2024 09:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8+D=PV=cloud.com=andrii.sultanov@srs-se1.protection.inumbo.net>)
 id 1sh3mB-0002Rz-46
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 09:06:39 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ada0fc-6065-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 11:06:38 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5334adf7249so794967e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 02:06:38 -0700 (PDT)
Received: from EMEAENGAAD87503.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2e6717sm88948266b.96.2024.08.22.02.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 02:06:36 -0700 (PDT)
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
X-Inumbo-ID: d6ada0fc-6065-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724317597; x=1724922397; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cORQBguaRrQouCupVhe68zYd4OsX8uT6R2EJjrpteaQ=;
        b=MOdW12v15WQoXrweKS/DwZ/wBOrbCdw9QggTD4gV+5sKUdhNW76TrBF/fz3jOA5vzu
         kPgAPhsiSEdp2XBP9buyhL+mzSAGu8lefyP6kEh9hTDpxicbBUnR6pO+1NPZVTx7aux8
         ZH7Lhs7NgXFe/zxHvMR3ks4KGa5XLFQqVh8VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724317597; x=1724922397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cORQBguaRrQouCupVhe68zYd4OsX8uT6R2EJjrpteaQ=;
        b=I9iZHlN/FVsiOZ6OQ8b7gwitpnYQnHjy070pVnAGKYxSrhKw3w2kCmtmyZtlOFxHE1
         KIAQLNy+IrAUxXuUmggtZZPx7depoW1nabBnAuJBa8UlM2YPuYwviIFqm7DsejieanB4
         oFkxykc2kcGXdjGvBVxXUhqvH8DNYTUKbMQvIJsU/xUOjfV5uWLglcfQodJxP48qwuZ/
         ao4bFYAIvc+bH22H+zTvJQ3yiPGECnnAPvE98imO0cgwuGRuQkrqC70EGwgV6BukIReJ
         A5oMywFNvmnNFqElMS/W12u+pscbF5m/uT5QzfjLiFDBxIR+y6dXiRt0bxgWf5Nzuhtm
         7weQ==
X-Gm-Message-State: AOJu0YySCfphLfo8mJj5+tmcJ+FO7QODTkpk5Doq9ZaWXBitNdWqeopv
	BdK9Bbtk63aqtE6phpH5xSg5ofaQmH+aryBojUEWW5Gz/FAx8NPxbt/Y5p5krv+ivukINllNspr
	ICjM=
X-Google-Smtp-Source: AGHT+IFZoC7jcASMVLRGYIPkD8jDYYqSOXmqVpo3vYtIjOVyDqELzPmYTBq5UG2H7gbAjBder2DQiw==
X-Received: by 2002:a05:6512:39c7:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-53348602056mr3554992e87.56.1724317597214;
        Thu, 22 Aug 2024 02:06:37 -0700 (PDT)
From: Andrii Sultanov <andrii.sultanov@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andrii.sultanov@cloud.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 1/4] tools/ocaml/common.make: Remove '-cc $(CC)' flag from OCAMLOPTFLAGS
Date: Thu, 22 Aug 2024 10:06:02 +0100
Message-Id: <110f63b76a12e8a9fead09f47319a35229222953.1724314239.git.andrii.sultanov@cloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724314239.git.andrii.sultanov@cloud.com>
References: <cover.1724314239.git.andrii.sultanov@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag does not work as assumed and will not pass
options (such as -shared) to the C compiler:
https://github.com/ocaml/ocaml/issues/12284

Signed-off-by: Andrii Sultanov <andrii.sultanov@cloud.com>
---
 tools/ocaml/common.make | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/common.make b/tools/ocaml/common.make
index 0c8a597d5b..cc126b749f 100644
--- a/tools/ocaml/common.make
+++ b/tools/ocaml/common.make
@@ -12,7 +12,7 @@ OCAMLFIND ?= ocamlfind
 CFLAGS += -fPIC -I$(shell ocamlc -where)
 
 OCAMLOPTFLAG_G := $(shell $(OCAMLOPT) -h 2>&1 | sed -n 's/^  *\(-g\) .*/\1/p')
-OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -cc $(CC) -w F -warn-error F
+OCAMLOPTFLAGS = $(OCAMLOPTFLAG_G) -ccopt "$(LDFLAGS)" -dtypes $(OCAMLINCLUDE) -w F -warn-error F
 OCAMLCFLAGS += -g $(OCAMLINCLUDE) -w F -warn-error F
 
 VERSION := 4.1
-- 
2.39.2


