Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC241A5E4C1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 20:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910778.1317407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsS66-0005yX-L4; Wed, 12 Mar 2025 19:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910778.1317407; Wed, 12 Mar 2025 19:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsS66-0005x2-Hb; Wed, 12 Mar 2025 19:50:34 +0000
Received: by outflank-mailman (input) for mailman id 910778;
 Wed, 12 Mar 2025 19:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHyV=V7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tsS64-0005wg-I4
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 19:50:32 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:240a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40125a16-ff7b-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 20:50:30 +0100 (CET)
Received: from BN9PR03CA0191.namprd03.prod.outlook.com (2603:10b6:408:f9::16)
 by DM6PR12MB4282.namprd12.prod.outlook.com (2603:10b6:5:223::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 19:50:23 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:408:f9:cafe::59) by BN9PR03CA0191.outlook.office365.com
 (2603:10b6:408:f9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 19:50:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 19:50:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 14:50:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 14:50:20 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Mar 2025 14:50:20 -0500
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
X-Inumbo-ID: 40125a16-ff7b-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbVZvsQFwnDLfYVWUeiWvjdX2S/mMmpZRDKV4XR8oTiyAg3ChqWcHKCDfgoq8ovVDjKQnsKyoQYEp8LgwM8nXePixUnOu+MnVtnjjPOSqRP8PBM+Q5QwqcqIQ0ON8EEnjwI4DqncXEQ2XDaHGQTkqaoxWmHwCJd1Gfm4PzPQVPOMod0G12wpNe/9jLjDuL8RMxAYiAas5AbPj6nrdkgN3hdgMMlCDn+Y8+02Xu/es5A/gSqD2piRzLRoE3ydV6Tk01hW/AAAeywRX04XZH9HE0Y0fjFDTAH07xtHveZ27nMv/CO11DxaTZru2HKQUPEjjkcYIQrHY6K/djygZe9fUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9CuwYoZPsmM0ysqioe6mQ4s5vfv2OuUyv0T6a636ig=;
 b=GDMS6AqwW4gHLt8THCb9OVAWUui0k26kN6j1a9guLrWplqPbqFsFz2GJzH2ZoozkPEZZnIGhIgfwutlnnAB2GsOF6IdMMJs8wkfvBlUxsWQt4GXpnF2iEG72V1kpDHfTr2lixi3RfwY4PFfgZrlp5U8QaBrUFNR+N1GuQ5+EJR7G6E7Bn9AUe/FIpHCGw9UbDVaN+L6bAlqdYnIxKvv4hEmWFxXuupeijKXfa4igp/QcZEfPAaCWcwpX7+H0LJ6p14f0KKazgvI4XUKgPuvDDypHmZHJqCjDWc0zuFqowwBXKPRRoLu+QOwos01MelronxTMkQmtLRmOAG8oremK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9CuwYoZPsmM0ysqioe6mQ4s5vfv2OuUyv0T6a636ig=;
 b=csa/EMH8ccc8e3JUpmeCkDiWCqWGACXOGGHW4sNa2ULTeMI9UI9VGwSzWApLydmGOtYbEdJnk2fkN4bzllo3bSQhJ4ZJOybKQNGIktALoOXiYArI1iruFCdqTMlbRCK6VQMCL1oMjbCxLWKBt1caW8X0dlpcLlX0V62B46ctGHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] [RFC] vpci: allow BAR write while mapped
