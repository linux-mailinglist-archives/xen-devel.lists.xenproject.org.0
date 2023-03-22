Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAC86C47A1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513301.794134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevjE-0008RW-K6; Wed, 22 Mar 2023 10:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513301.794134; Wed, 22 Mar 2023 10:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevjE-0008Ky-GV; Wed, 22 Mar 2023 10:30:00 +0000
Received: by outflank-mailman (input) for mailman id 513301;
 Wed, 22 Mar 2023 10:29:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pevjD-0008I3-3K
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:29:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c01f873-c89c-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 11:29:55 +0100 (CET)
Received: from DS7PR06CA0008.namprd06.prod.outlook.com (2603:10b6:8:2a::15) by
 SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 10:29:52 +0000
Received: from DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2a:cafe::80) by DS7PR06CA0008.outlook.office365.com
 (2603:10b6:8:2a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 10:29:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT096.mail.protection.outlook.com (10.13.173.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 10:29:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 05:29:49 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 22 Mar 2023 05:29:48 -0500
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
X-Inumbo-ID: 7c01f873-c89c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8u0aotvnWd4qIZ/alH+c8fVfDLfzBnoZhIcE/4qKyyw0qWPLyop5h8uH45+CUgGuNuiWHm19jIHrWDAjhKtN3rrU4Fb0TIRhxzHcDz4i0kInxXq3c2a4jqykYmtu++y52N3ZfT2dov7/eppwTssUzWtSAspWm1rAs1lNY+Xhk00KPidVnI3o2pAGDVdwb/K4HGImiW4SvDqathiPLjk3rtE70Tvi4fjvbXfcjODfWE3TXz//MX7wEOl9K5LHOyBDdC0Eme7/gZAqiZJsmt6E5xs+/kPMGuVn76xkFgDr6w14xj2Qy68jOq2HnT4r+hKwfRFEwOdZVfmITzRD/qb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEHhl4OfY4C4g8mhIFlhppd+WY7/WJjjUQxWu0Sbqss=;
 b=CosUd/HsgZqrWM8gnbV/nZ/FJcEkRUhT0uYypuBoTm8uZbH9YCb0oopGaDZUWFzLGRqfXWjpLnCy59F0d90ha3gUtuPnjmT3wOSXTpfrhc4lxq27et17I8hgCXKYrCpgHMCMrHDlEAAkRZocsgv9pBZUjQBKXu+F+xQVmaJN5YsWa1tCjZzPh7ICB4GCaq7+yKP9iBmH2TQad0SKtAKeMHAqQ51vnAPZQAYOaPnweluzR8xE3Ku01OO3IRn623TwzNl3yqdWoE5wzIMhac8zuJl05L9xGK/GfkH7RiS41rauAFpIZJAkbZUTUKgIoLUCCRHoYXYolGDVRYDOMBb3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEHhl4OfY4C4g8mhIFlhppd+WY7/WJjjUQxWu0Sbqss=;
 b=1zmwOJqw33eSWQsddehvtIMOEDfRbem5cJxTsop1U+rBefBIS4xVn5KNZIr5XX4qlpPfajRrkNDLHDnqxRxebNEKKnZ6s8Ewh6tOoSBw7urOBBZv/0aw5WqwONOZTM6GjybzogL2jsp7E9GDyrnXTI9IPus4P8jWFY0DYmC6Zos=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: domain_build: Check return code of domain_vpl011_init
Date: Wed, 22 Mar 2023 11:29:40 +0100
Message-ID: <20230322102941.959-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322102941.959-1-michal.orzel@amd.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT096:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3128c3-d737-44cd-e293-08db2ac05e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VN9ZBhRTFv2vi+5Ju0KmeZCrl/bKKc1lOMC4mLNugc8rTBTZNmVWNNVe2RHKxl+1TbXNPY1M99xRe6ZsfccsNhDh84FNMb155up/X4+e0Ce2tOE2BjQDCcZ9P502pTh6M1tPnsm8jhSnxrlWGhrEzvseDfX4tz1NE7SDrk5f9YPScpwtsMeDvGjyMh/4awo2+4gT6xyTbVj4SyKqhCQFEds0HRYTSRaXLPULNd1uIa5dyt5aJi6mXYnpFVLY4uMWLiYdeG+yYX/Dfpy6bCX8vlEjQijZWeo1X3SIkQfRqnevCsXRpwNO9geDC8lGRikQmzFN7N27NO1x32GgJcFYpcwdqeygLP2v1p41mYdOF7dyFjPZW+QLGyIbwlCgDz+8iNXiuue5ra8x7Y5Vri4kYs3UJ671M0L50niQpvSzFJxk/El2trivpow7GW7NPqVQsqI5KY123awRp+sMvZAq7iIDIFX5okp6d/LzQH+7hkQ+3JgJMsYL+I4ebdsjE3p4pqxvjnPk4nMlDjjVb3v5d9aFxJ+MS9CRoGoOL76JNdmQGGR04LHtl2gwo3Bg4rvZffTuikLDzS/z5n459tBg3NH2DmTCyyIwXqZYEvfGjVtFoIbXkaxEOi85PCod2CsezhKoX30/hJxNdC6sy/6jJPtQJ6cA2gNd7DPJ3AaGHAgPz53r/tohqs2o9TaP3rn80fbPZSMKbTupF3z66Hr2D2KW2RW7EC/KFpONVhStwUg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(426003)(40480700001)(47076005)(8676002)(4744005)(54906003)(44832011)(316002)(36756003)(36860700001)(70586007)(8936002)(4326008)(6916009)(41300700001)(5660300002)(70206006)(2906002)(40460700003)(478600001)(83380400001)(82310400005)(86362001)(81166007)(82740400003)(6666004)(356005)(2616005)(26005)(1076003)(186003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:29:50.2200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3128c3-d737-44cd-e293-08db2ac05e0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888

We are assigning return code of domain_vpl011_init() to a variable
without checking it for an error. Fix it.

Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART address and IRQ number for vPL011")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9707eb7b1bb1..3195c5b6d6ac 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3826,7 +3826,11 @@ static int __init construct_domU(struct domain *d,
      * shall be done first.
      */
     if ( kinfo.vpl011 )
+    {
         rc = domain_vpl011_init(d, NULL);
+        if ( rc < 0 )
+            return rc;
+    }
 
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
-- 
2.25.1


