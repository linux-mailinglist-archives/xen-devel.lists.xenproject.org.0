Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A53AAFD67A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037152.1409822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZD7a-0000U9-Gb; Tue, 08 Jul 2025 18:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037152.1409822; Tue, 08 Jul 2025 18:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZD7a-0000RX-DQ; Tue, 08 Jul 2025 18:32:50 +0000
Received: by outflank-mailman (input) for mailman id 1037152;
 Tue, 08 Jul 2025 18:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZD7Y-0000D3-St
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:32:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ce30d5-5c29-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:32:48 +0200 (CEST)
Received: from DM6PR07CA0101.namprd07.prod.outlook.com (2603:10b6:5:337::34)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Tue, 8 Jul
 2025 18:32:43 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:5:337:cafe::e6) by DM6PR07CA0101.outlook.office365.com
 (2603:10b6:5:337::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:32:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:32:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:32:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:32:41 -0500
Received: from SATLEXMB04.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 13:32:40 -0500
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
X-Inumbo-ID: f1ce30d5-5c29-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfLb8+fyJ+bKZEX/3s6hjGHvxAjspOp+Bwb7/XqPr+rsx9+9UiyyGvF9+Or4Xb20LNnXEgYoMPaEPjkBHxXbMhY3WtmSLHa+Wbopvj24tbD+2OqAOY63cqtionbdvNZQHUAPpdz4tdcq6DQg8PIzzKYwbXbmCqzrW5g5hiA/p4y33lq+J8PRP6O45nkGM+i3pOlMavEObaHXDAKagWdm9aWJipTOM9tajaq0AaxSqtlqyKl3Zgn3CpTfCSef3i3/UrTD0bdiEk77oEBGjnpLYUM+vUX1u8gxEIYKbcruqH+eb77DY82hcG38Dn/H1TPo59+KKzFpOnIgCTQQVMQWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNpy3f9v/76jXn3HtQF4Prk92pw59tzhtGk12dtjF8g=;
 b=O8DBP8xhYl+BmRAXm6G0lmuHkJZfhBtZXAB+hwEJ3/MX67aAl+ViOEfOQxx2S7r7s8qvpEoaCnXx1CO7kB8giS+4Elimt6bvN1goBHqKmGE6gZl16DRormEHhLgZQvTf2R0BDGkhTrfFtulTc9z55Ej663qB3+Sbi/SRMmB6H+AgzyUwx8uusigpFnHeStZR89SHYipc34ksp4J3h7lE4evw0I8I1FtVs/PyyDNx75hFP7OsubowfC7a3RYM6H3+FYo8wVPsFj1koAuvFW2I4kkuPFg6p1IfCXyCEVQbnY30D/ncSPUrp/HcBMCR+dpLzVfh2J4ToPNQImO2jyz8XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNpy3f9v/76jXn3HtQF4Prk92pw59tzhtGk12dtjF8g=;
 b=dacf1K4+o+o6X/LHmsK9pfQGsZJa0gUDewykgXZDPXK/IuePaNvJ90ia4eOcyIc9Mg0PESDLC80d+C00+SZTY0Hkdw7MDPklYNdP11czg2i1hg9s1QmvdXfrmIhcPVjmgMvN69do0gAJqQNun8rH9kkAnoWILJUoZB1yGfuH9uQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<stefano.stabellini@amd.com>, <Xenia.Ragiadakou@amd.com>,
	<alejandro.garciavallejo@amd.com>, <Jason.Andryuk@amd.com>
Subject: [PATCH v2 1/2] xen/x86: don't send IPI to sync TSC when it is reliable
Date: Tue, 8 Jul 2025 11:32:37 -0700
Message-ID: <20250708183238.3104638-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f678d0c-3cb4-4a9b-1d36-08ddbe4dd396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1bB5rWAf4yA4FualYOg0rDXoeKB+5XnBEqVrENL3cR2zI6CJ2ql17VZ/0mB6?=
 =?us-ascii?Q?wZugNhUe4lyU5yK/hUpItkqbXJSO3pS1fr7sd5IHYtoLhR5nECpvI5aMKlXf?=
 =?us-ascii?Q?VWG/uhyPfemFc4vDtcV59rqlfbGK+F4XWxCBJNmrh3gjEYf1NdXeF/FtFpcP?=
 =?us-ascii?Q?k0hLY6NnZ8X3qB4o/y2tUtiggJeuPFw20+rpfk+sUvQZqUtxnvEfYC09dCAm?=
 =?us-ascii?Q?IrDDL5YFT0XYthmCbFkUMOjHExXOp7QsqA1F41C/8KS7YuvzV4XvwlnqtSQX?=
 =?us-ascii?Q?gGzkzaWfv2bAy4r/5L1v3S5fpQSpOLXNOS23wmESbK+NKOvaOdrbU9uHp53m?=
 =?us-ascii?Q?mdV1aHtOl+eTY1EYLkIlGNInPi2JawvEJ/Bhg5qOZn8DloBYZJjP+RMTcySk?=
 =?us-ascii?Q?0QUiZ3TbFQ4u1EokvW5tV1FZ7H+pu5KDKhfzsZe4EnZcrIUFaGEJfByiHZDE?=
 =?us-ascii?Q?WSgEw+CuqjNTw+b17LI6TtQ21qRdBZ+mU7AIMA8t64exNbAfuEMSe2B/6K7Q?=
 =?us-ascii?Q?Cls1V4JnbOYRuI/kiIl1E+GCPJmF1Chplg+CE6CHt7KspISSuxWs2tY55pe7?=
 =?us-ascii?Q?3ou7KyoZPa9WqxCHCgCtZSVos5qAp8mIAiIndkLqR4/YfnCQHMNVdHXW1f/2?=
 =?us-ascii?Q?DZP7ZR0RLKz3oFuKaQ0dLw+G37lnj4ig3qtieamFeTRGMWtoYgw1LMfRrMKa?=
 =?us-ascii?Q?ZMdvFeBuCrXQpFMMThzFOC/1ghDu/uzak9m+HeJOx542bd+lMsJRWdSYKxlB?=
 =?us-ascii?Q?UEZmT36QXG4RJrOgmS5lS1dM7Sr4jANsJmw/5tKahuqfIgtfJVKZmrsnjXLr?=
 =?us-ascii?Q?GXCuBXxboqVRBaK9I7477uue2i0opMqJ6TIlnGDfthsFOhQTkNwj09pNHJMf?=
 =?us-ascii?Q?eEuqihuFSyDhQQEyNAEWDHHM8r+Chs2uaSl5wQyQKlhVg1E6vp8aX54tbabp?=
 =?us-ascii?Q?WRhopNMHIP8YL5CGcHfWnOU+01l7qovm4foZiKYst6Ri492etmNNjt3CS+hc?=
 =?us-ascii?Q?WlskuQekRhL+8j8/fhqUmCwcezZB2Jx5w0BbojQq+5sSXH8wuDSV4DsvUlLe?=
 =?us-ascii?Q?0/if48ixn1uEX2VKfWR+BTaMIxjseCBsJbdGpwLRtjmv28uNh0vmPhRMAQ5k?=
 =?us-ascii?Q?StT/IvLmkOWPJuSeTVShNzb+ntBcGFk7QHp+ncxa20W7MPqj3/1gdrjF34oJ?=
 =?us-ascii?Q?BVMVqA/pCq0fo0QyO3+TAZsDDykJTzxOuUIMJRcuYwMdy220wgucf/6gEOUa?=
 =?us-ascii?Q?9SMbrOubG8L2SPuvzGTr/VCNv031rqHFggTeSDqJ+AOZ7pqIkc2xdXxuI1Kr?=
 =?us-ascii?Q?Blr7arnVks66nUU+wC/spNZdS8cPu2RjxDHPHG5Ecx1zuisPuGIFTqTrRV+X?=
 =?us-ascii?Q?ggeOv1Qbwf0VUgNwbbj6fOodjmi+zRRBsiGYneP8njX5Hgh8WM1yTENBthG+?=
 =?us-ascii?Q?k7wkm5klGTCvi5juyoVLTO/TKEO9eUArh9dMly7CFUYaEiCNV+hCCyu3mDw1?=
 =?us-ascii?Q?/6JIAL7u3pBVI4TL5FSP7sqCiAWx+sFYH/Tc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:32:42.7266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f678d0c-3cb4-4a9b-1d36-08ddbe4dd396
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255

On real time configuration with the null scheduler, we shouldn't
interrupt the guest execution unless strictly necessary: the guest could
be a real time guest (e.g. FreeRTOS) and interrupting its execution
could lead to a missed deadline. The principal source of interruptions
is IPIs.

When TSC is the chosen clocksource, we know it is reliable and
synchronized across cpus and clusters. Thus, we can return early
time_calibration because the calibration is not needed, removing the
related Xen timer and IPIs.

Also remove the master_stime write as it is unnecessary.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- simplify the patch simply by returning early if clocksource_is_tsc()
- also remove setting r.master_stime as it is not needed
---
 xen/arch/x86/time.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 59129f419d..d72e640f72 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2297,11 +2297,7 @@ static void cf_check time_calibration(void *unused)
     };
 
     if ( clocksource_is_tsc() )
-    {
-        local_irq_disable();
-        r.master_stime = read_platform_stime(&r.master_tsc_stamp);
-        local_irq_enable();
-    }
+        return;
 
     cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
 
-- 
2.25.1


