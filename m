Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C255E590
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357165.585647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cky-00017A-51; Tue, 28 Jun 2022 15:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357165.585647; Tue, 28 Jun 2022 15:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Cky-00013k-0M; Tue, 28 Jun 2022 15:04:00 +0000
Received: by outflank-mailman (input) for mailman id 357165;
 Tue, 28 Jun 2022 15:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VwHr=XD=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o6Ckx-0000FN-G0
 for xen-devel@lists.xenproject.org; Tue, 28 Jun 2022 15:03:59 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89a1cdaa-f6f3-11ec-b725-ed86ccbb4733;
 Tue, 28 Jun 2022 17:03:58 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id r18so10128764edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jun 2022 08:03:58 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020aa7c04e000000b00431962fe5d4sm9785589edo.77.2022.06.28.08.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 08:03:57 -0700 (PDT)
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
X-Inumbo-ID: 89a1cdaa-f6f3-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TLsqItHuAGIYOdooSORiDOzPNTwAvEg24UXCgU+28Pk=;
        b=VLtQimo71H1QZ7/hEVyCSkGkokfusO6KVmyXYkNXKAdzlg/8Kvxzgoo8n9GIBTu0b5
         1Y5GGAZHx8eGHvjsKUz4WA6WzOatLD1l6IAAJSr9eirG0ePglIqCZsq3ARpWMmOt1TP+
         DdqrUSKRcWLU9T7GaVDbh3um2Kiz3Cu/iD6KPDKKItM4NFKsOhuItAT+kufbG211sU+1
         u5Nk9VrAZ7AoFHyZds3YDWu5tjJ4y/3xXXodpgFY9zjFpKMmaPlsSY5txk3cSSbwcU3X
         cnNgzCYP7zVnCw5eP/OZOubctS8kEixfbAP024RwNG+OndfpgEFsrmiDI91JUYYiO73W
         3vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TLsqItHuAGIYOdooSORiDOzPNTwAvEg24UXCgU+28Pk=;
        b=6nxomox8poAbIDq27BKBzNktZoELUaMrlyX1rXamM8w8CONg6gM5hhulF37UzpcjQb
         GTiUeH1WaNRNwMFEDHnyXSmPWEENra9v3Lia97JarCeLK5xBJ7g6kHcWVpDmQmGvkWW1
         oGpw5gI5HrLoDldj7WvTt2GqkbjBnPyP3kmZDhxpjfvay17uI9+bgVLb/3dultGSQqCB
         c62h1Kt5FQ193Y7PIpZpCGXAlcPdpCiq7oEj2woHu43tw5ts0W5Rk2XeeYA+zckEAP5W
         ME1aICvjYc/OcQOVU7nOV2ogpf8qavzxt5jF3OTIE2+3UORa3w8Wl3KNypEB9eEL0vm0
         PIgQ==
X-Gm-Message-State: AJIora+ZKT8/TCFRHa5yvE3n63Y6bn6c1NL12GEYG5qHzRNI/1ruWbhi
	wU8CEIWPT08L4D7V7gtEeDr3Zh1Zxto=
X-Google-Smtp-Source: AGRyM1uezSb2EiHcmNDWmtQ2wbhEfVC5xFgC737kFVXbc/rOBq1/PjWvHCj1z4PwnuyzMuHbMBphqg==
X-Received: by 2002:a05:6402:35cf:b0:435:bd7f:932c with SMTP id z15-20020a05640235cf00b00435bd7f932cmr23778175edc.415.1656428638330;
        Tue, 28 Jun 2022 08:03:58 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/5] xen/drivers: iommu: Fix MISRA C 2012 Rule 8.7 violation
Date: Tue, 28 Jun 2022 18:03:35 +0300
Message-Id: <20220628150337.8520-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628150337.8520-1-burzalodowa@gmail.com>
References: <20220628150337.8520-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable iommu_crash_disable is referenced only in one translation unit.
Change its linkage from external to internal by adding the storage-class
specifier static to its definition.

Also, this patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- replace the phrase "This patch aims to resolve indirectly a MISRA C 2012
  Rule 8.4 violation warning." with "Also, this patch aims to resolve
  indirectly a MISRA C 2012 Rule 8.4 violation warning."

 xen/drivers/passthrough/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 75df3aa8dd..77f64e6174 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -29,7 +29,7 @@ bool_t __initdata iommu_enable = 1;
 bool_t __read_mostly iommu_enabled;
 bool_t __read_mostly force_iommu;
 bool_t __read_mostly iommu_verbose;
-bool_t __read_mostly iommu_crash_disable;
+static bool_t __read_mostly iommu_crash_disable;
 
 #define IOMMU_quarantine_none         0 /* aka false */
 #define IOMMU_quarantine_basic        1 /* aka true */
-- 
2.34.1


