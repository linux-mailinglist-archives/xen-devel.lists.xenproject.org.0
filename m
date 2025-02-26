Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689ECA46D20
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 22:11:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897266.1305966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnOgq-0003Ec-W2; Wed, 26 Feb 2025 21:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897266.1305966; Wed, 26 Feb 2025 21:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnOgq-0003CT-Sj; Wed, 26 Feb 2025 21:11:36 +0000
Received: by outflank-mailman (input) for mailman id 897266;
 Wed, 26 Feb 2025 21:11:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drmc=VR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnOgp-0003CN-DF
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 21:11:35 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:240a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eda4cd1-f486-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 22:11:29 +0100 (CET)
Received: from BY5PR16CA0034.namprd16.prod.outlook.com (2603:10b6:a03:1a0::47)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 21:11:18 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::b3) by BY5PR16CA0034.outlook.office365.com
 (2603:10b6:a03:1a0::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Wed,
 26 Feb 2025 21:11:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 21:11:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 15:11:14 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 26 Feb 2025 15:11:13 -0600
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
X-Inumbo-ID: 3eda4cd1-f486-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpaTHUR30mmvQAic1tn1zhkb1OTfFXOHM5egI+V3AXnnKyf22KcgcmF8eftP/NyfByJ49WQMM72Tj526Plw3MAmOCxaijiWdmqvtQCRGVNZhKW44z2hwqJeChKmaJyMsiFT40Ww83u7Im8EsycgYiIdZfwqepuYVAaOkhFfT0RIP2EwSa6b4AvhBNF9kNQO/4REduIfKcsQoervF3A6p62GgurHnyB81D79K8GynXFAdGS1z6bC3ajDO7+vkb54RKNHDpYHwdv9AcszVqk9nca98NXt9mQoZV8zYlwVEl51Jnni8MwoZ9wuAV95lI/bTzVXuTky/VOkK9gNsUPA7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlKxHxNc7B+tKqy2cTKXt/ZbOHY25qKfA6XSkb+ex9E=;
 b=V3w9WnGbdhcLrJ/vAqP3a2Z/P41wtUGLl4m1d6ozO+njKJkSwyjF+aJ1nveYuhnTj91vZa+98twKIlfV62ATNWNP6o39MdE8/VVKvxD0Ng/GED5qZYp5cx/p9UfAXf5+octAatuMixq6QPrOWCcXGOaMH5Evx9GCx6c3oFXqV9icAiLZy02/zsm/GYKgy2BAICvdmcyi49gBYKzyGhc9sWFqABpiUhHCxwRO3GiwhkOzcPj+wsKbLwwcfEgNGYHAxS7PDp69r+SR/vphV0u2w90VDRGkyPT2cptmSbMF4ViWHjtr18bOj+w6eGni7tUKJfAJXc//xUnX52HY085E8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlKxHxNc7B+tKqy2cTKXt/ZbOHY25qKfA6XSkb+ex9E=;
 b=gjEMQmoujqdTbt4iXDwpvvd4bOC5/FrlZVO83dKyQLJBb33wkU/lYUTx4GWPSpN9AWgvRPmlSiRS854yYEbAoFivea6UWB0t/RhUNJXeXYqiI5T09f4Sgwq3HC0FnI5Ph/MzFHjAC/4t1LFZCCEWH5sijvY6Hjw1wWemEOo0eRc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>
Subject: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for ath11k
Date: Wed, 26 Feb 2025 16:11:25 -0500
Message-ID: <20250226211125.43625-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 648dd821-e85c-4b64-3f27-08dd56aa1bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TU8UCCaWQsg3xX+h5pTh0RNsUIBNje90Dh6iGgojzqGshdDl1/soGaA/ejA7?=
 =?us-ascii?Q?w+JPGU5bh4LoHkoDRGpMqQssKFtr/WGlLa0IHYha/LVrv5ePYYBVga5O6nI1?=
 =?us-ascii?Q?wVQ7TRixorqgCxsqWGQtRTErO7YDKqi0zkI/t4PlkpBL61Smd/KXC9OJlMlu?=
 =?us-ascii?Q?qsN+KrLrhp52/f2L76cg2nQQAi0iU531I0wJElOuzu1M9iQErIg3vHyww4vm?=
 =?us-ascii?Q?CSvC87DqPj7o7vpejDui/gsxdWQ8JMRXEAr6+76Nvdnxx8TaAG/7NS9mEpQq?=
 =?us-ascii?Q?jz1QemiVXuYeS8wQSbSsaO33pXFHwVChT3te2M6iSdu6bKlOGP9v3w/rGT1p?=
 =?us-ascii?Q?YPBhqFiXDxBbm0hg1UicEeQlFNpEelVBD0iEcSTvgcKjYLb2kasxDVyYCNFc?=
 =?us-ascii?Q?pI1FUS7qDJbX8kBVt/vtkyKxyn3JrvhyrzX/xLXGsFY8R+3Px1UYhnpNqMdx?=
 =?us-ascii?Q?CFZVe/rickjcVSutwHGFM5RJPhaQgOXWCMv1t2r7HRgUd2Loax8rB5HMG1PZ?=
 =?us-ascii?Q?Uq5cK3tXDSfZDeQvzyqojcIs/XaL3B2RAEvkQIdA+YUbT/HqVaoJNEzmIDy0?=
 =?us-ascii?Q?QWqqS9OqODNifxcf7TGay6BSJfn7GjfknpVE7HHU9dv992tvGTzehWHMjYDV?=
 =?us-ascii?Q?hmxropHxpR/Ks9vIlvQqgw40tyQTwg/fk5kpL9IFI4aj/kCU0K7/au7AsQuq?=
 =?us-ascii?Q?UA4wqE0Ng7usLNHeXTjoSjLNpbjBZvRKo2Mb2JSaYoo4HueYa0ISv8f11EG2?=
 =?us-ascii?Q?CJND4mpRLJM+WjQxU39nNvRqj3oVre2/EJV8CfkgMyCCS72lMOpmunxnWf4w?=
 =?us-ascii?Q?enjtDjLCJi/zsiMfMrw7jEYzn5vs+fU7A9x/jRf2OcqUmXdmW+qK1ajhR1Jp?=
 =?us-ascii?Q?nZ+y9hubXfWw6lLAuyP8DuKee7IIfp5ofdllcmxl3qnCmracgvrCy8Lwef2m?=
 =?us-ascii?Q?wyBhdCLJeGbSkU9gGZuOFohgAtPwoeRlQJWbGg47nAE5yOB/6OzxeAZyc4oU?=
 =?us-ascii?Q?hPhX5EawILVBs+qN1MVgUnY540Lp6YVWBfLJzhtoSbOuSsjaux1bWnhAZJ2W?=
 =?us-ascii?Q?W20fUW6irwa/azTL98U8dnN5RnJykSFKYeSCQaKm9f/qXxJq+nEmz7cOdCHj?=
 =?us-ascii?Q?KKRhVRMNOA8uAyOOdAnYPa15bbakJi1x+1hM0CNNqxsxDTbNh5gMmv+3zGm0?=
 =?us-ascii?Q?jW6P4uPFsENcm1HKcLLCiLTYYEOciVVvCDyHd1YD/cT1y4EDAiOM78vyrgI7?=
 =?us-ascii?Q?zN0uQteC5e5goMdHmYKdRv+0u9NyFdsF+D+R34sEVjKjpCx4AMwiK7JPa0uC?=
 =?us-ascii?Q?51rcHaNHmDV6u2jrURNXlslvmQL8IDhI1CnQ/r92yxkvY+V58rgLuxLJHQIe?=
 =?us-ascii?Q?+Pu74pSbujUNEsXKUCq98HzmuhbWX1eCBTp3M/2mOq0I2CsRzLlkQnjAuBTL?=
 =?us-ascii?Q?fuuEfYPs2OPfavxZ5/PSPVq47K+n6/NSw+D/X2xjxqpPxy4IPZA8Eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 21:11:16.6738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648dd821-e85c-4b64-3f27-08dd56aa1bde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944

Sometimes we have to quirk the PCI IRTE to use a non-zero remap_index
corresponding to the guest's view of the MSI data register.  The MSI
data guest vector equals interrupt remapping table index.

The ath11k wifi device does unusual things with MSIs.  The driver lets
Linux program the MSI capability.  Linux internally caches the MSI data
it thinks it programmed.  It sets its affinity to CPU0.  The ath11k
driver then reads the MSI address from the PCI configuration space.  The
MSI address and cached data are then passed to other components on the
same card to generate MSI interrupts.

With Xen, vPCI and QEMU PCI passthrough have a guest idea of the MSI
address and data.  But Xen programs the actual hardware with its own
address and data.  With per-device IRT, xen uses index 0.  When the
ath11k driver passes the guest address and data to the hardware, it
generates faults when there is no IRTE for the guest data (~0x25).

To work around this, we can, for per-device IRTs, program the hardware
to use the guest data & associated IRTE.  The address doesn't matter
since the IRTE handles that, and the Xen address & vector can be used as
expected.

For vPCI, the guest MSI data is available at the time of initial MSI
setup, but that is not the case for HVM.  With HVM, the initial MSI
setup is done when PHYSDEVOP_map_pirq is called, but the guest vector is
only available later when XEN_DOMCTL_bind_pt_irq is called.  In that
case, we need to tear down and create a new IRTE.  This later location
can also handle vPCI.

Add pirq_guest_bind_gvec to plumb down the gvec without modifying all
call sites.  Use msi_desc->gvec to pass through the desired value.

Only tested with AMD-Vi.  Requires per-device IRT.  With AMD-Vi, the
number of MSIs is passed in, but a minimum of a page is allocated for
the table.  The vector is 8 bits giving indices 0-255.  Even with 128bit
IRTEs, 16 bytes, 1 page 4096 / 16 = 256 entries, so we don't have to
worry about overflow.  N MSIs can only have the last one at 255, so the
guest can't expect to have N vectors starting above 255 - N.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Is something like this feasible for inclusion upstream?  I'm asking
before I look into what it would take to support Intel.

e.g. Replace amd_iommu_perdev_intremap with something generic.

The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
all that has been tested.

Using msi_desc->gvec should be okay since with posted interrupts - the
gvec is expected to match.

hvm_pi_update_irte() changes the IRTE but not the MSI data in the PCI
capability, so that isn't suitable by itself.
---
 xen/arch/x86/include/asm/msi.h           |  3 ++-
 xen/arch/x86/irq.c                       | 13 +++++++++++-
 xen/arch/x86/msi.c                       |  1 +
 xen/drivers/passthrough/amd/iommu_intr.c | 25 ++++++++++++++++++++++++
 xen/drivers/passthrough/pci.c            | 24 +++++++++++++++++++++++
 xen/drivers/passthrough/x86/hvm.c        |  3 ++-
 xen/include/xen/irq.h                    |  2 ++
 xen/include/xen/pci.h                    |  2 ++
 8 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 378b85ee94..ea1004af14 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -107,7 +107,8 @@ struct msi_desc {
     } msi_attrib;
 
     bool irte_initialized;
-    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL */
+    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL or
+                                when pci_dev gvec_as_irte_idx is true */
     const struct pi_desc *pi_desc; /* pointer to posted descriptor */
 
     struct list_head list;
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index ff3ac832f4..3fc73feaea 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1600,7 +1600,8 @@ int pirq_shared(struct domain *d, int pirq)
     return shared;
 }
 
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq, int will_share,
+                         uint8_t gvec)
 {
     struct irq_desc         *desc;
     irq_guest_action_t *action, *newaction = NULL;
@@ -1674,7 +1675,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
                                           &cpu_online_map) )
                 affinity = desc->affinity;
             if ( affinity )
