Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D69724D93
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544186.849784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm4-0003BG-R3; Tue, 06 Jun 2023 19:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544186.849784; Tue, 06 Jun 2023 19:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6cm4-00038i-O7; Tue, 06 Jun 2023 19:55:24 +0000
Received: by outflank-mailman (input) for mailman id 544186;
 Tue, 06 Jun 2023 19:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymfh=B2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q6cm3-0002er-1m
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:55:23 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 119c6400-04a4-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:55:21 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f3bb395e69so8248867e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 12:55:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b004f1383d57ecsm1563284lfk.202.2023.06.06.12.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 12:55:20 -0700 (PDT)
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
X-Inumbo-ID: 119c6400-04a4-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686081320; x=1688673320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+18CatWiKovUOnQdDJlhtreSRlIgkyqtkY8A4pd8sw=;
        b=R75eONep1sHqYGlAQtJiVqzQtXpLFmwkLqxeB+GmSvuq/ciEdTvPszXfLahAMY7tGc
         D+uGE+KDjR/Utps1OLY6tk0WCWJsQAewCzZOidD8GjfgRsH6lz5Z8o+B4bvIopkJJwTO
         Xwzou3FZJGb/U8rkEEMl21Rd7QvyGPg69R6yhHwn8eIDksUHY2uYzlYQELOc+nTisMSx
         iENa3+/+nRb6vpqcGC7NUDL8OuRm62HzmsraTfCNxcWFqZDnMEHQRsQljCHyY4LUjmvm
         i5eGvMY7dJu3acRn0wIpTMTsk8Hfn9kZQ71AY3EN+4jCu84S3DuPUtV4P3k/BSPL3muf
         3wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686081320; x=1688673320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+18CatWiKovUOnQdDJlhtreSRlIgkyqtkY8A4pd8sw=;
        b=IOmyx6k4QuBbpt5rj0qkgG/Ay5CBoIHgMC1+mqKfU4MT5EtO647ggSfgPSsLliQRhr
         N5KXzhtZrWa9D6aKpHYVEZ+Jag1OuxCile2lj3/JTGKPojKW2KzZF0MrFADssu7jFyrl
         EMBYFq37LIcuB+ECAI+/6elFqwtE37czEEV8W+VSU3nCYYC+tZU6fMuKFy1kBdJKnEhF
         DHBWi00LAgGpHuPhPVkRlr6SzhcBs4Nv/NfSAortl4zUJohNe9fkAuysXIXhhfbh+J0t
         9G8zywmk6anD+8GELKn+IEEt7gtYHKpaifokmidIRMfF6oNxljGqD5YDH0c3HVHvNtyd
         BUzg==
X-Gm-Message-State: AC+VfDzv7aWGP30ZYXcQ0TdItwcqxBg4/ydWUx0isSTbpK7ludycjjN/
	0VcX5vAa57ScB+4qEhyqRyq4Z16iz2c=
X-Google-Smtp-Source: ACHHUZ4UcloTqSs1Y4vaiE14ffnJJkLDv6vbidnhs+aE6gUIqCSpz0KuNcZqnYToz8dqHx/nXt0q0w==
X-Received: by 2002:ac2:4ac5:0:b0:4ec:8524:65a4 with SMTP id m5-20020ac24ac5000000b004ec852465a4mr1178650lfp.55.1686081320441;
        Tue, 06 Jun 2023 12:55:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 2/8] xen/riscv: add .sbss section to .bss
Date: Tue,  6 Jun 2023 22:55:10 +0300
Message-Id: <6a0f3171323f0092b8374f2244182c7e7ca850c0.1686080337.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686080337.git.oleksii.kurochko@gmail.com>
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes variables are located in .sbss section but it won't
be mapped after MMU will be enabled.
To avoid MMU failures .sbss should be mapped

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/xen.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 74afbaab9b..9a2799bab5 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -151,7 +151,7 @@ SECTIONS
         *(.bss.percpu.read_mostly)
         . = ALIGN(SMP_CACHE_BYTES);
         __per_cpu_data_end = .;
-        *(.bss .bss.*)
+        *(.bss .bss.* .sbss)
         . = ALIGN(POINTER_ALIGN);
         __bss_end = .;
     } :text
-- 
2.40.1


