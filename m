Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25CD8AAFFE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709099.1108362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxonC-0008RV-SB; Fri, 19 Apr 2024 14:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709099.1108362; Fri, 19 Apr 2024 14:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxonC-0008Lg-PI; Fri, 19 Apr 2024 14:00:42 +0000
Received: by outflank-mailman (input) for mailman id 709099;
 Fri, 19 Apr 2024 14:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zESt=LY=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rxonB-00084S-99
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:00:41 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33ff9bc5-fe55-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 16:00:39 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-69b40061bbeso12294026d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:00:39 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a0c8d89000000b0069b7eb7edebsm1582413qvb.71.2024.04.19.07.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 07:00:38 -0700 (PDT)
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
X-Inumbo-ID: 33ff9bc5-fe55-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713535239; x=1714140039; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IpyU6bB2Yoz/g/udbj6gV4Aojd5EY4ysUMu6wK1sfI=;
        b=W9d1GNWnDAPO1163bhqav6L5LF0aF1qmUbVuYRm+wYfZI3vhSH7E58ruauUIl5aFCz
         58/XqqC03mhCQMpeTbl++dLgtz97Jsm0o34uEWV5j4TViWbTQ0BjRsbiaDkAXgP7+7SE
         +kCYXeR5Tng0yJvygES/ruX+glaxue/3eLgxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535239; x=1714140039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IpyU6bB2Yoz/g/udbj6gV4Aojd5EY4ysUMu6wK1sfI=;
        b=BvyUDh78T8qd6oTdry2Z3XBqR9stjmUqQ0ucGzsFUhaa2E1O1FehklFJv9k24/8cnn
         pndO5fmklgcBgSGkFonWGMBGBTeH4kuVVCvy17nZWMt247dGsuo4JKX6I3FM3xYmYxoh
         LDiN2UA7ibF5JjaufOz/1YduwNov2f7Gw1QzmQ63L56Y+lpFpp/uTLTa0h0ym6F4TPLS
         +1fNxifqqPlc2G8VEUszhXfbfONwJ/w5KkTsFQp1b4p/FNC/1rdvocD4j4pwcTlMmR2j
         /V0j2DCpSJEqomc3WOQLsqH8O43Txnyz5lfNssXgo9keAzXbhuyCbliRcBGbuTiEpXj8
         3cNA==
X-Gm-Message-State: AOJu0Yx/uKvzmfg14PtUEs6KpL6D73uly8h0ePBJp19QHvvlCuWeJU7t
	OVeOEoMMwXoMGaTzcsk/RgnK104/XSxxW9rl9KB3ywWwhUKJ7aAOPNzQuBmffmAyQo5KS4StTna
	J
X-Google-Smtp-Source: AGHT+IHjGX1ASP4DvZlr/HNYTJgoTtXcmTR4JaD9B4zkovDE64ApCQn1KzJXNcelylAbdHA7OsFaSw==
X-Received: by 2002:a05:6214:5603:b0:69b:14cb:234e with SMTP id mg3-20020a056214560300b0069b14cb234emr2401022qvb.39.1713535238682;
        Fri, 19 Apr 2024 07:00:38 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 3/3] tools/golang: Run `go vet` as part of the build process
Date: Fri, 19 Apr 2024 14:51:20 +0100
Message-Id: <20240419135120.830517-3-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419135120.830517-1-george.dunlap@cloud.com>
References: <20240419135120.830517-1-george.dunlap@cloud.com>
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