+            {
+                if ( gvec && desc->msi_desc )
+                    desc->msi_desc->gvec = gvec;
+
                 desc->handler->set_affinity(desc, affinity);
+            }
         }
 
         desc->status &= ~IRQ_DISABLED;
@@ -1730,6 +1736,11 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
     return rc;
 }
 
+int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+{
+    return pirq_guest_bind_gvec(v, pirq, will_share, 0);
+}
+
 static irq_guest_action_t *__pirq_guest_unbind(
     struct domain *d, struct pirq *pirq, struct irq_desc *desc)
 {
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index bf5b71822e..cef2987038 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -487,6 +487,7 @@ static struct msi_desc *alloc_msi_entry(unsigned int nr)
         entry[nr].remap_index = -1;
         entry[nr].pi_desc = NULL;
         entry[nr].irte_initialized = false;
+        entry[nr].gvec = 0;
     }
 
     return entry;
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index c0273059cb..2e228d2c21 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -543,6 +543,31 @@ int cf_check amd_iommu_msi_msg_update_ire(
     if ( !msg )
         return 0;
 
+    if ( pdev->gvec_as_irte_idx && amd_iommu_perdev_intremap )
+    {
+        int new_remap_index = 0;
+        if ( msi_desc->gvec )
+        {
+            printk("%pp: gvec remap_index %#x -> %#x\n", &pdev->sbdf,
+                   msi_desc->remap_index, msi_desc->gvec);
+            new_remap_index = msi_desc->gvec;
+        }
+
+        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
+             msi_desc->remap_index != -1 )
+        {
+            /* Clear any existing entries */
+            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
+                                               &msi_desc->remap_index,
+                                               NULL, NULL);
+
+            for ( i = 0; i < nr; ++i )
+                msi_desc[i].remap_index = -1;
+
+            msi_desc->remap_index = new_remap_index;
+        }
+    }
+
     rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e1a09344df..7031aedb94 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -306,6 +306,17 @@ static void apply_quirks(struct pci_dev *pdev)
         { PCI_VENDOR_ID_INTEL, 0x6fa0 },
         { PCI_VENDOR_ID_INTEL, 0x6fc0 },
     };
