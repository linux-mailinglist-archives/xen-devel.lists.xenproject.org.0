Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC5AC9B11
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 14:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002022.1382064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjJ-0000Ot-Ij; Sat, 31 May 2025 12:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002022.1382064; Sat, 31 May 2025 12:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLLjJ-0000Lu-Fm; Sat, 31 May 2025 12:54:29 +0000
Received: by outflank-mailman (input) for mailman id 1002022;
 Sat, 31 May 2025 12:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L58R=YP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uLLjI-0008IU-Hz
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 12:54:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2009::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ff30bd-3e1e-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 14:54:28 +0200 (CEST)
Received: from IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::16)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Sat, 31 May
 2025 12:54:23 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::64) by IA4P220CA0007.outlook.office365.com
 (2603:10b6:208:558::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Sat,
 31 May 2025 12:54:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 12:54:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 31 May
 2025 07:54:23 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 31 May 2025 07:54:22 -0500
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
X-Inumbo-ID: 62ff30bd-3e1e-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUhzN+wz0ovtTrnBQ+5mfuY7chuuuCQ/muoDHMvqNDEpAA4CBuUkyjkvb+s+Oyl6hQEiro0TPeHNlI6n+aaQ+NiZJnlHQL52r745pCvq3fbi/w+dhnErzBmMpW+Twotrq2H20jMrH/42V1UYbJD4iWmirRDn8ZPK2EOT4V0gzqs2RBd20k8QO0Kxry3zCE7xwgE6KN91Ej3XrsThXPsC2W2A7bzJc/4d6eM4e6YNqMAKHee1YTCq44llRU/quMUkqIuAlEkUtA1elAfvaPeDkClmLLwzzTyErHgH0NjAeHvTf+5MIAkrs9545kyNuAoiE5KSFK7HIY937BC8z+L5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kR/ClfUZKKqigCC70/OsoHrcl2UsMV2lP7p0tn/BBM=;
 b=xvPkgbzWWh+QcoPrXV0Ez7ZIhrgM1koP6Oph7ZSpId5WgiMlCuqSsCFlzzrNAPrvaFaSm9S1F3w5nndgQRXz8qjtL+GIOmeue2mrI/ipMFeazJrniPt2zYEc8mg4MIYJKyqd4dOghvho3Yqq2GKa5clCVEKLFoUzZt6eUqi0M3KRIWSm7hD/K3Xv4W1yfKvnFx9BqGYOXRwqUt+V1dQlMnvruBroxwMcEYO4PnG80oXGEIF8foM0gpGq4fO9S40W/lEbZG5xUZhSwj50jWf6aFhLQonFHMT3lBVnxhueVPBv0HFMjvkevCriLKv5FU9N0p9NZgReB3o47zCCyxRL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kR/ClfUZKKqigCC70/OsoHrcl2UsMV2lP7p0tn/BBM=;
 b=wKkYa7iUCCwc8B9VRbTPiqA0w4T6cm9VJtFALxnH70ExV0ByIQPXPKuHUBIx5piWSOjtApaShU2NBY4qLLK16dR4g+6tN2wLzcT8WrWtXdkLjd4QK+q4eztHAjAYt3hGIUL3bHG2Lp17BZr6nxxaCxI2XVRSWHE2IJvGrwkbf4k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 2/5] vpci: rework error path in vpci_process_pending()