Date: Wed, 12 Mar 2025 15:50:17 -0400
Message-ID: <20250312195019.382926-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DM6PR12MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: bff3445c-abb6-451c-fd18-08dd619f2063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TedRd438rmk5sSQ1UUizeDn+k2jxyP182hzgU1COMKoOPTB7mwf56TDpzfXm?=
 =?us-ascii?Q?ZRsIuMOB30KG3qX1t8BJS9JdqHbcGTnKHBGQyG5mYEUI5UvvGPkDffOcppTN?=
 =?us-ascii?Q?gwc286mkVm8p+i5adaDQiDlenOgwbO3uWJZYtl8At+XMsHVEx5t0YfeXM7/E?=
 =?us-ascii?Q?weumuekEhOkwA2kdT3g6N86HEtOa7AIJUQK7huEtggEfiLfEa1LsCmiSEk+C?=
 =?us-ascii?Q?6MBLS2a2E6pZwEd79AngvwnHO5ywps/hgEtnKbXHoOoinz8LbWAvu9ANpith?=
 =?us-ascii?Q?n63D2kOiZN6IOw8aakxRPXS1Xh4Pz9yw31PRbBbp6EHCCSPalvD3y9IXv4Wv?=
 =?us-ascii?Q?ENhPWPnXBi99KmxV6CINL3L+23WqyhypFTxG+ImzUw4Gv6W6mbJScoSIfI8Y?=
 =?us-ascii?Q?dEMyM7W2khSk/0Dq05I9N6WqAjl9rb6fwQqFNFO005M3eE1zoDScs4J4Ohib?=
 =?us-ascii?Q?Ann5ho0yGh7mLG/JCPAAotIXnABOkbnQTF0UG9NCLwbr31HmJa82MEU71Se+?=
 =?us-ascii?Q?yakX4bE55SFfDwlfd8Hbe2l0fKBhJt9nmDlCgG2yvu4zlPzXAjSdDqJXQSa0?=
 =?us-ascii?Q?mWOAX7OLQs69TOYcnamaTPbzRhQQjcK6MHdVObCHBNhvwFI6fuWvAg9FGwbR?=
 =?us-ascii?Q?EG1hY5Xg1L7Lbl+ulkTRbRzn7/EFpGmA+44+yJlRV3nh7mliLsXbaH3NDtUX?=
 =?us-ascii?Q?NAImR6nlmV7JfjxmuudSUL+qU8yMEtKn85S53e+rFTlOCzHnTBaUv6PUPMKt?=
 =?us-ascii?Q?2SyHsislmVdkfa0tH+q/LUcu6NxyBno4y5yJIWQv0KA9AKvtsZz4W23bKz4a?=
 =?us-ascii?Q?NoKvBKOi06PA9J1SWzFe0/9kZq1CVe8iGbGfqOYzIwXjQLMNvPGoOW//HPAY?=
 =?us-ascii?Q?eNLK9Jkt2EYgHR0s61/vLI8Zdm+BldFPPUDEM+PtxdR14sTgSF+KYi1uWnGF?=
 =?us-ascii?Q?5J87rYYawi2NYkSM5MYCmOuVJt3oH00iWO01X/XAdN3/AkP1fCnuMI4vHiUC?=
 =?us-ascii?Q?IQlCaxhlnqdOZr19dSmTVwWlA3GEVqB4LvuGs2w3mAPoa6iq3j/5B1PyEQ85?=
 =?us-ascii?Q?OM6rzIHpDNkjkb8dcG9dUXCYE9esbuv86lK5LcIPy/Pf7WgStmb31U9qDa93?=
 =?us-ascii?Q?zkj9mZqKUlLQCjp3iWaCthBGx+hKVF8hSidSnm1yyBD+c5gpsZ8aYsmb/v/n?=
 =?us-ascii?Q?q2vyBFagGDvGzN+L+c7pc0Wl8PT6oA2VnqUdyg+ply+CZdQUQhsX7uN3LEtO?=
 =?us-ascii?Q?8vsbNHBt8t0trr/jYd+D3HTrZsktnDHHOE+feaKnKg5Cad1+NPiX3RyKwm5n?=
 =?us-ascii?Q?/nQ6Ocym0MqmaqPu3Lfw4EiNsROe+1Tgxqv+vaBZEseg3P9xg8mRm6mVfVJk?=
 =?us-ascii?Q?qXgczsIKS2cHjCsHyhXm121N/echITf7oCVdF1RlJTLUS/Cz3NLs43MyHKeY?=
 =?us-ascii?Q?s/9ci7obRnQWaFU0Q25nkg5EyDBCPpPsQPVV2AoCJzL/3o9QHsKemf7u3J5Z?=
 =?us-ascii?Q?O9M2+uRxo/FLzHg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 19:50:22.7127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff3445c-abb6-451c-fd18-08dd619f2063
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4282

Xen vPCI refuses BAR writes if the BAR is mapped in p2m. If firmware
initialized the BAR to a bad address, Linux will try to write a new
address to the BAR without disabling memory decoding. Allow the write
by updating p2m right away in the vPCI BAR write handler.

Resolves: https://gitlab.com/xen-project/xen/-/issues/197
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
RFC: Currently the deferred mapping machinery supports only map or
     unmap, not both. It might be better to rework the mapping machinery
     to support unmap-then-map operations, but please let me know your
     thoughts.
RFC: This patch has not yet made an attempt to distinguish between
     32-bit and 64-bit writes. It probably should.
