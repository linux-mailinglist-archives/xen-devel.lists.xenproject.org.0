Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC89F64F5
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 12:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860311.1272356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNsKR-0007XD-65; Wed, 18 Dec 2024 11:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860311.1272356; Wed, 18 Dec 2024 11:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNsKR-0007Ux-3F; Wed, 18 Dec 2024 11:34:59 +0000
Received: by outflank-mailman (input) for mailman id 860311;
 Wed, 18 Dec 2024 11:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxzo=TL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tNsKQ-0007Ur-DS
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 11:34:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2418::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1e150d-bd34-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 12:34:55 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 11:34:50 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 11:34:50 +0000
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
X-Inumbo-ID: 1a1e150d-bd34-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ur9wSuNQZf2gkAt6e8Oc7GzX2KNzetNIKBPcbNOOqQ0X/WU9ztvlaUVsnGRPVcSRyud8nGemfg0L3ZePqzL7omN34tfva4UgZ2Gr+KUI16Q0KA7IPIox2IptB8BjJIjUYUfhv3t/Z1xMeEt5FDd54NmwtSdGYd+e3nK1asURGutzZjj++I2BxfpZ4aP1660Sd8txuJMBw4Xd5SqYZ7IOgQ8ig60+gg7QTx3EEGBe+q9ncUEuzUl2JO5j02bWueru/Y/Pvjq3IL5Trj3CQtYx37YACOjsE9qxJm/CxPYRMiVepripXFQgTURNOZjrmOB8GgFuQxbvB9NTrFDSs/fZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ko0wWBNIHISshnI6EwOczzUiYI6ife7vii1rLw/eGU=;
 b=t+dxw4Fo4QC/QthpILnMOk2HnfQgf0qwQUTNQF9RutNqV1qjWu8aHjXE44VeufCtA7QbS4jqCxxWke+sobhLYCO6BUzdGa9dOIEHj2xIWAlhm511mdXJFEDmy6Cf5rCWUgJ8cUESL/l9PP+aV1ObSZoeSQnoQjvJAkVHI6gq2qBn12qkAUaOnWOzsItrNg+Dxo8eX7flwVrcwb0R6nFIiPRmJjgpTZs2XbWQ1ibXA60eEOPQ6ha37QJ6ok0qC/kF1hWTX+vprMIg2It6bTeiUD4NFGPXUGz7rFgSzQeGJkyWghZfYGsoJpplgSpRT4FXXFBt2nxNLT7rHBYtQmlacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ko0wWBNIHISshnI6EwOczzUiYI6ife7vii1rLw/eGU=;
 b=i1VHMXCX6yDRM70gIPIkYbxRTLrvJIKt4OiKUFkPyshWV5I2tN/9RyUm4zIIz99IpIEw/NpHf4RJf3IDpolgQV9NXoYm1jVMesRr4Xt7sB0Mm9wLO6HlEQNrzGRpaciTOlrxQbLELr+72UzpfRI3vePyp7sC3wdx5+9Ekxb00tU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
