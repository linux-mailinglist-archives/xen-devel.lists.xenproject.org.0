Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37484155D3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 05:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193316.344384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9a-0006G5-8c; Thu, 23 Sep 2021 03:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193316.344384; Thu, 23 Sep 2021 03:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTF9a-0006CM-38; Thu, 23 Sep 2021 03:12:06 +0000
Received: by outflank-mailman (input) for mailman id 193316;
 Thu, 23 Sep 2021 03:12:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qvJY=ON=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mTF9Y-0004Qj-Di
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 03:12:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 021986ce-1c1c-11ec-ba0a-12813bfff9fa;
 Thu, 23 Sep 2021 03:11:56 +0000 (UTC)
Received: from AM5PR0701CA0023.eurprd07.prod.outlook.com
 (2603:10a6:203:51::33) by DB6PR08MB2853.eurprd08.prod.outlook.com
 (2603:10a6:6:1d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Thu, 23 Sep
 2021 03:11:54 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::bd) by AM5PR0701CA0023.outlook.office365.com
 (2603:10a6:203:51::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:54 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 03:11:53 +0000
Received: from 411708d2965c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD49CD68-F329-4C2A-A160-F534F2D25831.1; 
 Thu, 23 Sep 2021 03:11:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 411708d2965c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 03:11:47 +0000
Received: from AS9PR06CA0264.eurprd06.prod.outlook.com (2603:10a6:20b:45f::9)
 by AM0PR08MB3137.eurprd08.prod.outlook.com (2603:10a6:208:64::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 03:11:45 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::cd) by AS9PR06CA0264.outlook.office365.com
 (2603:10a6:20b:45f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 03:11:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 03:11:41 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 03:11:39 +0000
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
X-Inumbo-ID: 021986ce-1c1c-11ec-ba0a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lLs6y6VFPvynadLJUgwDgvXXXwXXf0+4A9GvM2TqEE=;
 b=RBFJYUdcqwvg5nHkBFWQhi9Qy96m0cWqQhOZ+zwSx8cAyY879YhxDPAexj58TwvuUZ8iBpXP8g7WsCnCrP9HNQRbTAgfhnXuwMwHVvkq+LMi+tIQq9Gx8yvoqldQIhxbbTzvfwxP8uTbGXD9ZgIrWb4cMnPRP1yv0trxW+tXFEg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 884e471e58809d3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjNUESi2rHxnEPZeGfnLKd4GgpOc9UfXRO1QwVVKOZD9FTQ/q1rnMRXRCzvzH9m0QycM7/1RfXQiaEqfagYd8qhZWV4DBJd2cqsnsAbIW6HF8Qmth56j35wd27xJsHBYth68r/ORmUzX3EFOynxiZelbGjRkxhu5HUpavLo8AZWNtTtVHcQZuOktT7CJAWTUqyBnntoj6LwzulFxLpXDV+ReeSZSsD0tZD3moZrS/W/0lvQb7702+qm9jtA5TuaFr/kPBXkJP80rzU/gtM0NZymiRZ0RSaMNKK/berYCAZTB5eY20JVkwRr3c3BTV1QS8ZxUSfZwlWI+4Sc7r5ZXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5lLs6y6VFPvynadLJUgwDgvXXXwXXf0+4A9GvM2TqEE=;
 b=mSnK3DeJFCdlx03HfEF8Z5Eccl9ZChoY6EH2sL8vKJ00CMoKp3pQvm5yAUgm508u7WZURnt4nHdWF35BzwAoL+SECT5qSSV9S+xB740apKLsiNZrxgiUtZpJck2BkE7BSaGc1Q9AsEYDag+tR4yYRxrsiCh0DhmTgZoEed6ASbtQ9VxFjLw8HHGwZgB2XONKpAYfoip/QynIn2/g1J/vvoNP1kOyD24hsqZ5UbWcBag6P+LFZ1KV1oR4SBeDtTDGON+dItcH0WNGxaPGwDP13hlfW2v8KMULp/lvfyS7maqjP5fon0tHl6w3wyjVivDXnVXwPjpTTA3ATDNvck6StQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lLs6y6VFPvynadLJUgwDgvXXXwXXf0+4A9GvM2TqEE=;
 b=RBFJYUdcqwvg5nHkBFWQhi9Qy96m0cWqQhOZ+zwSx8cAyY879YhxDPAexj58TwvuUZ8iBpXP8g7WsCnCrP9HNQRbTAgfhnXuwMwHVvkq+LMi+tIQq9Gx8yvoqldQIhxbbTzvfwxP8uTbGXD9ZgIrWb4cMnPRP1yv0trxW+tXFEg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 08/11] xen/arm: if 1:1 direct-map domain use native addresses for GICv3
Date: Thu, 23 Sep 2021 03:11:12 +0000
Message-ID: <20210923031115.1429719-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923031115.1429719-1-penny.zheng@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb2667c-5ca2-406e-e8d2-08d97e3fe51f
X-MS-TrafficTypeDiagnostic: AM0PR08MB3137:|DB6PR08MB2853:
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB28530620D2646E4D63349D7CF7A39@DB6PR08MB2853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D7UrfBhVRKuFyLkrALiRKovZ1ZO8JfuXMVO4SNvQhhn20j/cWSi58TkyM0XyCNDU0n/caJusRTAgifPaAyyjMml3MYgyERh0BJrUdjXPnX6jwH4c3uYzhJUzLU/r9Ul4ThjJkvf4kG2e6V6PXw82aXo/p6UhjYBVUbzyueJ7GnqLv8toGagMBFllVU3baxWlUmD1s2CYV+aOTI7SIWSOCSd3lsVkUcXLn3aC9JO1SWLpC+CiJEFUd7CLjjchUwyKThD5lqXe0umPukJodUY7hb4GXZ1Js4J2MCmvDz7HXq+KHEsU1aoNOU/iNRpi2SlIs6Yhn1YaEk90ZvCJHmNS4VHKGv/ZFc0APULdwpJ3F0M8iz7RtLiQXR9XonvJ+0aKyypWpudbH2NH7NQ2bGn3EK6BsaYijXeXOO/NsmDvC5yckhAxL++pz06O0y3gCLgbNtiUBk2Uu0HjRL5r+itJxIgWpP28R01ZY5zsPYO3c1GyTw+AV2ikWLDeBU9aGlr1YZ5AzLHj+TzWHMEl0JYlE8ByK9bXygAL3hcpnhM20gssjlf1K/o8l371plRb2qHcWk9ufuGp7zBKLxqf7RU5C9i7gdaC9/Lgf+8nK3ayJWGyqEK+3YmrOXMRvEjATCY8Wayu4tSqWy5tai/TZK0FeYsR5cFa6SP6Wbjiy6+UCYNNu6C0HCgipjqUIWQU7i551lUyomLNDT/QkCSB+99W0I0Bey9p3t0rOd9dkZCjP88=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(2906002)(2616005)(1076003)(36756003)(82310400003)(4326008)(316002)(54906003)(5660300002)(8936002)(426003)(356005)(508600001)(26005)(6666004)(7696005)(86362001)(36860700001)(70586007)(186003)(8676002)(81166007)(70206006)(44832011)(83380400001)(336012)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3137
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96aa237e-049f-4675-d87e-08d97e3fe01c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F44Juwe6mcWX8MwUU3kdEOwM3Qethn/8DixsoH+IwUq6tTSt/FHf8q9g0f0A+SufREBJSVU91kIanPGKtIFReCXquzzi1tEy2EEbbFHDKa8VXW4tVCTkat6C263aNK1D9ZN5RQzgLS3Pqm5bMBrG2zOkVxBVpdSHs+jvJucqAGbmHieI+AC2qDMvN607EnuTMs+cu42uxPWXPXjfAnyBTwxEYEl3lTs4TyKwdmnHNSrrEb1wVmOpiyK1+FWNlFSFlg4WieqhnHVRe3Nd8vEu2wCZ6kxQ/FeUO+mCd5/8jjiFT/+Hgjb+sKnssgYZ6+NbJoSd4ZHL5OQE+J5k/DykkKa4Gx0qU5RHJaPan5W/iOms6xqIJGGB1FSlG7OM+Xmx6UPur1lqmf78obQr/Q3JUlN/pZM3RQgsqJx3EGrmKq+BvkhFyoGhgtECymTWkTID0Y6NpUzxCyf7C2b6IVgJNwwFtMtOun+u01rvlu+QIF0ZnwvGJ5/sS2siOJ88abA5eI36SmuQqrU4DmIDscrfetllqd4nxtm04p0fXLDF7IKxW2eNWfZQ/LMQ2etQNz48xwkC/See3RD+ZG4J4Op1xMeztz7WvjLXWpj0Cl72OMwilqWgsnIvPA3ZiEXQ5bfgSFndAoJbzKSSHeJZDp0aK0sVAKtMx6o/r7P7BzO2GKX8ZCE/tXC2T7CYx8IAbpkpeGabnAwIoZoXTKFbRvKLcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(8936002)(316002)(426003)(4326008)(82310400003)(1076003)(5660300002)(6666004)(2906002)(7696005)(86362001)(44832011)(8676002)(54906003)(36860700001)(70206006)(508600001)(2616005)(110136005)(36756003)(47076005)(26005)(186003)(81166007)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 03:11:54.1079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb2667c-5ca2-406e-e8d2-08d97e3fe51f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2853

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are 1:1 direct-map(including Dom0).

Update the rdist accessor to use the struct vgic variables to provide
the updated addresses.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 32 ++++++++++++++++++++++++--------
 xen/arch/arm/vgic-v3.c      | 10 +++++-----
 xen/include/asm-arm/vgic.h  |  6 +++---
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d5f201f73e..120f1ae575 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1854,10 +1854,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
+    __be32 *reg;
     __be32 *cells;
     struct domain *d = kinfo->d;
     char buf[38];
+    unsigned int i, len = 0;
 
     snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
              vgic_dist_base(&d->arch.vgic));
