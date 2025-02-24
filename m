Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D3A426B7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 16:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895219.1303815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmadQ-00063x-7v; Mon, 24 Feb 2025 15:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895219.1303815; Mon, 24 Feb 2025 15:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmadQ-00062M-4n; Mon, 24 Feb 2025 15:44:44 +0000
Received: by outflank-mailman (input) for mailman id 895219;
 Mon, 24 Feb 2025 15:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=48j1=VP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmadO-00062C-9T
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 15:44:42 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41be60f8-f2c6-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 16:44:39 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce319so3858061f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 07:44:39 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258f5fabsm31527479f8f.45.2025.02.24.07.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 07:44:38 -0800 (PST)
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
X-Inumbo-ID: 41be60f8-f2c6-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740411878; x=1741016678; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yRQZOXAfGkSpPSwXxxEsasOEgxUNrZvgxy+Z4QB59yA=;
        b=GcK9w6IOd2fINGu/+xcQJeOEx9domKumGSAlOVdGfsJ3/WafzpDpykDc3YgCms+tP0
         Efqdb2e1HAq8oRQOLUNMBATzI8dri56cZ12HDHwhfwNLJBneVm7fek/1vXxUQ/yTjpd4
         bGRCBdVB23FjNzhwva54f3k29Vej7aIdi6sIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740411878; x=1741016678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRQZOXAfGkSpPSwXxxEsasOEgxUNrZvgxy+Z4QB59yA=;
        b=qd81ty/034KrliW7GkVdySAKIcOzkRmeQKr9P1wz3+gPl2NbGKV0KOgulEzK+CoEuA
         VCNlhS3YQdbcObM/nUKRV2HW0MRfUDUAGpNoc+zzZIyzer6V5xSW+63KoGpcSmNtRVtS
         QaaiDKb9yZmmL8dSMk1SsdRP1//71Nn8weEwccWUrqyOkjaLDzcHia7L2MmsJCfBt5bv
         4xlpX3gZMGckgFJCKgGmodGoVx7OUZYnT2g31Ty7QcO8cWl+pyK9a5GvIbRPq5vUo/W4
         LFOUVH0rjbHL6bVbn9EspyU6i0XxYItfUtwzNRXv+QiE2glYHPlNknqyygoAJq6MtCQv
         9WXw==
X-Gm-Message-State: AOJu0YzNz6aBF7bLECnA3QqX0EPovGfNJBfHu5hs7khfk7nd716AJYPc
	RsrDf5JnlBnkvlFJ6orCkL/myI7BUJoHiE+sGipvBG9WXxUMZtMZ30+SdnA/yah/wAi5HiNE08T
	F
X-Gm-Gg: ASbGnctet9YNPDEEbOTER6PpcgYDzz/PgaeYWP1k9s/IyU++nOwKvRsSeIxYi2onSOu
	AesXtIeqS073oKuTV2lE1kyvYoyp89vgqC0Oe3Oq0doG+gEmL9MCadTPV3U4DBbBPSV/vctv9Fy
	BSigD1ulM7qv4Waz5erRZ/oWpKZx/6cZSa+SPDJG5iq8jaWqQ4kMx3de6N7+7Tx9BavCv0Qldhu
	ltLgIvmeNd6olQkfa6hp8QWczpb4lZerTwaCFmAU8xiL+iRWRxPn3j2P9fWCH9N+a0Y58FH4khf
	31cjDAgNCJiGv3Yeo1cDbc/bdpMPrraNOtHZ84DxqvjIEWwIPEEXAOi2rYO8nyNs62eqr26N4zR
	SA1+1wA==
X-Google-Smtp-Source: AGHT+IFC8Rw4CHciaMuDmujxcy4FLQOfdjUJXEpzXpKBOm4guyT4+cskLb7a5OYTcLJDNBgI0cBWJQ==
X-Received: by 2002:a5d:6482:0:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-38f6e755c4emr12399245f8f.9.1740411878535;
        Mon, 24 Feb 2025 07:44:38 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] CirrusCI: Use shallow clone
Date: Mon, 24 Feb 2025 15:42:36 +0000
Message-Id: <20250224154236.1116264-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reduces the Clone step from ~50s to ~3s.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

Example with shallow clone:
  https://cirrus-ci.com/task/4625566281760768

Example without:
  https://cirrus-ci.com/task/5338544140451840
---
 .cirrus.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7216729b6993..e2949d99d73a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -13,6 +13,7 @@ freebsd_template: &FREEBSD_ENV
   environment:
     APPEND_LIB: /usr/local/lib
     APPEND_INCLUDES: /usr/local/include
+    CIRRUS_CLONE_DEPTH: 1
 
 freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
   << : *FREEBSD_ENV

base-commit: e16acd80674002cbc6b51626e826bd6f9f624a63
-- 
2.39.5