---
 xen/drivers/vpci/header.c | 65 +++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..66adb2183cfe 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -173,7 +173,7 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         ASSERT_UNREACHABLE();
 }
 
-bool vpci_process_pending(struct vcpu *v)
+static bool process_pending(struct vcpu *v, bool need_lock)
 {
     struct pci_dev *pdev = v->vpci.pdev;
     struct vpci_header *header = NULL;
@@ -182,12 +182,14 @@ bool vpci_process_pending(struct vcpu *v)
     if ( !pdev )
         return false;
 
-    read_lock(&v->domain->pci_lock);
+    if ( need_lock )
+        read_lock(&v->domain->pci_lock);
 
     if ( !pdev->vpci || (v->domain != pdev->domain) )
     {
         v->vpci.pdev = NULL;
-        read_unlock(&v->domain->pci_lock);
+        if ( need_lock )
+            read_unlock(&v->domain->pci_lock);
         return false;
     }
 
@@ -209,17 +211,20 @@ bool vpci_process_pending(struct vcpu *v)
 
         if ( rc == -ERESTART )
         {
-            read_unlock(&v->domain->pci_lock);
+            if ( need_lock )
+                read_unlock(&v->domain->pci_lock);
             return true;
         }
 
         if ( rc )
         {
-            spin_lock(&pdev->vpci->lock);
+            if ( need_lock )
+                spin_lock(&pdev->vpci->lock);
             /* Disable memory decoding unconditionally on failure. */
             modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
                             false);
-            spin_unlock(&pdev->vpci->lock);
+            if ( need_lock )
+                spin_unlock(&pdev->vpci->lock);
 
             /* Clean all the rangesets */
             for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
@@ -228,7 +233,8 @@ bool vpci_process_pending(struct vcpu *v)
 
             v->vpci.pdev = NULL;
 
-            read_unlock(&v->domain->pci_lock);
+            if ( need_lock )
+                read_unlock(&v->domain->pci_lock);
 
             if ( !is_hardware_domain(v->domain) )
                 domain_crash(v->domain);
@@ -238,15 +244,23 @@ bool vpci_process_pending(struct vcpu *v)
     }
     v->vpci.pdev = NULL;
 
-    spin_lock(&pdev->vpci->lock);
+    if ( need_lock )
+        spin_lock(&pdev->vpci->lock);
     modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
-    spin_unlock(&pdev->vpci->lock);
+    if ( need_lock )
+        spin_unlock(&pdev->vpci->lock);
 
-    read_unlock(&v->domain->pci_lock);
+    if ( need_lock )
+        read_unlock(&v->domain->pci_lock);
 
     return false;
 }
 
+bool vpci_process_pending(struct vcpu *v)
+{
+    return process_pending(v, true);
+}
+
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             uint16_t cmd)
 {
@@ -565,6 +579,8 @@ static void cf_check bar_write(
 {
     struct vpci_bar *bar = data;
     bool hi = false;
+    bool reenable = false;
+    uint32_t cmd = 0;
 
     ASSERT(is_hardware_domain(pdev->domain));
 
@@ -585,10 +601,31 @@ static void cf_check bar_write(
     {
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
+        {
             gprintk(XENLOG_WARNING,
-                    "%pp: ignored BAR %zu write while mapped\n",
+                    "%pp: allowing BAR %zu write while mapped\n",
                     &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
-        return;
+            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+            ASSERT(spin_is_locked(&pdev->vpci->lock));
+            reenable = true;
+            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+            /*
+             * Write-while-mapped: unmap the old BAR in p2m. We want this to
+             * finish right away since the deferral machinery only supports
+             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
+             * be better to defer the write-while-mapped case just like regular
+             * BAR writes (but still only allow it for 32-bit BAR writes).
+             */
+            /* Disable memory decoding */
+            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
+            /* Call process pending here to ensure P2M operations are done */
+            while ( process_pending(current, false) )
+            {
+                /* Pre-empted, try again */
+            }
+        }
+        else
+            return;
     }
 
 
@@ -610,6 +647,10 @@ static void cf_check bar_write(
     }
 
     pci_conf_write32(pdev->sbdf, reg, val);
+
+    if ( reenable )
+        /* Write-while-mapped: map the new BAR in p2m. OK to defer. */
+        modify_bars(pdev, cmd, false);
 }
 
 static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,

base-commit: 8e60d47cf0112c145b6b0e454d102b04c857db8c
-- 
2.48.1


