Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248793F7AB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 16:25:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766793.1177332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRIv-0003Bc-Uq; Mon, 29 Jul 2024 14:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766793.1177332; Mon, 29 Jul 2024 14:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYRIv-00039k-RE; Mon, 29 Jul 2024 14:24:49 +0000
Received: by outflank-mailman (input) for mailman id 766793;
 Mon, 29 Jul 2024 14:24:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVSF=O5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1sYRIu-0002bd-H8
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 14:24:48 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e506db0-4db6-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 16:24:47 +0200 (CEST)
Received: from CH0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:610:32::16)
 by DS0PR12MB8318.namprd12.prod.outlook.com (2603:10b6:8:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 14:24:43 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::37) by CH0PR07CA0011.outlook.office365.com
 (2603:10b6:610:32::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 14:24:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 14:24:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 09:24:42 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 29 Jul 2024 09:24:42 -0500
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
X-Inumbo-ID: 4e506db0-4db6-11ef-bc01-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z69hYOhWRWrn9abDEaxwVR4AWFtb0CRtjBL/isMZBYJ/bNq7rkJVl/mBB+mISUcOQgigflr4n+aQAtccZAN8mxphfru5Kv8QM9LUCTLihfE/AIop3BE5LUvsWkhhjgBaXkb0+EaXta2PHfC5Z8lYR9dwoXfnON3RO5oK5ZtTs0uxlpCQxSg/gC0A4vDRW2laeAyrrs+T+1ssiAkOR8529gOsjILzv5SKskUhjYiMB45HO/mex3oILzReA8jOf0TJ5Jua8HjjCGchnmBWoWcwGQ3211WbHpvQml7lgtEC69qtN3buF9HQbF2FdUPmLMjQwnZLTrCWjPG8GRrekHHQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxhM1vltXOjPvL+T6lC6D2DCOSNH7I4CBgQMkOmeLEs=;
 b=Z5nTLZVom3hZnSpGTE2Al0nlihZrgZVau8f8nDhQnwbRtGFZVLtKbG90ctUaCh1PZ102PFcB132Sp+uhXSTUgDWYHjR5z6gX0J310PqhSPsCMXxz4RYl3tKgUz/1YEey4JSCTy05zw6ixwaE6aLAMTdSIPt0YT90Ud6l/z0O2xmVfO5iAIdc77HKWefhXOqB03l7wG3aDCzRXEw0ZfjdgMiPVDWAzrrU1BnSWANocGSkpsy5ZbyrFIgSBWuTeP6zWShIZ6eNsMICnuua0ZRwaTUjsYBUsOMqq5ux/B6SXFsJ6ucsWxN+lLST7f9RjgdqdZMuxWX1DOIbFj8bgG87rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxhM1vltXOjPvL+T6lC6D2DCOSNH7I4CBgQMkOmeLEs=;
 b=4BC1REjSajqEcXbvKSRUyj3ugcKReIwoGXw2M/ujM6U0q+ehVxrhiwGbRFzrJV0t0EVVjge1JFNzpGuM3Terb39hybMc5cC4Rm4pVi4+8Uim9V2zFMID6Psl8egtaErL8pVePo/ftSM25fdA7vQGtIR81zZ4+59SS28LKfIv18U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: [PATCH 2/3] xen: silence maybe-unitialized warning
Date: Mon, 29 Jul 2024 10:24:16 -0400
Message-ID: <20240729142421.137283-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729142421.137283-1-stewart.hildebrand@amd.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DS0PR12MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c3a7ee-e25c-4d86-b9a5-08dcafda30b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGhPQTZjYXJuWVovUEpMQW9WM1NLOFFYeWMyWUJoVm0vUmRrUGFkWmxmWmY1?=
 =?utf-8?B?Y1ZUdFdKWVlVdWZ6aHhIVUdweWR4SmI1SDJFSy9uUjFkekk3Tk1jUXhNYTlj?=
 =?utf-8?B?RE9EcEJMODFLZFpNaHkycGp4bTV1QjM5QjFQcFFaS1NNcS9BT0hjVHpnUGpT?=
 =?utf-8?B?bXVMaklDaEszMVVNWDdVYTR5eVZXNXk2TlpBdUZJSFJJbllycWNjWE40K3ZB?=
 =?utf-8?B?L2FkN2h5dXNZL0N0YkNuaXBBVFBiZzd0bnhHNWkybTJ6YWxHZkJ2TndxMEY4?=
 =?utf-8?B?Nk9DN1pZVkJtcEJibDBxaGN2NW5jcW8yWk9mbGVmOE82K0F3YUo4aUw2c2Mz?=
 =?utf-8?B?MFZ6ZEZ0VGNDS2gxOE1SbjBNNExSYkRYWTQ4MzZqdUVpYjNIQ25acHovNUR6?=
 =?utf-8?B?UzFvN3pPRE5FZ0UwUU51SkIwdXp1ay9lNXI1VlBVdHFReFNEeG54SVFyVDdN?=
 =?utf-8?B?TmtBN2hra29tYU5wSnNrbW8yN1YyUENMV1l1Yk5UOG9pZzAxK3VvR2dGK1BS?=
 =?utf-8?B?WDZYY1JyTitFQThiMDlSSmxYcGhpT3B0c3F6ZU9CUkJYQWZ1eWRYcmorTDJx?=
 =?utf-8?B?QjJsODJnQVk0MC8vUUNnamx6cC9tbU5zbjZXSzBGTmNzZG1IZnh6VzFoaVN5?=
 =?utf-8?B?eHN5SHdJTVRtODY3Sms3aENZaTRjVXRlbkd6ZnlDRktzalpHK2ZXUFNydEdz?=
 =?utf-8?B?ODU5alFqZ0x4V0x3L3BvOWhVaE44VUZ0eWVlZ1pXbDdxd0YzM2JqZ3AvSXBx?=
 =?utf-8?B?b05ZUXVEYWZQV3krVnhsblYwSGNxYVlIbHVReGEzUlNpMHJaQWxESWNFWUI4?=
 =?utf-8?B?Zy9HMTJ4bHUxb1JVVVhOOUs1eWZ0YVBKSnZWcVdyOXkrRko0cDIyRmVvc2RF?=
 =?utf-8?B?ZVpwK2JRSkRyRTFnNmcrNEFLM2JsV2Z4ekdFeldGY3ZmOHVhZ3h1SW9mR0Na?=
 =?utf-8?B?UzRkY21HbmlLZ0VsdmhhZDN6UjhwNEpnbmNNODZFbU0vcEtRS2NqMEhnbWxk?=
 =?utf-8?B?RFo3Y0FYT001VFA0QTkyWDBibWdqSHFXWFVETnJOZDVoekxzQVFmUUJna0N1?=
 =?utf-8?B?TFplSGdXMDRrbDc1TmN2SFBaNzJGWmVXNUxRVExndGxnOGpsU0tRcVpndGlK?=
 =?utf-8?B?L3RHZXE4TzgvaVZEek16YkQrUW9xcmZ1dWpKOGpsTGk0M3ZFNVlPc1picmhG?=
 =?utf-8?B?b3hsdFhxSEdaVmNoclhVRjNnZ3RFL0VYYk9kYWx6N2R0T2xxaEE4bjd4d0sx?=
 =?utf-8?B?T3dBOFFPSFZIWnZZT1NScFpubXkxaWFHblNrM3gyRGxrYWZMMjcrSzB1R3Zh?=
 =?utf-8?B?TWM0UURjdlo4MEZVMmdUVTkyRE1FMGMrd051Vm50eUc0cXR0ZTFmaFFMdjI4?=
 =?utf-8?B?ODJzMVVvbG90Z0NOcU1sWmFCNDVTVVRrY1JJVExXOXpwQWpVTFJ1cnVWSjQw?=
 =?utf-8?B?b2hWWXJyWnJMa3RqODF5RFNxN05EdTE1M3hSbzVCUTdCMVN0RVkyOVpCSGho?=
 =?utf-8?B?OUdHdm05cy9hZ3JRYXB2OGZxNGlFNmdzV3BJNnNlZnNzU2wzdTlYeFhEbEt1?=
 =?utf-8?B?dGFQWktIRVFZOTdiampJV29TZGtGU01mM0hjaGhKWUhSUmdxdFBlNG16MzdF?=
 =?utf-8?B?RHpEcDBORXJPYVM2YzRsUEtWRWkrWVFqczBIMitXekVlNFc4UE9Kb0laNnBp?=
 =?utf-8?B?RHNQYWt0RnJxVmhJVCt1LzRYRkpqeHRGeXlPTnF4Mm1mTWxqalloZG0zdjVw?=
 =?utf-8?B?bk9BVUJtd212UjE0QnpyRk9VZ0hVQjhWQWNkdmZyak9zc1NVK3VaQ2JlcGdL?=
 =?utf-8?B?YXNNMm9PVFpnVmdtN2dUazBMNThMZ2NTV01YR0tzd2FDN1FpeXoxSUVRNGJK?=
 =?utf-8?B?S0RMS29tRi9tM0t5cCtIZWlJLzFOR0QwWnJpWkhxL2hEZXB4bWJoOTgzajYz?=
 =?utf-8?Q?8LPtVttN6Ng2IFyUKb945BFkJ9VZwhYA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:24:43.3530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c3a7ee-e25c-4d86-b9a5-08dcafda30b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8318

When building with gcc with -finstrument-functions, optimization level
-O1, CONFIG_HYPFS=y and # CONFIG_HAS_SCHED_GRANULARITY is not set, the
the following build warning (error) is encountered:

common/sched/cpupool.c: In function ‘cpupool_gran_write’:
common/sched/cpupool.c:1220:26: error: ‘gran’ may be used uninitialized [-Werror=maybe-uninitialized]
 1220 |                      0 : cpupool_check_granularity(gran);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
common/sched/cpupool.c:1207:21: note: ‘gran’ declared here
 1207 |     enum sched_gran gran;
      |                     ^~~~

This is a false positive. Silence the warning (error) by initializing
the variable.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/sched/cpupool.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 57dfee26f21f..3d02c7b70690 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -103,6 +103,7 @@ custom_param("sched-gran", sched_select_granularity);
 #elif defined(CONFIG_HYPFS)
 static int sched_gran_get(const char *str, enum sched_gran *mode)
 {
+    *mode = SCHED_GRAN_cpu;
     return -EINVAL;
 }
 #endif
-- 
2.45.2


