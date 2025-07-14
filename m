Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89225B049FC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 00:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043153.1413261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRKZ-0005nq-Om; Mon, 14 Jul 2025 22:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043153.1413261; Mon, 14 Jul 2025 22:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubRKZ-0005lT-Lr; Mon, 14 Jul 2025 22:07:27 +0000
Received: by outflank-mailman (input) for mailman id 1043153;
 Mon, 14 Jul 2025 22:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbYV=Z3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ubRKX-0005lI-I3
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 22:07:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2417::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9568633-60fe-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 00:07:21 +0200 (CEST)
Received: from CH0PR03CA0216.namprd03.prod.outlook.com (2603:10b6:610:e7::11)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 22:07:16 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::20) by CH0PR03CA0216.outlook.office365.com
 (2603:10b6:610:e7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 22:07:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 22:07:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 17:07:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 17:07:15 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 17:07:14 -0500
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
X-Inumbo-ID: e9568633-60fe-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvEYJFGu9LQu2wtAqVP/WDRXZRnIJKc1PhlglfO/wNG/mq3BqmOLJF4Xs7NMHzQ5KPuVYdFLFqrkLL524pIIyvfaRro0BCoRijywXK4FiqslBorENA3U80EV7pFF0x3le7rgGnzA92X+IECIr1IOhqYLpzATrQLoIT6E4UQNCL7HrmLvYOPgytp3/BLQKk2sgkYnRwPoVz4O5/G6NLvKKU23q3f+a9fCdXEs/uvd5+b7DBCND1l4Cv4kNmYGUO1MDxhZuhitWfEpDSellJk5K3wUMBh6CTYP01WBFSZfA+Ptv6wCNwgezk6VTloi7BTgA0ctKG6Q41hUdl+qwqaYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqLiV6ad14stBgQfKPeTwwZ9awimEWkq9MCA8lan5i4=;
 b=errWL/KHb9zrmW8XJrFew3+6EynegBK89HQDyuzuQjAUTwABKafQq/++UoGwImG17WR4i1ISIpCQlf3u4nroUA7VVWweuHDMIcju1b3uXwl3M+/d+xyg6njPZQED7cI4OU1U8rmVN8jz56MFe3tKRpoSVijR9Ik+jOkGMe+hFAyiutHMVRlrRiARJFLnlu4NYMYRHNOAfoHYYMldD40T2xkBM03PYHhjmJMPTxQkwf6tz285MSo4t3pH+xbCpE9MbFQVtJ6WuYgUFWjrTbE3Eh1Ee4WNsJLIevgUCnjQir+qwnjzWvvqFOZJ13gCviKzd7cc1LNOSN9dQNXcuUsazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqLiV6ad14stBgQfKPeTwwZ9awimEWkq9MCA8lan5i4=;
 b=ux9nD9HGJkkFsTUHCmHqGuI/YNSsRQRzdXSSSml7wH7jfwC14K0OGvwQq0gN+AuEGV+sqpQRN+ycbif7QTQKuVHBmE46iSFEGaxZd5GpfVi/EiK/w/ApBXUcS2bVn108Vcz2IhVfLbV4P3Dh2UouU5Jn12s1b/m++zQ073jm5m0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c8a1f6e3-6fbb-4d5d-96f3-60f0c02e43a3@amd.com>
Date: Mon, 14 Jul 2025 17:56:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 19/19] events: export bind_evtchn()
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-20-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-20-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: c21a874f-450d-4d8b-7863-08ddc322cae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0YzVUh6N1BGMDV3Y2toSWxXYXYvUWlFN2xXZ1hNNTFoNjdOTldoSmQxSXFM?=
 =?utf-8?B?a3dJZEdCYnZsbzNGd01nYkkxaTViWjcyOVhQODNIYlJraHQvVXZYODUrT083?=
 =?utf-8?B?cUczUjJwZEtQT1k4UHozWldVR3FIUnE4VHVITFJSUmQzSit6dlRSazQ0SEJE?=
 =?utf-8?B?WE82YXNJY3lIMXRob0NZWjZ0Q3N0dFdBdXlQTG04QjhMZjRYWitncVUxK0xY?=
 =?utf-8?B?NkRGNG5ubEIySlFkSURxSEtPS0ZkQldxSlo4WGJ3bFhySmM0L0svcFBiVmkw?=
 =?utf-8?B?WWE0cnQyMlJydXBIR0xlM1BzK2ZTbDVRSmd2bzhraVEva3YvblFrbEtzdjVW?=
 =?utf-8?B?WHNmRUpzSWpyaVliYUoyaFRSVjJIdlg3cnZUaTg2eEpqcmtMdG1pQWRBaXhs?=
 =?utf-8?B?VXdVZmtuRk1GM1RHV2VjZWFOOTVxNmNjNUNPUlZ6Nk50V0p3T08xMXhUMW9o?=
 =?utf-8?B?YWo3OUVvWThVT20zNUY4b29mUzJ5SzBzb0hFYjlLM2FBRmRPaXFwMDM0MVZJ?=
 =?utf-8?B?MC9GaUlBTU5rUXdKRHRDdVBoWG00UVdibXN2VU43U0VsdFNSVzZWd25LS3o2?=
 =?utf-8?B?WkFUYjJVZk43c0R0Z1lmMHloTERkYkhTNS9HTjM2ckgxUi8yeGUvY0FpRmVs?=
 =?utf-8?B?QlNKMHoxSWZxYnNQMTB2bmNSU3dWT3lYYzVuM1YxMm91aGN5aHI2L3cvbEJz?=
 =?utf-8?B?RnBQdUowdGlhVnB3Y3ZkZDFzZUZFNUJGZ0ZHZUV0WU01OXNBUUowR0tHK240?=
 =?utf-8?B?K0VFclZXWWVOZXE3WHdORGFPdFBsZ2I0cThsNXpQazhmb1lMVTE2U0pScXU0?=
 =?utf-8?B?ajhIMVhjRGl4dElEaDZBaFlidVF0RlYxZEFEZFlKV0NzYWYzYkVLK0VHQmpa?=
 =?utf-8?B?cXRvMmV3OG9iL0ZRcWFNWUxkcHE2UCtLQ1BLbVdYVjRiOTB4TlhtV3RQUUhG?=
 =?utf-8?B?SHdHYUF1ZjNQaVM4OGJST0dmd1BkNTlzNXFKdHBDbmZkUkVqZkVqQVQ2eTJI?=
 =?utf-8?B?ZnpRMFdNMmRWYUFtRUFqL2QwV296U0xwNWkzdmh5dTF3VWdGR3ZFSU4vUTh2?=
 =?utf-8?B?RnY5REZCM1k0ei94M0l5V1BBSzkvaEQrcGhIZnVQZEdHUzhYR3c3d2FvWkZK?=
 =?utf-8?B?VVU4cUdvUk5XLzFPY2E1TUp1UEU2amduQmlER01mbzcvTmh4Y3p0L3J4V1ZJ?=
 =?utf-8?B?MmRMTHVDK2xhZ0o0UWsvcWluT2lURFRZQWthVSs2Zkl1dE05ZkxCSXRKME1R?=
 =?utf-8?B?dXZrRHJLVTJubDR6MmF6WGJieGtiMGNJaVRUb0JPQmozVk90WlFjZzlNUG9B?=
 =?utf-8?B?QkNpVWZ3T3E2NEYzZUFMY0JDYXgrcTZtRkQzcC9LaEZZMmcyVzNEU2wvNmFQ?=
 =?utf-8?B?NmZnRHkvcUF2UDUzY1NjdklRcmRqbFgrTlhHM1dyYVZjNXl0R1VtZVpWMEg5?=
 =?utf-8?B?cmRKdjFpU1o1MllLWU9iK0pRTE05aDVIN1RpaUgvMVloUTAxWHFKdk5CQ1dU?=
 =?utf-8?B?VFEwaHNvbU9MNGVBU2ZVcjZjVzJtc1N0ZTR4SnM1V3pCN21DSEZGeitMRFRV?=
 =?utf-8?B?ODh4Y3pYTktlOE5rS0xTM1pibUJKVUkvNnBnSlZBZVEwYmpTOThMdEMycG82?=
 =?utf-8?B?SmtPY05iYlJYaUp6NkV2QkZFVHVCRktYaGxlWWFzcWh0NWFlSDBLdFhFV2Uz?=
 =?utf-8?B?ZHprOHBDTjl2NmFxdjBlT0I5cGNLVWxvYU9WNkgwRnBmNnRERWFRYVB4SXhS?=
 =?utf-8?B?eCtodVdOMUh1RTRqQlN4UFlhTjFnV3ZFeDA5TW5LcDMrQXJwVEpLTWxuTTE4?=
 =?utf-8?B?QmJnT3BJTzZDcjhWSVMxWWllem52MnovazZjbFhvQzMwc1UvZDQ5R0NEeTNK?=
 =?utf-8?B?T0w5WERuK0hNSCtSd1RhN3VWaHdyV0hFMEljUjRUMVE0TUZRQXQxSTJUMWVB?=
 =?utf-8?B?MkYrUDZMbjAxN2g3djlZci9pZ2JOTEZwMUovMTc0VmtDLzlRZUtZYTFnSXBm?=
 =?utf-8?B?bmxjcnhCV0RkeStKcnJnN005STFqMUpCSW5Ecm1OMmlOV29hVTNqNHNQVURB?=
 =?utf-8?Q?Rif9nt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 22:07:15.6237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c21a874f-450d-4d8b-7863-08ddc322cae6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727

On 2025-07-02 04:12, Juergen Gross wrote:
> Export the bind_evtchn() function, as it will be needed for
> reactivating events after kexec().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

