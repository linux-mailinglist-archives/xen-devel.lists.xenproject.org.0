Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DECD94EDAA
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775489.1185717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkh-0007iX-M1; Mon, 12 Aug 2024 13:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775489.1185717; Mon, 12 Aug 2024 13:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkh-0007gY-GF; Mon, 12 Aug 2024 13:06:23 +0000
Received: by outflank-mailman (input) for mailman id 775489;
 Mon, 12 Aug 2024 13:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkf-0007ep-UI
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:21 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9d6f82-58ab-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 15:06:19 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f1870c355cso41518911fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:19 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f291df57cbsm8687111fa.52.2024.08.12.06.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:17 -0700 (PDT)
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
X-Inumbo-ID: aa9d6f82-58ab-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467979; x=1724072779; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0MBRxvJH0y/bIJK1xHx6k1kVCY+2jxCQ2h5fP5Rdc8=;
        b=XmDjXo/FLlb+oTjzlkUJRxVRUpQajqR2uiuZz5G0K8cbzGzXNCY3HPqgylRZFA46m+
         p+wvERCi82FjzMk8xeIBhHFTmYdtUWwEMwifxiQ2oAjjP6rKRv9ahV/43B4EpZwin4E0
         MAdAgS/oeEH9xL0PmVHpZfTu5N75LduQCMmkqWn67v0edZ0XupC47R//w2GKhv6ljOCL
         GbGnYQHSI3BiqXwINULHC8EvnwiQ3eq9rtdGSFdKinErQpOQXbDJQf6EIm7g/5WB6jV9
         u+O8vRaubmaNGqsGndHqdUwO92pEUPOuBjNu3Ixl285oZfdvyn0IjnvJRdrrol/UvCdV
         JkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467979; x=1724072779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0MBRxvJH0y/bIJK1xHx6k1kVCY+2jxCQ2h5fP5Rdc8=;
        b=QqoDyUrvP9EyhBllF8r1f93zBu7EQzcivIYyK99b27ormNHML3VpWggUHZFpyNDh6O
         0Uv1+Nnw7YwnrOG78vrQfHrCwR4c6FHxCEsbwbFLTN2mE5uIMGUTg1fQ1PaXcm2rQsxz
         k6uWjl7eA/rtyxj6lGGqf+eBsdfGd+jT/lGDtVnQ5bblRKY+DfLbxI+oUAPfcaYsH6RJ
         MyGQACieT30ihehkC6NB/gfAmWkJmoOdsrEgzUwbY00QJ5kEDmVYyd80AfVqDRV+xP3b
         4nxoW/Sc1OduIYdm+GqNcLnDpefIA1l7uOSpxuhyqjglmCiFZRcQQQsJeH2W+AaHzhaF
         l/PA==
X-Forwarded-Encrypted: i=1; AJvYcCWvrjgqXW7zljo37Z6UEFQG4YcLHmo+BKL1kmA2H1BFXPSD12MYRiWy4P5tBOxFh0CMwU7WvelacI8Jhg5tB+stkqy7WLYe3blXhBUrAYY=
X-Gm-Message-State: AOJu0YztDRvWzIf8/X4HDnsJQNSclQoOPYpoV/FweqKqNgY/t/Ly+yqZ
	UgklCnNrDRKjMn3ONo9RLOVmMBIA8TN3s/EWTEOOnGe+kUGGh1pZ
X-Google-Smtp-Source: AGHT+IFl4ehD3FYz4UFHWYeyrWigmFf76jU/CdxDFMCU8WOzXI0nnlPyTlTXorwYYcOTf9CmvnlIAA==
X-Received: by 2002:a2e:8e6e:0:b0:2ef:2b45:b71d with SMTP id 38308e7fff4ca-2f2b7154f70mr1527581fa.24.1723467978593;
        Mon, 12 Aug 2024 06:06:18 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 02/10] hw/arm: xenpvh: Update file header to use SPDX
Date: Mon, 12 Aug 2024 15:05:57 +0200
Message-ID: <20240812130606.90410-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Update file header to use SPDX and remove stray empty
comment line.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xen_arm.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 6fad829ede..766a194fa1 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -1,24 +1,7 @@
 /*
  * QEMU ARM Xen PVH Machine
  *
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
+ * SPDX-License-Identifier: MIT
  */
 
 #include "qemu/osdep.h"
-- 
2.43.0