+    static const struct {
+        uint16_t vendor, device;
+    } hide_irt[] = {
+#define PCI_VENDOR_ID_QCOM		0x17cb
+#define QCA6390_DEVICE_ID		0x1101
+#define QCN9074_DEVICE_ID		0x1104
+#define WCN6855_DEVICE_ID		0x1103
+        { PCI_VENDOR_ID_QCOM, QCA6390_DEVICE_ID },
+        { PCI_VENDOR_ID_QCOM, QCN9074_DEVICE_ID },
+        { PCI_VENDOR_ID_QCOM, WCN6855_DEVICE_ID },
+    };
     unsigned int i;
 
     for ( i = 0; i < ARRAY_SIZE(ignore_bars); i++)
@@ -316,6 +327,19 @@ static void apply_quirks(struct pci_dev *pdev)
              * from trying to size the BARs or add handlers to trap accesses.
              */
             pdev->ignore_bars = true;
+
+    for ( i = 0; i < ARRAY_SIZE(hide_irt); i++)
+    {
+        if ( vendor == hide_irt[i].vendor &&
+             device == hide_irt[i].device )
+        {
+            pdev->gvec_as_irte_idx = true;
+            printk("%pp %04x:%04x quirk gvec as intr remap index\n",
+                   &pdev->sbdf, hide_irt[i].vendor, hide_irt[i].device);
+            if ( !amd_iommu_perdev_intremap )
+                printk("gvec quirk requires per-device intr remap!\n");
+        }
+    }
 }
 
 static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index f5faff7a49..5d17f93b06 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -307,7 +307,8 @@ int pt_irq_create_bind(
              */
             pirq_dpci->dom = d;
             /* bind after hvm_irq_dpci is setup to avoid race with irq handler*/
-            rc = pirq_guest_bind(d->vcpu[0], info, 0);
+            rc = pirq_guest_bind_gvec(d->vcpu[0], info, 0,
+                                      pirq_dpci->gmsi.gvec);
             if ( rc == 0 && pt_irq_bind->u.msi.gtable )
             {
                 rc = msixtbl_pt_register(d, info, pt_irq_bind->u.msi.gtable);
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6b..96109d6ebe 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -192,6 +192,8 @@ extern void pirq_guest_eoi(struct pirq *pirq);
 extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);
 extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
+extern int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq,
+                                int will_share, uint8_t gvec);
 extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
 extern void pirq_set_affinity(struct domain *d, int pirq,
                               const cpumask_t *mask);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index 4f12bcf089..14afd78f75 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -127,6 +127,8 @@ struct pci_dev {
     /* Device with errata, ignore the BARs. */
     bool ignore_bars;
 
+    bool gvec_as_irte_idx;
+
     /* Device misbehaving, prevent assigning it to guests. */
     bool broken;
 
-- 
2.34.1


