Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5B47A448
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249409.429881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7j-0001Ms-0B; Mon, 20 Dec 2021 05:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249409.429881; Mon, 20 Dec 2021 05:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7i-0001F4-OU; Mon, 20 Dec 2021 05:22:10 +0000
Received: by outflank-mailman (input) for mailman id 249409;
 Mon, 20 Dec 2021 05:22:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7h-0007eG-0Q
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe02::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66df3f3-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:22:08 +0100 (CET)
Received: from AM5PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:206:1::38)
 by DBAPR08MB5845.eurprd08.prod.outlook.com (2603:10a6:10:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:22:05 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::ba) by AM5PR04CA0025.outlook.office365.com
 (2603:10a6:206:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.23 via Frontend Transport; Mon, 20 Dec 2021 05:22:05 +0000
Received: ("Tessian outbound de6049708a0a:v110");
 Mon, 20 Dec 2021 05:22:05 +0000
Received: from 532f716b7bd6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B38C9A55-19C4-49AE-9C0C-740960FCFA4C.1; 
 Mon, 20 Dec 2021 05:21:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 532f716b7bd6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:59 +0000
Received: from DB6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::16) by
 AS8PR08MB6613.eurprd08.prod.outlook.com (2603:10a6:20b:339::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 05:21:57 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::10) by DB6P191CA0006.outlook.office365.com
 (2603:10a6:6:28::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:56 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:56 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:54 +0000
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
X-Inumbo-ID: c66df3f3-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS564yQkFbORxrHAzkwHkRpIJHS3ZaGMDAAY7ObgxuM=;
 b=TmUHiyuGArEyjWAV5EQuGFTuL6LOaBzrRejx83HHAp62m+l+rbmJusU2vIqW1aunItVnwnwLizCJlTYiTmSCVMJCcIGnGDn9YJzok4g+KtBEy9xpTvg5NvIo6gGqCVT7cj67mM0UP5O3mHXgoE48wQqalub4blQiBsscFAYuLb8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: be6038fb2697d877
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L58t8p6J9UEsDAy1hm+DLriwej0nVRJnQfOISweW3g9Vg/wWqlMNy1TA1bbElr1tob2tLs0y5NDL2CLpYsGqskGGDV0DvdImMqyWjKfCs9s/Te7ZwIhe+7b+jM/u72hdbvL7Mxtz5d/EwdVRYHdG/1+WSxNei543p/D67otoJG4Sa80sK3nnbhFHKwFbKYygZzOVNTr6ugyPczojwJbCfa7LUs43auzn6cYwfNLO1pyA6LBBwVP4fW3jAbaN/BapIuQknDeJnglc0QidawI7Nh9fgFzK6lODF2mnxCBLpIZsINsD+JgqMYfKmC5nt+Q/T3K3oQEFd/mh28V1Vtk53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QS564yQkFbORxrHAzkwHkRpIJHS3ZaGMDAAY7ObgxuM=;
 b=ZV11EUrHxfCRIKWjYymCDCftaKYw/Uw/bsrtrwdngp+4lGHBA7UPGsukrGzMF6indeJJ94DQqE0/UxbBiNLo8wqf7eXrhjmhyh0Odux1Z3u8oPxeV1UWhuznKVX3y6lfzRRhVK9gxLMPD7/IVHECK2EYc0D0fLxumdBIp1XtEmC2gAui96upss4MSVKCbIj5j1HxCbhh28pKgOSq8yuf6fYgdTUk9a+mLpDlsvcaO/9jrTWcd2AaQvXloRYaL8+rsm1PcXD/26eIdLqLQloyfjSJ7AlLRnyLJoYdCN6fvXyrND1qpr9cmrfv5p31KKkYA02u7ByvOCeZsstH60jhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS564yQkFbORxrHAzkwHkRpIJHS3ZaGMDAAY7ObgxuM=;
 b=TmUHiyuGArEyjWAV5EQuGFTuL6LOaBzrRejx83HHAp62m+l+rbmJusU2vIqW1aunItVnwnwLizCJlTYiTmSCVMJCcIGnGDn9YJzok4g+KtBEy9xpTvg5NvIo6gGqCVT7cj67mM0UP5O3mHXgoE48wQqalub4blQiBsscFAYuLb8=
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
Subject: [PATCH v4 08/11] xen/arm: gate make_gicv3_domU_node with CONFIG_GICV3
Date: Mon, 20 Dec 2021 05:21:20 +0000
Message-ID: <20211220052123.969876-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: ffe050a7-054a-49d9-d009-08d9c378a957
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB6613:EE_|AM5EUR03FT064:EE_|DBAPR08MB5845:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB58453244E116137421BF0C7BF77B9@DBAPR08MB5845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:78;OLM:78;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gwrFkjdqjCRbi+RYjAdKpkIPsn/OR+Y1Mn4e3RRJkRukaihoYv+HaevKJYtcIMEJxA29W76UGflvEQ0oMHAkGr3Jyl61XH+SkfPzewHPT/0niLy7/1gj9EYuYpKqu6g8EmAN7LOlkfc2h7DkV1BhpUTeyvVdgbiaDp25AaxkZAJeoqCvd7pRSdGmX1UIisPKpSLMIwkWSiHgaX5QNAz3O0C1AFZ2MVdUWvlmMdBgQmSUwxajABeWN+aCm0hIG7D/ZHqGAGWBAOaBWHHEbmPDKV5mJHCN0k7wZfy+nTITMQcDIRPXUgIseHH3aA1/q1zbVi7WOx3pxrblps+J677cXaMXQ//yLg9IkRjTK++8DNYGW0iiKo1B1v0vaJwRfkt2eQYN6cQV3Y/3F3wMEivJilU3yF+o4s4Q/ayQ6dZ3wmI5O3TTmE8rAKXLWdOwD61O/nAtUg0hTIxYvkYfhTd5zNMKZXvZwcbhJ6c32Xvn88GkWPP9FPj0nDYMVtu/1cw8DYmvy7ac4FjUzrJeCWrmg9yRy5JsEKOc37AoAfmyp3n4P+ZIOzRGn0FeCcS5A0b/zlS5n8ZFjuT1g6UySAzwPRxSE+RmwAahYGI3WyvqHfINojLEmVUCSpcAztd19a9hxTC/y1CRQLZYyz708aeLA4zG7EPgKYvWM0XlXSCaBpVcEQtUtGWlaR11VNeWLYprdpidDRMxbKWYZJRgBl617IpPhnKSuJiIKhGrPq2aw770ughUQLOyVnlzZEC0/FcEvSugJ/f8F1DFvn81LBG7RA3APkbC7eod0bElcmhs4t8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(8676002)(2616005)(336012)(508600001)(6666004)(2906002)(81166007)(47076005)(5660300002)(186003)(36756003)(356005)(36860700001)(54906003)(44832011)(40460700001)(8936002)(4326008)(1076003)(7696005)(426003)(110136005)(82310400004)(316002)(70586007)(86362001)(26005)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6613
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	099f781f-64d9-4d8b-c0ea-08d9c378a446
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jwEn7YzCU+nm0KLv7lIZaPQVn4NFhA50LabcttI9sPnQTeIWTWfia+wL4nm20egSv8a8OmsWhvFiV+EWOgqEEEXPm/37HJU47As9vwwldJRXTtnqrpLWfqowitUe0yCkSgX43aZq9e8R4E7Hq+aWUcW6mpsORT2xr1b79Cf7Vvk+2oChOE9VsNvqu0txOXt4MpWEUeQKr65u0pseHaM8sk7wGrkbL039zqzBnyYBei8HZgmJJ8O0ISm+emsA6eT+MyZZX5gxaz6d6XpBaE1307sddacglpiXYNtq5M3BmBBTg0yOuWwYCOlvWTJChty8cgRiB4rsRVpkQGNOanbCgsjphMB9ZX2MmP+zIMFEJ/60KXoHyVEeSL01eZTCJ9c7H97SR4Dm0wE9lirOgOQtl7+cWq8orkwli8S9zbuZP4FAQXDGDCemwBk56lAAkZ9a7JLQOXRL/qxfed4Ml582AUMgtSKhG7MvYTUskS8kkJrttpww+zV0HDTcgz+QcffOW1u+yCYPAG/fyonKJaVVYkEYusrDxjXmpgJEyol4HesmdV8umFJvQfWqpAQv1uTzG2nor+ezWM6vryid1H3CbpjcelD6K0SkLAuvA9JAj9c+TLoNWMZl6TlprOX8kJHdj3+kMsXeTkQKsGTc1xQomdg/ttyzcRhmQW687gyW0Wpp3DkcKeMOSPp9KAzFtksNqDYAjtlChonN08gxXwaxoQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(1076003)(110136005)(54906003)(6666004)(86362001)(36756003)(186003)(82310400004)(47076005)(81166007)(70586007)(36860700001)(7696005)(5660300002)(2616005)(70206006)(26005)(2906002)(44832011)(508600001)(8676002)(4326008)(426003)(8936002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:22:05.3607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe050a7-054a-49d9-d009-08d9c378a957
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845

This commit gates function make_gicv3_domU_node with CONFIG_GICV3.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v4 changes:
- remove ASSERT_UNREACHABLE() to avoid breaking compilation on prod build with
CONFIG_GICV3=n
---
 xen/arch/arm/domain_build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4788b03d8b..139d428524 100644
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


