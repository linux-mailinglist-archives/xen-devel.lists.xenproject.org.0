Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D77B1DD87
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073701.1436596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TC-0004K0-FH; Thu, 07 Aug 2025 19:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073701.1436596; Thu, 07 Aug 2025 19:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TC-0004Gk-A5; Thu, 07 Aug 2025 19:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1073701;
 Thu, 07 Aug 2025 19:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uk6TA-0002bD-Of
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:40:08 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52588521-73c6-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:40:07 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55cbf9a78dbso107223e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 12:40:07 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bfc6sm2759188e87.10.2025.08.07.12.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 12:40:05 -0700 (PDT)
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
X-Inumbo-ID: 52588521-73c6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595606; x=1755200406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=WCQFw1rMT1oINudprca/SDATDhr02M+VB9xCnFnlKxa62b34pfjk+GkJrc6sojxpgr
         DkUIPhAZEU5PzRvHFhpc1Zb1NmznHCBdfdGsIukp8FsgTn6PMyHESrxPL74pIjkblaRq
         CRCs3I5uc8AhRS5LYGY/LulLa7Fyyn5XeKrAMX59XiTNS989YwV7lzN/rWyfF56traGd
         Y/xISX7BfyGIcZhfm1j8gz+oJyKiF1XnBGFCQKLlXLvEFmyp3rAjUE1AY5EU4sXrPQhl
         9yfIgx/GFeI8lrLpTUX4YpziuIfaB709sGER4s6mwZ/74CLPSfayNBxK+Oic1IozgOIX
         LDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595606; x=1755200406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDyBEr2C8bHK7ao0mUQj4cm53R0gNtsq0NOW3g9oj/Q=;
        b=jeOXq/0qaBGrZeo6xWKlH929GuBqis08vB1KA0dKeP/OS/G+v/umPzT/XJykzyDNV4
         M2T+XFC3YlyJoyhBNLO+ep8A4YhHZ6jtGF4WK+Xqn913dhjIZFU7vGZlQ7X7rSWNv1FF
         FR1Yyv1fztgiXRNYSEn0250u8M0VZHV4bHuQE+JsAfGwNtq8NdD+6IHQTBzQ2QrpPc6A
         155C2sjR2PX+qzNiPYfXg78TJBS3kq0tu82hgFhBhbkis1i4rQmnNBHAVYL9CWETQNMY
         9Wb1KaTQv7HNJHT/a4tHlwj7THiFn/eevm1t+Kz5VnTAjSwoQ2X60Ym18t9Si+TgVpMt
         Cm4Q==
X-Gm-Message-State: AOJu0YxUQXbHl842vN1K1BAwLKWS3RJ2hRuuT0awhPnMwDA3jdzHG7K3
	zJxRymAuXfclMehxFhQkbcNW3j0AktHMALFSwdMcLs0T2vmzeaUMjiHWDPuM5pvxpEY=
X-Gm-Gg: ASbGncs4Fz9okZrNEXDLmdklgjbjC5XWvNJhM57tV038uPLJR3YFval0pZqW+ZWGKAl
	sBu0DaWD3//M0gALDv/uy5880h9n4Hr+yWNK9a/qU/MQEqYg9GNdeOJp87P39mDswJ/NZvtrCuG
	yFPvilATmPfYcw8lPjLD5jfV/7OT8+W9G78tobYj/ApvUeZEPmU3UgOMoj2pEvhE/g4SNqn1Cgs
	5ODOjwz+14zn53BjhBcVDhyULUeR1gNjGON+HEFfAGWCfUbHAxD8QEjpATbKdXyu60wvoeB8QJt
	Z3XrcjzbFZu8qEp3rmd2xkAg4vGD/JqyGPQzga1kz4UYfw9gLA7CmAothI1E7Xxcj4oL9impAdI
	0+1Izy6ZS7QaWqieKowPa8p4MUr/2v8rZb/9xvl7F0vhKuQMbB/YTYPYO68uUpg==
X-Google-Smtp-Source: AGHT+IHd5mku6Hr7ZB+akI86NbSReKcfifdCUy67j8XwAyW6QYyyYFldfw0yaBtqvWftHZQItFt5Mw==
X-Received: by 2002:a05:6512:3050:b0:55b:83b3:6764 with SMTP id 2adb3069b0e04-55cc015eb1bmr1493e87.51.1754595606063;
        Thu, 07 Aug 2025 12:40:06 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support for guests
Date: Thu,  7 Aug 2025 22:39:27 +0300
Message-ID: <60902266c3817ed221a45f6acf265438bc7ff322.1754595198.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754595198.git.mykola_kvach@epam.com>
References: <cover.1754595198.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add a new entry under the "Virtual Hardware, QEMU" section documenting
support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.

This function is available via the virtual PSCI (vPSCI) interface and
allows guest domains (domUs) to initiate system suspend operations.

The feature is currently marked as Experimental.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- Dropped the generic guest PSCI support entry (merged in a separate patch)
- This patch now documents only the SYSTEM_SUSPEND optional function
- Reworded commit message to match the final form after rebase

Changes in v5:
- Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
  which is not relevant for SUPPORT.md
- Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
  PSCI info; guest PSCI support was documented in a separate patch
---
 SUPPORT.md | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 6a82a92189..b5ab049b52 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
 functions of PSCI 1.1. See below for the list of optional PSCI call
 implemented and their status.
 
-   Status, Mandatory: Supported
-   Status, MIGRATE_INFO_TYPE: Supported
+    Status, Mandatory: Supported
+    Status, MIGRATE_INFO_TYPE: Supported
+    Status, SYSTEM_SUSPEND: Experimental
 
 ## Virtual Hardware, QEMU
 
-- 
2.48.1


