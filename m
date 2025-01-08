Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4CA0595E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867135.1278588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU00-0001uv-Lb; Wed, 08 Jan 2025 11:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867135.1278588; Wed, 08 Jan 2025 11:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVU00-0001sg-Ih; Wed, 08 Jan 2025 11:13:20 +0000
Received: by outflank-mailman (input) for mailman id 867135;
 Wed, 08 Jan 2025 11:13:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVTzy-0001BZ-Se
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:18 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f9e9649-cdb1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 12:13:17 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30219437e63so7116531fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:17 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:15 -0800 (PST)
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
X-Inumbo-ID: 8f9e9649-cdb1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334796; x=1736939596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3fSG769VnOrM2edhG3O3s3zVRPKLWUvOf5I+6qkAcQ=;
        b=Z9BbAfDEB7ilbeMgddFjyfE3cB9w5+GgBow/2dgm/PinvNd+C8u35/YtquIcpYtekh
         wxHuO5X0huuF57V7HGKi1l/2CvS3kmBHjm2gTgcqM4DHXzeYdE4Qtl+N3XCPAC2jp69t
         +ar8Ee6kPs76wzMzhFrxLJdnCG4CUBNrrHCgvX8NdfqKYx99GG0t6WUgAxMT7irej1Mh
         0Ybk0mzO/jt7PTMaRJTh3rh0t7AEwkZgZpf753e/N+rfRJ7JKHsZhA+UnuAvnKf0LU2C
         XfWRIi9IcnjsyWc3yougW3Dk0gqIrcB0PK9zBrFbfevOmEC128Saq4XbvCm1ZfPnSxId
         KGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334796; x=1736939596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3fSG769VnOrM2edhG3O3s3zVRPKLWUvOf5I+6qkAcQ=;
        b=RUJVNOJyDILEhccO6t0Yj55DPmAJ9vCPyN2WPz3okdYNpyeMVL7kKOH8gkyj3YLuJu
         OT+S1ORlqnI/PE8zFcxgs2alRDdjh7U0TYItQRzJjoGVMWaaWq1vYpAaF1d8ITOt3qe/
         GElfq4BNk7KBXoGMcstaEYsVehdtP11XOPpbAH1bQ3XXdBnJpqHtHvGZgEXbvjPw+Oju
         pUq64ST4KbtbloyFO/QXjEhx/zg1Zo2ZUSLigUMhLmItvenTD0yLw6X9niM4sfGPj9dK
         XGpU451FBMhIXEYOTEL/K1WA9hQgiWo5nFM5KjGXj+q57WG6WGuN6yDB1OV3OfZpE5zB
         2o/Q==
X-Gm-Message-State: AOJu0Yz7V3LQ8xqAr3fJGJednrOrNLIBYJFGvWcFLTHGUstfKjdFzUbY
	I30tZY5t8nI8FICnVQkBqr4FohIWaXL7j8pUhVbXonEcapNNxVnnZfT2WtTn
X-Gm-Gg: ASbGncthSXSzygqlqaZXUXV8sYdle3sfMDAUqE50in5S+RCrf1CfD6cFnZXnF5ti+Kw
	+pnzbSJR7C2hJ5QVo3LcnOImv78+rsg1dejKDYiBw2aUe3jpt93Bh8y9IdHNSUCY9ZtUspUcVs+
	bNp60kn0oOLHLrY0BcPetFmfmxamGCrsIYZqzE1WgUzBgBSr2z0q7xbb9mOdveNCZbpR63eBnLb
	0tSMQOa1WcYtStcNUNXozjZG4EHnjLkvRHxJxi5Wb0at3Ey8C4GE40yEQ==
X-Google-Smtp-Source: AGHT+IGZlEFSV35bKo9xoDZxbudY5hACznPdX4ioGucTYpB5Vt+XO/BnHvqtlSObDVsALXrcUlVShw==
X-Received: by 2002:a2e:bc0c:0:b0:302:23bd:354b with SMTP id 38308e7fff4ca-305eb1ac962mr20794211fa.1.1736334796007;
        Wed, 08 Jan 2025 03:13:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/9] arm/static-shmem.h: drop inclusion of asm/setup.h
Date: Wed,  8 Jan 2025 12:13:05 +0100
Message-ID: <2dd4477dd3224d00f43bbabc07f978c4e72f5a0f.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
asm/setup.h is droped.

After this drop the following compilation error related to impicit declaration
of the following functions device_tree_get_reg and map_device_irqs_to_domain,
device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
declared in asm/setup.h ).

Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
declared in <asm/setup.h>.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/dom0less-build.c           | 1 +
 xen/arch/arm/include/asm/static-shmem.h | 1 -
 xen/common/device-tree/dt-overlay.c     | 2 ++
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c4badb4ade..259285ddda 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -14,6 +14,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index fd0867c4f2..828c8e5480 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -5,7 +5,6 @@
 
 #include <xen/types.h>
 #include <asm/kernel.h>
-#include <asm/setup.h>
 
 #ifdef CONFIG_STATIC_SHM
 
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 97fb99eaaa..28bb9cf0cf 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -13,6 +13,8 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/xmalloc.h>
 
+#include <asm/setup.h>
+
 #define DT_OVERLAY_MAX_SIZE KB(500)
 
 static LIST_HEAD(overlay_tracker);
-- 
2.47.1


