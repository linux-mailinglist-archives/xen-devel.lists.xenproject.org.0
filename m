Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F9663BF6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474495.735788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPy-0006D5-Bi; Tue, 10 Jan 2023 08:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474495.735788; Tue, 10 Jan 2023 08:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPy-0006As-8B; Tue, 10 Jan 2023 08:55:38 +0000
Received: by outflank-mailman (input) for mailman id 474495;
 Tue, 10 Jan 2023 08:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOs-0005oC-Ve
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64046635-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:28 +0100 (CET)
Received: from DB8PR06CA0066.eurprd06.prod.outlook.com (2603:10a6:10:120::40)
 by PR3PR08MB5691.eurprd08.prod.outlook.com (2603:10a6:102:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:26 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::8) by DB8PR06CA0066.outlook.office365.com
 (2603:10a6:10:120::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:26 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Tue, 10 Jan 2023 08:54:26 +0000
Received: from fdeca5795d80.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61AE824B-371A-47A1-A627-6D734A3DBD48.1; 
 Tue, 10 Jan 2023 08:54:18 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fdeca5795d80.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:18 +0000
Received: from FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::6) by
 PAXPR08MB6752.eurprd08.prod.outlook.com (2603:10a6:102:131::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:17 +0000
Received: from VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::ac) by FR3P281CA0152.outlook.office365.com
 (2603:10a6:d10:a2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT055.mail.protection.outlook.com (100.127.144.130) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:17 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:14 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:12 +0000
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
X-Inumbo-ID: 64046635-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gPXnqAOqOIvOq2SZnrFV2Z6dU7bFkyDMdqIXXj4RZE=;
 b=dLHUYEMdck3Q7r4mNSrbppoSU3bhtYwYDwjvaa+hA5dIeRLEJVpawJfFwo8QidcIDwOszznDj6q2Pqegjo2Xy5jOZcvVtf77336sjcFvo17oDHzsLyM/kEMUERFc9jXxeHrpsfW8ycI2WreiCr0tpXh8RmztRwLJfK1JKnWMIZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fdb4868fb50ca0cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea+N/6nIfTQX1zQDTrZPfLnRLTDx0+uMl03K9gBFLueweRyVU5+svrm63ncWD0Nj5p/tN6c4w+BhBAPLdmw9DnQ0JRl3fpDxlyItIL0tPSPnEgWf7CLMn+JefwPqEbX0u2EBysX2QPcfF5tb9ZeEoVWCNYeJbe8hlFC3fAnhw5vb1gkgAXs9yiWQDe5ZVw8qSkWmn9r1VPxuxcgy1cfyADHBD7PzKJTuAGEAXkiLqAOxBU53jeprvYBWD27PQ28VSupj9ucH6IhIzKiHL2VFsTT2BLxTjGccR6kuky32XOM8L7LOkyfZRjuc+bUrJfDHPaJ3FTSX7glml6WNly2ofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gPXnqAOqOIvOq2SZnrFV2Z6dU7bFkyDMdqIXXj4RZE=;
 b=Yjs+/qYvY3LWbPPqt1nOwUT+ND+0HA/2TDbVwfwejFYNbHjUKu3FlpI1tOKXABfnIGw/e+B0KVTnlo9HDIeaBnyW3BIgh8e4kI/itxDwHhowP3aFACRITi6K+0lqxCGFs6iZ05TAFrcyWzyGI1hXNkjivc52DMHAGLukD5fAAVZRq1PoXhQ0j0zDXuqA3azmZ52UkLAai4u2K+ou0Bl2yI1HckamsJjobuFx8kOvWXp8Dbbs2NSyNjOy64Q988BNklB/9OOetFF87RqDQR7mHsdX5NKuQGlfnBDBgpgRJHZNAvXwg53zQtcezdLbwZFIQXPk5qner1XTYG6sg5Rg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gPXnqAOqOIvOq2SZnrFV2Z6dU7bFkyDMdqIXXj4RZE=;
 b=dLHUYEMdck3Q7r4mNSrbppoSU3bhtYwYDwjvaa+hA5dIeRLEJVpawJfFwo8QidcIDwOszznDj6q2Pqegjo2Xy5jOZcvVtf77336sjcFvo17oDHzsLyM/kEMUERFc9jXxeHrpsfW8ycI2WreiCr0tpXh8RmztRwLJfK1JKnWMIZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 11/17] xen/arm: keep guest still be NUMA unware
