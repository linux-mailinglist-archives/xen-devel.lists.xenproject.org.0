Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE0AB5AAD
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983130.1369478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt0Z-0001Bi-VC; Tue, 13 May 2025 17:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983130.1369478; Tue, 13 May 2025 17:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEt0Z-00019J-Rs; Tue, 13 May 2025 17:01:35 +0000
Received: by outflank-mailman (input) for mailman id 983130;
 Tue, 13 May 2025 17:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKf8=X5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEt0Y-00019D-RJ
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:01:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb172148-301b-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:01:32 +0200 (CEST)
Received: from MW4PR04CA0077.namprd04.prod.outlook.com (2603:10b6:303:6b::22)
 by IA0PPF8FC6E1236.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bda) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 13 May
 2025 17:01:27 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::7d) by MW4PR04CA0077.outlook.office365.com
 (2603:10b6:303:6b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 13 May 2025 17:01:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 17:01:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 12:01:26 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 12:01:24 -0500
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
X-Inumbo-ID: eb172148-301b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3jAyDo38JUsnmTZJ0ZXPUmQ+MRZpQxnDEvffTrI4A6fM204jiqd6OhWrtlFFc9hjP1fRpz0Gd+8OXkNf+c+hHrBYTMZ9zOhj4M/GTe3H7B/0dVUJF4/7zGIvwznaYLC19lpWeWIwvfj8i9cJyHGRYuNiFC+yNR+hROk8TxWhisQz2A6Vv1lGPqXLjYC7bjPKHaqJwh41GTHkXouZXJfAVxtBwQdO3nbJVf4VZS6Tx4Rz1AMl/4cQFmFa3WaOmurk4qw6Y+W2aYt2H022htsOlCXRPBexJPL9jWU88vTJ3h/G8UlTrOXx7B9BXLj988Jqk2jIzTNT3NJuR2AbdLu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30MnAZhpTp4Df94mweho2LyHvUayV6y9u7bd0wWM2WA=;
 b=W7RRGS6ButxoP/TxJ/X/pq7MdNdA3p6afjwBkvHlDgpAtFI3gNdET0F4yg8hZZUs1fOrzDlmBx8qnF+3LTPDYzX7R2FqIiRvQUqTtV+tKwue6m5CwORkAaBycVhBvWBfXhBWTVoi6dbZ16l62R+8XvzHlU7Cc0Yp0IisFCXftevHpUgwQpeHqK9yamHhdkPxsrqgq9Jdb6S9DORqHc9HhKNRiLRzvG2QF1nK/+LrXAKyIfh52J8CmXN2czPJIlroFAN0LF99c4ZRLjQ3mFiVckiL1E6++GdLCnCTAuF0hzFSBP2vgCfpmfZ5s6+rgCP9EJFdLxGpB/zxoQrqP0DSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30MnAZhpTp4Df94mweho2LyHvUayV6y9u7bd0wWM2WA=;
 b=J3nxZiQEsrOuSbK7tbo+7uu4Gl9u1Blo1sajuTDF5kyM3uI4HHWemhRdKbZgcPoUzFLEGBad54CLW5qYDvhg2sCN+biH4o6WPCiUzxViU9R1wLJssJLOEVvgofCw8Mt8NUP0rgSvo8ud9yalTknWr46Bbs7HPgO6UK4/4T+73zo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <914a4bc2-aa18-478f-b175-b89b56beaf3b@amd.com>
Date: Tue, 13 May 2025 13:01:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] rangeset: introduce rangeset_subtract
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-5-stewart.hildebrand@amd.com>
 <46dfb68b-7e94-40a8-9900-883ac899346e@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <46dfb68b-7e94-40a8-9900-883ac899346e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA0PPF8FC6E1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 876c5b43-482c-449f-cb62-08dd923fcc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZExYd3FFb3J0czlBaktMOEw1SThERytxNjU3cHVIVnQzTzFiUUdLYVhJY3Iv?=
 =?utf-8?B?cW8xKzZ4TjVRMDlNOW1TS1VqV2s4L2UzMDdXSG9Zd0FMdnNoaURzRHc1b3RZ?=
 =?utf-8?B?Y2ZidXUvOG1NTktsMUxJdklVM0o1QWs1dmVyQVBkeVhRaFBJSmZNNlBSTHNk?=
 =?utf-8?B?UTBObzZycHNjdWRqaTh3YVhDbmdvbC9JalMvcXpSZ0NtSkxWbVNYSXhjYzJS?=
 =?utf-8?B?Mm9Ja0ZBM1k2dG1jZjg0Z09wWkc1dXlhNUZ6QzZCemdHcW9jRkdTTFc3Z0ZJ?=
 =?utf-8?B?czhUNXk3Y3pTTm55N0VmNGg2cDRQK2hielZ2Qll1aG54VHpFOE9iWHpubVRm?=
 =?utf-8?B?bHNmVlZ5bGR0b1JHcm5JVDdubmJvdE1jTmx3WUpHT0xueUwwaHNXLzRtdUY3?=
 =?utf-8?B?cTRVU0hEOUhncGRLbG4zOW1xa3UxVUtDaVpqb3creG1pVm56NlFIa2tjTUk2?=
 =?utf-8?B?UmFGeEtmOVkvVDVkY21jTmp2ZWVvc2lZdnhOL3dVKzlUalZOdmFYUXZUc2o1?=
 =?utf-8?B?Sk9LNEVxMDlkUmVBREt4TjRTWVBwUDlQT2dtZTFXYk9SRDdZQnVJOElCdk0r?=
 =?utf-8?B?T3ovNVlmS2ZFS1FUak1VOTZWYndUSWM2bCtCcUI0Y2xhMDBSN25sQk55bi9R?=
 =?utf-8?B?eTkrTGFKQzRUWEhESC9FbENNaWVRRzNjT1plZVAvb0VlejR5bUdtRlRRcHRK?=
 =?utf-8?B?Ukd2YXkvTGNuUTdKOXE2V1ZROUN6WWFaTG41a3Qvc0E5RXV1OWo4MmJHMTY2?=
 =?utf-8?B?aTFmL3NtcWtvRkpkVndGT2QwMWs1QkRUWjVJa2dLd1dKZlBLOS9GeTRjNUxJ?=
 =?utf-8?B?Um5lUzB4V0xkMEp6eWQwRm1kYThxWnhsY0t6MWNkVU1GZ3E0cGNvdHJ5QVZQ?=
 =?utf-8?B?RERoTjROaE5aaGVhL3FSYzlCY01ieUxWM3M4V0NJVm42d0FRVzJGOHFFeWNF?=
 =?utf-8?B?NEVZRWoxSVVFY1B0MXlrdDhsdjZOREd5WGtJZHBaRHZiUzZueUF6NzRLNkFh?=
 =?utf-8?B?aU1sMCt2blNncit5azZ1WWN6YVZFQ0NKU2FtcFNOK0g0WkQyYVNvQVJpL0pI?=
 =?utf-8?B?NEplYm8wQUlBMUFFUzVXbktMYzZqd1M2T0hjOGkxQkVXaEdQN2ZDaGtyK2VP?=
 =?utf-8?B?ckNSNVk1dko3NndtUHJ3Y3NQcURLQ2E2Q3ZIZENzMFdmSXVicTlGZDYvV1Qy?=
 =?utf-8?B?U1ZGelk1VjRSZjV4RGdIOWJRcnFObXRob09BemtZa2RKa2U3TkovYTU3VEJR?=
 =?utf-8?B?WFN2YVE3ckZscFlLelpyUWk5bTN6anlWcEdzbThwU00xemorODhRMVYyamhy?=
 =?utf-8?B?VG9RZnhKcDEzUWJxSjNWdldzMzhEYVZuV2k3alhjVGZ5RFdUSjNFZnZHMDJr?=
 =?utf-8?B?MDdDTVk4NW92N2c4L1V4cUVyUVBXa1gxSTNEZEF3eEVQYjlEK3Z0N0dGdU9G?=
 =?utf-8?B?UjBhOFd1VC9JVHZUVFpUUjNLdTdnVFF6NHVxUEdiWFFSQkZRMW56MVFYMW14?=
 =?utf-8?B?M1V0eDNpSDNxS1NWZXNIVnRWdTB1ejdwRHlDVmlJbEc5Y3VOc3hVR2lCVnMw?=
 =?utf-8?B?K2F2NS9acnludzVEMElUNDBaMEYyNStVWHpPbjFDQlJmN1Ixak0rYW5IZkJW?=
 =?utf-8?B?L0NUUkhJYWpBRU9YQVl0WTVrSEFjcTJmdmZOZCtnbHlMclc1ek42QnYwTGU5?=
 =?utf-8?B?eTJtTDREejhPUUtvM1pmb3p6bUtuWnhSSTJIMklWNXZ0SytESURWYVRNWlMz?=
 =?utf-8?B?aDBJcGJQYUFtRWZpb2FhUG5qZHlwbUtibzZxeFhhc3N2T1VibDM3OVVXUzU4?=
 =?utf-8?B?YW1OVGFvc1hZYVZVOHJoUmh4VzZWOFBPMjN0NkIrK21GUUsvVFRpRnN6N2NG?=
 =?utf-8?B?VlkxdTZLeVFlbDlLMk80R2tNTElzanp5ZS96azB6OVhjOEE1c29FdjJ5OFhW?=
 =?utf-8?B?REIvcU9IaktwWnZ6SFZDTy9YMHZoSm8wdkRUR01TclJsWnlZaTBIdUduRk4v?=
 =?utf-8?B?MXh4aUdubTdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:01:26.6188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876c5b43-482c-449f-cb62-08dd923fcc78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8FC6E1236

