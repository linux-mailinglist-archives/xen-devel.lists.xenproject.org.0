Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F1247A44F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249410.429890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7l-0001fC-0B; Mon, 20 Dec 2021 05:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249410.429890; Mon, 20 Dec 2021 05:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7k-0001aP-HH; Mon, 20 Dec 2021 05:22:12 +0000
Received: by outflank-mailman (input) for mailman id 249410;
 Mon, 20 Dec 2021 05:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7h-0007eG-NP
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c67d4210-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:22:08 +0100 (CET)
Received: from DB6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::15) by
 AM6PR08MB4280.eurprd08.prod.outlook.com (2603:10a6:20b:b6::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Mon, 20 Dec 2021 05:22:04 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::22) by DB6P191CA0005.outlook.office365.com
 (2603:10a6:6:28::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:04 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Mon, 20 Dec 2021 05:22:04 +0000
Received: from 8c2dfc853f4e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E9EF06F-E9BD-4E3D-A601-BBA77A94BF25.1; 
 Mon, 20 Dec 2021 05:21:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c2dfc853f4e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:58 +0000
Received: from AM6P193CA0132.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::37)
 by PR3PR08MB5705.eurprd08.prod.outlook.com (2603:10a6:102:93::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 05:21:56 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::1d) by AM6P193CA0132.outlook.office365.com
 (2603:10a6:209:85::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:55 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:54 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 20
 Dec 2021 05:21:53 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:52 +0000
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
X-Inumbo-ID: c67d4210-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5suzMass5gOg79pAHzTEDhmZbMp9xyKiX7pr/HGQF0Q=;
 b=EHosA4cnsU+YWALe/pVYff2EVhMu4JpImWPMq0tBvR+Mlfije0vMCxNGB+T1PRuk5jeaEG1yig0z7uBYsqe6lr29LU89XOR1OJ6iigTksvZVb6cUcWVk0u9fovvk0LKFTD9sjWZywWk8D3O9X5SsmHRxO95GFJOn4HtiB0Vzyfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6922bb3ad85c04fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gi+urszbpnlw+ucy3g+Mj7KlDpolOWlLwGSReXhkRRHbR6XK3qXZOyJ39h06PsZkumpufzBOHeF0HB+faPHNX4RtTt/x8tidP9TjYKTAHDmqoraJZVrTS7GpzYcumx7KvPclJ2R52Srfm+Ko98aLzh5UTzXQjldp6Q2b0DdziY/ju003HInrrvQ6Q0gjl9Zv0zKgmF/vE2I/N9wJUhB6H6DXqIT0oO63md/kH64znSWvxkO2RqT0tCmt++2Od+2DYI4owRj58RKHbyeSZwafQReS7cbPgNtYLvY15jNYUN1fC61g83bF974+HfiJ2gV9jyAnQikZ5jXxzn/JiejWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5suzMass5gOg79pAHzTEDhmZbMp9xyKiX7pr/HGQF0Q=;
 b=e2XrdXp/Vqa9s2BYpQDaULRGqzZYTHIYkdpwCqxnGa4Unxxmq6I6Fea+ObEbcf++fbEEL3wGg1rsxnQhHJLi6SmTpQSSBztD8o89mfRrJniGetN/6sk3Ow9cO331F2zpw3Eyp0jUTRWBGvVSwtXqPcibvV1+u1if+/90BtVetdmZBZaN4pJmTyFgvtDOBuedbwsjD8bEAcBgBt2wPrqpCh3Nc9+hr4fYthGSMrNAEkzLV+OL6v4453PQQuWwCZYjZ/gtIgKAwOlVFpvhBAj7jHGR8UZ54fxO7b+2OAqDoRvS9v171m2a9tYncFlKn6ZCaFkYfhOYgulJlwrd/m3GFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5suzMass5gOg79pAHzTEDhmZbMp9xyKiX7pr/HGQF0Q=;
 b=EHosA4cnsU+YWALe/pVYff2EVhMu4JpImWPMq0tBvR+Mlfije0vMCxNGB+T1PRuk5jeaEG1yig0z7uBYsqe6lr29LU89XOR1OJ6iigTksvZVb6cUcWVk0u9fovvk0LKFTD9sjWZywWk8D3O9X5SsmHRxO95GFJOn4HtiB0Vzyfs=
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
Subject: [PATCH v4 07/11] xen/arm: if direct-map domain use native addresses for GICv2
Date: Mon, 20 Dec 2021 05:21:19 +0000
Message-ID: <20211220052123.969876-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: b645d35f-e08a-4f75-521c-08d9c378a8f8
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5705:EE_|DB5EUR03FT043:EE_|AM6PR08MB4280:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4280107EFCBA8F7B72432AECF77B9@AM6PR08MB4280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /0kL8LQHnspemuLNv/coXD+8MO3dwDVlLci8MUFdswrNtjjhDOhIxGjnYbd0co6+LZx6eK0yK8uMHeNv5lftZd5FE5A+UpOOdklL26ueZWTEHj6BxOnJw2lcK6wMcKLE+475YHrT2jLk1tYqulO45zYisM+IWbqQlfU5g7L9fJrY010tie+6oIwObAvbBMHsG1g4+z/HcIECofNc4t7dbaWvqG79fmyeB/KhikWBsu75W4VYPsie0K2TcoezyUb5fMQk1Z04xXdxvT9CiS0vlqpzUIBDpQp9XguMJ+2HIC1SNCkH8Dv7yruwhxQWQUqftgut8IWzQaD1+ojMdQebAiHDY5uKk14DidwGdbUGjOMSX6/CV7xc/5jbnGKAAehJetAngWnvuswJb15SvKDMBu1OhftX7ejVll/1JCGfFl5ND53lGCSoAWg/ShNwbawV3lMVceg4doXsgvx880yG45PbOP1q/uFC5ucUQKKHgTgUDCPkse0xlzTwk2ft9PYIBJvKUsLOSCc3BZO1eMRWu2DHtK/lEhOZPiTkhkaTSK4/tZRQgovzMhojnp8ZDyOzZNri1hEg/tVuzacHLw14cTJdat3542/u6go4nB7ziks2NpPqAvrZZOR32bDXu8Dj9Oeun5f1fnVG4rbITF/KwTM3yhbqbRxpNM5GTrRnK8U1mjXXmrN00mbNk1d6GFQc/x9I/EWbhZzQphUh7BYDeRDks3BsVrVchGh3L/MPO8J4uXyxgl+H4IONyaCelqQCmFrno2O5EYxZxDlrimU3x7i3dxMQXyXiD9AMyHfWhgw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700001)(36860700001)(1076003)(508600001)(54906003)(4326008)(186003)(86362001)(336012)(316002)(356005)(110136005)(6666004)(81166007)(82310400004)(36756003)(47076005)(44832011)(7696005)(40460700001)(83380400001)(2616005)(5660300002)(426003)(2906002)(8936002)(8676002)(70586007)(70206006)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5705
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6a3eb34-ec49-4f6f-9eb9-08d9c378a396
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FtGB+r2R25c1Umray4noId0hKTOmj1KmZTpmcvro2Mz5HsjcWenwUs8ydjhVCOYKKBbzWdVS63jmtv/mvo2Ng5SCqNjJx7HUD7mf0PSYHxOQ2xPDPXH9ljhYvjQyYO7WbaA62Ar/XZFJjA/y/9aKfsO1ft8Kn61JDCkj1nV1vTfd1yUDSLgy6MxwR24D+Z2oU/PUN31FoOldmhokPUEfUpZ3aktWJKHK5JUvpj7sR60DQxL3N304/nfJQCk7pWDe3S3buQY5LX7JgG8eiwHu35pF+q1See0hawB15180EmftchIsMjicgsm296mn40wwNt22RFhAV0HQxLDcShGJUM4JV1884sbcoLIfFRKHlbvuVVBIe64aI+yc4sJ+In5CMthvWYrsTVTWQ7Zb3PoNQPRQBXJSxS5d7G2kDBNu37Df5b/yVQ89BPYvreqUN27vkMWAZ0rOpzt5rLESLLy5dEcZM9t9kDw1f74DRpte9KgseRbdN+L/gZbCMxY/dYPPG2m220HSam7uGOkrtumC3QOszrh9yJejzJz918V634WBhUKFgbuKcWFnkge9LYqPXKgc1MLcHWCafB9K+HWdXADEO3RgtIE7QWss4jrRJ2IAvwY/BHmkXlAm0egwO7rFIw5nnqCorJScUralOBN7vvPwP1KUGp3YY+WDrGrXBA9kk+LJrepnAn4uN6k2BWaos1gRFzoL2KwE7PfaQelM9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(316002)(1076003)(5660300002)(2616005)(110136005)(36860700001)(86362001)(36756003)(70586007)(4326008)(70206006)(508600001)(81166007)(8936002)(47076005)(82310400004)(83380400001)(186003)(6666004)(26005)(54906003)(7696005)(44832011)(426003)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:22:04.7817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b645d35f-e08a-4f75-521c-08d9c378a8f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4280

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv2 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domains that are direct-mapped.

NEW VGIC has different naming schemes, like referring distributor base
address as vgic_dist_base, other than the dbase. So this patch also introduces
vgic_dist_base/vgic_cpu_base accessor to access correct distributor base
address/cpu interface base address on varied scenarios,

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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
 xen/arch/arm/domain_build.c         | 11 +++++++---
 xen/arch/arm/include/asm/new_vgic.h | 10 +++++++++
 xen/arch/arm/include/asm/vgic.h     | 11 ++++++++++
 xen/arch/arm/vgic-v2.c              | 34 +++++++++++++++++++++++------
 xen/arch/arm/vgic/vgic-v2.c         | 34 +++++++++++++++++++++++------
 5 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b706e674c9..4788b03d8b 100644
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


