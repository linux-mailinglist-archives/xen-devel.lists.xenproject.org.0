Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D395FF880
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423241.669832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPM-0006T1-RZ; Sat, 15 Oct 2022 05:08:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423241.669832; Sat, 15 Oct 2022 05:08:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPM-0006PT-Nq; Sat, 15 Oct 2022 05:08:24 +0000
Received: by outflank-mailman (input) for mailman id 423241;
 Sat, 15 Oct 2022 05:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPK-00069z-Pv
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 614f132d-4c47-11ed-8fd0-01056ac49cbb;
 Sat, 15 Oct 2022 07:08:20 +0200 (CEST)
Received: from DS7PR05CA0102.namprd05.prod.outlook.com (2603:10b6:8:56::22) by
 PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.21; Sat, 15 Oct 2022 05:08:14 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::65) by DS7PR05CA0102.outlook.office365.com
 (2603:10b6:8:56::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.8 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 15 Oct 2022 05:08:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:14 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:13 -0500
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
X-Inumbo-ID: 614f132d-4c47-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnAPJgoGSTmlEeb/+g+WCQZsuL15QSKDzRod2J7y3PmuwhWOR/wgVXFZExIRdDbnlH4nTEErhlwHRVRUGh76A6mQPnhVtKdZIy0ICk2nBNNaoPZZaW2EyyiK2d1GgBbAgCtik1J6LSUmu1Ss3+rnYwmIVSIU3aEbV2pNTX1TcTDzbqC0iVmLhf8owFMUl4c/SCmrMPgivFY8khtP1klpjpW3ef/QpW4XroEhjA87nLQ6ZwVXwKQ4evFIXwk6IgcGEs518PByFJwRLIdtsi1UAs5MBm0bwIRMGlfiqMoAM7skniWEzracEO3rtD462VPPPpFU3KGGdTY0RyCw8GNGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAQjlB7HyLijB3e709Vr7QvA7lbuariOB/trgP6DhHw=;
 b=I7lu8yLutpyjXyCOWt+FvnOW0wjMx7fSw1w+JirPX5QvRyoVd9LDiK0dfF1dHH98xvBVxvkXeLOT0G4U7KFouNTw4wf7dd6cFXMADXIKhRHXQ4NKM7vmRiXNJj9B3iK8aMwPuguJQGOZoOnwOuKosFhemkjbeOcBPJtEEGF+fQG84RzaAhlBLWPvjTQaeUK062P5p0A8TSE6Qfsq+8BGDPtUCZYWLwq6oSkhakpjb68uQtSlabh7su8KLgqyHHIGKCMRiOLCnSnfVXGSuj/6yYbRjdRiQdI57s47uE4WuEMAn697POkCbR9dcBuPVs0qV5Bt62lvSCQi0+f67UBv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAQjlB7HyLijB3e709Vr7QvA7lbuariOB/trgP6DhHw=;
 b=gNWpTTc2X0P77XawvBXjyo5bABbjESp8JCHWQ46dhoOEEd0z8sxBRgPO7uWGqO1/7F9VIWnMx4Jow39RDjjBREdn3K1FrCKKOMb6A3WkZKCnttllWvXVF8EzKw3SgWka2i+FbL9mxG/Wq9IXVGYdcxbuE0cDP2oaP+jPH2NHdiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 01/12] hw/xen: Correct build config for xen_pt_stub
Date: Fri, 14 Oct 2022 22:07:39 -0700
Message-ID: <20221015050750.4185-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 12cca009-9216-4280-9b60-08daae6b43c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Rnh+Q9j0NujYd4j95jGB26ZG+JYfjQE2/aLWnA+rA27CTHSEqvquEdHWVAyQBG6koPEv4pP4m4m/BG9C8nFkQ7sG+K2TInaoWdRCncVG37U14OJ6tqobO2PNCddWRj97FVw4TC25sD4fdq02THcDpcpBBr5Id29knpfHoK37Rh2ViQGEfd4UrioX9UmmkUP5h2J8GI1SWwyqgNJA/mzGFchDbusQK1GY+pr0ejk3fDw9+tlEGnSRIMzFpCsO/kYp0i1FFSXquBfSDYx2+KYI8B8aRFbMOP97B3lcIrNbmcXGnwx/4oA4xN/TljP128ahE2+rnJHCKBkoUftiSxvVkRMxfABTs2M0Fv8a2TB57s6xDkqKVIiAhr+xlXO9ZuSDq4ZKhHXaCgWv6KrryvsdUsImy6FzhYdd0LTc09jxkHDoJWoKh6Un/En21EbmUSnzS4w7kr9Rxqqu9Rz1LfXAaCzjRm6TlIaNYDLDjf6Z7m2DfynmICL3Xt4aQznC+HJmHEjoq7O8DGz9FAoqj+HcdlOilI+6qeWoucJvVMnuNrXKQAT3Ko8t7qc+yruTFA4hFZkXyFHueIC5dshuVeljyUa5L6two0yWJKqDLG48Udw9bKYHl5+icT9NhDRoTdGSJ6bzR12r9VdHsB6Z8ebyUWsZ4TZS+JL9Vq5u3tctD54/8QD8BpCHYqj3KNWVb4ffhWqIV8biSBWCpE05eSjEs4fkU4Hck4UNPaLj6frUQPfyoMs0uABqGWrhVDnz2lF4eSDnEofuVGEI5QkeMD46z7yFsfQRFv1ryrdeyHzvYtVbldSF3ZsRmFyar9l21o9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(2616005)(336012)(186003)(1076003)(83380400001)(356005)(81166007)(426003)(36860700001)(82740400003)(47076005)(5660300002)(4744005)(40460700003)(41300700001)(40480700001)(2906002)(8676002)(26005)(6916009)(70586007)(6666004)(8936002)(82310400005)(316002)(4326008)(54906003)(70206006)(44832011)(478600001)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:14.7101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12cca009-9216-4280-9b60-08daae6b43c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938

Build fails when have_xen_pci_passthrough is disabled. This is because of
incorrect build configuration for xen_pt_stub.c.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 08dc1f6857..ae0ace3046 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -18,7 +18,7 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add('xen_pt_stub.c')
+  xen_specific_ss.add(files('xen_pt_stub.c'))
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.17.0


