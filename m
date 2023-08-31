Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A578EB44
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593788.926887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfQQ-0002ib-09; Thu, 31 Aug 2023 11:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593788.926887; Thu, 31 Aug 2023 11:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfQP-0002gc-Sd; Thu, 31 Aug 2023 11:01:21 +0000
Received: by outflank-mailman (input) for mailman id 593788;
 Thu, 31 Aug 2023 11:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NA7E=EQ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qbfQO-0002RJ-Gc
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 11:01:20 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6909c9d-47ed-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 13:01:20 +0200 (CEST)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68c3b9f8333so419683b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 04:01:19 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-203.hinet-ip.hinet.net.
 [211.75.219.203]) by smtp.gmail.com with ESMTPSA id
 o9-20020a63a809000000b0056c2de1f32esm1161686pgf.78.2023.08.31.04.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:01:18 -0700 (PDT)
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
X-Inumbo-ID: b6909c9d-47ed-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693479678; x=1694084478; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfO6gt1jg7JX4SuFiMGAMKpFfTvUV21HN5Stf3HGJ4k=;
        b=Bo2f+w4o6urk8f+y3aWJwjytQfu+7AcCmNWObe4KrQfBoIsMUErRgEZJrGp6IXcnyk
         Zc27KfnCdm2L1QWoboP26YWeRUj0TuOgAiSXqYsH+ZIt+kWWtlefSsE1O/2huca2JYh5
         tVOLA4bHIvdKNnxYN1KXVKmLoH8N0QHE7MEZWyxDsew321wFgCG+Yjv5tNoSqIGiNgTg
         ++F51CZsRX0w7HvROjQsOlqUMzztLbpgbXqnbrcCn406cNcKLdwHduppUyNetlYNHP+M
         IFH7itBa2JQmOwMYGgAIfgIh6tRyjpGjTdcIMbQVDZFMWWR6Y0QsYExSu9ZbFGSjDGJ5
         hXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693479678; x=1694084478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfO6gt1jg7JX4SuFiMGAMKpFfTvUV21HN5Stf3HGJ4k=;
        b=lUDrA1L1Mt1DnWUeOnmERj0Ayr10SX3fvCit9BfyLFmcEdIhDYcmT+WTRfeH/rMINv
         7Yy80Ui2IFte/JEA2xFnQ2c6GTMdwujvsw4cO6BYj0meDvJ2CnG1+Er7hz1SoLTBjoQU
         E6azfnr2ww93J5R8CzH4OIkx1mXX9maT9FF6shRU5tMqtLgoJg3BYSpwCnzgRNZ57PHH
         F1JLa8hIZZFzKu2VBA3En3e6qm9v4YNEel63fKtMxNFvPTTXtTErkiCGbXf1/lMliBb1
         pdwlU+13Ql1VgLgSPTdXquQLkbH5nKJ9mhMfVSaGOPKL4FHmm40itTTpff8dRq69OXh6
         pqXA==
X-Gm-Message-State: AOJu0Yzs6f91zlyUbYzjwMMvt4QjkWYx8T12sa96bRE7wAjQl1ighwxk
	Lbz6eh2wwhJqzHpIKssbRqie8aKTcZWcPxRA+hvDsD6vMQU=
X-Google-Smtp-Source: AGHT+IFbx34Tello++nJn7BJ5NMYqxmFPfEV4zrn1NMGKprp7QAuKPtGKOt5ijYg69NBQXXXOe9sSw==
X-Received: by 2002:a05:6a00:7ce:b0:68a:6735:e43 with SMTP id n14-20020a056a0007ce00b0068a67350e43mr2640708pfu.11.1693479678448;
        Thu, 31 Aug 2023 04:01:18 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 1/2] xen/arm: Add macro XEN_VM_MAPPING
Date: Thu, 31 Aug 2023 19:01:06 +0800
Message-Id: <20230831110107.2747633-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230831110107.2747633-1-leo.yan@linaro.org>
References: <20230831110107.2747633-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen maps the virtual memory space starting from L0 slot 4, so it's open
coded for macros with the offset '4'.

For more readable, add a new macro XEN_VM_MAPPING which defines the
start slot for Xen virtual memory mapping, and all virtual memory
regions are defined based on it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/include/asm/config.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 83cbf6b0cb..21f4e68a40 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -117,11 +117,14 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
+#define IDENTITY_MAPPING_AREA_NR_L0	4
+#define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
+
 #define SLOT0_ENTRY_BITS  39
 #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
 #define SLOT0_ENTRY_SIZE  SLOT0(1)
 
-#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#define XEN_VIRT_START          (XEN_VM_MAPPING + _AT(vaddr_t, MB(2)))
 #endif
 
 /*
@@ -184,12 +187,10 @@
 
 #else /* ARM_64 */
 
-#define IDENTITY_MAPPING_AREA_NR_L0  4
-
-#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
+#define VMAP_VIRT_START  (XEN_VM_MAPPING + GB(1))
 #define VMAP_VIRT_SIZE   GB(1)
 
-#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
+#define FRAMETABLE_VIRT_START  (XEN_VM_MAPPING + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
-- 
2.39.2


