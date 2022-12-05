Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0989642AB9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453812.711416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Col-00041j-EF; Mon, 05 Dec 2022 14:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453812.711416; Mon, 05 Dec 2022 14:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Col-0003zN-B1; Mon, 05 Dec 2022 14:51:39 +0000
Received: by outflank-mailman (input) for mailman id 453812;
 Mon, 05 Dec 2022 14:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2Cok-0003zH-5C
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:51:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe59::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 516628f3-74ac-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:51:36 +0100 (CET)
Received: from BN9PR03CA0572.namprd03.prod.outlook.com (2603:10b6:408:10d::7)
 by CH0PR12MB5121.namprd12.prod.outlook.com (2603:10b6:610:bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 14:51:33 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::b5) by BN9PR03CA0572.outlook.office365.com
 (2603:10b6:408:10d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 14:51:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 14:51:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:27:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:27:57 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:27:56 -0600
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
X-Inumbo-ID: 516628f3-74ac-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ5WtD8GNHCGS2h68S2Lkl4wfTP+NARAd5Rq132eg0El/avevL/sgy/eL//8TNsEgqJyjX4MKAhmQT7nTpcTmzRjWaHG9fDJenReruDVVCT4kYbrH1ZXWT7y/8e4zLRnYd79TLS4TZTcI8NmW0drIsFbUqr+pmMEtnVzHv1u0sP0HhG6LEt/P5TIYCfZ1J0XElxTHXbS7I/Byzw935xUKLE1QF8MARBa6PVTbPqMX2paXVXjra0i1AdFq3Ro7MMPPPvV2grBrV3GFXnfKBcXLXZ39LGyD7I7geQCwKtmev4KHSwuVzV55Mu/1aSe0MLX0r3hAqyHXwB+3Js6E+PLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++4q5HIw11G096d2CZkM4llMeSXkXZxp6mjZ0joYBGE=;
 b=aXrxyz2hdKqZa1VW2kDTYzLJk9id/GaPXuVmVYGTgnQmgZbj7TTlHT09F0Jv6HsswaQTwLh9vXhGxv/AnwPoAdPawyfLZ3aU0xkTiBxIbGExoRjUpI5Yv1E0pGgWK1CB5X5f8y+Upq1ituAz5NXcmiPU5noOrll4z1T6OHW0kN5wFeFRuz+B004KGDDxFj4BrAEfY3wb5W4f5q4HRKHnqZDg4KZK8kQI9g9Qvtn3hB148rQXCfqyiF/XRM5coG/FnV34k+NCWEzTQ3LbJsJSzoUqZryTm65uRu/KOMw4u8Dh8BeCWSz+NJee+P8YzrHOcc1urwg3LNwme5EcUrVGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++4q5HIw11G096d2CZkM4llMeSXkXZxp6mjZ0joYBGE=;
 b=PorcKCf8iH11NljbtKjmj55o9FRy756PLib/lX/8osX/seX7M2O/hN6G0hZKdzMuYOq7Rn5gCAjznGzRjE18GQr9t+MGt3zzSyVMvKMsflGdPqaQpBtnoM4IsQV0iVvAXfSCD9FeWXhya0f0i6zfIh9blgMa/+XvkHn46eWI2HY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 06/11] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32
Date: Mon, 5 Dec 2022 13:26:32 +0000
Message-ID: <20221205132637.26775-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|CH0PR12MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: eceb8df2-40e2-4297-68ea-08dad6d03338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eWEViYG6HPTvfVP2mrmBcXJGUsYk8Fre5w2/nqWjY87eGqlybA19XufjNLZ5NhcFdzq9Abcasv76WcBdXmnHey+Q9n5IIyExNF75o/BDBi+8tPF27FqBC6f3/x26q9jDMdYA7elQim+NqZtha8WmScKgB5siKB9Ak9/7tE2ZUCSG6L+oXsttf/3p1oMnmAxQjgqdHDAxTWHcFRDszpNdgCVs2Ttn0AouTj71dlO479zPZZ0a1jcOvY3OPAw568VrYnJBf/JXYS5PxqH+sRcYoxhbeA7HnnmJQdv1MRN3QDOZzzJuPbYrwLvUkWgkeBBTT6QBasc2qSgQeYM7sx4KVy9UhYJKMKxzPhIVGEvJfJPxUpt8MIMTfah4JOtGUck8GpRoQKXPWg6rRU4qkpemF6xYZxbmlaGPP6QfIso/Fp/a1O6BVgwJTjzr0wiRUdzualBzH9gAWQyAikorTL31QofkVTkVmWjhvA4q9ouBdiK1Pkft9NBI9f4Pd9HEMMpKeKIPYfNVwwSgTw+cNPssf/WfQ1Q3kU+VoeXZpLvL4M2fjDn+uSRVD0P55Aw54HjKFC1WPAqDjw8BjNFLyKGbkt1DYBRBBg7sz7jGaKsjycp+ufWF6+NIc03x9JYQrqWgM9sns927GFENdQnpQehxuBXcT/HFtFEJBkfmju5kI7on0MTroN4lJFGJnWP52dsZ+vBhYIxL3/YXl1MqkfHdoV+M/qvRuZCSP7+g33rzFZQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(36756003)(40480700001)(47076005)(316002)(426003)(83380400001)(6916009)(54906003)(1076003)(6666004)(26005)(186003)(103116003)(2906002)(86362001)(336012)(70206006)(70586007)(36860700001)(4326008)(8676002)(81166007)(478600001)(356005)(82740400003)(40460700003)(2616005)(8936002)(41300700001)(5660300002)(4744005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:51:32.6754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eceb8df2-40e2-4297-68ea-08dad6d03338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5121

Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
AArch32 systems. Thus, the function needs to change to reflect this.
The reason being 'register_t' is defined as 'u32' on AArch32.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from :-
v1 - 1. Updated the commit message.

v2 - 1. No changes.

v3 - 1. No changes.

v4 - 1. No changes.

 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index e0b636b95f..47575d4944 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1483,7 +1483,7 @@ write_reserved:
     return 1;
 }
 
-static bool vgic_v3_to_sgi(struct vcpu *v, register_t sgir)
+static bool vgic_v3_to_sgi(struct vcpu *v, uint64_t sgir)
 {
     int virq;
     int irqmode;
-- 
2.17.1


