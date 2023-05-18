Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF870841D
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536420.834740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzepx-0003nj-FC; Thu, 18 May 2023 14:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536420.834740; Thu, 18 May 2023 14:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzepx-0003lB-Bd; Thu, 18 May 2023 14:42:37 +0000
Received: by outflank-mailman (input) for mailman id 536420;
 Thu, 18 May 2023 14:42:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzepv-0003kU-MI
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:42:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe59::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39761814-f58a-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 16:42:34 +0200 (CEST)
Received: from BN9PR03CA0320.namprd03.prod.outlook.com (2603:10b6:408:112::25)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Thu, 18 May
 2023 14:42:30 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::a8) by BN9PR03CA0320.outlook.office365.com
 (2603:10b6:408:112::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:42:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 14:42:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:42:29 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:42:27 -0500
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
X-Inumbo-ID: 39761814-f58a-11ed-b22c-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEXfwzU6VoApqgyxVB3k7eR/qeEpzyqikzzA+lp3LwD+CSpMml3MzBfPuun6t4H9k7B9oNYx1AxvJFIlt6bBrGwa3PA/4JHHjIVtSL1su7mb88SetivxZ3VLaVp7XZpdXbbVfDGKwJ7WNKLWRSK8/qMQNuwpPdaN4lcewwuddHIB4F+iLebbN7Aos0A64VBpPBCeykKDEK8F+SbL4iTnneqyTRX28xAZLDKdNaCDE01ycp803GBVxE7KK+RZV8MgPwMYqL0/stzJyD+tKYxDVwDMO80kEWrMpexNtm1qa6puB4RMTSg1pnLKfOSwVRNmU7KrX0DORwWOH57PeF91Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9J/5ThoetEUno6+i8DrRu1jgcNPeeZ3w3OXUkCp52Y=;
 b=I+QM4nORvC6tA/vLOZTiia1jZ5y081VwqSyMKSl5w71GS/53GKuICTnBuTv1x9/CPxkc0SmQ+I16nkbOogXhZJJ/NyO3fSred/1Dnd939vJp5XsyqqyqWff+flnMHFb5PE3Ieh9F88qASi5aG112ZpdNYki9bRIENGXHNTRwUuYTbpl+ImOfZwnX8u48FSq9KQVOV/M5raQEoKHN5KRlZi9XicE1+ONfWJ9ZuEgyWyVZrU3loG/sfpfokaa3ZfDgZ6R+Odhf6ldLM/fHfL1wIrICO3Nwb/CrAF/Diyx/9APpSvtGo9xTr2lA/+N6+PPTDgJ96tN6MemmngeC/mz9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9J/5ThoetEUno6+i8DrRu1jgcNPeeZ3w3OXUkCp52Y=;
 b=b+iGFAU602aOhWComooD9HzBGj81gEbGY6fJRSQvuZ54Hwdxh1lkQy2uLZGda43UOoiNiNpmKOuFQaxAOYqOaI/DwPxrNGOkm0PQ8OXuod0H+SWQtUlVOtXQQlo1tvb9qZxKcisExyJ9s7BkpH4fGu7Ucw5qcS6IlVDRfYfELsY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 11/11] xen/arm: p2m: Enable support for 32bit IPA for ARM_32
Date: Thu, 18 May 2023 15:39:20 +0100
Message-ID: <20230518143920.43186-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efc5c60-cf6f-4e54-b064-08db57ae1b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pTgoIEc+qksOtZzpFWX/aRxYRbHyE3smwQR+oM4eLzI0kmyuuqrkLg5+QtgGN/tkJdIPwXajxygGUC5V3hA2eOH9XHv6F/0eDI/+28DI1K6kXbsIxFoklzCcV14SP4BHTx1v3mK2rZ56Ubfys78mqIHl40rryW4FKsnfEBG0w55znkScPiTKDWdvf2oMDrJ0wJiSICXjpHprmM+bQbWDxJrv/MJ3w47TlIjYBjmkI7LXuCPcV0s6m5xBvqzRTB8vBoMA24QQtZcI847djFwHW50nS2vFhMEI0cM7UOyKledWbZCpTiBu6wPk5or1U3d0hevmCbY6c20xvhtmGaWeSsIh/y7RAWM6R4iAxqOLb46W28unFRIf7InclsE5hsEobEK7vUb5Dek0V6xOItMKbQNmYcVduXEPh+m3F/vjME/qVnh6Mt75NiAcAfhTuhv0kn08Yjab1kX+gX4ZfN91Q0eKk0DN+VJWliaPjIij2qJOuZAa1CljC1QmrtCILkD9NcUSANiYVOBYbRljwQfMXyHYXCb1MVS9tXyqvAVQLBcPNU0ACSLp7ub0ztwUodWugS/XV7GN9L76lPxPX18U/tr4UgQ48S02zr/cOTIjWUCUZG2B7+JnPU1ez5Y1zWpTP4viVhh3wtqOfYlw/CumWr602jT+8iApxXxjgxgYRvlmoZPtsrSFXj3xMnMnt0ZbnsbKu4UwSmcifTjtY5RQKqnq9geuXGi2YiZDooVKlMIqmTEHPY2Xk2fHjgkkILBNeUXWjcJXj4BWp67HxpMR6w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(7416002)(8676002)(8936002)(186003)(1076003)(26005)(336012)(426003)(83380400001)(47076005)(36860700001)(5660300002)(2616005)(6666004)(41300700001)(82310400005)(356005)(103116003)(70206006)(81166007)(40460700003)(54906003)(2906002)(316002)(4326008)(478600001)(82740400003)(40480700001)(6916009)(86362001)(36756003)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:42:29.8556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efc5c60-cf6f-4e54-b064-08db57ae1b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961

Refer ARM DDI 0406C.d ID040418, B3-1345,

"A stage 2 translation with an input address range of 31-34 bits can
start the translation either:

- With a first-level lookup, accessing a first-level translation
  table with 2-16 entries.

- With a second-level lookup, accessing a set of concatenated
  second-level translation tables"

Thus, for 32 bit IPA, there will be no concatenated root level tables.
So, the root-order is 0.

Also, Refer ARM DDI 0406C.d ID040418, B3-1348
"Determining the required first lookup level for stage 2 translations

For a stage 2 translation, the output address range from the stage 1
translations determines the required input address range for the stage 2
translation. The permitted values of VTCR.SL0 are:
0b00 Stage 2 translation lookup must start at the second level.
0b01 Stage 2 translation lookup must start at the first level.

VTCR.T0SZ must indicate the required input address range. The size of
the input address region is 2^(32-T0SZ) bytes."

Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = 0 when the size of
input address region is 2^32 bytes.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - New patch.

v2 - 1. Added Ack.

v3 - 1. Dropped Ack. 
2. Rebased the patch based on the previous change.

v4 - 1. t0sz is 0 for 32-bit IPA on Arm32.
2. Updated the commit message to explain t0sz, sl0 and root_order.

v5 - 1. Rebased on top of the changes in the previous patch.

v6 - 1. Removed the index for ARM_32.

 xen/arch/arm/p2m.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 755cb86c5b..08b209e7c9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2265,6 +2265,7 @@ void __init setup_virt_paging(void)
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
 #else
+        { 32,      0/*0*/,    0,          1 },
         { 40,      24/*24*/,  1,          1 },
         { 0 },  /* Invalid */
 #endif
-- 
2.17.1


