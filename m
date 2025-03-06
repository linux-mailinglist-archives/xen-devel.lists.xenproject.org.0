Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF46A559FD
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904252.1312217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJuH-00024c-Nv; Thu, 06 Mar 2025 22:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904252.1312217; Thu, 06 Mar 2025 22:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJuH-0001yM-Hm; Thu, 06 Mar 2025 22:41:33 +0000
Received: by outflank-mailman (input) for mailman id 904252;
 Thu, 06 Mar 2025 22:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJKD-0000St-3U
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:17 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f403:240a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f14b6171-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:04:15 +0100 (CET)
Received: from IA1P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::7)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 22:04:07 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:461::4) by IA1P220CA0010.outlook.office365.com
 (2603:10b6:208:461::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:04:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:05 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:05 -0600
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
X-Inumbo-ID: f14b6171-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BX/xNsIhWD4JNSkV2eBTflu00DaZC8XJr7yFLJEzkaeZQLT6rETaHiWdcaKZ55YpUnWb4bZ+X6dXRUfyj8/v7PaPwv43ltGGLl0LacUdvaTQpJDwfEH80DI1QO592nLHD0PCd7c6WkWXXuxswP2wZHrk7A1Iw5bFtvlMcvnTGCrMokyS9z7ubFPUnJOJhP+1Jh2i/PRlcuDnebUJQ0y3TS9q+n3E29zMe3RVkfheX9WfJv+J20I5/cIXgFeBpueHnbfkUn2inwxFa/BSO2GvjHdVtyOXqQVNTj0szXY71Vh229D0QdOXeAISEjLW5zmrVj5K97GxYFoUozUsqKEa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh5UOfi8/DTDce9DcK5p8yN56G6mdaBxAbc7mBhaKuI=;
 b=DSLYuGx/mcCMYq3xE5MmPROgHhZjK8LZsRTotueKhpWSMwAdcdJ1ZjfFqhFIR8/G3X2VubtdEvDBLiZOqXbtjJCuWUZ9VoEuWQU4GxPRM7mVn1SECF4irAhett+zHoWrnZyTzFcwvhy0eJ6mMlpWdqNg6cYxmyNLcFkPmgr0z75FA0XJmc0cjY2OBXHRxAzbykclY5fe2k+wd+KEA980Uyz/ctb0kds+urycrbTjp6S0WVKX+Ds/X182RdzjGHGEh0FxsQKMTGF8FeVHOzKlZ1KKURV8HdTPm0x1mZzqAwa5ViHcPEKFginWHifDfLXROI+7GsT/SOsmIUT3ypgnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh5UOfi8/DTDce9DcK5p8yN56G6mdaBxAbc7mBhaKuI=;
 b=WslNN3vuRlBitgNOTeeMHnpal0onLbrkgNpzCgFunUedQGBGgZN7nsVhsZydklfQtiSJ91GExA+AJXj3gqWjCjm2FOpqnrx3LZrFXn/xraMTw8shrOGvmemaUsgF6c79TxuodaRGYZ3iYPBstkuHzggPcksiAJnW4EvV8KGmuWY=
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
Subject: [PATCH 15/23] xen/xsm: Add XSM_HW_PRIV
Date: Thu, 6 Mar 2025 17:03:35 -0500
Message-ID: <20250306220343.203047-16-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 77133fa7-56fb-4f48-f460-08dd5cfad0a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kvn6oHaegUk0rpDEHUawzuuqKZ4UG8pziUnjWLc7gBmTJASG2RIXhzxJWHew?=
 =?us-ascii?Q?pYRgioDj8Yx+7553XblW6f2yTtYhTrKkXKAj2Al/hc93tsRa4H1ANoTlF8FF?=
 =?us-ascii?Q?jrO41umnllUWLk5180Ppsn+DNvhVU7H/76l5cKbhHwq6ydZxMXBnnakW+V+b?=
 =?us-ascii?Q?vFc9q+W2B+HBtATrvVY1yOlcuni3tsel7W0uoIiT+8Ip/74phatX6StoOFZX?=
 =?us-ascii?Q?w+4tHyFfXNGpYLOqTNxr8mfYLGhPCiuzQxPtFSiXgrETMqO8txxKtbqTmFfN?=
 =?us-ascii?Q?3QSiMV6780AMzvfTR8jK3KR9hNpTeMDmrG7thAuaC3ifD65/gDXxL+mYAI6U?=
 =?us-ascii?Q?s+LYBPu0YJvy80JbWxc9ftQSQf7fgDWxUc14TPWH8TzaaiF1lz7Qp+5Wyrdm?=
 =?us-ascii?Q?J+ZN69b69S1KRm0RZe8xongVu6OeWGNmfn2Oi31IZefyJc9JBavUyalqoGes?=
 =?us-ascii?Q?fvr079bT7YJYxQmvU8rdEWj1dY18IIVIeLPjlW+1tHCPHLjKENFqulCERR0X?=
 =?us-ascii?Q?bCX1fZGjj5iXxqLlz5fei+s9JGu2vSR9ltnp9Ipi4WxXZmTfzNOL0q0xrfRC?=
 =?us-ascii?Q?yjiOAk6w42yh0/V4Fw1R05XiBJrXDSPzr0HQ411hrUsfn73Vnv5Sq7B/Nv10?=
 =?us-ascii?Q?eeINScAoEmY4zT0/glE3E7yZFUp2GDUTQyD24l4WFPiM2eCMnezjc7uv8pA7?=
 =?us-ascii?Q?PLO6IQTj5ChE6pRANllrM/EZnKehzmLAzARCbmQOsuV4OPBIwnDnUDZjAIIE?=
 =?us-ascii?Q?BBVQ3eANvefDwQKvgh518u2CiOFUNbU1xjeDxqk5+slKUtVBX3K9ty/Z94jj?=
 =?us-ascii?Q?JPK2V83UqyCw3jekQ7t3ExVXAffr93KTX5pYKV2hQHipWnKfbakRxKliRMZK?=
 =?us-ascii?Q?r1+nvjncIurVgbL/x5aG/BVhXH0jS+X0yc2jceFMT3YLg1Y4HOr4huaEBF6c?=
 =?us-ascii?Q?psE5IOcxHLp5uw6jnltmKkKNE46uHhaJHoeEl6D6d86shy4rY+s1YLWdoCrj?=
 =?us-ascii?Q?c8Nbud6kXe8Z5aTnJQFaKDmz+R74mzeLwOwIX+IDrZPesY4IBCdKejMBdMPv?=
 =?us-ascii?Q?fVMLsQD0FhfINNmrO2nbllXOaa4nXn2MTR5cOH8s221fhG+RaJsinx0Di5+B?=
 =?us-ascii?Q?loRGmdhqnDneAvx51bUPErOvZA1ktMEkrIoYyy24XbaCG+DY62kT22Eoc3ET?=
 =?us-ascii?Q?UtFK02ueSq4lgfsovQtZuJY29WTaycMNTyLvIrSb5XhNhs0NL4ujqJigogYs?=
 =?us-ascii?Q?P5mA3s1TfwFAUpJfKQlNMi6+BoXNpj8N6fRRq0cwatDf6nUqZWfAx/VAXbx4?=
 =?us-ascii?Q?uuYMTaxnF+iANc83MW6kiYNfivu0iaTrHY+cnIsl9w7iCB1MeootPZJaUdgx?=
 =?us-ascii?Q?4BfUdUcsMZgD1JBtGAwpQPDZ3pV4UrYSuLgU072MZ1GT0mTGflpna7AfBJOk?=
 =?us-ascii?Q?3e6ym+3R8yg4GhWhT/A6Ew+qdsHtikczGpe1RWT7xvBIjV1r1JU9sk4VqmZN?=
 =?us-ascii?Q?in6gq2Qg4virg9k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:06.7929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77133fa7-56fb-4f48-f460-08dd5cfad0a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340

Xen includes disctinct concepts of a control domain (privileged) and a
hardware domain, but there is only a single XSM_PRIV check.  For dom0
this is not an issue as they are one and the same.

With hyperlaunch and its build capabiliies, a non-privileged hwdom and a
privileged control domain should be possible.  Today the hwdom fails the
XSM_PRIV checks for hardware-related hooks which it should be allowed
access to.

Introduce XSM_HW_PRIV, and use it to mark many of the physdev_op and
platform_op.

Previously, xsm_default_action() was almost linearly increasing in
permissions with its fallthroughs.  When it gets to XSM_PRIV, all
permissions were allowed for the control domain.  That needs to change
so the control domain cannot access XSM_HW_PRIV.

The hwdom is allowed access for XSM_HW_PRIV and XSM_DM_PRIV.  The
hardware domain providing a device model for a domU is an expected use
case, so those permission are needed as well.

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
 xen/include/xsm/dummy.h           | 22 +++++++++++++---------
 xen/include/xsm/xsm.h             |  1 +
 8 files changed, 27 insertions(+), 21 deletions(-)

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
index bf5b71822e..6b4bc712c5 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1355,7 +1355,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     if ( !use_msi )
         return -EOPNOTSUPP;
 
-    ret = xsm_resource_setup_pci(XSM_PRIV,
+    ret = xsm_resource_setup_pci(XSM_HW_PRIV,
                                 (pdev->seg << 16) | (pdev->bus << 8) |
                                 pdev->devfn);
     if ( ret )
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 69fd42667c..b0bb2b846b 100644
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
index ab25840e20..f25d00f7c4 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -678,7 +678,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     else
         type = "device";
 
-    ret = xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
+    ret = xsm_resource_plug_pci(XSM_HW_PRIV, (seg << 16) | (bus << 8) | devfn);
     if ( ret )
         return ret;
 
@@ -830,7 +830,8 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
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
index 06f4eccf5f..4536ee5dad 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -95,7 +95,11 @@ static always_inline int xsm_default_action(
             return 0;
         fallthrough;
     case XSM_PRIV:
-        if ( is_control_domain(src) )
+    case XSM_HW_PRIV:
+        if ( is_control_domain(src) && action != XSM_HW_PRIV )
+            return 0;
+        if ( is_hardware_domain(src) &&
+             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
             return 0;
         return -EPERM;
     default:
@@ -280,7 +284,7 @@ static XSM_INLINE int cf_check xsm_console_io(
     if ( cmd == CONSOLEIO_write )
         return xsm_default_action(XSM_HOOK, d, NULL);
 #endif
-    return xsm_default_action(XSM_PRIV, d, NULL);
+    return xsm_default_action(XSM_HW_PRIV, d, NULL);
 }
 
 static XSM_INLINE int cf_check xsm_profile(
@@ -460,33 +464,33 @@ static XSM_INLINE int cf_check xsm_resource_unplug_core(XSM_DEFAULT_VOID)
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
 
@@ -688,7 +692,7 @@ static XSM_INLINE int cf_check xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 
 static XSM_INLINE int cf_check xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
@@ -716,7 +720,7 @@ static XSM_INLINE int cf_check xsm_mem_sharing_op(
 static XSM_INLINE int cf_check xsm_apic(
     XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
+    XSM_ASSERT_ACTION(XSM_HW_PRIV);
     return xsm_default_action(action, d, NULL);
 }
 
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 4dbff9d866..404491ef62 100644
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
2.48.1


