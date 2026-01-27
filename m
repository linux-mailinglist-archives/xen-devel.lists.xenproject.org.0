Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAg4Fo+7eGm0sgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:20:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44D794CDA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:20:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214678.1524898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkizA-0000g7-Pb; Tue, 27 Jan 2026 13:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214678.1524898; Tue, 27 Jan 2026 13:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkizA-0000dS-Mi; Tue, 27 Jan 2026 13:20:00 +0000
Received: by outflank-mailman (input) for mailman id 1214678;
 Tue, 27 Jan 2026 13:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2xL=AA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vkiz9-0000dF-AC
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:19:59 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df3737a4-fb82-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 14:19:56 +0100 (CET)
Received: from BL1P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::32)
 by BN5PR12MB9538.namprd12.prod.outlook.com (2603:10b6:408:2ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 13:19:51 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::57) by BL1P223CA0027.outlook.office365.com
 (2603:10b6:208:2c4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 13:19:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 13:19:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 27 Jan
 2026 07:19:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Jan
 2026 07:19:48 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 27 Jan 2026 05:19:47 -0800
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
X-Inumbo-ID: df3737a4-fb82-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/dcQR3xPNl2SQnY9cZtwcW8R6adoujrN2r2Xwa7CGL7s3f2qnULS9mEQXMSXMgvB30ytULevJVoHOdMNIyp7AMc91QEJrVCKogGE9FsyU2cgeILnmlgNrM/uIZCl15HfvamNIMU0W7NKV1gviEwX1uImZft5JktxiG6gZk+MOACe0D7dnQf68sE22BhUe2jg6v2/XQgBwzygYsgNuEf6rSF2gwPtGnPzrlKMqpcYBTF5FuKcR5aH0ypVct09jQ5D6NsZF9w0LOAkjdQbXGSGQufGwqabqxcMrtnxvlktpkeotd2bJN/DwUN/38aEU1EjaRXL2rrVJvm68U95lGSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaIsxxWRLcvfB20XUOxZMeT9cZZ9OS8RfHLzK351v44=;
 b=IwjOO92dT0svT1548kWoBuE1/bk6ynlZFMmsxEzQYE4n/YLemISGTIjwjj9rcnYOA9Z7LbaeMZk/OA282NsWNkX3O/mnn1jw2H/F04QgIcgyeB+reRv3LENnDK//afboZAAeqASO7Fyy9DKeeAsoxFSraXIgIr3TUngZa3IIYRY9/EDznFd7cUlNhtnG20Rfi009wU4Cy1rwtU9GxVrfN2AVcJ5TGFosquv/twCODuawSt5oy6xwN3NASl4WgwFDKmbWuQtYfk19AjfwePyF3BczrlKf95JFx9E9KpfCdBmwKkEqxJRWFfESlL/z5vXkB3KWyV8be5Ahyfg7nQktYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaIsxxWRLcvfB20XUOxZMeT9cZZ9OS8RfHLzK351v44=;
 b=bAtIC+BPQRHtwS4wdlqoPH/BVfJ4s/+fXMbHnMg1SbH+TN7wVA6j0+OVo9gvd/uL+X4v0xpuh0Du6CMwinxAs9K9YUEjrd/TLxghnc5zG2oqJMzslz1maHDOdwhmdKr7TbACQcw5VoukWELAzyeVhful8nODMXZD/qXe94h0OJo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/arm: Kconfig: Fix XEN_START_ADDRESS input prompt
Date: Tue, 27 Jan 2026 14:19:22 +0100
Message-ID: <20260127131923.123294-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|BN5PR12MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 12317d5c-b6df-4554-fa54-08de5da6bfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Igbo4Z4/TwxJamaiwfspGIN7r/POjUU9rAfO8JOpl8ApbDzY/bp57Hn8ThMX?=
 =?us-ascii?Q?KVijG08Mb8SmyDcujqJzXWmROSD2qzluM7C8WsQ8kvbvfGGt9HKbVgnlDUUO?=
 =?us-ascii?Q?gMw309ZVuVd4r4dk4rjJs+6u3uec1v1gW8kxOsjvGeu9TTES3tvRGrHTUdrQ?=
 =?us-ascii?Q?+HCRFeKU/3jRMeqg4hIZV/Dhfgchzar/ZAYUIeTzhFIHAYZJKYOtPlFM5Gc/?=
 =?us-ascii?Q?Cz5VI7OfG05wJLdr/1dRPE7BCOFnNat6lMptmIvfFnN54LiW79cJ1/CB2Gxc?=
 =?us-ascii?Q?OGwXQM3u/qDidig2RxtqvX6lb6tZFQcWrFyCNppqgB3HAu7KDF68/c2UfwpJ?=
 =?us-ascii?Q?PA3u2us+qXJTAP4VNRlMyjxndpkpU0bKst/A5ehfTSzyY2+lkpGvowAF/6EM?=
 =?us-ascii?Q?0Qx98AWlvYLYyeYdIIORJybIobirC9NGQBt5QztY0GhyJi4c83e7BOttdqtu?=
 =?us-ascii?Q?zlnNkM3E9fqWMueCQuGy+TXBy775sYXE4J6JRryc+BSeY9o/lpT9OEYYvBRr?=
 =?us-ascii?Q?hmwzZZ6sQtJiyjhaRirVWBfFEGkFcUymFkziwKteltRst8it6XxUfT89tmIy?=
 =?us-ascii?Q?MzE1Pr5hz55WGLZejU8l5ckS4/duo3GDZpwRQFeuJiR9yxxAE0iSpyRJCLqg?=
 =?us-ascii?Q?uJRrXyp8NRPmDOFT37fxCiTlpdag1kYhH+TkjGgRTIhWT4EtAdmG8y0j/TDB?=
 =?us-ascii?Q?XSeNKdIvC2yeSXRks6ddhWMEh6uj1KzH32tS4mn9nUCx/8Wm29WHNUWOvlcd?=
 =?us-ascii?Q?D4B1roAfHwugaGDhlJhrFbdnmB5fLk59kUvKoVc0Myci0D7OZxHZ+lwGIb9A?=
 =?us-ascii?Q?2VFjOO6GC+fFcfRvBTgJdhJ2dg+tQGhgpvLEsEOcRKxbSX6q8gsV4ZmCepK7?=
 =?us-ascii?Q?wVmjcMKU/1GrOM4BSIi++YDdnto3aZdKa34RkRztEsiBVUrLuapJCrp7MCCY?=
 =?us-ascii?Q?AGyTQVwiVjeHcNUR0lF+MLm/B7mKZ/epIxyDhzP7LJK/YnQyf593HHOrNBsO?=
 =?us-ascii?Q?5j+Y0DnNu4cl+ZQNliTuvqVshWZaIJg4+7wPt90qXHns7ldNC5eYIn1fip5/?=
 =?us-ascii?Q?4TyOC9G29Y0B+VtcvKDLO3ZEo5jpVXBiwIRDn8eZz4k8ubQrPm5Upku4bFHq?=
 =?us-ascii?Q?FtlteskNmDCDmzkmDGpH+eZxjYqpD/MnbAm/M6AXXy1w6qEUf1490imDdoaG?=
 =?us-ascii?Q?WyW/5ZgQ8kcS8ddfH0mDvvHJoMRNe1ODR7o3/EJzfJxWGK14seg0vQXVMoEt?=
 =?us-ascii?Q?+JnQCeoh064pr2j8EvhvuZ7JYLEVwHdynS1nTi4/4dywS14txdBH3Wk67XJX?=
 =?us-ascii?Q?MqXfKzltGB3iXaDNMaSqb6Qj/mJ5wXg6tsfHHnINGbUujx3V0nYuFO3wH9xp?=
 =?us-ascii?Q?1y5eXXaKPg0HoIos8CHCjtSR0BycvlSX2wYpaxjiOg5Y0zf/mCtJOojeUGy4?=
 =?us-ascii?Q?aMFedGNVBABEZueZ7SAHpd0BhpiqHTZpSGfIuEsHxmI8u5GK8ZqIqzZ3qK7N?=
 =?us-ascii?Q?sL9o6XKQlQWcDLOjNwLOy+SjRXfhGBV1qJ40iuw382SbvZ2GjaqeUGYojlhf?=
 =?us-ascii?Q?JGPylcJqv6rrPXXdiiQ4QcJ0Z35uL9LMKIZa7t4npldLpPntdlN2lJIbGYaU?=
 =?us-ascii?Q?emLnx2AevDUK7BIdASRzWIrLRPmU8hkqLmCzApfIF3k1w5iFrM/NPdkli1Sm?=
 =?us-ascii?Q?MMqndg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:19:49.5201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12317d5c-b6df-4554-fa54-08de5da6bfb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9538
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: C44D794CDA
X-Rspamd-Action: no action

Remove the part about platform defined address which is not true. The
help text is correct i.e. 0xFFFFFFFF is used as default value to indicate
that user has not customized this address.

Amends: d736b6eb451b ("xen/arm: mpu: Define Xen start address for MPU systems")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 442d353b4343..2f2b501fdac4 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -28,7 +28,7 @@ config ARCH_DEFCONFIG
 	default "arch/arm/configs/arm64_defconfig" if ARM_64
 
 config XEN_START_ADDRESS
-	hex "Xen start address: keep default to use platform defined address"
+	hex "Xen start address"
 	default 0xFFFFFFFF
 	depends on MPU
 	help
-- 
2.43.0


