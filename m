Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33707AA13F1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 19:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972935.1361198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9oUE-0006Jp-5P; Tue, 29 Apr 2025 17:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972935.1361198; Tue, 29 Apr 2025 17:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9oUE-0006Gq-2K; Tue, 29 Apr 2025 17:11:14 +0000
Received: by outflank-mailman (input) for mailman id 972935;
 Tue, 29 Apr 2025 17:11:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r0hc=XP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u9oUD-0005Vm-4T
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 17:11:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2415::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f04096da-251c-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 19:11:08 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 17:11:04 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 17:11:03 +0000
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
X-Inumbo-ID: f04096da-251c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa6QHLgz23AZ8lxupkoS5UYg8JVVxSWEpsAd1ZBSz2V4+oDhyySqGKLSpSDpsGRFSGGa6dxihwYXeW4I66jFfUXueNSY7PShrWVvUAHhfZ3jK3Fjn5sk9/oQ3ArawLb2UJWIGgD3V4uch3s1+1ZKtTqfeI+CgHkG+qBRhgUTtSebAxv00rKN5FvdHGTd+iWJAzsESqlk4zT1mOXgvT2QKe7VRxEFwuw1/CzaVnPwo4Q1iCqFlY9ZompQoU30w02rCC2eGJL6BOv7eiCAAKzdqsJaF8kOpIufUYcYWTgOXWjq5SndMDfsFJlcjOXlgoK29GsjV3l2kdjkzlzLtPbokw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd2LDbDW2HMjGdIZYsGPKnlRJMWngP020+yceTnodD8=;
 b=aXaUMhVRW+qbUqx+ZnOvzi7XFbA4yFnMg91RLEjH7FnSAVomBfQP1lB6LtFSUn8+ch/rqZMr5gAwXehB9zhMZmd1x5WiGD3H8dOGvufeKKBf8lGzQkSrkwX1KHIzqVVcoHsCRqlk7Ul8Vf9jZi64j4+VsQdhd70+TJ9RfSzF5+gISiYEliIwRG3K/V8925wk9sgAH0a66sDFKIeGddPqbCIng9Y2PIov5+DM0uTe3MayaOjCvjnXEtccx80twIP57k1HbujQT7nZQbZM0l3SmCtym7/n/0TAdpKBuwq9cNVqDY3yFCa7ytu/70IsGn2DRb3AIvtxDliPEuoAk725kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xd2LDbDW2HMjGdIZYsGPKnlRJMWngP020+yceTnodD8=;
 b=SzM5HPR/f1u5XU6qWA6kd/P1R3tbsmInYrX3saz+s5mglIoZk/IGVo2EuAceX8o3OxFup6LEjBvGGVi5c9JT7PE1i4WrqUsyCsb5liz5nsqijzxU2UYkfFj9oGHA7FW/xOtvjqn7Z1csY0uyR2A5VxVpSTYsHC8W2eve/wVXoGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2186ab44-eb9a-48f2-9798-c5711349d2dc@amd.com>
