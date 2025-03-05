Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15748A4F99B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901865.1309793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknH-0006hq-LP; Wed, 05 Mar 2025 09:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901865.1309793; Wed, 05 Mar 2025 09:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknH-0006fC-Ez; Wed, 05 Mar 2025 09:11:59 +0000
Received: by outflank-mailman (input) for mailman id 901865;
 Wed, 05 Mar 2025 09:11:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknG-0006ev-3k
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:11:58 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e332cbbe-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:11:56 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so699978e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:11:56 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:11:55 -0800 (PST)
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
X-Inumbo-ID: e332cbbe-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165916; x=1741770716; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4XeS6zSJeG9q0Ti33wawxAjOhOjZ//siv8AXi1AOtk=;
        b=Z8vLOxk0alHGLFrHOvC37xN7nbmefMIoy5VBD1VsFQ0ZW+0c5g/hLZeZ4KqGHvrODa
         7Idymw9++kxCYSaXg9gL6M6bD1c8Nait3O4LgeNTckmiNwY+z38gl8MIX76Bi7EYjENj
         HkPc8Qq41/+QIPd+EBtzP3Xe2Ic+dYcsXKZygX20RzPbNF7gO4XyHfLZ2zcepKDkNyZP
         SdAgOXkVHY+co4pDqvgwl/klSDOld17favVvm6/uM8Ny0q1rJjncC+7SB5Q8hB7acug4
         JNTkunHtOkCN4H5erizeJozS5mtPZjibzcxgwWZSRZoreNRaqzLPWDtk3G7GQ2KnCfEP
         lLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165916; x=1741770716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4XeS6zSJeG9q0Ti33wawxAjOhOjZ//siv8AXi1AOtk=;
        b=SDk7Mf/C8RbkUpjsL96BKRuhixJQA2tptjvfCzrw+6yX4EfoOmv5lCyo6H1PVUHmq5
         +7gl5rI1jJIKw0rgOf0dmtYJcVQpz8LBfyXEPxtdWd+3yIGd36Coqc7c+4IgIWF46mKp
         BnKHCGQhqaz/S9BoEMbDYXOkF1TO6sUlcKOnjuLtRGvYrh8Og7aDPhxPe1dA5b8MX652
         AyXHpoa4//yiNQPQlEiy1ipUrA8eQEcQjlEEahjt5nWTMZS5iYLpSav4Qg4hKs+k1Ez4
         hj85Osatqnm8I1EKd0jd/seWG3JAYXk09fRbtN6xMoeHwRSgWTkxnYuP65MmMVAL5V2n
         kSDg==
X-Gm-Message-State: AOJu0YzvtqQuWXuOJM6FRtD/TNmhpqIgZmUSP/tZE3eTT73nTD9NH/bh
	pciTVBjFNCyoZSMakmwTSCSDcOFVDnWSYjaQT1aH1uOlNnGrwM9qmBnLEi14
X-Gm-Gg: ASbGncvoWE5N+9WdPwSgTr2+u5CfL5hRpARPTEjDmEWCNCzGoJNdZzdRVyfKvhdFXu2
	QC/G51cZnHZABGEOjkyOdkHb93cyreTH89f6OwmZvzbnV9SKipNhsJUxf/wHTmPN6ANdTZCOlVV
	iTezDqhU/rYUIcvKb8gwK6eitQWfGhjYfcVv9B+oymDBPlkkAhCoRjyQEzQ2Lu/wJUe+P6DFGYs
	1Ik3pEQVLeKq8Ka/rpWvS6AKJjz8UMgmUs90xMGpvf+1bLl1JCZ8DYV7vPh9DtnJTi5TcisXvnh
	2QZ/oUPcAaxYnHVNLMHRvAgTWeIEUy5a/uYiX1ctVE1dSThcAA==
X-Google-Smtp-Source: AGHT+IEzx2tmF8LmO96xz1ViG48Q/RJ5BOIdUTEsOdaxihp23QmKd6/iDjkSj80OOC0AXdfcpBahIQ==
X-Received: by 2002:a05:6512:1248:b0:545:81b:1516 with SMTP id 2adb3069b0e04-5497d375b4amr794923e87.15.1741165915541;
        Wed, 05 Mar 2025 01:11:55 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykyta Poturai <mykyta_poturai@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 01/16] iommu: Add checks before calling iommu suspend/resume
Date: Wed,  5 Mar 2025 11:11:09 +0200
Message-ID: <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykyta Poturai <mykyta_poturai@epam.com>

These functions may be unimplemented, so check that they exist before
calling to prevent crashes.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Introduced in patch series V3.
---
 xen/drivers/passthrough/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 16aad86973..55b33c9719 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -613,7 +613,7 @@ int __init iommu_setup(void)
 
 int iommu_suspend(void)
 {
-    if ( iommu_enabled )
+    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->suspend )
         return iommu_call(iommu_get_ops(), suspend);
 
     return 0;
@@ -621,7 +621,7 @@ int iommu_suspend(void)
 
 void iommu_resume(void)
 {
-    if ( iommu_enabled )
+    if ( iommu_enabled && iommu_get_ops() && iommu_get_ops()->resume )
         iommu_vcall(iommu_get_ops(), resume);
 }
 
-- 
2.43.0


