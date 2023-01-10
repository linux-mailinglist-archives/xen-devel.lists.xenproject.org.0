Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C7663BF3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474482.735755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPj-0004Ma-TY; Tue, 10 Jan 2023 08:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474482.735755; Tue, 10 Jan 2023 08:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPj-0004Gc-OP; Tue, 10 Jan 2023 08:55:23 +0000
Received: by outflank-mailman (input) for mailman id 474482;
 Tue, 10 Jan 2023 08:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAP7-0005s6-5R
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:45 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2070.outbound.protection.outlook.com [40.107.103.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c85df74-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:43 +0100 (CET)
Received: from DB7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:10:52::19)
 by DB4PR08MB9864.eurprd08.prod.outlook.com (2603:10a6:10:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:40 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::2a) by DB7PR02CA0006.outlook.office365.com
 (2603:10a6:10:52::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:40 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 10 Jan 2023 08:54:39 +0000
Received: from b094e260e48b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D2E68E8-747C-4449-9205-D2B044856754.1; 
 Tue, 10 Jan 2023 08:54:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b094e260e48b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:34 +0000
Received: from AS8P189CA0042.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::12)
 by DU0PR08MB7638.eurprd08.prod.outlook.com (2603:10a6:10:31f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:31 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:458:cafe::af) by AS8P189CA0042.outlook.office365.com
 (2603:10a6:20b:458::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:31 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:31 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:29 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:28 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:26 +0000
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
X-Inumbo-ID: 6c85df74-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9xXZMbekjt/tql+kzQOe7eglF3L9li7hx3d+MOMfTs=;
 b=wStOQAtR9wr3xfjETfijXVkPoK6EjofHsjwj4GezKJ4hg3PfSwYIPFKFpA8QuZPm14Fa4ucszy2WmkJLHSnnBYKiKfiXsElSDF7OedleAmuwx4I8cADpSZod4MK5deiRnIWknCNiWiq7qfNnlhSWXgvtbo1QHzaRrtCZKYInBn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f436cb93478cc52
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cENsEWAd+moxKaD55/XfUjNcxkB3d0km+dUiiyBnjidvB9M2rKkXh6BORZaYgRq0+3e+d9IPlSUe0PexA2S0XB6qBM9wSloOYN/WVO0y00VEPRv/6VOLFPCybf0xZSI1CwSg3wSBrKmx9hRoOWSaXHB4HnRsWivFmeIFXq/zXUrUk6w52+WzSC39xZA3DwoATN/cKIsSfk4RBsufhhXYiGw+7RXauP4Dtl2HLzu5agewHRtVwmLzEv41JfkddPWVcgFPWAgUmtpwobTDao1K3g41rIF3OpOPmMyIT2MaODJ1cqjFi7SEqUVY8G7HNYeEs1X6WyPJYgNDkPk2e64dfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9xXZMbekjt/tql+kzQOe7eglF3L9li7hx3d+MOMfTs=;
 b=GA35AQ0XgoLhZ3XdZD0y4jXu5wM4OddFCtVmlluTg9AwFPoIc3suuBCgGAYI4HjbOj6AG1VVazA/B2ofGNXXIHCFKD6SkE55pzZqPORysHZAqCgDmNfn6QrjDJE40ZqUNxFS77KSfgb9miy1UmTfYpkTKZkuSbfsP0RLLGMBT0CpodehwuDS/fyBbGQHCaBDLrD1UTNHhWCtY1tz9L8xGcJAFY4LZDgcoqiv5j5o7VvkoF9zpfUELqkfYEaEnt8mho6pywNVF3w3zJwne83lRf5hyR8ffKONPRFebEfj2bNL+rGeNffh17N1AxyQ1VzRpHzWpR1j0eOT2TLvsmbCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9xXZMbekjt/tql+kzQOe7eglF3L9li7hx3d+MOMfTs=;
 b=wStOQAtR9wr3xfjETfijXVkPoK6EjofHsjwj4GezKJ4hg3PfSwYIPFKFpA8QuZPm14Fa4ucszy2WmkJLHSnnBYKiKfiXsElSDF7OedleAmuwx4I8cADpSZod4MK5deiRnIWknCNiWiq7qfNnlhSWXgvtbo1QHzaRrtCZKYInBn0=
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
Subject: [PATCH v2 16/17] xen/arm: Provide Kconfig options for Arm to enable NUMA
Date: Tue, 10 Jan 2023 16:49:29 +0800
Message-ID: <20230110084930.1095203-17-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT052:EE_|DU0PR08MB7638:EE_|DBAEUR03FT032:EE_|DB4PR08MB9864:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f9161b-9e2a-4ef4-bbd3-08daf2e84f2b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ai2Nn49kHTWarRWtw0dy8bx2KRkaTSdeT2IEQHS6UjuznaMHQ5V+eNZqKeMGTFZhM2Dw2wWx3YmhADU92G3I/bg/9lEnJdubKjUjC8awrnVsZMKE2YmwBKeyKyx5iBuGJfTXWym79bGIkvWaSJZ3c8bburSI5SKXbpXNzth4NdMNSEq/vWnJDAOpN83FygPao93MBwpyplt+W3mrZQZaine+yu5a2iEDz1Ai2/QKBV+E7bmwEa38C+YGMWLs+TNTk4zqoyIVENWLwT/spNYA/tzzgc+rYdD0StLQgJDb1rpyh8BxA0In+WsfG0RktEkqF+jMbhflFczUphUekj3gwskhctfDnr4kfIRrqaTtB/Utro09kxKve44ZynoMLFMdhIcPErnEcrfwwvvU/vJ90FaPZNTfF/h1G0r3gU3NVkuCQmQXB0diCc7f+VEFDwhJCoE+RqHMbjwMLGNAIYBMiMiWGtFB8q3gKtahxW3+F5lP+Kj7U/ajs9lYwxChjScg4lOIMtbfSuetyfO4VpGmR+SgmT/v0e2EHxMR2wcCq6IN5nLfCvMX+uOQ/lrdlQ4/HScm31NfJxHHOwuMO2pl10LnLwJH3Y4Z3aCmWzkxVbKCK6LVo5GahWXuRbRqOB4ss79GX1GegkyjpLhD7TktJiSoR+wWeinFIa8usJN/XwMntY1jYODJaw0/HW6dbuuJamm8Be4/gtuoJWwgsaGYHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(2906002)(44832011)(36860700001)(2616005)(5660300002)(7696005)(41300700001)(8936002)(36756003)(70586007)(70206006)(83380400001)(8676002)(356005)(4326008)(316002)(47076005)(86362001)(336012)(82310400005)(1076003)(426003)(40480700001)(26005)(81166007)(478600001)(186003)(54906003)(6916009)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7638
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7767b79c-f5eb-4540-bbee-08daf2e84a03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V0m2pag9oMWbbSsjJbj1ryiPS2w1nNx8mcKAKATcBt6/8yU3xIZ/cHjNvtcKniHUiLU4V3w+Vl8ICyOqcIVtQJNEkTBtQBaPdeut62oB4ZGA+84jjC80sk1i/hd2CcbCK88TEJtjgk4p1RcIUdr3cg0IwtT1U156W6YHZjz9gtL5FqW35Ew5ELgTOVD2mv8chzbDfeopJf6xxyT8G5DKmevLakKW1sCFakFfHK24wnUsC3tS7xdV6I/x/fD8c5T2uMo8OSqql+oYA1pIraUVA3BLzTgmFgorhbVbuUyJYqB3tB4CRpcOu2l28xBlSMwj0DcKHqDCUmCL+ZLGZ3vmqGwbeSyTl9qVH1FwohP+oCoO0O96Re4c8uVHantGHeXTCmKV/7d4YayOLyQm0zED/MST3sgeYj/3LtKQ1b/D0GH68jlAXCd7UBviRTLyeXU+BhhEJIDA0JPLDnEqwQUky+KLH7fQiKlkaURHkFl3Yk+iuWib5cQn6i1dr82Yll9iYYrjUdvCNgt5owEWkV9M9ZrymE3bkJGlZ2VwLuPCGHhU7frJHqo1g/4HKRG/uPWNzlCKYsM9D6q+GHb6i2DKEIiEDG7v5b4NPXAEm4CSOOxLUjnsJsyeaeDmymb/NpvbpyFMrQuNjDlQ4oVK0QD8aipSBe7DnunJlns6k/9i3nzMkzgqXN2SuRcQjSgpN7zUBu0JG3rRxNtgI9EjNcZdsw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(107886003)(47076005)(70206006)(36860700001)(1076003)(70586007)(8676002)(82740400003)(41300700001)(86362001)(426003)(4326008)(336012)(2616005)(81166007)(478600001)(40460700003)(5660300002)(40480700001)(316002)(44832011)(6916009)(26005)(186003)(7696005)(2906002)(54906003)(36756003)(83380400001)(82310400005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:40.0790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f9161b-9e2a-4ef4-bbd3-08daf2e84f2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9864

Arm platforms support both ACPI and device tree. We don't
want users to select device tree NUMA or ACPI NUMA manually.
We hope users can just enable NUMA for Arm, and device tree
NUMA and ACPI NUMA can be selected depends on device tree
feature and ACPI feature status automatically. In this case,
these two kinds of NUMA support code can be co-exist in one
Xen binary. Xen can check feature flags to decide using
device tree or ACPI as NUMA based firmware.

So in this patch, we introduce a generic option:
CONFIG_ARM_NUMA for users to enable NUMA for Arm.
And one CONFIG_DEVICE_TREE_NUMA option for ARM_NUMA
to select when HAS_DEVICE_TREE option is enabled.
Once when ACPI NUMA for Arm is supported, ACPI_NUMA
can be selected here too.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Remove the condition of selecting DEVICE_TREE_NUMA.
---
 xen/arch/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..e751ad50d1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -39,6 +39,17 @@ config ACPI
 config ARM_EFI
 	bool
 
+config ARM_NUMA
+	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HAS_DEVICE_TREE
+	select DEVICE_TREE_NUMA
+	help
+	  Enable Non-Uniform Memory Access (NUMA) for Arm architecutres
+
+config DEVICE_TREE_NUMA
+	bool
+	select NUMA
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
-- 
2.25.1


