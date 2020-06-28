Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9024C20C5F7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jun 2020 06:42:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpP8T-0000EM-Lr; Sun, 28 Jun 2020 04:41:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lhgs=AJ=huawei.com=tanxiaofei@srs-us1.protection.inumbo.net>)
 id 1jpLf7-0005Vm-60
 for xen-devel@lists.xenproject.org; Sun, 28 Jun 2020 00:59:13 +0000
X-Inumbo-ID: 9206cefa-b8da-11ea-8425-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.190])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9206cefa-b8da-11ea-8425-12813bfff9fa;
 Sun, 28 Jun 2020 00:59:10 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8ECEB9B8377CC198B1C8;
 Sun, 28 Jun 2020 08:59:06 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 08:58:56 +0800
From: Xiaofei Tan <tanxiaofei@huawei.com>
To: <sstabellini@kernel.org>, <linux@armlinux.org.uk>,
 <xen-devel@lists.xenproject.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm/xen: remove the unused macro GRANT_TABLE_PHYSADDR
Date: Sun, 28 Jun 2020 08:57:06 +0800
Message-ID: <1593305826-28279-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 28 Jun 2020 04:41:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xiaofei Tan <tanxiaofei@huawei.com>, linuxarm@huawei.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fix the following sparse warning:

arch/arm64/xen/../../arm/xen/enlighten.c:244: warning: macro
"GRANT_TABLE_PHYSADDR" is not used [-Wunused-macros]

It is an isolated macro, and should be removed when its last user
was deleted in the following commit 3cf4095d7446 ("arm/xen: Use
xen_xlate_map_ballooned_pages to setup grant table")

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 arch/arm/xen/enlighten.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index fd4e1ce1..e93145d 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -241,7 +241,6 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
  * see Documentation/devicetree/bindings/arm/xen.txt for the
  * documentation of the Xen Device Tree format.
  */
-#define GRANT_TABLE_PHYSADDR 0
 void __init xen_early_init(void)
 {
 	of_scan_flat_dt(fdt_find_hyper_node, NULL);
-- 
2.7.4


