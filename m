Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12438AAD2E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708980.1108230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlyF-00056x-1P; Fri, 19 Apr 2024 10:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708980.1108230; Fri, 19 Apr 2024 10:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlyE-00055H-Uh; Fri, 19 Apr 2024 10:59:54 +0000
Received: by outflank-mailman (input) for mailman id 708980;
 Fri, 19 Apr 2024 10:59:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxlyD-0004qv-Fo
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:59:53 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2ebc58c-fe3b-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 12:59:53 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso1376808f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:59:53 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d678d000000b003462b54bc8asm4124418wru.109.2024.04.19.03.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 03:59:51 -0700 (PDT)
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
X-Inumbo-ID: f2ebc58c-fe3b-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713524392; x=1714129192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IpyU6bB2Yoz/g/udbj6gV4Aojd5EY4ysUMu6wK1sfI=;
        b=NIzyHGCvLCdfH/sKnWwLOWTOllDlhmX2RmA5jobQW08cmgDzkRxnXY89G6PraNFOW1
         +qSxixumWXpCaJGPuJtlwKI9RCeG9M5coROwuJv7QAFe0aUq9Qsw/shgd00H0bQUUMu/
         M1PADSJmLgGflzL0ViLjgy26d/cY/ye1/tftA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524392; x=1714129192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IpyU6bB2Yoz/g/udbj6gV4Aojd5EY4ysUMu6wK1sfI=;
        b=fiiEyx4ERun4oHBdjvmKSeneYXl6fhdO3IoslAE5xa5q5F7kay13vMoRidjP/ozUz7
         L58CKLW511BdZR3mxjNPwhDvqT9Zj5Bx6wtRkzXBN1Ou6i3m+OKda22Jit8LcEpbt08k
         lrXb1fVuyVRW7RMoXKc8HtpaWyUj3DdZmut1mRApS8drHugzENqk9wW68o+H1Enakith
         P6jez7W9jXgt8clUHQC3HOCFTJd71UOQSksHaA2RQycYX0dRNfUD+hCx0Wbo4hr4b3LK
         +81gxkTQMr//qNIXw5a358O+yHX59Ls5MmhkiUJOyiIZeenus3WgMaxq6AG4Xv3gS9af
         Oacw==
X-Gm-Message-State: AOJu0Yxb7ZcxOUK8apYx2jW/wHaG2YJ/JtmkfDP13clQg8ZDrpbg629V
	UvlYzwT3XlbtzFu13Jx/mMY5qkkAg0LNusoCmlqRfQ/oEu+WyszLpbTEZ+hmDTmFxbuAzxGjly0
	T
X-Google-Smtp-Source: AGHT+IFqhiL7KzDoFPtuu7ilwNxe+GW1TrC4x2RKqsbopZBMu4XZCIzJkC7QtkZK9UmSNuO/4jKnqA==
X-Received: by 2002:a5d:6d81:0:b0:34a:7904:8f9d with SMTP id l1-20020a5d6d81000000b0034a79048f9dmr329168wrs.9.1713524391995;
        Fri, 19 Apr 2024 03:59:51 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 3/3] tools/golang: Run `go vet` as part of the build process
Date: Fri, 19 Apr 2024 11:50:37 +0100
Message-Id: <20240419105037.700283-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419105037.700283-1-george.dunlap@cloud.com>
References: <20240419105037.700283-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Nick Rosbrook <rosbrookn@gmail.com>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index c5bb6b94a8..645e7b3a82 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -29,6 +29,7 @@ $(subst .gen.,.%.,$(GOXL_GEN_FILES)): gengotypes.py $(LIBXL_SRC_DIR)/libxl_types
 # so that it can find the actual library.
 .PHONY: build
 build: xenlight.go $(GOXL_GEN_FILES)
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(call xenlibs-ldflags,light toollog) $(APPEND_LDFLAGS)" $(GO) vet
 	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(call xenlibs-ldflags,light toollog) $(APPEND_LDFLAGS)" $(GO) build -x
 
 .PHONY: install
-- 
2.25.1


