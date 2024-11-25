Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C09D8508
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:05:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842438.1257964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXpA-0001yN-BA; Mon, 25 Nov 2024 12:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842438.1257964; Mon, 25 Nov 2024 12:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFXpA-0001ve-8b; Mon, 25 Nov 2024 12:04:16 +0000
Received: by outflank-mailman (input) for mailman id 842438;
 Mon, 25 Nov 2024 12:04:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5yF=SU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tFXp9-0001vY-Az
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:04:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60fd34c5-ab25-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:04:10 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa539d2b4b2so268374766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:04:10 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa51ae7e5a3sm418487266b.160.2024.11.25.04.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 04:04:08 -0800 (PST)
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
X-Inumbo-ID: 60fd34c5-ab25-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYwZmQzNGM1LWFiMjUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM2MjUwLjM3MjY1NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732536249; x=1733141049; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=baQsv/hOgPhHVgAbaWjlDOjzfwq6MJI0fQja5QTMRwM=;
        b=M6GugG1v26r/nw6cyePjqVcgPSxf/qmtCv7Kzf2GaTZNzFPNhDfuNtXHOuokQO2Ud9
         Q+ry6XZ0yH5ClgNzshqeG9amlqmaY4MrMFBG4sUrSVhoNfBNfQUt0aw8/oJHFEBd4QoQ
         x5qmbMe6WQQaq/FTRAJl2SAITNX3TRstd+weg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536249; x=1733141049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baQsv/hOgPhHVgAbaWjlDOjzfwq6MJI0fQja5QTMRwM=;
        b=xA2/HkjdDNxptS7Z7KsWi7exrxDIlE45IfZ7eFQPMaemy9ZZQyf4XlyHV24nVGIPWL
         ulfSsgzGb5IQr52yo63q2vpeVv4nnuib3Y2IJLh0C4MTG6M0PoWJmMlMfaryRRGb/CKZ
         7dLS255gDG6UiozUCRvl5UR8ex5Dm8NMZJuFpgIqhbOklUvwUlbrkmbox5aN8bLCAJpo
         a0Qw6eEIHnc34XDW+BjuWbVzplFHacAP1poE0DSnxOrn1hniTQ3Q0h0mhJHmsfIb+EWH
         1ZZyMmEROD7hBzL7BEdldhr1QZ3A2+Ipv3sZfS+97zohGytntdxVi4EeRp2E60a9povm
         JO6A==
X-Gm-Message-State: AOJu0Yw8aONq8xSukBvTau5fxB9A61LkSXDZgFsaVT27D1ylyI7YWJHm
	3nxRobcCJbCHO/geO82FyVCcT8aYIluWUhkV7gkEQ1WlhXV6lYyhM1amxiG2qJkr27106j0R9lI
	P
X-Gm-Gg: ASbGncuVpNhr3sGiqBtaK42fZAYELTYi7xY5cDEFZ5Mt+8gZGLmP6VUI8NqOpoal3Qp
	uwPgWvLsrDJlHgjsMmCBVEwMzuPPyjdtQ4Dv0TydyzQYP5Zm1pS5itO7/iLkFzW5DFIDYj7ReNH
	nYJQa4L8bwvSgV/bDT51au+OOTLkIi/KvHHGzNLy8PsjBW1GU2dv8wk1xm7AyA/AsaYl3T/R3aB
	+FlAU9FEoqX9sz8gLLi7DKyuCEvY4rICdhFYH22M1tR4wJ8ErBWe3QDhwY2plEpnkwyO0ZugJfr
X-Google-Smtp-Source: AGHT+IE+pNlKzAr7O2PP3lK0+fqqaB/la+cBea1ioHcDl8KnROfnsB5jyGiQhchD1XJ4GJDLmYZqDQ==
X-Received: by 2002:a17:906:3098:b0:aa5:26ac:18e2 with SMTP id a640c23a62f3a-aa526ac1a18mr760026666b.23.1732536249323;
        Mon, 25 Nov 2024 04:04:09 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] build: Remove -fno-stack-protector-all from EMBEDDED_EXTRA_CFLAGS
Date: Mon, 25 Nov 2024 12:04:06 +0000
Message-Id: <20241125120406.3258813-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This seems to have been introduced in commit f8beb54e2455 ("Disable PIE/SSP
features when building Xen, if GCC supports them.") in 2004.

However, neither GCC nor Clang appear to have ever supported taking the
negated form of -fstack-protector-all, meaning this been useless ever since
its introduction.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 Config.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.mk b/Config.mk
index f1eab9a20a66..fa0414055b93 100644
--- a/Config.mk
+++ b/Config.mk
@@ -190,7 +190,7 @@ endif
 APPEND_LDFLAGS += $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
-EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
+EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
 XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles

base-commit: 2e853c19204e2d660a8becf4b377cc99216854dd
-- 
2.39.5


