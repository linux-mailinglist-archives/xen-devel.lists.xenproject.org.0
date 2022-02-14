Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207324B403E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271080.465509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvk-0002Tf-Au; Mon, 14 Feb 2022 03:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271080.465509; Mon, 14 Feb 2022 03:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvj-0002Hc-OI; Mon, 14 Feb 2022 03:21:35 +0000
Received: by outflank-mailman (input) for mailman id 271080;
 Mon, 14 Feb 2022 03:21:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvg-0007B4-Nm
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34853964-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:32 +0100 (CET)
Received: from AM6PR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::26) by DBAPR08MB5558.eurprd08.prod.outlook.com
 (2603:10a6:10:1b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 03:21:27 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::76) by AM6PR01CA0049.outlook.office365.com
 (2603:10a6:20b:e0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:26 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Mon, 14 Feb 2022 03:21:26 +0000
Received: from d598cff77efc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1E48593B-EF03-4EF8-80B0-0BA192DFFB56.1; 
 Mon, 14 Feb 2022 03:21:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d598cff77efc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:19 +0000
Received: from AM6P193CA0100.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::41)
 by VE1PR08MB5087.eurprd08.prod.outlook.com (2603:10a6:803:114::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 03:21:11 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::4c) by AM6P193CA0100.outlook.office365.com
 (2603:10a6:209:88::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:10 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:15 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 14
 Feb 2022 03:21:09 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:13 +0000
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
X-Inumbo-ID: 34853964-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imow8UlbEMwA9qvqpckFhNwsAsfpDkhGSm02fiqstow=;
 b=nSoUmthnjbBw6NNu09CxwQAw3on4GhtgQVv5XGFm7s1YJLbJV36UUW7k4K73KWZPfKD20DqS+d283nBJJux7u5qnc7J4mhp1IE5vUUVylWPaRuJh/kZJT/kTjLWa5Dx77e7DYkBmMVvYaAUlqjmt2pd3TIm2X/Za4CcNbdgTU1I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c7f7bee1a37ed5a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYi6Wz4nOK7GaP0/DV/GVLvprPQ37wn8jHnE6MTK7Qx2KAuWKPqTFLy4z4uNNiZqd3c99Owt3/N15vSOH8oSBU+4UPnosg+P1AlLY/cHe++/UJextnR9Rjn1bQV2u3SktdY0Ie35vjr5HbQOqzRElUkvlbSrObzrSVo5x23j79/B9izwqKvu78sARLpS4h6tVU335mhakWU5TgJnZk0l/oSttXpDdvYPaIbJrjVvQ5Q8u3ip8yOIapkNMTIFQyg5fPNG+Cxq6FvM7wJxGAf/5ByQhST741blShnx92OmMGAm8nomtb4FQELi3kx5RHp4bbCBVSFNZ+aoPRFXr3vAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imow8UlbEMwA9qvqpckFhNwsAsfpDkhGSm02fiqstow=;
 b=DvPJaEMq5U/8pL4EAQqdqQuLCPTHBt5+XXTXA5HdKHH5jUL8anM7hHO9tMM4OgN8WGQaFemRmFKUqanMMOPYiTbB3LMMWrsDsVs/nPuw4y2Px90Y6RVDpCVCt0G4ksMDYzzUonkl2/I0HlTRXtlwwVgSDuzXSbUctPuS/2QS0KtUbzszy4XnTBTO+02zRyKDi9CdKSyPy5uRW24smnZLMnlpW2ECJo+m9MfLP5YW/DSWZUqVfFNVdNYdFcWgZFxq7n5G/6Hmo+Xwo4ld586r0Xf3BsmXx0nITLtL7T8iqM7J27B3eP8nzprVltpmdpLa9Z00AH3PfFK6dbmTwjeDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imow8UlbEMwA9qvqpckFhNwsAsfpDkhGSm02fiqstow=;
 b=nSoUmthnjbBw6NNu09CxwQAw3on4GhtgQVv5XGFm7s1YJLbJV36UUW7k4K73KWZPfKD20DqS+d283nBJJux7u5qnc7J4mhp1IE5vUUVylWPaRuJh/kZJT/kTjLWa5Dx77e7DYkBmMVvYaAUlqjmt2pd3TIm2X/Za4CcNbdgTU1I=
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
Subject: [PATCH v6 08/11] xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3
Date: Mon, 14 Feb 2022 03:19:53 +0000
Message-ID: <20220214031956.3726764-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: a89c6f7a-2286-444e-dfd5-08d9ef6915b8
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB5087:EE_|VE1EUR03FT035:EE_|DBAPR08MB5558:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5558DA2FE8FCC86A05054EE8F7339@DBAPR08MB5558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:78;OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G996ObXfx5BZRFYmOUGYcjMl11+BqvuSPuwP5+AevCsiItsOYlfuw7/TW+yBgSV3agrzOH2dH8ErAQlHQsBGw8QItRwnCLGrCGlKJg//hjYlMbHBRxtUIcVTSi208y5KIVseert+9qbLUPFEsO8KqI9r5vwnbbX7h0fVu4UJxVthyDEEaN9dSZYvIymRKELSoJjFHt0prV080zt1LyPk8g8AGJxZ+yU7ZMj0gt5bX0PIAkdAVJ60tDATAwEN28AtsLi/v29ke4GyabxcFdxhR8hNkko4LxJSdKcfSfYdjggWIz+haJVDOmV8OMfXnlwV59hE3Xqs3P9qu9SJZvCdGAGiY+uJP0yc8+xw4alxOGVxD1AaN0TjJGbKwqGaKabRk8bfdN0e9uJ/hYZHvDFCcigujhCCCl1N4YJ3XfFavNkF/OOP+BC48kiJZFR4Mfxi97WazGc1/hsx5lfKK+9aZ0nrUBqSmZTIizPtm2pYddIGj+M1UsclecjM4wu3lIT3YpSQsZke080kdu9oxVstB5Cg5HDxRWa+Oby0IKLPcrV2+LAJisQGlCh+DCJF8edAZugwtV3XKW3O/EWLGFeEI+kOpy9nzEHBR/s2CSnLxa66DN6G7d0v6QWb2px36Um8Ixlye9af/eUlEgq/AjgGKzOYs0inu9/xclFqvzpi/0HxlwhXNfgKCxU/XV86xzt3
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(110136005)(4326008)(70586007)(508600001)(426003)(186003)(316002)(54906003)(5660300002)(70206006)(36756003)(336012)(8676002)(2906002)(26005)(1076003)(2616005)(86362001)(47076005)(356005)(36860700001)(81166007)(6666004)(8936002)(7696005)(44832011)(82310400004)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5087
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d210955-ed99-4d27-af66-08d9ef690c4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DNfMHOtK5MklINxiTawPXw2mT8b+kOZ+w9AZ1ynNPyAV4VxX7GnYrM9Z93vfGuAEWvlpLla63DOo79DzHM/96ONetwGclJCPktVOFl0Awi9zwf8XhBMvGdyylpUdzQiyAj/64Nc++pCSPBtVlY+m0/X8qwYnzv9xhC9VYmjXwFv99FakFvGzPvEjYr1bncokXy0pBD/TSQpICNhge36IkRq3vRH+qrwamiPK5MP/Y8/U/GunMH8RDj1sO/iGQI10U1KiJ8o/jrWzXJ/44DaMqNm5YcTExnj2uVSIbyTLTiOT7HQQSwH9adE4nrIxAVEFtTxGL4BZ2G/9kL4TET+uzGV4PZSyywnjCFXsnSq2cY2rem9WALhzZc5hDR1lms5fXHT2lD4D70spn7ytzew89ItoMRHiNAI9wY1UultNCmFBFemgXGKRgGbG+qfa4P5xjDWvOXH1abcneJzk/vMkxpHHcsXq7pWT44r4XItOhuy8O5XWZ0m9lSux4h29dJFhmd4jv0BMD+BuV3ytpsYsHy3wbxMLuRncxcBw3cTTHGe5zuV+sBrgEmFPSX5q392/5+eCrJqduGbkq1RTFWDVW0UlzqKZMda/JjhkT3rl7nExBMiH1UR1V4wG9YX7UmIsFcTNc4MN+n9owqX2glpoxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(36756003)(44832011)(508600001)(47076005)(5660300002)(316002)(336012)(70586007)(70206006)(426003)(8676002)(4326008)(54906003)(110136005)(7696005)(8936002)(186003)(26005)(6666004)(1076003)(86362001)(2616005)(82310400004)(36860700001)(81166007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:26.3584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89c6f7a-2286-444e-dfd5-08d9ef6915b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558

This commit gates function make_gicv3_domU_node with CONFIG_GICV3.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4 changes:
- remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
CONFIG_GICV3=n
---
v5 changes:
- nothing changed
---
v6 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 87391adde6..a01dc60b55 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2322,6 +2322,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     return res;
 }
 
+#ifdef CONFIG_GICV3
 static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
@@ -2371,13 +2372,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 
     return res;
 }
+#endif
 
 static int __init make_gic_domU_node(struct kernel_info *kinfo)
 {
     switch ( kinfo->d->arch.vgic.version )
     {
+#ifdef CONFIG_GICV3
     case GIC_V3:
         return make_gicv3_domU_node(kinfo);
+#endif
     case GIC_V2:
         return make_gicv2_domU_node(kinfo);
     default:
-- 
2.25.1


