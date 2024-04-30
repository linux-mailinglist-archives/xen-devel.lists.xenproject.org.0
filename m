Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0378B6C88
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 10:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714608.1115877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ibn-0004DB-4H; Tue, 30 Apr 2024 08:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714608.1115877; Tue, 30 Apr 2024 08:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ibn-0004BF-0l; Tue, 30 Apr 2024 08:13:03 +0000
Received: by outflank-mailman (input) for mailman id 714608;
 Tue, 30 Apr 2024 08:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H2uD=MD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s1ibl-0004B2-1O
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 08:13:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7499b077-06c9-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 10:13:00 +0200 (CEST)
Received: from CY8PR19CA0004.namprd19.prod.outlook.com (2603:10b6:930:44::24)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 08:12:54 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::14) by CY8PR19CA0004.outlook.office365.com
 (2603:10b6:930:44::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36 via Frontend
 Transport; Tue, 30 Apr 2024 08:12:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 30 Apr 2024 08:12:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 30 Apr
 2024 03:12:52 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 30 Apr 2024 03:12:49 -0500
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
X-Inumbo-ID: 7499b077-06c9-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7OZonFF2FKNFsHqLY7nTxpabj3qHB98W3kHjMtCgTsKQGtyXRWpiIz2HyeMzqdu169bMARHQ7hp+RHAPaPNf2gv+Sb+5aadQHHwoSt/ufn5/7Jiey9O0inF6R3dj3KM6hUNn2pdvS56cvTQdM0pVrzjsP3U+OoyoSxlrOGXCfYBpYCjs5l0h4x8Qsf46GXtrJVfJ2IuMBsFEdENXht8PRPfGZyrF6DyzuHQWSEPl+3lkrVAoHJuBAOx8g1NbrkpZwAgRLRCmDp5yvNSvxIqqwtWSOUm/hZzOA3hp/aIxTL3CcBNy8sgnVcdiOu429oM/xGEjH6+AcrniiFW0kOSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpyN2rKgdWafx/TpacXrrjpOVQnAIPRc15PoU5VuHyo=;
 b=Tp66hkt0XthCQgOiaQAPlU1KZ1BWt6+m8z7ncWM8py3DFUKdnwqTZMlkBxXizY5Adn1/IWIiNxtPOYW7J5mCUH8TmU9z8Fjn9FmV+xHgfX3b0wRsueOOCp7LM1ApLlFGMJvnsv8SKOYQwjnJWk9iER4Xp/DNbXz7m1f03+Xm+jI2Em3GXFK0DQDwWM7KDboD6KmHNzwtw2IIiSQgQI4Fn67qejvuIJtKj5v1T0ur7MJXJdyETERDme/Z56LSuFssJcCLpEkA2flR5SXb9QAQORnxxzc1g81ChtwzeBab4Mw2ehwRvvxXcapFRwGcFatKNmTQogKD09/A27DBAySPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpyN2rKgdWafx/TpacXrrjpOVQnAIPRc15PoU5VuHyo=;
 b=3cr5AiFyXiPNR3FHU0kLCufaJvj7NUlG/upobJcdTJ3y7n90Q5G3QAgtvQHO1epnb8BRgsxBzLHLHCwifwogfWr+XW8Q9Jw8fJOrIwlUtq++dseOAc25KcLE+Z78Z5ir6ENWaHouMaPbo/XSYFJYSnYsuxbyx8YwC8y0SB/u8sA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d7369537-f7c5-49fb-bf13-a129868a06ae@amd.com>
Date: Tue, 30 Apr 2024 16:12:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alec Kwapis <alec.kwapis@medtronic.com>,
	<xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
 <20240426031455.579637-3-xin.wang2@amd.com>
 <3af4f1c7-9059-436b-9449-94bd7aad9eed@suse.com>
 <ce942d72-f214-4043-bf61-9d124c0bca64@apertussolutions.com>
 <8f543eac-a686-4298-a677-c984fe5230bd@amd.com>
 <027510f6-5512-4d1e-8382-6507abf9a0c4@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <027510f6-5512-4d1e-8382-6507abf9a0c4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b0f5d9-ff9b-49e6-e789-08dc68ed55ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|376005|36860700004|82310400014|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXJyWnBMYk93anl5Y0dyZEYvWSs1K2k5NzR2MVk3dVlHSzFnOHZFMkl6TFZl?=
 =?utf-8?B?cmtCZy9zbmNUWm1ydHc0WUM0ZFlzL0xHaHNpVUJxdTZ3TTEzVHpNQmRwMmVQ?=
 =?utf-8?B?Qk5MeDhjV1RFcTdKVkNjOFloRmRGQlJxSWJIRGVuM1lEQkRhT2pxc3NaRUZE?=
 =?utf-8?B?MW04Y3dzbGV1U0VOVkRMVHZsTFdWL2c3UkFSZkN2M21DcEt0QjFaM2tlQllt?=
 =?utf-8?B?cU5PZ2krK01RdnF2MHlQbm14SE5hcjI4VzlaVHFLZWFabUM3NFRHcmc4TnVU?=
 =?utf-8?B?TVlDTWZRajYydUc0dzNVLzU3TWVmM2xCcmoySmhvOFJESXNMODMwUWIvV0pO?=
 =?utf-8?B?enYrbDNIbkorSCtjSUpvYmpvbzNGNmlISlhYNEtvbXY5K28rcE1UUXAwdCtH?=
 =?utf-8?B?R0dFV1NjM01ZUjA3Y3lPTzBqVldWS3FGMi9CcDA0SWpkSnoyaFlzcmgySmVs?=
 =?utf-8?B?alRFUVNTRnJKRVE1c2lPYU43bGFSY3pYWC9IeGN3ajRBKzZKQnRLY0Q0Rk52?=
 =?utf-8?B?UmdteUQzenRYajlycElLK0RGOXlPN2l2eHk4a3RFU2FGaE1ZbVpWeDdKek1r?=
 =?utf-8?B?bWxZbnNIOWtGTUR6V1JYS2NDS2l6NlFvRzdnM2R3UmJqT1RmczEzWHBmNG9X?=
 =?utf-8?B?eUhSVFJISU1JRWxRbXFkazdtNmN0OSs3SGQxYWFTMko1ZW91N1ZCYmRsQUlR?=
 =?utf-8?B?V3lwWnYvTUU3SUZFK1U0OEhtOTVheHE5dFh1ditqTFAxWk9BMjI1V0FYeVV4?=
 =?utf-8?B?MjFLdFNnbDBDb0o1VlFzeTAvQjdFT3RibEIyUERJSE5hcjRrWGpiT2pWbm9H?=
 =?utf-8?B?ZjVLNk81Z0N2Z1ZSMkZOZFltQWpZOHcwYXg2dXZSUWdJVkVRM3Z4UXZXajEw?=
 =?utf-8?B?V28rYUhSUmI3WHdrWHk0bUFMVmluTkJ0MFk2ZFdrbzBwdmNLdXF3K3ZQSnNH?=
 =?utf-8?B?amNlbE5sbE4xWk9mSG1zcXpHOFhoTmg5SWZtZ0FUU3Qwa1R6TDhKdVk3b3VK?=
 =?utf-8?B?MEVPWEFlbDA4aUJLb0owYWNnOFpkWDJVcGlTdGhucXlqZmdHdkZjYWdyQmNO?=
 =?utf-8?B?RGFJam1nTEhBYWRIdy96SDVVZ1ZWRWdKaHB3OUpvemhKMFlSZ0RPTDJhNXRQ?=
 =?utf-8?B?TFZYeE1vMTJZRUNEcVdyV1F2a082UlQzRkhKeTFEeXVoMTBxYTZMcDJMdm5K?=
 =?utf-8?B?Z0JUcDFDd3BTbjBxZFM3eWhBdm9HdEpYVVI3VVg2RHJ6am1iWU41WFF6bDZ5?=
 =?utf-8?B?RG0vMGhNaFRLQlZkeGdRb3RhY3pacWdXbXEvM05vNkZtUEFoMWczTlViWjNw?=
 =?utf-8?B?VlRZRlpQaStWZzJDdXc1cENuRmM0TkJ6UTRQd1lCa2JGWFp0VzNqODJXWjJO?=
 =?utf-8?B?MHdacjhZdjBQelN1VFllcys0WjIwT0Q0dWRFd2I2SkF3U2h3Y2tYcHg0bXlL?=
 =?utf-8?B?MGluYU45SjBZWUhEV1JsM1B2QStOZ1hHMGdCMFd2ZUdqOHBmSk15SnM2aXgw?=
 =?utf-8?B?NzRjYVhMMU1xZlVDTldSaTlPVWRzRXpod1VzYXV6R1BqaXVKRysrVDV6clcr?=
 =?utf-8?B?TExEZ3p1WlhyNHF4a1JLNEhGc3hENnAwRDArY0ZCT3hRV0ZsQ0taVExteEl5?=
 =?utf-8?B?bmNTRlUxNzh4TXZmZ05QQkpPS3dwazNYSXorTjIyL3lvK1JXYnFFSmFMbWtt?=
 =?utf-8?B?bmhyOVMvc1lkZDVKR002UVpIbkJaWnRmYlBFNFVGd0d6Y2VJOVJtbGVGWWFB?=
 =?utf-8?B?ZzVEdkNPdk5tYVBrZjRHaWNLTjAwenE4WkE3ZDRzdm96MWkvZ2xxd3c2cWM4?=
 =?utf-8?B?MVdIZ2NBbWhzQjAvRVliMnd3bUhCRlp2SXdyaTBvL1dIYm93MUNDUE1XVmVG?=
 =?utf-8?Q?pS+bwgztuLR5P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 08:12:53.3680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b0f5d9-ff9b-49e6-e789-08dc68ed55ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Hi Jan,

On 4/30/2024 2:11 PM, Jan Beulich wrote:
> On 30.04.2024 04:51, Henry Wang wrote:
>> On 4/30/2024 8:31 AM, Daniel P. Smith wrote:
>>> On 4/26/24 02:21, Jan Beulich wrote:
>>>> On 26.04.2024 05:14, Henry Wang wrote:
>>>>> --- a/xen/include/public/hvm/params.h
>>>>> +++ b/xen/include/public/hvm/params.h
>>>>> @@ -76,6 +76,7 @@
>>>>>     */
>>>>>    #define HVM_PARAM_STORE_PFN    1
>>>>>    #define HVM_PARAM_STORE_EVTCHN 2
>>>>> +#define HVM_PARAM_MAGIC_BASE_PFN    3
>>>>>      #define HVM_PARAM_IOREQ_PFN    5
>>>> Considering all adjacent values are used, it is overwhelmingly likely
>>>> that
>>>> 3 was once used, too. Such re-use needs to be done carefully. Since you
>>>> need this for Arm only, that's likely okay, but doesn't go without (a)
>>>> saying and (b) considering the possible future case of dom0less becoming
>>>> arch-agnostic, or hyperlaunch wanting to extend the scope. Plus (c) imo
>>>> this also needs at least a comment, maybe even an #ifdef, seeing how
>>>> x86-
>>>> focused most of the rest of this header is.
>>> I would recommend having two new params,
>> Sounds good. I can do the suggestion in v2.
>>
>>> #define HVM_PARAM_HV_RSRV_BASE_PVH 3
>>> #define HVM_PARAM_HV_RSRV_SIZE 4
>> I think 4 is currently in use, so I think I will find another couple of
>> numbers in the end for both of them. Instead of reusing 3 and 4.
> Right. There are ample gaps, but any use of values within a gap will need
> appropriate care. FTAOD using such a gap looks indeed preferable, to avoid
> further growing the (sparse) array. Alternatively, if we're firm on this
> never going to be used on x86, some clearly x86-specific indexes (e.g. 36
> and 37) could be given non-x86 purpose.

Sorry, I am a bit confused. I take Daniel's comment as to add two new 
params, which is currently only used for Arm, but eventually will be 
used for hyperlaunch on x86 (as the name indicated). So I think I will 
use the name that he suggested, but the number changed to 39 and 40.

Kind regards,
Henry

>
> Jan


