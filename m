Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A1087EE25
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694946.1084291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHG-0003i8-OR; Mon, 18 Mar 2024 16:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694946.1084291; Mon, 18 Mar 2024 16:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGHG-0003aJ-Gg; Mon, 18 Mar 2024 16:55:58 +0000
Received: by outflank-mailman (input) for mailman id 694946;
 Mon, 18 Mar 2024 16:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmGHE-0002f9-Lk
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:55:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62985079-e548-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:55:55 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-414612cfd82so2582615e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:55:55 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0041413d11838sm2020141wmq.26.2024.03.18.09.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:55:53 -0700 (PDT)
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
X-Inumbo-ID: 62985079-e548-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710780954; x=1711385754; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMMRuVEHCIqxXdaks8BW5gt1whiZVVCqeN/v42vNtjo=;
        b=BKgyvtJ5cmmsbfli/EO4wkwbKcuUWtqDpP0vE4vdRjqureIsn23EwWKC0xqBleNOe0
         D6DN6KoZMEL1RJs1ib45W9JNzd27JQqfdwrPSAYNMUmeayZoxn+GWGmQ6vGTN0lBjbQa
         arhaTAIpkam+0SMfBQmBInV7TjJqLXkh2jv1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780954; x=1711385754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMMRuVEHCIqxXdaks8BW5gt1whiZVVCqeN/v42vNtjo=;
        b=PeMXS3jm0o0ozAxyyXFQVMqf+MWN6tffym5r5FZNveN0Gdx8SYnkfuQem1ZHhSKO07
         XkNfaYElK5/H6WNj/SVQn6+fFfXjzT0VF6owZQBojWg/aYIuWp8EJPkp9jj1sTDaxkuG
         xTqGerUMKjjCRoLz21jHa1+tYKxrtp3ka15MndKHhqkxDkd//VywMgeZJWj5J7oXynzI
         xD+UGK9teo5fhh+2PzwMO1pwH3wIqqar95P6s5r6/KUzdLNG5SvrUQQLIm1c0QD/TD9e
         yL7mFVh3Z+dLQo75XEUpA9+O7xkMbSBSv2yHr4TwoSIdN0ZL/8/8h/98TDcA0L+QxDpr
         ee9Q==
X-Gm-Message-State: AOJu0YwzUANptF8K/tk1RDZHUuEa5K3wN5MnPCv4W6eFbkNViafVA2G7
	GZKwT2bHMfzsS9I7EnYwqbWkc779+de5nDJL8J69N/U0yGVHyZZc7ubUIv1eAn5SseRSB41OI89
	f
X-Google-Smtp-Source: AGHT+IF0dBp3wk86BI4hu/16kKuYdAhsJDeyKJ8dVApEQECl5QUZVR6qkeNDEn31Hh7GtksB2LyKvQ==
X-Received: by 2002:a05:600c:5118:b0:414:203:3b70 with SMTP id o24-20020a05600c511800b0041402033b70mr40994wms.28.1710780954475;
        Mon, 18 Mar 2024 09:55:54 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: [OSSTEST PATCH 04/36] mg-debian-installer-update: Download non-free firmware from new repo.
Date: Mon, 18 Mar 2024 16:55:13 +0000
Message-Id: <20240318165545.3898-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 mg-debian-installer-update | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mg-debian-installer-update b/mg-debian-installer-update
index 4fb4bc21..31b8a192 100755
--- a/mg-debian-installer-update
+++ b/mg-debian-installer-update
@@ -105,7 +105,14 @@ if [ "x$dtbs" != "x" ] ; then
     gzip -9nf dtbs.tar
 fi
 
-pfile=$sbase/non-free/binary-$arch/Packages.gz
+case $suite in
+    wheezy|jessie|stretch|buster|bullseye)
+        pfile=$sbase/non-free/binary-$arch/Packages.gz
+        ;;
+    *)
+        # Starting with bookworm, firmware are in a new repo
+        pfile=$sbase/non-free-firmware/binary-$arch/Packages.gz
+esac
 
 fetch $pfile >Packages.gz
 
-- 
Anthony PERARD


