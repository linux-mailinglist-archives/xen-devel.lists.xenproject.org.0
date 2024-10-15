Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D299F215
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 17:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819239.1232518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0juH-00052z-JG; Tue, 15 Oct 2024 15:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819239.1232518; Tue, 15 Oct 2024 15:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0juH-00050S-Fd; Tue, 15 Oct 2024 15:56:21 +0000
Received: by outflank-mailman (input) for mailman id 819239;
 Tue, 15 Oct 2024 15:56:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOwl=RL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t0juF-00050M-L4
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 15:56:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [2a01:111:f403:2416::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c15d0d-8b0e-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 17:56:17 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 15:56:11 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 15:56:11 +0000
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
X-Inumbo-ID: 02c15d0d-8b0e-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v93NeTdTSowwdeRAkS8D2XihE7rc8rwKPoeIhRJ7rZegdejLel0J2immtOzwvvJOqi1ZWvurVoJZ4GioAcsURqLbA+RJw+hiu/JcVFN/mPMGjOvj+JKvv7ghY5GINtERnOwydYOp8F4dkMN/0NjxhoWdH2mwhvLE4nS6PhWkEapcIoHthU/w6oYJN3q0nrCAzU6tVwkAXuJRYgf5rDS6FaLN0kqmJ6gS8PKxydA60K0rtiBnoY8haxVZf13ahsHvw3Ozg3SuGDFaPhMarNexsuDOSZb53wjFrhZI0tCbsYxJDpmrgv/QspLQPmHaxl/Sxatap6lBHFHgbMq/dCAKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IGTRg2cPbzFZjADGTH7lqXOZateiNvk+FtNSL/LLMs=;
 b=zGJRKEilGrJj26vpPxyHmT2rRnPpwwKUC71gXExt+R0hG6FG25wk9nVilU429CLjcLxjy5Ju4SkXQ7iXJ5VeJJIal7wKrjoKmFZsnoQSqMAw4mUjkcpTQKmYWOtsWOI1DsEfFFpgQLRA0iiein7eS9wmcdHYXlkGSKdK/Ga6jzwZYJqxShmotWN3uMIo6IbkD6iGoyKuWUpgGJQxfKIh0itfgeYUXHjrDBqP4I5mhxgJCjW8l9qoZZbI+38H7mEnZjCuEHhwvQoqk8H+YPYDxsotFbYyk3pUoQuvaeKHufNNI622V7Z6d1e+e0xmXTS454dU9TQOY6JruaCBW0CpRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IGTRg2cPbzFZjADGTH7lqXOZateiNvk+FtNSL/LLMs=;
 b=f+e1o/UQgJdFGOcvPRF7yy6SSAxN9OFIdgoWZpMZYOpKcaMqJY8ANkDrrIXlnpIAloZyxc09WvCGWcUM88fCfC6J/H2UbTl6ztLUKTr4VZ+IhcXhWe0oB9YJvcfyAF2z/rsKhdBRQofikse61c/IcItBSoD4Sdh9rd1gWA5PtuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3d0327bf-3f1c-44e6-9782-5715365b2253@amd.com>
Date: Tue, 15 Oct 2024 16:56:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
 <4BFB5897-2C7A-4A44-B9E9-01BB7940BFF7@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4BFB5897-2C7A-4A44-B9E9-01BB7940BFF7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0282.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: aa01c9b0-5a4e-4a06-a8c5-08dced31e3dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDFNS0pPU2hQNi9qZmNVM0RrZk5kMk5RRUo1SlZCSDQ3MngzWDN3K0JCVVJM?=
 =?utf-8?B?QkR6M1QrS0ZyT1lRa2s2OVFaSU9mRWlJeDZ4SnNhaHRka0lTMFZCdFJZUU9E?=
 =?utf-8?B?L1dTOGNCOWlYb3ZMUE1zMUo0eGNFWlNuVDlzM2JReEorNWFnMzlPY1dTNjZi?=
 =?utf-8?B?STU1ODUzUDdjTGEwR3NpbEQrNXVJWUNNVURLdnErTjd5Nll4NDRSRk4yUGZW?=
 =?utf-8?B?cm9Jb2tpYXZ1UExqSmdTUHcxYll4VmZ5QlorRG5vLzJsTFdubElZL3NORjl5?=
 =?utf-8?B?VkZIdDQ3M0xlbE9ublBnVXZVV01VRkhRdXZkSmlDTmgvcXkzZjcvS3hVTDRQ?=
 =?utf-8?B?RzRiVkQ2WXdrK3p0Wm1KWW1KNURZdmYrZ09zOUhwdTB4a3d3V1UySG5sVnM2?=
 =?utf-8?B?SXBxaVhDeTE0RTlCYkdMSnZ1QWs1THJPTE1OVWNkYkQ3aDZrcVJTY3JYQzFO?=
 =?utf-8?B?UHpSeENIaHN4K1NSOFVkaW9rMFgwa3lDVmVyL1JpZEJJM1VKbTJSNDhnL29o?=
 =?utf-8?B?S0Y2Rm1Eb0cwaUxES3VEK1I0SUlSR291N0dqdjBvTlpCbXpiNzFUc1Z0M3Qx?=
 =?utf-8?B?YkpyMUtJajFWdmpBblJnN0piT0Y4NlF2MUIwaVFweFhjVDVwclhQc1VBcno5?=
 =?utf-8?B?ZGFUa2pQZnZpY0xpLzR0WTNDaUF2SzhIdVY2Tm5XNzU0aXQ1Y0wrd1ZMdXNR?=
 =?utf-8?B?YlpUS0Y4SXE3dSt4aUNHYkRGVmNhMW5jdnB6cDhtdUJIbVk3cEhWemIzeUZC?=
 =?utf-8?B?OWRqUC9GWDBaVHRCUU5lZnI0cElQVmpZbzVuZHFYZDZkRmRIeVdUMG1hR1Nq?=
 =?utf-8?B?cjl3akRVeVd6TGtxZWprTXY0S093bG41bXJKR0JJL1haQXVFSjBTRzhVZkpK?=
 =?utf-8?B?cEkrWUJWa0UwOUkvaVROQkl1dXJuZ2IzalJtR1A2OXNsQkdqZzUyUW0raEFh?=
 =?utf-8?B?SmJuVlFwa2pJVWphejVWekVPM2xHbTBoU3A0SjdYWWw0RGh1M3BaMndqM0xl?=
 =?utf-8?B?ZWVWLy91REo0aS84Mk9CcStUeEdzM2NVSVN2bnhWWERtd0M3Y3pyaHR6T0l1?=
 =?utf-8?B?dm4ycnF0c2ZWVHo4SFlISzFJLzZOM2R3dWVnbXJVMjNQLzFoWjVHWWp3dDRt?=
 =?utf-8?B?ZC85OExBZXlraVFiTGorS0thTDNpQytoOW9KSFhJdCtFYWMvYmhnTmptc1dL?=
 =?utf-8?B?MVRDUXF2QXFIdGdvYW9ESlVrMEw2YWFiZUdYZ0VzMXlwa1BhbFNYeUhVM082?=
 =?utf-8?B?UkxScHhKbFlaSkkyYVB0aWV4UDVBWDE0MlJnR1kyaHZWMERnQmdQeEZOWTZR?=
 =?utf-8?B?UXhLblZsU1I5YVFqU3hqMHM0QWdLNjhabFpjRVVhM29MbEFWSHRGck83UnNJ?=
 =?utf-8?B?WFF6Y0o1MTlEWXNpRzAxS0xaUElLeDZoajhUT3F4Yk56MU1VcFVUK0IrRW9P?=
 =?utf-8?B?NkZFdkNUcFFqaGVCQmNtR1laQktVdDBHUnhBajk5TVh1eU1GcG92R2l4TlZY?=
 =?utf-8?B?ZWNwQUdHRjg3V2xCbWQrclIwRWQvb2NvMEJtNk1zU2c2R2RveHpEVWpZejVY?=
 =?utf-8?B?UlpQK3Mwb2VRcnM1cmc0N1JTODA2MGdEb2NKNit4WjNEdllaWEx5Q2tNV0Js?=
 =?utf-8?B?Tk1oK1RrTU9QWWNTSnIrWVZodEZubEdsZEZUeEVSMVByTW1RQjJSdGsvRXlG?=
 =?utf-8?B?WlZudmo0cElnOEZMK1BwUXN0VXd0bHlUbEpzeGRpL0ExVk0zeWllSkdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2xGcmFIM3ZTQ09RT29aSkpvZ0hjRm9yb05EM2V0VURhdkpKMHpuTE8zMDk3?=
 =?utf-8?B?OUkxMnpUQWpzcWphYjVGMUZydDczVENuaDhmbDZVK3FUZmdZSkx1N2YvSUVG?=
 =?utf-8?B?WFRFeDdiRkxFemVXQ1BLZG5tcEdvUEZuZVVRQXVwaGxWTDBQQ3NPOWtZc2d2?=
 =?utf-8?B?VWlvNDVHUmtMZGxNelVxWG91N2FHQisrV3djUTREOTI5ZGFLRmJHZlhRTXpk?=
 =?utf-8?B?V3R1bVp1VEp3Um10ODlEVk45ejZ3bTdOUXZ0ZWVaMFFyUHV1bGpTRmNaU0sy?=
 =?utf-8?B?ZDU4eXladFk1akRFdnlkQlpUL3NCcUxDZGFsc2pyRXVrQ1Q0bnBWZkV2Mjdx?=
 =?utf-8?B?NXBCeTdhQ1Z4RVh2K241ZjdPS3RzSVJwZWk4Q3dlTXBLTktqd255aTdNNHYw?=
 =?utf-8?B?YzdRcnZDeWNWNG1leERJK1dpVVNYYnhpUW5OcEtOK1ZJQmFyaUtwQldVRUdR?=
 =?utf-8?B?clQybVhmelVJL1RrbmFnbTRDemljUEREME1xclBjWmw2cjlER1NFWjl2dXoy?=
 =?utf-8?B?aWZKdXU2VGhlK2R0dEM0cDBXY0M3WjJuaWF3a1pqL0JpY21Ba2RRck5mY2ZI?=
 =?utf-8?B?SVBTL0kxY2p4WURUK0N0R1RoT0pnWldpWm0ydTNRamU0Nnl2cEJtU3NNRjE3?=
 =?utf-8?B?bzFHRXF2Z2d2UjJiYlRHd2Qwdjd0eCtGNU5INHRPeExaSEYrbmVQeE1OQXRF?=
 =?utf-8?B?SDRLS2tVRU5pYk54TDdyendza2NnMXhCMkw2VElMc1lib1hZdlZ5Z0h2MjRW?=
 =?utf-8?B?UjR0NDFybnd5Um5oaXpDN3JSeHVhZy84cXhDZFhTeEFpRWwyQWcyRnFjOUdi?=
 =?utf-8?B?OG9OWlR6VVdmV05od2dldExVSXBWamxrR2kvTmRtU2NGRTdham5zM0hHWDBa?=
 =?utf-8?B?eVhaU01RWWs5TjlzK0ZYQXU2dGY4RUZQeWdaaDlvcXROUEYzaGRCSTdjdC9G?=
 =?utf-8?B?bEkvOGhOT1IxS3Y5L2c0ZVBDaHcxOE1qb0syVEROdGdWT25NMnUyRUM1L2J5?=
 =?utf-8?B?Y3VVcGdWNEJlaVFLQU42dnd0YUJjVUpvUi9wdjUrc1dpbVpqSmZEZVlBWTZ2?=
 =?utf-8?B?YzlsVll6UjNJODlwa09nakJsWlJqMThxYjBFUi9WeWI2dStEZFpoUnZ1TGdD?=
 =?utf-8?B?MDNLdlRwSDVsVkdwc0tDdFljWndpcEU0YkZUeGJxWGFXMjhyTVpSUEQ3RTI5?=
 =?utf-8?B?VDRLeEpJYThJR1d4emVUVzFyZU1jN280MGYydFgrS2dvU2JKekw2UmpHQUdu?=
 =?utf-8?B?S2t2Sm1lb2dFc3hpSC9SdU0xUW9OQkZ5azBHVVlRNjNsMHRvVFcxaXFOSjNj?=
 =?utf-8?B?ckUvSDNiY0I4Y0poUUprZ0p4dStxWVVFazJqZmRqWVVjemV2KzhVNklHVGc3?=
 =?utf-8?B?bjBLMU03Vmhrc1o5OUhCTis4SUorVUt5Ry9JS2dFVmhPcURZY01TSEllVXEr?=
 =?utf-8?B?dWdEV05pTnJQUVJqY2ZjYnRBUXEwNzhlb1AzWDJvUWtPdzNQeFRuWUwzeUJ1?=
 =?utf-8?B?TnlRMnRQd3ZEY1VHcGxDYUo1ZDZCcmhtSzc4T0Zic2twUzE1MWdMMUZVYUVi?=
 =?utf-8?B?U2JuSENJdWlLL2RQeVV2Z2ZtS2M0eW9FWUdzNEFSRDZZUkxtOWFYTEtEaDQ0?=
 =?utf-8?B?UTF5OGl6WGUzZytHUCsxRy9ZajJTOXlDTFp5VEw4dVhGNmxJT1VmRTdaaWdt?=
 =?utf-8?B?MEtRUDFZd2xlNTcwSlpuZmluY2RrbktsVUVsTWpjelU3VEdMaUdiN2k1WE13?=
 =?utf-8?B?blpRNmZ5MDQ3dkQ5MWZ6cTllNzhxdWxFdHl3YjVCQk1jQm95bnBoT3oyS3Uw?=
 =?utf-8?B?bDljZDJWQnZPZXF4UzNDZ0JlWGU4aEh1UkR5K29SZEVXc2QwanJHdHRIanlo?=
 =?utf-8?B?dXlhNXBoRFFoNWJMNEJhRWszUTh0VHJyc00rRTlkQlp4cForbU15d0RyQ3p0?=
 =?utf-8?B?WDRUNVRhTzgvdkRObGF0bE5Ra0JRWUUrN2k0T2VmNC8yZWZPUFJKRDhDWDFV?=
 =?utf-8?B?cmF6WkhPRlN0UkR2bWRuQ2pDbUpqZlBhdWVxWGUvYzFHdWlXQ3ZuRlR3QlUw?=
 =?utf-8?B?STdIa3FCaUhvYkx5bFdDVnBGTVZZU3FlVHJZc3drNThGRGk3ZUUxaXB2NVAr?=
 =?utf-8?Q?WmCP4B/55IlTsAG02N96/7iW9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa01c9b0-5a4e-4a06-a8c5-08dced31e3dc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 15:56:11.4621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWo233KrDfdWHjUksHfiJCmGg3cS6aDItUmjIIGY7NDLnQs0VWXhNDj/7pM3VjiJsVIz6iuvLAP6KuFJDNKpQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891


On 14/10/2024 20:03, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>
>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
>> new file mode 100644
>> index 0000000000..4a21bc815c
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/mm.h>
>> +#include <asm/arm64/mpu/sysregs.h>
>> +
>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> NIT alignment
Ack
>
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * Inputs:
>> + * sel:         region selector
>> + * base:        reg storing base address (should be page-aligned)
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +
>> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
>> +    add   \sel, \sel, #1
> I think there is an issue adding 1 here, because the very first region we are going to fill will be the 1st even if we intended the 0th.
> Probably moving this one at the end will fix the issue

We are also using 'sel' to compare against the maximum number of regions 
supported. So, for the first region it needs to be 1 otherwise there is 
a risk of comparing 0 (ie first region) with 0 (max supported regions).

May be what I can do is ...

>
>> +    cmp   \sel, \maxcount
>> +    bgt   fail
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +

/* Regions should start from 0 */

sub     \sel, \sel, #1

- Ayan


