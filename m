Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC87A50E40
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 22:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902765.1310745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpwlH-0005Lg-Rn; Wed, 05 Mar 2025 21:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902765.1310745; Wed, 05 Mar 2025 21:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpwlH-0005Iu-Ol; Wed, 05 Mar 2025 21:58:43 +0000
Received: by outflank-mailman (input) for mailman id 902765;
 Wed, 05 Mar 2025 21:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzNz=VY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tpwlG-0005Im-P8
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 21:58:42 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2009::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe912d88-fa0c-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 22:58:40 +0100 (CET)
Received: from MN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:208:530::9)
 by MW3PR12MB4364.namprd12.prod.outlook.com (2603:10b6:303:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 21:58:33 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::9f) by MN0PR02CA0012.outlook.office365.com
 (2603:10b6:208:530::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 21:58:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 21:58:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Mar
 2025 15:58:31 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Mar 2025 15:58:31 -0600
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
X-Inumbo-ID: fe912d88-fa0c-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR94V9YC/EWS5qxLjA1AXa3S3Jo92Mfl3fxLaV4os/xGbN+WdZYN2A8V2L5g/5tTuOwEfOE8+xfkFrc1f/ObPFhCk0KTPWygF8M9Empa2v6DqWmXZG7KkzP9WHa/qyFsExtWy/UEZITHgWpW4+W7pykP5fH20PNpe88xWJioNwhAfEdQBtU0YAv2XhTr8MaynKxO3dwMA7ETlcesmdxyFDR6En80hWW3h0g0WwCeP/Xc/8lrHxtSNucHBVNnZ2eGJdP99vwimGpFzM6153Su4RsV7C/pZKaYkRFZDXXoAJkziD3HTANh9S8m1agNUkrisPhEMAAEfBB/H/rbh8gbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtN8LAMSLKrzMZRkrMqqXoo6UMhlxLA34QH/NmYxzK4=;
 b=qL9uM/VoV8PDnZdG9/QdLNtUztR3e34rcS+rEyd9UccZkb85bgFWQiTXuPymSA72luDQb5daBjFB9FFtGmy+4T6ja+9nutsWlsdlk8clmn0qhCWQtHIT5VNy0acuUCvUdyv/gvQCV6nqhcxgaI5VjtUsMddoBP3XIMeOB157UIp//nBXouPSmiKpAzOPLGvUHaSlPn6lx0Tew3D6KrYb1ZGVpIwym4t5TPPYFxPm2gFx1aoqz7t/VXX5KvqNemj6eR1c+uQq+scsk8zLiBh9o3IJtRYPc7V7UuSDbX3gHkq+VbP7ZWqCC5okHfjTSef5iqYZx6JFiwIOfSdCccc9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtN8LAMSLKrzMZRkrMqqXoo6UMhlxLA34QH/NmYxzK4=;
 b=2FiGnHeXrTnynVUvO2NGm/bfZ30EwCpIooPYhvEHgLW84VLFpL8NpjBv2Qw1Zx6NpN3OwVOX3rEVHOX/kp7ScuKUOcTdXWuLjSbdnQkjkvi6EZUCDnDLo84IA+EmlwY35bBVUlrfEkw4P4B3lx7CfpOOlxfJSGldyXuR1cgm+4U=
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
Subject: [PATCH] tools/init-dom0less: Fix cpus > 1 and xenstore entries
Date: Wed, 5 Mar 2025 16:58:32 -0500
Message-ID: <20250305215832.98162-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MW3PR12MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: 946f0b55-61cd-4725-4c94-08dd5c30df6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NzrPQPjEIVidGJyFVES5pkHZX+/Qe6aZFsL623lOKz1WgVkP/1gPdx4HHGJf?=
 =?us-ascii?Q?ty19XaU9e6x676LoilNg/BiioCuY4Lt84m92hSBV61ovG0J2weaU+3rGeW8K?=
 =?us-ascii?Q?WZcIDN0yNnYNLuXKeZE/YKFpY7yORBvST9Kiap5ezfBOCC+VWHAQ+rK2B8TM?=
 =?us-ascii?Q?SBW/eVm75prcKdYBi9gzz1CjdGT7NJ+hfQWYihKhGPFt1kh4CwX+VvdAEUXN?=
 =?us-ascii?Q?/ZhRSaGKsAXgzoqmMhuMy4C45U0tt8zSnHtoo90IquVE+PfZAUsMhnlVvlPi?=
 =?us-ascii?Q?xXguE/Nr5/CijlrfZT0ZhkU1t2pg5yV6JKfPB3oQBVXQbmPhRUmxnvOhoTEG?=
 =?us-ascii?Q?kg3qbJ4xYkT+uxuxaB/kX60K8ybNyiQqBDNOF4a9JPaTDzb05sghdXBehAOt?=
 =?us-ascii?Q?wCIrGDept/Zur9yvCwg8rPzFW1xwEHOkWkKwBJGiJFW0pxfs1oDC1GrISlRR?=
 =?us-ascii?Q?BcyPHT3MxS0aUFXhZICgQ5HXxfHOB5L/uvDQYVPlczj5UG9Ol4QLBqVRPm3Z?=
 =?us-ascii?Q?8TqKHR8TioCw9wfz99fs4rDBRBb0CVDdTfrFlowOpDvDShN+RLWdH7KG/Hmf?=
 =?us-ascii?Q?Un62wfSkEfrugWZoK5B00hxF8znBDCPxSYP0BdU3D44EdYMfvIyc/AAbV5oh?=
 =?us-ascii?Q?ke7tJdNwcQzJG9ulHWroPwndO0DC49B4Jyva/M+7ySUtl0qXH/eiw0hMCc3K?=
 =?us-ascii?Q?SxiiWx8hKpxzlgB269axVbAn9hQGRIhAfM2+9OcwAeWWlP3feZr2Gw36YvrD?=
 =?us-ascii?Q?mXUfmNE0iCwaeqd2Kd67F3TF5Wa/R53bAJbWPU+MouhyDvnHu9f9ebvm7gcI?=
 =?us-ascii?Q?jOuLigPobQqKvWu8W4ODC3DnsS1ZU5W2F/JoQtmIMVVR5HZ356NOvGYovW9f?=
 =?us-ascii?Q?czMQPhzvFcXFV2N22PB6sp0naGQF/BIHzkNxXCWYwn5vW68BBiFMD+bYHHjI?=
 =?us-ascii?Q?A0wo2b+z8H4u/xLwyFvruQOgdgJ501Kwq+2gqdEf6GP2ENAZBvmDhlhKgfkR?=
 =?us-ascii?Q?rzwrrRMrilHqTDws605WxFZ9C7zXzcr8OYATs2W8hArZhQHSth903AvysCme?=
 =?us-ascii?Q?XhntKDHFJwf8V9ACcz8/o6+NeFWAL+5YfGL+zmnkRrvUA3jss8uikkxNdnRu?=
 =?us-ascii?Q?IhX2aS5l4Cux+sYA2x+oHQd+2reQ0lLvb1IyQsAcWpC/ulruVPZg6ChKLM7W?=
 =?us-ascii?Q?25GKU3WYLCY8lGXoXdMKUSAEWYvMa4xTuDTNAmngybgmCZ9WUrM8QtYjsEVc?=
 =?us-ascii?Q?KFtDbgg/0i9HY6szpPXPhmWKMQqagJ6lCNPW6bP3KFNQLSLCDQnU52UBTrCF?=
 =?us-ascii?Q?e7W663s2gKFzvlwwKdPya90bH7WqRpFM+c1GIjlR4mzaNGqVYK4c3xjbkIoN?=
 =?us-ascii?Q?U11yvgvWBm6SvQVyxZqcMzjSfAYaRoCRLGVwNNh8UgQn0GAFSZMEiN2mJObw?=
 =?us-ascii?Q?f1pZX8S5p3ajqHPnilgtr/16+iSMfv6abYTGjGb0GJzW+63vxDRXdBA6jxCm?=
 =?us-ascii?Q?V2WSuomMR8tIu7I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 21:58:33.2833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 946f0b55-61cd-4725-4c94-08dd5c30df6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364

The trailing / in the path is incorrect and generates an error when
writing to xenstore:
Checking domid: 1
Init dom0less domain: 1
init-dom0less: writing to xenstore: No error information

init-dom0less exits without finishing initialization.

vcpu_max_id is an inclusive value, so it should be included in the
loop's range to include all vcpus.  Without this, no xenstore entries
are created for a 1 vcpu domain.

Finally, use vcpu_online, the count of online vcpus, to determine online
vs. offline.  info->cpupool is a cpupool id and not a bitmask.

Fixes: ec53e0c4ea ("tools: add example application to initialize dom0less PV drivers")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 17579fe2e8..c569a890a0 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -182,13 +182,13 @@ retry_transaction:
     if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
     if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
     if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
-    for (i = 0; i < info->vcpu_max_id; i++) {
-        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
+    for (i = 0; i <= info->vcpu_max_id; i++) {
+        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability", i);
         if (rc < 0 || rc >= STR_MAX_LENGTH)
             goto err;
         rc = -EIO;
         if (!do_xs_write_dom(xsh, t, domid, cpu_str,
-                             (info->cpupool & (1 << i)) ? "online" : "offline"))
+                             i < info->vcpu_online ? "online" : "offline"))
             goto err;
     }
 
-- 
2.48.1