Date: Sat, 31 May 2025 08:54:00 -0400
Message-ID: <20250531125405.268984-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531125405.268984-1-stewart.hildebrand@amd.com>
References: <20250531125405.268984-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: d72a5853-d0b2-4d4e-6e3e-08dda04244c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Etmck4gWNJYdRJqnjTafhmPKZqVkEUM93Ym84Fe3eajlaq8Ay5LkCCRPTgsO?=
 =?us-ascii?Q?NGVBrvPNePeaObW9Ws4Iis1NvuRY3avdP4bbk6hRUdq0sMnUPVHn7JYD0v+k?=
 =?us-ascii?Q?uGQ0X5GoffwKu62rL6OIPjRKmm6613Tr2IG1wCo1LTCekFjlgMh7KwWqzxFI?=
 =?us-ascii?Q?4FwcfzMPzfAihX/PoR4Ip1rJf0wZKxys+VtTBRFRzEFwTXCM8lG2muN0pWjz?=
 =?us-ascii?Q?3MZnYSDyGNPAV5XC/HHFun/8pbeCO/DVJ7eCkpXqYIAiNmxAh3QHcQimwFVx?=
 =?us-ascii?Q?aTcs2cgFCClIC33kItqohLPSXNC0DDGBjni0PjaBLhA17nVp50w73P1Vz0H/?=
 =?us-ascii?Q?/7Ig3rF5RZVRbWfFbE7fTpGe6raND9rKA4uvGRP9itCX7IiIGNHMgUTNZYd5?=
 =?us-ascii?Q?+2qJy8gx+rWYMNy9BqkcSLJotkrvKYyLgSEq+JuhO+bg+N8hPnRQNU0jRO14?=
 =?us-ascii?Q?8pNwtzThxUwnUmGgXmQw2C2PrxvO1rBcgN2zewu4yQsffNBoPmoGDBatlPgE?=
 =?us-ascii?Q?MoAJ8ebu5737ZTWv8cHUcXNjR1jfyCpRTBr/lHc6Ag2Ob/32JuqzPr2iVtny?=
 =?us-ascii?Q?+cpDqSSRkK0XwmWlsnJ7sX02g1nfs+lTbUcR86OOH+Jc2WAwAx+88TLo9YH1?=
 =?us-ascii?Q?lJAtXAeNWdKM8aPNL9VpK68fDJmofNT3N1FEPa0NE7InVKpYmoGq7U40299L?=
 =?us-ascii?Q?LvFX69cyGyulXanbOCUMBRcsHRlTWXXrHBpQ+V5JA/ltYAKjiQH+9jxqb7XM?=
 =?us-ascii?Q?VNshhzemePOtirXhqs8/15KIuI9Bh/8wsaAGYrsiH9gwHAnAZQQrW9FY9KgV?=
 =?us-ascii?Q?ChobUth+s08lqlG9Rs6JeE5sJGCOvoxThDi7XvXba7wl14E8bNJ1KZ65Q9NE?=
 =?us-ascii?Q?0hqZzoAPPfrMnccnbepP5woPLDNjcicy0ly0klkXJQFMeuXnQwnmfcIujOuK?=
 =?us-ascii?Q?OVwZUyYEPRSnF0OrHUTyMjuLUayUHF30trCfuZw7wFmyTsJIg/oRxOXAq6wM?=
 =?us-ascii?Q?gS7hNhFCkfrK9+Rr5BRw/5CzqgrsfL/kncdp8FlIjHzAbHrFYmld8G3i2lXr?=
 =?us-ascii?Q?9EfBCMziIAip49JnU9YYiSlHCpfMgrSiT9BHmqLsUxGLl9S4HyyYlqBhjfNz?=
 =?us-ascii?Q?k7XpIejg7F/78ypWtvv1rp7pzyqTJwkp0iGfyI+qEJYNMe3zG3w8rIj2Qx1G?=
 =?us-ascii?Q?Zzc4i5jVROWuTOkttojJJW7QPE7XNkmNHvMI+V1qRr40dmR4i5pjyzJBD2Le?=
 =?us-ascii?Q?C7y99BZPSTY68r36/8LGHv1ScULfW2rFTYbzVBU14No5q7pg9AOmASHikttS?=
 =?us-ascii?Q?cpYoNzvMkkaGIEUX7MwWg5Gn7J79LgSZ9b5CWq4uq2dYx2prgVqzJBO+Ymqq?=
 =?us-ascii?Q?Ma4ARb8COMihZZY0OQ7zvjeGnPHabK3EX9XO4yP5LG/0+K0o2b+ke94Z25f5?=
 =?us-ascii?Q?6u/RbJ9EFSEjyoumypE3j1ompP1pFpjIPxPywhy0Ik03MD+S71Abevtumi9u?=
 =?us-ascii?Q?n8qsmYaZkiRhsdA4x8R4hCMJKS+ryeDK8tHe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 12:54:23.8064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d72a5853-d0b2-4d4e-6e3e-08dda04244c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

This will make further refactoring simpler.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/header.c | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e42c8efa2302..c1463d2ce076 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -214,27 +214,7 @@ bool vpci_process_pending(struct vcpu *v)
         }
 
         if ( rc )
-        {
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
-            read_unlock(&v->domain->pci_lock);
-
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
-
-            return false;
-        }
+            goto fail;
     }
     v->vpci.pdev = NULL;
 
@@ -245,6 +225,26 @@ bool vpci_process_pending(struct vcpu *v)
     read_unlock(&v->domain->pci_lock);
 
     return false;
+
+ fail:
+    spin_lock(&pdev->vpci->lock);
+    /* Disable memory decoding unconditionally on failure. */
+    modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY, false);
+    spin_unlock(&pdev->vpci->lock);
+
+    /* Clean all the rangesets */
+    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+        if ( !rangeset_is_empty(header->bars[i].mem) )
+             rangeset_purge(header->bars[i].mem);
+
+    v->vpci.pdev = NULL;
+
+    read_unlock(&v->domain->pci_lock);
+
+    if ( !is_hardware_domain(v->domain) )
+        domain_crash(v->domain);
+
+    return false;
 }
 
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-- 
2.49.0


