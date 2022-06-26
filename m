Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462CF55B421
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jun 2022 23:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356138.584204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXs-0003r1-2p; Sun, 26 Jun 2022 21:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356138.584204; Sun, 26 Jun 2022 21:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5ZXr-0003nu-VZ; Sun, 26 Jun 2022 21:11:51 +0000
Received: by outflank-mailman (input) for mailman id 356138;
 Sun, 26 Jun 2022 21:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3P=XB=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o5ZXq-0002ze-E8
 for xen-devel@lists.xenproject.org; Sun, 26 Jun 2022 21:11:50 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9824f61a-f594-11ec-b725-ed86ccbb4733;
 Sun, 26 Jun 2022 23:11:49 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id lw20so15193372ejb.4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jun 2022 14:11:49 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 cq12-20020a056402220c00b004356b8ad003sm6367556edb.60.2022.06.26.14.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 14:11:49 -0700 (PDT)
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
X-Inumbo-ID: 9824f61a-f594-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fupjb85vIsrQ5wu4RYb1H4Kw82O2kq4W3orr63txTa4=;
        b=E3Vv7SItkwItycz2Z90J9YWQzUXfs/W4ID/1ICVv59a2BoVVRP07Co36VlfZgOrK8f
         5PUTHUSZOE7B4hIM23fLATd3GtAptz81tYTAAnx8mr8ceJfKMcQY3xjGk63Sx3SUR7Pl
         A+5NSmM6f0/+N16HBAfVqgboTEUBvPo0eqwH1I9d264XKFXH47mTuMhg/U6r33DMxVh6
         CwzKB0O3vvd1HSr/rsOOXp80dJ2QrWo7ywmRXqjSm/bv0dpZmc1tONuYFO6kY3je9484
         d/868zYhwf+ZpbxAvcLT/T1ZeQCDDUu50xPlj86akj6TGa2KeqUvgpSuunXS6Id5zbNm
         msnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fupjb85vIsrQ5wu4RYb1H4Kw82O2kq4W3orr63txTa4=;
        b=aBdQb4n2Lur1G47qN38vTp4U0LO5NTjIZmsEEcvTzdo6rdeeI9+uOMiCdOYh2iMjjc
         ZeQwcdKMzVuA0gFGMpkLwb7mQXM5AZexz60qETE3bianEiT+1pk4iarPGQ+qeTrwWIKR
         qpiIWY2KSdbbL2mmjphASBHnghs3JgfNMAtAr04rbJ5OyenZOE/speM+i0VlDTib2Wgh
         7FEqzn345TpGwsfEbhpdkn0+x8Dfq08rl+IpF3iDW6VhdM2hudzl2OdF7dBrduxkyS4R
         HmGqk/MWHSSMVVI4l/2yS57xQBjYqLDGgWjkhFUlfVxl4J2ywx9oRXkn60RqfTXH+8oi
         R8EA==
X-Gm-Message-State: AJIora+jHr6PFaIcw6T1i6vHeVpRcpz/LJNSa4WIVElabL+QZTsmNpVm
	QoJ5tCnIHB38R2qQP/pYuTdSw7xrYgk=
X-Google-Smtp-Source: AGRyM1tLzA9SebPtts7XsjFRsbDPlaTmSVFsa+i933FIzXFhm28U+TMrLx5hXNT/Kyhk0u9WGZKyKw==
X-Received: by 2002:a17:906:6a11:b0:726:97b8:51e9 with SMTP id qw17-20020a1709066a1100b0072697b851e9mr4832004ejc.115.1656277909391;
        Sun, 26 Jun 2022 14:11:49 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/5] xen/drivers: iommu: Fix MISRA C 2012 Rule 8.7 violation
Date: Mon, 27 Jun 2022 00:11:29 +0300
Message-Id: <20220626211131.678995-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626211131.678995-1-burzalodowa@gmail.com>
References: <20220626211131.678995-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable iommu_crash_disable is referenced only in one translation unit.
Change its linkage from external to internal by adding the storage-class
specifier static to its definition.

This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
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


