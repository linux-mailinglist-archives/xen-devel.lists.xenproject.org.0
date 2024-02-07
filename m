Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D771184CD68
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 15:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677724.1054536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLR-0007E2-2B; Wed, 07 Feb 2024 14:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677724.1054536; Wed, 07 Feb 2024 14:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjLQ-0007Bx-Ty; Wed, 07 Feb 2024 14:56:12 +0000
Received: by outflank-mailman (input) for mailman id 677724;
 Wed, 07 Feb 2024 14:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvxy=JQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rXjLP-0006gr-EA
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 14:56:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08055efc-c5c9-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 15:56:11 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so94407466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 06:56:11 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 l16-20020a170906415000b00a3551f727d1sm830912ejk.68.2024.02.07.06.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 06:56:09 -0800 (PST)
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
X-Inumbo-ID: 08055efc-c5c9-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707317770; x=1707922570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akzbcc4EuKcp9VAzRO87Fc+0Red8uqWWSH8LHiM9Mf0=;
        b=LrE13oNnVGeF2t8ZuvKIRL/aM/6H+SDnBqPHYRVcwsUjCX+aGkGxbf7DRDLWgM3P1A
         FnM9omA+Kcd+dNFrnmokH0r93wTq8HDZY4JM22Zp1RNIyrxLdgeuFk2MkQIctbTXpPrH
         ra/7xCxG9EV/yAtitpZ0LA9IF7cjLFuVaYg2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317770; x=1707922570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akzbcc4EuKcp9VAzRO87Fc+0Red8uqWWSH8LHiM9Mf0=;
        b=iYgNg7Jl6ttsYGAnol9eiTrdhP3fNKJj4bNfu8/FbBfLwv1lKQLZVYd/H8UEJglkCC
         yV51pVbU/Mxi24U1rQCR0Z02IH0cztjs4Sz+wesV5tp6I5kmWhhRAhau3KedXMZgymM9
         Y1ir6EXq8SqOCTaJWsJmqCIKp8QWPtOMkQgVZelp4EWE0tQP2uNSyQ4sxABh0IT04rbu
         CSkdWR5WFrx71coqX2KrPJuAJpkcYNgqw7lA6qg7OZwjkIx/PU0H5WnLF4318Mp6nWGT
         13eWCnyUda8rECXzmCtTi8di23XTn8exAfXXhEI9WbLx+bPl0W3tM24L8Scs6SH9hB7W
         q6nw==
X-Gm-Message-State: AOJu0YwFMLrFCQ47Ln/xumNFCxsOERy3e85DaoTaK5gvscw4w+4azjQ9
	BoW94xL1CJR5aF20QQU3SHpin721BOm2/LVJkaM1umGivth6+R/nJvDGBHSv1ftFUHREPhKBVgA
	B
X-Google-Smtp-Source: AGHT+IF8t8/nmL4BjDrYilxRzo93JsRzkWnYIJ8/PI+xuH0RzNl3UwwXRYn8sWqNsbYCRRDf0zCEIw==
X-Received: by 2002:a17:906:69d6:b0:a38:970a:75df with SMTP id g22-20020a17090669d600b00a38970a75dfmr649647ejs.15.1707317769901;
        Wed, 07 Feb 2024 06:56:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgtHNKg/CEiKIRnL5cmUT1iguKf8bV8fxszMgMhEi6x7dMwAsGFPeRh3psns0y2/JQiVz17gW6BoXCO22hyvH7+RGiZJeZkajNtS7qt47yb/wQnFgWzumfwPbBGnD5wQ9KCQXmDrgAogtwnUCSPC4ZHLSWlazXgJ3LP9CIUr+hEBrCx2cLHdpVWQp5/MFilRrbQzaxQEOMq0wd9q6VeOMCq0sMB6BDRBZpTw==
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/3] xen: use explicit function alignment if supported by compiler
Date: Wed,  7 Feb 2024 15:55:46 +0100
Message-ID: <20240207145547.89689-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207145547.89689-1-roger.pau@citrix.com>
References: <20240207145547.89689-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce a new Kconfig check for whether the compiler supports
-falign-functions and if supported use it to align functions to the per-arch
selected value, just like it's done for assembly ENTRY() and FUNC() symbols.

Note that it's possible for the compiler to end up using a higher function
alignment regardless of the passed value.  Different compilers handle the
option differently, as clang will ignore -falign-functions value if it's
smaller than the one that would be set by the optimization level, while gcc
seems to always honor the function alignment passed in -falign-functions.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v5:
 - New in this version.
---
 xen/Kconfig  | 5 +++++
 xen/Makefile | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index 1e1b041fd52f..040cba1b4b73 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -41,6 +41,11 @@ config CC_SPLIT_SECTIONS
 #
 # Allow setting on a boolean basis, and then convert such selection to an
 # integer for the build system and code to consume more easily.
+#
+# Requires clang >= 7.0.0
+config CC_HAS_FUNCTION_ALIGNMENT
+	def_bool $(cc-option,-falign-functions)
+
 config FUNCTION_ALIGNMENT_4B
 	bool
 config FUNCTION_ALIGNMENT_8B
diff --git a/xen/Makefile b/xen/Makefile
index 21832d640225..7c8249ab3a33 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -390,6 +390,7 @@ CFLAGS += -fomit-frame-pointer
 endif
 
 CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
+CFLAGS-$(CONFIG_CC_HAS_FUNCTION_ALIGNMENT) += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
 
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wwrite-strings -Wno-pointer-arith
-- 
2.43.0


