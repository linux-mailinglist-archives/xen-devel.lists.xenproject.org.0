Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EFA575B0
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 00:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905425.1313257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqgip-0002To-T9; Fri, 07 Mar 2025 23:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905425.1313257; Fri, 07 Mar 2025 23:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqgip-0002RP-QU; Fri, 07 Mar 2025 23:03:15 +0000
Received: by outflank-mailman (input) for mailman id 905425;
 Fri, 07 Mar 2025 23:03:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0EBm=V2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqgin-0002RH-W7
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 23:03:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2418::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56e67355-fba8-11ef-9898-31a8f345e629;
 Sat, 08 Mar 2025 00:03:11 +0100 (CET)
Received: from CH0PR03CA0375.namprd03.prod.outlook.com (2603:10b6:610:119::25)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 23:03:06 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::1c) by CH0PR03CA0375.outlook.office365.com
 (2603:10b6:610:119::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Fri,
 7 Mar 2025 23:03:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Fri, 7 Mar 2025 23:03:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 17:03:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 17:03:04 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 7 Mar 2025 17:03:04 -0600
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
X-Inumbo-ID: 56e67355-fba8-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NilQcwJYb+Fl9DaedUMtzseYpxqk0EhXBgwHxmDdrPQGWFcLudSNCyqoti41sLXDnJ0ZepBY2cth/yyyfax4LwMQIF1M86h0VOCFOGKXYPs6MYtC7WVgFErrOJ9c88WPY/RnWouTEEqEihxUyzz608/m2NK9pLVES2HLLwm059tQF+Oq0NDz+Kw13DQKdQ2Pxl0ujT48BiWo2kXktWeyaKLvgHE7kJaTyZOIVGv+lFWAO0HaA78tKbNHmcRtt/qBfDv9Xbtntw6sLZZKL76I+Hd2m1h4BpQiLucqqXVd76hu5EPEIXpivLQKjMPQnIz4u1jW1YLi0wcx0DTZ3dW87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6tZ2CA7CUC1O78q4dZoymsDPoHQJYfLwg+gZK+FlnY=;
 b=QM16uLRdWagdryyp5tFZDNLM+4ZShiqO4IByX0mQV31BRuPd7zs1oo6nnzPhjSLmFeP+B8Ui37AwE48FB3pfsUskJ1LR5Z8WgtURRTCiV8FXAU8G5cgNwHoAjtaqs2JASajxs8EgAErgnVtANpn2w75iJcGt3wzYonNC/iKZs3inEvO3Y6jVp+ggzTXhT/mSU16bLUjyMM5FUHUG6PdDzWt0/cYdA4Hrc/HpJwuIcqpyk1udlip+YCeGFecjPkGiinN1TJjquqd7auUyWPYmr06FEjaI/agebIBtikwTCYv18gvT25jJp6fPdcCM0PmnHYp5/ZxHZ8yDwqZqlX8a/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6tZ2CA7CUC1O78q4dZoymsDPoHQJYfLwg+gZK+FlnY=;
 b=uHk7rGt1zGO+K2/iTSEMOhyn8RckUGon7C5wUc3QH8Lv7Rf53GPy0TsCz76Fz5BjnhH2U3lvuO+2+xYZUVOSuoSuozaDrAZuTsaGYgH+F2evaT6jsAkvybMi8X+Q2vcFccPtqTO2Vpjb8MgcGKv4dP5klz9fTPsQBLQ7KPKSKrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d002aef4-3511-4e9b-8ff2-34bb268d9d7d@amd.com>
Date: Fri, 7 Mar 2025 18:03:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
 <4c66ad14-9a30-48e5-aae1-49f61efaaf67@xen.org>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4c66ad14-9a30-48e5-aae1-49f61efaaf67@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: cd080311-2a96-48fe-79d6-08dd5dcc3839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkMzRFBqelY1SngvdWR0TlIxRGsrSDlkVzN1SEpxTFpWdFRUUVF1b1hORWNI?=
 =?utf-8?B?blhERmdvdkgrZTltdUp1TUVLa2puNENUUUJqbnlwb2dPcjVkaTAwZTE3dk0y?=
 =?utf-8?B?eUQ2R0RURjBpUUNzRThXeHo5SzBWc1E2cWZleTNEcEtCT2FQNVJiMXUyR1pa?=
 =?utf-8?B?REdiTWJsNEJLQ0crSWdaU1FFT0lYdVovOU9QWExrcDBtd1hqOThrS1FuSkhK?=
 =?utf-8?B?bWl1NjBSNVVNZExrdDZvUzVPVjFhY1ZyUVZGaTB4Z3EyRGNOdjduWWN5ZGVx?=
 =?utf-8?B?NFJ5b0tvT2tMTkVXRjBaMGo0bFNkL2dKWlc1QytQbXFRTzNVVFBsditZZTRX?=
 =?utf-8?B?RmowWHY2dmhNcElsaStuSkZNcUFBRDU2blNJandMSGFrc05MamxzTklqM1d3?=
 =?utf-8?B?ckVWOWZJMTFuM3g3Z1piaEFSYjFFaTd6dFE4cDRvdDV1WFU2dGg1dzFzaDVn?=
 =?utf-8?B?cEpiWkZSbUlhZDk5YzRhYm5GT1Ivb2c1R0hUUzRVZ2xKd1pOWGRvdnFtK2li?=
 =?utf-8?B?V09EM2w2ZnR5dnhjSEM4NGlxNk9TS0VEcEQvQVFaLzd6SGlQNU9nRUk2MUxu?=
 =?utf-8?B?VFUvMXZDNHlRUnA5OVQvekNKTXUxMDB0bU1nODRRc0FNaUNncXFyQjVNYWpr?=
 =?utf-8?B?UHViS0FNYVlkeFNNYzJBY2J6RG5obTR4cThJQXB2eGJjT3pBNkRqMUtXRU9u?=
 =?utf-8?B?dHRkMVROcWRRWHJSRkZxaENFWnY0SlM0VUlpQlQrTXFBbllMcW9Bd0JScFB5?=
 =?utf-8?B?UzdmaFB3Y2dDak1jMUhQQ3BzVm1qT1J6QjVsNWUvRVgwSXIzWXBYQ3dKL0s5?=
 =?utf-8?B?aVA4UWpKcndabFpmUmZ0U0NOMElsY0pCTjFaMUxCbm5rd09aRkNpQ0EybHlx?=
 =?utf-8?B?MG5yWWF2bjZTNzVJNHJEbmlqTGhzcXdKQVAzWFpNbnRVd3RhaXo5UEE1MUM3?=
 =?utf-8?B?VHdzKzVtUUJldmdGcHNMd0VCdm96MkExZnlJbzNLVVcxSjF3Z3lNeENMUmRt?=
 =?utf-8?B?QXJHQTZNQmxnVXR5Y3hlM1NRM3JHbWtKd3Bvd3ViVHRJdTc0TnBiUUh6VFZT?=
 =?utf-8?B?WHo1bmx2Rjd6TVN0UmFqR1RrclhRQzJKMUhRdWh3NHF4ZUdzenV4SnI4aktu?=
 =?utf-8?B?RUNLOCtsYm00Nmp4TzltSDRud1REeVhLNmtjVTNrMGIyaFpuMFpkUFhKWldI?=
 =?utf-8?B?QVd6L1VSOVREOTFzY0VyQXBPd2VZZkw0Mm9iNHdOQnJ2WFlIQnVwVCtHbStE?=
 =?utf-8?B?cGJWMlRBSkgwSzE1UlhIUEpFSmJ5MVdqYUFsSUR4MHhJZjZCTlJkaVZCWnRT?=
 =?utf-8?B?RkF2ODA3MXBFZFpSeGRlaUlmTHRWYXJucU9MUFRJNVh1dHAvY05VT0c0elRU?=
 =?utf-8?B?SW4vbzJOOTNhYUFkNDhPSmZSVG1qaFVpWS9MQTE1MnU5WVZtMmRlTWhkYkVj?=
 =?utf-8?B?eWgvaTh2Ri95U2VUOU1xenoxUTRQczhudUtqM0RycDNNMG9iNUdDbG9NbVVY?=
 =?utf-8?B?dm5xK0hVeW5JcUNEWkJCUEExRTV2bEw1R04yd2htTkhFNmNsZHEva1ZuUVky?=
 =?utf-8?B?bXY5WGx5czdMTDRrVlJ5elV5M00wd25MU29VZlNzS2k2OUZEVEF6bmFqWDlk?=
 =?utf-8?B?dkhXWFU1cEZWaWc2WWdEWWNhTStHd0dnbE9iMVlCRzR5VXl6aDluZVd4eVMy?=
 =?utf-8?B?YjJMWno1YlFCUUErWlRtWWJXZjJVWmdLR2ZjZWRNZHJtODBjcmYwU3Z1TFJW?=
 =?utf-8?B?dlpCeGF1UmJXbkY4Z05pMndZd1ZFRU1vUTM4REw0WXdCMjgvOGJ4cTREenZi?=
 =?utf-8?B?L1lrMjd2NDNtVFlxL1BidkJIY1FLUi94enRTTzRTSWtRbzMyY0VjcmpTRmV1?=
 =?utf-8?B?M3V6KzNGN3Y3N0xZbnZRSUxWU2FoMm1Ybjc4b2tmbFY2YUw1YXdrWnVOZDRS?=
 =?utf-8?B?OTVncDlzbjNiVThtaXZEVlhmeC9jTTdXOUg5cmFJTjFuV1NWUnJ6U2IyNlBz?=
 =?utf-8?B?Y2o5d2dNcEJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 23:03:05.3543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd080311-2a96-48fe-79d6-08dd5dcc3839
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600

On 2025-03-07 16:24, Julien Grall wrote:
> Hi,
> 
> On 06/03/2025 22:03, Jason Andryuk wrote:
>> With a split hardware and control domain, the control domain may still
>> want and xenstore access.  Currently this relies on init-dom0less to
>> seed the grants.  This is problematic since we don't want hardware
>> domain to be able to map the control domain's resources.  Instead have
>> the hypervisor see the grant table entry.  The grant is then accessible
>> as normal.
> 
> I am probably missing something, but why would run xenstored in the 
> hardware domain rather than the control domain? Isn't xenstored more 
> related to the VM management than HW?

I addressed this in my other email.  You're probably right that 
xenstored should run in control, but implementation details prevent that 
in the short term.

Regardless, of the xenstored placement, I think it's a better design for 
Xen to seed the grants.  With Xen allocating the xenstore page and event 
channel, and now seeding the grant table, they can just be used.  A 
xenstore stubdom can just establish all the connections without relying 
on another domain to perform an action.

I tested that with hyperlaunching the xenstore stubdom.  That is where 
the two XS_PRIV changes later in the series come from.  xenstore stubdom 
iterates the domains, reads the hvm_param for the event channel, and 
then runs introduce to set up the connection.

Regards,
Jason

