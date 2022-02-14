Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B114B4039
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271074.465462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvc-0000ja-RZ; Mon, 14 Feb 2022 03:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271074.465462; Mon, 14 Feb 2022 03:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvc-0000fU-Kl; Mon, 14 Feb 2022 03:21:28 +0000
Received: by outflank-mailman (input) for mailman id 271074;
 Mon, 14 Feb 2022 03:21:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRva-0007B4-Lh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:26 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe05::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30b8c398-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:25 +0100 (CET)
Received: from AM6PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:20b:92::30)
 by PAXPR08MB6880.eurprd08.prod.outlook.com (2603:10a6:102:13d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:20 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::9) by AM6PR04CA0017.outlook.office365.com
 (2603:10a6:20b:92::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:19 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Mon, 14 Feb 2022 03:21:19 +0000
Received: from ff8e26062fb6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D39541A-15DB-4FF8-AB74-588CD450E1DF.1; 
 Mon, 14 Feb 2022 03:21:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff8e26062fb6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:13 +0000
Received: from AS8PR04CA0170.eurprd04.prod.outlook.com (2603:10a6:20b:331::25)
 by DBBPR08MB4887.eurprd08.prod.outlook.com (2603:10a6:10:d7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 03:21:08 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::b3) by AS8PR04CA0170.outlook.office365.com
 (2603:10a6:20b:331::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:08 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:12 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:11 +0000
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
X-Inumbo-ID: 30b8c398-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op4V66n/UXRW6FyBCeIN+WP0ySiF94rkWc6FafgtJa0=;
 b=6k9SugG66QvHHxz3hMEy4xVuHdMpGYJW8ELVR6T7ZUeRDALON2ib+rgpeaPXmomk3of2Ca7U5k6DDeCnOQB9vbhX8eoF7igm0WoEqW84Q31AIv9JaUFQ0/6gapbAqHYx/8sIB0hdpTSVsLziSOBEfc5Ei7Tn8t3Gbm/FHeViApk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ab075b81aeb8afa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni/JsYX2nWEqT8MuQX6TmphQBldfF6NHqTXqUja+PeABpMJcOz0Fbf3oDafms2VG6dmushkjYqy7ztZ2L+o7Hnb1f1mHNLJEJOHabUgnihanDOAeH1RZ1DuEW6A7WpjC51VuW5xDVALP4Tpub7n+XqRw/XgGwKS+1/DIhG3A+sdHfkR1O1jJBROvM9ib9njNIHSLJIF6hR6T+5s9wg7A0sy38lOYmnWx5sOQkMM5YiN7gK8O37zauc+HdPGeVaP3utEA5k3toMF4PAerXO/MB7VHzOee24lGXKFCU4O8HD0gz/rOaEQmWW1dJxJcDAYBOthxQGLUzTdkAcI3lyQ+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op4V66n/UXRW6FyBCeIN+WP0ySiF94rkWc6FafgtJa0=;
 b=BUYLS6QLfK1GUycyngeQ0XtUAmh6G7xDBSI6OCcgB2M8RI+2Mbnnu8Oof/4aconmBH8mraM6s5HwAGhB5+iOUzpTmY/S6BDQNhqB3C7GdGmoEXBvSJr3eo80VI7VGM1iHFJP4NKyDuGcWMvTASUvlBy4w1psD3cX19oHqukQ4MrX8C9d7PyYzY8P9sz+SegVUWcO0BvuBaZ932NqBr9NXXn+mOi0NqvgiJ2R5o8fOA8qbNDRFEa4j8JhYroU7/5nD0LDwUJPSAWIvUG+wLiBAbWSSn3RMt5tdfmww5MVo1tWVW+T2jcDB+0s/6lF4tAC7MSXFv6IpMx9+5WMwz4pwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op4V66n/UXRW6FyBCeIN+WP0ySiF94rkWc6FafgtJa0=;
 b=6k9SugG66QvHHxz3hMEy4xVuHdMpGYJW8ELVR6T7ZUeRDALON2ib+rgpeaPXmomk3of2Ca7U5k6DDeCnOQB9vbhX8eoF7igm0WoEqW84Q31AIv9JaUFQ0/6gapbAqHYx/8sIB0hdpTSVsLziSOBEfc5Ei7Tn8t3Gbm/FHeViApk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 07/11] xen/arm: if direct-map domain use native addresses for GICv2
Date: Mon, 14 Feb 2022 03:19:52 +0000
Message-ID: <20220214031956.3726764-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: ea5ab49d-5b45-49ac-44aa-08d9ef6911b5
X-MS-TrafficTypeDiagnostic:
	DBBPR08MB4887:EE_|VE1EUR03FT027:EE_|PAXPR08MB6880:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6880E661E8E91BF4E45942D0F7339@PAXPR08MB6880.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 65EDMwFw7r/1JnM1TrD/hhq3bNp0mlzRWmPFDYvS0ieKAT/Tra3Tku8bGP7vTCt4aLI4zGAMCyVnbufuDDzJ4dTxvcElJkeT8KQBz5vwx2G6V+LKWbK1nUmiZqari0xSKf9Dn5ie/Y1HoAvh33uVZSvdEapoqP39QGAVluauI6BrhERGKugpq8LG1QvgZgDmqOCLZQblmlqZIEJmV10ve/MZRpLEZpES2X2ZxhOostqClzW3bPDCGD/0h1UjpKnZvGGZDLF56Efx1/VNGZsQ+fFp7ZF2J6VeFYjKCpQBN01BaCxgBuptYirAINvwBaOs4r9acUynNWdiHsBAmVyqOLr/r2MWWlTdzYxi2k/9i6lcuP6auW6PTsJxGwsvmM8IQBNqggRTKwkJbDFUjfg12+Ja64H6r3C6bUpPttnc7SoyZdmOYtAzSQo5DoajiBoK/2PmNqbPj8LgJDXOaKAJ5dkFE7QER5fDG8H3E2+aBH2BcdSgy/9B36w7HyIXwAEY+FU9zpLeCQb7Y59jKHARP1cDDB6EH/MyqAI6l1Dh58oGjUA7Q6WSvJZBIfMZRTcYLfMKSQVKWl74YpUZ6Takaw/SSBdh/lsOLmTbjN8Vd3hpUOyUophKuXWcd3CobCJcdHJd8KxrNFzjF/zjYumSe2iLit3XgdKurn5fmIt6eWdERPZjvMBMyxwmib+HAHjwCN7j8sOY+b9AfoTJntH0iQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8676002)(40460700003)(4326008)(36756003)(8936002)(70206006)(70586007)(7696005)(6666004)(36860700001)(44832011)(86362001)(5660300002)(186003)(336012)(426003)(1076003)(2616005)(26005)(316002)(83380400001)(81166007)(508600001)(82310400004)(110136005)(47076005)(54906003)(356005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4887
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	452b18ba-45b1-4296-57c8-08d9ef690afd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xFP0qlXNUFm3RJK9jtcLPdUsbbLmpBeK8Vq6LzFDZMKESYOZ14sWO9M+GObF1TlaQvbS6/JFuaTGCm7qcPMFsjUeYq5PvgprljnQB68ea9vRBT87MvOMO3aqy9AOkNZBevvHXzl/JFw+cop+6LzaDWHQLQPGVmU+2mcCFIDybQxTwoDaCXlsS7IwJzfGa+ki6dqdToQVeC5s6Pkl4R4VQEjt7nml9susPFGGKkOnTYvw5B+bmeomlAoeuk4eb70vY5cieylTiGQmWtABtjpSF78VxvnIouMS6i9qsk8pWbr44L/Rf/Uvb4DOzSgLH/XPNCKPlQqsA9oHGRJjXA2stSmcOXAuXUUgyQ4qi2KoDXcimpVPQkpdgR381waio4JjQIxb2P2EoRPNIAZ/y55PbjDyhABKalY3RqKDdbFKgspq4qiPz6U71C14+gkIoRMiKxJ6IK0lCKTYq6fLtjRYUKRURXzDv7Pcb1PnSBZfBJThsWZioMEVKO7iXqwwzvRp7sF4olLh3zhDeW+t2lRZCyBrnWMbQ8dnuxnxQNuVl2QSBHyeHJl6S80KkLf06uPtGLAwU1LU8BlCkU2OXRvPGt7OBFx25dnp1VVPqWjz53rVWqBGWx35aQ0kH084nG6+dczdtttR11HY5zsq5lfWKA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(81166007)(8936002)(426003)(2906002)(5660300002)(44832011)(1076003)(186003)(83380400001)(336012)(36756003)(2616005)(36860700001)(26005)(47076005)(82310400004)(70206006)(316002)(110136005)(54906003)(7696005)(8676002)(4326008)(508600001)(6666004)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:19.6082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5ab49d-5b45-49ac-44aa-08d9ef6911b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6880

From: Stefano Stabellini <sstabellini@kernel.org>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are direct-mapped.

NEW VGIC has different naming schemes, like referring distributor base
address as vgic_dist_base, other than the dbase. So this patch also introduces
vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
address/cpu interface base address on varied scenarios,

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes
- combine all changes in patch 4-6 here
---
v3 changes
- refine comment message
- add a comment explaining how the 38 was found of "char buf[38]"
- simply map the CPU interface at the GPA vgic_v2_hw.cbase
- remove a spurious change
---
v4 changes:
- refine comment to let it be a summary of the if/else if/else.
---
v5 changes:
- nothing changed
---
v6 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c         | 11 +++++++---
 xen/arch/arm/include/asm/new_vgic.h | 10 +++++++++
 xen/arch/arm/include/asm/vgic.h     | 11 ++++++++++
 xen/arch/arm/vgic-v2.c              | 34 +++++++++++++++++++++++------
 xen/arch/arm/vgic/vgic-v2.c         | 34 +++++++++++++++++++++++------
 5 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 52f256de9c..87391adde6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2273,8 +2273,13 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     int res = 0;
     __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
     __be32 *cells;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICD_BASE));
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2296,9 +2301,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICD_BASE, GUEST_GICD_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICD_SIZE);
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICC_BASE, GUEST_GICC_SIZE);
+                       vgic_cpu_base(&d->arch.vgic), GUEST_GICC_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if (res)
diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
index 97d622bff6..ab57fcd91d 100644
--- a/xen/arch/arm/include/asm/new_vgic.h
+++ b/xen/arch/arm/include/asm/new_vgic.h
@@ -186,6 +186,16 @@ struct vgic_cpu {
     uint32_t num_id_bits;
 };
 
