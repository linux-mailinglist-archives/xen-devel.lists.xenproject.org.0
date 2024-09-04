Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8196C3C6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790548.1200356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfb-0000np-B2; Wed, 04 Sep 2024 16:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790548.1200356; Wed, 04 Sep 2024 16:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfb-0000lR-6Z; Wed, 04 Sep 2024 16:15:47 +0000
Received: by outflank-mailman (input) for mailman id 790548;
 Wed, 04 Sep 2024 16:15:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfZ-0000LO-Mo
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:45 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efd333fb-6ad8-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 18:15:44 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5353d0b7463so11546062e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:44 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535692d9bf6sm176315e87.41.2024.09.04.09.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:42 -0700 (PDT)
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
X-Inumbo-ID: efd333fb-6ad8-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466544; x=1726071344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=Z6wqDmyUEzSyQYixezUdsWRzlKrCaKy3O1eMZsPNw1hDFN8rK2IVVLD98R2CaK/Rix
         zn+0NmRMDJW2CHh2b4s3HeXtDWSHo9AThZomxo2jf2pAVD3whkTToSAbza28jYbLHBil
         YF6tnInaRFUE6aZvwCOlUBwW59TMTXYziaG3tULtyoKev+2JBrgBykfjebHhS0VyMTfJ
         14lTqGo8lSzMV2SffGEBtdfDKhPojvMayyEuuZDgBZ+0I5zffbic4/vre383IyuR/jc7
         qZWjN/+ikoDRllpxfrQv2QFyBnc1qlr70E88kFO4gHUQz3+hIlNqewBoFEG0D7qpyzbS
         k54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466544; x=1726071344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6K1JnQDB3GxWbgLc2L3O0RRJjZo+EVTDK5d5nCO5jo=;
        b=cpthDARy5ojCu4doRFOBKYo/K+P2XpQoZ06JBn6LpGiydtY6qEir6Nz/MvIqngLa2L
         Va7YvTXAKVq+zpRCDmSRBsG+fia8ddhPQfd2lDjFbkT618BwLFDJ3Bh4cxB77Vb5MaWF
         BQOLlT48DpGVqfd8+wzv2/MFiySMl19bu09nXR82WlC5oMkgJ7Fk9SnvjSy6nei3JMLI
         7OLKc4IPga9lqmZIQCJPdncnr/w4mxIGDWBLoep+iXHA0Tto52mzJSqWfpLq/gmwVJCh
         +GmQK+ZMJl5PVnbfBl/NuqctC33SUyANHLudjKzP90qRptDD7DWAm/R8Pz/D64oePfct
         9ptg==
X-Forwarded-Encrypted: i=1; AJvYcCWLD4jypQsH8lPKVdnh9kleW/EBEOpJy81VT5XC6uOiOim2C5Ng0+b8vWycxP8dgLf6ZPuWFkg4TIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtv06lU5rX/gQY9S/WseuCHiS/nN7apYhziQofT/Uzxd8fpm0y
	Rb2sotp3Qu0ACBUFwB0BrRSnSLjL9U5G/nMvDSf/RDxBsubzWUwePXgD4g+k
X-Google-Smtp-Source: AGHT+IFom4VEXuZYnoDrA4HGURvL615ZNQmYPSqV45hP6uADwmwNAHyfJ2jP5ftIt03oSUiu6NVu1A==
X-Received: by 2002:ac2:4e06:0:b0:533:483f:9562 with SMTP id 2adb3069b0e04-53546bde03emr15776888e87.42.1725466543416;
        Wed, 04 Sep 2024 09:15:43 -0700 (PDT)
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
Subject: [PULL v1 02/12] hw/arm: xenpvh: Update file header to use SPDX
Date: Wed,  4 Sep 2024 18:15:26 +0200
Message-ID: <20240904161537.664189-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
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


