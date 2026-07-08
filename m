Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zjOfI1C7TmrITAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D82C72A684
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WGG9z+vF;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357349.1611784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQo-0003s9-Pg; Wed, 08 Jul 2026 21:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357349.1611784; Wed, 08 Jul 2026 21:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQo-0003pc-Id; Wed, 08 Jul 2026 21:03:46 +0000
Received: by outflank-mailman (input) for mailman id 1357349;
 Wed, 08 Jul 2026 21:03:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQm-0003j1-IY
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQl-00BD5T-D8
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebaf3-e002-0a2a0a5209dd-0a2a45079420-46
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:43 +0200
Received: from [52.101.57.60]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb2d-9c8e-0a2a45070019-3465393c8e62-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:42 +0200
Received: from DS1PR07CA0018.namprd07.prod.outlook.com (2603:10b6:8:44d::13)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 21:03:34 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:44d:cafe::6) by DS1PR07CA0018.outlook.office365.com
 (2603:10b6:8:44d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:18 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:15 -0700
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBd69AFckwXcGfxN159ZrR3dqKHiqHQaMPcROPcKBoLbmMjKPOW+uYfiuKGqSOrRgzn62n86tHDjo+FUfCCM1+BZ5vd8r60Dm0bLMsReh+WpTo1M3c8jl+dqO6FpSI54Qa1BysBeZgO6P6IdaznKXmT3uUl1MX2NB8jNupIvJLTXz2USYQySSTyIHckfkgpzCjYODP43pC+uR3lNK8UhI4gBZR9vf3Ar66u+rHEKW88gjHczK3nz45tfTiSXTsMSxYE8mdll6ppnShb5betSl+1+fH2+9Z7aFZixQGxricrzLnWVjwOQudhx2V/o6Mhwx7ekse/b2QFg/CxGUzbiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMH2OpeOLM8+juWpQGgzXCROZP9A2bpoLNjB3cnaChc=;
 b=Xei8wWjrcjqCuMM2RaR9bGum22z+MGnsrqWNx++heMakBTNyWxXBkOd649Sk8LAfqvO8CnB3gO0a/VVAjPx7l7Z/AyJ0TDLLXwxa4QzLX+Lh5OOKneOcA2WfUWa8/RlRlzc2varvSknriu0EAOj54sqinDWwjwAzgFdlvx8fEFiDA6IIahKv5wmTHNxi+9hY6JRsee8Ibd+bLY2WCPTfBfdrdKH1a9Hil+Hi6Tjv9qPw2F7FFiXvqmKtOMO1x4Yx8w4qrGaxNPhk71gv4QsdueEDiP7Tocv2gV8dKjL+xQzawC9ixfJDuBplPfrTy34ZSb4yvmQTSLBCAqHBw2WbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMH2OpeOLM8+juWpQGgzXCROZP9A2bpoLNjB3cnaChc=;
 b=WGG9z+vF7ek6jI9gxqcvqwwfW6tt9dXp+X3oKaeEjpgYe7kcfV/ncI5XgP8/98kv2/dgyMbACGswcLLVIxN7EtazDAgjmUZ9U0qMZp4tDT01esXd+A3XXoAyu1dgNBfmwpqjHOd6UxO0AOUO0llsm1fvL8FqABFeLeZYyVxy5Js=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v5 1/9] vpci: move BAR mapping permissions checks
