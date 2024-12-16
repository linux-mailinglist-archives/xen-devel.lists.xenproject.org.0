Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50799F36DC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 18:01:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858404.1270629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNETJ-0005Wa-Fj; Mon, 16 Dec 2024 17:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858404.1270629; Mon, 16 Dec 2024 17:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNETJ-0005Ul-D1; Mon, 16 Dec 2024 17:01:29 +0000
Received: by outflank-mailman (input) for mailman id 858404;
 Mon, 16 Dec 2024 17:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/+0=TJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNETH-0005Ue-Cc
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 17:01:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2418::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 622ad7aa-bbcf-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 18:01:26 +0100 (CET)
Received: from CH0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:610:b1::16)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 17:01:22 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::b7) by CH0PR13CA0011.outlook.office365.com
 (2603:10b6:610:b1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.11 via Frontend Transport; Mon,
 16 Dec 2024 17:01:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Mon, 16 Dec 2024 17:01:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 11:01:21 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 11:01:20 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 11:01:19 -0600
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
X-Inumbo-ID: 622ad7aa-bbcf-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIdEGTsZ/MjCWE6LLtVlTCbgFyfYvrQ00guAWAKzjgaQh/xpTmzMTNBCItdpML1qUgCyLIILUYn0L65P0R8UHS89YLg2Ush53tE5RaRnIQpvPCvPEACXTGR8dhcNvCydgJDCKgsFVx/SaVhBce5UGUvcB4aLECxpOsvDa0tm/OEs2597fy0zPErXgDdZLlvrkWFi0wqDuVO3w94ZGZHAjBCWo6hFeWV7W79DFICvmptsR54UyV/kQE2cs2GqFQGna+x7BCNWvvuMEag3jtwOuyCPWZVP7pygxNU1gBWaGOZuYNOYQBJ4yaGfL6ZAyU9H5F7CczAZKjACOuhO0msmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/opseh/KZDIsGsMACfVtPaEUrDMyjerWeUE+G3JzKw=;
 b=UEYK3aliDOJxdYgVAWjsf8vbfxVOt4OwtunR8VkEgl1N0GgndyCZ7FP1e3TU9WZwrTcZy4rp7Vqfy8uo6FKfq9z6wOjt1Mnf8hISlb2rSzk6nERrYyKg3VnlU1Aqjdrb8qjKPpOCHB7miMZdY9ofXenSdhXASbYqWeXZtisLPYg2sLAo9PJ6ZDgMGVe/ubQ+Sm671IF1SAmfVUYJJ/BboK2N5tA9ogV5Be1/Jn+FjEMcLeGOCqcrJzjsyJJjwHu3hI5xTzA+TWM5jDqQO0Q7tykLBZC2DAbRV35DUwUs32uUFjESk9ZmIhlcUxKewLAR0N8kmqtIsVExkCmZpOOkbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/opseh/KZDIsGsMACfVtPaEUrDMyjerWeUE+G3JzKw=;
 b=nMucCd97GqHqBW0jQ5SDDrLEKN7GMhXzYP4TdHdcrM1VC60x7lVEhLefXolMAYuwScww2SGqljhDcE/mQoJ0G1l4L9l1ygoSbyRsWL8BV4I+ABbf6i61yW7OCGnKwna8tlsbywa5MTlfqrIVZDQbOJA0K9qn0QGwbPEoUKZM45c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <7d3b2ea9-1018-4d47-8c2c-51102a61202f@amd.com>
Date: Mon, 16 Dec 2024 18:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 03/12] xen/arm: permit non direct-mapped Dom0
 construction
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, <andrea.bastoni@minervasys.tech>,
	<marco.solieri@minervasys.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-4-carlo.nonato@minervasys.tech>
 <adfdc378-e1cd-4500-a21c-6c5660ebfd1b@amd.com>
 <CAG+AhRX77RjKKQsvdhU-uBG0jFGBB6SxiG-q6t4vT+q2URa7wA@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRX77RjKKQsvdhU-uBG0jFGBB6SxiG-q6t4vT+q2URa7wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: bc468a88-d2c1-4e4c-6b61-08dd1df3444f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWZFeWN1MjRLdEMvaHh3RUhISFZxZEdvQXFFREtDcmx6WDFBNDZmQTExVE5w?=
 =?utf-8?B?aC9kL2N5WG9VNXE5bXowc3Z6NUQyT09KUlg0UCtDWTNWdXVEZksrczNyaHY3?=
 =?utf-8?B?VEx4Sy91aFZ5M3BKZmFpeHR4SWJ2VGgyMmx0NUF6RGVNK0tzODYwVU4vcnlZ?=
 =?utf-8?B?RmZBNUxqQXNDSlZHR3crcDBXRWljUFlwcWd1Ylo5T2U2dklzb2hLUFgrN3J3?=
 =?utf-8?B?NmI3OTV3ekNSM3hvbTNCNEdwM2pTeEtaaGFkYXArSStLNzVCQzdWeDFidE9U?=
 =?utf-8?B?MUhvbDhlVm44VHRsMG5kRHdsajBwRldWMStTYldQZjB2NXNWSkNjNGFhcmkx?=
 =?utf-8?B?NTk4Zi9zbDZzWUlGbVAyWGtDWjJ6cFl3RmZwMWxvRk1TN2xUYVVjSzVTcWJy?=
 =?utf-8?B?Rm9FVFlqeVUvUU9hWkwwdVpLL2Q5SjNBb2NCTGFDREowMk1tQ1N0c0Q1UUdF?=
 =?utf-8?B?SnJtM0lOT2RBc2NUYnNCODg1cis1czlaOXpiZjJTZnJwZmlPL2UrN3Jpd2Nn?=
 =?utf-8?B?RlhMZWlLdklCVUNCSHB0M09GZGJhU1MxcG9pWlViczlwVjREblE2d0RlZUEr?=
 =?utf-8?B?V0xiUUxuSGM3SXNXT21wUGRDaDJ5anZHU21WVjg2NG1IWEd5UmxEbVhENDJY?=
 =?utf-8?B?MDRxem5HVEE4U0FwZjdCSTBsZGIvMmNGV05UZTgreit4NG00Q0s3MW5RR3Zm?=
 =?utf-8?B?aCtYUUw4Z2xmT3Y1dnNXb3Q0dUdiNkZ6aUsxeU1iNlRzek10RjQ3OVFJc3BT?=
 =?utf-8?B?b2d4SXFvRVZCNUl2VkE4TCswUWlxSWFqczVMdGFhYkxGTkNuQlBDeG5NOWw3?=
 =?utf-8?B?SWthNXZidTU3N3Nnbk5wZ25RQ1BwcG03NmtTYmQwenhVOHVDVzdQd2VuNFZN?=
 =?utf-8?B?R2R6WHl2TU5ubjlFWDBNelpkRVF4YjRNRnU2SEMwSFJxUjBFQldrRUwzK1Y3?=
 =?utf-8?B?RjMxLzhmbkpWazlJaHVlMVpEb1BzK0g1KzUxcnFkZzFLUTdEQVp4b1Bicm5L?=
 =?utf-8?B?M2xWWDErK0M1czAvck9qWjlFY2Jmd1RmRUNuMUNzd2w1Mi8vdFAzcEpWZ3VW?=
 =?utf-8?B?Y2hOSU80cm9RZUVra3ZVZ3htOTRaNVNBeTFCQ2dOMjBrM1JqRW5sNkdDU1Iz?=
 =?utf-8?B?azZmRytLZS9DYUMxb0NJZnJ0ZmJIVEVkNXMzTDhtRjBGd3pFeUliMHFpMVZk?=
 =?utf-8?B?dEozRHZ1MS9BOHNaMUNFemU4ZUNyWmpOWmlGQXZpZEVHaEJnY2NuZW9aVk1R?=
 =?utf-8?B?M08wdFV1N1ozR3AvNzh2cy9oc0Z5QXM4SldkYUdIenJ5ZkNSU3plZFBOTndp?=
 =?utf-8?B?QS9QQ1VZdDA2a2hub2I4ZFJWbW5CMHpuZEltaFhPaU1pMG5DZHAvazJoZDBt?=
 =?utf-8?B?VG9JeEFOR1REU0pEYktJN1hhTVo2NTN0dE1PTEpwK2NkeG1XaXpHdGliem9p?=
 =?utf-8?B?ZGFUeVgybzdYcnF3NldTZWg5akFyOG4xQmw1eEFZSStTM3dFSnA5QjNKK1l5?=
 =?utf-8?B?ZEFSMkZqRTBBU05jZDFqVHU0b3FJWDJSNFpEbStXWlJzZ0NhUHA0RlNheUJi?=
 =?utf-8?B?ZWNMeWgyZmhmcHN4WncrcjFzTGtDVkd5UUVWMnFUSDhCQWtoSWRzMjhMeFBZ?=
 =?utf-8?B?b28zd3JrcnkxbUozdG16R2J0U3M5dEMzWGVtcVowRjIvTm9xenNPQU4yUm1S?=
 =?utf-8?B?OFRhNlViRkFtaTByZVYvZWlKSzFqeGFpbTlBTmw5eElla2dXSUI1bEIwMXI3?=
 =?utf-8?B?SDBiVE8vSVZWZE1UNWtpQVNJY05Kdk5LNGJpT0ZVekVSRVVLaGo0OG5NZlor?=
 =?utf-8?B?aGFHaFlUcUxjWi9DNEhtdWhWajFjbUthL2xuckEvSGkwT3U0b2txS0ZOQnhH?=
 =?utf-8?B?NEJFK2pGbFJqQUVibDdqeFYvWmhYanBOc08wMzNod0hvQzZZaWFCS2N1ZmxP?=
 =?utf-8?B?ZzhaRzhWdmlodXdLSnB5YldpUlB5WUNNYWtZUmZpYlRxaDJnTXBNUXFMYmNw?=
 =?utf-8?Q?PvfX5xq4AI6IZHQqEuMhS6oj9L4pc4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:01:21.5698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc468a88-d2c1-4e4c-6b61-08dd1df3444f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916



