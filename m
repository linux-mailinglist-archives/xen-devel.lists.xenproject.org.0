Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17751AD4723
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011226.1389595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tN-0005l0-BA; Wed, 11 Jun 2025 00:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011226.1389595; Wed, 11 Jun 2025 00:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tN-0005hy-86; Wed, 11 Jun 2025 00:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1011226;
 Wed, 11 Jun 2025 00:00:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP8tM-0005ZD-CL
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:00:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2412::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1533f5d4-4657-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 02:00:29 +0200 (CEST)
Received: from MW2PR16CA0042.namprd16.prod.outlook.com (2603:10b6:907:1::19)
 by MW4PR12MB7430.namprd12.prod.outlook.com (2603:10b6:303:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 00:00:25 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::4f) by MW2PR16CA0042.outlook.office365.com
 (2603:10b6:907:1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Wed,
 11 Jun 2025 00:00:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 00:00:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:15 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 19:00:14 -0500
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
X-Inumbo-ID: 1533f5d4-4657-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxW8BtPYNZZBeuxhMJlXMiN2rhdm8J1hS+nxn/Ybnd7QXPmurJzSE4haHEQKYeGT0IjqtYkM0K8R0nAdG93xfwICv/2q5lNL/Nf4tabS30KlpI4SSM+Z8cNj0afwsfdP2mJtxer1j6+z2jcoxNa6C+irPcRxoZLOBmUOurHSwyTsLAbEp/qvrhN/z/3HFEml4asaH5JS3lRMAzzV0NjwnCZKwpGC1G7nR4ODDQIXt9t47guB0GIQ/K1V0cVVF8mFl3c2e5XXAQqTKvZcQBX0kwjfPYaDx05b+EHKi3/qVf3hks3am+GvZUdvRcIIiQ+kHG1mi+d1jbkNP6r49kknaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtLW9DfF81MIMkOe9MoiU7sblleifJc7acw0muGW3+o=;
 b=ycXKq5eEMA8FWIO2QRsllpGhyQzlG8r3JLCyBjPdVNxbGzueNtdDTMU0u9YC3SK0jhx9hxd4nxZITwKTjUQ0nXLxL3hOlgpFXFULOlMqBJJoS9Oqf6jnvXYgHWxvl2OUyK2CymRBleCI08ua8LdDLJQLpXKfFIdjrlvxugSCEQ7v9VEXGARWyVtpGgvyaWrVRRaiJTBR9GmvJu1iyQzuimuWRkJHkf4i8y5QI6Di/Sb7RcB7R6ahQgMk0g4pxC2I/PbtBH34uSzlk/q3Rp4dB3SeJx8iAgK9ToyFpQxdimYtuLnFJfFJDo3zJU0eqP+96ERNT1g70yn6ZlIr3gXGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtLW9DfF81MIMkOe9MoiU7sblleifJc7acw0muGW3+o=;
 b=DWCYRxJl56KmNL9ARjPdrAMjc157OQ2U00HQbgcieRvw74zpZ1EbRvhIxvNkIIPtwacATUVFAZYw8T6S38LVakj4O8lTSE0TNb8wammV1LP0ReY0hrWZIv1kEgXOJ8uxXldCpOifi1+kGyxWyKrZGO3NtNQyT82bvff5x1euU3g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/4] xen/xsm: Add XSM_HW_PRIV
