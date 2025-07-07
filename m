Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F5AFB80E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035700.1408052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYoCw-0000J2-Nk; Mon, 07 Jul 2025 15:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035700.1408052; Mon, 07 Jul 2025 15:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYoCw-0000GH-Km; Mon, 07 Jul 2025 15:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1035700;
 Mon, 07 Jul 2025 15:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjFu=ZU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uYoCu-0000GB-H4
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:56:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6975b8c-5b4a-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 17:56:38 +0200 (CEST)
Received: from MW4PR04CA0289.namprd04.prod.outlook.com (2603:10b6:303:89::24)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 7 Jul
 2025 15:56:33 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::7a) by MW4PR04CA0289.outlook.office365.com
 (2603:10b6:303:89::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 15:56:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 15:56:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 10:56:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 10:56:31 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 10:56:30 -0500
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
X-Inumbo-ID: f6975b8c-5b4a-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq1oRz9PTaxnTNbItLU2xtHUe7XWJlE/25CPl15LJp4FheOlr8JdS/oMqXVKkFmDAvliE/Ts6/9vdOey3a2gv9nRH+PE5qxMBayqXfiitkY2M/fd9Yyh2fYTlrz2qGSmyK7PJpCp2UmVKDBMAgre6JOhvQFxTO8iQjTs19Ps1wl6mWczDeqKNuHYvr4QrtY67uUtjjbqyXFOMkJkeq/X7+Mt2AuBPeRoV1mShYJb1qOLGmSwjVolp4urxgLaZCwA0hm3bSdrSW+gsEMcmu3Wdoy0fArrdAH2YeeypDaq3n6uwtiH/5dk+4xLUBOpBYsfoNy4pkARPiGBDXuRCem9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okXk5k2UJP5iiXDt2G9BsFtUQNf5wy8eqsO2l6uORhM=;
 b=ff8HdMlU3cMM9HfTw6rniU/l40EOUKbg19wvQ3de0PMXBTlQO8YarqJ5yCwHs3MjvIi6xqkLgE1ErrrMFLGZAscXdRu/hAkXvNY6t32TBnjld6T88dFucC131vSZXUafImLO9nnmh6Y11LLdECx7i1tcDUkMNJiD7bLZBflM25yJOnrdgvHNITZpvTHlMQ5P2yZyK91d249/G21Ll3jaNZV/HzjhrZNmTofXKszebXkyqbMTXjGKYvIFn5Rc8EshSzLskwb7UBBlOM8Hl2osy3rg8eB5jdWC7+u5fv5T3v3OXzgs1No904CLE+96QU+xhDOMaGu5IO22q8CI/KTQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okXk5k2UJP5iiXDt2G9BsFtUQNf5wy8eqsO2l6uORhM=;
 b=VFCG9dMHr5G3UEGGYi7sjHXBE8glMguPzNF7f0wBwgkMY4mpbbmpWe4ItHCims/j8/KNxHjDs2X7mCvM1u7Ssfd1Udy4cQkSDXmpfsVGAC3Nsp+So8MdIuMpc58UJlnV1oEPBtETpbgOsyBhESvob/lERRHIUaH6Terox7Y+CNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a49e4e20-9231-4a9d-b0f4-16e454d93ef5@amd.com>
Date: Mon, 7 Jul 2025 11:56:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
To: "Penny, Zheng" <penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
 <DM4PR12MB845185414637BC1CE87A3309E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <b5184b15-018c-4603-8b97-9e6f122d4863@suse.com>
 <DM4PR12MB84514D457CAE4D38EAB47D96E14FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <DM4PR12MB84514D457CAE4D38EAB47D96E14FA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: f8334067-c5d5-46f6-0a54-08ddbd6ed7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckZFMlFvenpWdGt5U1hPYWQwQUM0TzI2bkVyRy82R0h4ZjhuWDdkNmhkN0RR?=
 =?utf-8?B?VUFzZnIyaE4wczBkazZEajB4RG5JVTdZMWdGb3RFRE94TDdHa3I3QXZ3cEpM?=
 =?utf-8?B?RTJyZ0ZjampKUkkrQlhHSWRFblpFY0pudHdDM2kzaTJYLzlmYmVBTlRQOGQ3?=
 =?utf-8?B?Vk93bE1jYlVVTHdiWEcraU1wcTBYYzJsSk8yWHlXNXpOWjhoMVpFWWhZaDk3?=
 =?utf-8?B?T3lnMURFVWFFRys5MEhRKytRdGxuVmM3bnlNY1lJYWJZQk01TXozYjc3cUtC?=
 =?utf-8?B?YlN5MHZUS1E1cjh1Z0lGdFM0alFrQzNlWXR3NVlrVk9xTW5YMDFxQ2FwSkRD?=
 =?utf-8?B?TU1ZQS9PWGdIeG1OdDZBc0hDZVBZOVQ2YWJwcmhzZW1XQzlLY0l3TVpvc2ZN?=
 =?utf-8?B?eDZqbERjMDl5MkpYQ3pXclFFem1PWWsxZ1hGRFJBZ0hSOUVIK1VuMGlaYUlE?=
 =?utf-8?B?RUdLc0dRK2ZwcDZENFpzZlJOK3BDQS9mZldjUS92Tk9JTkxORlArK3NETHFy?=
 =?utf-8?B?UEhhRkUxU05aZGZkL0NtNmc2QUpYS1NveHB3ZGZnb2s3OHRzK0NtZzFtOXVE?=
 =?utf-8?B?Yk0yWGsrVnpxNlo1OHFZSDNVcENoazJ4d0ZTOVhOSExjeUk3bGZpYS9NWi9M?=
 =?utf-8?B?VnYyUnc5ZHBrcU9KY3oxaXVNdTN5ME1mZ2JnTWsvR2F0YmhhMjgwQjlyM0JX?=
 =?utf-8?B?Q015U3RUcFJSVWozbFZtK2kwTGJIamNYa24rZ0NnN3l4N1lrYm9VR3FieDN1?=
 =?utf-8?B?R3Y3RGZNUDJhTXZkTmJNU25ib3dTSXFzcmgwTnppMVpTd2dMdzdRRXhOcDlY?=
 =?utf-8?B?UGNVNG9WZ1Z6ZXh6a21aNk1jNk55bXZDQ3dGWUg4WDJaWm4vbVdKd0FEV0dm?=
 =?utf-8?B?S2tSa2QveGV0WE1wWVNUQXgzMFZvL1grd1dFR2ZqUEV3RFh3TUtHSTNRbVE4?=
 =?utf-8?B?UnpYZmVSbDBXQXdPY2NXejhVMjZCcDY4WXNMeExsYXRHYTYyL0RpYTdsZ2tz?=
 =?utf-8?B?cjYrUXlJVkhsK2c2bGJGME5YQW5iZzB4cVNvamxxK1lHdUtISzZZMWQ4ak9l?=
 =?utf-8?B?Z2c4MG9TSDFPWStpbHRSVzVkY01GV3djS2ZmZGNZelNKWVVlbS83ckNjaExC?=
 =?utf-8?B?TEFJZzVmZ0NJZHdLbWpKdnFMNm0zb3dPWUVkNG5xZkwzVFpOWlRqT0xYVktO?=
 =?utf-8?B?UkJxWlFXU0hrWHhKUm1KbXVHVk4yVzQwL1JGdjFBb0R0Y29pUmtLTDlKRUwz?=
 =?utf-8?B?V3I1b1dteGVud21ueWhMRlV1TVhuYncwZFl5UFVIcExmSS9jUlRyTGJoeVZz?=
 =?utf-8?B?VHRtUGlINy82ZGlTaktnMDluWHg5VEpYaTFSeisvV2ZHa1RRaDdxUlgwMnd6?=
 =?utf-8?B?SStXaXpoQmd2VkhuempuVXFXWXBKM0ExbE1OMTlXQlZhelhrSVIwRnFLRzlB?=
 =?utf-8?B?MVhlOUpPMGRZQkJqOUpMdFUwdlh6aFg0anROcFdBQlMzbUQyMURuLzB0TTYw?=
 =?utf-8?B?RzVFa2EyUVRiTWpHZlE0ZCs0ZWN3ZUZqNWVJejNnVm83dmNtTW9jSURqOGRp?=
 =?utf-8?B?ZW9WZnJEM3ZHOEN1VnNJalZRbS8xZGFMSG82azZvZVE1ZzVCcXo4OS9FcW56?=
 =?utf-8?B?cUZkNHIvNEx5eEVCNENqQ2ZGNm1maG95aDlOMHhOeW5ocnZFZWJwU25wSVNs?=
 =?utf-8?B?NnhReEpTaENUNXVhd2NFNmI2aVYzazJTOVFpbzZwbElUTTByMDdyTHdDaTRm?=
 =?utf-8?B?ZHFHOUFSRnBINHVhZkVZOUU2Z00wNDN1a0JheGZxVE1NZFc0Q0Iwd2dyRUxo?=
 =?utf-8?B?MzVybzdERXREdXJSMGpmNGlMcjN3T1JaZ1UyRVVNWlI4Z1l2eGRheHBNSFpZ?=
 =?utf-8?B?SGM5eW5XaVV4dFBLMG5UczUyVXlUNXpMWFhYYUJnelZId2hWYnlFRHYrUmhZ?=
 =?utf-8?B?Wms5bkZkY0lRcjIyaUNibkdkZTcxMHZHUGl4VWhrTFlXQWNyUS9iWVFmZE5X?=
 =?utf-8?B?SkdITTdDdFUwRTh2SmNub3ZDUWRBbjdFaHVuQXFuZUdTT3o5c3JmRHgxblJ5?=
 =?utf-8?Q?RPPJXA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:56:32.2921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8334067-c5d5-46f6-0a54-08ddbd6ed7fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80



On 2025-07-06 23:31, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, July 4, 2025 5:46 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>; Andrew
>> Cooper <andrew.cooper3@citrix.com>; Orzel, Michal <Michal.Orzel@amd.com>;
>> Julien Grall <julien@xen.org>; Roger Pau Monné <roger.pau@citrix.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; xen-devel@lists.xenproject.org; Andryuk, Jason
>> <Jason.Andryuk@amd.com>
>> Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-
>> cmd
>>
>> On 04.07.2025 10:56, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Friday, July 4, 2025 4:33 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>; Andryuk, Jason
>>>> <Jason.Andryuk@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>>>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>; Andrew
>>>> Cooper <andrew.cooper3@citrix.com>; Orzel, Michal
>>>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>>>> Monné <roger.pau@citrix.com>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC
>>>> sub- cmd
>>>>
>>>> On 04.07.2025 10:13, Penny, Zheng wrote:
>>>>> [Public]
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Tuesday, June 17, 2025 6:08 PM
>>>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Anthony PERARD
>>>>>> <anthony.perard@vates.tech>; Juergen Gross <jgross@suse.com>;
>>>>>> Andrew Cooper <andrew.cooper3@citrix.com>; Orzel, Michal
>>>>>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Roger Pau
>>>>>> Monné <roger.pau@citrix.com>; Stefano Stabellini
>>>>>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>>>> Subject: Re: [PATCH v5 14/18] xen/cpufreq: introduce
>>>>>> GET_CPUFREQ_CPPC
>>>>>> sub- cmd
>>>>>>
>>>>>> On 27.05.2025 10:48, Penny Zheng wrote:
>>>>>>> --- a/tools/misc/xenpm.c
>>>>>>> +++ b/tools/misc/xenpm.c
>>>>>>> @@ -69,6 +69,7 @@ void show_help(void)
>>>>>>>               " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
>>>>>>>               "                                     set the C-State limitation (<num> >= 0)
>>>> and\n"
>>>>>>>               "                                     optionally the C-sub-state limitation
>>>>>> (<num2> >= 0)\n"
>>>>>>> +            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU
>>>>>> <cpuid> or all\n"
>>>>>>>               " set-cpufreq-cppc      [cpuid] [balance|performance|powersave]
>>>>>> <param:val>*\n"
>>>>>>>               "                                     set Hardware P-State (HWP)
>> parameters\n"
>>>>>>>               "                                     on CPU <cpuid> or all if omitted.\n"
>>>>>>> @@ -812,33 +813,7 @@ static void print_cpufreq_para(int cpuid,
>>>>>>> struct xc_get_cpufreq_para *p_cpufreq)
>>>>>>>
>>>>>>>       printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
>>>>>>>
>>>>>>> -    if ( hwp )
>>>>>>> -    {
>>>>>>> -        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
>>>>>>> -
>>>>>>> -        printf("cppc variables       :\n");
>>>>>>> -        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear
>>>>>> [%"PRIu32"]\n",
>>>>>>> -               cppc->lowest, cppc->lowest_nonlinear);
>>>>>>> -        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
>>>>>>> -               cppc->nominal, cppc->highest);
>>>>>>> -        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy
>>>> perf
>>>>>> [%"PRIu32"]\n",
>>>>>>> -               cppc->minimum, cppc->maximum, cppc->energy_perf);
>>>>>>> -
>>>>>>> -        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
>>>>>>> -        {
>>>>>>> -            unsigned int activity_window;
>>>>>>> -            const char *units;
>>>>>>> -
>>>>>>> -            activity_window = calculate_activity_window(cppc, &units);
>>>>>>> -            printf("                     : activity_window [%"PRIu32" %s]\n",
>>>>>>> -                   activity_window, units);
>>>>>>> -        }
>>>>>>> -
>>>>>>> -        printf("                     : desired [%"PRIu32"%s]\n",
>>>>>>> -               cppc->desired,
>>>>>>> -               cppc->desired ? "" : " hw autonomous");
>>>>>>> -    }
>>>>>>> -    else
>>>>>>> +    if ( !hwp )
>>>>>>>       {
>>>>>>>           if ( p_cpufreq->gov_num )
>>>>>>>               printf("scaling_avail_gov    : %s\n",
>>>>>>
>>>>>> I'm not sure it is a good idea to alter what is being output for get-cpufreq-para.
>>>>>> People may simply miss that output then, without having any
>>>>>> indication where it went.
>>>>>
>>>>> Hwp is more like amd-cppc in active mode. It also does not rely on
>>>>> Xen governor to do performance tuning, so in previous design, we
>>>>> could borrow
>>>> governor filed to output cppc info However after introducing amd-cppc
>>>> passive mode, we have request to output both governor and CPPC info.
>>>> And if continuing expanding get-cpufreq-para to include CPPC info, it
>>>> will make the parent stuct xen_sysctl.u exceed exceed 128 bytes.
>>>>
>>>> How is the xenpm command "get-cpufreq-para" related to the sysctl
>>>> interface struct size? If you need to invoke two sysctl sub-ops to
>>>> produce all relevant "get-cpufreq- para" output, so be it I would say.
>>>>
>>>
>>> Because we are limiting each sysctl-subcmd-struct, such as " struct
>> xen_sysctl_pm_op ", 128 bytes in "struct xen_sysctl"，They are all combined as a
>> union.
>>> Also, in "struct xen_sysctl_pm_op", its descending sub-op structs,
>>> including "struct xen_get_cpufreq_para", are all combined as union too
>>> ``` struct xen_sysctl_pm_op {
>>>      ... ...
>>>      union {
>>>          struct xen_get_cpufreq_para get_para;
>>>          struct xen_set_cpufreq_gov  set_gov;
>>>          struct xen_set_cpufreq_para set_para;
>>>          struct xen_set_cppc_para    set_cppc;
>>>          uint64_aligned_t get_avgfreq;
>>>          uint32_t                    set_sched_opt_smt;
>>> #define XEN_SYSCTL_CX_UNLIMITED 0xffffffffU
>>>          uint32_t                    get_max_cstate;
>>>          uint32_t                    set_max_cstate;
>>>      } u;
>>> }
>>> ```
>>> It could deduce that "struct xen_get_cpufreq_para" is limited to 128 bytes (I think
>> actual limit is smaller than 128)....
>>
>> And that implies what? In my earlier reply I already said that you may then simply
>> need to invoke more than one sysctl to get all the data you need. (As one of the
>> options, that is.)
>>
> 
> Okay, I only explained why I couldn't use one command "get-cpufreq-para" to output all info

I think Jan's suggestion to make `xenpm get-cpufreq-para` keep 
outputting cppc/hwp information is good.  That way users get the cpufreq 
information without having to know what driver is running.  So you will 
have to issue the additional hypercall as necessary to retrieve the data.

Regards,
Jason

