Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E918C2E4B
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 02:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720144.1123219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2N-0007rs-RU; Sat, 11 May 2024 00:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720144.1123219; Sat, 11 May 2024 00:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2N-0007pP-Ni; Sat, 11 May 2024 00:56:31 +0000
Received: by outflank-mailman (input) for mailman id 720144;
 Sat, 11 May 2024 00:56:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5b2M-0007ah-BE
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 00:56:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c0c8333-0f31-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 02:56:28 +0200 (CEST)
Received: from PH8P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::34)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Sat, 11 May
 2024 00:56:25 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::2f) by PH8P222CA0004.outlook.office365.com
 (2603:10b6:510:2d7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54 via Frontend
 Transport; Sat, 11 May 2024 00:56:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:56:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:23 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:56:22 -0500
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
X-Inumbo-ID: 4c0c8333-0f31-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpPUu7rbvrb9YeD0Nu9zccpeG6gNCszERa4y0u9Gum8d+cSe8vR1tqI5L8Fo/aQE+EnlwQv1KKLfsmVArumYWjUJKeuC4/nRj03+JHFhCGihAY3xQn7UJX4Y6+y+l4Cv4RoBZopmYo1lZ3vKNIMpvS/x5IxZsTIMd2URAmR1IRk4l204//HLwJO3ktOHr5nOqBozmKSCjDeZ3tBH9Ng4SlI4ChBzy0Obuk8puIw1hGeT8qru5MStyFh9J5cZYpe3IBeDeZjQPviuEYT9+VggxaeAHdvM3cUE470QEUPIXB5958e004BY+fz5PI1Om+SXZI8oZObGOXIZp6d765KeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0sVjO8e/hTL6PfGKicWPBSowcKLwyxV2IFDm4hHQWE=;
 b=X27UtIozaBMJ0TTME8eUva2ZwMW1Fs1Ywm2Ar4GkqbxIY3vR29fo0tnZNH7AVX3eHqy7ZWxHSqjNk6UrboIWxQxvzIHvXLHnmInKIU3uWZY+3n5K7yBlZND12Fjf2BDhIxNxy5ztW7Wnlah5/JON46or+n7+tc6agbkCqhHvC4tJOhD3ddlQNMw+PwIhlpa96N9dx0M10ZDAXbAiFGxexmrV8JjVuTAfYi66h/61FLqrJDZjgpx2t+EYuot2w64+tZPvi2J7r/hfPXPrERI9ECb2rS98IhgDenw/3U0V36MTogI17u/srJP5JyHmRQ7puEt7nnFjFj16hynddfBzaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0sVjO8e/hTL6PfGKicWPBSowcKLwyxV2IFDm4hHQWE=;
 b=WAvsK2mtMhjRbraEDoH6ipsMdT12LguyMwV0mRGl3WB4ritF6TX5VMapc5OvBZVoG6/40+AM2vZ4yqRy15NBk0MKjd3j/CYLJ7CdEF4JrQfkS7KBogzGaOWpKsWxBHMqcXdTbfpSmbpp1H/bnti/oKmDcEnmrc6dR1oYRiCA0aU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH v2 3/4] tools/init-dom0less: Avoid hardcoding GUEST_MAGIC_BASE
Date: Sat, 11 May 2024 08:56:10 +0800
Message-ID: <20240511005611.83125-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511005611.83125-1-xin.wang2@amd.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9aa798-a039-41f7-ba48-08dc71552e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W/Odr8W15mADA2aUJJx+XWOBlnokmdylAOH5p0E6ZsywRUpM1QTf/cVXQZ35?=
 =?us-ascii?Q?ZGMeaZC524E9GbCHRxFl7ENRxuY2mqLZvnaEhCN9C54L6DJUJxPLUCdCboWH?=
 =?us-ascii?Q?PA/oCEZ9JIJBJ6Qzo2CKFihbzAXGaRAJErGcUf7Qj2w2j3vO4mbmWr2Jh1Eu?=
 =?us-ascii?Q?tQzssdkqqToYRpETOmdISd4j0YwRIlOxENjdsGU/J5j3Y7imt7I5aaNDxqOh?=
 =?us-ascii?Q?LVCSvoFYh0Rq3rdcLgpvqNpxVWUSAMx93oI8b9tbdCEoVXmdz1EXElei/fN9?=
 =?us-ascii?Q?Fqq/Tywz+t1q/l0AshZqVezndZxXiNlDOlBxa6mbswQEr3iPngivFDU4lej9?=
 =?us-ascii?Q?24ML8832HS/URwIl1REeB57EINi8tkuKpt5yfhVwquEvqrKNb+euOABocC36?=
 =?us-ascii?Q?ws6Pix2fAsJmM20j2/ntG6o1YC4MAwprT2hSYEbbusZTE3AhS8ssPWyMwENp?=
 =?us-ascii?Q?AIm2cUnXjsrlXtgsEFl7bAa9IAb+B+DpTs+1eHKN0tq2fEINoHkYzXwudwtb?=
 =?us-ascii?Q?Nk/8pzqYBogv0TLmFE1AYKrpVlSPQ6dUwF173NKPli3Ghi2CvEetzsSf2PPQ?=
 =?us-ascii?Q?GXNksdI0wWyo8YvRC55VTv5hSBoBZ1cyCsaJyAi4N3zDYSnX2O6FPFqv48Rt?=
 =?us-ascii?Q?6W3agX1oP9Hlja3UfvYy0uaS7vu1jrVLjwQy6sLSDecYz/PC1oCBZdN88FXM?=
 =?us-ascii?Q?ysFBAnuMLa/F9TTSrVkbpKaukINN48cOQByhfAGZs7GZae6hu+JyhuDGEZRl?=
 =?us-ascii?Q?FKc8NtWgoX3DvpqP4XeiyvUABju6Hs/akVZbjCV+TT1LsS3vZAwo+anoFWa7?=
 =?us-ascii?Q?dM/vpf5IL0SBlUEHJZu5IWiMeruhRUjRw854vYryGW8nAXN7nYTToSgxZZhY?=
 =?us-ascii?Q?X3zQeA/+BPu8JGeXmaRd8/MaJ0TcdMiQ6K2wBOMCabAVAxOt2LU2QMwbGirc?=
 =?us-ascii?Q?GYiaregbRulLLqGpmVOV1LEfOZLxu5DWpW0lLn299n1InfcJgfAg3jZFl6jz?=
 =?us-ascii?Q?mzKL6NlGPVqLqh9AUeV4sOh6lTcXwZXc0Vi3gFtg6JzuzHOVLbqUTcl6mdJA?=
 =?us-ascii?Q?9Sf296JVVZpmY/dsCtSBF0IPnXPTR+VlTaCdi7lko1i9QaeZeapwRcAxaZSi?=
 =?us-ascii?Q?iXR3dOMbkG7x3ah6qY0lNB6gPfZIW31GIOhKkxUNjcPzH8P2ZnwPi0wqtr3/?=
 =?us-ascii?Q?EF4aBnpxPS9qcaL12yxMvlSy0dTSZNjOTASqenbj3y+iIUIdjmddIxq/cDwz?=
 =?us-ascii?Q?cPviSGUhnIdIgpobIJNgMGSjK0reYWWUVTP56ZgAHg20awFi3Ld74ZT5LLD0?=
 =?us-ascii?Q?/jjAyMHrzoHCboyhWrJy3uB6pXt8v14QG+RqeTG7yCdxb5G1H8yMoqdPwyqJ?=
 =?us-ascii?Q?xCq12X+/JG5YjsNXZMcFW9lIZAaP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:56:24.6921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9aa798-a039-41f7-ba48-08dc71552e9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772