Date: Tue, 10 Jun 2025 18:57:34 -0400
Message-ID: <20250610225737.469690-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610225737.469690-1-jason.andryuk@amd.com>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|MW4PR12MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: b027ab8e-e1c2-47de-e602-08dda87af718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pjRruIJrD93vBuZuEEkvlfSH21C8CBjDotMGlRGK7Uq239WWLSqJkNWHuaSf?=
 =?us-ascii?Q?jHqjgaacK0IAKftyEAAcmJ57QyTHwdeFofF7uRohJrPNtObVU9U1n3aqVZ79?=
 =?us-ascii?Q?fVusq7tx9bN+Eqrz+KbbPx5dCCjy665TMh8/AodDvJhejswtGp32sRwqmS20?=
 =?us-ascii?Q?XD0Dnwu9p4qrNke1qoEO42JTrxXV9SPuoe7t+40uUJwVwq42cB6UI764impy?=
 =?us-ascii?Q?nPNHJ4h26gnZsddQTdmgJB4ZlLvLURuEfGYrlQ9PNlmVL7WLDwis7B1RhayJ?=
 =?us-ascii?Q?UCEmQCCO9spb4BE9bngpTznd0fmZ0i4UkmvUWKpbJAToNkEQsTtmwrbEdaMp?=
 =?us-ascii?Q?B2iJ2JbqXOdGFI1gdkbjDoyh4b+W/RcQXT0Poj9Vy79pSklFxbs+3mQ4nEXY?=
 =?us-ascii?Q?NWqPRwaSW1U2yywJHE0bZbdu9GL6VeqYBOo3+Eix2lCm6zrB5OZLu/7S8JJg?=
 =?us-ascii?Q?YOdYEYYO/B03FKOfP+jUzdgM9CxPCjhUODOtLUjl88EPtdago10+TKn9rkhs?=
 =?us-ascii?Q?tJ//qEbBGOVp9qYSEnIfgBA6KHX1+h2Fx9KYHrt7HDgEOcLU8f+Z0PcTamMZ?=
 =?us-ascii?Q?BfdjRu/ePaeuY48RIJQSwvrWkj8G+0Yp7p1LLuZMlrSKbg8OwnpXA6sc0BA8?=
 =?us-ascii?Q?Sp7cbfiXtN9rR1I6ai5/J7fryQ2a23oalpt2pIBdZHF7cAe8nQv5qKrC4BOH?=
 =?us-ascii?Q?q2V1IlhJ04QumtJLb+7oNqJS0rxshd5n4xvG4wszmxmpuPuyKOmN0GnR6wOw?=
 =?us-ascii?Q?UyhAO4Xxg8OJVx9vVUL40tDQKUQ8Ut/3Alte5DjYKb0mtbnZSxZ/RNJ2O8xR?=
 =?us-ascii?Q?GYKTHFyfKcUxDH/WINFjM3JkaUlvAgvF4H+cZ2xNQBAte2W9kgQNwTp7TZM0?=
 =?us-ascii?Q?Qu8OXDFK5Hv6cO6XIwWZNEGgJy1JVJZZyp+rdMP0IKcrE92i/TUtoMi6CtMz?=
 =?us-ascii?Q?RlOY3VfUoE/f7a0gMS5fb+0hBhmUJOuqv5UKKS1XwE4t9iYY4CJXsnohVRjd?=
 =?us-ascii?Q?Zui2+Mc7O0FEgw3hfPR4+h0uHpNYRAMGC5tbon+38SIocZgUAtb/boJjyNN9?=
 =?us-ascii?Q?N5wt1ChWQnuAV/BOEjp3Ws0IhLbmHtfx2y9nnlAGYHMI7sa+jo7i2qzupeh2?=
 =?us-ascii?Q?JcIjntomPBCDXhbWYXStBSTSEDcg7U9d3V7OVCSS1gve8ZsE0jT9RKEm93Pi?=
 =?us-ascii?Q?MRoPno4kqMVczvb8iO9XdQm7e4peWHWbClBx4e5qn74kzE1EeUeQhOd78df6?=
 =?us-ascii?Q?C30lri+TjL6blpfahOE5uh/VPaylWIhoBvz2tTi2RSFcY9M/1U9SblOGmfdU?=
 =?us-ascii?Q?XkGShJ5xSaPdpoL4KYl2OFs4HcRbC2QGE8+V0x6PZuU2PEHiievRvCSqoON5?=
 =?us-ascii?Q?CCLe6IPwo50ljyP/heHAWy+LJaZqHYrnq5sO8VXNFZB7yDtGzWNvMMzTqj6V?=
 =?us-ascii?Q?nLgD53VGOvWbtwNJFin8EtZMOXPEm0/s0hRcDoEXLRPKCfVk64W9R/5/0IlJ?=
 =?us-ascii?Q?axRPk2+aga0rOLShh2vxFDjbEKLaFaq9hyoc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:00:24.0138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b027ab8e-e1c2-47de-e602-08dda87af718
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7430

