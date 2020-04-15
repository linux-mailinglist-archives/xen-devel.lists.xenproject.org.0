Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4381A962C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:22:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdJk-0006rX-9w; Wed, 15 Apr 2020 08:22:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X1rp=57=huawei.com=yanaijie@srs-us1.protection.inumbo.net>)
 id 1jOdJi-0006rL-If
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:22:42 +0000
X-Inumbo-ID: 43598486-7ef2-11ea-b58d-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.191])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43598486-7ef2-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 08:22:39 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8FB6EBE898881FBAF5;
 Wed, 15 Apr 2020 16:22:35 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 15 Apr 2020
 16:22:25 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <sstabellini@kernel.org>, <linux@armlinux.org.uk>,
 <xen-devel@lists.xenproject.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm/xen: make _xen_start_info static
Date: Wed, 15 Apr 2020 16:48:53 +0800
Message-ID: <20200415084853.5808-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix the following sparse warning:

arch/arm64/xen/../../arm/xen/enlighten.c:39:19: warning: symbol
'_xen_start_info' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/arm/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index dd6804a64f1a..fd4e1ce1daf9 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -36,7 +36,7 @@
 
 #include <linux/mm.h>
 
-struct start_info _xen_start_info;
+static struct start_info _xen_start_info;
 struct start_info *xen_start_info = &_xen_start_info;
 EXPORT_SYMBOL(xen_start_info);
 
-- 
2.21.1


