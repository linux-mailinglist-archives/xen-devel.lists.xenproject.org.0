Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87F724D90
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544191.849828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm9-0004Lb-PJ; Tue, 06 Jun 2023 19:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544191.849828; Tue, 06 Jun 2023 19:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm9-0004Gf-Ku; Tue, 06 Jun 2023 19:55:29 +0000
Received: by outflank-mailman (input) for mailman id 544191;
 Tue, 06 Jun 2023 19:55:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm8-0002er-2C
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:28 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1411477f-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:25 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f6195d2b3fso4971252e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:24 -0700 (PDT)
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
X-Inumbo-ID: 1411477f-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081324; x=1688673324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EcH5kcQKxxsGaNTd34XZ5jD66PVUtcw5BEPk5sk3Zo=;
        b=KJtpN5WDntZQgXJogrcQsPMis5suzLL0SLmEgaWEi22vWDVOv3Bpb5PVNwWtPgt4BF
         St2cD6/IOhij+eOJS9ADx+HetjbAJ++T53Mno7FDKIKbESTq3skRfX2o9uhfABX7su7c
         +8MVBnbhnNsreAGTP09p1IZtrK57fjTep27eYAzq2xUqYgX3Fdpt+MxNH57k9QwmaLVv
         va/ZQsGfC21RG00Vc+Bsf4vhP0hyfwlu7F7S/PKtuVyqsKDgQjQtyzxqej22C7EhPsWO
         4Ph+w7cuaenaYB6DSBf6w8O6UI/vEPYTFtfJHSN2JBsFchDO7i3nMegcEmijrsuZ/7ra
         tovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081324; x=1688673324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EcH5kcQKxxsGaNTd34XZ5jD66PVUtcw5BEPk5sk3Zo=;
        b=TN6tf5S6gh9tnm2D0R4Kgt8lalstoxLEYhYdqEhK9tzQUlPpsnSpJJKGCBgrwvjORF
         Z0CLbL1SQrbK/ZslG6qWs/k2+QYFjL6b4qY5tRI1+MvXAFg6J3rSRfPgG9ZwMdUgMufh
         +3kT0t/hwSi93QZhhF3PfFMfQnW9bJGMo1h8uWp4rqzTfLeG0zM1aGKZHHSdvjE55J2W
         5h2WBmQGa2IP+y2Ss19gc3ZAwvrwxBNoNIMbU2FnMpa5/FiQ4zakINKM0IGgDlfE/wem
         whSkd2PXjTJ783ztZ7mvVgBSw7RTfM7KWrv3IZd19P4j1Q3cJo9Z4OX6dy+W70FIRQi9
         A1bw==
X-Gm-Message-State: AC+VfDyTqSICThWaJyhOSVm9nLMWlwCdbiFnH//F0qorQixs4eoofQSK
	6Jsl68ZgnKvchxQ74Uw3tFT8/HsocSk=
X-Google-Smtp-Source: ACHHUZ5oZksC0xqC4aMn5c8xPi0PD3LcmIk7XGGr3hG0ChIOf7A7YAiWxUtT2YhBvjCN3CqOmwUgAw==
X-Received: by 2002:ac2:4c14:0:b0:4e9:bafc:88d0 with SMTP id t20-20020ac24c14000000b004e9bafc88d0mr1583584lfq.23.1686081324490;
        Tue, 06 Jun 2023 12:55:24 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 7/8] xen/riscv: add __ASSEMBLY__ guards
Date: Tue,  6 Jun 2023 22:55:15 +0300
Message-Id: <298e8876fca284eac7caf7e62339ead177da9609.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/page.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 8e8ec9ee36..1c6add70a5 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -3,6 +3,8 @@
 #ifndef _ASM_RISCV_PAGE_H
 #define _ASM_RISCV_PAGE_H
 
+#ifndef __ASSEMBLY__
+
 #include <xen/const.h>
 #include <xen/types.h>
 
@@ -60,4 +62,6 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+#endif /* __ASSEMBLY__ */
+
 #endif /* _ASM_RISCV_PAGE_H */
-- 
2.40.1


