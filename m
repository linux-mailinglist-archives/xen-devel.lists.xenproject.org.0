Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA35742998
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556911.869809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY2-0001RY-TW; Thu, 29 Jun 2023 15:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556911.869809; Thu, 29 Jun 2023 15:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtY2-0001MY-OQ; Thu, 29 Jun 2023 15:27:06 +0000
Received: by outflank-mailman (input) for mailman id 556911;
 Thu, 29 Jun 2023 15:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4caF=CR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qEtY0-0000oy-EN
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:27:04 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 642da17a-1691-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:27:00 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9920a6a6cb0so97175566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jun 2023 08:27:00 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v11-20020a170906564b00b00992c4103cb5sm307727ejr.129.2023.06.29.08.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 08:26:59 -0700 (PDT)
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
X-Inumbo-ID: 642da17a-1691-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688052419; x=1690644419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW8flEGuUVEa8vCzcK1Csawi7P2txv/CQdLOaV7tNFk=;
        b=LsP4Q1/sJcGPff1nn5mAs1YGEsVCeeCyjCUXx5n6bjWd+Eh0bR2LM5JnGUcqytdUGi
         KrKd5hBm0rUMToba1+Sfjhxbm6rXSyW9LbXLetjOVy5q8dmYh/jNJDTKo6Pv8NNi8Z2E
         dp3Zw6t5KjFhRoWgWTROFn/UJSiPbK2w4N8ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688052419; x=1690644419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW8flEGuUVEa8vCzcK1Csawi7P2txv/CQdLOaV7tNFk=;
        b=I5ZIEF7ZyPNxOwYW017kcMf2FACPX/CkZ97nbggPQH6Df827hWyYtE/xzmBYfikAAl
         KNvzLvXzFxTnHGnfbmcOENpBfxJ6cT6ayPdC3nPJpL1nVqoop45S6VrVYIIcLkj7+gI+
         feRRkko37T12kCd1y182vafW1KEVPWgyVkn4jRLTo4BMEN+7cNK/PZu3KJIXWQYoWfJg
         IQqqKpgEXIERo4Ze7Xo/HIHrw9pPIhvASetmM42iWvuOuZl5Kvtvkw3RcI2TtugNbdMc
         XGuJ1JVBb+1/AK2bznIOTX7B/c33rq7Kne7cEKYPgnTSi/XqTPRFS9fHz8Towom80qku
         DYcA==
X-Gm-Message-State: AC+VfDzgu67rfrExAWKZjdXN68BThp/jDKD4QaqCwF+c+xc6LIfzJTa5
	T3xP4Bhp+ORCgDyf8+crkhOIizirS55psSwZ5JU=
X-Google-Smtp-Source: ACHHUZ6dPxjTgEK4ZylFXht3+Dygl3PdD/weoWIMQ8Q8+aOEnfqCLEZ/bEQC801no7kdb25MXeNfkA==
X-Received: by 2002:a17:907:d0f:b0:975:942e:81e7 with SMTP id gn15-20020a1709070d0f00b00975942e81e7mr37765200ejc.37.1688052419824;
        Thu, 29 Jun 2023 08:26:59 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 2/4] x86/microcode: Ignore microcode loading interface for revision = -1
Date: Thu, 29 Jun 2023 16:26:54 +0100
Message-Id: <20230629152656.12655-3-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hypervisors report ~0 as the microcode revision to mean "don't issue
microcode updates". Ignore the microcode loading interface in that case.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5:
  * Style fix. Brace position.
---
 xen/arch/x86/cpu/microcode/core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index bec8b55db2..b620e3bfa6 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -867,10 +867,22 @@ int __init early_microcode_init(unsigned long *module_map,
         return -ENODEV;
     }
 
-    microcode_grab_module(module_map, mbi);
-
     ucode_ops.collect_cpu_info();
 
+    /*
+     * Some hypervisors deliberately report a microcode revision of -1 to
+     * mean that they will not accept microcode updates. We take the hint
+     * and ignore the microcode interface in that case.
+     */
+    if ( this_cpu(cpu_sig).rev == ~0 )
+    {
+        printk(XENLOG_WARNING "Microcode loading disabled\n");
+        ucode_ops.apply_microcode = NULL;
+        return -ENODEV;
+    }
+
+    microcode_grab_module(module_map, mbi);
+
     if ( ucode_mod.mod_end || ucode_blob.size )
         rc = early_microcode_update_cpu();
 
-- 
2.34.1


