Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AD7F71B4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640448.998716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbY-0001RM-Uj; Fri, 24 Nov 2023 10:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640448.998716; Fri, 24 Nov 2023 10:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbY-0001O3-Qp; Fri, 24 Nov 2023 10:40:12 +0000
Received: by outflank-mailman (input) for mailman id 640448;
 Fri, 24 Nov 2023 10:40:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTN-0006hy-Qy
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5af560-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:45 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a02d91ab195so243561266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:45 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:44 -0800 (PST)
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
X-Inumbo-ID: aa5af560-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821904; x=1701426704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpSp8E17qEj94T9sM+8NmsxWyfgY0JYjY9q+eWFf4H0=;
        b=DmCfPenNAosBZGfXkDD9g3h4BThKABSnF1W4pI3bfVNdwxx6su1+4c2dzIig32lHds
         F2dGjPQYaar6wU33AZrLmGw8bdAepkzKjsN5cTaVQbz1DA2uNuAqHc4kTUtWa12R6mbN
         nio8OSIeoHvrZ2nvGZZii1UXFxq6N5KMQiwqDBJbwHoxUsgY8I9MfhjwtcXtQoaHeH9r
         /yMcfvMzNKb9Qz/5OIzL2OETQ0QCf2Af9EoPvUDRhJXB9r4UE2vFMEnCVwaTA1+U2VaG
         dCaZgVTGPN78N2UEvssD5YRsvIu3/ayBpBhLCinyfz3lnlUYNbwbnhO6LRMNy2ftAhPL
         b3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821904; x=1701426704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpSp8E17qEj94T9sM+8NmsxWyfgY0JYjY9q+eWFf4H0=;
        b=iyZ8DmlQ8mGVvkzrtQr4R6buAEJksKfIig6wjnggpQZVcARsLSvldKqG8upGo3fPLc
         2YgMDdmITKGZbigS9uDX2bTbCyOnmVjk9zpAE31X6jxFBbFDE000+XgOkvHHLJXz1ZZv
         8TFgRHsW2aC7cH2Pd4Aypopy9JEH6WiAfigPgGR3WJJWYoVhUS6JyYEdQijATj2NVOJQ
         fcijEGB02z9GOFssO+FzTZXdot5uKnjiGlVscF9UJWrWskCWJYEMVgo4vx5+i2T92bNH
         CEJ1i2Pg4S/1AC3/hu7Pze2VCENjJ/oOM2AuswAyjks4d0bfsssNTN5yASJl/8y3B34f
         e7Dg==
X-Gm-Message-State: AOJu0YyQDOWHVs0UQRxXhOr53m+215MRVv96oudWncmI3TWUD6A9TTf6
	IOQxkiJ1+T7vkPdgKzcXDhcyUrPWa9y4IA==
X-Google-Smtp-Source: AGHT+IGCGPE7Wq4gWuFbVL/H/LXGB3tR60IIjz/ZAK7dYC9NrqmFsLx4YBWUyfjzHIslqRSeSbzLbw==
X-Received: by 2002:a17:906:3954:b0:9ff:ce31:2068 with SMTP id g20-20020a170906395400b009ffce312068mr1557617eje.42.1700821904558;
        Fri, 24 Nov 2023 02:31:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 34/39] xen: add RISCV support for pmu.h
Date: Fri, 24 Nov 2023 12:30:54 +0200
Message-ID: <55a47c6b5df5ea8c7dbe38995616b997f587880e.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/include/public/pmu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index 5a176b6ac3..af8b7babdd 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -13,6 +13,8 @@
 #include "arch-arm.h"
 #elif defined (__powerpc64__)
 #include "arch-ppc.h"
+#elif defined(__riscv)
+#include "arch-riscv.h"
 #else
 #error "Unsupported architecture"
 #endif
-- 
2.42.0


