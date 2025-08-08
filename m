Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CEB1E40E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 10:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074089.1436791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI57-0000gy-Sp; Fri, 08 Aug 2025 08:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074089.1436791; Fri, 08 Aug 2025 08:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukI57-0000ei-Oc; Fri, 08 Aug 2025 08:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1074089;
 Fri, 08 Aug 2025 08:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRAb=2U=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ukI56-0000bG-H4
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 08:04:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20603.outbound.protection.outlook.com
 [2a01:111:f403:2409::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e4c3744-742e-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 10:04:02 +0200 (CEST)
Received: from SJ0PR13CA0178.namprd13.prod.outlook.com (2603:10b6:a03:2c7::33)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Fri, 8 Aug
 2025 08:03:56 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::d7) by SJ0PR13CA0178.outlook.office365.com
 (2603:10b6:a03:2c7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.9 via Frontend Transport; Fri, 8
 Aug 2025 08:03:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 08:03:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:54 -0500
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 03:03:52 -0500
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
X-Inumbo-ID: 3e4c3744-742e-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeWu31v2uCnFt/4y/TUd1CmP5eCV4IpymbK9iDN9McK190uH1+wC/VJh5tY1kNFVJh4H2Gn0V2mQEWmXidJovK1A5Q5W2iA+YUiGBMjiMj0tQZGuYx79pFb0yKknNU0NHtHTtmuIDY4dqtzD+JWtNciLeiQClWwOtsRXq0EnSvSTMtdch/CGiFG/DnysCcMG68J+qxiZj1441TDbBLjTSYDOcIrjlZOzriSTknvLd9N6wkqA9n4T2fsFnrRPl5jr968WFjwzDt8yIbu1bWSY8Xtf0PfhGcFgWjg9qwIlfKRsRt2G+DE9U0AXancBqPvQy9liEe+rcF414FS8HRxxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5PL1NmXDbMegVT5M1N6mCB6DOySvIDls9rbNkrvwiM=;
 b=SMhbk7pk7FrLdeUI671unierffjtDAnBeDcv2Kdyt4sJ5I4TI8AiNeHwOBwbWborB5q7WXQNxWfVeGWEt0N3PIm/sDYixZLU3lJd40fmvRZDtC+LZ6KfWTiV6JioApo1PyUhl1UCEqu2ozeTIXdGDulaoQgcIOBQNunkzPK8PuqA3+VbR3t+27rHjHjgX5udV2IzfHL9OyeQ+ZHJ50UYmcjSKj4fkbrwITrf3cVAigz6tEVVahPTHdEeqTC6X9uy7+2ORhi+AvDKYSsA7ZP8GKZIITBVjutKHxtox+mX6XXuVu3zYQO3Pp9S+KjpLQNeItZO5b7NHNoVcRJOObXZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5PL1NmXDbMegVT5M1N6mCB6DOySvIDls9rbNkrvwiM=;
 b=riyAY7yNnKamOOyTc+B5xcPKlALEqDOMed+KYZEiBpfgd89O9y8nPSlhVxSy9LQiw0fB8RKhfDrz0jxBibeDGMKnV1BTNACVbf2ADRDOsB4Q2nqt/nPhNVHx8PMOblSsBkrAq6Jvv1zsVCTd99BlFGMFBzk96Srt0ph/bxxfkOo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v11 1/5] vpci: Use cleanup to free capability resource during deassign
