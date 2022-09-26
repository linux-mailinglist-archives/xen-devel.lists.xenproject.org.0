Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A95B5EA245
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411618.654613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclui-0001hT-4J; Mon, 26 Sep 2022 11:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411618.654613; Mon, 26 Sep 2022 11:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oclui-0001eh-0g; Mon, 26 Sep 2022 11:04:40 +0000
Received: by outflank-mailman (input) for mailman id 411618;
 Mon, 26 Sep 2022 11:04:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclug-00019b-6t
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:04:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01cf9f92-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:04:37 +0200 (CEST)
Received: from MW4PR03CA0189.namprd03.prod.outlook.com (2603:10b6:303:b8::14)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 11:04:33 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::8f) by MW4PR03CA0189.outlook.office365.com
 (2603:10b6:303:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Mon, 26 Sep 2022 11:04:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:04:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:04:32 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:31 -0500
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
X-Inumbo-ID: 01cf9f92-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0YNg4e+aMJMRWBjQKaGc3NI/fTKBZ4O/4OUvO8G8iUOB7XMciy2l0+bQBRNd7dwXWxO+JJYmetHVVpdv73V372FTsVd8SB5Z/hw8nmxcEmv8arEC6mIRrYsnzPhKi9zfvjwFJ7OVD0UwCUvR2j2eW2FZC3OkAVMRENAHvmx3txf9bP36Za7rn6l16OdqqmvL5Co7xpmzp5d9XOXVwvs++Ase93wqemQis44H27FFU9lsNuFm09K+4o3h5rTG5wM/ETz8es1i17benRZ5wyxt6yctljXX9XyPZgPd8mhtFY1Smv5zw0n6/V/kCDoexkhqibTqqUVx95Tsg9jXwjO7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNgqClqMiM51F2XPe1n6tn6T8qkG5GsnlFend6N3M50=;
 b=aXHFK/KawR/VVCguBsseHEI9NXS/1VyjYFawEi3/pVCefGDGayI5W21dyMsf1JyilF9Q7uD7XEhDPnMVJYYTQgB2gjsjaV2ILi1SG2VN6AnjhTXvSyg9JPPynzA/wE82SnAMZjuCTUAoFh4l1QpOYnY17hq0l16W+eTfwuvkd9VwwPzyib5ofTLRkXVpJVwbHG2kRnMXA0WqEkxD8TpYynw8kwldTwQ31oI2T80E+DVB/+LOcvS3w05kZmj/m6mQlqmL9N66ny/Fy4z9647rKYRQ2uaR1MJI35hJC5j+PeRyPCheITKHX82FmElvloQRNVyAGmbUJxAhd/BXPM3KtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNgqClqMiM51F2XPe1n6tn6T8qkG5GsnlFend6N3M50=;
 b=nDP4JByeE5W4p5BaIG9MF+ToefnE8EMNwhI+uZ7f9USV20qD+f72Q8ZEPTu8xrcVxbKDvKWkoqIJqoSt0mhMgBqDdr+hLw14Ue0yXbdkNxLniBle+tIWSALXsGdPYvZSuon1xntMi2DvcRt01UpQKcnX1rbpZ9K32voAcvBIFGw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 05/10] automation: Add Arm containers to containerize script
Date: Mon, 26 Sep 2022 13:04:18 +0200
Message-ID: <20220926110423.26030-6-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 7666bf9b-b8ef-46f4-eb58-08da9faee486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQeLAsifxt/OmEZ4xc14CGlAKKi/U83cO3zVNY6xI33/mh+ONFmLMOQ8F1Yu0ahYW/d198Urv0aVrGxCG7AAYFFkordJE75Ed9rPMI3mce493QpDp3hTC07CHMigjxBJ3TZuKxmBmW2TiswAB99F5H1SacL30Q25wItSyOrY8jYktao1ncJWhCWkyzXwXGY4GJGAo673QjdCWe5DNFLfZaprd+Rg2dFL9vDlu5h04VeZWx3eOJprtPbTxvkJMUASd7y8jXh+1RBcAHxaOVPrTl2OvRy9nYs00g7xigjMZskqTWGSTzLIODjpdNQL7tAKB66Fu+yXJ7bji6dhIe4WLGATFCPaZFWbcO4/kbTvO/x4GE8ZQxSJFhFYgAV/WuCFN+N94R3ySlusy2H/W4d0ZodnusswHDunEvdOrlmZXB7kPqGFKpCrKQq6Q0ql7o1HoH5lokWP2+bFNRz4S0l2th2cH1S8evT1kJeN4fli6DFLaWg4/HTKEbyUjlwtwe4m5aEjy0peL1kaKiguqockaIdibvKQKbIe1FTKIkq5fgYCEcUAAJJDn/r18/krcAWINJJeAzJ21ZugcgTJaKGf2i01M2cs/1PXll2nTGkeX9dRg+eBu3P3PffJrQyyTr6OEJmDzi3ssc8y93cKvzRwqRe1/XWWHYhAjikHgRP0G9UN8ZErrt/PTJbWXM70et1eQ9d4IkUsL4+7/uBTQf+ZmfsjPAzAPRyfjsjtRS0yMdphb6vgBlm/HREuZta1LXZFJ7FtNisVl1o99EbdxRIK8RJNFjDyntDaWwgxQ6blRrAkdpVBq4l0DE58jhrAW/3M
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(356005)(336012)(186003)(426003)(36860700001)(2616005)(82740400003)(1076003)(26005)(478600001)(6666004)(41300700001)(8936002)(47076005)(70206006)(4326008)(70586007)(8676002)(2906002)(82310400005)(40460700003)(44832011)(5660300002)(6916009)(54906003)(316002)(86362001)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:04:33.1644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7666bf9b-b8ef-46f4-eb58-08da9faee486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669

Script automation/scripts/containerize makes it easy to build Xen within
predefined containers from gitlab container registry. This script is
currently missing the helpers to select Arm containers, so populate the
necessary entries.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- modify commit msg to reflect that we are missing helpers but in reality
  it could be possible to use Arm containers by specifying the full path
  to gitlab container registry. However, such usage is annoying.
---
 automation/scripts/containerize | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 9d4beca4fa4b..0f4645c4cccb 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -25,6 +25,7 @@ die() {
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
     _alpine) CONTAINER="${BASE}/alpine:3.12" ;;
+    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.12-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _riscv64) CONTAINER="${BASE}/archlinux:riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
@@ -35,6 +36,8 @@ case "_${CONTAINER}" in
     _stretch|_) CONTAINER="${BASE}/debian:stretch" ;;
     _buster-gcc-ibt) CONTAINER="${BASE}/debian:buster-gcc-ibt" ;;
     _unstable|_) CONTAINER="${BASE}/debian:unstable" ;;
+    _unstable-arm32-gcc) CONTAINER="${BASE}/debian:unstable-arm32-gcc" ;;
+    _unstable-arm64v8) CONTAINER="${BASE}/debian:unstable-arm64v8" ;;
     _trusty) CONTAINER="${BASE}/ubuntu:trusty" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:xenial" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/suse:opensuse-leap" ;;
-- 
2.25.1


