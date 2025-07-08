Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31DAFD9F3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 23:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037326.1409991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFtx-00077q-Jg; Tue, 08 Jul 2025 21:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037326.1409991; Tue, 08 Jul 2025 21:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZFtx-00075X-Gu; Tue, 08 Jul 2025 21:30:57 +0000
Received: by outflank-mailman (input) for mailman id 1037326;
 Tue, 08 Jul 2025 21:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd/v=ZV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uZFtw-0006hl-3t
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 21:30:56 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20613.outbound.protection.outlook.com
 [2a01:111:f403:2405::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3af7171-5c42-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 23:30:53 +0200 (CEST)
Received: from BY3PR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:39b::14)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 21:30:50 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::46) by BY3PR05CA0039.outlook.office365.com
 (2603:10b6:a03:39b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 21:30:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 21:30:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 16:30:49 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 16:30:48 -0500
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
X-Inumbo-ID: d3af7171-5c42-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOSIyM35oSsQQt9oJccaGvJfv37mhf6e2aaynLAe204Y+L/FwPfGs3Wpc10K+ZdTPBzZEfACemadZRyicx5XzPYlgeu5r2eM+hNNTTWjpeS8QvM9E9zF0JqW5H1L/mGxCsT13LpHgvxvod10B888A1bAw601Lya5EYdNvgpefItJjAgIHo7iNvGlRFWOWednBYFkF06RN5/129eQ9nWWHfqt8YdxO2p2cl/XiIHKsp/6sMEYXCIKR1mnq1a1zjgPdZ9sdIpqFU3sEbAxgcujUAlLpQqg2/JiPdln1agyQGRMWfnIHlVWS3hY2Mq8xLMr2a+xiJ0+mQlIneL4E2wm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMa7ECTARDmd5L6zJ25fi4TG9HI3uZHFcYJ2ncVq27U=;
 b=qLeTGuN5/mz1CBR1ccobyO5Ufl5W5esFc6audyYg5jaDcIzHUevL2i6rDXbiSmsXyd7wpCJBZXYGoNRQ2rvhTm9+3837966qh855PzDAkG95eOIyM+hQMaCybRShGv9jcdZ0tGfVHi5Y+HMktS4t38wvcBMpublyX0LEdFpMey8uc09bV2paO/nuMcpxmEqBU8sji0dsWs2IiSLQIhY5CjIvtl1o3U6h3qXJPtz6z3KQlwLktSPk4W8Gqsifoz4u1k85I23q42rRdDKIwAiW/L71mSs1UjIFkJviClbt4Lfl9fjsi3Iq6JLv8dXD/boZlxm/gXdp25on+GQSow4EjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMa7ECTARDmd5L6zJ25fi4TG9HI3uZHFcYJ2ncVq27U=;
 b=0iarbuhqg5jj7hzFgTxiRIgO89yrL8tqBQ1NBQSlr0g/TeI5VZ4rP2G76inB9HEgNuC7hEpGqMIcuuAqy4U1iQqsStYGHdXpnyGW0Nhe9BVs9YZqILznkKWoA3eDavteAfsOw3xO4s2NkSoNtYY0qXw0jWYjWMcNIS9GcFG5cHg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <771d2175-f7ce-41b4-91b5-d5eee131cf6e@amd.com>
Date: Tue, 8 Jul 2025 17:13:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 05/19] mm: refactor init_page_allocator()
To: Juergen Gross <jgross@suse.com>, <minios-devel@lists.xenproject.org>,
	<xen-devel@lists.xenproject.org>
