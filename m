Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A09A70832
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926786.1329629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx845-0005OI-7i; Tue, 25 Mar 2025 17:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926786.1329629; Tue, 25 Mar 2025 17:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx845-0005MR-4H; Tue, 25 Mar 2025 17:27:49 +0000
Received: by outflank-mailman (input) for mailman id 926786;
 Tue, 25 Mar 2025 17:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xav3=WM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tx843-000578-SW
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:27:47 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2405::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7722bf33-099e-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:27:47 +0100 (CET)
Received: from CH2PR14CA0051.namprd14.prod.outlook.com (2603:10b6:610:56::31)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:27:40 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::5e) by CH2PR14CA0051.outlook.office365.com
 (2603:10b6:610:56::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Tue,
 25 Mar 2025 17:27:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 17:27:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:27:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:27:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 12:27:32 -0500
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
X-Inumbo-ID: 7722bf33-099e-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otb3+u8U9KaGRwl04oSqrTzv7WWHD9ur2lxg/J+Izb7TDDwngHU7NhQdtGy5RTB3b623GwDYPz2R/SyVxv/xGgcU7eOlhXxuudoLw4hNRkplHEoRM0qL++Ck/SZ9IjyJ2osJGXmNXzkBYrpNRYW7EiiW+ECByoIU2N7hdRHf1FWgv38NrDfOMCKQVNw+zX4O+CVeZIq7NdNxD2z9kLGpOPf9LHSHXkTGwkiSYgh+TF33qE0EJxoWBPxm3kYi+G51QVtnyPUtRw8rsw8nkpTHTEBVELQNlrolBJ75enqCzgCH+4WHHOnDOYBkTYYDl2XC8T3pxS5TioYXcRS3zZX0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34mTAiaY/rp001fMBbXUBF2y5vLxusZIhCSEMu6MyQM=;
 b=yftJvPTAJpKdx3wg/9ktGb58k/4LTiEAovbZlmsmIncnCg4urstiYtJ6HDH8haHWmzi6ZxJwA658Y5bB3H0jB2FrAFAxzWNGXzIitfc0XKu+iB7SraCpylOzWZM7FVg7UTGVbkwP83vk4fZlgUH9lGOk962P53jVrhFOvrZcuWAO3m70bWUPaUrPh7xwuAzItUyVVtMCTX+QgkX5vFOTOQZ8ldyDXXSBqQfqCPZzUyJrgP0sZxZibEJQU63szTYqY3/IWqbzA24fTFuqgB48Aug0OXW6NDJ/nRTMlmlaWo0di3W0R1LFTEMBSHJuOz4asmvTrj8gBz+b3iaP/Ux+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34mTAiaY/rp001fMBbXUBF2y5vLxusZIhCSEMu6MyQM=;
 b=EyBEO2guLaU2Lt6Flmjfo4+NQU1Z4jPBfQyxrfn6LvJ5bT8l3mRmxshJrnp6bRwZUjrvTnmz6P65fw4JexUtoTm7osVT+Me6yUBmWQbBgiibXRD3eJTGujPNXB7qnQhmxBtOe1z16BKtJACv1p5HCmyV7DrYgOrmmgi63Tu3U9I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Mykyta
 Poturai" <Mykyta_Poturai@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v18 1/2] xen/arm: translate virtual PCI bus topology for guests
Date: Tue, 25 Mar 2025 13:27:25 -0400
Message-ID: <20250325172727.600716-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325172727.600716-1-stewart.hildebrand@amd.com>
References: <20250325172727.600716-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: cd62a921-8bbc-4cd4-06df-08dd6bc2581c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nj3O0imlx9E44Kp6iQrSusdCLFvA5gJ2jWzKVa3n4sI5+M+xmgj9sMB5WvAE?=
 =?us-ascii?Q?H8Z/nc/f8Me3a4vGMF7q07YOzGMagQ1yhezj1OHvx/R8uLUwcKtgCm89O+E5?=
 =?us-ascii?Q?pFljaEiw4vkaClBTQ0UX0b7AmD80hQ0vXJUOPqsNI0aUVTK/2fMgIw0F6fQA?=
 =?us-ascii?Q?SOMmGYiKcxCpPYAzyM/JSlwNHyZ2b2Z3eSDvwfezytuSzvoB5afto6u992YZ?=
 =?us-ascii?Q?/YUJRu/Fk1UuiuHVeWEhC8Gurqh1MCD3qtn0pYXt7bXmdH8nWiDEPsfFumUx?=
 =?us-ascii?Q?F/vl5AZv02vRWwnsj/Zlu7LLG0a43dp0kNHftH7qDr06P6SCUjyPh9A9niyX?=
 =?us-ascii?Q?kG1jcXRy8Zsd9jdw5HaWhsCJvny2UEsbPZHpZ4zLwK8cDXDk/SQS6pwGdExj?=
 =?us-ascii?Q?jCd2YcdaEqvu0OtG0QYmx/FvbCHVErrGoLXrTvYT+tcYu/+X9YGa2JmrAHEa?=
 =?us-ascii?Q?LWyO10FQEaok13MzVJTawS4QOMSbc3aZXnQNSaKU+NeIZOtvOylGdoAWlBfP?=
 =?us-ascii?Q?16CNEox60MlPP5aOme8TY4PmXqfyvxeU6Zblk5OK56tNitp2m5BPpQlna36b?=
 =?us-ascii?Q?KcoAYj7q5zMraYPu5u8b7NfjZPnoO7dhf/zR/4cY1wwH4nQpHzSeMCkOMzrr?=
 =?us-ascii?Q?qbNIc3K8HhT+GD1an5zs/jjiR2vUE7fnhgOwv2rVwA+LD68swlehLH6G9jPJ?=
 =?us-ascii?Q?aqeD8FopIGbPq9Y8gAudFZgf+vNIC1iWZzlSQ7JlDZsWwpsufshhjabe4V12?=
 =?us-ascii?Q?mH8ntHNOyB1lrvK4w94XOrTCc37UtB/ye2Cw3oDkZp7NAjfJnyhNq+ShFD3o?=
 =?us-ascii?Q?xm58Aom9sWwl2QzERIHLPRkHPECkQoH5+X/Y6guG3ubxm4+XKUP08dYp1VtY?=
 =?us-ascii?Q?TlV3ieVgdPUYLUXwSEr8qB6QCiFKA2VOTKaXx45Y+x+6QFVQOhxL2zexMr1v?=
 =?us-ascii?Q?nLCn2UZORsjqV+ozPdO021nHWy2UaKHGp6VQCB3fuRdxtd2BFWvBefAj5/Uy?=
 =?us-ascii?Q?V2gt8QG6TJRsblB5H9tuLN6F7AM5DsEGo1lAd85kModTi4KBQPbTW9nj2OVh?=
 =?us-ascii?Q?nvtuCvkpcbwyCznUgdhsexC0GpXeVVqxLMP0DzbisxaC8vM/v+KhBA3/5Ud0?=
 =?us-ascii?Q?DqchputrixfIxE1om1YIolHbJMbBs/uCbycpPwkU94yEeOOgEguRH2993hfZ?=
 =?us-ascii?Q?WXJsKIwKrQ0BbvmYJpwtsl7vDT2UE0pKW9GKE0Yl4OnNO90fujx2x2btPhEk?=
 =?us-ascii?Q?0HOUua+axEPaBxrhlH9s8FiUZ7sc+A6g96KXT+4bkugT+l/GizfVebX5HQsY?=
 =?us-ascii?Q?EL2ir4io2s/LvrIKIdigGL+50oqbU0AHp3vPUZakFFShMJHvYDAEj+TuG9/C?=
 =?us-ascii?Q?6lKRkvmXWPuIJOP3ok3zhlIW2O4GHYwrh2/Eq0wAidFKhoX71XWA+7FhXZLU?=
 =?us-ascii?Q?5Pe+cqAGoXLip9oGo1prVIBM8DC7v0mOf04Slg7J8qNLzgFO9qAzAFORS63y?=
 =?us-ascii?Q?C4kE0KlNNUEBMp8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:27:40.1600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd62a921-8bbc-4cd4-06df-08dd6bc2581c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v18:
* address warning in vpci test suite
In v17:
* move lock to inside vpci_translate_virtual_device()
* acks were previously given for Arm [0] and vPCI [1], but since it was
  two releases ago and the patch has changed, I didn't pick them up

[0] https://lore.kernel.org/xen-devel/4afe33f2-72e6-4755-98ce-d7f9da374e90@xen.org/
[1] https://lore.kernel.org/xen-devel/Zk70udmiriruMt0r@macbook/

In v15:
- base on top of ("arm/vpci: honor access size when returning an error")
In v11:
- Fixed format issues
- Added ASSERT_UNREACHABLE() to the dummy implementation of
vpci_translate_virtual_device()
- Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
the logic in the function
Since v9:
- Commend about required lock replaced with ASSERT()
- Style fixes
- call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
Since v8:
- locks moved out of vpci_translate_virtual_device()
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 tools/tests/vpci/emul.h |  7 ++++---
 xen/arch/arm/vpci.c     | 43 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 26 +++++++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 ++++++++++++
 4 files changed, 75 insertions(+), 13 deletions(-)

diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index da446bba86b4..d3b8978f948c 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -85,6 +85,10 @@ typedef union {
 } pci_sbdf_t;
 
 #define CONFIG_HAS_VPCI
+
+#define BUG() assert(0)
+#define ASSERT_UNREACHABLE() assert(0)
+
 #include "vpci.h"
 
 #define __hwdom_init
@@ -112,9 +116,6 @@ typedef union {
 
 #define PCI_CFG_SPACE_EXP_SIZE 4096
 
-#define BUG() assert(0)
-#define ASSERT_UNREACHABLE() assert(0)
-
 #endif
 
 /*
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4a8..5719821cad67 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,33 +7,51 @@
 
 #include <asm/mmio.h>
 
-static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+static bool vpci_sbdf_from_gpa(struct domain *d,
+                               const struct pci_host_bridge *bridge,
+                               paddr_t gpa, pci_sbdf_t *sbdf)
 {
-    pci_sbdf_t sbdf;
+    bool translated = true;
+
+    ASSERT(sbdf);
 
     if ( bridge )
     {
-        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
-        sbdf.seg = bridge->segment;
-        sbdf.bus += bridge->cfg->busn_start;
+        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        sbdf->seg = bridge->segment;
+        sbdf->bus += bridge->cfg->busn_start;
     }
     else
-        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+    {
+        /*
+         * For the passed through devices we need to map their virtual SBDF
+         * to the physical PCI device being passed through.
+         */
+        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+        translated = vpci_translate_virtual_device(d, sbdf);
+    }
 
-    return sbdf;
+    return translated;
 }
 
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     const unsigned int access_size = (1U << info->dabt.size) * 8;
     const register_t invalid = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r = invalid;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -50,7 +68,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+        return 1;
 
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..49c9444195d7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,32 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
     return 0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
+{
+    const struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+    read_lock(&d->pci_lock);
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            read_unlock(&d->pci_lock);
+            return true;
+        }
+    }
+
+    read_unlock(&d->pci_lock);
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
 void vpci_deassign_device(struct pci_dev *pdev)
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 807401b2eaa2..e355329913ef 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -311,6 +311,18 @@ static inline int __must_check vpci_reset_device(struct pci_dev *pdev)
     return vpci_assign_device(pdev);
 }
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf);
+#else
+static inline bool vpci_translate_virtual_device(struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    ASSERT_UNREACHABLE();
+
+    return false;
+}
+#endif
+
 #endif
 
 /*
-- 
2.49.0


