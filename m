Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FA1847BAA
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675235.1050573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Du-0000qb-CX; Fri, 02 Feb 2024 21:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675235.1050573; Fri, 02 Feb 2024 21:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Du-0000nG-9C; Fri, 02 Feb 2024 21:37:22 +0000
Received: by outflank-mailman (input) for mailman id 675235;
 Fri, 02 Feb 2024 21:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1DN-0003tJ-W2
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:36:49 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2be7ad32-c213-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:36:49 +0100 (CET)
Received: from DM6PR02CA0140.namprd02.prod.outlook.com (2603:10b6:5:332::7) by
 SJ0PR12MB6686.namprd12.prod.outlook.com (2603:10b6:a03:479::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Fri, 2 Feb
 2024 21:36:45 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::f) by DM6PR02CA0140.outlook.office365.com
 (2603:10b6:5:332::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23 via Frontend
 Transport; Fri, 2 Feb 2024 21:36:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:36:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:36:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:36:44 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:36:38 -0600
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
X-Inumbo-ID: 2be7ad32-c213-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVSXQSO3N1wbviduaw4m+NX851dUp+Bn5GdbSbl1f9NkPiXE/OTQt0D/EOWJVNehf5Sjxv++aoZ5wOB93rNvoKW+Qsc4qYBvfMkJnCZ5qOcuIlYDFE8r4sb3b0HSx5FJKsJ0Ud/PTzrwVnHF54TY3q5zJwoHTMogHAyLTnH/7JmJACBXpXugm56GNaZRROqlxug0zOX5poLGR+h7M55BxVKuv4kwSwTfJ8d1YnzlmUkGWXr7ueop+nuv8OHAwBGvbm1rXNkXB69Jxjxfn+JFkcPfoyMRHgUXsG2OGrgS77bEc2RGn1P8LAxw/Vq8eaLZH6ZFpMBOkhk48Cfm6Klzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsoOL/G8DIgXV37+ao0tajW6v6ZQDcdP8FQCKLy06D4=;
 b=Uz9QF7TrTujvGsb+B1GRDjC6D2j1ByKYm8vrEzErYgIC15SMtrNo0bQR4XH35WN2Kz6uhbHNh9E4TcJxA8iJ75FsR/OPiHLu2BCVhlRJT3dlt19Udsc7fULUPe+bNUn5ZqhthStp2yxGCA35v1N/Lcq10Ko2fgOYi/2pDm2EOvk+dNLbC6XHWFBMsr50GqeldBmKw2mIpT73/8okYnWu/Cq443CnCi5psuTdgMrDkIKWXKFMIlwFeP8f05KjaKjwtbDAZqfFCmCE2up80X3RHcxJmP5VC22PX3r1u26Ckgp4OPFKu7N4aB9o+DGMni0Hes/ywvEtdvfMyP/Qpb9GyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsoOL/G8DIgXV37+ao0tajW6v6ZQDcdP8FQCKLy06D4=;
 b=cKtf/lvYRNTuY/AAUj8hOqEzr1bBc+OvemF3Ct0LRXY7U9SlsdHIwOt2gpcj0AI1mIYs9Pig59wkfblvrQK8kguPhTsXecjRe/5Rqt6usDeatILb92vSW4RwV0zYU3KJV5cczZp+JkFBOw0+sDmhvBzyvmATvBuzDvNDxZl1vp8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
	<jgrall@amazon.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v13 13/14] xen/arm: account IO handlers for emulated PCI MSI-X
Date: Fri, 2 Feb 2024 16:33:17 -0500
Message-ID: <20240202213321.1920347-14-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SJ0PR12MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3a574b-cb66-4213-990d-08dc24370e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NfwLVJTBJiWeqB0L159LB+HbaZ/MGzX0kikt5eg8b/pmVJSknxC+yL47d06bnnVTKB3/k8Y9KZSJqmLpoyxBV4DvJJfS4AsQor6X7rY9f3kTPK7E3A9xuKxksTjc4K+FgHD6xJDZVlgZYTSwPVw+kDo1tedBqwg69+L//Dgv+nlGyimAySVjO3eAlgo7yids20tOzioL68IkqQA2TrcDtPX9HE2KeQxwoEYAPUpONfCbGH9w14iuAInYv/VtIPyU/dNsICzCi0Tuopybdft6OVbMakDpUjC8T1gNysNQH1z35vTk2zLE8QWk/lIL6nUZOF3Wdc2B6PhRfQorPKwbnyHizGZHpAaSN0NiiU95bPUO6g4UeAA6deV6wva2tnobtncgyPruN68Z7a+NKFkndxCBhOpwFz/eut3cYg70mVQyzw8S98OYTTY20sExjYf75Q4g5KHplbfQdeImU8SIlT1Ixi2BsMLCv89Wai0bTD8gR8cp/e6nT4oabSt/eudZZOvg1dcNaINT1kNXO0Am6TYGkYwW2spF64qDumw0bcuvCDa02HlTfs0lyAr5gdt8t8alBczi8gXnNCgEHRby3lb64lA0ThjvGySQ6LXlaoi5sEsxdyqYqSRUymuJMz+I/fEdP9ObHq5ohCMI2ErublMbWt1a30m9EE9kS3CByXDe4+fVvmEiKDlNjPeKvkJCl8taCZKycessNU18ZIrAvdAaM0/hb2kbw05Kz+E4UHSQtUWtH2e24+aAoAjGOndz6/1QeGoz8gjh1PIbuJw06A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(66899024)(336012)(54906003)(47076005)(36860700001)(8936002)(82740400003)(81166007)(41300700001)(36756003)(86362001)(15650500001)(70586007)(6666004)(8676002)(4326008)(316002)(426003)(83380400001)(26005)(44832011)(1076003)(2616005)(6916009)(5660300002)(2906002)(356005)(478600001)(70206006)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:36:45.5461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3a574b-cb66-4213-990d-08dc24370e01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6686

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

At the moment, we always allocate an extra 16 slots for IO handlers
(see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
MSI-X registers we need to explicitly tell that we have additional IO
handlers, so those are accounted.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This actually moved here from the part 2 of the prep work for PCI
passthrough on Arm as it seems to be the proper place for it.

Since v5:
- optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
  defined unconditionally
New in v5
---
 xen/arch/arm/vpci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 7a6a0017d132..348ba0fbc860 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -130,6 +130,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
 
 unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
 {
+    unsigned int count;
+
     if ( !has_vpci(d) )
         return 0;
 
@@ -150,7 +152,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
      * For guests each host bridge requires one region to cover the
      * configuration space. At the moment, we only expose a single host bridge.
      */
-    return 1;
+    count = 1;
+
+    /*
+     * There's a single MSI-X MMIO handler that deals with both PBA
+     * and MSI-X tables per each PCI device being passed through.
+     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
+     */
+    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
+        count += VPCI_MAX_VIRT_DEV;
+
+    return count;
 }
 
 /*
-- 
2.43.0