Date: Wed, 8 Jul 2026 17:02:16 -0400
Message-ID: <20260708210233.922275-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708210233.922275-1-stewart.hildebrand@amd.com>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c03e06-8427-4e0e-ef31-08dedd345f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	YK/CRFC7v5jXTdS3MAIU5GVlvNro234PO7Rq3+hwOP0jdqSbitQ8DnLyrvMFlrE2eBE4YA4jDUc6y2QLxeBoqtFEOFxYEW2QnEjYdEJ0uOLhUt7HPDhCTKwE3kBATyhGfJzZEPcIkSU2Y0w2JllvyOR7zTHab+X/FbyC/62+0iYPTdrCB7Vu96/vFVKe3f+/bOYdkLsT5T4WmNMd6LL4/m9x9J1jSMz57S9aWW5Dl/gMb6UChs0esb+/orhpYisFmZoTvzJ3X8sM0aUR599OGfsx7jNKPuGqtSTDrwUkarqNhNANcJlgYkQz74LmNI9WgOmDq2bC1COHrNzz3UjVTau6e9ocFzQUgByMYfDSjWmJPr1acFMLco/Rkb7LYB2yJIAA8HGeLrVTNOJg2E9wouQt1AgXGWXd8sIZWexpkNih803o73E/h1bHzh1lyjOEerriEIOKbdRko7zJfda83JwzUVxU7VPXELcrmbNfD6JRBHEkiLj/I/IAf5GX4uX2L2uJaSvYwdBpy7BpHKkq7XIZV8qra/FS6PScV0biPo6rYZwxK41ojZX2O7iEOhVguU/HN2VEVonF/qwr77ygCjco9S+g2thfeqk5lguIqMiKfDpjqVm4/K+LNYHEwQnF5QyZWlH6aHIn+pVMqDa2V3TaFjgLp5QjOLVKCWrdmm95aRXD9V3hM6y0qIo0nqGd91HOx04NJWfavX08+j4iDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pRnIGqFpTfdkn2mEgt1ONrWuYR9tzZ9a63sbQLchIaYtfUsTFdlZF/Jh6LjM0sY0/8cfwiuUlkTK9e/6mXkTLGp+lFDYdHA4Y5GvUxK46JJ3N9jdvzWAiKtR8JJNI20IzZZx5/ejqAweZ1PUWjRQe4GLZBR7h72x+66GIs6FI6PGwcPwEP9joXYD9m9qbUpbvMAPzRhTiOeXpQM2alx8p8+m/B0hxLTWsibRux9F5AyvkeURFaxlD+1/h5rzOX0Oll0QpsfQyGro0sH1IvYomlZP163zQ1Ntf50xdsXp9WLiLpHeewGuAM8l83HzQ3eNgq0ezfd+0Ka4II4NaMtuzgAeVtzJ7+t4EGTERAJJzQ/yB05S2AOtbYn5I7BEdiRpyeuSe4tMYW70wYDeXjq06X0nh5JGMs6J9M/mfz2YoU73D6TG/PTMIjMSjee9/DCI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:33.9071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c03e06-8427-4e0e-ef31-08dedd345f49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234
X-purgate-ID: tlsNG-ef75cf/1783544623-145FC25E-C2C5DDF4/0/0
X-purgate-type: clean
X-purgate-size: 2667
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D82C72A684

There's no need to defer the permissions checks. Perform them right away
in modify_bars().

As a result of the move, the permissions checks will now cover the whole
BAR before any holes are removed.

Carry over the domain_crash() in the error path for domUs.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v5: new patch
---
 xen/drivers/vpci/header.c | 40 +++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index d1c92cf77f8a..5ac525036672 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -58,24 +58,6 @@ static int cf_check map_range(
          * offset of the current address from the BAR start.
          */
         unsigned long map_mfn = start_mfn + s - start_gfn;
-        unsigned long m_end = map_mfn + size - 1;
-
-        if ( !iomem_access_permitted(map->d, map_mfn, m_end) )
-        {
-            printk(XENLOG_G_WARNING
-                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
-                   map->d, map_mfn, m_end);
-            return -EPERM;
-        }
-
-        rc = xsm_iomem_mapping_vpci(XSM_HOOK, map->d, map_mfn, m_end, map->map);
-        if ( rc )
-        {
-            printk(XENLOG_G_WARNING
-                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
-                   map->d, map_mfn, m_end, rc);
-            return rc;
-        }
 
         /*
          * ARM TODOs:
@@ -369,6 +351,28 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             return -EINVAL;
         }
 
+        if ( !iomem_access_permitted(pdev->domain, start, end) )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pd denied access to MMIO range [%#lx, %#lx]\n",
+                   pdev->domain, start, end);
+            if ( !is_hardware_domain(pdev->domain) )
+                domain_crash(pdev->domain);
+            return -EPERM;
+        }
+
+        rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
+                                    !!(cmd & PCI_COMMAND_MEMORY));
+        if ( rc )
+        {
+            printk(XENLOG_G_WARNING
+                   "%pd XSM denied access to MMIO range [%#lx, %#lx]: %d\n",
+                   pdev->domain, start, end, rc);
+            if ( !is_hardware_domain(pdev->domain) )
+                domain_crash(pdev->domain);
+            return rc;
+        }
+
         rc = rangeset_add_range(bar->mem, start_guest, end_guest);
         if ( rc )
         {
-- 
2.54.0


