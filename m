Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vdmCFU67TmrATAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5972A66E
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=s2XqaLTZ;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357350.1611786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQp-0003vU-1D; Wed, 08 Jul 2026 21:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357350.1611786; Wed, 08 Jul 2026 21:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZQo-0003s5-St; Wed, 08 Jul 2026 21:03:46 +0000
Received: by outflank-mailman (input) for mailman id 1357350;
 Wed, 08 Jul 2026 21:03:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZQm-0003oJ-QG
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:03:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZQl-00BD5T-Vf
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:03:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebafe-e002-0a2a0a5209dd-0a2a4509dc22-34
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:43 +0200
Received: from [52.101.57.41]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb2e-97e6-0a2a45090019-34653929b111-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:03:43 +0200
Received: from DS1PR07CA0020.namprd07.prod.outlook.com (2603:10b6:8:44d::18)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 21:03:34 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:44d:cafe::46) by DS1PR07CA0020.outlook.office365.com
 (2603:10b6:8:44d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:03:34 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:03:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:03:24 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:23 -0700
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
 b=SV53JJaYr5hfkslGHN8rbgoHokAOxB7L8gWZGW+cABWcfzi3vg3IeJzReIKzViltEThcf2QNfXVmOuZ1LHS1uzogmjwPjgF2ccEiXJ6YRGDRkBltBRBbra/LViCeY9gMEcDWgCGjKfdoPWu4FXr8MQBE86XGR9oA/Mm7fFwzcRovpspKI36OMuihQu95YcHJxLvJGT9qCm4dz4dEPFF8qyJ9LEXOE52uEyvHDv6X0xh8I0Qe5/tG11/27HwBxicGM5O7CvfKfZQDlLg7vsKdOWr78QeOVF8yO+ouUwuXMdHAQ7pliKM5tZLsKI3xzcRpKh3NHCIx9QQM8FAMLSv2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX3mDmX0UiOUsankD8ZHIzdyC6Ou3P5sTJu+c9AM/Nc=;
 b=CVL4eW0nbMaSgpU40l3Krg3RcFtlyUCxNabRBY5HSjv1PjRMyeEs0VhUvzzZB6K3rjauCgy464a6Z3p9ECYG2X/BhKdvg9tCqYeynd17fulozNkylqj3fSsHPTct9F3WwxHmPj1N5Gw+MC/fJGFL+Wmddfkeb/kd0EuibmsMGgbgVmaNehSdjAk7HbG2uJYFcHKqd730xAcb9Yguqwa/zfN7qveeJibORUMrHet6h1f9YWQ6gAPcZ5InEbp46HPqHQbpaSd91Cs5CewcHdH88rWbKdMQJy9M/k0FKTmGqK3AOQoz6Rh5klUOmDCszfRaYdyVSdDxSy5OeeTPoR8CKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX3mDmX0UiOUsankD8ZHIzdyC6Ou3P5sTJu+c9AM/Nc=;
 b=s2XqaLTZCd3M/drBHKcJeux+TAFh4rXRWxEZCvjWIHEKJSyNDBojgsz5hZz91dlBMmMgTC+iS2derNJ/B5kUE6MBBBVxtA4FvY2BJoP6laROrDcoXKwHyyYmGJOF2/6YTB1h1C52w9k3BDM9G4r9SMDdkMj1HmLtYydur/UUYWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v5 2/9] vpci: make BAR mapping more resilient for the hardware domain
