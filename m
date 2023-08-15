Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF177CA5D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 11:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583941.914291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVqIi-0001eI-2e; Tue, 15 Aug 2023 09:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583941.914291; Tue, 15 Aug 2023 09:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVqIi-0001cK-01; Tue, 15 Aug 2023 09:25:20 +0000
Received: by outflank-mailman (input) for mailman id 583941;
 Tue, 15 Aug 2023 09:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guGw=EA=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1qVqIg-0001cE-AU
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 09:25:18 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a21d561f-3b4d-11ee-8774-cb3800f73035;
 Tue, 15 Aug 2023 11:25:15 +0200 (CEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RQ5Rj3PmRzrSWM;
 Tue, 15 Aug 2023 17:23:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 15 Aug
 2023 17:25:04 +0800
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
X-Inumbo-ID: a21d561f-3b4d-11ee-8774-cb3800f73035
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] xen: Switch to use kmemdup() helper
Date: Tue, 15 Aug 2023 17:24:34 +0800
Message-ID: <20230815092434.1206386-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

Use kmemdup() helper instead of open-coding to
simplify the code.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/xen/xen-acpi-processor.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 9cb61db67efd..e4be543987a5 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -473,11 +473,8 @@ static int xen_upload_processor_pm_data(void)
 		if (!_pr)
 			continue;
 
-		if (!pr_backup) {
-			pr_backup = kzalloc(sizeof(struct acpi_processor), GFP_KERNEL);
-			if (pr_backup)
-				memcpy(pr_backup, _pr, sizeof(struct acpi_processor));
-		}
+		if (!pr_backup)
+			pr_backup = kmemdup(_pr, sizeof(struct acpi_processor), GFP_KERNEL);
 		(void)upload_pm_data(_pr);
 	}
 
-- 
2.34.1


