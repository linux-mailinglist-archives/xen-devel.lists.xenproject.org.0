Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4156EC7C7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525207.816255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRl-0002yv-5f; Mon, 24 Apr 2023 08:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525207.816255; Mon, 24 Apr 2023 08:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRl-0002wV-30; Mon, 24 Apr 2023 08:21:17 +0000
Received: by outflank-mailman (input) for mailman id 525207;
 Mon, 24 Apr 2023 08:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QOl=AP=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1pqrRj-0002wP-Vm
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:21:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95f1e33-e278-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 10:21:13 +0200 (CEST)
Received: from BN9PR03CA0357.namprd03.prod.outlook.com (2603:10b6:408:f6::32)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 24 Apr
 2023 08:21:10 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::77) by BN9PR03CA0357.outlook.office365.com
 (2603:10b6:408:f6::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 08:21:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 08:21:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 03:21:09 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 03:21:07 -0500
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
X-Inumbo-ID: f95f1e33-e278-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODVvUb8/A1qqPkqZu9yKtZIpIAy/SDXJ16edM9t6iRCp70Z4YsTdSE1MrzpGUazuraQn6hN2h/dAtob5KI0jepWNeGvS9UJXmWdYxuUj1ihFLDoryXj/KKHkbLNRGNzfSyx45j84Qn4r12zgcooWbA+glFy4+gYhFj9NtVpSeUN16G9amay6gbLyqTL6E0CazQUayVxjSje3cHpYW2eAxmW7+TL9EDc7M5J34h21TNbSPyWcDaGTAj85lIiJhio8L1K8Wq5gPYYuRQZZxsevdu4TOE2P5FQXE9SF8LxbOZg8Sdj8OEnbVfu5uQD4eBz6GYETB8D/zC3j/vERd+a/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AT/BDH1B9LopiCynqMsAL8ehH/tawPNLS5lO/XRNmc=;
 b=P9+3r9+dEY+Tqvz4mJ7HQsag9IMrkDV9ViEZFHw6W7wQHJxjCM0G2yXpXeCgs8fgI+Enz5aV2AH828JeZxtrbVPLVNq01M4K359N4vZc2xNuKxo15V+lE8Dyifq3kVoFosKVlnKLEZf4yi1mv1559l3yn/N+/NIILqzne/Bvmi8ChB9rzB3eKoiBzaTsd0rfgLb0ap1lCnUmkhQXEeAjmdZGkik3buYSfR4h5v6uXRNgYwhT527X603Id0gVCDJWntFHCAltDxlyXv1Zv5AxQiNzQ2Fd53iY0Kr1cAx6bBX/sZxHmqOluhQ54aTE22R+kfMyC5WLoY4dRGhRPM0CVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AT/BDH1B9LopiCynqMsAL8ehH/tawPNLS5lO/XRNmc=;
 b=D6JoYHdkJVKqGfvq7KX7gr2DSJ38KW5FloBL+xJNqJ9XaDTjvQOYJqsbHUG/XAA6ZtZcppBEo8Y/Yf/wU2/8nDIKt1vWT2YULtVM/xOh+ImwQmQ758nhaz9SSrenMKaqk2qMsX4QviT+LEOYdpljtMO2a+69UEwz78zNIwDZ9wA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 0/3] hvm: add hvm_funcs hooks for msr intercept handling
Date: Mon, 24 Apr 2023 11:20:35 +0300
Message-ID: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT044:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c06adc-0a2c-483e-cf36-08db449cdc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Abs+Qrpc1KbgY1r4XDSzOljBor7/pIBCakAwdD3yEypBNfAy1fBSWwbOuNxrrBkmVbh3jBRW1RvPIMdfEgxIN+rWE5y/6FiAeIuw3C8qS4NrOq47y0Y4lguCVyl/ItFm/jqCbwy6xhMRYWVmnm5r90ZwoYrIM+ywpsxUFu2URVLw2whTyYtldL68ajqQ6Yr0TL+9ufMhHUyQxblUmGC18FcbrRtSKRMxrryydAcmcBXPHdvB210rW0MMkWD+wcyQsy61SX25Uf3GSb02H35lKvETj5K5lkby4ctslYGnRWKu5sU4ix9nKDGEmZ/afg+WrWU/AS2P9bbQVlngZ+CGXW6k3MHUuovXG3u1plYdNXs4sWjGqN++Hk1OQ+BEDiQD+d/qPSlG+hY7TKrSSr9RnFkh3C13dOxzxkUigz9rmyBAORgb0/B/Swi5S4CATCdEZoG+hpb5kLVNVSI3Rxo9muor8pkwSzySAnNCzrXV013ZOKDT6A9WoRJveMuBZEHCgDiYArzPGWNQiNSAhHTw4R2ojyRNT7JNgNeQlDxPFCJDyaff4Tl2IuUJJWctpi/oYeGpjtmReqmB8lMi+hQDxGf/OAPA4kLgP3jZ5q+vDYdqNx0JUhILFmd7py8PWmbezT+pHTNX1bw82k8nnBwr3MpAXNrM6q0yHSV8sJQ0H1mMPKkkL4eNb/pgXFzeJh8XLLYsmcellGTCfYPloVcS8GhWLRh/N64bTFN4Zjoiz0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(478600001)(6666004)(8936002)(8676002)(316002)(82740400003)(6916009)(4326008)(70206006)(70586007)(40480700001)(41300700001)(54906003)(81166007)(356005)(40460700003)(186003)(83380400001)(2906002)(1076003)(26005)(426003)(47076005)(336012)(82310400005)(36756003)(36860700001)(5660300002)(86362001)(2616005)(16576012)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 08:21:09.9543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c06adc-0a2c-483e-cf36-08db449cdc05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024

This patch series aims to make the msr intercept handling, performed in
vpmu code, virtualization technology agnostic.
It creates a common interface for setting/clearing the msr intercepts and
then add hooks to the corresponding hvm_funcs table to be able to call the
svm/vmx specific handlers through a generic hvm wrapper function.

Version 2 addresses the comments made on version 1 to ease further review.

Still there is a pending question made by Jan, whether there could be other,
than the vpmu one, use cases that would require msr intercept handling to be
performed outside of virtualization techonology-specific code, and whether
this abstraction is actually usefull to have.

Xenia Ragiadakou (3):
  x86/svm: split svm_intercept_msr() into
    svm_{set,clear}_msr_intercept()
  x86/vmx: replace enum vmx_msr_intercept_type with the msr access flags
  x86/hvm: create hvm_funcs for {svm,vmx}_{set,clear}_msr_intercept()

 xen/arch/x86/cpu/vpmu_amd.c             |  9 +--
 xen/arch/x86/cpu/vpmu_intel.c           | 24 ++++----
 xen/arch/x86/hvm/svm/svm.c              | 75 ++++++++++++++++---------
 xen/arch/x86/hvm/vmx/vmcs.c             | 40 ++++++-------
 xen/arch/x86/hvm/vmx/vmx.c              | 46 +++++++--------
 xen/arch/x86/include/asm/hvm/hvm.h      | 34 +++++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 15 ++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 16 ++----
 8 files changed, 155 insertions(+), 104 deletions(-)

-- 
2.34.1


