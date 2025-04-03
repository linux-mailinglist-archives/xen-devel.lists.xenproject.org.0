Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CFAA7A80B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 18:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936945.1338059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0NXr-0004Q7-UV; Thu, 03 Apr 2025 16:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936945.1338059; Thu, 03 Apr 2025 16:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0NXr-0004Nm-RV; Thu, 03 Apr 2025 16:35:59 +0000
Received: by outflank-mailman (input) for mailman id 936945;
 Thu, 03 Apr 2025 16:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+EW4=WV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u0NXq-0004Ng-1G
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 16:35:58 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2417::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5c5f76b-10a9-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 18:35:54 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB7105.namprd12.prod.outlook.com (2603:10b6:806:2a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 16:35:50 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 16:35:50 +0000
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
X-Inumbo-ID: b5c5f76b-10a9-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHo0kY0chUaidctndK/zhax7K1vNdkB2RwGeSsizBNEYDer0i60Ff7BcGy1z7gmxj5/hEx67iKtr2afImyg8hK3KamE1fns2eJPO57orELXJSECympSnEuBVCp4RRW02j3LYHN+congwMoG+AwmA0QMK9Gjkk44JCHlibhoOOP1t/0mAhmqMWsZeHS7uGs09O8yWXzOKOBwFn+ki4zBhtNtrOtg53wvgqNqLlPBliDcgPHKyWCcN2cZLfpk6/XDPSDEBqpuETX3Ib0lP2Jy+hMwFrpXr8zi67yyiTxTX25NZPPlDPSzbrOFeVJNOzB5UcgTSg8dYkXLC56Jx/L8D+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy7LR9fkeIAeXu7lv8mieQJ2L4ADsBCvEmqKqAxV68A=;
 b=klMa/VkC4Htu9lyld3feqDyASioFS9RbW30xtcUtQOZBUpPHmuzuzqlxfh72Pzjod5O52I34Y5doXCbyPilbfAxQY++2LHSK/+jAi+h2qk+hnbykGRl53afGfW3kjmGJWYsV5X0KmFkP/+ujB6guqw/otVnvYxiF8IS+a2409qSPIJhbRiBqmrpmoxab8WZQEKWA0I92gnNJzzBYVHPqx0uUWvFNywzGA+fucPX+CLk0jZcYwn6zCPHnZxy7UOwwZ3Q4YJA23SUuK3nZfsbmA6jVQgDkR4pNZ1wMsvIwt/N0KA7s51aRMqjgjPJVpwfZyxiWQYN6L9zmozVMITMQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy7LR9fkeIAeXu7lv8mieQJ2L4ADsBCvEmqKqAxV68A=;
 b=NIYtCl22SoVEuBX/1fl/+/u/FBE53nwZZkPdhokDYb2ntvMIKAwhHyfhsHRPfLdMj+pwGvS0tnE1+hOLVzx1bVd5OHGSE3IcOyeHNRhExukGFI1d4H0jdXm9PjiQq2fxSE5Mgd+L3hekmE2jtzjSJO4IuGsPUqKXHEon78xS3pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <96d1a959-95ab-4db0-8afb-baa0c614ac8b@amd.com>
Date: Thu, 3 Apr 2025 17:35:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] xen/arm32: mpu: Stubs to build MPU for arm32
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-6-ayan.kumar.halder@amd.com>
 <6a767fe1-2d77-4cd4-9726-498fbb27ce87@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6a767fe1-2d77-4cd4-9726-498fbb27ce87@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0691.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 8515328c-99a9-4989-7cfe-08dd72cd9806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnRhMFNHclRaWnRnMVBNWXl6TURwZlM5YXNGRER1Z3NDNHAyVnZ0TlJ1M1NI?=
 =?utf-8?B?d1lTR3YvK2szNmJ1S1lkcVZ5VmZtZUwrQnBMUUpUbkVoU3IwQmFBcDQ1OGc1?=
 =?utf-8?B?SnhEVEhXbStaTG9oTHlud1lsQXNFMXYvTVpHVVZzdExRNXBaakMyTXhoeith?=
 =?utf-8?B?OGp4L09kWFllZVU4a05uVmpNeXdVYlpHNlUxaVQ5eGNtN2dYSXpHK3BxRUdX?=
 =?utf-8?B?NVdoMVpvWVFHZnNWOUxtelFWTzJyWGtBVTgvcDlSaEFOWTQzaGJkWXdsMjFR?=
 =?utf-8?B?Q0hlaGZzbnBvRjBCZWt5alVSVnhuVEQwWEY3dXhMd0U0UEo3bkxzUkpIWEFF?=
 =?utf-8?B?aTVkYXN0VWZuMTlLcUN5UGlyWGlRZHUwc3BuWEhNTkRCcEZjbnU4YTB0NGNN?=
 =?utf-8?B?Zk1DOFVvcHhRVHkvT0VvZzN4VlBkdXZkVFAvRjUvTWRsVzJEblZVeVZZSGxO?=
 =?utf-8?B?OTNMUkc1ZHlWNmlKcWFuZjlwVzJwRFVrTE5UempHa054SDhhMXVsc2o4MzB1?=
 =?utf-8?B?SWFCRFd6RGpzU2lHd3F2bjljVW43b1cwcWhYR1NzVktCQXpUNjl3NmhWaFJh?=
 =?utf-8?B?NTRjVFNYREhZZzVvTHBGNXdUQXV0S2R6RmhLbkRaa09palBMcGpKeWNUWW42?=
 =?utf-8?B?TkEybmRTelpqMzRSdlRrT3N6SFNmcWpYamJhRlJCRG1Hb3ZwKzRVVWowMjVr?=
 =?utf-8?B?ZFZ4Ull3Uk5hZlVyam4rQXZpam9iK0t1UC9oK2JnY2k4U1JvbGxkdHJQdXJk?=
 =?utf-8?B?bGJxNXNTSFhibXgrRThFbkx0R25kakNWK0s3MkZXZW9lSnFscU1QTlFmRk44?=
 =?utf-8?B?QkQ0WVNLOGlaTGMrc0R1aGFQNFozak9OT1J6dmRtaVlteVZEWnVMeHVxWXFj?=
 =?utf-8?B?aVRSNHphL2FTajl0SnpVNVV5R0pmOFp5dzg5Z2tkSDZkTEdRV3c3WDR3QVRx?=
 =?utf-8?B?S1FYMU45VUFua3BORUF3ZWc0MWdQTm9rS0cwOEtvcnpXbGhINWU5MkxUMURT?=
 =?utf-8?B?N1JZbDFGN1hjVXZ1L3lrYVMzNnBHTkVsSEp5ckh3TUcyTXRqdHYzUGpqM0Ux?=
 =?utf-8?B?UGFrMUU5OE03eGh1eWUyRUEwVjg2QTk2QTd5K0dyUnN3YnhGbDJiRUVvcldV?=
 =?utf-8?B?YzhPRTFpdzJ6aE03R3VwZkxHRkpmM2RUamdnYUsrL3h6cE5aaGtWTDgzZHZy?=
 =?utf-8?B?RmVibmFYUURiLzZUTWp6Sk0xeTRPVFdHUVhuSlEvR0JQOHhxSUxXb2hxM2dY?=
 =?utf-8?B?MXFQWVNTVVJsckNBdFZqaXgxNWhmUEFXMXJ2aVd3dXBKRm1EMDFzSmxJME9E?=
 =?utf-8?B?ajVQL2tBbXB3U0VXb1Q2QUkvMGZqb1BackJZdFlJY1Z1SFdSL0FjTDU0MXRz?=
 =?utf-8?B?Q3dDL2RHNFNvdkg0aTZMcVNOa3Zvb0lVd2F5dGRyV2I2OVpUYVlvZDA3bE9q?=
 =?utf-8?B?Z0NuVytkMUJJdjF2NEc1WDIrOFJpcjkydlB3SCtpbEZaWWRpNjZWZUl6M2tK?=
 =?utf-8?B?SVFHQitSTS9LTm8rektKRVNPSXRmQkNBY3R1K25DOFQxNEZnTUpUbU96OGJo?=
 =?utf-8?B?UGhjdC93NTNvZzNHM0cwamZvdVB4QnFOUm96WFZFS3FQTFYyWVRlMU9ZaDlY?=
 =?utf-8?B?T3lBZmR5TXBSQjBLazZNZmI2RWdHeFZKUjRnYlA0SUlvaks5Mll4cndkdXps?=
 =?utf-8?B?Y3N4L0owMkV4MlloeDlJbTdsUHhHUitWbkN1YnRkdTZMS0Y2dEY2czloaXlF?=
 =?utf-8?B?eTZlSm10dWRYVVZkZXQwQXQ1NDA0V2pnTzllWFpNUjZtaTI3RU1lcklKZFJW?=
 =?utf-8?B?UTZ5ZEl1UDFDUjZUbnNDcS9JWkU0OVM4TmpML3NZekJtdk4zMzlVdk1oaVFt?=
 =?utf-8?Q?dQvWmZ7pwWDMA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHZjOVYzWGl3Z2h1cXR3YllrOXNNKzNubk1oTXc2a1c4cGMrN2hjTXArNFU1?=
 =?utf-8?B?K2NzTTlielZQOGQwNnZ6Sms0dGdqbTFhSzBWbHYvQmZUUjQ4NjJQbENTNUpU?=
 =?utf-8?B?UEFYR2RUd3FoRmN1WDFYdFkwYUhmMm11VGphNS8zaEltSzNFbHI2NkovbG1r?=
 =?utf-8?B?Zlk5d1p2VmN5RzJ6QzQ0VXFBdmNsSyt0S0tZcEdFbVNDNFYzVVlCWHpxTExy?=
 =?utf-8?B?TVBUY0h1ZEtWczdKYTBHeTlUTzVGclZxanBYRVpsdFVnUXFMMTlNL1IwWnBY?=
 =?utf-8?B?aUhETTQxSVNqZnQ5VGJOU21RYkpraXViN0pHc3lDcVFxa2NJN3pMb2pFeFV0?=
 =?utf-8?B?YSszTlI2N3FCVnpFUGhLMmhpVDdoTmxjQ01MQnVIM2VpcVdZNG4rcXlnSW1P?=
 =?utf-8?B?VFBYNUFxYXJPTXJkZjdBT0ZzV3VhZHFRL1ZlZWxxejJtMkFXSzdlUExlcEph?=
 =?utf-8?B?NjE5ODJ5K2x0a2FlYzZCc3NDeUptMEVkUFJLaWNJSXJRSE9lVzVKazc3S2pV?=
 =?utf-8?B?RFNDdUc2TnpTSTFLZFNiOVhYSkw0SkpPN1p1NzNmSTVDSm4zUGo4SzZSUjBY?=
 =?utf-8?B?NVQ0U3RXL0pPeTVaUjJ5V1I1VXpuUnZJM2x6MUdzQjN3YWYvQVVZRDB2QWRw?=
 =?utf-8?B?SFBKbnZZK0lPQ1FDMkdNaFc5VDdoa1R2QVFzQ2VtcUdmcGpmaWFPUkVlUDQv?=
 =?utf-8?B?cjRZZHljUjlMQzRkSk5OcXJrS3lDM2JEdTNtZmlNbFpVUXhtYjBnaWNTbXdT?=
 =?utf-8?B?TW9tNW53djN1dTFlVUtyVVNBRkdnVVZkZjA3d3BNVjZ2aE1VZ3NNZTdOOU5P?=
 =?utf-8?B?K2hFNmpodFplSmJIaU5rS0VSaXhsbncybVN2Y2xUQXp4VDBJeU1XdjRiMXpB?=
 =?utf-8?B?a0YzQyt4Sk9hekJyZEJaREIrMU5CVEtqdzNWd2tHUzVmQVh3Z1FnbWYrcWRm?=
 =?utf-8?B?RUNxTFpZbGROUjdySTVqOWxrYWE3ZEVYcng3UEt6RDRRUzE4MWFPRTRZZHIv?=
 =?utf-8?B?d09mcWFzOGxydmVTS0dFWGhKeGY1NU5KaDBqT3JpSTNMdVBKZG4zb3lmeThm?=
 =?utf-8?B?VHNCR2xpZ1RneEV5dUZSMmo2TEU0amV6UUVHN044a1BTTVZMS1RaaTRlVExJ?=
 =?utf-8?B?UDM5SVNTc25zbGQyUnlBTldIUy95MGR4bThtT0FGd1I4dEtyVXVDMGFxY001?=
 =?utf-8?B?QStjSFBLdjNYTEVqY2NpdmxhNmlDaVBERHk4cDRrbnh0RnJ3VEpla3d5OWNQ?=
 =?utf-8?B?RmFRNkFzV09UMHc1MElPZ3k2S1dXdzFXVVV6bE5jUGJzS0cwTWxrcHpjVVc5?=
 =?utf-8?B?K0xRcG1mbGJaY1FNbng1T01TRytvTDlaTmNWUk9vcjRSWmtxOFZvWlJWQklC?=
 =?utf-8?B?bVIxRXlZZlBGaFlqek1DT0JoQ28wc3k3SkJITVh6MExRU2ZDYVRRcWdhYVhi?=
 =?utf-8?B?a0UyY3NnS3Y4MmhOdkVuQyttRUU5NEsycUw1MVJnd1c5OTNFNkhBeEpzN1Vi?=
 =?utf-8?B?MzlQQmhEVDNKblVjVFA4NDFXUWxPT1B5QTBEOXV3dlgyQXNlVDJHVUxRRTJU?=
 =?utf-8?B?NVA5azVNaXFKcUZXeGcydnVkVitsQkxIakt3QW5yYWdJNXo1Q0ZWakticlBU?=
 =?utf-8?B?MW5ySlVVamtpNDFXSVROeVVRQi9qQjdaRlhSdGdydHpZMXZFQVVHRHpTbEJ5?=
 =?utf-8?B?ajlwSVFSdUVvQ0NuZkpOM3lHQ215a2xDNy9CSy9FRlFvbW1kbVpUNmlJK2JX?=
 =?utf-8?B?aW1RdkpaUTkyUk05L09BS1pXU2o4ZHRuY2lXQVVobkYwTk5kZHlJUGlLQ2Qv?=
 =?utf-8?B?eFExWUQ3QURCWDhVV2U3U1Fnak9EYzh0K051QlVHTHRsSFpXbjRJTTB5NjRV?=
 =?utf-8?B?dnpGUXBPbDVnL1Q0MzVScHAvanovYVBQbGlONFluQ043bDV1YitqRUN6NzAw?=
 =?utf-8?B?b0p0M1FCMmRxU21ESlZTRUVUb0M1c3hzdDRNVjc5S1dLc05oMkNuVnlOMmJv?=
 =?utf-8?B?QU9PK1prRzNaTFM1VG1UeXJHOFV4Q28zWThyR0dzRWtJdEhOWXQ3U3VPTzl1?=
 =?utf-8?B?MFZVMHNjYlVzU2ViWnBWdThSUlpiVGZtNGxETi9mOFNqbW5neHQzaVdWNkwv?=
 =?utf-8?Q?17e2orlP+/tCxAOYn9CF/Hjj5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8515328c-99a9-4989-7cfe-08dd72cd9806
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 16:35:50.4556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooHLGiuVAcNeOjUfFXMwtLRGdIx2GluGpGmaMcbaYF/HQx+PE52IO6e6gycH+PqMCGuc3lo621CqKJ2GiMwt9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7105


