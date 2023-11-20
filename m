Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F717F162E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636898.992606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55aO-0003jo-Jv; Mon, 20 Nov 2023 14:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636898.992606; Mon, 20 Nov 2023 14:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55aO-0003hh-Gf; Mon, 20 Nov 2023 14:49:16 +0000
Received: by outflank-mailman (input) for mailman id 636898;
 Mon, 20 Nov 2023 14:49:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1Kk=HB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r55aM-0003gw-Pz
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:49:14 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f75e4e4a-87b3-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:49:12 +0100 (CET)
Received: from CH2PR19CA0020.namprd19.prod.outlook.com (2603:10b6:610:4d::30)
 by BN9PR12MB5098.namprd12.prod.outlook.com (2603:10b6:408:137::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 14:49:08 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::b4) by CH2PR19CA0020.outlook.office365.com
 (2603:10b6:610:4d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Mon, 20 Nov 2023 14:49:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:49:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:49:07 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Mon, 20 Nov 2023 08:49:05 -0600
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
X-Inumbo-ID: f75e4e4a-87b3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVLIT7ovbnt6c0AoWfHLF9dnDD5cm5/Pyiikg2EMSg9W4u9ODMiG0O2QxAbyWCSCrdfEKKEYvR0oXHkaEMH2OgPIHpllvxg3cC/cozRq8XYlulNPwLS6tONezt5p+WyaFub1GD49iwLFfkqB8cOM0B9QSlx1etVl2dmORgb6elZUIcmTlCStJnPMTo40uheKfn6+uMcj2QPFcsj/ZHdw2oghM2MJ0+FaPyEfzLUx8llA8M757gaH2PnWFwlo24rvGiI4kSW2OugFs3NKxhOPsOmN6IOd6eEjz+q6zYZ9CIthMJUpDDZ4IaF6tvN8tSzmv2Or3XrMHbKEZFLhr1XVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lSlcj8484vSqQqESjqTujUe9C8wy8Gs0APPg+IKToI=;
 b=hn8642kr4Azg792W1ugrL9Yy0s/3BYbZpPs+SD6t2rWU1gUK5BXyr/KIKvyuCT7J7F5/tSk6TFExa5EryOMVbl2wGwogU3gNrlGFPDyQoBcqp2Gy7nC3KymmWt40VGSUEmmH9q0+BQUlnDa+i4kvBXN8TP97FOXvUWonlElwhoE3VxxomF6LFKIlW0Tc6QHlOBU8a4z8bVienoqp+KEWYFlpP+4Fk6R2h58YTm9uys9nuUrxv7EL32FPprN1EzoCxTdJ9QHhIKVn1uZW0AzB546SJrjHlt6XXop9EdH4Npyp11D4UnscPsqth/HJWKjFWwmRb3Xx4AdW9xYriFtaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lSlcj8484vSqQqESjqTujUe9C8wy8Gs0APPg+IKToI=;
 b=uigv6RzCCCjhM6hA02P/MjFQsQqXLvfZvBGhqmuD3Hj0eJqVjWz/xAydA4L3dnO3B/28Z9rUHyy6/a87J0glNkTkwJnT/BVSx688pgIxuXk9cXJLrD/XFLZxU9G9r62I9smlawYMp8oz4jgwm49WZPXv7JWlQOpEfszNV/wTe5Q=
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
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <henry.wang@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 0/2] xen/arm: Split MMU code as the prepration of MPU work form Arm32
Date: Mon, 20 Nov 2023 14:48:57 +0000
Message-ID: <20231120144859.170965-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|BN9PR12MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 3decc36a-6cc4-427b-0e0e-08dbe9d7d966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Av5o4TIs39eAsVeqHxjMjQnm1hFAtNbCyOpqQ/BNfZeJurvFhxgFvaj6heYXU32cEs/1IOisaN8JoljD1Zm3SaocOElrazmXBr2mGxH66JTDQ8933bGE4XHlm6BPCWnBYuosEMkTnGonFk/C9Ou1iMCkdJaLPfaeerrpsscg6aZWT9elpYMIsXMJ3piM7FTkf/3x79+ueAHE4cy3KiGxG7CGjWH8aiqzkyK/uGc3bpJadk84y8/Misyd7Zf+rGEh71ztIi12eg53XMQUnJD0FVGSw6ZzPScrheNW7/5S5yYS8JYH3PNYe2+QdsUMsULt7m9Bd0Xo10srPK2a1kGwlF17VoEe84Hqz/9ff1XK2Ko0MQd/BkzDYtIjE2Xs5I+jemvucKjNAXia/9Y0QhJZgZTIoAftemivajjMq8enfdhShF+hC7rd8egAz8M8eQu5jrt1XRjnPXtOtjyWf8Czz5+ftCfoOqY4HSEYs4npOsTinvibvFfr5HQ93fwuKTJc02kwrlIeTwljXiHis8CYtTU5V5Kxcs0x8IkjrLyK2t1Ks7Z5+t8eHR7KUXthcWuteJRykTaKMCTVBbg3bFI1+h7LeqhIYsKac2ng/XGEKpebnSXVlCTAKF8IhZ37b6eifM8EGbHLGdPShRRTvLUQjEO2zRKlAIU2hRXBcLQ8kZfo2LBKSjjZakgitym0RCDJ000ZtPWx3sflgOGklNy8gT39/eH3axYqiNpPNsbpup/IzY5YVZO4gx9lMCPeVA21sRYoBPlEi1hjr+FR8NFr8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(5660300002)(4326008)(8676002)(41300700001)(8936002)(2906002)(70586007)(70206006)(316002)(6916009)(54906003)(40460700003)(47076005)(86362001)(36860700001)(478600001)(26005)(1076003)(36756003)(6666004)(2616005)(336012)(426003)(103116003)(356005)(81166007)(83380400001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:49:07.6860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3decc36a-6cc4-427b-0e0e-08dbe9d7d966
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5098

Hi,

These are the set of patches based on top of
"[PATCH v9 0/8] xen/arm: Split MMU code as the prepration of MPU work".
This is the preparation work to add MPU support on Arm32.

Changes from :-

v1 - Dropped "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
and "[XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU".

v2 - Changes mentioned in individual patches.

v3 - Changes mentioned in individual patches.

v4 - Changes mentioned in individual patches.

Ayan Kumar Halder (2):
  xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
  xen/arm32: head Split and move MMU-specific head.S to mmu/head.S

 xen/arch/arm/arm32/head.S               | 587 +-----------------------
 xen/arch/arm/arm32/mmu/Makefile         |   1 +
 xen/arch/arm/arm32/mmu/head.S           | 575 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  59 ++-
 4 files changed, 646 insertions(+), 576 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/head.S

-- 
2.25.1


