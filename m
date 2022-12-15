Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544D64E1D5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463757.722059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyl-0007wU-MM; Thu, 15 Dec 2022 19:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463757.722059; Thu, 15 Dec 2022 19:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyl-0007sY-Cm; Thu, 15 Dec 2022 19:33:15 +0000
Received: by outflank-mailman (input) for mailman id 463757;
 Thu, 15 Dec 2022 19:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyj-0006KU-Dg
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:13 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f6c91e9-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:33:12 +0100 (CET)
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 19:33:08 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::c6) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 19:33:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 11:33:07 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:33:06 -0600
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
X-Inumbo-ID: 4f6c91e9-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2CbNcTkHHroQ412Y+DjHJ6ZfeiaVQOwgLAwOX4xgS8Dmfmu8/Q1M21nbRu/s6iDO4b96LFspdflhc5esq0G4Nl1XMZqb2lrH1G9chlxf0bVM7gO/7CUJAl5Rb7HvopnK5b4jVCboKv7vWSpRhac+D24FAtc5Tyjr/AqESll6zDtJQJDftPYDHpTon0Sw5ouC77y/SjVTVGRE2KWTuoN9sfxxsbFyAy9YPIJsFkLle20qEayJp63dsaClaDODI67zJpmLx/bKoJlkNDhn0sXU2nMPjkhERoY0+9RxGDFoOPWYpsa4xhUBUhetFb3bTM8UoPxw1II+EOctub6WaySrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qkW8svLr8Mc6M3M8zGUIB1kFr46uVAUu0xQ2OTvK9k=;
 b=BAg95cLIQ9esNbRE1aG3NPfzeI4g73hP6A1yyjAYq3QgoJrYJHQjb4BuOL1IMNlOUdmnvkCSbb28VCUYtBjryfoNFRknvvXVwulgw3FnbBzSSg/5RXhT15kEr5TqqMuyW8zoDxQjTYMhaO7J2hsCQzg3ZhjJGSVzUBW0rrQnw1lAPUes+vRnt6VdpX4LdO0PvgwPWi2uLg49vuCqXGmyNYYAcWQe+c1y9WnwysOt8UWVxUod8gw4w58fghVIJk4iKnM7koYWRQkQfTeMJObSV2Fq5ZEa7qbJpTX8d2AV2cy5fS4SCrOH4zC8i5YwMuQKgEMrHeOIMl0mDTQ2AMFyzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qkW8svLr8Mc6M3M8zGUIB1kFr46uVAUu0xQ2OTvK9k=;
 b=Aj12EsXrQGmXuWjeBblO/d2GGA0yHwyHwFyDyXHwVZQU2v+jApo9kUGOCwAJWTMQRxZp+BG5vEAY+5uLchYzK4I5fYtcfncUVzVDFQt5cyAUkDG4sD0OEfGDjyNTC0EPH38iGwX2bS99eLueTiGDFo5m91bG0uGcfh3bNWhIVnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 6/9] xen/arm: Use 'u64' to represent 'unsigned long long'
Date: Thu, 15 Dec 2022 19:32:42 +0000
Message-ID: <20221215193245.48314-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT115:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: b9dc1ff5-ce67-438d-fa59-08daded33216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hcI8wzITBlIYSsQbueLKolg6oqmYV27f0+Sr74em5i1+1P5cKtAOmjznWtO1EftXHZxKq/FiXce7TLTdaDCiPpaM+AVf+iubHSV6mO5j9f/O3OgpHwT/zmXpPN/YHzci0S+mRu1prf7WyEf2Hh0MK+ARpcVfSz5CMb5aEzvPsiY5K7C+ADHxyCC0V/boFIBX6nFnPiJZ1ZLa6rMsLd7BzcDvgY9RJn6JGMRbLJ5ZtCETcwxjD7TM5FiiJk5UXBCdU2svo+Q6dhCpqRK4De3rJf3fcalhrCzYNQ07ZdmTbR53AEL4tJ6D3DC6cazlk+SAekY6LUVj4xZo1ZmE+EYqFVTdwqPwtCEZRJIc4B435C0Ea17U5qqIGI7vumbVPHS22PHWIVudPqu9yULKXXPu702MyZypOR08TBpL10+zFPjF0LcX4yxDG04gSFlT3Wij/+a4yDe63VY+B6Jq50p3t4uEcPqHDBaEKzjdJCgWuM39xu8r6jSBgN+bCilEcph6YXciSPnz6iVTnj6hE2O+fUBLCSdWirx6SkHU+s92SHEYxWrB8FTewFnPbDEtjcrsjoIty9UcWRvZatJajKuQVWsNb9O0ozZBBi/n1YiBabUefJE7ax58/PwMYl0mQ+kEM0PNmy5A/mQ51PBDa/0V1JAhe/0aS67Xr+c41hnltNxytOLm1iRtCM0gU8/5hBVIVvqZ+6OteQ/x7xYHR12lIXLeVFBISVkFw0/2xqA/nmvNU6J0iGzDfdI6YEDCb7HjzWDelFgwKGpPoxYAuPv+7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(36756003)(2906002)(26005)(8676002)(70586007)(186003)(40480700001)(70206006)(41300700001)(478600001)(336012)(2616005)(86362001)(1076003)(103116003)(4326008)(47076005)(426003)(8936002)(83380400001)(40460700003)(5660300002)(4744005)(6666004)(6916009)(54906003)(316002)(36860700001)(82740400003)(81166007)(356005)(223183001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:08.5397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dc1ff5-ce67-438d-fa59-08daded33216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700

bankbase, banksize and bankend are used to hold values of type
'unsigned long long'. Thus, one should use 'u64' instead of 'paddr_t'
(which may be either u64 or u32 depending on the architecture).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/domain_build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c537514a52..e968b9812d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1741,9 +1741,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
                                   struct meminfo *ext_regions)
 {
     unsigned int i;
-    paddr_t bankend;
-    const paddr_t bankbase[] = GUEST_RAM_BANK_BASES;
-    const paddr_t banksize[] = GUEST_RAM_BANK_SIZES;
+    uint64_t bankend;
+    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
     int res = -ENOENT;
 
     for ( i = 0; i < GUEST_RAM_BANKS; i++ )
-- 
2.17.1


