Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B12AE5E78
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:51:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023258.1399207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyR0-0004JH-Dr; Tue, 24 Jun 2025 07:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023258.1399207; Tue, 24 Jun 2025 07:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyR0-0004Gq-Af; Tue, 24 Jun 2025 07:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1023258;
 Tue, 24 Jun 2025 07:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDMB=ZH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uTyQy-0004Dw-M3
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:51:12 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2417::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9467407-50cf-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:51:03 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Tue, 24 Jun
 2025 07:51:00 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 07:51:00 +0000
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
X-Inumbo-ID: f9467407-50cf-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FS9icDnXNoaOjAFAr6UtYY67iCKnkJiE9O9M7HRDB7sFSY7kSKQ0dqexq0C6qxrh2aZ5Hmh4EX3oIkU9F1vE8lVbRxR5uRV/UxoBpHuTvTbnFV+JmsM8DCoyDFqb4GlaXqS1RwH8haPWj1+D+Ooly9hUlr+IE479ae0XNYQ3poB1Qq3onfDcfl2n3YdP121tC+CerKKEae5oW0mcwHEzmAEE3dAHmKqIaQ2tpiGgoJfmXUVl5Ovw1WEx2BpwU6Ugu4i9cEsogSNkxPzvjZnOh9NE7v88r4tKT6Fo+AOd/AtF3E5LeS30aiBIX6bQeve/yPjciH/jZeztLkxDxNtX1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VWDtRws4wrWqUa64cyzxkSJG3FdUSmAv16KbKWqihU=;
 b=JId3wbYeRGWDbqPTZzEObquXAuIQOCIr2mSyx63RtbDwRV7gQGDBLJ/ugBxxNyGXbntbvjRg4amkjfnJ0PUyVo3Ea5YGcdY4TEgTwzfiN5V/HXaE7YJW6PXgWgM1haVTFGPe2BdrIPiSU5h+T4a0E9mwfkmEiKwC6G7Y+4IEGm4bp6pBfJgnluVwMHqTpN3E35f9Tp0eoG1o7Oopnvx/MGHjYpeEaRPSxT5MLitzWaSeztfIebeAIaObQBjfVTNM8fHRlxcG0z1vuXFgzMMIBMtokwLPAonG73tyaTrHRh6bnE/1rjdTDNDK9IE6JtITekrp/lbrnhRfmO19vghC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VWDtRws4wrWqUa64cyzxkSJG3FdUSmAv16KbKWqihU=;
 b=GCQf+4+KI1qNcR8j/wqx//znJuPKheXP73Vq/WvmKFDWTER80CyF+y5vv76C4dlAtfmjK3yd/XqRd0MoaCYQyIt1G2nMKji9dnQ+nqNGMXZ01fZ6HfFX11rV3+odtTz9d8arH7O2eOW6U6QP0UUeXgPrJjmAyE2UJZ5EwLAV2Ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0cfc9465-90d5-46db-88a7-ed47d0809b60@amd.com>
Date: Tue, 24 Jun 2025 09:50:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/16] arm/vpl011: use raw
 spin_lock_{irqrestore,irqsave}
