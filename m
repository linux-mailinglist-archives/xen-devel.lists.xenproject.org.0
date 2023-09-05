Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57F7920BB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595372.928920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXW-0003Cu-Lq; Tue, 05 Sep 2023 07:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595372.928920; Tue, 05 Sep 2023 07:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXW-00039N-HY; Tue, 05 Sep 2023 07:31:58 +0000
Received: by outflank-mailman (input) for mailman id 595372;
 Tue, 05 Sep 2023 07:31:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AA/O=EV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qdQXU-00038m-MD
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:31:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47fad186-4bbe-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 09:31:52 +0200 (CEST)
Received: from CH2PR14CA0037.namprd14.prod.outlook.com (2603:10b6:610:56::17)
 by MW4PR12MB6756.namprd12.prod.outlook.com (2603:10b6:303:1e9::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 07:31:49 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4d) by CH2PR14CA0037.outlook.office365.com
 (2603:10b6:610:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 07:31:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 07:31:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 02:31:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 00:31:47 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 5 Sep 2023 02:31:45 -0500
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
X-Inumbo-ID: 47fad186-4bbe-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjsBEEkweSY9bfvMBo05rIV2ARuIIBoVvKgiS771qm7QhJ2ptu+xMBE4+q9y/+eB2jx3tHtGV0pmFvaoVlPbkj4ITzfZs8I7LfHv5k0nVatCl+pd6qwwpVrbMW01gMXh1Y6FNjJdjQDhLDnWQul6wBRWuy6Gli4xtb/CQ8xamFHjuxXDHwzl5ZKDVL3txnZdQAtRipc30yeJwJxAYdIG0T1IJLpzn15d7VTfZLFRLk30+rIdkXziRCOnwW6kjqX2rU8OWHnR6Wa2FVSlNxiQ1/moftRwWbppZu5IKvACU9kuSZftqTkVpAmPFtKd2OZkRCRYk+b9Acjc1dRkqidD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQos5evTDRDmWxEzyWKU7S4SaDAyuWyzW4IdN3YnOu4=;
 b=fHAuQUgVVThS0TTVJZlFpySbeHR5UcxHUsgYGXD3B0NdUpld8/GL/o9CIV4jkAli/PBXrEP3j0yDfyWAPlr9HXovyC3zWbL5sicJWjv7yE9xlOKzDLw/52mpitb7wZOyYLLhrTBwEcYYiLk4g9DeW2EAcLVD1DOQeLy31xlylkUwlFYhnA1Fr+ctZg5YwG8YdDLybQL3zdD8Cn/buiE9VGy/yFBcFWtarcH9kCcJH4LPZBjtA3nPsf7jStl7JMToNbF+m+/D2KKOC8Sx07e2ycxJizBlJaELn/B2b2zwDJzC4GG2Spfqr8mdRu1qd3Uhv09aKzj3Q5a8bul5aWDq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQos5evTDRDmWxEzyWKU7S4SaDAyuWyzW4IdN3YnOu4=;
 b=il3Q7gig+EodVIT12b5867/47cvgMqduZY3l58FbSP46EQtK5tWEy9ka3QvwlFUmmkNoOSWJRf2T/7D/SpC47ytIrEHIh2uDlYhkBnYMpXMKKpWN0ppHrzJAe0UGhlME8nj7l5Xk4+Ux9xnIKt6RQUMha/SFKv1FQNNqmpePxjA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, <Henry.Wang@arm.com>
Subject: [PATCH v2 0/2] xen: fixes for UBSAN findings with SMMUv3 enabled
Date: Tue, 5 Sep 2023 09:31:33 +0200
Message-ID: <20230905073135.12360-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MW4PR12MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 20319af3-3c28-453d-31bc-08dbade22a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eZhpEDI30dHhcghPp05QExGVhedE+7ADCagO1tr3iKGU2SdJPYL2QRjWzKSx25U9Iu2cBylbZD9hCOV2VUh7fyc6F0nQegSPY8FNpPuVMhxt+pg0JxMlv+s8xW+agMUOzQsJOLzCsCu5dM4cZSTp+IZ1qWoTDlliW8etTQY/Dz6IXpRuIvUjm5ywivFjZIGeU4g7sAw5IA2LuUIpCHBT1dSdlQF5bddFD5PW52tiOvMHrqJEQ7FsDzvIwNeDXpP49DxHxv03ADax1ztlXPspHauswpt7MY7sj0jw5qKv+CS+ypcQoeRWKGfS3WeqsUxH42/rQm4lNCikTt1/Ay4PBGWy2hJlTcM2VnzF7FcZD8JZV40BBHExGOqxO60CgYaopqLS9sml+ySl0eQC3At55E0o9t/XztF3M2C0I1JlVTbRlCVIQiVlEVdBRR9kB1hT/pjTYSeixQ9PXSG5iRDQhyE8nGBdWkaJ1zXndeRZ3NVHeVefoQ0xruXBRgmfkuPlgGGsV/xMn8kQUfaVghv3b1crBHUntB+vmTAeUz5SJMZ9YjS+kkUa/KoWAsILF3ytxx/j+Isufk+cPhi0zQc69toR87XPGxWg5xlFHbh5rDdLjEhLv78rdeG4B3iq+a9vwMn4/Nyqd6LoftnTafakF69+vhhe8Iy3okWg0VSJ/1y1u1xFTTEaefuMxshkTZjNZMwW6x57FCztM3vOJRawRJ+BaZgaXx3VX+AM5F+0ApQPEVhX5tCQIKfEpmxU2vcP7rB80kXyeaIAIzUaASPG5w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(186009)(1800799009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(6666004)(82740400003)(1076003)(2616005)(26005)(426003)(336012)(86362001)(478600001)(47076005)(36860700001)(81166007)(356005)(83380400001)(40460700003)(44832011)(8936002)(5660300002)(8676002)(36756003)(4326008)(54906003)(70206006)(70586007)(316002)(41300700001)(6916009)(40480700001)(7416002)(4744005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:31:48.1670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20319af3-3c28-453d-31bc-08dbade22a08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6756

This series contains fixes for UBSAN findings reported when running
with SMMUv3 enabled.

Michal Orzel (2):
  xen/arm: smmuv3: Add missing U for shifted constant
  xen: Change parameter of generic_{fls,ffs}() to unsigned int

 xen/drivers/passthrough/arm/smmu-v3.h | 4 ++--
 xen/include/xen/bitops.h              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1


