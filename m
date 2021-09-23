Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAF415826
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 08:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193423.344520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTI0f-0001Tq-5D; Thu, 23 Sep 2021 06:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193423.344520; Thu, 23 Sep 2021 06:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTI0f-0001RQ-1e; Thu, 23 Sep 2021 06:15:05 +0000
Received: by outflank-mailman (input) for mailman id 193423;
 Thu, 23 Sep 2021 06:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o0JA=ON=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1mTI0d-0001RK-Ql
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 06:15:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8e0e5c9-4c03-4101-b638-2cce0b8f3316;
 Thu, 23 Sep 2021 06:15:00 +0000 (UTC)
Received: from DB6PR07CA0178.eurprd07.prod.outlook.com (2603:10a6:6:43::32) by
 DB9PR08MB6779.eurprd08.prod.outlook.com (2603:10a6:10:2a1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Thu, 23 Sep 2021 06:14:58 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::c0) by DB6PR07CA0178.outlook.office365.com
 (2603:10a6:6:43::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6 via Frontend
 Transport; Thu, 23 Sep 2021 06:14:58 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 06:14:57 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 06:14:57 +0000
Received: from c4187ebfdf87.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D077FA00-2652-4B72-963E-E7F2DABD831B.1; 
 Thu, 23 Sep 2021 06:14:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4187ebfdf87.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 06:14:48 +0000
Received: from DB8PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:10:110::37)
 by AM9PR08MB7055.eurprd08.prod.outlook.com (2603:10a6:20b:412::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 06:14:41 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::87) by DB8PR04CA0027.outlook.office365.com
 (2603:10a6:10:110::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 06:14:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 06:14:41 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 06:14:41 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 06:14:39 +0000
Received: from hongda-OptiPlex-7070.shanghai.arm.com (10.169.190.17) by
 mail.arm.com (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Sep 2021 06:14:38 +0000
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
X-Inumbo-ID: c8e0e5c9-4c03-4101-b638-2cce0b8f3316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69C0iju/EYJemdr7CnsUN2JOzLyOYq1kPVmEocvSqf4=;
 b=fAl/4w8cmTXdae+mm+G8fLCeNRCZTpzqk9vSvNZ9G5Jntiqyihh6KDXg+OnOi+3OTJUqUj9qv4w3NQmKmuFTh/0MRwVEkl+2/PG8kTlKY9Dif4SGOFyqYiuBcxV2EMz1cuSLMAr1sdScwDmzoXKatRyVvfzIo/N+EJI+2Gxaf78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71420fc32d36208e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvMgSzTQtFVBjRJX3dxRW9Rops7il4akQL9b2rmXwE/EY5iwt9aQxl049agu6YKGF3PRUVXX2Mj9MjnvtvvJzippOzNBx/K6kz7OuOXa6sVRERVEPN4N14M2tMDgcBIqRAhhk3gdlbMDA1Cp5gfBSv7m8uHs03KYTJkrI6afJG819hbyjb5ZMMKOlbhPI4chYOMGC5SdbwipAwjSyvjHk6UIfR5jpAdis6SV5jEb1fPT6ihOcvwbrOjVHbTg0iXTLfU/RDxQ8cB+kXVpVaKDW6PaYUf74FQNmlI5bxWrnW21soU/rAwEA2XaUSwhJbv5xR8bog8t4lbfm1rMiklodw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=69C0iju/EYJemdr7CnsUN2JOzLyOYq1kPVmEocvSqf4=;
 b=h3s51cdKU517z5z9bJ5LmFGavmVK7280zqJeWrvT7Lt5GexDg6x9rLA8Q0TvfkJWzUaSv+XXDRTpcCoSYAtVHV54hLSwo5R6CB/q6nAMC6wCZa8tnqB7d1WRs010q2ZHXQY5kk2RsKsp/jjjn+zun2pKedBw0IZtFzrCprbvc5VTWoTAG13y2yGpw9RQ9UuNOmqI/+YUQxAfONul33I0dPDCvTlObAa035oSgZv5iHRFBQxllYflb8N0AfYoieAO4oiuD/MxcAQxlBwRZUPljF3nWWF9IvkggPMfHRmajyHLQkagWn0MbblZMW4u/BjFUBhnBnBrKvoEmnoI9tSV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69C0iju/EYJemdr7CnsUN2JOzLyOYq1kPVmEocvSqf4=;
 b=fAl/4w8cmTXdae+mm+G8fLCeNRCZTpzqk9vSvNZ9G5Jntiqyihh6KDXg+OnOi+3OTJUqUj9qv4w3NQmKmuFTh/0MRwVEkl+2/PG8kTlKY9Dif4SGOFyqYiuBcxV2EMz1cuSLMAr1sdScwDmzoXKatRyVvfzIo/N+EJI+2Gxaf78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Hongda Deng <Hongda.Deng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <Hongda.Deng@arm.com>
Subject: [PATCH] xen/arm: vgic to ignore GICD ICPENRn registers access
Date: Thu, 23 Sep 2021 14:14:29 +0800
Message-ID: <20210923061429.16361-1-Hongda.Deng@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e8a6041-2daf-4c57-6697-08d97e5977ec
X-MS-TrafficTypeDiagnostic: AM9PR08MB7055:|DB9PR08MB6779:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB67796C2F268EAB24CBB0CB0CE6A39@DB9PR08MB6779.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uGbBTgWTJ5jCTAwrisik+Ucc414aU65veeZpe/pJkVfUiSt7KB8ZXic/n5wodRqXov8DjslzEbF1ojCOtJrrHj4jvoaYEoD+RwxrkzBawx3LCGGGm6XakrVSkSH2UdNfxZWabFO59zDSQaYI+1k/yZqmaO+ph8uySMpXONXMt7B32azyuqT4MCJNK9L/oR+47V5bm91bxh9PqHfqmsBVSViDT0tzzatGkCZcqHodmpxHG8UFIaiwOJOewLGrSsTXPBTlIaTYNbCOXNyp69MY7bEcY9eGJWvW3QqmLUSdOeiB36W8m+lib0ECqq7iaiueB55ewr9s1XP20MhtETGj39EFOWJVDX1qJgOf33peUIhp6VTC/YtBKwk820sxerKSFNxgy/NlFg8mS5g8F+Iz72pe23rB6MqJ7ywj2Pqboxsg1uVb2iWWViRmEzcRY+CM2qMRtoXhoAQ7nZCaDpqdpxdW9W01xF3iR5L52UtkY8CoEt99HDQFk6cpaJPsWBlZhB92Avh2sSaOtbSupKbVoS2BM4YeCqqSqPocWTJeaKPW7NelDP0zyop9YizUzD3a7vLOZPUeeLLCQj+dXRmEeCQMphsKQFJdcGHB0wFKIkvlftZlaMEyQb5CUIdPg8oz40l6PGqbxqkMJDQjSVDhhBK5Jkho7YriQ2f5CvpjZwpka89QbFf6JKI6ziMplThtkOo33GvtpJLLWrICO8g2KESZGn78tzIdbFVI08yHUFCtJ2uNopd6/cOE+ZSDmV5e0W5ak5Qvozk1VsLr9gLDeaKTlh6RAjakleidKJ9N6iJ3P+K2INpgJJZIOFvwY4uj
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(508600001)(5660300002)(36756003)(8936002)(81166007)(356005)(2616005)(36860700001)(1076003)(8676002)(26005)(82310400003)(47076005)(7696005)(966005)(316002)(54906003)(83380400001)(336012)(70206006)(4326008)(186003)(110136005)(6666004)(86362001)(426003)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7055
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5d0a739-f3be-485d-850a-08d97e596de2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	anpc1yN7ObQ/JitSac+5MVS2P/DhfUHDVCLPuLNvgBw1HAyBUYvwZOvqui7PsVy7N/HP0wwfVgALSfbh9Jxp9zcSZLYNFSPLDSuvrlBDlNj8gwe/FgEapSRDQuLeZxotoBQMqofXjqG+5GmmXQwzF6W3HO6UKgjyc+o4QZ8otPFc9BX/NJ38/E3rvHIYpcjX2XjxYvUyFYQP1sr/E/sS+L4VgUzc0dfMnZeFS0ie5AbHxmWAbLoG0VZ6tuTZXBwRHmdRJLr7HZfFRCHwS8wsnnq2CTT3aY1/WqG00NAQ3hKwyKDF5VHKija2+f6uuriaMS1K8dN7+xv5vcqECxTxcJli0w9IsWbXJcZlZT1qEEsbXhFgqRXqFx3wwMsULol+Q3VIpBXA70t35LBRO2pMaJ5sJKXKL/j+mb5qbeUGLaGnQ9sdF4vDxoJl6YmDV2UGmqxQxLBRbkj2M1kFqW0zlP2AGVxSc9ekhL/B0vEbR97k2GMfAd0x/4Hh5gyV6SNAx3Q1WwjF2uDkA+335RqPP9vN7kPJrMJDNtz6Iq/CyFI7iBtYJOBz7wPDAlH618jzhDtGtHd0SxASmwPEMk2aARSASb5Yfc/w9lF+TRT/SF3m4tRl3M9l9JVKOjk7plRfejXDRodLUaVeU0DunbGBZwbDlkuX1KB+uCQI9B0eHTeI0v1atkl0U8HT1grAXPtFUnL1lT18miXFQmvxY0VYZkZfSNWmWNoAEr3c6gUBJE1Ktm0B1TJNEtQsLrlhxk/lr44seX0SZQsQKDzKkP0bk6IRfKbfQgU8KHeyBupxQpU=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(8936002)(70586007)(54906003)(110136005)(82310400003)(4326008)(5660300002)(81166007)(6666004)(2906002)(316002)(8676002)(508600001)(36860700001)(47076005)(36756003)(1076003)(186003)(26005)(7696005)(86362001)(966005)(336012)(2616005)(426003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 06:14:57.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8a6041-2daf-4c57-6697-08d97e5977ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6779

Currently, Xen will return IO unhandled when guests access GICD ICPENRn
registers. This will raise a data abort inside guest. For Linux Guest,
these virtual registers will not be accessed. But for Zephyr, in its
GIC initilization code, these virtual registers will be accessed. And
zephyr guest will get an IO dataabort in initilization stage and enter
fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
we currently ignore these virtual registers access and print a message
about whether they are already pending instead of returning unhandled.
More details can be found at [1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/
msg00744.html

Signed-off-by: Hongda Deng <hongda.deng@arm.com>
---
 xen/arch/arm/vgic-v2.c     | 10 +++++++---
 xen/arch/arm/vgic-v3.c     | 29 +++++++++++++++++------------
 xen/arch/arm/vgic.c        | 37 +++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/vgic.h |  2 ++
 4 files changed, 63 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index b2da886adc..644c62757c 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -481,10 +481,14 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v, mmio_info_t *info,
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
+        rank = vgic_rank_offset(v, 1, gicd_reg - GICD_ICPENDR, DABT_WORD);
+        if ( rank == NULL ) goto write_ignore;
+
         printk(XENLOG_G_ERR
-               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d\n",
-               v, r, gicd_reg - GICD_ICPENDR);
-        return 0;
+               "%pv: vGICD: unhandled word write %#"PRIregister" to ICPENDR%d, and current pending state is: %s\n",
+               v, r, gicd_reg - GICD_ICPENDR,
+               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "off");
+        goto write_ignore_32;
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index cb5a70c42e..c94e33ff4f 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -817,10 +817,14 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
 
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
+        rank = vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
+        if ( rank == NULL ) goto write_ignore;
+
         printk(XENLOG_G_ERR
-               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d\n",
-               v, name, r, reg - GICD_ICPENDR);
-        return 0;
+               "%pv: %s: unhandled word write %#"PRIregister" to ICPENDR%d, and current pending state is: %s\n",
+               v, name, r, reg - GICD_ICPENDR,
+               vgic_get_irqs_pending(v, r, rank->index) ? "on" : "off");
+        goto write_ignore_32;
 
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
         if ( dabt.size != DABT_WORD ) goto bad_width;
@@ -978,19 +982,20 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu *v, mmio_info_t *info,
     case VREG32(GICR_ICFGR1):
     case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
     case VREG32(GICR_ISPENDR0):
-         /*
-          * Above registers offset are common with GICD.
-          * So handle common with GICD handling
-          */
+        /*
+         * Above registers offset are common with GICD.
+         * So handle common with GICD handling
+         */
         return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
                                                  info, gicr_reg, r);
 
     case VREG32(GICR_ICPENDR0):
-        if ( dabt.size != DABT_WORD ) goto bad_width;
-        printk(XENLOG_G_ERR
-               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to ICPENDR0\n",
-               v, r);
-        return 0;
+        /*
+         * Above registers offset are common with GICD.
+         * So handle common with GICD handling
+         */
+        return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
+                                                 info, gicr_reg, r);
 
     case VREG32(GICR_IGRPMODR0):
         /* We do not implement security extensions for guests, write ignore */
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 8f9400a519..29a1aa5056 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -470,6 +470,43 @@ void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
     }
 }
 
