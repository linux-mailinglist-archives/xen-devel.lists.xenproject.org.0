Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31630B3E474
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104767.1455812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4PU-0007bF-Kf; Mon, 01 Sep 2025 13:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104767.1455812; Mon, 01 Sep 2025 13:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4PU-0007ZC-Hv; Mon, 01 Sep 2025 13:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1104767;
 Mon, 01 Sep 2025 13:17:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RBY=3M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ut4PS-0007Z3-Vp
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:17:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [2a01:111:f403:2412::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd7014c5-8735-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 15:17:20 +0200 (CEST)
Received: from BY3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:254::8)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::999) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 13:17:15 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::bd) by BY3PR05CA0003.outlook.office365.com
 (2603:10b6:a03:254::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 13:17:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 13:17:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 08:17:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 08:17:13 -0500
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Sep 2025 08:17:11 -0500
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
X-Inumbo-ID: fd7014c5-8735-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPX0FaIHbwS50xg8Cm+sufucZpuYsOkZwDabBurdznP52DMpdZD2B6K0rtOKxi8hJm16JEzkWS4mSEyENqkHwB+ui7LEvmJvX9/Bw0EUzc+iA8RA0f8t675yMlm5f30Sh7CwapruFJMB46kGZIWhNumutOlwhWg3+UPYKOk9VbgaFEMVGs3PTXkZL33/mQTqAxsey8lF7RwJBvi/JhJyGYGEz0XWEaOjogG2QMAc1zA46rGoM2pi1zLPIhg/3ZHF4MAib1cH45B4NxSwYA9SDvQ20QPpB/0tebf2qA/1aGEAg8YEIUaunsX0iZIoj/yhgaiNfSfhDdN3V+kb4f+WXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rx3fOCSwsGtXm6ZBrmsvbB7eQMtANgtB6v4VWy1ncdE=;
 b=mFCqh33QrWKPVGvm8ueyxIlC9MjmbTfhuVZ507DwAMMt5BiSKi+OGZafQzAK6F4Upn97ea7a9pzAX0kb43KHKInzNARl9nVBHfB+V9ezzEBBrsioiDmT5jTLYQk48jQC39rJv3U9cLJQycZ//VW0M3sxKcHkkBT+GLY4wgncHLjo666dRnogdzaf02y089cG9/OwkGJqwqj62mwxu+LNmC4S02Tl67fjfHU8X4CVY/gWMlUo5TzzEM0L9AMBZiOMUj9b8uiCvqhWs6TGReD8C0STfcLp14EALla/OSswjm+JECaRU3rzoJmIaGe0wBeiFLhS1KpmbN3doHi9iHGOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rx3fOCSwsGtXm6ZBrmsvbB7eQMtANgtB6v4VWy1ncdE=;
 b=Z/3MYDgM4GC9QQQhpZIgB+JAYhjkpBszxzvXdO3Vo1LVLwWx7sCu9/UN2dsyr+qPxsJA1AorVgC1BNSyj14pwGmPNtwfN0XQ7mzyis1LO5nnSjLp8F+mvBd35b04plAyMZEKCDjTt3uzC171MnxqdI61ZiBd+L5c3DI3Vrq3mfM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <20f5b553-75a6-43b3-9b2f-1cf73b9589c3@amd.com>
Date: Mon, 1 Sep 2025 15:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] imagebuilder: Add a script to check the sanity of
 device tree
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, <mark.brown@parrylabs.com>,
	<matthew.l.weber3@boeing.com>, <sookyung.ahn@boeing.com>
