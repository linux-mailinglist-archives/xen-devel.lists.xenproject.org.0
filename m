Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3E98891D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806403.1217801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDu0-0002r2-Kv; Fri, 27 Sep 2024 16:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806403.1217801; Fri, 27 Sep 2024 16:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDu0-0002m4-Bn; Fri, 27 Sep 2024 16:33:08 +0000
Received: by outflank-mailman (input) for mailman id 806403;
 Fri, 27 Sep 2024 16:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDty-0001aC-LT
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:06 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bc6e334-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:05 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-535dc4ec181so2536557e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:05 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c59bdsm150607166b.50.2024.09.27.09.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:03 -0700 (PDT)
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
X-Inumbo-ID: 2bc6e334-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454784; x=1728059584; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+08psIfLJrfr1+9TR9z6IB/oh0Wn/fJVKMeRSZDPsdY=;
        b=KkcqOpxXrCT0z629iwsso8R0aeLu+wpXVlvWiDvOFqvNECMfmY70pfJSsCELA2oDYj
         9tscUJ9N/bOmWE9UoO724gviMNAeOgVPRPtMTpJBqYSfZLxldDUu7ZAWkXz3FqAfx0bv
         ucnwlcJBH0YKwfd7DumIlZ4AGkTFtxUcho+P2Y1J3y1MopIdA/MH4X6LVjLE5S/BqXyQ
         nqeGb4hDmwlSz54JO2lvDiqPYAvt42tRGSqoS2hYPgWY/0UyA0MsYtWoFZtPEMSottcD
         DzLcOjpCBgXgdDTpP8r4N/7kZ13pqIvJ++/25GKFx98GGiAWVFVNLVHk0iTS8HfZMhG1
         fC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454784; x=1728059584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+08psIfLJrfr1+9TR9z6IB/oh0Wn/fJVKMeRSZDPsdY=;
        b=HC5qcnMgqj0uEtJdFQ5cXuw34Sr/vz6EkXfAiLuEKKKP5WNgi4c8yPg2cjK0crxXc8
         cdYRBf8QeV+e7PjIbx+2Oe7GBSZXnpZ3Cs28gNdBW7n1a46KI9pR3SJ9B3YV5l4OB/50
         sESccvn4A7wLqyStrTUuZdhrJyqOQfJ1UboFqzZ59UWvynFRmlefvs6Rw5/SoUhTxycV
         csKvkqZJ+yPiaRoMfnBDwvUJYSVWkgrgG4y0qsJHPIAwve0qclpK2iVee6q4Nrm4biH4
         56VqjD6c5d9sJrQHufIa2EDGNv9JRDGU++LSMT+C45blEk7JzGT6H3WgniRBwy3amPBf
         514w==
X-Gm-Message-State: AOJu0Yzrr59uwi5c44V6myJwaekQ70rezcYluIFfdf/d5Ae4yCP8pgWC
	GXZYzwtIhgdSUCUMtULuk3PFvqN74Fcc1T+C6I3IFAQbuzs9hzoW5zKukw==
X-Google-Smtp-Source: AGHT+IHag+2Yt+XhEsKsDG5krM5YYD9hVHam1+A0d0Lwbgcf/8x3dibUe6S+Y4EfAdjJCrw7cJCC0w==
X-Received: by 2002:a05:6512:68f:b0:536:53c2:817f with SMTP id 2adb3069b0e04-5389fc4d18cmr2780979e87.36.1727454784158;
        Fri, 27 Sep 2024 09:33:04 -0700 (PDT)
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
Subject: [PATCH v5 5/6] xen/riscv: add section for device information in linker script
Date: Fri, 27 Sep 2024 18:32:55 +0200
Message-ID: <dbf015e7e4d908804d4f5d1ad9d9f56f923d1f44.1727452451.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new `.dev.info` section in the RISC-V linker script to
handle device-specific information. This section is required by
common code (common/device.c: device_init(), device_get_class() ).
This section is aligned to `POINTER_ALIGN`, with `_sdevice` and `_edevice`
marking the start and end of the section, respectively.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - use newly refactored DT_DEV_INFO ( drop macros argument )
---
Changes in V4:
 - use newly refactored DT_DEV_INFO
---
Changes in V3:
 - use refactored DT_DEV_INFO macros.
---
 xen/arch/riscv/xen.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 871b47a235..75fcf367e4 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -91,6 +91,8 @@ SECTIONS
         CONSTRUCTORS
     } :text
 
+    DT_DEV_INFO                       /* Devicetree based device info */
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     .init.text : {
-- 
2.46.1


