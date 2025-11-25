Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87079C84DD5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 13:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171878.1496939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNrlS-0000P9-Fe; Tue, 25 Nov 2025 12:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171878.1496939; Tue, 25 Nov 2025 12:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNrlS-0000N7-D6; Tue, 25 Nov 2025 12:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1171878;
 Tue, 25 Nov 2025 12:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQaz=6B=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vNrlR-0000N1-HZ
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 12:03:21 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb36ea1-c9f6-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 13:03:19 +0100 (CET)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by SN7PR12MB7180.namprd12.prod.outlook.com (2603:10b6:806:2a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 25 Nov
 2025 12:03:14 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::7a) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 12:03:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 12:03:13 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 25 Nov
 2025 06:03:12 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 25 Nov 2025 04:03:11 -0800
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
X-Inumbo-ID: bbb36ea1-c9f6-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzm3gMh7eVfCfFgU2tStHQ6+hr2cOpDgn3IQjhT1q6VV+Rl2zOUsC4TinwxvOt+simmuGGVLdA0Zni3D7mAWHZvwbZYkWMQH0xUPRJzAI/5n+/rpiWWF3zI6mPNALuDgaFsLHCI81qtoBDI53QLB3cIHlLSC7ApmU2O5phTVRa9IN79AxiwUBkFAN0V5gUN6xDX0J1Fj9c34XmbwSyNW1IsrLmKn2ZdRQrltBnV/BO6N3vl5+Cz6Nqu8qMqTO7MEeK6797tGaA6B3oH6DBN2KqlXHzroPJpsRCVACjHH5MWjd8vsIVmjq0OCkfO3/3zDzxHCiOUgNSTPz2Kd5XGBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a76AHGZYSuUIqHiQo4GORXQ1f0RXxPTeh9W9edRD9M=;
 b=L1+cmdIkhjoIN5E34v3Xk2jN/dAYIvj77gJw8JSTf2109E5pKMeYWUn5SBfkAgGexvTrM0Dwe4IKlGqFZsWe4yY6ppeaJjtU67XFt1vUsPQaQuWDBqBeL7rHGyhVsOhYgrTzr7rX8NyxFIf4wBGc9Cm5YMzNFNbh5muPhjFtoQgPE8bdGvREWC1Z+LmcAIyji/SbQi/QCEfLkC/+iLO+6/ls3w9r1fxEXq8XPxHtxeWQ9N5jPY/u1es0z0xe6WgAzg4eBxO1F5SXtDFZiBMJmnkcNgMwjjYwX5d9QYBI6t6e9wsqW9o6GIMATReEq65Iup0FjLl/i7U+dfVr+pVhCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a76AHGZYSuUIqHiQo4GORXQ1f0RXxPTeh9W9edRD9M=;
 b=VCNhw21S8pOwjnocWtX+fPZPwhEfKqSas9MWxSZQU3Inf/rcM1yTmWiBUHvbchrB0a/kLOrAzsKaRhjDPvaOAE3iiKOnLBZ2/W3d9zk1ckgW3lOZJ6Br3b+8ZH4vcHcfD7DxtB5q0dB+O1xYF8clpY33mgcTKdbNej/Zs7BC/Zw=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] vgic-v3: Ignore writes to GICD_ISACTIVER{nE}..GICD_ISACTIVER{nE}N