Date: Wed, 18 Dec 2024 11:34:44 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
 <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN0PR12MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: 91896b7c-bf6f-4fde-6b10-08dd1f57fbbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkhHVHNzZFJXbHdMNmYrU2lkakRrNWhGMStEUjZKUHN0YWNqcXZUc2VLelpa?=
 =?utf-8?B?SGVGYTNCT2ZIenlqdEdsRlZGSUNlM3FwNmx2MXdsUVc2UnRscEwzOG5Majl4?=
 =?utf-8?B?bVRReTN0QXBIbDdxZGVpSzVFUmd4TjFoaHE4clhCRWM5djVTWnE4c1Z6Y01l?=
 =?utf-8?B?ZElBU2huVll6eUUrR1lDVnpJcnJGM1FZeGp5YVUveDJJa2VUS0swVWNwQjlO?=
 =?utf-8?B?MXlSQmtwcGlDRVg4bVRJVy9peUJRSlBIaU9vdTJYUmZ1dGJWa3kvdHFBaGl2?=
 =?utf-8?B?dWoxUXZDVEQ5Vk5wU296YWhSQU40dllaRkFZTXZwK2ZpU2tYK1lWdWtZcDhM?=
 =?utf-8?B?RWJEcU1Bdyt1WWROd0hrUndIbzZYbk5lU0lWTkZzQ083NEtTVDhPU1JSdDRY?=
 =?utf-8?B?RkRSSGlnUFJCWG0yT3NLVGhZbkw3Rk1wSE94ZU0ybS9RdUJkZFdJVHRHRGZ3?=
 =?utf-8?B?eUgzY2sxRjVweVd4amcyVVVyd1EvWDN4WmNRTUZJaDl1K0FXanphUlBST0Nv?=
 =?utf-8?B?eUtQR1hFVjlJS1hxKzFGK0lVQjVjVDdlT1c1NEt0dW10dEI2Q1lwL1dmbW1L?=
 =?utf-8?B?RWRhTG85d2NCaHJ6VVpBaTlsZG9ueHdGMmxOU3FHYnV3cisxYmNCNUZ0blNj?=
 =?utf-8?B?SVpnTEZuZ1ZKUUdZc0tMb09TaEtKTU95U2YrNjBuZlR6TXlnZzhpTnhWS2xQ?=
 =?utf-8?B?SVRPZjJDQ2lQbE9ZMVJ3R1craHp3UG9hdmFHOFhhalhQdHJZV3BJME1zV1RV?=
 =?utf-8?B?ckdwbWlrWm4raXAvMk5UY0tsdXJxbjlEb21OQjhGSTladk5RU3NyT1d1bGdM?=
 =?utf-8?B?Q0FQdDNZUld6cnF4K1dZYnNYcXlWNmQ4WDdsTFRodjdodU9Od1NBVy9rYU9Y?=
 =?utf-8?B?MUJsQXdHNTlybWE5KzFLM3VVWmhYWjVxRElCVTk0ai8vOVJUUU4zeWZNUTdh?=
 =?utf-8?B?WklzL2x4dno0TkFZSVkwMHJwblViZFlYbmNXd1dxUVZLQ3VaZHg5Zlo5NXpK?=
 =?utf-8?B?SVdmUzJQNzc4bDlBeUUyZGJnM0pUQkVXelloQTRTZGQ0Y093V0RUNVZpMW1V?=
 =?utf-8?B?ejBNWkVLT2FFSVlwN2g1MGZXRVJDZGEwNkZlUFk4UzBiTDZJVlVNRFRBd2VD?=
 =?utf-8?B?SHdKSUtuWVFZRGR4ZGFWZzUxMi80QUlrb2hsOXZQeWthRUZWUHVTd3dsOFV0?=
 =?utf-8?B?akhnQnU4aSt0cFZRaFVKQWhVN0hUQ05IUEEyZ1hUYWRQQTFRM3htRWRKa0lB?=
 =?utf-8?B?Tk11WUVPajRKZjZlQVpPZFdSSDlOZUVzU0N0eGdybjBrejhtTStPakZaajhS?=
 =?utf-8?B?dEtkcVMxbFNTcHVvZVZ6djY0RXdvNEp6bXJsREFidDI3TVZ1dXRjbDFzemJq?=
 =?utf-8?B?OTE2NmpwMjlGU1llNDY2MU9BMVIva1dDRys5LytmZmg4a3F0VFJpajVPR25v?=
 =?utf-8?B?a2xoU1kray91ZmxCQlRsUWJOeGtHa1p0WkdoSDAxeUxPbzFJelJSVVoxQ3ht?=
 =?utf-8?B?NFNJR3IwZU1pYlhwS203N2FEWWRwU0F0elZiKzhqa2dJbkQ1bzVmRjFQeDZW?=
 =?utf-8?B?VldtTUJKcGdZajFDS2g1R2o2S3ZPZjc3Y0Rwam5ESjk4empCOC9Ec2FPM0M5?=
 =?utf-8?B?RHJOU01iMzhkaVVJeGR3ZzdzdEttWkdtUmNFSVlHSGVLelVpNmZ3QTRjajZK?=
 =?utf-8?B?NVk1QVc3a0RUNFJ4MmsxdGo5Q05Xa2pvZFFhcURwREp0Vkt6YlBkS3RpZGtV?=
 =?utf-8?B?R0xraGlHK0VOOHhZanljbk5WVWRrbzI2NW9YUUVGbmp5djB1MTdXWlpJSU1x?=
 =?utf-8?B?TXUrYXZPYzcrTEY4d2VRZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy9oWmcyY3JaeGZ6L0NXMFd4dFI1cm51eUZTUjRsV0xvOUdycnJndXFRTlR0?=
 =?utf-8?B?UHNPVlhaMEVHRWFoUEc5c3FEalY0Um1GQWdta0VlaHEyRzd4aUdpOWhVQW5W?=
 =?utf-8?B?YVhUNlcxQ2tKMmVYOXVtYmZCcXU2d005T1FoTWQ2SW5sNTl5Tkp6WTVaOTAw?=
 =?utf-8?B?WTJZR2ZDVXR6aVZZVHpCNk1QOUZCTTdmdXRNRGRKdW40Lyt1alluc2lkdytO?=
 =?utf-8?B?cDNuNW51RnJ5SG5kUjkxWEUrZ2w0M2FIL0VYNzRpbFl5OHB2aDR0REI3emRI?=
 =?utf-8?B?V0VvN1owbmhSUmZwS25SVFJXaFNWeFFvSWFIVWorUkd2QTNpRGpRVis2L0lU?=
 =?utf-8?B?Ym9xV0FJaE5ieHZoSGphU3VpcS9QM0c0UVJwa29ic0tacE9GdVZOblN0Ri9w?=
 =?utf-8?B?aDlJMTA2YUFpOHU3azhkbHRHdEROR25ka1FKWTNYbFl2cmhIZ0tvNG9Dd3RB?=
 =?utf-8?B?azV6ZmJTaXQvemJ1cVk5RGdPamNoUWIwSDR0UGFybGlwaWdJS2QweFVkMWQr?=
 =?utf-8?B?Y1huZDBuemx2bEF2WmwwdUtlbHRzYllRS2VkOENDUUlLcnhIbjNhc0thZzl6?=
 =?utf-8?B?SFZpWjVRdGprcHlIL29pNkJZVTV4ZDVKSVY1ZWhvMHF5VDRnaXFGZDdXcGs0?=
 =?utf-8?B?dU8yOGNHQnJRZDRwc0lXWGtONGJCR3JZL3JSM0pHVThPSkFURmZMa0FHY3RU?=
 =?utf-8?B?ZGJOdzlGTUxPeHlhZEdqSVhCMFV5QkhhcXNkTU4zY3lZZFZ6WGlLeGJVS1Jh?=
 =?utf-8?B?NVZOcVg5cVlZR0RjREF6ZXkrWDZ0d1BzdFdSTVlrZG5zYTBjWlpOL0JpdTRR?=
 =?utf-8?B?QkNLZGFYYTlUWVg2MWs4Q1o4a256czE1bGhDSXArVCs5c0VKSllEN1hxK1BT?=
 =?utf-8?B?UkM4T2xsSTdhSXFpd0dwa1NPZUZGSkNRcWZMOFlZbzlES3ovYytadjJYV09Q?=
 =?utf-8?B?VmlUM29OZnZVMjBydWxPam9yUnFHRzFKbnBjY3BBZTE3R202Wm1BTHc0KzJI?=
 =?utf-8?B?dnBEdThzN1NYTFhEWjBvTkd0TjFnT01ScTVac1RwOFY1OHhLamxvb2ZRMFlh?=
 =?utf-8?B?dC9GVUwyWCtXUGhaVGozLzZZNTJKLzN0WlpOaTM4NCtEVGxsMTJnQUtrc0Fk?=
 =?utf-8?B?REJUTFpIWXlsWEhnb3BJUDRSNUN3RUl1YnNUWEFWMERMOFYvbk9VRDFXZDB4?=
 =?utf-8?B?TDZldFh4WlZGS3FxcWViaXBIcmtCcTFtMnJZMGk3bUU2ampnMEEySVY2cGVQ?=
 =?utf-8?B?MkV3V1dLOEJTalFKQjVPamgxTkhmbVZFVTBTRlJ6bk1Bb2pHTzlYRXlrYkpC?=
 =?utf-8?B?bmJwWUdFRi9OaVRZbW1zRlkvQi9MR0U1RjBEYTlRK1IzNXF6czhLZWFUMXRR?=
 =?utf-8?B?YUdEd3UxTlBDWXRUNzN1NGhBeDJxZlRtL3RxVW01azRWcDhBeS83L09rZ3Rn?=
 =?utf-8?B?SEhRSm5yMndvb2NjUzV5eURuZ0VmbWlaRkdBeVd2dXc5YWFvSzF5bjdHNCtt?=
 =?utf-8?B?UDFYL1RwSVRXaDV0cTFMaXBySFJ0OTJrRTB2T1M5KzhUbVN1ZGYyblM1UEZy?=
 =?utf-8?B?b2Z4Y2IvSHlHc1pBTUNmTWxxbFg0eG5QRmRpUWFvbjhaN1d2dDhYVzZ0VWRt?=
 =?utf-8?B?bkNqSlJxRUgxMnVxSDhjdjNYN1laM01SZUF3dGNjbFp3VDI0MTRLeWUwSnB4?=
 =?utf-8?B?dG5qb2xMY3U4YlZJMG51M1dBclVibkZTaWNxTzRPR1h6eWcwRnRxL3RDajVl?=
 =?utf-8?B?TTNlWkMvKzVsU09EWlV5dUJTa3Q4ekR4d0pJY29KdEpJUnpWK2lIVTRhYWNU?=
 =?utf-8?B?UDZtN053bnRiR0tmQTFrNUMyMTJRWmUva1dveUdsc1FSdGZ4NEFpbWNmQ011?=
 =?utf-8?B?ZzFnZGNyZGZadGFxWGo0Sm1ZUmUxZXh1YXowSUhMQUFIRmQ0TnByQ1lnRjFX?=
 =?utf-8?B?akcvT0ZjbHVvNDVJdDlsNG42Vk1KMFd2VVQ4ZmM5cFdMczg4TUFzNzJqa0ZI?=
 =?utf-8?B?eGFQZXJ1OEVRUVJjd0FMZkRwMThYU2VXSHJUbHBkQTZTMkRhM0s2L2NpTnI5?=
 =?utf-8?B?b2g4dkNDbWRkbTRSUkk0cTFKblYzdnNyTVFhaHBaendjdXZEM2diMzJwd3V0?=
 =?utf-8?Q?kUICnUugsApJO23zGVOt5f5n/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91896b7c-bf6f-4fde-6b10-08dd1f57fbbf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 11:34:50.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uWAmu0h9YOm3Keowb6fos2dBg6hEL+/EuUWdfa0YCp+IjpswZDnLqTR/RTv68T/Ey0Aa8Om9PmeGyzETHsfKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835


