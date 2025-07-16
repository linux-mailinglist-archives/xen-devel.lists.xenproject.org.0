Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE77B07F75
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045773.1415988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9Zz-0007jw-7P; Wed, 16 Jul 2025 21:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045773.1415988; Wed, 16 Jul 2025 21:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9Zz-0007gn-4M; Wed, 16 Jul 2025 21:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1045773;
 Wed, 16 Jul 2025 21:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9Zx-0007F7-CC
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:17 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2408::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2b12f39-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:16 +0200 (CEST)
Received: from BLAPR03CA0163.namprd03.prod.outlook.com (2603:10b6:208:32f::7)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 21:22:10 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::c4) by BLAPR03CA0163.outlook.office365.com
 (2603:10b6:208:32f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:05 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:04 -0500
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
X-Inumbo-ID: f2b12f39-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vifidIaQvvU8G/aTXp69WqBEKv3Wje5iCCBEJUHnjZiDeWAgMW4nbWwNGYY+pSzWQWnrHJDPHHwcnVp0hwHncIm1hgNk/8DOVt7tg4YFVkG9os5gfzZvUulASX5ahRV46TlRrguEXgfArZz7RakdncYhCv8t9On2F2IOttncZV8WWD7w+iC3MGgW6EkZzUdBjxQbK/1BJATkvS63OYqOo2fHbxmexr2QwFxx5SqtTDBsORfTyJXqFaTgzlVX4TI9f1+mImPXXCO/fLGGyz1jjLUlknjx5KYppgqanQygrT4D8cAEZJp/CcDUSpUg797+OIfFzbaOXpFgM4kG2ppDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M874AgAk3AnYllKGR1EeBj7fMWDRaQxoJ2sGMdv1/A=;
 b=eMf1W/c9tNCOIzWuOtmE4uoCPwX/XfGAymaCfk+CgiHZpwmIZ0g/ib1kLjyKO1MRd6YsgkTiHGX+SXWCA5J/eR+4gR2Y4ToLLMeNC6cyB8Pq0o3r2395EsM7y1EYt2qJv/d4vXPU1WdBIOXz2Yx7O1c/B28cRQtC3crnMq/PEADDVH733W2baOeiZkyK4drHaCCFZ8eU/01XfsjJyU4Wo9rPBr+GY0aWahvfnV7GE/4i7O5VnkqcYttNTOvKbgdRJnMc67Q5Ke/8I4KTPBe59huLw9xRnJVFzPS5i67Fv4kku74lPSefSZwStt0KwG3OZ4vpBCLbMQZUXqnO1u9fSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M874AgAk3AnYllKGR1EeBj7fMWDRaQxoJ2sGMdv1/A=;
 b=tttf+AsGDi2vatDnnRxfmB34DzuMp2kAQUhKN1vOj9KEH9mYFey5IhamRosRYvZA3EGXlhVLYG5RsD/i7w+AMivoAIPqWFGmqkCdGw4wRMKwUP+X7utmYL3pLcshrtj99HX91XnnIvnYOpwXJx2r/tslTVESp1a9RcjZI74Dy+s=
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
Subject: [PATCH v2 01/17] xen/xsm: Add XSM_HW_PRIV
Date: Wed, 16 Jul 2025 17:14:48 -0400
Message-ID: <20250716211504.291104-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 77500afb-8347-473a-430b-08ddc4aed2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xa/x30/kHcKv2z30uCAsIh8ppqTumh3e7O0turJDrRdNuUWHxbiHtXJx99O7?=
 =?us-ascii?Q?mrWxV12yBgOumT0XxU1iPE9kuOwZmcP+oTUik3fEkY48uQbFWwDW15j4ZWBO?=
 =?us-ascii?Q?/vYk7Bg9pPgHIa59gofOqBU+PYacYn6dSIl2Sh1GXrUCT98Vsi8DHVvgbUFN?=
 =?us-ascii?Q?GQ0MEMJfyKSFUACxuHvn9Itldg55xbfsmZyLcOfB7lk9m/iyUC4A9S/b64db?=
 =?us-ascii?Q?Cyp38bxwV4jP9aOrBB2TFoMP2IUKApwpBm63OWxIdWp+H6gk/blsCaWScgVH?=
 =?us-ascii?Q?oGsGTUFgjrty8pD1WA3HG/445HCnX+X0jN84eRTNXdR/QPEQDDbF0Ukw33RC?=
 =?us-ascii?Q?poMaKIpazpFBFDuTlG22+0EurXVjibOJXWbJnLEILhodAAAPciiPXzoiCtuK?=
 =?us-ascii?Q?THkzPjiFT8dUrrIDz9779bf+M+eaRRDNZfREUe15JlYgJfPf5OmvjJfBouhb?=
 =?us-ascii?Q?AoAu/CAiLprTfzzlK/qXs9b5qMggEFtHQl1k5fHVaisdHN1iTYmRjCJJKtAI?=
 =?us-ascii?Q?9GUXzvhKHt92249pDIawSikGeln0oEm9U5+Zjc99acJXDmmdTIfkcHN9oc/O?=
 =?us-ascii?Q?iNhRNYC3duPUFOW4pV3j6ruNl+tExsx99kGEoT9qtW5vjiER+p+5HLGcDrCl?=
 =?us-ascii?Q?M4g2GrosI9dgW3kCK9WCYlVgTSVXgt4BCXBga5pdzVhRSp8lpt/aSd69lBMP?=
 =?us-ascii?Q?na4+XY06Mb7Pm3YPzif51t9XRtrfnwbC4Fx7C+yhZsudJMrdzmgBRe0t6I/K?=
 =?us-ascii?Q?+ZhiL6Fz0vPzs96bfLg4ShONG3wjEyLc8da/iMQvZQjJ6aZ3chYeIWS5Qjk7?=
 =?us-ascii?Q?ZL1/2X3bOMhgH1yuq2Mz5H7WyIiZioRjtO/pRSdqgCq3CiaQX53ry1BHTV1T?=
 =?us-ascii?Q?wkzKewTbDEG+AkssvAMZ9A+PHxTgLCQ4hlbWR9q87ZJmWJ5rACMY8CQAREIO?=
 =?us-ascii?Q?+Pa4H4n1lgMa75hqbCHDVNQQpw/9AyB4qu6mtqYh+uL/Hm0iikyAl3i9Q70k?=
 =?us-ascii?Q?NPT8G8Wg6MniJV8dz5k0kNr6xhfQCDl7gaPnnuRunFwz6hwFBTTRYzJdZS03?=
 =?us-ascii?Q?tHBhO+doJZ4BN/x2M2Hx7ShUoUYVvEWvDAChJ8AXnfnMYOMhe8onL2JzEdPx?=
 =?us-ascii?Q?+gpr3BCFZPCe87LSc1nlQjsHvZ2mvEca08QpyIbnANj7sYfb+YUGF+IqxCR0?=
 =?us-ascii?Q?q27IKseYfzlVvOHHHxmjgWpbLvogPwYIdZBnfhAaONbZ0oq0Mjl0jj2K0zAb?=
 =?us-ascii?Q?ktTG0ab8iYjcSq8pWNUPE10sIycBNro0c8wKivoS4XRHMtqashemYBFv/GOr?=
 =?us-ascii?Q?dgf9KdbUMTNB8dFEvFycX6kA6ZUqjFfoc6hseIL05FFqhnxedWLbrxHlUYes?=
 =?us-ascii?Q?GmZQXb4CCw3Wn5Tz+Y3Rp04mkJkbxtxk/sHpoPRpVS0IUx+gfg70+21CmbLM?=
 =?us-ascii?Q?GubqQ3N1B9W1taQTQJOhGnA/UDrrEKBZ6ucQr2Lnm2hMrtKydg9503xltEMo?=
 =?us-ascii?Q?h2wIUPeekOaWFH7Le3LODgHuplqicEnQRfF5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:09.8820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77500afb-8347-473a-430b-08ddc4aed2f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464

Xen includes disctinct concepts of a control domain (privileged) and a
hardware domain, but there is only a single XSM_PRIV check.  For dom0
this is not an issue as they are one and the same.

With hyperlaunch and its build capabilities, a non-privileged hwdom and a
privileged control domain should be possible.  Today the hwdom fails the
XSM_PRIV checks for hardware-related hooks which it should be allowed
access to.

Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
platform_op.  The hwdom is allowed access for XSM_HW_PRIV.

Make XSM_HW_PRIV a new privilege level that is exclusive to the hardware
domain

A traditional dom0 will be both privileged and hardware domain, so it
continues to have all accesses.

Why not XSM:Flask?  XSM:Flask is fine grain, and this aims to allow
coarse grain.  domUs are still domUs.  If capabilities are meant to be a
first class citizen, they should be usable by the default XSM policy.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Make XSM_HW_PRIV exclusive to hardware_domain
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
index 9227205fcd..2b0ed25cc5 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -98,6 +98,10 @@ static always_inline int xsm_default_action(
         if ( is_control_domain(src) )
             return 0;
         return -EPERM;
+    case XSM_HW_PRIV:
+        if ( is_hardware_domain(src) )
+            return 0;
+        return -EPERM;
     default:
         LINKER_BUG_ON(1);
         return -EPERM;
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
2.50.0


