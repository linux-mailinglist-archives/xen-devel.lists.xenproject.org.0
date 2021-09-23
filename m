Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB3C415E24
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193981.345648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNff-0001VC-3h; Thu, 23 Sep 2021 12:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193981.345648; Thu, 23 Sep 2021 12:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfe-0001Kw-Qx; Thu, 23 Sep 2021 12:17:46 +0000
Received: by outflank-mailman (input) for mailman id 193981;
 Thu, 23 Sep 2021 12:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNVQ-0005KP-5Q
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc77ab59-227c-4d3e-b0a2-387a2c701b56;
 Thu, 23 Sep 2021 12:04:27 +0000 (UTC)
Received: from DB3PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:8::48) by
 DB9PR08MB6586.eurprd08.prod.outlook.com (2603:10a6:10:23f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Thu, 23 Sep 2021 12:04:25 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::e2) by DB3PR08CA0035.outlook.office365.com
 (2603:10a6:8::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:25 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Thu, 23 Sep 2021 12:04:25 +0000
Received: from c6c05db66536.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF2ED06C-7B7F-499C-8A2E-123668EAFBD0.1; 
 Thu, 23 Sep 2021 12:04:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6c05db66536.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:13 +0000
Received: from AS9PR06CA0116.eurprd06.prod.outlook.com (2603:10a6:20b:465::26)
 by PR2PR08MB4732.eurprd08.prod.outlook.com (2603:10a6:101:26::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:11 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::19) by AS9PR06CA0116.outlook.office365.com
 (2603:10a6:20b:465::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:11 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:11 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:45 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:44 +0000
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
X-Inumbo-ID: bc77ab59-227c-4d3e-b0a2-387a2c701b56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw2w6BJL6KcQ0ikVAlb5sou0Hf1qviJ3JlTLvaJdQt8=;
 b=RpJ9V+UMlBJjkPmu7iFrbzNjdCJrgADjbpCyW3WMef1SdV5r0ra69IqLQSOmAv7kg7OkfZgM0n2AA8hHPyeTx3GomAMV5dDM/9VCnm+N/FsqTiJ+L4rUZNBCXYQ1Waa0RKGN4SoUu28ccuA0oMdIZQ2Ls6c1nqDGQmr65V1vYS8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91056ac04821cc0b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnRn8B9dodBh4cqw4ukaJ3bCWbZq90l0CkzsHmIyMAvQnGCnkeq6jt8Yme1o5XQJCv2W/2yRGGTgDq+deQYs3E5HlZ5uqWejdro3C4k0cNYNuDsSH/IQqTktrylJt8HJ0ReYOSe1u5SmSuVGuouFP6Xb92PxywBwslPDwDLp2K0IJjAYLzKP0kwrg1bLpjm+rTQR3LaMsIB7wgvSq+NQPCWu8Pv2jtKP4fbSOsgL8+iFVTUxeyrA6Kwro1phjNkNUgT6EcAvcLQ1rHbdpr2UR5XmzfMe1mmQth8jBbCxK20MMBkHFJGGnuQT3KrOPG13MpD01258vGQVbHw8eBr4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gw2w6BJL6KcQ0ikVAlb5sou0Hf1qviJ3JlTLvaJdQt8=;
 b=OnIvQiHhcT9oXK5fj1cQYUb9SIuPH6vKjvmfAejCXebo3gfHH6tRisNwV+X2R/ChUJXuJoIfUJ7s+K2nR6PHQpn1yaoTcWknSDC/E9WjKyBKAP/iPQyn7JFp07+OoWHhlYNTa6sCT3CaSEnXp9TXrwTJNt/B6DXIuoLlaAPFLkHzesuqjMJ7HX1lPXPY71sV93GPVfdjwksfsZoJvrmQR/mEvszLgVJe/XO/DVknROnpJfPqcWXvdxZRtxHIk8FHPmxgIMzO4Yr7voDwSMBrGAWX4gv7uscpf9IywpjGZvOdwERjr+29DjTynGRd5c5QlI+2Aw+y0JwMyWLGZvo9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw2w6BJL6KcQ0ikVAlb5sou0Hf1qviJ3JlTLvaJdQt8=;
 b=RpJ9V+UMlBJjkPmu7iFrbzNjdCJrgADjbpCyW3WMef1SdV5r0ra69IqLQSOmAv7kg7OkfZgM0n2AA8hHPyeTx3GomAMV5dDM/9VCnm+N/FsqTiJ+L4rUZNBCXYQ1Waa0RKGN4SoUu28ccuA0oMdIZQ2Ls6c1nqDGQmr65V1vYS8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 17/37] xen/x86: use CONFIG_NUMA to gate numa_scan_nodes
Date: Thu, 23 Sep 2021 20:02:16 +0800
Message-ID: <20210923120236.3692135-18-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17f098ad-3726-48cd-6724-08d97e8a49cc
X-MS-TrafficTypeDiagnostic: PR2PR08MB4732:|DB9PR08MB6586:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB658600A5557235C5AFBB2BE29EA39@DB9PR08MB6586.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 c79r8fl9QOgjUlIj0mZwd76tk/WxM3P4kH2L9gF8vHcSV+3S/AkYfmF+PrDM3FE5sgYCwNAD6jrTUrN49Sgds/tJdF1FF/JaNYP1hw75PPTcDYr2iezAcWp3qtxPx9ZalPe5U5FQnA2N0j6zigcicJ4GISw1RCh07+xfEn1xyCCb7TwZ33Gi0wX/U58LLCZ2shEMJbtPkORa5KKSFyft8QTMbgxjwIcVukIyalR5T1EPnyUSbXqeZPs8MaHVs/pgcgj2E9MBO6LJS8eA5QIjKacj9QZj56o8EFITjaFXF8jYH3dVY4Q22jUyohRImAlhYyXi2a7oBKkh4+hPAO2Z5O2JMjS9ImW5daMum34e/NFPVwxFa/8cKbXgbIfh7MRms4RlFmiIaCUqvegdDUh+mAbpfEbMRypb2eE/8Z/8srwM1bRfH2L6Oau81Eu4GLUITE9Kq3hkB7eFTm26bVnTk+lD+AQa8YWwOi5CIQOfa+MsyRwEHY9zK6eqzcKHdhRd4/ERmmvoHjwiNVkLlqfiQI3s3q6EBfUCDNM5TKU8mkwHSyopFv/p5sXXum33O7z9Bs3Z4gwd847mQLtcwlD86wKSaR+eNSb8lM1eOXmVXwZQwi1I0GllRB5xMy5/MWYBI4+XyxVggIOyzJf08jPhdSnm8jR7K4coS7bFgWdk9TaeYo68casj/9zOhjyYAhPAG9TS8lBspTWwN4i0Gu+CPnck9+8fNF5oVn6uzcN27eU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(8936002)(47076005)(316002)(6666004)(82310400003)(70206006)(356005)(36860700001)(36756003)(5660300002)(86362001)(26005)(4326008)(508600001)(186003)(2906002)(2616005)(1076003)(44832011)(336012)(426003)(81166007)(110136005)(7696005)(8676002)(83380400001)(4744005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4732
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db5b9d9a-8ce0-4c2e-586e-08d97e8a4142
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/b2iDMfuLcLCpVegkCQ0u/q7s5jiZ4c77YbMM9QDXVPF5ghVtm7lDnvhADPsRionksnFl5rwYuroGK0XB7EexXsa6bh8ypkWIMdHM1/gIPo+LbIHWplx89Wlfmk5qL9XwWLoRl0V3AtoSy2/xem9CvpdrZZzrxHup5HqINf59a20gNOy4QiB2XlF0rX486OjZCoClgbHgzJ+zPchY+v7N6igA9iCFb6lusHpEZ0bwOHcQV6HjhX/h1yPZsm8EmQwj9/AiymflgeS8aGZ5G3zdj5Kb/P7EpClOJ7n5Kl1pw2SCG0c5q7B3+QZimSwJl4h1EMDgUfHNKTlhx/cRtSO+O5FSgll8dbkK4cuLhNaFsAXizhD9dNx7PrasbF3F8B3OpaxJVyYhbJd5BcJ+sZD8C5wzUzrO+Xn1UqlsWjO6NVWZNHkgnzBpiJC+XCYk/75DQ8dahS8z9f+hwbi+9pSIfPWw8HCpVhorMoXiK8XSUV1AJDaH4U4JcjZ2v1P0TamLQCAA5x7IVESCRWcNiZFNWMHnqG/aLV/KgcU8nvHvgnXbxfySSX8GwjXgCN0KypSNtfyBS+AW+/Z9faed4ozGKdNFWb3gWk90WYQN7eNfCf3GW6PpzzfIZ6RFf9IXrS2JdUHUw5mrVg+Ngb+wuVrZN41yBYGF4kNQWES/2/CLmPOnzgsLLhBmweLdXic0/WT98kWn9hY3AkKOXK3VHmiQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(6666004)(2906002)(8936002)(70206006)(110136005)(83380400001)(4326008)(82310400003)(4744005)(44832011)(5660300002)(81166007)(316002)(8676002)(508600001)(36756003)(1076003)(7696005)(26005)(186003)(426003)(86362001)(2616005)(336012)(47076005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:25.8275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f098ad-3726-48cd-6724-08d97e8a49cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6586

As we have turned numa_scan_nodes to neutral function. If we
still use CONFIG_ACPI_NUMA in numa_initmem_init to gate
numa_scan_nodes that doesn't make sense. As CONFIG_ACPI_NUMA
will be selected by CONFIG_NUMA for x86. So in this patch,
we replace CONFIG_ACPI_NUMA by CONFIG_NUMA.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 8a4710df39..509d2738c0 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -260,7 +260,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     start = pfn_to_paddr(start_pfn);
     end = pfn_to_paddr(end_pfn);
 
-#ifdef CONFIG_ACPI_NUMA
+#ifdef CONFIG_NUMA
     if ( !numa_off && !numa_scan_nodes(start, end) )
         return;
 #endif
-- 
2.25.1