+static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
+{
+    return vgic->vgic_cpu_base;
+}
+
+static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
+{
+    return vgic->vgic_dist_base;
+}
+
 #endif /* __ASM_ARM_NEW_VGIC_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
index ade427a808..d2a9fc7d83 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -152,6 +152,7 @@ struct vgic_dist {
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
     paddr_t dbase; /* Distributor base address */
+    paddr_t cbase; /* CPU interface base address */
 #ifdef CONFIG_GICV3
     /* GIC V3 addressing */
     /* List of contiguous occupied by the redistributors */
@@ -271,6 +272,16 @@ static inline int REG_RANK_NR(int b, uint32_t n)
 
 enum gic_sgi_mode;
 
+static inline paddr_t vgic_cpu_base(const struct vgic_dist *vgic)
+{
+    return vgic->cbase;
+}
+
+static inline paddr_t vgic_dist_base(const struct vgic_dist *vgic)
+{
+    return vgic->dbase;
+}
+
 /*
  * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
  * <b>-bits-per-interrupt.
diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 589c033eda..b1bd7a46ad 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -654,12 +654,16 @@ static int vgic_v2_vcpu_init(struct vcpu *v)
 static int vgic_v2_domain_init(struct domain *d)
 {
     int ret;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
 
     /*
-     * The hardware domain gets the hardware address.
-     * Guests get the virtual platform layout.
+     * The hardware domain and direct-mapped domain both get the hardware
+     * address.
+     * We have to handle them separately because the hwdom is re-using the
+     * same Device-Tree as the host (see more details below).
+     *
+     * Other domains get the virtual platform layout.
      */
     if ( is_hardware_domain(d) )
     {
@@ -671,10 +675,26 @@ static int vgic_v2_domain_init(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = vgic_v2_hw.cbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
         csize = vgic_v2_hw.csize;
         vbase = vgic_v2_hw.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        /*
+         * For all the direct-mapped domain other than the hardware domain,
+         * we only map a 8kB CPU interface but we make sure it is at a
+         * location occupied by the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.dbase = vgic_v2_hw.dbase;
+        d->arch.vgic.cbase = vgic_v2_hw.cbase;
+        csize = GUEST_GICC_SIZE;
+        vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
+    }
     else
     {
         d->arch.vgic.dbase = GUEST_GICD_BASE;
@@ -685,7 +705,7 @@ static int vgic_v2_domain_init(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.cbase = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = vgic_v2_hw.vbase + vgic_v2_hw.aliased_offset;
     }
@@ -694,8 +714,8 @@ static int vgic_v2_domain_init(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.cbase),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
         return ret;
 
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index b5ba4ace87..1a99d3a8b4 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -258,13 +258,17 @@ void vgic_v2_enable(struct vcpu *vcpu)
 int vgic_v2_map_resources(struct domain *d)
 {
     struct vgic_dist *dist = &d->arch.vgic;
-    paddr_t cbase, csize;
+    paddr_t csize;
     paddr_t vbase;
     int ret;
 
     /*
-     * The hardware domain gets the hardware address.
-     * Guests get the virtual platform layout.
+     * The hardware domain and direct-mapped domain both get the hardware
+     * address.
+     * We have to handle them separately because the hwdom is re-using the
+     * same Device-Tree as the host (see more details below).
+     *
+     * Other domains get the virtual platform layout.
      */
     if ( is_hardware_domain(d) )
     {
@@ -276,10 +280,26 @@ int vgic_v2_map_resources(struct domain *d)
          * Note that we assume the size of the CPU interface is always
          * aligned to PAGE_SIZE.
          */
-        cbase = gic_v2_hw_data.cbase;
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
         csize = gic_v2_hw_data.csize;
         vbase = gic_v2_hw_data.vbase;
     }
+    else if ( is_domain_direct_mapped(d) )
+    {
+        d->arch.vgic.vgic_dist_base = gic_v2_hw_data.dbase;
+        /*
+         * For all the direct-mapped domain other than the hardware domain,
+         * we only map a 8kB CPU interface but we make sure it is at a location
+         * occupied by the physical GIC in the host device tree.
+         *
+         * We need to add an offset to the virtual CPU interface base
+         * address when the GIC is aliased to get a 8kB contiguous
+         * region.
+         */
+        d->arch.vgic.vgic_cpu_base = gic_v2_hw_data.cbase;
+        csize = GUEST_GICC_SIZE;
+        vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
+    }
     else
     {
         d->arch.vgic.vgic_dist_base = GUEST_GICD_BASE;
@@ -290,7 +310,7 @@ int vgic_v2_map_resources(struct domain *d)
          * region.
          */
         BUILD_BUG_ON(GUEST_GICC_SIZE != SZ_8K);
-        cbase = GUEST_GICC_BASE;
+        d->arch.vgic.vgic_cpu_base = GUEST_GICC_BASE;
         csize = GUEST_GICC_SIZE;
         vbase = gic_v2_hw_data.vbase + gic_v2_hw_data.aliased_offset;
     }
@@ -308,8 +328,8 @@ int vgic_v2_map_resources(struct domain *d)
      * Map the gic virtual cpu interface in the gic cpu interface
      * region of the guest.
      */
-    ret = map_mmio_regions(d, gaddr_to_gfn(cbase), csize / PAGE_SIZE,
-                           maddr_to_mfn(vbase));
+    ret = map_mmio_regions(d, gaddr_to_gfn(d->arch.vgic.vgic_cpu_base),
+                           csize / PAGE_SIZE, maddr_to_mfn(vbase));
     if ( ret )
     {
         gdprintk(XENLOG_ERR, "Unable to remap VGIC CPU to VCPU\n");
-- 
2.25.1


