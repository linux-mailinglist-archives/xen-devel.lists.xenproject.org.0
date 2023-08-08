Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31452773ADC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580017.908268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOKq-0002Vq-Eq; Tue, 08 Aug 2023 15:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580017.908268; Tue, 08 Aug 2023 15:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOKq-0002U8-C0; Tue, 08 Aug 2023 15:09:24 +0000
Received: by outflank-mailman (input) for mailman id 580017;
 Tue, 08 Aug 2023 15:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1DqA=DZ=huawei.com=yuehaibing@srs-se1.protection.inumbo.net>)
 id 1qTOKp-0002U1-IB
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:09:23 +0000
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bc2ba54-35fd-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:09:20 +0200 (CEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKxMc1GBVztRt1;
 Tue,  8 Aug 2023 23:05:48 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 23:09:16 +0800
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
X-Inumbo-ID: 8bc2ba54-35fd-11ee-b280-6b7b168915f2
From: Yue Haibing <yuehaibing@huawei.com>
To: <jgross@suse.com>, <sstabellini@kernel.org>,
	<oleksandr_tyshchenko@epam.com>, <yuehaibing@huawei.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH -next] xen-pciback: Remove unused function declarations
Date: Tue, 8 Aug 2023 23:09:12 +0800
Message-ID: <20230808150912.43416-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected

Commit a92336a1176b ("xen/pciback: Drop two backends, squash and cleanup some code.")
declared but never implemented these functions.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/xen/xen-pciback/conf_space_quirks.h | 2 --
 drivers/xen/xen-pciback/pciback.h           | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/drivers/xen/xen-pciback/conf_space_quirks.h b/drivers/xen/xen-pciback/conf_space_quirks.h
index d873abe35bf6..fc1557dfef49 100644
--- a/drivers/xen/xen-pciback/conf_space_quirks.h
+++ b/drivers/xen/xen-pciback/conf_space_quirks.h
@@ -21,8 +21,6 @@ struct xen_pcibk_config_quirk {
 int xen_pcibk_config_quirks_add_field(struct pci_dev *dev, struct config_field
 				    *field);
 
-int xen_pcibk_config_quirks_remove_field(struct pci_dev *dev, int reg);
-
 int xen_pcibk_config_quirks_init(struct pci_dev *dev);
 
 void xen_pcibk_config_field_free(struct config_field *field);
diff --git a/drivers/xen/xen-pciback/pciback.h b/drivers/xen/xen-pciback/pciback.h
index 9a64196e831d..f9599ed2f2e2 100644
--- a/drivers/xen/xen-pciback/pciback.h
+++ b/drivers/xen/xen-pciback/pciback.h
@@ -201,6 +201,3 @@ static inline void xen_pcibk_lateeoi(struct xen_pcibk_device *pdev,
 int xen_pcibk_xenbus_register(void);
 void xen_pcibk_xenbus_unregister(void);
 #endif
-
-/* Handles shared IRQs that can to device domain and control domain. */
-void xen_pcibk_irq_handler(struct pci_dev *dev, int reset);
-- 
2.34.1