References: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d07605d-06e7-495f-74af-08dde959de48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1lscFRUV2pYRVRtWmVsejVyazB6aTBBR2tycFBxZ3orMFdHN3lDcEJ6M3JB?=
 =?utf-8?B?eGZhRitQclZPMm5rMkNneGlodkYycHpOUUpEMTVQbk5LT01PSUhBSlBGKytI?=
 =?utf-8?B?ZURRZmwzTlJIK1o0Tk1hOHJPR05XOVN6Y2J1ZXdkeFRkK3FLU0dyRlVVdll0?=
 =?utf-8?B?WENNSDBXYUlBRmt2Y2NsZ21mVnp5NFFTbklDLy9pcWNnQXBVTVVETnNRQkdj?=
 =?utf-8?B?ektwL2hHTmNuYTdrK09ZRUtlZ0hZK0dsQWROd1EzbHJvOU1zd29xOW5Yb3g3?=
 =?utf-8?B?Yk45akVMTUl2bjBpZWtPUFBFQndjRWZ3Z3hmU0tQRFBCcEx1NWdXYnVqbi9P?=
 =?utf-8?B?Z1IvenUvV0Z3eEpmOE92WnBZSGFJT2tiNkxTNGN1ME1jbUJTb3RPZi9NSWhh?=
 =?utf-8?B?YzJXcFNXYjBqUTkxT2hUVzVzdDVnSnhtOG9wSmM0eFVlTmcvWjRiNm4xSng0?=
 =?utf-8?B?OG9VTHhleWhSU2VzSU8yM2swL2M0QURNcnJzYjhqU3BWRjY4RWg1SE5zVWtx?=
 =?utf-8?B?MXhJMUk5ekl5dTRBdTl6NHF0QkpNb3VhcVI1d0U5Z3F0ekVIMlVlZWYrNEFU?=
 =?utf-8?B?aG8yVFR3b1pJbVh6TTRkSFQweFg4N3VxcWNvMmpEQ2NxcFFKQnhjTnkzblNC?=
 =?utf-8?B?OWQ4VWdNWEZFS3Q2MTJGT1d6Y2FkcWJHays5ajJRVEFvemFoRSs3eG9uYnky?=
 =?utf-8?B?SWRia1dkU25ldnpjcGgxLytCUW8yTUdwQWZxQk1UN052SjdTMkllZXFkazRD?=
 =?utf-8?B?T28zdmc1YzVEc3owK3dNRGY2VStJdmVyVUQ3bHJpckhoakN6TU52STlzQ3lq?=
 =?utf-8?B?Ti9tOTRHZndPS2p2U1NJYy8rdVd2SDBMNnF6WWduQjhYRWhRNklNR0d1a3py?=
 =?utf-8?B?cjVzVkpWQW1rL2VuVlZZZzJ0T1piNkFuWnJJRW9sK1JFQ0RFU3Z1RlhQUERQ?=
 =?utf-8?B?ci9YN0NCWTMyVWh1dm1QNkQrWjBxT0VZZnJGeUQ5L3B2aE1jQ1E4OVFPWHFy?=
 =?utf-8?B?Qm5nbUZPaUU0WVowUEw5d2EyN0l4N1NNWllDWWNDaXNOMTdSemVkallYRm16?=
 =?utf-8?B?SXVrK2ExdVEvclJId2hTckJ0cTRRNmUrNkVPNlVWR2o3MU5oeUlWMkZDZHAw?=
 =?utf-8?B?RDR0U0E4RkNmc0E5SGFKMVl4c2pkTGJSNkM2a09NMzcybkd4cnJ6cVZxWWwx?=
 =?utf-8?B?aE14ZW5FTDVaeU40TVNSZWpXTnZCdjArb0ZFSmZKa2dUU2FyelgyTDF0MW8y?=
 =?utf-8?B?YVNJZkhZUlpFM2c2YW9qODhVdzI3ZVFsU1V5dWIyeGs5bFNaSWRvZmowMGth?=
 =?utf-8?B?bWJwQlJZV1VvYk5rZDlJUWZVN1ZOYlk3bE1HWEp4OThacVRMR1c5UlY4VUtY?=
 =?utf-8?B?eEtuNHRwNk15Z1BXeXMySnBJM1VEOVlBRVBmRmdUY0htRVBlUDdJZzZTSldN?=
 =?utf-8?B?d2xjK0xIa0pxQVk3YTdrSmdEOXgzcXJJazBzQ0xVNGZwcUkyOUFpY1FpeFhx?=
 =?utf-8?B?ditXMkxwUi9iN0VqTDM0NXJIaHF5elFrdTRDZG93amQ0Z3k4bmd2bGxNU05o?=
 =?utf-8?B?OHR0UUtzbTNSV0YvUGhOWCsvVTV0RHFwRS8zSHV0VjNEays2QW5aN2hITnFl?=
 =?utf-8?B?QWdNTThLQ3Budlp6bHFOWVA5SnpDQ3BuMjVSaVZsRmkxTy91NlRjNnBpSm1a?=
 =?utf-8?B?djN3TGFWWnoxaGU0V1hnak1zeHlJSmVRVHVCK0NRbGdlSkk5c2oyZm0vVzBT?=
 =?utf-8?B?VlJZYUhXaE9iWkZDUG5pWk15NVVaQmFQWmw5UmxydUVmUE0yNGxsZGVwSDZ0?=
 =?utf-8?B?TmFZL3YyaGh5d3pqaWtld0pGN1hmNC80Y2lqK3U3RWlYMklUdGxHblhLVXZU?=
 =?utf-8?B?dDdPTFEvaENreVpLbkYwRDkxd0g2S0pQL2hpOWRGc1ZhOFZFZzY4RlFaWEdW?=
 =?utf-8?B?bHFFc1o5ZWV4eUpRa1cxWVhQNWNhYm9OME9KQi9yTjkvQlcyemRUOXVSTHZB?=
 =?utf-8?B?TzdjV0t4NDBqb0JiYmdza1d6TGdWcE1nUFhUNFdqelZVZ3FQcTBVNFlGOGkv?=
 =?utf-8?Q?JbEl7u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:17:14.5790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d07605d-06e7-495f-74af-08dde959de48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39



On 01/09/2025 14:31, Ayan Kumar Halder wrote:
> Xen gives a panic if certain nodes are not present in the device tree. In order
> to prevent this panic, scripts/dt_sanity.py is written so that it checks if the
> node/s are present. If the node/s are not present, the script gives an error.
> 
> User is expected to run the script against the device tree before booting Xen
> with dtb.
I would expect the script to know what to look for in a passed dtb. Otherwise
it's just a script that searches for the list of specified compatibilities by
the user. In other words, a simple grep would also do the job. Compatibility is
not everything, there are other things that would prevent Xen from booting.
Also, often times the dtb is modified by the bootloader before passing control
over to Xen (i.e. it may differ from the base dtb).

~Michal