CC: <samuel.thibault@ens-lyon.org>
References: <20250702081254.14383-1-jgross@suse.com>
 <20250702081254.14383-6-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081254.14383-6-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: c48515f8-f074-4861-5c84-08ddbe66b587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVNKMkUzemtxY3R4dGkvaGdIS3JGMnI1U3Y2SG0yVkhwVTdjc0lxVWEvYThO?=
 =?utf-8?B?YnkvcDN5b2hxV0RtMTcxRzFuWEhtSWFGeXluTDVHOHc5YW1OTXl0c3hyRnNp?=
 =?utf-8?B?b2lVdUI3OEtUOTJyWTlwY1ErWXV1Z0IyMmFwSVF5cHZtZE1JNVg1dThmNk1n?=
 =?utf-8?B?WDdkZWYvOERORGIvZzVqcFBoYk04eGJsbXh3a0ZhbnRyMjh2Sit4UG1pMkFS?=
 =?utf-8?B?ZUpzbEd4S0VuT0FKS292bFU1cEpLNzEzT2d4VUZ0RWNSeTBUTStyQ0xKYlFL?=
 =?utf-8?B?enR3aWRoL050VXhDSFVhdjFMZVUxdkwyVWoyUkloZWxJZUpyWFVlUlk1U1FB?=
 =?utf-8?B?Qm94SVJ3UzJoTldINGRoUUJydzRUeHhFNTF5ek9PSzhHRWtXbGNna2Y4M0hP?=
 =?utf-8?B?RkJLaXdqTEMwVWFDazVlbnc0Y0owZmk5cmpWZDF2UUdoUGlzYmw5ekovTnhG?=
 =?utf-8?B?dlJuRGRXV1poNGV5NTJvL0kwRVZqU1drbXBMNW12eDdSZDM1cnJFNUVwYlZI?=
 =?utf-8?B?ZXlyN2NLLzBaQW96WkgxS3RGMUZ3UWMvTzVJK01jbFVyYUNOTGo2MHZGNHR4?=
 =?utf-8?B?MVNSMndDWC9HWUxuUXJyU0JoSWRDNnEvWmM5NE5NRzJuWG8yUFEwUGtyVnU1?=
 =?utf-8?B?U3BUc01OVTc5bXlyUWFzYzJvUFIxRXFRZXlTSE9CZHdtNXRGMFNYTzVvaWpR?=
 =?utf-8?B?b09XR0ZtSFFaMHYyMFZwbXdMM0ErUTVrVHRVOHNyd1lNaDdlazdaeWlNL2Rt?=
 =?utf-8?B?Z3hxU0YrN1pIVHVnNHdPb3djY0cwS1g0MFM0Y3lxdnNaWHpxbklKYlFzN2FM?=
 =?utf-8?B?TGVoc0JIMnFubkwrRm01eE9JRG11a1dYV2tqVkF4V1UyQzNEczA4SGgyUlAz?=
 =?utf-8?B?cS9KVkUreGFpVkoxUWFBSWlGYmx1UWNjeklNS01jbFU4SWdrMUZVbVRVQ1Q1?=
 =?utf-8?B?SlNsTnZ1NHIzaDZsbEZZT0o3Y0dPd01WTUwyTkluMFRGY25vaGZxRkYvMVFx?=
 =?utf-8?B?dHJYT29Ud0o0NW5Ocjg5LzBKYnlqUkt3QU92UzgvOXE4K3kxRURrbFh0b1Fr?=
 =?utf-8?B?SVlJVjl2Ukd0QXBtcjhlT1dsSTVxK1kyQWNOOXFtdVNzSjN6dU5oekpvbEtv?=
 =?utf-8?B?YXIxdHU0MFJSL1lTSDV0Y1dEcUlHWjdaWkdSeVlZRis2YlpkN05Ia2xJWnZL?=
 =?utf-8?B?MEF2QkpJSzQ3amlNU0I1S2hpMU5UalR0NzQvTS95a1BhbzN1V0tQWFFvTE1v?=
 =?utf-8?B?SHpSdWlNRit0ZCs1cjVmTmRwWnlLTTJpZGs2R1AyMnJwWERPdG0wbllzcGpQ?=
 =?utf-8?B?a0JjWkRzWkFPejBqT2hKd2pyU2VrcjNzWFVTQ3I2RVpLM2NvR3lwNWxjSXBo?=
 =?utf-8?B?Uyt4VDgyc2xvTXZhbEt3cjlraTJhWXg1MUJEZDE4TXc3RXoyVzFyTjZBamUx?=
 =?utf-8?B?ZkN3MDdpK3cxWkxNNisxQ2RPaDlWYzVybjJtazBiNTQxbHcwYktwT1JxcWdo?=
 =?utf-8?B?ejVCNEhNYjlIbWY4dVZ6N25XTGNCVUFuaFZtMXBxblNmV2NpK1ZmWVh4U0NE?=
 =?utf-8?B?QkpwbnBkNWh4cVhpWHRiUVEzcjNJNjZPRHFkbUgvbUExSWowSERtMFFUL3ZH?=
 =?utf-8?B?TVpzWU5OSU9QSlpSZ2x6NEdvdSt1K0doN3QyTjVLZlE0eWhacmhEZHVOYmxH?=
 =?utf-8?B?MU54Mm1LNW44ckhrQkwzWVZNcStTaC9GcjVwbERUVkhIMk9DUXQxUmJNbnV1?=
 =?utf-8?B?bG5WTUJXcEl6bFkzZm1zaEs1NnVIVGdkMVR5WXJrOUF3SXBiZ0ExbU9TbVRl?=
 =?utf-8?B?R3VRTS9KOGw0ZDZ1TTcxYTY2NUJSVmlrMVlUMXJjcVpSMXJXMkw5dU1LMmZF?=
 =?utf-8?B?NHBudUV3eEtCdHltaExNN1hnUVFTNVRJRUJpcFBZSEgxUkhXUHhreDdLQ0Q3?=
 =?utf-8?B?aDJFQ0JWQ3F3OHByN0ZIdGJGZG5nQXhZeFpuS1k5Nm1mK3pKQ3BkeS8vNy84?=
 =?utf-8?B?TmdscnFveDIxZTB1OFdDMHBnN3Bkc3NLUlVqN21Gc1lRTkZ2VXZ4Mzc0dlcw?=
 =?utf-8?Q?2/9yPh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 21:30:49.6812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c48515f8-f074-4861-5c84-08ddbe66b587
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981

On 2025-07-02 04:12, Juergen Gross wrote:
> Split init_page_allocator() into three functions in order to prepare
> for sparing some memory from being added to the buddy allocator.
> 
> Use a function pointer for selecting the function used for handling a
> memory range, as this will be needed by a future patch. For the same
> reason make iterate_memory_range() globally visible.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