Currently the GUEST_MAGIC_BASE in the init-dom0less application is
hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
DomUs.

Since the guest magic region is now allocated from the hypervisor,
instead of hardcoding the guest magic pages region, use
xc_hvm_param_get() to get the guest magic region PFN, and based on
that the XenStore PFN can be calculated. Also, we don't need to set
the max mem anymore, so drop the call to xc_domain_setmaxmem(). Rename
the alloc_xs_page() to get_xs_page() to reflect the changes.

Take the opportunity to do some coding style improvements when possible.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Update HVMOP keys name.
---
 tools/helpers/init-dom0less.c | 40 +++++++++++++++--------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..04039a2a66 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -19,24 +19,20 @@
 #define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
-static int alloc_xs_page(struct xc_interface_core *xch,
-                         libxl_dominfo *info,
-                         uint64_t *xenstore_pfn)
+static int get_xs_page(struct xc_interface_core *xch, libxl_dominfo *info,
+                       uint64_t *xenstore_pfn)
 {
     int rc;
-    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
-    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+    xen_pfn_t magic_base_pfn;
 
-    rc = xc_domain_setmaxmem(xch, info->domid,
-                             info->max_memkb + (XC_PAGE_SIZE/1024));
-    if (rc < 0)
-        return rc;
-
-    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
-    if (rc < 0)
-        return rc;
+    rc = xc_hvm_param_get(xch, info->domid, HVM_PARAM_HV_RSRV_BASE_PFN,
+                          &magic_base_pfn);
+    if (rc < 0) {
+        printf("Failed to get HVM_PARAM_HV_RSRV_BASE_PFN\n");
+        return 1;
+    }
 
-    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    *xenstore_pfn = magic_base_pfn + XENSTORE_PFN_OFFSET;
     rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
     if (rc < 0)
         return rc;
@@ -100,6 +96,7 @@ static bool do_xs_write_vm(struct xs_handle *xsh, xs_transaction_t t,
  */
 static int create_xenstore(struct xs_handle *xsh,
                            libxl_dominfo *info, libxl_uuid uuid,
+                           xen_pfn_t xenstore_pfn,
                            evtchn_port_t xenstore_port)
 {
     domid_t domid;
@@ -145,8 +142,7 @@ static int create_xenstore(struct xs_handle *xsh,
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%"PRIu_xen_pfn, xenstore_pfn);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
@@ -245,9 +241,9 @@ static int init_domain(struct xs_handle *xsh,
     if (!xenstore_evtchn)
         return 0;
 
-    /* Alloc xenstore page */
-    if (alloc_xs_page(xch, info, &xenstore_pfn) != 0) {
-        printf("Error on alloc magic pages\n");
+    /* Get xenstore page */
+    if (get_xs_page(xch, info, &xenstore_pfn) != 0) {
+        printf("Error on getting xenstore page\n");
         return 1;
     }
 
@@ -278,13 +274,11 @@ static int init_domain(struct xs_handle *xsh,
     if (rc < 0)
         return rc;
 
-    rc = create_xenstore(xsh, info, uuid, xenstore_evtchn);
+    rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid,
-            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
-            xenstore_evtchn);
+    rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
     if (!rc)
         err(1, "xs_introduce_domain");
     return 0;
-- 
2.34.1