On 30/03/2025 22:11, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 30/03/2025 19:03, Ayan Kumar Halder wrote:
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1, v2 -
>> 1. New patch introduced in v3.
>> 2. Should be applied on top of
>> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/ 
>>
>>
>>   xen/arch/arm/Kconfig             |  2 +-
>>   xen/arch/arm/arm32/mpu/Makefile  |  2 ++
>>   xen/arch/arm/arm32/mpu/p2m.c     | 18 ++++++++++++++++++
>>   xen/arch/arm/arm32/mpu/smpboot.c | 23 +++++++++++++++++++++++
>>   xen/arch/arm/include/asm/mm.h    |  5 +++++
>>   5 files changed, 49 insertions(+), 1 deletion(-)
>>   create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>>   create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 565f288331..a1dd942091 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -1,7 +1,7 @@
>>   config ARM_32
>>       def_bool y
>>       depends on "$(ARCH)" = "arm32"
>> -    select ARCH_MAP_DOMAIN_PAGE
>> +    select ARCH_MAP_DOMAIN_PAGE if MMU
>
> If ARCH_MAP_DOMAIN_PAGE is not present, then the assumption is Xen 
> will be able to access all the memory. Is this what we want long term?
>
> If not, then I would consider providing stubs rather than disable 
> ARCH_MAP_DOMAIN_PAGE.
I will provide the stubs.
>
>>     config ARM_64
>>       def_bool y
>> diff --git a/xen/arch/arm/arm32/mpu/Makefile 
>> b/xen/arch/arm/arm32/mpu/Makefile
>> index 3340058c08..38797f28af 100644
>> --- a/xen/arch/arm/arm32/mpu/Makefile
>> +++ b/xen/arch/arm/arm32/mpu/Makefile
>> @@ -1 +1,3 @@
>>   obj-y += head.o
>> +obj-y += smpboot.o
>> +obj-y += p2m.o
>> diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
>> new file mode 100644
>> index 0000000000..df8de5c7d8
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/p2m.c
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <asm/p2m.h>
>> +
>> +void __init setup_virt_paging(void)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/arm32/mpu/smpboot.c 
>> b/xen/arch/arm/arm32/mpu/smpboot.c
>> new file mode 100644
>> index 0000000000..3f3e54294e
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/smpboot.c
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/mm.h>
>> +
>> +int prepare_secondary_mm(int cpu)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return -EINVAL;
>> +}
>> +
>> +void update_boot_mapping(bool enable)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> index fbffaccef4..a894e28ac9 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -171,12 +171,17 @@ struct page_info
>>   #define PGC_need_scrub    PGC_allocated
>>     #ifdef CONFIG_ARM_32
>> +#ifdef CONFIG_MPU
>> +#define is_xen_heap_page(page) false
>> +#define is_xen_heap_mfn(mfn) false
>
> Can you clarify whether this is the intended implementation? If not 
> then we can be use BUG_ON("unimplemented")?
yes, we will use BUG_ON("unimplemented").
>
> Also...
>
>> +#else
>>   #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
>>   #define is_xen_heap_mfn(mfn) ({                                 \
>>       unsigned long mfn_ = mfn_x(mfn);                            \
>>       (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
>>        mfn_ < mfn_x(directmap_mfn_end));                          \
>>   })
>> +#endif
>
> ... is the implementation will be similar to is_xen_heap_page() for MMU?
>
>>   #else
>>   #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>>   #define is_xen_heap_mfn(mfn) \
>
- Ayan
> Cheers,
>