To: Jan Beulich <jbeulich@suse.com>, dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-5-dmukhin@ford.com>
 <08cb7878-fad7-47f4-9c91-5f866c54b1df@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <08cb7878-fad7-47f4-9c91-5f866c54b1df@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e23ca54-2b20-4d71-9d8f-08ddb2f3dc3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0tudFlrem1GcGY4cy9aT3VoQ2U3QnczN1ZXU3lXeTFibmswYlRwd1dQWnZ6?=
 =?utf-8?B?R2hta2g4aDNNQk8xM3pHa0daYlJKSTJ6bjI5WHNnVzRPZXNrUzVKN3VlWlRz?=
 =?utf-8?B?UyswR3ZSMmx6cmlHcDc3aXIzTnRXdWtwalJnM3pXMHJSYmt1UG84ZVJMZkxC?=
 =?utf-8?B?aWRTNExZenFna25VLzdHWURlN2paRC9TbXE1Um90Zjl3Z0h5c0hjN1JxcXB3?=
 =?utf-8?B?Tkt3eWJJTVE3UW8ySGNiVWdxcDRiSTJ5dlZwNTRweDBwQk9Vc1ljWTBoNWxK?=
 =?utf-8?B?UmtHdFBvb1Z5SUJNdlIveTFLOGs5amg1aGkzdURhN0tOd3pOaFgrV2lwK0VQ?=
 =?utf-8?B?dWQ0Z2hHL1FyVjhwY2YzbGF0NDlXRGxXc1FYdXB3Y0xBNVptaXBxNk1yWlBR?=
 =?utf-8?B?NUFGcXYwYVFnNGo5Y0ZrTDcxRUVtMFQ3LzdJNWJuMExQdy9pZFZUVzZXUU1s?=
 =?utf-8?B?K21WRStTZnl0Z1NUT3ZGWExkdVlsRnhhN3FEUXV3NGtDRjdOakw2cll4K2FD?=
 =?utf-8?B?dXIvT2Z2YVZFREk1RGF5UnNSeVNxcnlzcC85dzBoVUZjUXVrZ2ZPTXJpZTJP?=
 =?utf-8?B?OXdhZlpGSGMrbm9TYmtHUHpMREc1NTd3TVh5Z0JWdXQwZUlqZWR2NXdQei8x?=
 =?utf-8?B?T1RMU3dsOHg0Ykc4aGJWdXpBUWlJV2trRm92ZmNDSWhCWmU4NmUzR3NML2xa?=
 =?utf-8?B?VFNoUlNKU0Z5Rk9NYVRPRjBWRXdSY3A0TU5SV0Iya1JrbFM5TmhFOTJ4Ry9M?=
 =?utf-8?B?Vnlab2tNS1lieTArS1N2SHgyZWRZVXdaSWZ2VnNOTVlXN24zMzgrVlBMcmZT?=
 =?utf-8?B?eDFPYjJSSjV2YXlHUTZnSVhxSXVMcG1LdnBaaXh2cklEZlN1V3NlY1plM2w4?=
 =?utf-8?B?ZmZCelJaZjEzU1EreDNxd0NFNkpLeHM1dUN6Y3RrL3ltcUx0RGxOMmVRRExr?=
 =?utf-8?B?OVU0a0pORnVXVU50TWQrSUl0WlY1SkNGV0VHRWs2ckZrRnFONENMbFJ4aUtx?=
 =?utf-8?B?Sm53cXhZc09EV1NZcngzQmNoQkxLSnVBamF6a3U0cjVmSk1LTXlERVZxcCs1?=
 =?utf-8?B?UmtFSjhnbjF4eWlxNDZKQXY4Qy9NKzltQVFuQ3dpZ2lieTRQVWhFc0FiNFI1?=
 =?utf-8?B?SkVWMUlnUFhrUUNqWGJrQmR5Wi9TZm1zdUZEL0s5ekZLZ3FZdW1QUUJJQlg0?=
 =?utf-8?B?RU11dEVvbzhLN0tGcHdNZHVJNW1WajdEc1habXdYdFZ3bkpWb0JOOUlWYUlZ?=
 =?utf-8?B?aG9EM2pmTlBmZWVkVVdWZGVzME1CUmU2bTRYZ3dJWSswWE9YQUZLclNURDhY?=
 =?utf-8?B?Z3ZVNTcvL3p1cHdIaWJKNnN2QVlnMnNXMmhDVUV4WHdlYWRLR3N6RjlUWEdE?=
 =?utf-8?B?d3p1NHBzdVJXNFJXQWxxLzROdjN4WHdqbzZsNVBqRy84UmwrNTkyVU5oeks4?=
 =?utf-8?B?TWVOdFlKU1RlSlVKaWI2ZVB3bUF4R1NoR3Jld2JjbHl1OGhoamVxMEtid1ZY?=
 =?utf-8?B?KzdXdWpyZ0RIUzczQk9ZQnBWMjVxdC9JNVM5MlRKb0dNQ0FCZVVOSmEyeWtT?=
 =?utf-8?B?SjZ5dVFUQnpEQVZ5RTNaM3R4REp2L0JPZkVHTTdlYmFxR3NhL1Nrdjlra25a?=
 =?utf-8?B?ZE8zemVsMUZBV1haR3pnWlFqeWRXUnJNSTA5bitOSUozL3dmNFRrOUIxdXp6?=
 =?utf-8?B?VkxzdjNkeDJiSHZzYlJlbXN2ckJvTEpsWGh3MEhLcVlTWWNSZi8xaElxOEVK?=
 =?utf-8?B?cHpiTWc3RXdZTHpETE91RGhoRkQ3cjFmeC9NMkRQcFcrVWpVZm81RkN0WW56?=
 =?utf-8?B?OGIrMGMra08wSWVnbWtuOG41UzZoelRsbEs5WHJ0dmMxYnpId2NCZGFwTUVM?=
 =?utf-8?B?RzRaak02L2M4NUgrb09yOXN0aWVRekhYajBIVks0NVFpVXNOTlIvV0pyWEdF?=
 =?utf-8?Q?eE+Cp8CJ4ZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2RFYzVCMzdRNThXT0ozK08vdWhSQ0ZpVkpJZTlLaTc2ZGhQdjd2RHNma0E4?=
 =?utf-8?B?bFZZcVlDMmVVTVE3Y2EzRG9zK1Q3UzdkNzhBTnFxR0J3VTNKR0RGSDg5Wjhu?=
 =?utf-8?B?UTMyb2c2ZGpNeURiVXkwcHhWUWppSEpUSVV5cVBHT21zY1Jsd1lMQXBURlcw?=
 =?utf-8?B?TEsvRklTWE0rblNBc01DUU5XZ0RLNW91U0N2UGtFNUx2NmtyblpFbTFrVFls?=
 =?utf-8?B?czFJdTlYMDkwR2lsc1BkWUJyczdWUi91SXVPZXNKRWExZHJzVzhzK0k5Mi95?=
 =?utf-8?B?enVzcHZod25lK25mKzA1czhIdVU4Z2FZbEpjQ3k5N0FNRS9YN1locjYyVWV2?=
 =?utf-8?B?Z2lMWnExWCtJMzVEM2c5eHNIM2RWcjdHRjRGZG5CRTYxeFZWQkFQWmppQ1E4?=
 =?utf-8?B?QjJRMTQ3T0djZ2lMTGRaRzFmMlhNRVBrcmNNLzdMYm9YYndmZlhtM0JYMkhO?=
 =?utf-8?B?UmZLSkZ3YWJLbmpvVklmQXpvNjJGM3dEY1RpOC9YeUpzTElnUFFHYUxiRHZM?=
 =?utf-8?B?S1lxVTEwMGpkZ2R5V3R5a2ZVdGx5bktSVlFpWmRqRG5uajlqd212Zk9DSE5y?=
 =?utf-8?B?R252NGtZWlJTQWtkVWtPSE1VQ1kxbmMyak9FT3hreDlKZEJFR1AzVDZuaG1I?=
 =?utf-8?B?Mnl4Z2NWTXZHUnl2M3kySC9DTFoyZll4dFJpRzErWmZKblI0bGNZZFkxSjNS?=
 =?utf-8?B?VmVKaUEwOElqT2tmMkNZdmF0anZOWENHQnhGR1VEa3lQU0F3Y3BQS0tEUzRK?=
 =?utf-8?B?dlFqVGpvV1B6Vmxzd0xVaW1tR2oxblJPclNPSWY4bjdyUnlkblAxM2p1dGdz?=
 =?utf-8?B?clV4SWZaNWhxekJtWFhPMkZXNXIxV01oMUVHR0lCbXJLcnV3a2ExMnhBWkJX?=
 =?utf-8?B?cmlkUFNHVzZodXlJQ040b1ZpTG1UNW8vU0E5WGJMOUtYZWM5VXAwc0JEVm1t?=
 =?utf-8?B?dzA1Q2pIVnN1d2lROHJETTZmbzFnYnpWbzBuOTFxcW1pWmhWOTJLdDBHYWdG?=
 =?utf-8?B?aCtmT0JpUEJlUXJld1N2Y090YlgxWlJQQldyalpubXM1aVRXNHQ2WGpyeS9R?=
 =?utf-8?B?b1VlU05KSlR1YWVtemlZanJSUmNnaG03cm1ma1JYUyt3QXNwVXo1Q1NjTVQ0?=
 =?utf-8?B?Vy95UnRBdEJGd0dqR2VOdHYvKzYxSFMxSUhucSs4TUZmd3VSQnRGa3EzK0NJ?=
 =?utf-8?B?c0dodUJxYVlZMW9JM0lEMFRoU1R1Yis3cmRzZUVhTmRBNnJyaUhiQ05oZVVC?=
 =?utf-8?B?c2tHV3BoU2sycHByR3Z2RzlXblVLOS9pcmd4MjFSMGV3VTdnSnRCY1gyc2pq?=
 =?utf-8?B?NnBNenB3bFh0MGhQNWx5UU9qbGRaSEhkWHlXRUh2R1NSSzVXbUpnS1RpMlhX?=
 =?utf-8?B?RXV0SXpuWXFtUGtiL0hkdG9GanRSMDlkendXQW5LR0N4VjQwQWhsUHpBV0Mx?=
 =?utf-8?B?QUplckhnR0VQN2llUWMvdHN3UTk0Nmc0MHp6VjJhRGwwUFFEV0M1b3VFeVhQ?=
 =?utf-8?B?dy8rNmxITXkwMEhIVTB3QlN4Ylk3MFd6NjlueVVmM05qekRSOXF2S2g5YmQy?=
 =?utf-8?B?Q0k3WFFjUnhhTXFRMjh3ZHl3dDZKOVE1dzRERkZVeVhCcWxkUkZVNDRZSmpp?=
 =?utf-8?B?WjNJQ1R3V1RETnNHcm5HZmFlU3pteHg5TEhTWmU3SlYvbUxVWGlYSDZNVlNn?=
 =?utf-8?B?MG5aTnBORTBqMzRZT3dwb0RyUUZDcmJXZjZGM0FyYTMxUWpVYWxxcjJlR0xw?=
 =?utf-8?B?WmQ3ZFFvQis3TllhYTdjaWxMRGwwRzI3Z2RvRVNYRGVyRGUyWlUvcXpnbTda?=
 =?utf-8?B?Uy93ZmlsNWFlS3ZmbmZ1UjUwNkFXT1VTaHBNd3JpeVRETjVpUENiRnZCVTdK?=
 =?utf-8?B?UmN5QzhmQ01vNy81Ri9tWjVQOXh5QUNXZFZXWXd3SWFtU0NNdFU1ejJubzU0?=
 =?utf-8?B?QUswcDVCQndlTXdVTzU2L3VwMHl4R0txbFRrNGMvMm0zNFVLVGV3VXdKcksz?=
 =?utf-8?B?WHA3ODhndUpTQkhlWk5TRTZHYlFzQ2VSczFZd2hzS3JST1drVFF6TkVxSEp3?=
 =?utf-8?B?M2JoMWNNRWFkdmJ0RUh4eDZmeGN3cDkyUzlDeUJab3oxS2NrTEdSbSs4NXgr?=
 =?utf-8?Q?RG+OGIW0AqwwcB7CHA2DHu0eK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e23ca54-2b20-4d71-9d8f-08ddb2f3dc3c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 07:51:00.0098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2VhBfgOub+ddeENFaz9AB++drIdz+G6c+GoLqwi16h88HBn5gbimRA9BomOynyo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466



On 24/06/2025 07:46, Jan Beulich wrote:
> On 24.06.2025 05:55, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com> 
>>
>> Replace VPL011_{LOCK,UNLOCK} macros with raw spinlock calls to improve
>> readability.
> 
> I'm not an Arm maintainer, so I have limited say here, but: How is this
> improving readability? It better utilizes available local variables, yes,
> so this may be a little bit of an optimization, but otherwise to me this
> looks to rather hamper readability.
I agree with Jan here. I don't think it improves readability, therefore I don't
think such change is needed.

~Michal