Date: Tue, 25 Nov 2025 13:03:07 +0100
Message-ID: <20251125120308.65981-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SN7PR12MB7180:EE_
X-MS-Office365-Filtering-Correlation-Id: 57fb716b-2f43-4661-4469-08de2c1a9c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?apQOIfWHCyTzJtwVRGYJHCBw9irlaFq12G75NazqTc50Jp6tqVj7KIsTyMLg?=
 =?us-ascii?Q?giSx2Humae7zpj2JG3wAQxKgGFYYzpllhyp/tTz7B8pWZV50be3FOhRsUihs?=
 =?us-ascii?Q?htkpc42GAc3noKpXsN060bgG+A87A9l65xRPbNfAiBRINzFISiJNc7kS2SDt?=
 =?us-ascii?Q?/YZzSw9TbYZ1AP4BKr1VVtoEFbVeQZ8uLO4Df4+09hp80Lu0ecUKR/k5fDVj?=
 =?us-ascii?Q?FZqF/Lu4eRh+dxkvZZaSuLPkIorSrZNufvsjjZ7tPNR7YYZJLQnYbNgPBktg?=
 =?us-ascii?Q?ijjHMXjuTP4Hbg6wCCRlLTADnAWiMsbBZTaIxljOFRz3BmCN/nM7S7BW3i0A?=
 =?us-ascii?Q?whqReXHtHpj1S4EoM3hpQ1U4rCL8W5KMSNhV2APWIcNEctCXJBrTsYvGco+m?=
 =?us-ascii?Q?vYaKx/b3pdj+uvEXvG4xx18QLZoJ6wl9DsgVeqCfB2b+7Cuc2NVBto1DweWP?=
 =?us-ascii?Q?QvfQTpVtyAqpMcvkCPlPcJ65SQZ9e6vR8ensTWIwcrQjV/S8bOcI4S7DGwAE?=
 =?us-ascii?Q?XFmHphoQyQyE3/MHgCwe5dVJQ9lfvp/e5jDaRZjHjahgobcDelDMWYL9dlNu?=
 =?us-ascii?Q?7tXKWh9+hl97unUIgA4a8NtdEkELZoUAYIjmoO3BG1Qh3EnXqndbjLwm+qmP?=
 =?us-ascii?Q?zV4TX4W3LoslKL0VvfQ4owcqbZIgjRVVBcIINc0m3MCCBYKOXTGqqGtkqVgN?=
 =?us-ascii?Q?OzJx4JDuCbdmp+rnheFpY8GNCWZ378/8ELxWzOaWfjC0bfL4w75+fDoa+OIE?=
 =?us-ascii?Q?9SoJGHydRxeqdL7fbPyz0W3vjTpAlsSH9By9hkEPhIVQ2rxKhqS3MW2D46h9?=
 =?us-ascii?Q?Rmye44kKpU7tdbaABQUqbMvhtwJ1iv9vM1gBx+/+qy5phwI9+j9ztqehIqAA?=
 =?us-ascii?Q?ggz9+DagRfXw7y1UtFvwvavs1BqrLmJMUcW4qkAzklt08oqb+nAlPgwrUNDU?=
 =?us-ascii?Q?YHLE5TAj9xHnEWuF9wT7HtHqsTUukX4sB0LYZHbhod8sPFRNB0+SgIYyM56v?=
 =?us-ascii?Q?b8SpUGus6J2+kNCUh/8L7dgUGsHpf0FcWHkeNpMglgnXlg0Y8aIIAeAexTz+?=
 =?us-ascii?Q?Cjn0gveGyGo4gZB8NbbKl59KMxSex6GTxIpU53W7kBkxXRLEp3bR5ZS9zS0z?=
 =?us-ascii?Q?FKv/jvvE6F8qPn1jwALLdXoHQ/MV4bBt3unz0qQZ3bA2bzRqFY5oAxVm+tAe?=
 =?us-ascii?Q?XbAVYDqSkhxH7fX2a+lCFE+0kWpOBjBDDiCCcEuFFOMiu62pYfYbRysp2bdp?=
 =?us-ascii?Q?s/pzu49R80u+EmUaHu0uCl49vcpFajrkboM/df/cZ1xV8QREdM5tqtfxo8mT?=
 =?us-ascii?Q?NUXG09CD9/UBBQiRVYl2b6ALQT5MeyK8S/Sl/3Td81FVuSrlROmEUmExgSFV?=
 =?us-ascii?Q?O7lKf3ulmCcpIbHuqTHvrEBpVhJzyyCUM78Fmi6upnX5ZQVVNeap52pKjPqP?=
 =?us-ascii?Q?bWXQrZyy3WERTnRAqcnsCmM/nPm9jBPEhx/f6nJ6u8SX5Zb0O7ip9T/zNZUL?=
 =?us-ascii?Q?M6YwKj7b+nF3Q48Elh5sCc4jalUpvMebKh+x01mpy9QUHP1h5nT+ZGzQRA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:03:13.2113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fb716b-2f43-4661-4469-08de2c1a9c14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7180

Similar to other registers like ICPENDR and ICACTIVER, ignore the writes
instead of injecting fault into the guest and thus crashing it. This was
already the case for extended registers prior to introducing GICV3_ESPI.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/vgic-v3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 8b1c8eef8024..33dfd13dccf1 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -887,7 +887,8 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
             printk(XENLOG_G_ERR
                    "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%dE\n",
                    v, name, r, reg - GICD_ISACTIVERnE);
-        return 0;
+
+        goto write_ignore;
 
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
     case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
-- 
2.43.0


