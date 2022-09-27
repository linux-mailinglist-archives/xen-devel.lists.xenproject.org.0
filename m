Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709775EBEEB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412370.655692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bu-0007Hu-98; Tue, 27 Sep 2022 09:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412370.655692; Tue, 27 Sep 2022 09:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bu-00077v-2r; Tue, 27 Sep 2022 09:47:50 +0000
Received: by outflank-mailman (input) for mailman id 412370;
 Tue, 27 Sep 2022 09:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bs-00061I-Jk
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71673bab-3e49-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 11:47:47 +0200 (CEST)
Received: from BN8PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:70::40)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 09:47:43 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::42) by BN8PR04CA0027.outlook.office365.com
 (2603:10b6:408:70::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:43 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 02:47:42 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:42 -0500
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
X-Inumbo-ID: 71673bab-3e49-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMx5q/lqhdCAS8ZRijwOq0zCeodJTTq/v/jQ6Jd4pKhfWZrkGVHvOU4U2ODMPSx0ahyfp55z4Y8JRwRHqQJL4MByZV2DlVsjOD+GUNUwrVPQLvcmxTC4McAqxLfuFH3ox6TjXNllhQrUinlUamFvwUR61QKGUBJ8/mnpgq9M4/M4RQ4bYp6f5F8CrhU6oUQ0+4c9dOevWdpQJHeLg3SwQmyf78xxwUKix3GholrnBQnJtBOtNDiKYh0HWvXtgS/dEuluxqslC4IITJzLAX4NE7XvXfYkR8fzvh3EZEFUh7rfsVSNwFNVqAdIVwBbv6c+WylZLxb86mrXkCVoCSxR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BkCI5sMztbbLhSxOHrHUT2n0YV/0QwpHvM7jmt3qWU=;
 b=YuPYKli1mudy3rg9WBzoYOXoBfKh/QwYetV7G1swc2xO032VOhg5TaOMMA9cfMgit3V4dhu+c75SCL9cGneOjxH0iCjafbNas6Rk62wNRDytjbgVKOE79VNL+85ukB2Jwj45iMXaRPKPoJPNKdNPHCA9D2aC/Jfpb/0XJqcMVLBT0fPFugDmE7Tp9d2078WJStWrQScQO5OoA8tXB4g1GPZxYEQc9Pu5CZhnO/uv0TEuD1qcd8xG+EU7dHlVBcj5i/pm/VezKIk21FE325ql/tAw2Gw1NkwcNuQKSKzYj6IFcJstsLTJnR8ZJyeRcXDO7KVVk2XEY1VYm00h8r1Y/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/BkCI5sMztbbLhSxOHrHUT2n0YV/0QwpHvM7jmt3qWU=;
 b=vSvKfzIEu4hAwClk1VSmduKCsCuY3MNrKyjcxcg2RtJVxMxd5UhFAzP8d/ABgDQrY0vajCpa62gVbcXyHxkfXkX1gv3fkMLxiSXGtiLkpXrDZqgwwusJn4D4ICQzrF81HufuagCTUnlUu1/IjQn2cIE4cbh4WidzZg7WknDob7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 05/10] automation: Add Arm containers to containerize script
Date: Tue, 27 Sep 2022 11:47:22 +0200
Message-ID: <20220927094727.12762-6-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: ca7045fe-602b-4aa5-1436-08daa06d536a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x0BjoSJ7ylrumMcyvnHR6tNmzvtq9/1nBtZxbeDf69Yc7WPvsgYtLOmlVdM5YAtxNdy/2JPRblTcKY10pht3xbOZ0qDLeR7Qj8mtpnC4IWywEYjHETHIIaEHu8XGxkWzEaC0uqmBa0pfyf2BHu90BQ+gcwkSjnfKmNRaubipBaovFnD9glTovE7tXqm0GTQ5lPDupTqa+/5R9i705UgIPwB6XPJw5/LXcSzB7XhL+QToekiaC2o2JUHtsO3EFFa5EBQhZE/KOdBuxudDntF2KJdTxGtDfoxutECGU6D0Owa+T7sxrFzSD9y4powhWi8RAOoSEutnFf3v+L0xqynlNDoVsxF174RGRM8UvGlIMKsvuMFSuPe4P3HOx+3tqLKJ8d93cFPcJD99d0DifRb9pyIV4owWWJ/2gA2iTSKFqqbywHlzO9V+cvZxl3bT3Bv2xtA9e4k7Vle69gF01x3vXpM6eMQD7luWXeNxCVRaOx7VjevW1dYe2tkuQDZS0RIY06xmoENeOAKALr1yCzrbBJina42Jcb4b4/o7h374xB4EFzgTQBqket0SVtdFazvX3EDx9x4TlhqiMEqDAmkdBV32Mjz/weuFFc8h4RcauIRIpl8qGn4XnY30GpPdUqOJiibWL0naCltBxcedzYovGDHVnwmdEmettA+2rS/G5oWLw+ynAZe9OTvi+lLVMWbuKjlXBlCVkgTcxC0FYVDE8jjU1z2KK1HQL/bV06AaE6R7E7loUEHFJrgfopmvyahh8CCbxYND6g2kugO/nLJgEdtABA4JEA0YGGSyATZ/wPjTkNWJW/XnZktz2Gtb4mZJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(47076005)(478600001)(426003)(5660300002)(6666004)(40460700003)(186003)(336012)(2906002)(82310400005)(1076003)(26005)(40480700001)(44832011)(54906003)(2616005)(6916009)(8936002)(70586007)(8676002)(70206006)(316002)(4326008)(82740400003)(81166007)(86362001)(356005)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:43.6905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7045fe-602b-4aa5-1436-08daa06d536a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337

Script automation/scripts/containerize makes it easy to build Xen within
predefined containers from gitlab container registry. This script is
currently missing the helpers to select Arm containers, so populate the
necessary entries.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- none
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


