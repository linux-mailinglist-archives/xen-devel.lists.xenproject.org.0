Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9A04EBDC3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:38:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296123.504044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUly-0000rg-Dt; Wed, 30 Mar 2022 09:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296123.504044; Wed, 30 Mar 2022 09:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUly-0000p0-9w; Wed, 30 Mar 2022 09:37:50 +0000
Received: by outflank-mailman (input) for mailman id 296123;
 Wed, 30 Mar 2022 09:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u124=UJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZUlw-0000Fm-E5
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:37:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ed4d611-b00d-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 11:37:47 +0200 (CEST)
Received: from AS9PR06CA0073.eurprd06.prod.outlook.com (2603:10a6:20b:464::17)
 by VE1PR08MB4861.eurprd08.prod.outlook.com (2603:10a6:802:a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 09:37:35 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::76) by AS9PR06CA0073.outlook.office365.com
 (2603:10a6:20b:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:37:34 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 30 Mar 2022 09:37:34 +0000
Received: from a861ce71bd4d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EC18895-6DA7-4026-AC93-A4274A7F2B58.1; 
 Wed, 30 Mar 2022 09:37:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a861ce71bd4d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Mar 2022 09:37:26 +0000
Received: from DU2PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:10:2b0::8)
 by AM9PR08MB7014.eurprd08.prod.outlook.com (2603:10a6:20b:41b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 09:37:24 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::e7) by DU2PR04CA0153.outlook.office365.com
 (2603:10a6:10:2b0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:37:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Wed, 30 Mar
 2022 09:36:59 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 30 Mar 2022 09:36:51 +0000
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
X-Inumbo-ID: 0ed4d611-b00d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUQ3cl6p5PyL7bKJEli7MfTrbAhvi8uIycMc+ch+Fi8=;
 b=PnMuhDzUw7XGckigOXqBlUiPTc2uQ40Yxkk035hwxB6axL4ScInmZoILiZqkvE3u5veY/HbXXR8bmOsRcw7jcO83t0uKb7efMfd840699uim79hVnyQ62EMXVKuTtww/Y2RQh/9GWfBfQPW23F65Ud3r5bn4OmDTXxz8B4jtlCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3d9b65d0ef536fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQDUiSdVqkEeooN6yHjMkXa5euxhYvIYlV53Vf9ULF1mrUKlhSdV3gFeSqp5iTPrFfswbGgcNLkLNWkXwWVQ4kLCGYoEfkP9JxQeKJ4ULl4vgedj9hxkQF19cgKmTE+iScQ3QuZBRXlqMEvo+0F1jBhb9qu7j/mRF6aeX1A7LwTKB3/3MdyybYrgywOwefysMyUk8CY/Z3eYeK3ywE6a5cRmmELwhJOTARDPGQv8CA7xOMSsrMgz8hyUUAFrjlPXKFxAoQ6DipgzuNXl4vj2dskzd/tyBjlzASpDWg5718dGBXUlCodyeGRzK6knLLgShOMUV6kaZGmkYCdxDSn71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUQ3cl6p5PyL7bKJEli7MfTrbAhvi8uIycMc+ch+Fi8=;
 b=aRH8fsZjkLBQO/iui6kFCWYJRlz1of2foj+3Ou2i27t0TWdJHktVkXaqbYC7thTIKwRUKjpdQoM0CBOAdrLVk3zKe5l3Wa0fRbK+b/02g7xgFp6TbA1iMpXzv06tNmjdQt8pcsl9krI4MZm4lGz5pa9GJpKrIhSMJ2MZZ/tVqtkQ7IOpQ+tmJ8EX/L6aaFBMyM2hhTckRPjGcuP+9Nce0XK44xwpcmQ8NENdj2kfmDJxtwZzLIUYcq1pMpoV38qZmEQwQT4fK1uL0/X5zCw7IV6c3pFmXih3UjvRuSo5J+3J3WoZHjiD04XOV2S3Eb/gNoazC2vzBT68iHxIAoZhGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUQ3cl6p5PyL7bKJEli7MfTrbAhvi8uIycMc+ch+Fi8=;
 b=PnMuhDzUw7XGckigOXqBlUiPTc2uQ40Yxkk035hwxB6axL4ScInmZoILiZqkvE3u5veY/HbXXR8bmOsRcw7jcO83t0uKb7efMfd840699uim79hVnyQ62EMXVKuTtww/Y2RQh/9GWfBfQPW23F65Ud3r5bn4OmDTXxz8B4jtlCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng
	<penny.zheng@arm.com>
Subject: [PATCH v1 1/5] xen/arm: field "flags" to cover all internal CDF_XXX
Date: Wed, 30 Mar 2022 17:36:13 +0800
Message-ID: <20220330093617.3870589-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330093617.3870589-1-Penny.Zheng@arm.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 4fb68276-2cb6-4d87-339a-08da1230eb79
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7014:EE_|VE1EUR03FT018:EE_|VE1PR08MB4861:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB4861C0BD8A7AB1D2FD83C4F7F71F9@VE1PR08MB4861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gtMoY+OwRg9vLJmt+sbbMTdoosTCBIdMeF93ER6GnpmXtUBsdDnoqNjZ3IBhHLEFpcoOKZ9PfKzPQxxRVqLl3Hs7wIpCykqTGIOm/aporm1MbYKDoqWurdxYQdVsWTioVJCrN3P8D00U/fdE4x9dx+l/oT3Mn2Pw5kgZ2cWh85NXeFBItb4IikRvKShVOEqqVAhucPLLa1zQzZfRBvRHDhn1elOlrJOOJadPvD73CMRZa4RHg61Lbi9Yb/kefV0wv6BylevcN7cOe7zgXt2hW3uRk8m0PkzsNIrwp8J/Zs3e7PnYEKdXoM+pLreCN+bgRYhIEhUTPuw09I3Yij9sud7yxHO23RhO4vmQJw6ei+ieTA0MJ3IEQkxuU0Lvu8RcgnvBc97v8QXq3wttApA9dl7xQzdOcFS+GO3uM1MyAeSRIXLomsvNNeOnfimn59HQ42VS8VuziIw0gUTXyeU4nsu8GfA5IrOROFTej/n/mCRCYGEOCGbjJCWhsBUdRhSNFJETEaDfXssnhTMRFIucTJFLZn/PpXfPkFCWI/220lhrn3XbR3ycbLzI6U0jVsRTQ2FwC1DoIrXReOPcyqZJM7P6B9eQD2ky/TrTGJRZVulCkszpgW9au/t82E8yoiiQT8IdpE2zJXYpClsIr6fKWOcccYxGFg0xqOLaHEn+4ptjjFTpsBw2A9nb5l7uojYFjGZ+w8wg+qm6yy/oRty0UBE7ONNwR9eoPi6yfaq/w4w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(2616005)(70586007)(47076005)(40460700003)(8676002)(336012)(186003)(82310400004)(26005)(1076003)(83380400001)(426003)(81166007)(356005)(5660300002)(316002)(36860700001)(8936002)(2906002)(86362001)(6666004)(4326008)(36756003)(7696005)(6916009)(508600001)(54906003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7014
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a096aa1f-165f-4adb-8b3c-08da1230e50f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8LosLsHKdZcSl8W/K289oUL6M/Q/qYDIpH/3DdHqaGY6CPtNaeiDQyFlK3tFNFw0UpFJLp7KB5h7xb/eTszdjos22G8MDfVyzfFHkqXh9vcs3YxFBCinMG3GI5ZYGR8bHyEE8T+lMEPbCOd9Atv9cccs/1VhtFXueWQxG0e5wlM1Syel8MxnvUj9/DQskII0IuUBSCWaSWlnBS106ht9yd8OjA+JoaT2mrxJdo3CQyvTKMnKb/5IkQmfY17XybjqJgWJ1X+hvjjLB0z6ZohDJ6hABfGNALpRONKK3+flCsNrCaHly0TY/uNTHQ3PoWIxXGnaHmtzANKvYQMyTyYo6ywXDW+J/4dDd6l943eYKE20GFzqWdq9sns8286cILVKznfCRoR6TuOi2c3TjcCsVdIT3wNb7j98x9MNn6RqEGnD/n1a04yWbYB1EZ9ZZgtMjWMydcaAiy8uKl/Nj+8fhIJIMYW6WZt4+KDSKIZjMohMVcMzagayi9ioUtPdnsDZT6pevMtyTvlBNIaInRPmgIlW2RrVdH+PwGaXFazTDIH7m9/kBZ2FmxUW79VPUElpkB/B+BXZKRuBhljVy6a4P6DuNOQLAOfDceKvz2GxXXrKV8/zNT7bQSy96T8/GoEnFUib7kHPmHSIgXGsS74ebZMZ5ZIPuo4TwZtcFnVlsIxoEWoLXhO48snX+7LI1tRqJeXXrFPFER4dt8KVz8atbw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(508600001)(81166007)(86362001)(6666004)(82310400004)(316002)(54906003)(6916009)(47076005)(5660300002)(83380400001)(7696005)(36860700001)(4326008)(8676002)(186003)(70586007)(40460700003)(8936002)(2906002)(2616005)(70206006)(336012)(36756003)(26005)(426003)(1076003)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:37:34.3728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb68276-2cb6-4d87-339a-08da1230eb79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4861

With more and more CDF_xxx internal flags in and to save the space, this
commit introduces a new field "flags" to store CDF_* internal flags
directly.

Another new CDF_xxx will be introduced in the next patch.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain.c             | 3 ++-
 xen/arch/arm/include/asm/domain.h | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..35c157d499 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -709,7 +709,8 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
-    d->arch.directmap = flags & CDF_directmap;
+    /* Holding CDF_* internal flags. */
+    d->arch.flags = flags;
 
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..95fef29111 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,7 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-#define is_domain_direct_mapped(d) (d)->arch.directmap
+#define is_domain_direct_mapped(d) (((d)->arch.flags) & CDF_directmap)
 
 /*
  * Is the domain using the host memory layout?
@@ -103,7 +103,8 @@ struct arch_domain
     void *tee;
 #endif
 
-    bool directmap;
+    /* Holding CDF_* constant. Internal flags for domain creation. */
+    uint32_t flags;
 }  __cacheline_aligned;
 
 struct arch_vcpu
-- 
2.25.1


