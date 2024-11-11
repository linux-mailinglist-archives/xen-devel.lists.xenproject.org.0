Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A819E9C3F90
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833883.1249112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUT8-0003qf-B3; Mon, 11 Nov 2024 13:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833883.1249112; Mon, 11 Nov 2024 13:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUT8-0003oY-8K; Mon, 11 Nov 2024 13:28:38 +0000
Received: by outflank-mailman (input) for mailman id 833883;
 Mon, 11 Nov 2024 13:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNnr=SG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tAUT6-0003oQ-JE
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:28:36 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d956adbb-a030-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:28:33 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so38594255e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 05:28:33 -0800 (PST)
Received: from fziglio-desktop.lan (99.149.115.87.dyn.plus.net.
 [87.115.149.99]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04b52sm12749011f8f.101.2024.11.11.05.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 05:28:32 -0800 (PST)
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
X-Inumbo-ID: d956adbb-a030-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ5NTZhZGJiLWEwMzAtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMxNzEzLjkwNzc0LCJzZW5kZXIiOiJmcmVkaWFuby56aWdsaW9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731331713; x=1731936513; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClT/inDC6+ukbNDR8MP6Oma66i64giR5v9zKqN8GSmg=;
        b=PdwkvTii8qblwt+V4bPdJXrFGjplX5/XiPUW3/NDFust5IFRTlnt9aTLq3NEbEV5Ul
         CawzyMANOb7e39iBfoG72QgU8FzcNG+ZVPKdc2RmrKva7gyVxC5ZWjw3XNxqLT87Bg93
         Sp9qHXMRTx7gc9LCpx6Gn5W2SnZoOf4qzKUBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331713; x=1731936513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClT/inDC6+ukbNDR8MP6Oma66i64giR5v9zKqN8GSmg=;
        b=uNXFpot/EsFLKyQTTp8x79nNGu9iFB9j/fByqutwgYjRDTypvuAzDEy3dM3lV1naPQ
         oESP9A1fhwT6Hft9MldirGF7FBuUCojlXqX2u8YZEzCP8D7MHP0YdJdRgsjQBoWdsjwQ
         KlxNORz+HwQ6wLAbrWN5YkgoY3xNmY5xNiUd1RgBrhdZQTDE4oGknNEUM8B3vpb1kCad
         QGUtAkbUo1jbqwCFR/VvzRm+xFkBNEpcbM3qhir9mwuAvgvOOu3sFQ3bNh3tEN4iyws7
         9a3cTLN2+jBFMy/w7TncdrcDIxm2I93PuVlakIrVeM0G4+bGf7RSn3pfzJz7IXJGIje3
         xeww==
X-Gm-Message-State: AOJu0Yw5IKDH8FKJi6d6EMK2sj8oClRzxRiY7tu2dEN+IFTp134EoEvS
	QoBCoI59N57Bd7LGS3ENFs3D8Dv2E//Dd3gqIqHSjZemgZaaK/Y2q5IvKXZFGkqEVeJ+AFQRL18
	Ongc=
X-Google-Smtp-Source: AGHT+IGGePJnrlvzRs3p7hgTJ3+jMjj73ErjvCnF6hNYZzh/AG1ttGPC2gCfIelxpQomr3g3i763Dg==
X-Received: by 2002:a05:6000:703:b0:37d:4c4a:77b with SMTP id ffacd0b85a97d-381f188cb65mr9518415f8f.58.1731331712998;
        Mon, 11 Nov 2024 05:28:32 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] x86/boot: Setup correctly fs segment for bogus_real_magic
Date: Mon, 11 Nov 2024 13:28:23 +0000
Message-Id: <20241111132823.21658-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bogus_real_magic code uses fs segment so it should be initialised.

Fixes: d8c8fef09054 ("Provide basic Xen PM infrastructure")
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- added "Fixes" comment;
- add initialisation, do not remove old one.

Changes since v2:
- move initialisation in bogus_real_magic.
---
 xen/arch/x86/boot/wakeup.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 08447e1934..ff138314f5 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -77,8 +77,11 @@ check_vesaw:
         ret
 
 bogus_real_magic:
+        movw    $0xb800, %ax
+        movw    %ax, %fs
+1:
         movw    $0x0e00 + 'B', %fs:(0x12)
-        jmp     bogus_real_magic
+        jmp     1b
 
         .align 4
 real_magic:     .long 0x12345678
-- 
2.34.1


