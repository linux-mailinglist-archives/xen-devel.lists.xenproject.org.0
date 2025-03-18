Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8651A66F89
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 10:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918733.1323415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6a-0002GE-EV; Tue, 18 Mar 2025 09:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918733.1323415; Tue, 18 Mar 2025 09:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuT6a-0002DB-AJ; Tue, 18 Mar 2025 09:19:24 +0000
Received: by outflank-mailman (input) for mailman id 918733;
 Tue, 18 Mar 2025 09:19:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuT6Z-0001pb-7G
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 09:19:23 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13a5018d-03da-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 10:19:21 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so31014145e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 02:19:21 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d1ffbcef5sm128109935e9.9.2025.03.18.02.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 02:19:20 -0700 (PDT)
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
X-Inumbo-ID: 13a5018d-03da-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742289561; x=1742894361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnMyX9kFHyXzrDrfsJ2RlCItrD8ia9EDnLZKJ/omKus=;
        b=I7tanCAz2GCxrp0jEh/xE12/ZcqV4ndnSKBuaYG+hWgdqCV9u/8xGnnm/kkeGdIjRU
         r/q6lfxqB2PYn26e7XRHaU8MOkDcW8NDWG2ndad0FvMec0PGbB171noJqec8tM31hh0/
         qwSps+el/ZgimMXBcMdH2lEZM/L9Megvrafpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742289561; x=1742894361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnMyX9kFHyXzrDrfsJ2RlCItrD8ia9EDnLZKJ/omKus=;
        b=HV53aaLKdk7jehWVJoMkgijFRS3hmXicy1DZGxgnKxKLD3mh5KHl5dro1I4xQZe6NT
         JJLeW+2tKfk2xHOUtwO4AbQXHOwufxvaQm06Bw6KA2x5WjUeTKBaHCs9q++C96attc9B
         zfFqd3mrCmQjs517uIMGPkY6TthfuQqbSe5E3t8o2rQ9EfoaXgQH2X4ZsX/35j0MkNKo
         2le6p8/XeRlVGcF+PvbTtfqF9KcQnn87M/Z+niNFlpiDpCSL4fLxGJgr0kZdAXpymzyS
         D0aSz0YX3tGG6oA001B3P+W88SELgYeG2rfM5PYqOQXMGico74NdLilAETC2vhUxacnN
         6mvA==
X-Gm-Message-State: AOJu0YyegHofS9BkXSjskWDVfCIftF2QQzyuJ/EB202VYQLz1Yvs8eMc
	2HKzAvsjMsargmgyU9Vp//RmaKJWrVrMALtNuWBE9VJvNwQfbq8ru75ozO+ma1wc9P/oSYqsPaT
	c
X-Gm-Gg: ASbGnctI45SvuE7IeormYaBkfuQ8r5INLSdcdFyj0B2ixdYkePYln7wmTcP9rpYA6Jc
	p0/QpCnR4PT66UZylwmvIxBz3qe+3rVbSdynvRWcTNe84Z5owMccqVbxaHeUnPEMFzFAlfpegKY
	Tbvsx2YmsnvsLxj2jaxcWEvZL6KFIvlS8KRqZZ3zFQUsdgfqtDt/R+vfedFxpVJxw7BEtfgpyh7
	dMJqnVYAkMXH4/Lt02smqMrQVdR4OLQHcTFPZSd/AQKiQDRtsqdvoR96eYdpReoZEd6svUJ5pzL
	qLe1fd/sCjF2RGOANu2war5PlS7YH70wuf+NYe0mHDTBELV/Erw2/lzcxD2n
X-Google-Smtp-Source: AGHT+IFx1B/uo+A+eLee+hmEmUSpjHQS6B/JBzEUIWCCZ2fncEVgSrIgPpwpISI15sBHu35V31+6rw==
X-Received: by 2002:a05:600c:4e51:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43d3b9ba9d4mr12535915e9.18.1742289560796;
        Tue, 18 Mar 2025 02:19:20 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 5/5] kconfig/randconfig: enable UBSAN for randconfig
Date: Tue, 18 Mar 2025 10:19:04 +0100
Message-ID: <20250318091904.52903-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318091904.52903-1-roger.pau@citrix.com>
References: <20250318091904.52903-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce an additional Kconfig check to only offer the option if the
compiler supports -fsanitize=undefined.

We no longer use Travis CI, so the original motivation for not enabling
UBSAN might no longer present.  Regardless, the option won't be present in
the first place if the compiler doesn't support -fsanitize=undefined.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Kconfig                        | 4 ++++
 xen/Kconfig.debug                  | 2 +-
 xen/tools/kconfig/allrandom.config | 1 -
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 72fdb8376087..2128f0ccfc0b 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,6 +37,10 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
+# Compiler supports -fsanitize=undefined
+config CC_HAS_UBSAN
+	def_bool $(cc-option,-fsanitize=undefined)
+
 # Set code alignment.
 #
 # Allow setting on a boolean basis, and then convert such selection to an
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index c4a8d86912e0..f7cc5ffaabd7 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -98,7 +98,7 @@ config SCRUB_DEBUG
 
 config UBSAN
 	bool "Undefined behaviour sanitizer"
-	depends on HAS_UBSAN
+	depends on HAS_UBSAN && CC_HAS_UBSAN
 	help
 	  Enable undefined behaviour sanitizer. It uses compiler to insert code
 	  snippets so that undefined behaviours in C are detected during runtime.
diff --git a/xen/tools/kconfig/allrandom.config b/xen/tools/kconfig/allrandom.config
index 76f74320b5b0..c7753ac4addb 100644
--- a/xen/tools/kconfig/allrandom.config
+++ b/xen/tools/kconfig/allrandom.config
@@ -1,4 +1,3 @@
 # Explicit option choices not subject to regular RANDCONFIG
 
 CONFIG_GCOV_FORMAT_AUTODETECT=y
-CONFIG_UBSAN=n
-- 
2.48.1