Xen includes disctinct concepts of a control domain (privileged) and a
hardware domain, but there is only a single XSM_PRIV check.  For dom0
this is not an issue as they are one and the same.

With hyperlaunch and its build capabilities, a non-privileged hwdom and a
privileged control domain should be possible.  Today the hwdom fails the
XSM_PRIV checks for hardware-related hooks which it should be allowed
access to.

Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
platform_op.  The hwdom is allowed access for XSM_HW_PRIV.

Make XSM_HW_PRIV a new privilege level that is given to the hardware
domain, but is not exclusive.  The control domain can still execute
XSM_HW_PRIV commands.  This is a little questionable since it's unclear
how the control domain can meaningfully execute them.  But this approach
is chosen to maintain the increasing privileges and keep control domain
fully privileged.

Testing was performed with hardware+xenstore capabilities for dom0 and a
control dom3 booted from hyperlaunch.  The additional xenstore
permissions allowed hwdom+xenstore XSM_XS_PRIV which are necesary for
xenstore.

A traditional dom0 will be both privileged and hardware domain, so it
continues to have all accesses.

Why not XSM:Flask?  XSM:Flask is fine grain, and this aims to allow
coarse grain.  domUs are still domUs.  If capabilities are meant to be a
first class citizen, they should be usable by the default XSM policy.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/platform_hypercall.c |  2 +-
 xen/arch/x86/msi.c                |  2 +-
 xen/arch/x86/physdev.c            | 12 ++++++------
 xen/arch/x86/platform_hypercall.c |  2 +-
 xen/drivers/passthrough/pci.c     |  5 +++--
 xen/drivers/pci/physdev.c         |  2 +-
 xen/include/xsm/dummy.h           | 20 ++++++++++++--------
 xen/include/xsm/xsm.h             |  1 +
 8 files changed, 26 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
index ac55622426..a84596ae3a 100644
--- a/xen/arch/arm/platform_hypercall.c
+++ b/xen/arch/arm/platform_hypercall.c
@@ -35,7 +35,7 @@ long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
     if ( d == NULL )
         return -ESRCH;
 
-    ret = xsm_platform_op(XSM_PRIV, op->cmd);
+    ret = xsm_platform_op(XSM_HW_PRIV, op->cmd);
     if ( ret )
         return ret;
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 5389bc0867..30801d980c 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1360,7 +1360,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     if ( !use_msi )
         return -EOPNOTSUPP;
 
-    ret = xsm_resource_setup_pci(XSM_PRIV,
+    ret = xsm_resource_setup_pci(XSM_HW_PRIV,
                                 (pdev->seg << 16) | (pdev->bus << 8) |
                                 pdev->devfn);
     if ( ret )
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 4dfa1c0191..ce1ba41fa3 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -358,7 +358,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         ret = -EFAULT;
         if ( copy_from_guest(&apic, arg, 1) != 0 )
             break;
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(XSM_HW_PRIV, currd, cmd);
         if ( ret )
             break;
         ret = ioapic_guest_read(apic.apic_physbase, apic.reg, &apic.value);
@@ -372,7 +372,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         ret = -EFAULT;
         if ( copy_from_guest(&apic, arg, 1) != 0 )
             break;
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(XSM_HW_PRIV, currd, cmd);
         if ( ret )
             break;
         ret = ioapic_guest_write(apic.apic_physbase, apic.reg, apic.value);
@@ -388,7 +388,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
         /* Use the APIC check since this dummy hypercall should still only
          * be called by the domain with access to program the ioapic */
-        ret = xsm_apic(XSM_PRIV, currd, cmd);
+        ret = xsm_apic(XSM_HW_PRIV, currd, cmd);
         if ( ret )
             break;
 
@@ -490,7 +490,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&dev, arg, 1) )
             ret = -EFAULT;
         else
