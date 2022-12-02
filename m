Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5380163FE73
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451356.709136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI5-00018K-CT; Fri, 02 Dec 2022 03:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451356.709136; Fri, 02 Dec 2022 03:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI5-0000zb-6A; Fri, 02 Dec 2022 03:00:41 +0000
Received: by outflank-mailman (input) for mailman id 451356;
 Fri, 02 Dec 2022 03:00:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wI3-000723-Ix
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f88d5cd-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:38 +0100 (CET)
Received: from BN8PR04CA0021.namprd04.prod.outlook.com (2603:10b6:408:70::34)
 by CH0PR12MB5153.namprd12.prod.outlook.com (2603:10b6:610:b8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 03:00:34 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::ca) by BN8PR04CA0021.outlook.office365.com
 (2603:10b6:408:70::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.23 via Frontend Transport; Fri, 2 Dec 2022 03:00:34 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:33 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 19:00:33 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:32 -0600
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
X-Inumbo-ID: 7f88d5cd-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3xY/TNAflg+TuVTWjm/PY8zVHOboQqaVNh6FWcVu7jKsED0vG63z73VNvtkfl41oHELmszFqvzRASmRdhtinZFssc/Z8Yf3U57cZkJ7UyghOBhlQeqRS5c7vdcSLgIxWx3VScNpthcteH8DrcWjhD8wczRRhsincBqJTtT5bPLa+UB0tYEIbl14iITCtJ+orUHkaodkqfXEV1m/reTb2Zd5RhEuRuNjuSCZ12m9Y6e0ux52PjJg8qZ9B286Kz88p3cn6eoySq8xRQYxxyOWG/EvTgjaekzZYJ3fQLKkEih2PL4xj1eZAvydACbnl8XV3sE/YQGIZ8l5mzX5cj6Vzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QyA1hInTjQHsfzQggbhvu7AdxljEXi43kOx4mS2afA=;
 b=G5olR//gugQRXbrPxDuaiA3ejMli9XRrmGuyyBlgJDNNWFtlYRc0YCQ7sNunla7JPLzWJNSRdwVxdAIJXTX+xj13rwe0atKlgQD/ZLCyMdOjw5pDUvX3DdTTYFqmja9WYvS85f4ohWsvqVVLF5fSwzXjq51PwLuBYZl+BVnsc5+OP19nkLTOeQjhyfN8Rjh03R1aZgkna33XpO5wLFMbLXpzkd1dgSyKbpP4AzoDAyItBzsb8zS0f6jSLDTVtJLTwS3oOYiv/o6MjdcFOtwLCwkddnUmmwSXiobia6frVyrBxgIuVJbGSkP2k+ar1jXkrzRwigJW4NjKuiilThsLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QyA1hInTjQHsfzQggbhvu7AdxljEXi43kOx4mS2afA=;
 b=R0HExe0yovK8+OGaQyOtdriL7fCjFNYsGnHLxlotCRvaKdGzRYeyIOp+JTIEp2pV++Cpsis8Be0ISeKPyHpzeBmckt0xy5vUAt6ez02vQXNAeKzp+2AmVG+AKI3U2lnC8OEUsAQXfn7tJmx/9qLMbQsJ+B7gulfTRcLtG3bY7eU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=
	<marcandre.lureau@redhat.com>, =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=
	<berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 11/11] meson.build: enable xenpv machine build for ARM
Date: Thu, 1 Dec 2022 19:00:03 -0800
Message-ID: <20221202030003.11441-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|CH0PR12MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 462fcba4-2afd-429d-e69f-08dad411617f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AX4cAWwXcC8sKiEckc3lLrpYOnvTD3I08gAdmPLfVP33S934U5mjqmhXt/MFShe3wfAUreoJwkgDuj6w8FdD37DQkG1xe0K3fFgmizsxBC5nXxd3gz/CybNJebgYP6z84mA9HpUC01ot36gCpqsx2bsU/b+bm6A2sL4HhEDIdmw/SyzQkJQicwG7CkUl/AbS19Y7VeN6hBsD+137rqF3jmth+clo6TLWQN+GcR7JB+X6hD4cYWc1dlyoCqZHomnLWQ3oAP78cKezX4jcf1/yo2Nbj2BmhlATb16ENzbTn/KeC8mdVCMno5cW/8spFzRLsB7QXLLADps4TubzSSSyK1n3jOdpoewkd6nSHn2xZIICQfUFux/5Jy3dQdVPUx0E+YzEx5kOQJW3Cxdqz3OSfxwKucChDP8/5s2PaKDCLRQr/6NbeYA9L3U/J0LnawlQ7fopAyeDhjk3iRm007TXLDy28pMbwYpw97xuqx1LgOzY/7eQG/imYikB7UYwGP5n/RTF94QMb6S1U0mSW6n68sFmNIOR2P6pTqv71CQ2y9TTOJ+xS4TFds2d9MwK8+4t0664OqXUwJJYe7suhxqVsDtP1Z0prX/qXdStXqJNaS/3Cs1V9OrZdFglolHGyKQ4EWwCMULwryKzO/hbUArkpB6Cm2cQB18KakQtOKRIeh637g5BT9EPhapFcBWxdtLqYZMreYyGVZYfw90LURu1L4SjvHv3e+YgAqvACfGKg4I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(316002)(478600001)(70206006)(2906002)(70586007)(82740400003)(36756003)(86362001)(81166007)(40460700003)(54906003)(356005)(426003)(66574015)(36860700001)(40480700001)(336012)(83380400001)(82310400005)(1076003)(47076005)(6666004)(2616005)(186003)(26005)(4326008)(5660300002)(44832011)(4744005)(8676002)(8936002)(41300700001)(6862004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:34.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462fcba4-2afd-429d-e69f-08dad411617f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5153

Add CONFIG_XEN for aarch64 device to support build for ARM targets.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 81d36420f0..a4965251ab 100644
--- a/meson.build
+++ b/meson.build
@@ -125,7 +125,7 @@ endif
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
-- 
2.17.0