Date: Tue, 29 Apr 2025 18:11:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250429152057.2380536-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:10:110::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9ce136-978c-4633-d2ee-08dd8740d27f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDN6MUJ6WFpYOXJFZUt4czVBSnRsTlk1bGxZc0Jua293ck1FQ0ZrS1VLcm0y?=
 =?utf-8?B?eHhnb2c4aEV0YnVoTk56V0oxYlM0MkNUNm9rMlNtZ1hqbG8wRlhjOGI3akZh?=
 =?utf-8?B?cEcxeWtNSkptcEY1TmpQQ3BuTnhWaU9UWWNPZG5RaUhhTXVQWFJGblFJb3Fk?=
 =?utf-8?B?TGRJcGZZTWRLb0dzQ2h5UHIrUGdqTjF1YVVoM0p5ZVdjY2pxeUlkTGdtdTFo?=
 =?utf-8?B?MG5FR0FMYi8xckoxVndPd2J5Q2ZiZU5hRmI5dkxnQnJ6Yjhab2xPTXpoVzRn?=
 =?utf-8?B?U3pyV2pGMkdBZ01wWmpGcEZGRnR3SFBqWEpPT25kSFovQkhtR3djRUdmZFNB?=
 =?utf-8?B?WVg3NTRSZlZVYXVpYVNNc2d6dUk0bEk2UlQ5NFdtRkFBS3orcm1rZHY4Yys1?=
 =?utf-8?B?Zkk4S1g4YXV2Qk92YW1vcjNsR3k2Rm5MclYwSUtWZkwwYkpGNGFmZUoxKzQ1?=
 =?utf-8?B?VEhiQk9Vekd3OEI4QUpibUNsYjBMenJ2ZjkxK09UUkwyQk9PR1hISU1VK3BU?=
 =?utf-8?B?bzJHbURTOWdaVW5WWnYxQkJCWHduVGpWbW5FRkp4WVdSQXFaRWgrVE1wOGEw?=
 =?utf-8?B?WFJEbWdGWnhjMlRxcHVmdngwaEpyeEpHS05OK0hEWEdHekMrVDk3c0NDSjYw?=
 =?utf-8?B?M3grNUh3UmFpbkp1aXZ3Y2l6c0t2SXRMRkc1SlJZOWh4eHFVQlJlTkswS3Vz?=
 =?utf-8?B?U2tscWRxaVZmQmkxaWNTcGU3NEZwM2xxQ2FqL0VJZ1pmU0pveGp1N0FwMDVy?=
 =?utf-8?B?eEE0b2pUdS95dUI3SlJkTktXMXJDMjR1YldNMUNZUURJdjArN21pVWh2a1k1?=
 =?utf-8?B?WE1obkxXN2lHcUtjelhZb0xvbDNlVjRrV0h5b3pjRGlQR0FuR2c1bmw5eGt6?=
 =?utf-8?B?OUNhRlVheWlHWVVaMi9rMDRBMzBGU1NGRTRwR2NzUmcrb2VQK3lkTUVnS1BK?=
 =?utf-8?B?UWRoa0NXRWVybnR6cmZ1WWNPNVcvWldWTExZV090Z3c5ZjU3U1duNU1SQWNp?=
 =?utf-8?B?OXpWMExDYWw0Z24rWUlyOURJdXV6NVE5UFZ3TVc3QlhpeWtPMnlPSGw5bCtR?=
 =?utf-8?B?bzkxMURHbE5LRnEwV0ordm5pdytYZEkxVk1nczRIQmhCb3BZUjJ2MlhTUEJt?=
 =?utf-8?B?VXFhU0NEWDliT1pCY0xjOHpNZE5tTFdaVFlrQkk2ZFBFanJ6a0lVY28zbGgr?=
 =?utf-8?B?N0FtcGZ3R21OMDZiVXI2MjFCYjhkRDBxOUxZcHRySUNQMEIrTlNyaTZxSFpn?=
 =?utf-8?B?ajlzK0tPbjVreDJzQXAvVzdCdTNJVGFtUVhoekNZNFlsMUJqd2pzSWlETmNX?=
 =?utf-8?B?bCs0MEdIZjQ5dkNHWHBCS1ZCeUlSdU10RjJhbDJYYk9zdzV6V2lkWU1XWHR1?=
 =?utf-8?B?RFZpajBRK2daMXB0MVptUGpVb2JNWVF6NDMrWGhtQURvc25BczdxSzd5OGsy?=
 =?utf-8?B?VmxiSTlyTTR1YVc1bjVKeXNrNldqVHE1M0dHUVVSRUFxWm5lR2ltZ2JnWUtB?=
 =?utf-8?B?N3RPdS9RMGlkTldCd2hXNkg2OUN4QklIcTQvUG52Umd5M29YeVBiQkw2NEU1?=
 =?utf-8?B?bU9iN0w2emlTeWxEaUpBZVZIazBKRXFzOGx5ZGdGTlg3RkRYbXpiaEx2SU41?=
 =?utf-8?B?YmVDcGFvU2oraVJSdlRXQ1N5RUxCeGQ2c0lZblRpeVAvcnQ1Qm00d21jWjJo?=
 =?utf-8?B?RWpkdXdJZFQ1WUdTWnRxRVl5ek5xU3dSQnJUR1NVZmFLemFJZlR5WjltVmZa?=
 =?utf-8?B?YkNCcU5UMjhXZnkvYitxaS9vQm5HYW81VkdsVzEySXVnQmV6bXhMN1IyN3BC?=
 =?utf-8?B?aUo3NWVoWE1QZk1oT1R0Nkl3eTNoSEkxY0hhNTY0TDVCZkYyRktJVTZyODNQ?=
 =?utf-8?B?R1RVc2Q0K2JnUmV5WkpRZUlwa3gwSDdKOEhKOCtZQ29sVUR5djAzc0k3d3dz?=
 =?utf-8?Q?3EU0WWpLnE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2JUdEpsNnhJTVUrUXRyQkhlaUF6enRzQXN3c3VJTzJjK0owZmNhSHBzWXNL?=
 =?utf-8?B?MUJRY2JTRjRIZlF2bWFFVU1teWtqeXpveC9TYXZIVDZ3VXdhbmlsdHRLYnNs?=
 =?utf-8?B?Q0luNjRjaGd4OWZuRmJQZW5XeFg3NEJFN0hZdHNsWnMzNGxjV1h0TE13c3Iy?=
 =?utf-8?B?TVdVTlE4OVl3cGhXaWVOeDBEeEwzUTNRc3VkNXJuRXpmQUFNV0xMVmhMWGt3?=
 =?utf-8?B?eHB0RkxGVUNoRWN4dlk1R1VTT2REdTJ1Ry9kLzVIelNJZGlHQmFxMWxWd1Er?=
 =?utf-8?B?R2RmUXZGTlJXZENydXRXczZqYWpXdVpSL1l0SXJpZFJsUERLK1dYVXpzcmR2?=
 =?utf-8?B?ZDhTYnVOY0lTTmtBNjJDUGVXZktydlNOSVR2M1VWdXphRjBKVm9oMlFwbXpQ?=
 =?utf-8?B?dEdlUXRPOSt6Sjd1dktPeTAyL1VWR1RxSURWNTc4LzhCOFIwMXRTQ1gzRzlH?=
 =?utf-8?B?RmkyejVWMGFrNkhMQ3FhR09WZXY0cFlWMlFZaUR6TW5iOXN0RGZHY3JUWG52?=
 =?utf-8?B?a0JTOVpKVlVndjlRTDJCMDBYRWhkQ0xWNXVJakE0ZjBjNHdhU3pmWDFCN0V3?=
 =?utf-8?B?VnZnL3RLYkw3S29EV2dmSXFveDZjRlpnYWJhblNkUWF2MjQxZFlIM0xKbGNx?=
 =?utf-8?B?d3lmaUpsa29RK1lUWkt1SEJ4UmJjUFB2YUI2MWJ2QktxTkhINm50NHRkeUh3?=
 =?utf-8?B?SkdLUEFRWGxSbnF0YlhQeVJ2eTBnZ0dXYW9zSDVsbnZQMVA5S090S0JzNDBC?=
 =?utf-8?B?MUNTZFRIK2s1MzI3MDU3QzlMeWtKM0g5MmhkQzZZM3pjTi8veXBKUnF6TVMw?=
 =?utf-8?B?YklwWXljSTFRZmNoaDVUeUQwVlk4ZGRNOGd1aFVkRVZnb2pTQmR0UXJQbmlk?=
 =?utf-8?B?V3E5VTR3RExLdGNJU1FvUU5mTWVhWXFySDZqU09sQXNod2NoUFhzaFJDOGFv?=
 =?utf-8?B?dGN2TnFxaDE4VVlINzczZE05WHprVCtWT3F5T3ZVa2d0YllINFpKUUcxN3JT?=
 =?utf-8?B?NkFzWllZNFRuWS9KOHJUMTVJNUNjTCthbkd1bXVYVVpGSXE5NVJOUlVlOVRn?=
 =?utf-8?B?cW9HazMxQno0eHhaV01VQXN3ODB1SWFzb2FzOTVYbkYwKzdVSnB3c0pJZDRW?=
 =?utf-8?B?bWdjclpoT01oY25JcXZKcmdEb3dOa3djOS9obExDbVZqa1ZKMFpNeW1UaTV4?=
 =?utf-8?B?ak40dWF2UFg0UFUwcGI5Y3FDWmwrWVRZdlJXa3BNNUVXZXNmQWhnN0dpd0V2?=
 =?utf-8?B?NlRHTmRyYkIwdlVqV1JUUlFKNTZYNGlzVzVSckFqcG1zZWJiazkyVFd4VWpz?=
 =?utf-8?B?Y3orTk9PVFNxOUJwazZlUzhJODdRekFmdFFueVZZSmNIS1Rxei9Ta09wQ1Q3?=
 =?utf-8?B?elJoQTYwd1lOaER0YkJ6M084cStnaEJTZ1UySzBxZTRwU1k2ZTBFV01vZlNX?=
 =?utf-8?B?Vnd5ZDEvaDAvWkhCQXJYZ0crZ1JKS1A3MTlnNU9BeTBlZWk5Q3JNaDJuOU9u?=
 =?utf-8?B?RDJBTjBxWnN0R1hZT2lEbHFNTTNMZFJ1elpxVXJMQnJ6Qjl3RVJ0OEFqR3Jq?=
 =?utf-8?B?bTNLa042Slp0MURCWlpQVXMzeVZzODMvMnRaSmVYV3cyUm5keFkrVDVjUWlJ?=
 =?utf-8?B?VHIzUVZtQ3V0RmRXRDAxZmhES1Q2YXlMNTF0SFFneFA4USt6TmhGelVEbFRN?=
 =?utf-8?B?bXh6d1lkSWRlbnJPZlZ6VG5ZaG53aVplWW92NHg3NEQ4dFBwL0FTemYvV2M4?=
 =?utf-8?B?N0NlQ284MFZkNWxZbGhEZ0hzVUt6bDdRNmE5TGk2Q3c2cGpTQWl6TnhzdXRX?=
 =?utf-8?B?REtiYmZwQUgxTk1IK1laSjZLVERFVkFuajJLZ1pTb1lUTUVjQ2t1Mk1nakdm?=
 =?utf-8?B?OVRTYlhYNlpweUxZZEMvL0YrTFUxQU0zNXByNW1OeGJFbURBYnp0YnM0Umpx?=
 =?utf-8?B?cEFtQk00eHlaY0hiSUZUU1ZsTzhaUmxOMmUvWnZKVlJqTkNBSWpXRXBKWEFJ?=
 =?utf-8?B?SmU5b3VjOEY2SngvVE44U3hzNVBXcFJ3NnRiTC93T05PWkRCTlVyd2wzRnJy?=
 =?utf-8?B?WUVuZG1HWEZ3WkNHMnVhcGJpUXdKTjRWTkdaa21ZaFl6RW55MnB5Y1FRL2pj?=
 =?utf-8?Q?4QP1bNtZ1g7zGzzVu03OWCyQp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9ce136-978c-4633-d2ee-08dd8740d27f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:11:03.8712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Hdrgfppa1aDagzHQ2AzC6oVCMWpBC7dS8d0iJ2vVIVCRLoiAnmu8Dx7ZGu81Jz7EDfRmkaA4jfsAvUVPuSDyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

Hi Luca,

On 29/04/2025 16:20, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Document the requirement needed to boot Xen on Armv8-R platforms.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> v4 changes:
>   - New patch
> ---
>   docs/misc/arm/booting.txt | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..719af74f1e69 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>
>   * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>
> +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, hence the
> +above requirements need to be adjusted to this case:
> +
> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on Arm32.
> +
> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
> +  SCTLR_EL2.C set to 0).
>
>   [1] linux/Documentation/arm/booting.rst
>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
> --
> 2.34.1
>
- Ayan