+bool vgic_get_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank)
+{
+    const unsigned long mask = r;
+    unsigned int i;
+    /* The first rank is always per-vCPU */
+    bool private = rank == 0;
+    bool is_pending = false;
+
+    /* LPIs status will never be retrieved via this function */
+    ASSERT(!is_lpi(32 * rank + 31));
+
+    for_each_set_bit( i, &mask, 32 )
+    {
+        unsigned int irq = i + 32 * rank;
+
+        if ( !private )
+        {
+            struct pending_irq *p = spi_to_pending(v->domain, irq);
+
+            if ( p->desc != NULL )
+            {
+                unsigned long flags;
+
+                spin_lock_irqsave(&p->desc->lock, flags);
+                is_pending = gic_read_pending_state(p->desc);
+                spin_unlock_irqrestore(&p->desc->lock, flags);
+            }
+        }
+
+        /* When get pending state, break the loop in time */
+        if ( is_pending )
+            break;
+    }
+
+    return is_pending;
+}
+
 bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
                  int virq, const struct sgi_target *target)
 {
diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
index 62c2ae538d..ffc841e5f5 100644
--- a/xen/include/asm-arm/vgic.h
+++ b/xen/include/asm-arm/vgic.h
@@ -290,6 +290,8 @@ extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
 extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
                                   unsigned int rank);
+extern bool vgic_get_irqs_pending(struct vcpu *v, uint32_t r,
+                                  unsigned int rank);
 extern void register_vgic_ops(struct domain *d, const struct vgic_ops *ops);
 int vgic_v2_init(struct domain *d, int *mmio_count);
 int vgic_v3_init(struct domain *d, int *mmio_count);
-- 
2.17.1


