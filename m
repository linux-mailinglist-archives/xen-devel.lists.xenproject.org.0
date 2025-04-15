Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66FA8A4B3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 18:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954267.1348585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYd-00087Z-5L; Tue, 15 Apr 2025 16:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954267.1348585; Tue, 15 Apr 2025 16:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYd-00084e-1A; Tue, 15 Apr 2025 16:54:47 +0000
Received: by outflank-mailman (input) for mailman id 954267;
 Tue, 15 Apr 2025 16:54:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4sU=XB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u4jYb-0007HS-KE
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 16:54:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2009::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54880476-1a1a-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 18:54:44 +0200 (CEST)
Received: from SA0PR11CA0173.namprd11.prod.outlook.com (2603:10b6:806:1bb::28)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:54:38 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::98) by SA0PR11CA0173.outlook.office365.com
 (2603:10b6:806:1bb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 16:54:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 16:54:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 11:54:37 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Apr 2025 11:54:30 -0500
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
X-Inumbo-ID: 54880476-1a1a-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOjIL0vjNWzA2sp2aKIIhNrCE6W2JvEbMKXDqHo8CoRuHYAClnopsdxN8VSply5V9l9GBhnT5qKEZa//e1b6BJ4yyC2iBm0hY47bSE2ZilU5D9zOXy+7/UU6EDiT7rZ8KPfNk61vMQhmtfEcwk0lDikPAGb5MYcAVlLFHgxD+76ptXzT6nJizdgNoPOpad3vF818BSUW0gGTGVYRs5pgZkJ0hHIu4/s6XnJOKSDIQfCFR6ih8t9eNlxkQO8XXLuTxixC3yU7MkPVnoblRkuGkTmJEkejXB7NoX5mv/3YWkxdVrHc1rVLGRJxGCO6ou0lmOSVSMKTCW5r7VZMh2Qv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1iExg8Gsendz7+/1VoCc6vWAZqFmtQSh/yRMxQ2Fik=;
 b=mefPqsvSfbO8R8sFLHaZr/2FFBTHHviupPPr+fgGxm+OsOToJJvuPhs9i/bW461Ij1hkRxZEp//syvrrLi0cSem4vP0tm7TXlA0Pd3s41MCBNhI2W1M4TtGRskHUbMmUHo/eMelNXOBhnx8bQP5ChpVVx9Wpe0Jj2oRE72XhyqAIsngwXDCOWsdI3PnLtHuLUGN8bQm9evshiQoNGrqoexIzYwu5YFG01OIQOyC/LUBVCwi5pxdN3WIuwAkNImN0XNbE7PKTvZ4yo6xI2VoPuttPLNBtFM2q+JQjfWKNcGCzeHsL8rJewx1BA/XXsAl91nzU3g0BR1HeozM6gEA3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1iExg8Gsendz7+/1VoCc6vWAZqFmtQSh/yRMxQ2Fik=;
 b=cC7yDQnPwD/BT8usXS0oBFs1aMz0wZIU0AadwRQXqu3rHRS99Sm5NAd39fNmjZT8y+8EXSovkK6ZoTjj/MydEzjeQNSGYLMEuumL4YQhHbLERU/d+LUIoi7O4x80VyBEAInS7VRm6CV2UhEgVms7yuei+gniYi/bjVbOcGX3HAQ=
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
Subject: [PATCH v19 3/3] xen/arm: translate virtual PCI bus topology for guests
Date: Tue, 15 Apr 2025 12:54:02 -0400
Message-ID: <20250415165404.435506-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415165404.435506-1-stewart.hildebrand@amd.com>
References: <20250415165404.435506-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: f152c857-d021-435e-eb27-08dd7c3e353f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dEBmHxlwiQtcFcJfEm2NriDkorDs72F/Gu/VUBxUIANYCNBhB5u1X5uP22C9?=
 =?us-ascii?Q?f+z0OLREHvgAtzbNNrSyhgEYWh+5XEOzKeV9ZFjfFFj5zGNKuZ8yqkwbsrNf?=
 =?us-ascii?Q?re4Zhe2358Y1u6sCRaSzn/23vx2zNqDPHmOSTfyUAloX6xiRVkwvi5tQTm18?=
 =?us-ascii?Q?f92jVsOVP9AA2yC0mXuw3zMzWiCwLpzk3TgSePb1mS02pgTBPcQ+13I+Q1pU?=
 =?us-ascii?Q?FM75rUvw3x09B3YOnSiljWV2YPmO8ax6MZjYzP1+JyatW2p9uUjS72tqhauO?=
 =?us-ascii?Q?PXqmIl0SPysxJQWyRlbpYi+qFlLzX4sA5QEhYMkMnlsaUI2hy2os71Kc9BVF?=
 =?us-ascii?Q?ymb70vBu0NomoXpKCOi/+OmlA+huH3fhJgzVfSz1uAyUPr7WCq9tqk/gzEwi?=
 =?us-ascii?Q?cfBdY1JVUi4TU4qO9DlxJsr1Cleza9ut5o17XnavFm6QEQlnJ1u4I6etHTe2?=
 =?us-ascii?Q?mxZlJWz1VdJ9v316b61Xtjt6uEXKfiKQXH2DQl9HTYmwq9GswHewX3+9SmUX?=
 =?us-ascii?Q?cwyq0T4xpWQOAL3KR+r3Khq1W99Q/qiJXaDtVFq5/Wem5SD+6MHm07mSErI1?=
 =?us-ascii?Q?jJ3VLbLqWa4Dq54S2pgeVCa3O9phjLt4dTB8YX6jZFrDSZIIZ9QTVpsN9guB?=
 =?us-ascii?Q?cvsPSqD4ZYEspn4kxCa7NBmQCFYw9lo2xWfBas1K8UpBFhcO2t5Wr/hJzIK+?=
 =?us-ascii?Q?gmzFJ8X8FJCd5wSAMpoWN+Ta62/+d90M8Kh3K7AcB30gtN4VdBYRaTKY1Svd?=
 =?us-ascii?Q?moZohmYy5Ot58kCXrGuNhsasNMfzZNlkrKyN8aKJhF/QFS/RedYCcRKaoipk?=
 =?us-ascii?Q?hu3/v56iODe1YKJX2AIoTUmiIPAkCfqEQJRQUura0xnzOFdo+ybisyjNDuyB?=
 =?us-ascii?Q?7dIm2vap6W2GLFcvmW+A0EnwdT94Pyzu5nayLgm9s2Ew4QHP7MgeCfe0bplg?=
 =?us-ascii?Q?dI+V99y2i97lgyNaPqhB90UBdoQEu9IgaxSwwQOmJWlHNnQrgBe8dEPJPQNJ?=
 =?us-ascii?Q?QmpIJH5YmHlzZ3w5+PS6cRxLFvSkEZGZWj2hoqI2d8I2HQ2emQf/F4kUIVhN?=
 =?us-ascii?Q?8VfIHZwgIQ2tsk3JHl0aMvap8bB8tfA65XgWlBv+YOd6haNoZPNBB29H/ETX?=
 =?us-ascii?Q?vq1EHv08R4N6SHhLoJe4bFGYI+luwCsKOs/TJ/DjiBIkjZ+3np1b0ByGDKw+?=
 =?us-ascii?Q?Xwe1CbBkI8RtcStFlhmwcQDDzklZJszPK+tM4mf9kse/c9m1+6mvF2ykFRla?=
 =?us-ascii?Q?Fx83AWXWq6PCBta4wNSe5NTs8bCSBl5O83+32NLX5etG5Rl4TYvJMZK1I1CD?=
 =?us-ascii?Q?0VnkVyX9R8do974lhxIA4BmdREto6NAehuo/r+XxFFgzrMI/lQy9ACIRAEd1?=
 =?us-ascii?Q?6igiCdivRTkkEk+Y1ZvXOF9VoS0HAcU01vX2AgF0z/46PfkEGKHyihoR63VS?=
 =?us-ascii?Q?zGxLyNqYw/s7HQM89o3VuJKv0oMdRxYDHg0mBcZnHvAhb4KgFtwUomHuPan3?=
 =?us-ascii?Q?PgM2MJZStiRmilRblvqTLyCtAn/8L+itY2e9VBEXUAwSdb1hLep15qvI+g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:54:37.9051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f152c857-d021-435e-eb27-08dd7c3e353f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334

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
In v19:
* move locking to pre-patch
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
 tools/tests/vpci/emul.h |  7 +++---
 xen/arch/arm/vpci.c     | 48 ++++++++++++++++++++++++++++++++---------
 xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 +++++++++++
 4 files changed, 78 insertions(+), 13 deletions(-)

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
index 828c5c745bd9..7bb77f9f9c80 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,34 +7,54 @@
 
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
+    ASSERT(rw_is_locked(&d->pci_lock));
 
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
     read_lock(&v->domain->pci_lock);
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r = invalid;
+        read_unlock(&v->domain->pci_lock);
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -53,10 +73,18 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     int ret;
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
     write_lock(&v->domain->pci_lock);
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        write_unlock(&v->domain->pci_lock);
+        return 1;
+    }
+
     ret = vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                           1U << info->dabt.size, r);
     write_unlock(&v->domain->pci_lock);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d01fb7be226a..46e96518299e 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,30 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
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
+    ASSERT(rw_is_locked(&d->pci_lock));
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            return true;
+        }
+    }
+
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