Date: Fri, 8 Aug 2025 16:03:33 +0800
Message-ID: <20250808080337.28609-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808080337.28609-1-Jiqian.Chen@amd.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB05.amd.com
 (10.181.40.146)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: c9824d61-7052-4ed6-a7db-08ddd6521ee7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUNIcTNPZnA1MlN2QVdOUWxZeDIrRW9JTnNsczRVSW9xbE5FZXhjbDJBS3Bu?=
 =?utf-8?B?bWxSTWNYZTl5Z2EwZkRRVjNzOUFtakJXYjQ0YmVZeGJTUnpWaGtBN1krUEhH?=
 =?utf-8?B?RGtUT1NJeU5EeTRMNFZNeVFEQ0kzQ2NHVDRwZ3lka1Urczc5d0VrcmdiNlVW?=
 =?utf-8?B?TkhxNlk0OXVUR3QzTFM5b21KeE50YmYrM29wUU9YNVB0emQwN0M0Y2JTc2VK?=
 =?utf-8?B?N2ErVm55a1grV3Joamx0VmxsS0xlQWpsa0JYSENSVnZ5RGQ2alFjOHg0Vk5y?=
 =?utf-8?B?NzhOTk53bHdVVlozaGs3VUQ4SWVIdzFPSEVYU2VBS29USGNQelp5UWJ2MkZT?=
 =?utf-8?B?ZUcvTzdnQzdxNzI1UmdiUHE2UzkyWU5ORGJMYTlLUlc5VHZ6em5zV2lVS2xV?=
 =?utf-8?B?eVRZRDY5anJPdE9oUHFhMEMrendrcEh1RVdlblI1ZUVmWWVpWWZnUUR5ZVBl?=
 =?utf-8?B?TC9tYTViaXVtUVhwUGFWRmUwYWZoR3JMQW0yZ1V5NWVkaDVGUnlic1d3OFE0?=
 =?utf-8?B?bFFCM1Nub2VGdXFxeEdoaHZ2Q0RuOVFZb0pwUDRGbGx5bG5rREJwU051dit0?=
 =?utf-8?B?eXc4eVZQbCtPYjdycDJ1dWxxdFVvclFrMkp2M3dzZ3l2aXBWNnI2RysyRWFD?=
 =?utf-8?B?VG8wbTZVRVVsdE5NdWJUTzdGalZSRGdwTXJYQlphdGlmU21wUXUyRlMrbUo5?=
 =?utf-8?B?VVBKUk9Oa0ErQzc3eENyQkZuN29NclBWTmFpcjdnYjh4OCtRM1NVTy9ZZjBT?=
 =?utf-8?B?QldHTXhybCs3VzkwNDl5MGp0ZkdqcHk1aUVsNDFwazc5YjE1bGJHM2RTNW9F?=
 =?utf-8?B?ZnErTzFLbWVTbGxFelZsU0RNR2tabEVVYmJleHZuT2J5b2k0OThUOXpnOE5E?=
 =?utf-8?B?M2JoTHZHU3dYTVF3UWZpYy96QnREblVLUGVYWUMycGVpWU1VZUxtbTdQMG55?=
 =?utf-8?B?eldHditpZ0hIR2JjOUw3OWNXVWVwcFhZT0FYdzVVeUdDYWIrcGlKMGFZQm5R?=
 =?utf-8?B?VXBxV1hlaFlzL0lyanM3VzJ6WXRhamVnMUVoMEJBRDQveHRyemY5MysrWDM5?=
 =?utf-8?B?Y2NZVDdnU2pPMFpRcVZTSDE4c3h4RTZmYU5iRkFra1pkMVV1VE91bE5DZUFz?=
 =?utf-8?B?b2o0UDJlWG9uLzBub1pMcEhaR242WE13YVlGKzB3R0hIOFRqYUdEVm83ZmxT?=
 =?utf-8?B?aGxHWS85OVRmenhOZGV3bTNPeEhHTTVqa0JVVXJISEorRkZoZTlCTEdXZTg3?=
 =?utf-8?B?dVBXSktPSlpoQnVVOXVSVmcveVFlMXorNU1zdHZhNjJVMm11b2xSaXFCK0ZC?=
 =?utf-8?B?RjlOdzE3MDh0OVFpS2hFelg1dUQ5MG1Ba3paVldHOHl1M2hOT243My9iaUNW?=
 =?utf-8?B?UVZWamU3ekxpY1JwRmoyYkJBZVZkRzMrY3ZTRklaS0NmN3lNbVhJakF4S2dS?=
 =?utf-8?B?YjB1M3UrdGUyYkhwZ2dTWDFqazl4REt1VDRYQ1MrdEpJci9jQy9VSHBOK08y?=
 =?utf-8?B?dGVzVDFSeTc1bmd6N3JNS2dCbFdBNW9ERk5EUXd2OXJwM1dGVlpRTzljWlpV?=
 =?utf-8?B?WFB6eU9MTnNsNU40NVQzd05yOXNCd1BpTTdEbWJ0aEFFT3VHZWhiZXoxRlg4?=
 =?utf-8?B?bDdnL042d1JOUGx1SUExWE84cytQQVlnMWZKbkZ0NkYzblBOMU9mSDRLOVZE?=
 =?utf-8?B?Mjd2dEdWdXh2QjVNcFNWN0wyZ2RDMlJuR0NTNTg1Q0YvQkpYV216TWZlaWx0?=
 =?utf-8?B?elRWQmpOcHQ1ZXdrNmVnWUpxbmVsZmkzOUsxNnZqTWM5NlF6dUl1NFNEeld2?=
 =?utf-8?B?TTB6d3JoQzlwWm0yR040TXpCZGdFeWdqZGRCNHNCZXlXYXZ6SDBDYzVtbEVa?=
 =?utf-8?B?UFcvYVkwRjNiSEZ0V29ObE5CQU1NbHEvVWhhaHhrckQvSG9WVnM3cFlFWElx?=
 =?utf-8?B?b2tLV25VM1ZqWk04MThVN2FBdUU1K3licElRdWFkd2Riazg1SEcyQlNpR2N2?=
 =?utf-8?B?WjdxaExFWk1URG45ekIxN2NjVWVZc2pLanR3bk84b081SjlCdURrR0RCbmpJ?=
 =?utf-8?Q?EqyOxO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:03:54.9277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9824d61-7052-4ed6-a7db-08ddd6521ee7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499

