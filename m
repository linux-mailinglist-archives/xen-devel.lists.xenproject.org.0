Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE0D62E15A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 17:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445284.700425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhZm-0002LA-Ic; Thu, 17 Nov 2022 16:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445284.700425; Thu, 17 Nov 2022 16:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovhZm-0002JC-G0; Thu, 17 Nov 2022 16:17:18 +0000
Received: by outflank-mailman (input) for mailman id 445284;
 Thu, 17 Nov 2022 16:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N1RQ=3R=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovhZk-0001oH-8v
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 16:17:16 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe59::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a046145-6693-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 17:17:12 +0100 (CET)
Received: from BN9PR03CA0493.namprd03.prod.outlook.com (2603:10b6:408:130::18)
 by BL1PR12MB5031.namprd12.prod.outlook.com (2603:10b6:208:31a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 16:17:07 +0000
Received: from BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::aa) by BN9PR03CA0493.outlook.office365.com
 (2603:10b6:408:130::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Thu, 17 Nov 2022 16:17:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT111.mail.protection.outlook.com (10.13.177.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Thu, 17 Nov 2022 16:17:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 17 Nov
 2022 10:17:06 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 17 Nov 2022 10:17:05 -0600
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
X-Inumbo-ID: 4a046145-6693-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7nR48rhnYLYGrcszkpBk0h3w6i2BytVskAKjreitIN/THhGTa+PpK1WodqXckRPFYNm5BPylqRhJfoLLCBrM94gGc+DvjSvmp/xe4g1UG2qcpDBcOWd0Qf71aT97ATUrE5uccWReTz8ivZJZiNyXITViDETvEMvLWeQdZ5XrGydddv8ZYF/K81RQcl5CtF68AHFGufneeYWp23K3FCu5dhEinLqOh4n9NTl5oHFBBKeQ4lDjHk1RdlIPxdd8xcr/J+8ke0TI2n1/YBuODEXIufjoof4GWkT+uVMjmmUf8ff2oYQ6htnyCoSKRre+WXxsh56ObxtRaT6n21Rolbb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RW7thljiMKal3UEr0R4gYV8ZGNjwhwvXXRVE7RI0io0=;
 b=FkvioHhzGavfBHt2cYZ8JDPgoB8lzqlnhVFCaQXZwwPbnH7aHYpsrhWeG3pFL3HvpeJ4yPAnq4YFj0dnBW6AmueHg1YQ4F4FrLqMUlOEstasLsU2vm4EEz7uzd4MhAPYiY1SsDx79cQ+jA3dA2k97e6k8XQW00zPuA6O47C+8E1MDrCSbjkleiZp0F/FCr2APWXu+1GMBpQGijliqI+W9ekiF0BmAK0W1yElceNoCphR8+/mJjQnhfh5P6ImdwmyVuwUkcNOWSqmbf+Rh1/dn3TYSfo8S0yIjFiFEOQ1ZyRsgi01mkR7p0GmrCYdsRZbwhf2semKnRoYPD1fbeiCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RW7thljiMKal3UEr0R4gYV8ZGNjwhwvXXRVE7RI0io0=;
 b=P+nklj0vT49SWo1DhL1R5DdeIPEWmYPqnl3EEosnw43X2L0IZt+dC3/nHkoPjZrhHoP2LHzJWFJsV6bzLH3TaNaPM07SXxHqBFOml/nED0HSWIF/oLbccv3/Jp4xyhmohYa3jilVfbfvRbCHnL3N0KoX3s2tOt94C3Tlx32SjkY=
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
Subject: [PATCH 0/2] CI improvements
Date: Thu, 17 Nov 2022 17:16:41 +0100
Message-ID: <20221117161643.3351-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT111:EE_|BL1PR12MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3cabea-b4a6-4d09-c984-08dac8b72be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9hjzd1k3o8QP8RDqO5ApkFXM97jKbJ6gfYvx/1S6gCyG4UN3u+G/lX1oyKz0TjFOoAS8ZdtYLmmWVqgEatbFslAdOI0D1HWIzIt5zJghf6EYlsgYVZvDf46dfsuBibJ4lgnBl3vNZPMA7TdAgMYPIYR6hQC18zaN210alWmqiTK/KftNgm13swp7InjAdfhMs7LII7xzyV27548nUB8BfQrWp6dnSBdXWeF8y4MPPNZduuzV1c1bdRi41ZPBsZyaUuAQvRP8KHLOY2LDEcB6mNScxYFuU/8PKMBBjjEwjreN+8J6rr5zxiS2I68DAgUvJz/fbk7WhA11y73SedMXW9SLTfjJvC/WK2rJpD8LLd4ohLrpSiJNvBVMJulOs1KatveK1jpr8arua0WKoSy+o0n22WORMCzh0DcAGxXakaVRgUwDbOjVLzTByiTDomF10phxwWBf50fHgpvQMu8cAxZeNUzOp0bDQPk0q2uH2tPi/T4ttGRyOpyYtn6jBIfdCSBhiBh6W5cp55sDxe/ioIp9BhZyOoIMl74LKiPJEiB8H4lNvkuZ8h7BUFoK4L6cGed2tTkcbDMSpKSEdLMWMJwVCc+YeGCZaAcAvqwvUwJNAkjbKVh5xKgVOLD+MOB5gTLcT4vaRONZMb/zmWP7BkErQrkMuiYZUToA9as7Bf6ux3akJw8E9yEWYqKLAweeF6nmMqddvA9NI9r0ndnazpjsBcaHKbCkokq7btxsu2VgUsLv4nFmqxujGoWqYsDUbdcyYHG1c3sNQZL0yT8Wpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(26005)(82740400003)(82310400005)(356005)(36860700001)(83380400001)(81166007)(86362001)(40480700001)(966005)(478600001)(5660300002)(316002)(8676002)(6916009)(4326008)(4744005)(6666004)(41300700001)(70206006)(54906003)(8936002)(70586007)(47076005)(426003)(40460700003)(336012)(2906002)(2616005)(44832011)(186003)(1076003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 16:17:06.7189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3cabea-b4a6-4d09-c984-08dac8b72be9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5031

This patch series moves the installation of packages at runtime from the test
scripts into the respective containers.

This series is based on the CI next branch:
https://gitlab.com/xen-project/people/sstabellini/xen/-/tree/next

Michal Orzel (2):
  automation: Install packages required by tests in containers
  automation: Remove installation of packages from test scripts

 automation/build/debian/stretch.dockerfile          | 3 +++
 automation/build/debian/unstable-arm64v8.dockerfile | 7 +++++++
 automation/scripts/qemu-alpine-x86_64.sh            | 4 ----
 automation/scripts/qemu-smoke-dom0-arm32.sh         | 8 --------
 automation/scripts/qemu-smoke-dom0-arm64.sh         | 9 ---------
 automation/scripts/qemu-smoke-dom0less-arm64.sh     | 9 ---------
 6 files changed, 10 insertions(+), 30 deletions(-)

-- 
2.25.1