@@ -1881,27 +1882,42 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (vgic_rdist_nr(&d->arch.vgic) + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
+
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
                        vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       vgic_rdist_base(&d->arch.vgic, 0),
-                       vgic_rdist_size(&d->arch.vgic, 0));
+    for ( i = 0;
+          i < vgic_rdist_nr(&d->arch.vgic);
+          i++, cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) )
+    {
+        dt_child_set_range(&cells,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           vgic_rdist_base(&d->arch.vgic, i),
+                           vgic_rdist_size(&d->arch.vgic, i));
+    }
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    res = fdt_property(fdt, "reg", reg, len);
     if (res)
-        return res;
+        goto out;
 
     res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
     if (res)
-        return res;
+        goto out;
 
     res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
     if (res)
-        return res;
+        goto out;
 
     res = fdt_end_node(fdt);
 
+ out:
+    xfree(reg);
     return res;
 }
 
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cb5a70c42e..83f996b46c 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1647,8 +1647,8 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
      * However DomU get a constructed memory map, so we can go with
      * the architected single redistributor region.
      */
-    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
-               GUEST_GICV3_RDIST_REGIONS;
+    return is_domain_direct_mapped(d) ? vgic_v3_hw.nr_rdist_regions :
+                                        GUEST_GICV3_RDIST_REGIONS;
 }
 
 static int vgic_v3_domain_init(struct domain *d)
