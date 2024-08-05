Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7333947BA7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 15:12:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772160.1182591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saxVP-0005oU-7Q; Mon, 05 Aug 2024 13:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772160.1182591; Mon, 05 Aug 2024 13:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saxVP-0005md-4j; Mon, 05 Aug 2024 13:12:07 +0000
Received: by outflank-mailman (input) for mailman id 772160;
 Mon, 05 Aug 2024 13:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPoy=PE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1saxVO-0005mX-Ep
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 13:12:06 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e6bc992-532c-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 15:12:04 +0200 (CEST)
Received: from BN0PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:143::14)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Mon, 5 Aug
 2024 13:11:58 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:143:cafe::33) by BN0PR10CA0010.outlook.office365.com
 (2603:10b6:408:143::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Mon, 5 Aug 2024 13:11:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 13:11:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 08:11:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 08:11:57 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 08:11:55 -0500
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
X-Inumbo-ID: 4e6bc992-532c-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRclFnMyceTrdiLAVttJOUH7cYDlfvsS/oQMYead3icNj295UKH0VJ3OXHfwJzqzEMz4vvuQ4e8dux33K1wEY+KHj/HncSQPFD1toXOP/QdKwzLPbrw8vQm2Jrg6jpodhCHJHVHtHT+9f/2/XTEOQtLJWcN1/wocHIK5sN1JRv47t6MoQesF8AXdodqerkzUwyEU3Y0KpcwUXL6SRkrPGFahYdB4BCaO6imuA2qWXlruuNrfC8u5dtW8Bf/OcnZiIzHD8IHshUmjhHQPY5kvA1pjNsG2T6HlXI62tNLsD4kG1hpXW3nMNTEcg1gcQcIRJ5M3YhMpXyXSmxAfsE+wdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7bgU0E+tbUNJkpb+OlUYg7e12sO+l/9+vetuOjVCjE=;
 b=xsfxANMAuFeT3o8tMJ0cKbGr7VyxK/Ee4QhstA0T25ORuHDdSyBglpB/YZ0Ru+cu2TXnGCGxZSS6uGRaAFAKX/yIvtWv+nnkB2Yqs67X0u7NReMCK5raeXkRo8V7tABi5yIkDwV8QWIdQQZ17EGi3nNK1OdPw7JCIGwBVNwyu1jsf7qgeDz9Ru1SJizbBTKgb5i7qNw48bKocH6zvCWBUU0l3GXqMfgfERFLS9kx9tixxyMyVrXgDHkmv5afNv++SXW8LW49QELXmLjEUPa0+rv7Qqo8e0x8dRowIhsyMmDNtRRVoSMeynn6+/9z2U5w4UT2zZi0AOlQ+pLxpMxOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7bgU0E+tbUNJkpb+OlUYg7e12sO+l/9+vetuOjVCjE=;
 b=tjvP2u5jlQ0rRpg1Tc/LJ25VvWwwje8LM627/PRKHTwSXkYHls2PjgQbrz5Riv0vxjXT14ieX1nYzKJw0wqZMbIl3Y+pnUJujPIZHIP6ew7XishTZsnk5DdjUmcLORxyH7JyagdhhQkXf0AgCD74lmy1/ulBwbfSXNQMPvuhlL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d5a02069-6651-4b0f-a440-003cd2bfc237@amd.com>
Date: Mon, 5 Aug 2024 15:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs: Introduce Fusa Requirement and define
 maintainers
To: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
References: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
 <20240802094614.1114227-2-ayan.kumar.halder@amd.com>
 <15c5709f-a81c-4ca4-8851-89938a5a6141@amd.com>
 <bb77afd1-3fed-47ab-b83b-ec3e06d0c5a1@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <bb77afd1-3fed-47ab-b83b-ec3e06d0c5a1@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 9741a8dc-b38b-4878-eec1-08dcb5502f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3BHbllSbU5RVmI4OVRTOVJ2YnBINGZHWWg0TFVTNW5Xd203REtVcFcwdkRz?=
 =?utf-8?B?Mk9xNHFaeVdWcmdhNEFSNXd1V1NpMS9nWDBSSm5taUV4a0ZKVkhYL3hHZGRi?=
 =?utf-8?B?UFpyVGdUenhXQ0VwSktpUDJXWjlHcTZvVnVwQi9wTVJaWTdOay9xNnhDOVEz?=
 =?utf-8?B?K2dTenB6VWhmOVJxQXJXelB4VHkxQmV4WkdQaFZHZXJtejBKNnBYTGl6THpt?=
 =?utf-8?B?K2ZVcWpkWDlQMGFJcTgwZVNwOWJXNFVGVElON0Z2SUhXVlFxaEEvZ0JQcEZO?=
 =?utf-8?B?cnl4MnNsU05hRm9ZdVJ3dngvcDFWbHIzaW9aRitrclY5RkN3N1R2Ym1MQ3pC?=
 =?utf-8?B?MzlOTHUvRWZuN3k2UytsTzFIVXY3N0M0MWNFM1U5VjZ3Ni9yZFFVTk1JVGhW?=
 =?utf-8?B?NHpFZGtmQ1hUNjRHWkx2bURLd0ZrcU55QXBuK25uTk10Q25sYnJ0YS9OQW5T?=
 =?utf-8?B?YXROOWNzZ2haYmlQYlVkelVERmlEc0gybFpEbmhEakNJQnZIajM5b1lDdGIv?=
 =?utf-8?B?Q1JNRUdzZEVwSmRjdkQyRmQ1elcxcnc0TUVSSlNwVnBCT1JBUmFyYnpIMjhT?=
 =?utf-8?B?SEcvV2NON1BBT3g2TGhpQkRYRmVYRHZ0VFNLUldzLzJ2b0R6d3NlWm03WmI3?=
 =?utf-8?B?UlArK2NXSExydHJhNTZIZGZVMjdqVnJITGlCT05Fb05lSzI1Qi9DQ0ZHRm9U?=
 =?utf-8?B?aUN0cW9USTNuUzg4bkh2MWtTZFBoVFBYdE5DYmZHWWtzc0NHemxqZFcrTHBt?=
 =?utf-8?B?b2NYY2NCcVpYRkdhYlhBaVAybGVJQkZWSWdRNXJkRjEvb011WHhJNEZqUEtG?=
 =?utf-8?B?VitMbE1YWjI4N0N0alZQZllleUlGR1dMaUNLa1dnTVR3ZVdpamd4MWI5VW11?=
 =?utf-8?B?Wmt6bDkzekFMQm90Mk1TNWpMYlVTYzRoaEVKRDhBMUV5aVV3Y2IzWjhvNFVi?=
 =?utf-8?B?Um56TlB2VXZHcStJUysvbExCaG5qYUJIcWJiSlZmcVdNYzJmUDE2NU00SDYy?=
 =?utf-8?B?RWtqbzlNRFRPaUxQR0xLaXUrUG5JWHc0VnBXckVHRmpxVjQwZ24xbHZETTFP?=
 =?utf-8?B?VWM5d2E1SmxNMWVqY3ZtU3h0dXFlVUl0TFlWNUhzbDE5dDNldjQ2ekwyUXE0?=
 =?utf-8?B?cG5Ub0QwZ1F0V1Z1UUY2eUhRbENQQ3cvemgrUVlHa0I3UHoxcnR4OFcxOFR0?=
 =?utf-8?B?dEdhU3RrSDdYK1F3MzlTbEViOUcyQjFYUUt4WXg3MDZsVWcxa0JDb2pUUlVQ?=
 =?utf-8?B?MWE0QVMxZFp5YVBzSk9DY2JzbEdZTkRMSW53LzVtemVITjU4QW5YM3FjdGNa?=
 =?utf-8?B?bFBNQjFiYXNZOXZLM3lIWFhJdDdzQVB1L2h5RlBJLzhnUjcxeXZEbVRBU2Ft?=
 =?utf-8?B?K1NuR3RDbnhMQUJsMkU0VjJ5RXdJVi9oRFZEeHJRc1E5QW0rYTQ5a0tyVmNC?=
 =?utf-8?B?TEd4QzBJN053MFlkelBJSW1zREVJNVIybU9pUnZtdzlKbXd4TTltNHd2OGw0?=
 =?utf-8?B?S1cvU0hPSVRRd1NvZ2pNM3l6bC9mSnJhdmZrdlYrNmZzTEREWWcxLzduMFkw?=
 =?utf-8?B?Vm5RQ2Q0M0NvMTRPdFFOUUlwSkp6bHVGYWlHV2hwMkJyNno3Qkh1cFRIbHdr?=
 =?utf-8?B?Qk9Ha1JHcFJ1SzF4L3FUT2JZS3AyaG92TlZIU0hZWlJqcWRUWFRCQVJDN1d1?=
 =?utf-8?B?NERpRGF2TnJkMlhSZzU5QnppeTRXcTA0eU1ERERBZnFjOWRCQWUyQ0VCbHpl?=
 =?utf-8?B?bFVOY084VzZISDFreU9tOExiL1RNU3FybFpwK1R5Yk5tTzV5MmpUQ1RZWXRQ?=
 =?utf-8?B?SXVZSWJDRjY4ZUg4Z3JQN0N0N01vNE1xSDR2UW1PNmJvSmo1MjAxR2N1NDRV?=
 =?utf-8?B?NmJlZGFITXUxUVJma09ZL3Y5anhxVVFWckJTQXhITDc1SnRPejBSclM5OXpR?=
 =?utf-8?Q?cCUjTCXiEoddu782Xoj4W54uE8HeaAzu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 13:11:57.8263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9741a8dc-b38b-4878-eec1-08dcb5502f82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177



On 05/08/2024 14:45, Ayan Kumar Halder wrote:
> 
> On 05/08/2024 10:46, Michal Orzel wrote:
>> Hi Ayan,
> Hi Michal,
>>
>> On 02/08/2024 11:46, Ayan Kumar Halder wrote:
>>> The FUSA folder is expected to contain requirements and other documents
>>> to enable safety certification of Xen hypervisor.
>>> Added a README to explain how the requirements are categorized, written
>>> and their supported status.
>>>
>>> Added maintainers for the same.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. Added a comment from Stefano.
>>> 2. Added Ack.
>>>
>>>   MAINTAINERS              |  9 +++++
>>>   docs/fusa/reqs/README.md | 78 ++++++++++++++++++++++++++++++++++++++++
>> I have 2 questions:
>> 1) Most of our docs are written in RST, same will be true for requirements docs. Any specific reason for using markdown?
> No specific reason as such. I am happy for this filename to be renamed 
> on commit.
If we want RST, I'm afraid it would involve more changes than it can be done on commit (rstcheck reports quite a few).
Also, renaming to RST would result in this file being picked up by sphinx build and it would report a warning too.

>> 2) In the current form of this patch, docs/fusa won't be part of the generated Xen docs. Is this intended? Don't we want to
>> include it?
> docs/fusa will become a part of the generated Xen docs when the 
> requirements (see patch 2) are added.
If you want docs/fusa to be included, why not doing this right away?

~Michal

