Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F2A96797
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 13:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962508.1353711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7BuG-0005HQ-Dk; Tue, 22 Apr 2025 11:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962508.1353711; Tue, 22 Apr 2025 11:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7BuG-0005Ei-B4; Tue, 22 Apr 2025 11:35:16 +0000
Received: by outflank-mailman (input) for mailman id 962508;
 Tue, 22 Apr 2025 11:35:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7BuF-0005Ec-Hs
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 11:35:15 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db8dd3a1-1f6d-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 13:35:14 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c14016868so4978056f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 04:35:14 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5d7a3dsm167656355e9.38.2025.04.22.04.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:35:12 -0700 (PDT)
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
X-Inumbo-ID: db8dd3a1-1f6d-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745321714; x=1745926514; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLl2IiuN1Ius5KXo58ziw+JF/UvN8/kRxgfNqrTmPcs=;
        b=CvWDjrBaVN46jrmDm/CtHVQsDloel1t2zVGS00oSjwOcTg7m7sVVcHQOqS2PnVGtzH
         eMS5yDwe6J/wXg+DRSK+xp2vhdge1LlGxRx/3FEfRr83uTDJJ2B1eI9mzgAdsnRLvJtL
         hxJR0p4eIYwPO8FOJX33n23eUC3nHdIef56HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321714; x=1745926514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLl2IiuN1Ius5KXo58ziw+JF/UvN8/kRxgfNqrTmPcs=;
        b=kcBvLwlY4RGHaaZaV3OSu1HHnuWJQCcLO+VRj2qq77Zck8nSTe2dGur+wIO3BGWWSH
         ery9ogB+lITTDlpqTRWv82NxQb4eA83XUA4CuZ//POhiVrYA9NfAAT9KfG0Or3+ZPCPo
         hb1H7HxkaYscaRLqnnfe33M6l7Kxemh7aUyLaEHKAz++fdcpgY9HybOrfpIO809eOfUf
         yHJ0tvQc28Cg6SDZB0vUnGJ49tIQVOo3xZvNGG4rOiSL1lnIUnDZWM7vXYJm0okYYCNL
         0Uv//p4w7K3+C0x48d/v4eaY+dLDfnJXyN+IoKyRuGzoZkR72CS5E2UgNs1P8Q3lwXvf
         4kUg==
X-Gm-Message-State: AOJu0YzitQV72dIxlO75WBT25ST1GGbl7XagnyfNAerHnqYUV3Aavi5w
	r8Ak9zsg9reZT8XIF0x7TudrV0Q9mqSy9iAkYrQY31HY6zrlNmHBCFSMW7UsrrER2L8w4eU/ewn
	x4B7SSQ==
X-Gm-Gg: ASbGncuLitAXVBzxgr9jrcy/13por7VpFunaq1OB/MP3HdDpE1ESePGUCGFD0JkF0B6
	9NhszinoXtG0pwzJccXPPtQAAaz7peE6SrmZwISCJHa5uu1Oud/4rVKEKb2aaAggcGNMPkVOuF1
	blYlV2UNe0KZFaaPfZK3R1nc15eIkNmwLzBBOL8lIPrtXwjSh+ueJPZgMu+5zWZBkgw4i3kON9g
	FBeaTvzVYIjeAtKU3upqePjudeIk48xqSaJGxSwCc4cdYJRK2/aDhmfZeMF3dgWwEL5pMAQR/za
	os8XJCy3mWhoVR5NH6rqGKEh0BMyFzkrI1wSdz7a3TtsZ0sYeO4sGxsm/LpSOuUOwJRxbfJM
X-Google-Smtp-Source: AGHT+IHdNlS/YQuZ79G4+papOZakmYteO53HzCogr+9/V7qKlaJqQ3Zcr8R8VS4if9C24G8cRQbSgg==
X-Received: by 2002:a05:6000:2483:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-39efbaf2590mr11348414f8f.50.1745321713930;
        Tue, 22 Apr 2025 04:35:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen: Drop CONFIG_CC_HAS_UBSAN
Date: Tue, 22 Apr 2025 12:35:09 +0100
Message-Id: <20250422113509.1286581-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All supported toolchains now have it.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/Kconfig       | 4 ----
 xen/Kconfig.debug | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 2128f0ccfc0b..72fdb8376087 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,10 +37,6 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
-# Compiler supports -fsanitize=undefined
-config CC_HAS_UBSAN
-	def_bool $(cc-option,-fsanitize=undefined)
-
 # Set code alignment.
 #
 # Allow setting on a boolean basis, and then convert such selection to an
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index f7cc5ffaabd7..c4a8d86912e0 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -98,7 +98,7 @@ config SCRUB_DEBUG
 
 config UBSAN
 	bool "Undefined behaviour sanitizer"
-	depends on HAS_UBSAN && CC_HAS_UBSAN
+	depends on HAS_UBSAN
 	help
 	  Enable undefined behaviour sanitizer. It uses compiler to insert code
 	  snippets so that undefined behaviours in C are detected during runtime.
-- 
2.39.5


