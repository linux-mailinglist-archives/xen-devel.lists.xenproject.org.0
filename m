Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A3077DEB8
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584451.915217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDo5-0005vC-Ae; Wed, 16 Aug 2023 10:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584451.915217; Wed, 16 Aug 2023 10:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDo5-0005r9-60; Wed, 16 Aug 2023 10:31:17 +0000
Received: by outflank-mailman (input) for mailman id 584451;
 Wed, 16 Aug 2023 10:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeB-0003R9-Kf
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:03 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96ef6b01-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:57 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so5613119f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:57 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:56 -0700 (PDT)
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
X-Inumbo-ID: 96ef6b01-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181257; x=1692786057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=152YIcayb5lszzDNzvGMYHXYeb3oKu8LSJxFJQLQtH0=;
        b=s6G41I2rCnF0GZjdKHn9tiArLA4DAeXhBK1HtgPdA4dpmOUwGKO5w7VciXGu6m6sxX
         NfnvEKxviC3e9vK7t3CNq1unf1+SGhoW9HK1pmNApMPODUKcB2N91O0MsdOogzB0J5GQ
         FdkYgh9+Iaw/xvQpiZuyks38Gtl+EnUJkEqbGhkuckbKuCKkhXc+oY1G0cEpm6URRSpK
         uIFeSa0+7549GdChm+ytaFM5sSb/Tp7C04l2yeeU/edrxZg1Oh9SLfCl9byReUGEmOsa
         RAiXINibtcQRZmChg3JwuAc0QOU/KtJCS6Tv8EfIsaJCLMdp8Pbz+9bYk+Mg8z8PBDr5
         g7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181257; x=1692786057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=152YIcayb5lszzDNzvGMYHXYeb3oKu8LSJxFJQLQtH0=;
        b=lokZ4GMIyjhoVwZ42vqQ9d8z4z1UpUGU8+IZ1vYHXoNE5l8yIyBO+U5KMLzjokcQrw
         O7UxJ/jlUKMZbysCoD5S1JewjhodMuX4qegjHf8YDQ79Uu8lM3Ir31YcggJWhF295O1l
         3Zf9yB0r/gJDeAX/lIR43Obk7e5ng4+w+jOh8Q4genCH8OK3kYkq/BN+0nXKbqGxQWBa
         GeZ2+qpZnLojuMah97+O5mLRRYzPnsgq+xLr2y41QREItA9DdGXTCQsLCnFZ3u4ew9XG
         CfYNkNGb1iQ2EagPZ0WBTraCZMIr8Yiw8y2YSjDpfGnx6NUo4Hktb448e6FC1qXw1USI
         woYw==
X-Gm-Message-State: AOJu0Yw1n5zzbNz9L0ifUvcpD6T7V96TnvwGC5tdC5FTqulFRk9hkmU0
	Jj75ABt9S3IHF4nDHAkiD8bS2k+zqOVa29N5
X-Google-Smtp-Source: AGHT+IE5CGGor7/2ZbSn8FlufC5wlVX/jSlP2VpVxxbMeq3rzn3wzQebM40Aazre/6Iv4jZOcmreiA==
X-Received: by 2002:a5d:4d92:0:b0:31a:cc98:a39b with SMTP id b18-20020a5d4d92000000b0031acc98a39bmr250544wru.40.1692181256752;
        Wed, 16 Aug 2023 03:20:56 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 51/57] xen: add RISCV support for pmu.h
Date: Wed, 16 Aug 2023 13:20:04 +0300
Message-ID: <2506a46733cf4a7dc1d021b83437165d61921563.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/public/pmu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index eb87a81e7b..801912900b 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -11,6 +11,8 @@
 #include "arch-x86/pmu.h"
 #elif defined (__arm__) || defined (__aarch64__)
 #include "arch-arm.h"
+#elif defined(__riscv)
+#include "arch-riscv.h"
 #else
 #error "Unsupported architecture"
 #endif
-- 
2.41.0