-            ret = xsm_resource_setup_pci(XSM_PRIV,
+            ret = xsm_resource_setup_pci(XSM_HW_PRIV,
                                          (dev.seg << 16) | (dev.bus << 8) |
                                          dev.devfn) ?:
                   pci_prepare_msix(dev.seg, dev.bus, dev.devfn,
@@ -501,7 +501,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_mmcfg_reserved: {
         struct physdev_pci_mmcfg_reserved info;
 
-        ret = xsm_resource_setup_misc(XSM_PRIV);
+        ret = xsm_resource_setup_misc(XSM_HW_PRIV);
         if ( ret )
             break;
 
@@ -567,7 +567,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( setup_gsi.gsi < 0 || setup_gsi.gsi >= nr_irqs_gsi )
             break;
 
-        ret = xsm_resource_setup_gsi(XSM_PRIV, setup_gsi.gsi);
+        ret = xsm_resource_setup_gsi(XSM_HW_PRIV, setup_gsi.gsi);
         if ( ret )
             break;
 
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 90abd3197f..8efb4ad05f 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -228,7 +228,7 @@ ret_t do_platform_op(
     if ( op->interface_version != XENPF_INTERFACE_VERSION )
         return -EACCES;
 
-    ret = xsm_platform_op(XSM_PRIV, op->cmd);
+    ret = xsm_platform_op(XSM_HW_PRIV, op->cmd);
     if ( ret )
         return ret;
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3edcfa8a04..9de7f0d358 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -672,7 +672,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         type = "device";
 
-    ret = xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_plug_pci(XSM_HW_PRIV, (seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
@@ -824,7 +824,8 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     struct pci_dev *pdev;
     int ret;
 
-    ret = xsm_resource_unplug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_unplug_pci(XSM_HW_PRIV,
+                                  (seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..c223611dfb 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -86,7 +86,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                         dev_reset.dev.bus,
                         dev_reset.dev.devfn);
 
-        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
+        ret = xsm_resource_setup_pci(XSM_HW_PRIV, sbdf.sbdf);
         if ( ret )
             break;
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 9227205fcd..d8df3f66c4 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -94,6 +94,10 @@ static always_inline int xsm_default_action(
         if ( target && evaluate_nospec(src->target == target) )
             return 0;
         fallthrough;
+    case XSM_HW_PRIV:
+        if ( action == XSM_HW_PRIV && is_hardware_domain(src) )
+            return 0;
+        fallthrough;
     case XSM_PRIV:
         if ( is_control_domain(src) )
             return 0;
@@ -275,7 +279,7 @@ static XSM_INLINE int cf_check xsm_console_io(
     if ( cmd == CONSOLEIO_write )
         return xsm_default_action(XSM_HOOK, d, NULL);
 #endif
-    return xsm_default_action(XSM_PRIV, d, NULL);
+    return xsm_default_action(XSM_HW_PRIV, d, NULL);
 }
 
 static XSM_INLINE int cf_check xsm_profile(
@@ -455,33 +459,33 @@ static XSM_INLINE int cf_check xsm_resource_unplug_core(XSM_DEFAULT_VOID)
 static XSM_INLINE int cf_check xsm_resource_plug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int cf_check xsm_resource_unplug_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int cf_check xsm_resource_setup_pci(
     XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int cf_check xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
@@ -673,7 +677,7 @@ static XSM_INLINE int cf_check xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 
 static XSM_INLINE int cf_check xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
@@ -701,7 +705,7 @@ static XSM_INLINE int cf_check xsm_mem_sharing_op(
 static XSM_INLINE int cf_check xsm_apic(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, d, NULL);
 }
 
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 24acc16125..264db4d8ee 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -36,6 +36,7 @@ enum xsm_default {
     XSM_DM_PRIV,  /* Device model can perform on its target domain */
     XSM_TARGET,   /* Can perform on self or your target domain */
     XSM_PRIV,     /* Privileged - normally restricted to dom0 */
+    XSM_HW_PRIV,  /* Hardware Privileged - normally restricted to dom0/hwdom */
     XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
     XSM_OTHER     /* Something more complex */
 };
-- 
2.49.0


