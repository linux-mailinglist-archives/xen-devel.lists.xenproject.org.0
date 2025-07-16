Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30BAB07F73
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045779.1416019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aC-0000Bw-RL; Wed, 16 Jul 2025 21:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045779.1416019; Wed, 16 Jul 2025 21:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aC-0008VY-MY; Wed, 16 Jul 2025 21:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1045779;
 Wed, 16 Jul 2025 21:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aA-0007F7-TJ
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9ce9101-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:29 +0200 (CEST)
Received: from DM6PR03CA0099.namprd03.prod.outlook.com (2603:10b6:5:333::32)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 21:22:26 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:333:cafe::ba) by DM6PR03CA0099.outlook.office365.com
 (2603:10b6:5:333::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:25 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:25 -0500
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
X-Inumbo-ID: f9ce9101-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW2OKmxr/FpDa2PedIdD7mEA1FWwN7A/u7It7+4thaIiamVHpVDR9GTX8mEx5FWtrZFHABgurI4s79JkIASnwqMHs+S0gcIKvLcSNxgPRwFPSK4swe4Ba9wTZMsClSsOFn1m/5siqngQMuSwPtC1KhwuowQJLHaWZMUtFcQnC2baq2R3vYeTT+pBzwDhnpLOJSbKe8Tv5ugiHZhLuLcEx44EOvVh0tt+4Y/Pq3RZxfsf33XmkwEKiRRw+/7NYRptUbaRujsHEGZ13CL3WiVAKavxplNjFKqM+wBW1r9G3ZDVY0YQ4d03b+uHv498V99f8on3VRGxs9RBLTubqydbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilFL7snKWKGO1xBaFJIr9eFBC74prAtQEcljgArVvrU=;
 b=wA6OUT7qqz/hsgSPLAiD/MQIySY6rEyPnn+mklcGXo1xiBW9DdHz3ZjiaSJVaCFT0jYExP19eXCbnc/gNETxAL7LbJ4Jin1pqnib5en9tYwzyJWDaVSk0hgidO0zeAqSxP3EZ/5wc7Fz96LlzLTq2nC9obi3OlZGUonSJMCKS0GW8IqBws9iprbTRll8nOw3vcBZOQ4K+FArIntP55x2LZc4q4jh23TlTPV0JaWCJtscsmcBoNRF2wsgy4pOO1ug4NAkys7y8/NOktNWe6ZXe50LigZF+UMxP8tNV8BGGKv/5HdDqjGimKNjE3G2VZIox85nFqQvZi46LLy8AAsjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilFL7snKWKGO1xBaFJIr9eFBC74prAtQEcljgArVvrU=;
 b=Dt+cZ+aJH12gE9BeO8AesB20erCZ12FgPhtmY64x5knRx36Ogg3kDzJZaAdoM/qkeJ0j2EqzzohQ+hf4X+LqMpno56uPUrdIbeq2DVT25Rj2ZroqB5YH94d6vay30o8E3uASARjJtpNUi0IvpL7p5Uq6BF9SSQQH8nK3EkvHLbQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2 16/17] tools/init-dom0less: Configure already-introduced domains