As cleanup hook of all supported capabilities will be implemented in
follow-on changes, so to pre-call hook in vpci_deassign_device(), and
the capability specific clean open-code in there will be removed by
follow-on corresponding capability changes.

Since vpci_deassign_device() and vpci_init_capabilities() require
different cleanup actions, add a boolean parameter to cleanup hook
to distinguish them.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v10->v11 changes:
new patch.
---
 xen/drivers/vpci/vpci.c | 25 ++++++++++++++++++++++++-
 xen/include/xen/vpci.h  |  2 +-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index fd02718b47ea..120a919f08e3 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -280,7 +280,7 @@ static int vpci_init_capabilities(struct pci_dev *pdev)
 
             if ( capability->cleanup )
             {
-                rc = capability->cleanup(pdev);
+                rc = capability->cleanup(pdev, true);
                 if ( rc )
                 {
                     printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
@@ -321,6 +321,29 @@ void vpci_deassign_device(struct pci_dev *pdev)
                     &pdev->domain->vpci_dev_assigned_map);
 #endif
 
+    for ( i = 0; i < NUM_VPCI_INIT; i++ )
+    {
+        const vpci_capability_t *capability = &__start_vpci_array[i];
+        const unsigned int cap = capability->id;
+        unsigned int pos = 0;
+
+        if ( !capability->cleanup )
+            continue;
+
+        if ( !capability->is_ext )
+            pos = pci_find_cap_offset(pdev->sbdf, cap);
+        else if ( is_hardware_domain(pdev->domain) )
+            pos = pci_find_ext_capability(pdev->sbdf, cap);
+        if ( pos )
+        {
+            int rc = capability->cleanup(pdev, false);
+            if ( rc )
+                printk(XENLOG_ERR "%pd %pp: clean %s cap %u fail rc=%d\n",
+                       pdev->domain, &pdev->sbdf,
+                       capability->is_ext ? "extended" : "legacy", cap, rc);
+        }
+    }
+
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
     {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 17cfecb0aabf..4b7b9298c4e8 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -17,7 +17,7 @@ typedef struct {
     unsigned int id;
     bool is_ext;
     int (* init)(struct pci_dev *pdev);
-    int (* cleanup)(const struct pci_dev *pdev);
+    int (* cleanup)(const struct pci_dev *pdev, bool hide);
 } vpci_capability_t;
 
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
-- 
2.34.1


