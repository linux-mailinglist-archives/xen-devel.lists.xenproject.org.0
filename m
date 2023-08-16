Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB477DE78
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584322.914906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdU-000412-L6; Wed, 16 Aug 2023 10:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584322.914906; Wed, 16 Aug 2023 10:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDdU-0003qz-FG; Wed, 16 Aug 2023 10:20:20 +0000
Received: by outflank-mailman (input) for mailman id 584322;
 Wed, 16 Aug 2023 10:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdT-0003RA-Bn
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:19 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0de9d3-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-313e742a787so3760742f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:17 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:16 -0700 (PDT)
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
X-Inumbo-ID: 7f0de9d3-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181217; x=1692786017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dvEBe8pm2VhEijyo4mSmzVNCZv6JhRB1IoL9HAmCNk=;
        b=UcpL44T20AfuhMw72jhN3hF+yjT/YqUzs3qo21XlXcOKaEavFRronlAiugi9RMVDWT
         TmPqOdPvJVNQ51OiIp/2F1W7FrDVFbOSLfAy+pkGapmpUBhDNwyyxr/Fz3NAU/2LgbnY
         9kEAgvtK1KrEeu8rZ1Fvps3Tf5D2W6w1lsbBB2mtfWsPF3Veb5jCX5dEk4X3FUGWgF1G
         X+z3KUgl9PvO95yB5hgTVzZdR46r8PDELM66jttH5B9PpbKlFnYPk4yoCg1RUcB1GgEB
         KpBDyxz1oSYgqlGBC8ambMjWAS/e9wcxi0UE7ZjTMlkViHzhAyibv313/xtRInPDqA+A
         PYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181217; x=1692786017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dvEBe8pm2VhEijyo4mSmzVNCZv6JhRB1IoL9HAmCNk=;
        b=ANDoWL0af6WUVUHzK230FeX3JDN3tTs9CnUF8q9cG+ma9ArbXvOY4Elhc+54YAIfqu
         OwCtqnpC9jEiHsVRmrO7peTiK1ZU3fDhwX49NxaAZFlR+dxNXqLOjrv02QRG+HeVEwOZ
         esMBYRinSmoX2+1yCnQjmFUQj04HiUd4OH+b3+BvqZyhJnNqzpTGnF1SCGLokskXleJO
         pPzT6VXmAwidG2Vt8X2XTLiWggSpfLOXcDNHe00wZFPsLWsZb7FRctsAHULoK5uc+HcA
         U6G0jzY1WSOixPimMss4VW71X7HDPzJE2XWeqXx1byzhKmGIr8OU6Tidoy47+bn3V4ks
         kbcA==
X-Gm-Message-State: AOJu0Yx95c2CMWMlksWHlpcxlm05YCGnXQssJrqTuiieO94F8EMLrc9N
	m2Db3zx7oKv89/ZdGTxdg9j4BIsCMDOto7Bj
X-Google-Smtp-Source: AGHT+IGFZ8hw5juKIB3lffNbUlK0keTaa2SaMsTAiN6vHptjJuMfPQsFfjPe2woJTEw7VaTUlz0GtA==
X-Received: by 2002:adf:ff82:0:b0:313:e391:e492 with SMTP id j2-20020adfff82000000b00313e391e492mr1184501wrr.17.1692181216761;
        Wed, 16 Aug 2023 03:20:16 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 03/57] xen/riscv: introduce spinlock.h
Date: Wed, 16 Aug 2023 13:19:13 +0300
Message-ID: <c0c4e1a2ad67da4995905472bae61d74e32f7631.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/spinlock.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/spinlock.h

diff --git a/xen/arch/riscv/include/asm/spinlock.h b/xen/arch/riscv/include/asm/spinlock.h
new file mode 100644
index 0000000000..8e61a88c3d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/spinlock.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_RISCV_SPINLOCK_H
+#define __ASM_RISCV_SPINLOCK_H
+
+#define arch_lock_acquire_barrier() smp_mb()
+#define arch_lock_release_barrier() smp_mb()
+
+#define arch_lock_relax() cpu_relax()
+#define arch_lock_signal() do { \
+} while(0)
+
+#define arch_lock_signal_wmb()  arch_lock_signal()
+
+#endif /* __ASM_RISCV_SPINLOCK_H */
-- 
2.41.0