@@ -1670,10 +1670,10 @@ static int vgic_v3_domain_init(struct domain *d)
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
     /*
-     * Domain 0 gets the hardware address.
-     * Guests get the virtual platform layout.
+     * 1:1 direct-map domain (including Dom0) gets the hardware address.
+     * Other guests get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( is_domain_direct_mapped(d) )
     {
         unsigned int first_cpu = 0;
 
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index 92f6a2d15d..0f7cb32c58 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -291,17 +291,17 @@ static inline paddr_t vgic_dist_base(struct vgic_dist *vgic)
 #ifdef CONFIG_GICV3
 static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
 {
-    return GUEST_GICV3_RDIST_REGIONS;
+    return vgic->nr_regions;
 }
 
 static inline paddr_t vgic_rdist_base(struct vgic_dist *vgic, unsigned int i)
 {
-    return GUEST_GICV3_GICR0_BASE;
+    return vgic->rdist_regions[i].base;
 }
 
 static inline paddr_t vgic_rdist_size(struct vgic_dist *vgic, unsigned int i)
 {
-    return GUEST_GICV3_GICR0_SIZE;
+    return vgic->rdist_regions[i].size;
 }
 #else
 static inline unsigned int vgic_rdist_nr(struct vgic_dist *vgic)
-- 
2.25.1


