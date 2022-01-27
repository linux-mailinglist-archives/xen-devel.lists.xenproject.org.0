Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5549DBED
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261216.452062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYU-0000uS-C7; Thu, 27 Jan 2022 07:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261216.452062; Thu, 27 Jan 2022 07:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYU-0000s7-7S; Thu, 27 Jan 2022 07:50:54 +0000
Received: by outflank-mailman (input) for mailman id 261216;
 Thu, 27 Jan 2022 07:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYR-0000Xj-VT
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:50:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bb539b-7f45-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 08:50:50 +0100 (CET)
Received: from DB6PR0301CA0075.eurprd03.prod.outlook.com (2603:10a6:6:30::22)
 by AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:41 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::a6) by DB6PR0301CA0075.outlook.office365.com
 (2603:10a6:6:30::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:41 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 27 Jan 2022 07:50:41 +0000
Received: from 47971b1d2ff1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CEEA1370-56B6-42BE-9901-F134C1CDAB0D.1; 
 Thu, 27 Jan 2022 07:50:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47971b1d2ff1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:34 +0000
Received: from AS8PR04CA0106.eurprd04.prod.outlook.com (2603:10a6:20b:31e::21)
 by AM0PR08MB4961.eurprd08.prod.outlook.com (2603:10a6:208:161::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:31 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::55) by AS8PR04CA0106.outlook.office365.com
 (2603:10a6:20b:31e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:31 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:29 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:27 +0000
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
X-Inumbo-ID: d8bb539b-7f45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJY+Z8v2F+OrilDf0c+mywrBc7V7NbAWQsU/sTzRiWQ=;
 b=YOWaLxK2hRMsjcThyNKtsOXrILT4Gu3QkZrllp7XvKCBYQgatpTiAV/dKOT2Igbm3BkQKYYjtKr6lPWJtok7y6JpM0GqYp1FJIlQPlaZEAthvQ5e0J5IzC5Jh+rDzlk/Aqg6eD24p7u0f0a8ztwIIWPsY9zxUjZu3oI24EMRewM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9646bc275f6d35e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2JVR5LaimGOCi2GUq7jN8EW7Q4qMPrcVvb+Kha9qlw4JLBUyN/HvL1H/XgtQafi5cUdpbtXBC0fE6dXYDpLegCO18kja416hUrhLMD3XULATn9Mm7DSQucqayNNAdXo2Fap+W+/dnBormPm/GvP83vs6H4sN4+GF0HEPWf9JWefj5BaXDDpjiEyKook6HLIPz+Qlfoyyyc+3XU62kx4kpiUwPIIDp5rawJXUg9pt+PpA2xdDghkUWNTT1r4Lh2GRhG2EFb2LagLXM0l4BH+j8MM7UE96Kaei7F4hEN4+djHBekvUaEWSNA8fYwdaOPTImfDhVon1pUr1QdVx4phhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJY+Z8v2F+OrilDf0c+mywrBc7V7NbAWQsU/sTzRiWQ=;
 b=P2oxIwm9La25o3IPrp2gu7NVmOig1zBDJCUvZ8/GU5FJ6z/llktjJO38z1lFCUv0OhmXkMZHmr8Uu/9HuoLvVSBlkBlcqhSzFtdAvRiNfoM6AL+zA3L5TP3OSdDdODjJyJ0ViA9xAtdHe1A0OjyMjmYNRq4hwScPqLRoRzxg2b0FE0Q8Xj4CfWx/bnBYXs4SN7XAYDcFRSk/qpQ1n5jcRYBgrpzPkrzv3vY0uhezxmS0nLxDxHsZpMpdF1w3CUdew1b3r7ufRqZfzrLjrXVBSyCZRb3D/jT+TilyYvLdQDoqUuZZuAEfrENU6JwV3M9DTS4wrUcki1b2FTcoq1Rv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJY+Z8v2F+OrilDf0c+mywrBc7V7NbAWQsU/sTzRiWQ=;
 b=YOWaLxK2hRMsjcThyNKtsOXrILT4Gu3QkZrllp7XvKCBYQgatpTiAV/dKOT2Igbm3BkQKYYjtKr6lPWJtok7y6JpM0GqYp1FJIlQPlaZEAthvQ5e0J5IzC5Jh+rDzlk/Aqg6eD24p7u0f0a8ztwIIWPsY9zxUjZu3oI24EMRewM=
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
Subject: [PATCH v5 02/11] xen: introduce CDF_directmap
Date: Thu, 27 Jan 2022 07:49:20 +0000
Message-ID: <20220127074929.502885-3-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 2034215e-60a6-408e-8712-08d9e169b72c
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB4961:EE_|DB5EUR03FT016:EE_|AM9PR08MB6820:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6820BD49DEED433E0B032978F7219@AM9PR08MB6820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:213;OLM:213;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S6ty7VA1WgAomn9VI6LOvP5W71fC7dsKo5l/EfKkbNHg3xoI6xd/PVrB0UlfZKmLRoSv5hoX9Elzp21YE85Bg1OwtXtzCLgBLHGG5bwGFeA/BHaZ63W3h/xUQB9+ZBXagoGa+Q5ywTf1JKsSOBf2nRpO0s3ephuAS1vle9/OrCUWPqFTeV1c3Muq6CrsK6c1hj8hXrXakCy5jupynevU4Dnz8nZJZ8Lo3dAG9i47S8YeL/JJwz/b+HQj2H5IaOij+llUHY8d77dEKAHsLZEa+9dssgLHKpSOT+ttJ+cFUrkwRmSG4moVyNTiwY2ylkxFQk/bqf6LqGBBjxSTIrzmHK7YkXljluW6PsDKXEGgM38OdUfvqH6CN1SCtZloXkXSO3dE4FBRse2CY6ptyuiZnyDSS+nJ9x9dWaqt/vjHkojrSEzeSNIe8YDGr8tLoHUHam5H1amtpNrNMd5mVwNyQV7W41ks0vqrMYsBSZA3qfWEUsVJ79KeSy0dS7Q94BWvDU+TfhZnUXc0qAatw+VdYKvPqyHxCX8rf5V0oKEeB4W9+YxEoafTftgyUU3b/W9FbJHQn3TcRIbbdMZLHJ4F2njaq9azluURPaDFLn17sFlwlVw/FvfFWJ6kd4ejLqZ67fCYAupWaEpirdrvKWrRGTSF2xVHpNP6QktawcOtDuapl9cIWgqsori1Cp8r1L1WYR7besOi9bVvt16qDE3Sw81iLh2WYagD4achjasU7rI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(36756003)(6666004)(336012)(426003)(70586007)(70206006)(8676002)(4326008)(8936002)(5660300002)(7696005)(508600001)(110136005)(86362001)(316002)(54906003)(40460700003)(81166007)(44832011)(356005)(2906002)(2616005)(26005)(47076005)(1076003)(186003)(82310400004)(83380400001)(36860700001)(21314003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4961
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c93fe7fd-476d-4415-fedb-08d9e169b14c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QsrKD67OpbVVNwqUmpgToM95YkJIxhUNlatGnbUqWkFCl0IM0cMhiuMDU8yRFIu0MiQyOkotdKSRk7MjzhoES1dzsDSTtmFU8rqa/NfXu7Qc3sg6mPXLwh6Xh4/dKZrVNavfp7I4b+j5DOFEl5pUWyvABMWBPF9me2XT8cpqpr8kfxrapTVFZqiBR5hl3CWg6nsGGTk4IUPDbq5sqZvYMUnrhlVH3QUZ7dHYAR5S1j0rhhXJLpQy6O5EY379RzZXOQ7DpIcDL+KhK5oa26gHpF8JgJFV7tMdbJVDW/bKANTIKnNxz/Fhde+GTphCwWSlw6Sm6hRSAYkXUofFutU89n39gWqYbxhD2J5PlTrUc/WdY/XaX5S+1BNvOmv4UC93aQG2yrF7u7XF1sYPAAIRIjc2QyaTf4snBsMZucIXbRFX6UZdlZEq6hgQLEGkCukqcNkrdR9ClU337UKFiXH2P2f6IzlcXNczaLM2KZWwqLxPdJIeSVwM6fs7O+cdrlRaAupvB6KIYRGU8s/CJ5jTdKrgxhTqrnn/Qc+O4CwrZfdeL9p87DsKRzzs3o5cglUIvoqJD86W0U4FCOUAtcqP7qu6yE9GJamrguPtNPq3Rb6RNsrmx+0FCgatN5zrCJlQafU61z4PKs+LNwwXJYd8lDWvHNSwLVKeEK2pGJE/rTiHNCpYGouRAsm83tLrnuBN5tFO3UjiJUfxIkqCLA2bPA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(83380400001)(86362001)(426003)(5660300002)(2906002)(36756003)(6666004)(47076005)(336012)(54906003)(110136005)(7696005)(40460700003)(8936002)(26005)(316002)(36860700001)(508600001)(1076003)(4326008)(8676002)(186003)(44832011)(70206006)(81166007)(2616005)(82310400004)(70586007)(21314003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:41.0600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2034215e-60a6-408e-8712-08d9e169b72c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6820

From: Stefano Stabellini <sstabellini@kernel.org>

This commit introduces a new arm-specific flag CDF_directmap to specify
that a domain should have its memory direct-map(guest physical address
== physical address) at domain creation.

Also, add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.

For now, direct-map is only available when statically allocated memory is
used for the domain, that is, "xen,static-mem" must be also defined in the
domain configuration.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
CC: andrew.cooper3@citrix.com
CC: jbeulich@suse.com
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
---
v2 changes
- remove the introduce of internal flag
- remove flag direct_map since we already store this flag in d->options
- Refine is_domain_direct_mapped to check whether the flag
XEN_DOMCTL_CDF_directmap is set
- reword "1:1 direct-map" to just "direct-map"
---
v3 changes
- move flag back to xen/include/xen/domain.h, to let it be only available for
domain created by XEN.
- name it with extra "INTERNAL" and add comments to warn developers not
to accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag.
- reject this flag in x86'es arch_sanitise_domain_config()
---
v4 changes
- introduce new internal flag CDF_directmap
- add a directmap flag under struct arch_domain and use it to
reimplement is_domain_direct_mapped.
- expand arch_domain_create to include internal-only parameter "const unsigned
int flags"
---
v5 changes
- remove const constraint
- strict "static allocation" check
---
 docs/misc/arm/device-tree/booting.txt |  6 ++++++
 xen/arch/arm/domain.c                 |  5 ++++-
 xen/arch/arm/domain_build.c           | 14 ++++++++++++--
 xen/arch/arm/include/asm/domain.h     |  5 +++--
 xen/arch/x86/domain.c                 |  3 ++-
 xen/common/domain.c                   |  2 +-
 xen/include/xen/domain.h              |  5 ++++-
 7 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 71895663a4..a94125394e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -182,6 +182,12 @@ with the following properties:
     Both #address-cells and #size-cells need to be specified because
     both sub-nodes (described shortly) have reg properties.
 
+- direct-map
+
+    Only available when statically allocated memory is used for the domain.
+    An empty property to request the memory of the domain to be
+    direct-map (guest physical address == physical address).
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 92a6c509e5..8110c1df86 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -692,7 +692,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
 {
     int rc, count = 0;
 
@@ -708,6 +709,8 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+    d->arch.directmap = flags & CDF_directmap;
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0fab8604de..6467e8ee32 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3029,10 +3029,20 @@ void __init create_domUs(void)
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
         };
+        unsigned int flags = 0U;
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
+                panic("direct-map is not valid for domain %s without static allocation.\n",
+                      dt_node_name(node));
+
+            flags |= CDF_directmap;
+        }
+
         if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
@@ -3058,7 +3068,7 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, 0);
+        d = domain_create(++max_init_domid, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
@@ -3160,7 +3170,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, CDF_privileged);
+    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 9b3647587a..cb37ce89ec 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,8 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-/* The hardware domain has always its memory direct mapped. */
-#define is_domain_direct_mapped(d) is_hardware_domain(d)
+#define is_domain_direct_mapped(d) (d->arch.directmap)
 
 struct vtimer {
     struct vcpu *v;
@@ -89,6 +88,8 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+    bool directmap;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..9835f90ea0 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -722,7 +722,8 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 }
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config)
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
 {
     bool paging_initialised = false;
     uint32_t emflags;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index a79103e04a..3742322d22 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -659,7 +659,7 @@ struct domain *domain_create(domid_t domid,
         radix_tree_init(&d->pirq_tree);
     }
 
-    if ( (err = arch_domain_create(d, config)) != 0 )
+    if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index cfb0b47f13..3a2371d715 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -31,6 +31,8 @@ void arch_get_domain_info(const struct domain *d,
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
+/* Should domain memory be directly mapped? */
+#define CDF_directmap            (1U << 1)
 
 /*
  * Arch-specifics.
@@ -65,7 +67,8 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
 void unmap_vcpu_info(struct vcpu *v);
 
 int arch_domain_create(struct domain *d,
-                       struct xen_domctl_createdomain *config);
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags);
 
 void arch_domain_destroy(struct domain *d);
 
-- 
2.25.1


