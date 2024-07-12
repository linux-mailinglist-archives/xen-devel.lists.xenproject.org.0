Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054F92FE57
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758145.1167463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz7-000437-BF; Fri, 12 Jul 2024 16:19:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758145.1167463; Fri, 12 Jul 2024 16:19:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz7-00040v-87; Fri, 12 Jul 2024 16:19:01 +0000
Received: by outflank-mailman (input) for mailman id 758145;
 Fri, 12 Jul 2024 16:18:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSIz5-00040f-RE
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:18:59 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7158473a-406a-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:18:58 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-58b966b41fbso2742376a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:18:58 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm4669169a12.15.2024.07.12.09.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:18:57 -0700 (PDT)
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
X-Inumbo-ID: 7158473a-406a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801138; x=1721405938; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1ipnza5ajE4GRPCrSoMhjiWbzjCCaJILPUyqeHpgvk=;
        b=XPfyBv00bCGx4p1Yw1dtijDFsl8AN16o/+RMqi3VKprk54WkLVX/EWtkTu2LpIzhD+
         OPuBZHttUYJM6c4dSRzSXzPBoupN5qcOz3mf5KkxgLbIiVgfmwc4kEKBHYvBzz0i6+rq
         9Y2LFVIGpMJEIm86PVw60ywokrwLGJEJ7XvwpbK0PTh99uxpU4SdvNTAOEt6G+GV0lqY
         w8d9kul02eTXR6BHIGRP0z9jhvs+ERJDQtCy21xnrv97/otIu3GhLuTl0jxF2Gy23d54
         U+WIGy5xCqdMGlndCVX76TpgsTiXm8NCzd6El6bioanXlECZ3Owg4Vz30/6XiHvc0ho7
         MycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801138; x=1721405938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1ipnza5ajE4GRPCrSoMhjiWbzjCCaJILPUyqeHpgvk=;
        b=LHOslbc9y0ZQUnglp7SxbsajTU+JOKw287LYiMKP+B8miI6GBYpstw0LdKdR6Ip1AB
         vBiXoc7B45mnMTGDkkOHogOl7u2r8rfb7YWf3RftMt3D1zVXQ3qgi6DlXdS3ssi/b6ul
         nZUs861j/12OZYL+79Xl7ZJ5X1y69tWp4IN65PvTNU4PZQINkTXJkQ5yCC05i7dTWEz4
         DUXfOWivEPr3fxEYSOqpboqEv4p7UoL6yFF92sMwzcZMDuDwV/P/xcZ8kGVUKuKQ69oT
         AFBsvsPjUe2cNYbbrSPJU/mfpkMNucflwgc7iDiTQt7k6X6bsXpANdzl2MztNop9YJ5s
         Gqpg==
X-Gm-Message-State: AOJu0YzdlNnXYdGl6a77oJJ1ZgUe2mX0P+ZSdS0i9Fv0GWrU/W7m5ENo
	fI/aFgAl4zHh4YyZVov7JliYD7EiZXhT8tC3PBDobmbU5FKSOVHnCNHWXSFZ
X-Google-Smtp-Source: AGHT+IF8vH7b+Z1sUrUYZuYyXAWCTAVtL76GPrTswXrnEy5mYpV+Qpyt/1xnLDBaDtwh7XWDCParxg==
X-Received: by 2002:a50:a457:0:b0:572:9962:7f0 with SMTP id 4fb4d7f45d1cf-594bc7c802bmr7069998a12.34.1720801137759;
        Fri, 12 Jul 2024 09:18:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 1/5] xen/riscv: use printk() instead of early_printk()
Date: Fri, 12 Jul 2024 18:18:50 +0200
Message-ID: <f80a93ee72a5887a9ba259db61e4571379315f6f.1720799487.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799487.git.oleksii.kurochko@gmail.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As common code is available it is better to use printk() instead
of early_printk().

Also the printing of "Hello from RISC-V world" is dropped as
it is useless and "All set up is enough".

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V10:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V9:
 - new patch
---
 xen/arch/riscv/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8bb5bdb2ae..e3cb0866d5 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -23,9 +23,7 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
-    early_printk("Hello from C env\n");
-
-    early_printk("All set up\n");
+    printk("All set up\n");
 
     for ( ;; )
         asm volatile ("wfi");
-- 
2.45.2