Date: Tue, 10 Jan 2023 16:49:24 +0800
Message-ID: <20230110084930.1095203-12-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT055:EE_|PAXPR08MB6752:EE_|DBAEUR03FT030:EE_|PR3PR08MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: aabd66b6-910a-4179-fa55-08daf2e8471c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WqGNSjQkcwE3hYhgl/i6TMKH6hKLRoqTgSWclNzJfnGSOP+jsoIm6RNyuxaM786eFrwi9upp3E/1vpFLtVTHpuTWEeFyFmweubKoOlVnUekjGEbYPioFVuTEQj9y1egjCcloOCh9FcP/r++oCEGHAno5WEQ675aJr6+A4iEzY4XAr6lUuSHflKUORdRVgIM8PWhhnZXg6qKbxLTjbKNSrp+ZeLT1Iv0H7GH3J/fTBiwAv/4UpDAReqTEbba+Y57cyPgHoer+4+ghJ0HoW6pNoQV8lDv+RS0QRTMhKBqNcB7BQRZnZt78vU+kcQS71EUwyJlUHDRciVJTtxYvEFhvStajLFMGFAXyoYIAQuKC+Vak5i0YbaN3rvcB9qhmbG8DCkkr18Ez+TX1amT6ZbcRXkJu6JTa4fba/NKUEUsUwmIwTuIVRV7XUz+9herG2n7kmslcs1kMQRowlg8HDl2aho6L2xgze58uX7NtyxSUlV7aaf+aDtkCJaoKpU2Zv2KEjz6/xMfbV1PtzG58Ya8DLe0tN00bkjuADq35lNp027nAploN6jsflbFJuQLdi7byCmy4KZn6nrzuy1PovYa0eaZ6LLMf10B+YyLiqRbRyRk03zNjR+YGESUlL3jVLEqjd4ysGLC+3y2JiJT96AUvil3S+aWPCnrAnMkh/jGwgjRGSTRkHj5qm3fT2TtVhBsXm5sUgt9G/NoVvIjgdGOTaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(5660300002)(44832011)(8936002)(41300700001)(2906002)(36756003)(54906003)(8676002)(70586007)(70206006)(4326008)(316002)(6916009)(7696005)(26005)(81166007)(186003)(6666004)(86362001)(478600001)(336012)(1076003)(2616005)(40480700001)(47076005)(82740400003)(356005)(426003)(82310400005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6752
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	317a562a-0aab-4700-6a6b-08daf2e8417d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ALt0lGf7OtNh/WjofST4kIl941WpNam3+GFl6K343w6KEQW/H7I+hAODHHZGVxzpt38jYmG/NT37eUmy8WwGlQkecs13NBYfqquQ7Lp1ycG7aBcgh5Xmk4HziZM535+2bAhfr6e5FK1V9eRSPoBTyssNincfZTqgdfh5r+y1qsMK1NbwrNYmQOXEwF68Wt944Btb7zl3QhpcdLnHnZMQA1H9EoWUml7Ix/0KCkmDMibjC2e+ME5Icd4FjZM47uqv3utbJfgNcc2JXv4AZ0S842CtxvQ9PDMY3ITOa/NaV7t5dSDQlbvxX8/jiihL7zLJh9hb1wNoVrcwrwzeaHb1E0Swh8dGneUQ1sQCRvYv0cqwv24e1GyVu41JSCM4BoVGq/HFcBThl11sGi5DMObJ5i5l4mNCZ+gt8cMIRu9fXhQLjI7EEmPPGKNm3nCKAAj5bXy38e3esnqtu6OM85U9t2JUVNmI3Ht6aspBmY0HZM7hPWvJmAlVko6nnBwDQN9W3MHLlMOsbtrCLb90ogksg2aUFh5JR0CZcANWHEQzp7epbVHtkCTGruv4l/E5iELaaap0zoV+/QOI+RalZq8Md/JtXHho69bN8cUKIClYX7ApUChD67+6jBc+2sNsWISz3DRF2iEcMRA+BmwkWLPU2v6j27ootAxhu2evIz6uXDrzw8mxa0MQaQbMwq55627D/QJHDv0zlcZvuNi9YE52zA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(81166007)(36860700001)(54906003)(8676002)(4326008)(70206006)(40460700003)(86362001)(6916009)(41300700001)(70586007)(316002)(8936002)(40480700001)(44832011)(5660300002)(2906002)(1076003)(2616005)(336012)(426003)(47076005)(82310400005)(186003)(7696005)(6666004)(478600001)(107886003)(26005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:26.5762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aabd66b6-910a-4179-fa55-08daf2e8471c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5691

The NUMA information provided in the host Device-Tree
are only for Xen. For dom0, we want to hide them as they
may be different (for now, dom0 is still not aware of NUMA)
The CPU and memory nodes are recreated from scratch for the
domain. So we already skip the "numa-node-id" property for
these two types of nodes.

However, some devices like PCIe may have "numa-node-id"
property too. We have to skip them as well.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
1. Add Rb
---
 xen/arch/arm/domain_build.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 829cea8de8..8258048d0e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1185,6 +1185,10 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                 continue;
         }
 
+        /* Dom0 is currently NUMA unaware */
+        if ( dt_property_name_is_equal(prop, "numa-node-id") )
+            continue;
+
         res = fdt_property(kinfo->fdt, prop->name, prop_data, prop_len);
 
         if ( res )
@@ -2540,6 +2544,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        /* Numa info doesn't need to be exposed to Domain-0 */
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
-- 
2.25.1