On 16/12/2024 16:51, Carlo Nonato wrote:
> 
> 
> Hi Michal,
> 
> On Mon, Dec 16, 2024 at 1:08 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>
>>> Cache coloring requires Dom0 not to be direct-mapped because of its non
>>> contiguous mapping nature, so allocate_memory() is needed in this case.
>>> 8d2c3ab18cc1 ("arm/dom0less: put dom0less feature code in a separate module")
>>> moved allocate_memory() in dom0less_build.c. In order to use it
>>> in Dom0 construction bring it back to domain_build.c and declare it in
>>> domain_build.h.
>>>
>>> Adapt the implementation of allocate_memory() so that it uses the host
>>> layout when called on the hwdom, via find_unallocated_memory(). Take the
>>> opportunity to keep the parameter order consistent with
>>> rangeset_report_ranges() and move the membanks struct after the callback
>>> function in find_unallocated_memory().
>> Why? What benefit does this change (that is irrelevant to the goal of this patch) provide?
> 
> You're right, it's irrelevant to this patch. Do you think it can be done in a
> separate patch? If nothing else, find_unallocated_memory() appears to be
> called 2 times while rangeset_report_ranges() 11 times.
Leave it as is. I don't understand why you think find_unallocated_memory is supposed to follow some
special format like rangeset_report_ranges. Don't focus on things that are not relevant for now. Merging this series for
4.20 is more important.

Also, please trim down your replies.

~Michal


