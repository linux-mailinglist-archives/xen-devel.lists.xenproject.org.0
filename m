Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F6958949
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 16:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780530.1190172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPrz-0000uw-PC; Tue, 20 Aug 2024 14:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780530.1190172; Tue, 20 Aug 2024 14:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPrz-0000qk-Gw; Tue, 20 Aug 2024 14:29:59 +0000
Received: by outflank-mailman (input) for mailman id 780530;
 Tue, 20 Aug 2024 14:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prYO=PT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sgPry-0000aG-JA
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 14:29:58 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac1a9b63-5f00-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 16:29:56 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-530e2287825so5819145e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 07:29:57 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53345d17c33sm53420e87.128.2024.08.20.07.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 07:29:54 -0700 (PDT)
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
X-Inumbo-ID: ac1a9b63-5f00-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724164196; x=1724768996; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=VtWFmFwg0ULcOSK3l5oQscnt/p7BOR9F23GTwqr5oe6xD00h9LE/HgMxjOw/HrUIud
         X0mjOX0wonn28o9fmexWkKs7CJ6GDWLkjKG3RV0nW9IfrTrT8IpoveuoiP7Nxqpl2LUR
         iLz4K4Z452DpHtq2iDX+d3c+kRrkzMLOBk3wy0ZjnNA+bppfQYgWQBk5vQbuLwYndARJ
         BwHRJulZKWIDOd1VPdDECzi57cPjaRLgHoTtiPpXq3AeINl/9HUJR9/vHI+oQzofmwN1
         J9m7DL9DZUPB6vhu+/zRWzPZ0LgLz2BYEz4QF7MztJPAuYoN5l2ZTsO0gmk3S4E7toIb
         9hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724164196; x=1724768996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=hiMYZlsJJbjYqHE44Gx87T4dhf3Ngf3+skJe24lJzyEXOWoWqNQoN7B5bQzSL4TtZF
         qJM7KSStaYiBbhRBVOQ98MvHjfImND3TtFijOX5YtURi8YCnIDLUFrsrePt3PNeHVfuz
         DubSAE8lRpuzfrCJp69QCb5PPQ5/kKD+XlwwZkmBmFZX1gnaox9LDvUweuXODetr52He
         U3rvnSekyjQx8VD+2OO33eBBGn/sAhd1Uxgx1miyfKNQj+0Fw7PtVrZUxv39jAq17/Wt
         sjiNikYmb5nM+Idxx4bCtygx2e2VfFitJ+nbbtgY3Vw9IZyawO4eAVKCgj/ja1S9a+Cm
         Kp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU67OjIDC1AtjU2IFfHhQn3YYyDoRvtpFgIHegjewOTjV9xaFKw/hhSXgYqpohfwk0B3fLak7uFYYqEufc5YoQmnCeapiAdF1cm6WGnmrM=
X-Gm-Message-State: AOJu0YwZ8+NbgHjLiEXIZ7VSML1KhFLigLxY7nM17UKfMAa6mJwXxzHP
	57oB1H0V+43PhNkuk0uevEzWu22j8hQmRuH5LA+mBbW/D4g64TO0
X-Google-Smtp-Source: AGHT+IERWznLEeJJPBmVGgbqZsGGHpjiqbNNsmHg/7CXZqA1iSzt7K9nFEzoO0ph3Q9aeI604W1JJQ==
X-Received: by 2002:a05:6512:138b:b0:52c:e3bd:c70b with SMTP id 2adb3069b0e04-5331c690c37mr9543219e87.1.1724164195374;
        Tue, 20 Aug 2024 07:29:55 -0700 (PDT)
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
Subject: [PATCH v2 02/12] hw/arm: xenpvh: Update file header to use SPDX
Date: Tue, 20 Aug 2024 16:29:39 +0200
Message-ID: <20240820142949.533381-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820142949.533381-1-edgar.iglesias@gmail.com>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Update file header to use SPDX and remove stray empty
comment line.

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
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