On 5/13/25 11:39, Jan Beulich wrote:
> On 08.05.2025 15:20, Stewart Hildebrand wrote:
>> --- a/xen/common/rangeset.c
>> +++ b/xen/common/rangeset.c
>> @@ -397,6 +397,18 @@ int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
>>      return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
>>  }
>>  
>> +static int cf_check subtract(unsigned long s, unsigned long e, void *data)
>> +{
>> +    struct rangeset *r = data;
>> +
>> +    return rangeset_remove_range(r, s, e);
>> +}
>> +
>> +int rangeset_subtract(struct rangeset *r1, struct rangeset *r2)
>> +{
>> +    return rangeset_report_ranges(r2, 0, ~0UL, subtract, r1);
>> +}
> 
> I understand this was committed already, but I don't understand why: This
> introduces a Misra rule 2.1 violation aiui. The rule isn't tagged as clean
> yet, but it was accepted and hence I thought we would strive towards not
> introducing new violations. What's the deal?
> 
> Jan

The very next patch (also committed) makes use of the function, so the
series as a whole did not introduce a violation. Our code review
guidelines still say to organize new independent helper functions into
logically separate patches [0]. To be clear, and for future reference,
would your expectation be to squash the introduction of the helper
function into the patch where it's used? Perhaps we ought to finally
update the code review guidelines...

[0] https://xenbits.xenproject.org/governance/code-review-guide.html

