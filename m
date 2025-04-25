Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3603A9CFA7
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 19:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968432.1358030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8MvF-00011C-Su; Fri, 25 Apr 2025 17:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968432.1358030; Fri, 25 Apr 2025 17:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8MvF-0000yl-Py; Fri, 25 Apr 2025 17:33:09 +0000
Received: by outflank-mailman (input) for mailman id 968432;
 Fri, 25 Apr 2025 17:33:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzCY=XL=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u8MvD-0000yf-Uo
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 17:33:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57c6433a-21fb-11f0-9ffb-bf95429c2676;
 Fri, 25 Apr 2025 19:33:05 +0200 (CEST)
Received: from CH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:610:32::9)
 by SA3PR12MB9107.namprd12.prod.outlook.com (2603:10b6:806:381::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 17:32:59 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::cd) by CH0PR07CA0004.outlook.office365.com
 (2603:10b6:610:32::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 17:32:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 17:32:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 12:32:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 12:32:31 -0500
Received: from [192.168.223.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 12:32:31 -0500
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
X-Inumbo-ID: 57c6433a-21fb-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGbakci1hw/Egy1sDgDa6noues6Q2IVPOL7BPHl+/qts9VFMq9862fwFeFaVNh734Y7F2el1mjwtagW6Tsjo9oTPlY/TIEeiGmD7MP2d8kMWYFxV6B4o7sJFhqbcX31GM2dURcM6SkEZK/UcrNX4XWOM9GfYLhAmP4nb+lrezNHkIcvFl56Ae7CJppsMdgug5CPxIZPLJmy2S7y4gr+yjB3Z0bH22f6sZ6SE952zk/lVU8ym92H8UKgKkMy9/sqinA6hSxbotROCNITazo9Ih9oWf0J75CDwqQ87aSvCCzfDcBjvuA6uDntCETyR1E90v94+kxCzHh8sZwq+P4/kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBlBCK9PLjRb8d98og+xLA73usRVW3jYMzlHqxm/rII=;
 b=Zmn8Sbcc5mh0MAxPQkdEibCpCKQxkM2fXKK7z7kMvIUqpbmf9e0wtgp3sVlC0r/K9/iMGnzB3KlDQg62MEG7KnHKeL3kSb7pQSSv93ucqaSvUvSDscVWKdANQ3a4gjhmIvGhBmWUO4UTzwFKbPto/MYbtG7zLUxPVxd1D/qt5IQoKwAFqErR3hdZu4xW0De2NB7kK88WedTA2Bw6nDiT3F+UsJrmo1KwJWKNoTXfQQSq024aRzyj+OWtQ9KD/XcplAkcNZiLUIKOOVW7OY2O2F2un2Zrjj274PFNbgb1ONbbu49BCje0L1uu0DJlFmJJclbUakgsCAGNaTUDZ0NHHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBlBCK9PLjRb8d98og+xLA73usRVW3jYMzlHqxm/rII=;
 b=bwIjL//vp6RWMCYQ0AeHOcODgJ5ml1fZ2w4B1//KYEabu+weyWVbvw0VKfqq0PdDzMtbRawEV5oGoWg+ZoavsPhvrtHBho9ZKrWwuur5PxL/Ni5q+OmA91aVY3SSoo3ptlgell1R1whsmFViVrFHfNStbyiyeJqxedeMogIJdrE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e1e679d7-6578-4f8b-b61c-71a34230a98c@amd.com>
Date: Fri, 25 Apr 2025 13:32:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: constrain sub-page access length in
 mmio_ro_emulated_write()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Marek Marczykowski
	<marmarek@invisiblethingslab.com>
References: <8e31896e-3603-4969-af7c-3175ceacff55@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8e31896e-3603-4969-af7c-3175ceacff55@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|SA3PR12MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7ec899-f642-442d-c970-08dd841f38d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXhZVFRLOWxmVUh6blNpcURoQnhjMDBwMnBUeVZqYWw0RXh0OU5tdEhsRHd1?=
 =?utf-8?B?RVA1eWZvRVNOSDhOcnBtd0RucExUdyt0OTEvdkw0UmdLeExUQ25QbUdBODFz?=
 =?utf-8?B?ZEFLMnhmYityRnVVNnMxT1RTenJWaXcxMVRmRUVMemhqMmJLQnNHaktWdWMv?=
 =?utf-8?B?OWlnRk16RWx6VTlLWTRNZG5DZXJjYUpObWE3bTkrdlViNVdZWHFyUWJkVHJw?=
 =?utf-8?B?aXpMNFRyMVNrdjBnTmV4V09ZZkhsdlJ0VU8wdTgzdTNlWEljZWNLUWFpaGRK?=
 =?utf-8?B?U0lGWnZ3Q2R5ZDFKajFzSHkrbTg5NHF1TUJFQStKODI2d3RCem1yL1l2aG9T?=
 =?utf-8?B?M2tmV082KzNjVDJuWHhtb2dEcFlxb1Y3V1JaQkhSbjgrY2dPVlBTLzNnM1hW?=
 =?utf-8?B?UXA2bjBndzM4Wk13eVJlcCthNDZJYVdjZzdrYnNsOExtV0lwcUVJVzdoTmE3?=
 =?utf-8?B?ek9WM25yaTFOQm1paWNJVWRkNU1rMjlZM2FIYlZLM3NYNmtnZVlsRDRtYVJ3?=
 =?utf-8?B?enYweHRsUmNXM0dXdmxORjd1MXZMNThLWXhhRERSYXRIWUM2bThlN0VuTkFS?=
 =?utf-8?B?T0Nnbmw3clJTZE52TVRwTGsxQXdwZlBKVVhqTG5rNGx3MUswZzYwRzlycUZV?=
 =?utf-8?B?eU05VDg4TW1tVHh0T0VDRHhITUN2V2tFZ0pLK3M4R1luMmtWd1pOUUVncU1q?=
 =?utf-8?B?TklpUDdSdVJUYW5nUThGb3N1Rzc3SnpWaEZmOVpoQ09rMWVNVGZzbUl6STdp?=
 =?utf-8?B?SUJZWUc2clp0N1ZYOVdQcnZCUVZXak9rTk5mWUJoL0RxYnY0T2h3TVUwYWtZ?=
 =?utf-8?B?R0NKSlZqUGFGRmlVcVYxdy9VbmZqWjdCTkF1UzJmL2lxN3BlRHNXRjRUdU5w?=
 =?utf-8?B?bWhZaFRFeTJrOGJhWG5QY3B3T2IrUGo1UGdBd1A3UEVLSVhYQW1xSUZkVHQz?=
 =?utf-8?B?Y25BTkhMK2JtNWE4djJJejRReDFKK1lFWERQQi9FS2VmUWFPa2Q1V1dBQmly?=
 =?utf-8?B?Rk5JVTNyWmRxeEpVMnJFajM0L1ZtVDZKMFpia3hzMlEvOTFiTG1xb2huV2NY?=
 =?utf-8?B?b0tLOUR2d2JvVXpEZkF3ZHRlSVc4Szgvc2dWcVFjdEdCWWJuQnA4c0w5cDJC?=
 =?utf-8?B?K3kvdkd6N1Y2aEdMMS85NGZLNitrUWZJdHQyUHNnay8wVUZnUnBCS2JrLzBM?=
 =?utf-8?B?UGhqSjhzWmt3VmpnRDI0N1V4NUVkQ01Rem5GZDFpdjI1RHJJY1lyVHIvbmQv?=
 =?utf-8?B?QnNxRDNLYmwzcU5PU0kyTkVESzhUQXdlNElhOHgrQzBhWXV4QjFrWTE0dTdT?=
 =?utf-8?B?QzRpQXVLR2VTL1ZEdUhrd3pYanVHSnFYaUVFWml4MG5KejZMOVhhYUdRK2FS?=
 =?utf-8?B?Wkk3RGVnMEJ1ZytxcjdQOUFmNkhmaUxabnNaUnVzZkNTS3FRWndweGEycDBW?=
 =?utf-8?B?dCtPMldlN3AwTmJhTDFVSkx6ZVVsM0hYbVVzekhTUlNHTDlId1dENkpWWk5k?=
 =?utf-8?B?V2NYOVFUNjJtNnJ1c1JlU0VEcmRaMUtCNVpzTXVDNWFscGtlM2VSYUFmZTha?=
 =?utf-8?B?bSt4RzRHV2tzRHI2OG1pVmcwcU9LRlFLSTN2eno5UzdYYlFYNjZYV29MR3dK?=
 =?utf-8?B?QVRGZyszeVFkMTRMd0RuR3MyTDh1eENGakpZWGJ6QUJjZ0tReURzQzFMS0ZZ?=
 =?utf-8?B?c3lBb3FKeDJGOTJSQVZrclR1T1o0SXE2bkhvYUhVcXBGUW1NV1UyQUlyWU04?=
 =?utf-8?B?aENNd1I4NkJQU0lsSTZQY0lCY3pDT2ZrbVJlazZuZ3Y4QkZ3c1E0azdudktv?=
 =?utf-8?B?VEx3MVpXNnBPYmRIbWFyL1VUdDMrYnhIdjdiWEhHN3dEcDh0RXlYamloVE9a?=
 =?utf-8?B?SlRuL29Ldi9pYzlrWW1GcXdheEJ0VWJlZnI0VDFyRS9YRGk2UVAzNzcvQzNp?=
 =?utf-8?B?N05Uc1ZidWFwMVNmRHRyMUEyQkk1ZTdsUmJTTzZ6VkpwcGE4QW9WMjZTVm5V?=
 =?utf-8?B?cW1LRUV3YXJjdFB0ZFlWVHJvOGlGWmNhNzVaSkp3Vm9acEJjeWlWdE1yTFNM?=
 =?utf-8?Q?4taA2/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 17:32:58.7905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7ec899-f642-442d-c970-08dd841f38d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9107

On 2025-04-25 10:57, Jan Beulich wrote:
> Without doing so we could trigger the ASSERT_UNREACHABLE() in
> subpage_mmio_write_emulate(). A comment there actually says this
> validation would already have been done ...
> 
> Fixes: 8847d6e23f97 ("x86/mm: add API for marking only part of a MMIO page read only")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