Date: Wed, 8 Jul 2026 17:02:17 -0400
Message-ID: <20260708210233.922275-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708210233.922275-1-stewart.hildebrand@amd.com>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 59804325-2291-4500-4745-08dedd345fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|6133799003|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SKMMzIIBP7sahrwyYwLKPIiuKD1xhxQsu+SlJbRY3+DBx3uhNTqsUFIexAd+gDGHfalp+DbP3KMGet5171LfcPOE+O383qPr1uh78Xhxmir6A6r5BrNnptvZwiQ3fb9ZdG86P9pla60nyPlgCjSmKS20NtpGyrNnWXOZ8FMKNiL4Jt+WZIqycuT3G5zYKZnZRd7eA1Vs4yZr/wKic8mmOXKUX5WdTHU3X5ZgEDYaExfidGPJMX3tpkJ2iw33FpN0RYd7Xr7dLADm+fe8uO69CqtXt8y+h0m7hGk/hR4tueRANWurzwmBll6k9dK53PszjXwh+xGL1xw5vPmvxuqo5mVQxfm/uHsQ24A6Q8PZZRMmNEdYRTlpR07MAENR5NuePEn/z7U1T6l6qdUbdgZI9Hu+z2a2JIuZISyiMeS3sEBELV3nqEDS5f0VIgZ/n7Zs13vfG7+huUTqggcAjvN8SQA5csAXrOL6BO2fIMychAGuITaBmH6clIpzu2q+3na2O5UBNE5/MhogvOMnuKUcr7kY1ne5S0D889GB9Hdh/ihiGDxP/iz4qDcmpc+fboRxmgZPsYcpMF5STCMONj34OTZGvH5qOMZX+n3PzD+SLFe6YM4h7mioKmYqiid/Gd6/+YfOX4BtaClyZ0YYDSNXj3NtZXBU8yDk0edFiHYH/6/hnu5z7H34mDUMqBeZCV6aKagNt6cQ/UPHxMUoR16Bzg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(6133799003)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2XgnPlEh/dhI5I0Jp21i+22/UX2XL8dkNLayHApJbcOyIawh/Cm7y9wtTC6W+K/H3UiFRfvtwG9SWYmmoDfDDY0uaXllA20HFYx7icRkWhfAb/bXqyGSjNQm9aRbr+kNLGoqmHPK2apxj0SHOe7fgENjjL0INSoXKmz+LnooN5+sq6mnf0x6riWAvOQicLrqMybGK0vtO7z3yqUKydcKgfOfDIM6y7WXWFsvkEdvoLPEsUWS40YXEut15FAl8xgoKC47Eu3FryodW1tWuh4y15JPZFS0q8tYd7U4SRjKhS4bs00BlE1ycf8x8mafzj5ZJbnov8V4IjzHDz9/gRz/cDJbEKJLnq7Z8XII+66fN3FVxh4ZNgChqrEke14/MkVwkIlIUvEORomLtxX6bHrYUN9zLiOxs2blkmwDsicK3NWTpfxHAyqqAooiuriL/wPU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:03:34.5517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59804325-2291-4500-4745-08dedd345fac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185
X-purgate-ID: tlsNG-bad1c0/1783544623-4733F986-4E1CE8C4/0/0
X-purgate-type: clean
X-purgate-size: 4148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4E5972A66E

From: Roger Pau Monne <roger.pau@citrix.com>

The logic in map_range() will bubble up failures to the upper layer, which
will result in any remaining regions being skip, and for the non-hardware
domain case the owner domain of the device would be destroyed.  However for
the hardware domain the intent is to continue execution, hoping the
failure to modify the p2m could be worked around by the hardware domain.

To accomplish that in a better way, ignore failures and skip the range in
that case, possibly continuing to map further ranges.

Since the error path in vpci_process_pending() should only be used by domUs
now, and it will unconditionally end up calling domain_crash(), simplify
it: there's no need to cleanup if the domain will be destroyed.

Memory decoding may be left enabled in case of mapping error for devices
assigned to domUs.

No functional change for domUs intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Although not strictly a pre-requisite for queued p2m mapping, I've
included this patch from Roger's vPCI fixes series since it simplifies
the error path in vpci_process_pending().

v1->v5:
* move "*c += size;" outside is_hardware_domain condition
* add note to commit message about not disabling memory decoding on failure
---
 xen/drivers/vpci/header.c | 45 +++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5ac525036672..9f2d0c8a5452 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -70,17 +70,26 @@ static int cf_check map_range(
 
         rc = map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn))
                       : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(map_mfn));
-        if ( rc == 0 )
-        {
-            *c += size;
-            break;
-        }
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
                    "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
                    map->map ? "" : "un", s, e, map_mfn,
                    map_mfn + size, map->d, rc);
+            goto done;
+        }
+        if ( rc == 0 )
+        {
+ done:
+            if ( is_hardware_domain(map->d) )
+                /*
+                 * Ignore failures for the hardware domain and skip the range.
+                 * Do it as a best effort workaround to attempt to get the
+                 * hardware domain to boot.
+                 */
+                rc = 0;
+
+            *c += size;
             break;
         }
         ASSERT(rc < size);
@@ -196,28 +205,22 @@ bool vpci_process_pending(struct vcpu *v)
             return true;
         }
 
-        if ( rc )
+        if ( rc && !is_hardware_domain(v->domain) )
         {
-            spin_lock(&pdev->vpci->lock);
-            /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
-                            false);
-            spin_unlock(&pdev->vpci->lock);
-
-            /* Clean all the rangesets */
-            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(header->bars[i].mem) )
-                     rangeset_purge(header->bars[i].mem);
-
-            v->vpci.pdev = NULL;
-
             read_unlock(&v->domain->pci_lock);
 
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
+            domain_crash(v->domain);
 
             return false;
         }
+        ASSERT(!rc);
+        /*
+         * Purge rangeset to deal with the hardware domain having triggered an
+         * error.  It shouldn't be possible, as map_range() will always swallow
+         * errors for hardware domain owned devices, and
+         * rangeset_consume_ranges() itself doesn't generate any errors.
+         */
+        rangeset_purge(bar->mem);
     }
     v->vpci.pdev = NULL;
 
-- 
2.54.0