On 18/12/2024 08:27, Bertrand Marquis wrote:
> Hi Ayan,
Hi Bertrand,
>
>> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Add requirements for dom0less domain creation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from v1 :-
>>
>> 1. As the dom0less domain creation requirements specifies the dt properties
>> for creating domains, it has been moved to product requirements. Product
>> requirements define the interface Xen exposes to other domains.
>>
>> 2. For the requirements which introduces new terms (like grant table, etc), I
>> have provided the definition as part of the comments.
>>
>> 3. Introduced new market requirements to specify that Xen can assign iomem and
>> irqs to domains.
>>
>> 4. The design requirements will be added later.
>>
>> docs/fusa/reqs/market-reqs/reqs.rst        |  16 ++
>> docs/fusa/reqs/product-reqs/arm64/reqs.rst | 306 +++++++++++++++++++++
>> 2 files changed, 322 insertions(+)
>>
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index f456788d96..47e1b6ad61 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -47,3 +47,19 @@ Comments:
>>
>> Needs:
>>   - XenProd
>> +
>> +Static VM definition
>> +--------------------
>> +
>> +`XenMkt~static_vm_definition~1`
>> +
>> +Description:
>> +Xen shall support assigning peripherals to various domains.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Peripheral implies an iomem (input output memory) and/or interrupts.
>> +
>> +Needs:
>> + - XenProd
>> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> index db91c47a02..66f2978733 100644
>> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> @@ -40,3 +40,309 @@ Covers:
>>
>> Needs:
>>   - XenSwdgn
>> +
>> +Linux kernel image
>> +------------------
>> +
>> +`XenProd~linux_kernel_image~1`
>> +
>> +Description:
>> +Xen shall create a domain with a Arm64 Linux kernel image [1].
> This shall be rephrased to mention that it shall be a binary with a header compliant with the Linux kernel image format.
> We do not want to say that we can only boot Linux.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Gzip Linux kernel image
>> +-----------------------
>> +
>> +`XenProd~linux_kernel_gzip_image~1`
>> +
>> +Description:
>> +Xen shall create a domain with a Arm64 Gzip compressed Linux kernel image.
> Ditto.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Kernel with uImage header
>> +-------------------------
>> +
>> +`XenProd~kernel_uimage~1`
>> +
>> +Description:
>> +Xen shall create a domain with a kernel containing uImage header [2].
> I would remove kernel and say binary executable and add compatible or something like that.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Gzip kernel with uImage header
>> +------------------------------
>> +
>> +`XenSwdgn~arm64_gzip_kernel_uimage~1`
>> +
>> +Description:
>> +Xen shall create a domain with a Gzip compressed kernel containing uImage
>> +header [2].
> Same
Agreed with all the above.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Kernel command line arguments
>> +-----------------------------
>> +
>> +`XenSwdgn~kernel_cmd_line_args~1`
>> +
>> +Description:
>> +Xen shall pass kernel command line arguments to a domain.
> I am a bit wondering if this one and the following are not a bit to generic.
> Should we say through DT or ACPI header for example ?
Yes, I can say through device tree. And then I can explain device tree 
in the comments.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Ramdisk
>> +-------
>> +
>> +`XenSwdgn~ramdisk~1`
>> +
>> +Description:
>> +Xen shall provide initial ramdisk to a domain.
> This should be mentioning that it is provided in memory and the address is provided through DT.
Ack.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Memory
>> +------
>> +
>> +`XenSwdgn~memory~1`
>> +
>> +Description:
>> +Xen shall create a domain with specified amount of memory.
> I am missing the where this is specified here ? i guess this is also DT
Yes, this is also DT.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +vCPUs
>> +-----
>> +
>> +`XenSwdgn~vcpus~1`
>> +
>> +Description:
>> +Xen shall create a domain with a number of virtual CPUs.
> number here is unprecise
Can I say with one or more number of virtual CPUS ? How would you want 
me to define.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Credit2 CPU pool scheduler
>> +--------------------------
>> +
>> +`XenSwdgn~credit2_cpu_pool_scheduler~1`
>> +
>> +Description:
>> +Xen shall assign a Credit2 CPU pool scheduler [3] to a domain.
> What is Credit2 ? this needs to be defined somewhere
I have provided a link to the credit2 documentation.

