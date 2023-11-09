Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC887E718A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629792.982275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19nS-0005Jl-1N; Thu, 09 Nov 2023 18:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629792.982275; Thu, 09 Nov 2023 18:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19nR-0005HF-UJ; Thu, 09 Nov 2023 18:30:29 +0000
Received: by outflank-mailman (input) for mailman id 629792;
 Thu, 09 Nov 2023 18:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19nQ-00018Z-DE
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:30:28 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d378f4e-7f2e-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 19:30:27 +0100 (CET)
Received: from SA1P222CA0038.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::19)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:30:23 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::cc) by SA1P222CA0038.outlook.office365.com
 (2603:10b6:806:2d0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:30:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 18:30:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:30:21 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:30:19 -0600
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
X-Inumbo-ID: 0d378f4e-7f2e-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4yZixFLDpjFHDdjjKU68JLUOTBaXWBtCc5IkGgzU9usZyLPJLFiMhD0uo2SNrqUOqV2BD4IpmcnXX/ZJoZig9dqiUA1H9GL0AJmjubHBmuE6IS8xWZ43b+SIAvEynT9rEvrAe13PgTt+F+0h7wP5sKAYjGWT5fta9J4YDk1aMlntsBKsVTjwUk2NfwOaCkYt682gLqqAfzNN2NlryRlvBTQ9oZ25CNUiI1EVS2I4Yn4qHDg6aIXCiXaQPjThM+7rg5w/RIRIeIAOT75oGZ6IWQgfqH9iKs/K1ABEafz5foJ9o2ZtdDksKkLSCLQS/CuQLdVdBDoCXsEgykdx/cZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHr13BUaRvQIk6iAQnKmYAAy2SJJ44qqEutcvtbxp+c=;
 b=gy/xp0zbbgNAeFFRpH5rtFY3FDSzZ7lI9Y+YlGQ8QW9aaG7N3D7o2fLt8frZ2qwQkPqIqv2mvVXttrZc3HxLiJjGzozgneoRWdV8QYRARgfWgjFHl0EcG6/EQ4Cr7MNqIPPcIL6GtMAZzuFE4Kh/AvwFqmmNYJnUTf/vMD+jEe43SpXG0Zkechsc/nKGOxziLBi5qHFRyTlVyZsrWOczr9CHYK337+7gfPOG814UxJTlm9nNk+yttzRwUBroCDs0/rlTOYBnN5EL3rgK81hlHhDrpqBbxHC8Pom2LTkENALVXEdErLe1WX5uVPFcChYfMmtGJrTWFZPD/r2g56AMyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHr13BUaRvQIk6iAQnKmYAAy2SJJ44qqEutcvtbxp+c=;
 b=UWbs/wVT2mvdWtJSd+sh2GaL9lGHMIBmPWy0qMx3mTNmkz7Ajno+zNE3hJeLU7YG3tythWcJvJA01H5Ru73VIEwZ0brHGEQtucMhdycZDFjaTKt0/22uQAKNkCii85ELi/eEJU4tmuROW9KLuPe8lF21Q1lkYvKu94EQ/Aejt0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v6 9/9] xen/arm: Map ITS doorbell register to IOMMU page tables
Date: Thu, 9 Nov 2023 13:27:12 -0500
Message-ID: <20231109182716.367119-10-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b292af5-935c-4b3d-4f16-08dbe151eee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4s2WT8o9okYfej0cKtJnZyQL/qAs92KMj7HX+D6+rD0fsF1ORAd0QTcPveD2/jjy63xBYjt9dL+muAQuMhBl2D85t4SuGBuB7muyLTU+NzWgd4hjVBmJ64SRGm/BsEESVjvaTCa6IfxSftK/3iULp1dADaxQpKu1eDgTtSXQfI8UOKMFKbnihG2Ui1ifET3mECgEU5R7yxc4dGbuto+pwtawH/QlQ3+MOQuEJWQA+fAzxOsY4Dkw9MqQe04HtN3Lz55NgpJbgvzBTi2iOvZF4idPOSi/YpMV2Afsg3Cv9hHXYsMxIMoGiHIdcndJch1n/3HtTtwyWFmT4ayh3pgYGVmEz/GCe+wkC/1Jdr1djHnJd//rOystc/DupGhqo+ESmat1sAJGBIH73uD5xBpmN9vJIvRTLmJw/F8QcRRC0XiZHGiG+BrMZNVGxIcpEbsZ+l94Y08dSOJu4FaakBL0hAYsLhZ4NWbBlG5jgEO9OhhhZFQI1gDWBJnj5rVqSbZY0NKSwHzTqCVHBFFkTOdYvdF290I1O3851Y/H66PY5KaREjeyIK6lH96rxTyg9JubntVSY0GW4uZmK3kvCD/0FBwtKvRguIJtpSTNQNVcP+ls3vZVHWg77w4h7vRmLht/clrjVNsqw9RtZfVcTcskzAaG9JPmu7mvDewA79okp2ueFvnNLg8xWmVnr2EGe9GKZmVciGzUxh3tfDMyubKRcmHMosRriwLr6I/kCvFPEokqBUymAlAgyofrtDN/UR2I
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(47076005)(36860700001)(82740400003)(2616005)(81166007)(966005)(6666004)(478600001)(26005)(336012)(426003)(54906003)(6916009)(1076003)(70206006)(316002)(356005)(5660300002)(44832011)(70586007)(86362001)(8936002)(36756003)(4326008)(8676002)(41300700001)(2906002)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:30:21.9038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b292af5-935c-4b3d-4f16-08dbe151eee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

From: Rahul Singh <rahul.singh@arm.com>

When ITS is enabled and PCI devices that are behind an SMMU generate an
MSI interrupt, SMMU fault will be observed as there is currently no
mapping in p2m table for the ITS translation register (GITS_TRANSLATER).

A mapping is required in the p2m page tables so that the device can
generate the MSI interrupt writing to the GITS_TRANSLATER register.

The GITS_TRANSLATER register is a 32-bit register, so map a single page.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This patch was originally picked up from [1], and commit description
loosely borrowed from [2].

Example SMMUv3 fault (qemu-system-aarch64 virt model), ITS base 0x8080000:

(XEN) SMMUv3: /smmuv3@9050000: event 0x10 received:
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000800000010
(XEN) SMMUv3: /smmuv3@9050000:  0x0000008000000000
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000008090040
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000000000000

Example SMMUv2 fault (AMD/Xilinx Versal), ITS base 0xf9020000:

(XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0xf9030040, fsynr=0x12, cb=0

v5->v6:
* switch to iommu_map() interface
* fix page_count argument
* style fixup
* use gprintk instead of printk
* add my Signed-off-by
* move to vgic_v3_its_init_virtual()

v4->v5:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.html
[2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/6232a0d53377009bb7fbc3c3ab81d0153734be6b
---
 xen/arch/arm/vgic-v3-its.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index 05429030b539..c35d5f9eb53e 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1477,6 +1477,21 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
 
     register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, its);
 
+    if ( is_iommu_enabled(its->d) )
+    {
+        mfn_t mfn = maddr_to_mfn(its->doorbell_address);
+        unsigned int flush_flags = 0;
+        int ret = iommu_map(its->d, _dfn(mfn_x(mfn)), mfn, 1, IOMMUF_writable,
+                            &flush_flags);
+        if ( ret < 0 )
+        {
+            gprintk(XENLOG_ERR,
+                    "GICv3: Map ITS translation register %pd failed.\n",
+                    its->d);
+            return ret;
+        }
+    }
+
     /* Register the virtual ITS to be able to clean it up later. */
     list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
 
-- 
2.42.0