Date: Wed, 16 Jul 2025 17:15:03 -0400
Message-ID: <20250716211504.291104-17-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: f6857c0d-9afa-471b-bb5a-08ddc4aedc7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GuS1fr5tBMq7rn/1S7+8Ap5rjdcfcjq6+RE4lKOTxWV2NpjpPq1Vj71G42US?=
 =?us-ascii?Q?o9AoW6WQ3vDSRgjeu4Pk/QblvSDRnwZA30te7Ke05306iR7FtHLAavYcXPVH?=
 =?us-ascii?Q?tjnZMJWgonOmmsj3L4OMCkVAtlLgiVAU6hAuPZZ2kv37D3gDYEYbH8SIXXAS?=
 =?us-ascii?Q?3TL+Y694PoOlBExsBhDVisdgk2LAI+6rtzblTb/Ap3UNHBev4VipB3uy0Uiu?=
 =?us-ascii?Q?M5kZxs7WUb/SyBFyv7pGP2zGmTtUyVIfdZjQLGux8AGx9u17Iu1mI7lLclfm?=
 =?us-ascii?Q?rKFDd0F07QtaeWq/32tadxQN+qJG2luYm4D2YaMUTp0zmejHTqi8lkRu1Ag+?=
 =?us-ascii?Q?kMlyr4KRttNxX7nUb6EEW2iLFG/jTTa5VBj3zaclpD3/Pmc6zTS3Xy+PoJDh?=
 =?us-ascii?Q?Vs5k3orM0z4jaEjCTwvDeMRKsJBRKB+CM3w4HQRgEVXY3g+fvvJLcLiNmLyX?=
 =?us-ascii?Q?pVi0P31HslL/6pBFY8dN0UtAGBP52HtW8oF2pnaXjEXlonT9V5tFbmDVjIPg?=
 =?us-ascii?Q?Pzg9HFPu52f43ADrCHmHq6p9KjDIfpFRiL35Dqb725syY0JaNju7zCV2Qcmy?=
 =?us-ascii?Q?uDnUa80Yyu3DTV5gVXVVN5h5kmapyHB1SEDZsMcD9RQXIRZh0dOBOeES0RKi?=
 =?us-ascii?Q?DWjPSJw+FXRa7I57X+EtlyfIIIV/ApW6NeBTSNWg0kvmX4F/h3w13Iq89Hr0?=
 =?us-ascii?Q?6dxP+MShTNQ84lL3h1Wj+Y9r/+jCfdIqZ8zm3Vs3JcIOoJLCEz1UY6iVdVLC?=
 =?us-ascii?Q?QLVjlWFfBEdjGLAXVQ5rc3erHpelMWYipau8YoDNY5Zuvj2tMfPYN7oyBRWf?=
 =?us-ascii?Q?UzFAWRglK6MXw4K8mfJoTJiPnO138ZcOQmxxtbZl8Sqqe+XtbU1aOBxBYIsX?=
 =?us-ascii?Q?n2P9zVaN/+fmrh6wsoiz4cmV2bOjvbp58VLpp74UIk632RWIQX6CmhnMDRlN?=
 =?us-ascii?Q?f3nmwcpFkDGWQrBdpVuLp663nw8yaL6sKippACiqYuag+mhS/qsnmLTC2VfT?=
 =?us-ascii?Q?Pt6PMN1Sk+mQHe9F5vQdfIo5699NirxDhnuISsrkqWP5W8M5KVrXfxrddhpn?=
 =?us-ascii?Q?ifxJaA6EcCajvt2O9rR9dt3qATWMu9CJTUI8jWT2babFl4JzZCrCydRPwnG4?=
 =?us-ascii?Q?KszuiJAFi7k+VfDuFZY3Sd7VeUiYmASpMS/uGElj05DZTIdHHFOF1YamzNIM?=
 =?us-ascii?Q?CgAeZPg78bKxA61EkihW7buQnUbs0OyfwAn0TuNWVLK01QSBWzPjHj7lyaq8?=
 =?us-ascii?Q?xo3bPL9pdTvI718E0efjtq1qBuxTWLTp+dKlWKIsCRO9vc036/F3UDKlD/6t?=
 =?us-ascii?Q?Cvj7svG5UT/TjPzc/QcD62EVdxgfsVYkIbPNKn2srL/684UOq69xH4KrFZl1?=
 =?us-ascii?Q?q4S0N/G/yFrQyxWerdnJAijKauuxOxvev6UPEvJLsUJzy25h/kptZr133dj6?=
 =?us-ascii?Q?YhP0zszr5rq6LDAP5iBDk3PPXK28lrY8N3SnebwJWGiQo32alB3idHUJUBfj?=
 =?us-ascii?Q?F1mxovgIQ/4qTJoSyos1mkD3Cl6GTNesWTFJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:25.8405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6857c0d-9afa-471b-bb5a-08ddc4aedc7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277

With xenstore automatically introducing domains at startup, the
xs_is_domain_introduced() check is no longer accurate.  Instead, process
all domains and introduce non-introduced domains.  This writes the
xenstore entries and xl configuration for xenstore-enhanced domains as
those entries are still useful with an already-introduced domain.

Non-xenstore domains are still skipped.

While at it, remove domain_exists() which is just a simple wrapper.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 6ae7cf2e7e..4336e0f418 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -324,16 +324,14 @@ static int init_domain(struct xs_handle *xsh,
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
-    if (!rc)
-        err(1, "xs_introduce_domain");
-    return 0;
-}
+    if (!xs_is_domain_introduced(xsh, info->domid)) {
+        rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn,
+                                 xenstore_evtchn);
+        if (!rc)
+            err(1, "xs_introduce_domain");
+    }
 
-/* Check if domain has been configured in XS */
-static bool domain_exists(struct xs_handle *xsh, int domid)
-{
-    return xs_is_domain_introduced(xsh, domid);
+    return 0;
 }
 
 int main(int argc, char **argv)
@@ -376,14 +374,10 @@ int main(int argc, char **argv)
             continue;
 
         printf("Checking domid: %u\n", domid);
-        if (!domain_exists(xsh, domid)) {
-            rc = init_domain(xsh, xch, xfh, &info[i]);
-            if (rc < 0) {
-                fprintf(stderr, "init_domain failed.\n");
-                goto out;
-            }
-        } else {
-            printf("Domain %u has already been initialized\n", domid);
+        rc = init_domain(xsh, xch, xfh, &info[i]);
+        if (rc < 0) {
+            fprintf(stderr, "init_domain failed.\n");
+            goto out;
         }
     }
 out:
-- 
2.50.0