https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/features/sched_credit2.pandoc

Do I still need to define it as
"Credit2 is a scheduling mechanism where more than one virtual cpus shares a physical cpus based on a time sharing mechanism."

or should the requirement be rephrased as

"Xen shall have a scheduler where a physical cpu can be shared between more than one virtual cpu".

> and in fact it
> shall have product level requirements.
Do you mean this needs to be a product requirement ?
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +NUL CPU pool scheduler
>> +----------------------
>> +
>> +`XenSwdgn~nul_cpu_pool_scheduler~1`
>> +
>> +Description:
>> +Xen shall assign a NUL CPU pool scheduler to a domain.
> Same
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +A NUL CPU pool scheduler maps a virtual cpu to a unique physical cpu.
> This is a product requirement saying that Xen shall have a scheduler with such characteristics
> and I think this is not enough to define it.
I don't understand this bit. Do you mean this should be product 
requirement written as "Xen shall have a scheduler where a virtual cpu 
is always assigned to a unique physical cpu".
>
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +SPIs
>> +----
>> +
>> +`XenSwdgn~spis~1`
>> +
>> +Description:
>> +Xen shall allocate a specified number of shared peripheral interrupts for a
>> +domain.
> This is very ambiguous. What do you mean here ?
Xen shall provide a way to specify the number of shared peripheral 
interrupts for a domain via the device tree .
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +A shared peripheral interrupt is an interrupt generated by a peripheral that is
>> +accessible across all the cpu cores.
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> + - `XenMkt~static_vm_definition~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Grant table frames
>> +------------------
>> +
>> +`XenSwdgn~grant_table_frames~1`
>> +
>> +Description:
>> +Xen shall create a domain with a specified number of grant table frames.
> It is really weird to say that Xen shall create something specific without this being
> linked to an higher level definition of the goal.

ok, I will drop this and the following requirement for now.

When we have market requirement to specify that "Xen shall allow sharing 
of buffer with a domain", then we can add this and the following 
requirement.

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Grant tables are a mechanism for sharing and transferring frames (memory buffers)
>> +between domains.
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Grant maptrack frames
>> +---------------------
>> +
>> +`XenSwdgn~grant_maptrack_frames~1`
>> +
>> +Description:
>> +Xen shall create a domain with a specified number of grant maptrack frames.
> Why is this needed ? what is the high level req for this ?
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Maptrack frame is the metadata for tracking the memory mapped into a domain.
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Virtual PL011
>> +-------------
>> +
>> +`XenProd~virtual_pl011~1`
>> +
>> +Description:
>> +Xen shall provide an "Arm PL011 UART" compliant device to the domains.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenMkt~run_arm64_domains~1`
>> + - `XenMkt~provide_console_domains~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Assign iomem
>> +------------
>> +
>> +`XenProd~assign_iomem~1`
>> +
>> +Description:
>> +Xen shall support assigning iomem to a domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Rationale:
>> +
>> +Covers:
>> + - `XenMkt~static_vm_definition~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +Forward interrupts
>> +------------------
>> +
>> +`XenProd~forward_irqs~1`
>> +
>> +Description:
>> +Xen shall support forwarding interrupts to a domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Rationale:
>> +
>> +Covers:
>> + - `XenMkt~static_vm_definition~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> +
>> +| [1] https://github.com/torvalds/linux/blob/master/Documentation/arch/arm64/booting.rst
>> +| [2] https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
>> +| [3] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/features/sched_credit2.pandoc
>> -- 
>> 2.25.1
>>
- Ayan

