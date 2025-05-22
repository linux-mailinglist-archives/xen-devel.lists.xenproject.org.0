Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36135AC0C30
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 15:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993896.1376995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5aY-0001fJ-Fm; Thu, 22 May 2025 13:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993896.1376995; Thu, 22 May 2025 13:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI5aY-0001df-Cl; Thu, 22 May 2025 13:03:58 +0000
Received: by outflank-mailman (input) for mailman id 993896;
 Thu, 22 May 2025 13:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ayyk=YG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uI5aW-0001dZ-NR
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 13:03:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2415::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35b50dae-370d-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 15:03:53 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 13:03:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 13:03:49 +0000
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
X-Inumbo-ID: 35b50dae-370d-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgd6Jf30CdURN3NEiUE7Xc5EVm4a2VS41mcRvEgKWtIsl3DvrSDYHvRDGyOpqQGHAeUH2LvV49ScvYxMKu/s8RqueROhTqBVdf9BIxBTg37B51qPjOYAzWfNos7CyowS9s8Vh2JVdlvoHn1aNhcQoOq4JTqkm1o4CQjmCIZSct3WDVvKqRMPDFHCjW8WIIXBjMOJUYP35MVgjKRaDBcrBxCYdujuPwzl4wnKtiwg6qFO94KZUqqKd5It7EQRIiRGPO9d8shtOL/aRJ8Muigr0Rraiw2WH3bOPJhoC5qYtAtD3I+f3C61/030KIGhXh+/NxJrBhlDakBO6HRyTUP/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq5kkqhGKm3VtH2CM+Frn7msdUuj/TqissD2VKZONv4=;
 b=QvivRcqP+04zH+4FuzeaNvx6IqSg6tzPmUvrJvAcbs8JMFcNztd3TJH30fq2nfQZAdfd+fpb9l+H69GPd6qBg9hhEsWNvzr3sYkOP/9Yo75NVurnXvf6SftLHrt5aXoKVWFUQsjxXOmX1HmIkPB9a38CjZnbg+Jvo9DU5NpoOjw2JSuM/O2U+ghL9gybLlp4V6aKqmxVKaJ/ZVeCO6hvW3yeCHix6hry2kVmTWFnME6UEf8DsfG5LckcVNAWC+Iqk1iiFNYy2vrRb482xnFaEr05vgiid4ajb2GSoTLPPOO5gDK4DvLLKWC2zGW8WvpQZ9zYzgGngt1LUi+LWNzfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hq5kkqhGKm3VtH2CM+Frn7msdUuj/TqissD2VKZONv4=;
 b=F/TXZt9R5nJ1CjvsMIwUJg5mXJbBhBIY1Rw17BOYC0gVES86X9EyFxurvG+uRHtwWcZki9MTQtMEX1FE/TU+px+CT4IY6i4gfombPu+fx4LzCdto4Xitl9LvbrUSegaP7i+Aco5WhoA5jDTAQUj1bk+5jphSO587vLL2GLTSxdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4a09b020-9d94-45f3-aeb6-e2281e212f57@amd.com>
Date: Thu, 22 May 2025 15:03:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm/mpu: Provide a constructor for pr_t type
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-7-luca.fancellu@arm.com>
 <dfbac65f-ed9d-4118-b6d3-238b075961ba@amd.com>
 <6D22B504-4D83-48BD-8679-CB68DFE444E7@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6D22B504-4D83-48BD-8679-CB68DFE444E7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0079.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 00aa881f-e561-499e-e67b-08dd99311818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzdvZzNSdmlOQmtqNEVxemZTRzBsTDRDQ0V5SDl3MG1EV3cxZkNudkMyZCtN?=
 =?utf-8?B?eW1xeTU4UVJGT1NXYmVndGZwUnRqS2cxR2FUeUxVUXVDKzZ5bS9JV1E4VFlw?=
 =?utf-8?B?dTkvRkdMM3JCT0tVNWdVWDYzZ3Z3WmF1emFNVVhZRHRKSmRpbG1NdWZOT2xo?=
 =?utf-8?B?b3crWUI5UlBWRElnRnM3ZmlHbW1qOUVHaXoxOVU1OHc3WTRWOE9rVUMwSE5G?=
 =?utf-8?B?Yk0yeXRtR2E2bFhOdHpCV1FRdlRJK1V4UGVpOWpIYkR1MDBIZCtmNkEvbmFZ?=
 =?utf-8?B?YmxzRVpONDBObGFWcjY2RWg2cDJ0U0czYzF3T1hrRkRQT1BERWpqcW1UR0VH?=
 =?utf-8?B?Uy9jM2tmbWViR3BtOVJ2dmZvUVo2K3ZheGxvWjlmYXJyd0ZSUE1zZ09tamM1?=
 =?utf-8?B?QkY3dDY5dzNmWWN3MXVGTW42OEJYQkFJYUkzRk14bHVJM3FESWhWclZ4OGhK?=
 =?utf-8?B?cjV4UzlWY3J1N1Jwcy9ZL282R0crYzRyeVFPa1NabFRFSEUzSHRyaDJtQ2JC?=
 =?utf-8?B?eEs2QldrNnNUcWticG5leS9OUEl6ZmNaQnU4L2RhdHU1elJsa0JHWEJLMUVX?=
 =?utf-8?B?bFUrc1cyQnV3dk5CZkVQT0NuWXE5VDI5d2VHdlhHbGNDQ3c4TkdZZzgwRkdR?=
 =?utf-8?B?T1FRUHE2M3BGZnVWbWNGcE5LeHhuYW40Q1VNMy8rUFdWUytRLzEwdS9qVUZj?=
 =?utf-8?B?dXQrVStHY3MzMXBjQlI2cm80U1dLNE9qbVR4UUxYaWoxaTZqdDZHY0loSE5l?=
 =?utf-8?B?bThWZm5xKzFHTkhtanFKeHdvMVkrcjh3SDREWWRRQTczSkZKNnUzRmVUdG9T?=
 =?utf-8?B?OHdCYktqRkZDOWtHbUl0WkZJRHBLc0taMTR4ZWRNOWsyQTJOaU12bE1sK3p1?=
 =?utf-8?B?dzVWeE9vRzFYT0NhM3NYTktxNVBBQjF2OWZreVVIcnhrRHNnOVZDbXU0K2py?=
 =?utf-8?B?Q3luS0wwdXEzSmRNeWNubzhaYWJiMng0NWVZeUZtZnFyNzdabXpzV1dNaHpq?=
 =?utf-8?B?dUlUZ2pKTlhaaENLTFRjMTMvdlM4Myt0aVU0bURoVlNURVZPVWlITTBDRm0x?=
 =?utf-8?B?RnVNTkVSNDF6bldIdzdjQ2xHZnlTSDlKaXJHcmFSNkdVK2RZYm5yWW5qWktT?=
 =?utf-8?B?Z0FHeEkzclpndGtSMG5JWkxrZmE0R1N2WDFjTmVha1ZoUXprK3k2RVlFeC9w?=
 =?utf-8?B?VTgyOEF4bVd5UVVJdGR5L0hmZXBuSkNhZFdxcTFxcHlpdkIwTnUrcWpBV3Y3?=
 =?utf-8?B?WjduQ1FjZEI0ODQyMzQwWVRCY0pGZ0xOWGN0UVFGenpNeE9YWU1YdkhLOERr?=
 =?utf-8?B?YzhlNGNFZmFxbW1CUlQzNmhLd1N1VTFEdmVOalpmRjdnb1ZBcUxyYWZJTGFR?=
 =?utf-8?B?cnNRYnZ6ODRtTkg4TG9YSmZCelcrZmpiOWxyNjllbjFtVHMya0ZpbFJCaHlZ?=
 =?utf-8?B?c2liY1o2LzNOYVhTMTcxbWh6UWphTC84LzNRSWZXd0pUYzRsVStwN3hScUhU?=
 =?utf-8?B?RExlRzZMU1JabFJYcDZqREpPbmRXUzlPbHkvQ3hhRUNtZUExUGs5bFc5R3pK?=
 =?utf-8?B?NmFuSlN0MG1BRTA5TlFuazNhNldIdURzQ21VcHhXWklQTzl2YjgyVXBMUDR6?=
 =?utf-8?B?eGlUS0lGMnBhRmZnODVvRFFFZElRVzJvNXE5RHhmNmwwR2JwM0diOHNJQlV2?=
 =?utf-8?B?cXMzMGJFanFXZjBJbzBwaGpjVDRsNnFUNUJTNmgzUnZNWERnbjVWdzBoek9K?=
 =?utf-8?B?bkp4ejhxdk1NSGsvQ0JqNFBLUzhsR1Z6MWxRR3ZwNHhNV0NHQ24xZ2lpSnRE?=
 =?utf-8?B?SzFPbTVrSU1HbGN5UmFMNWFaVWQrUUFUTUdqYThiZWVOMGd4K1dJblE1QXFs?=
 =?utf-8?B?VVgwM3NjbUM5UXgwTEJ4WnpsczAyaS9HaW0rWDQzSUpZRkt5NmMzSVpXV05x?=
 =?utf-8?Q?xPN97Jq5Hfo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDN6N3BTdmFJNDgwQmg3T3JnRVlCYVRxOUY3MFM0SEw1Vk9vV3E4amNGelNi?=
 =?utf-8?B?K3pxVDZZWW8rMHIvNm9BOTdPSElzaUdXVUV0czRzbFNUaXpTMFcrbXZDcHd1?=
 =?utf-8?B?NUtoUzdyYW5TNWlxSFpzd1dSaFJhaFk4QjNJK250Q242RlpmR2pteTBZdjBx?=
 =?utf-8?B?ZFc3N1cybFRJT1JsdEpmbFRoTlBXZHlXTE0wa3dIUjR1dWtpQ0pIYk1iRlpy?=
 =?utf-8?B?YkxESDVxMitsUSt2MmdzRnM4ZG9kdm1MYUVaTGRYNTNydFAwV1V2eVY0ZmlH?=
 =?utf-8?B?ZWNFamJGY25xaXJPelBNTkxLbjRhRHJjWCtEamdQL3Y4Wk5pd0ZMY2VhWkgw?=
 =?utf-8?B?VGlwZ0xDVGxCTy9xOHhFSTNnUmpKZGw3dGQzQTFDTzF3a3RTdFQwUGlRek9y?=
 =?utf-8?B?UUUvMXFtM2c5cUJXQTVWSkFKS3hzKzBramkrZEtVbHBOV1NYdUNaS0pzRUtT?=
 =?utf-8?B?ZllHU3pnMEJwWWo2Ym1ZYnkvUlk3eDdUZ2pnZmhSWWRQSG1pQWhtajJ5b0s5?=
 =?utf-8?B?RGxkUTRydHRRVWlUdlVOZS9YM1dUcEs4RVB4UlhVR2ZiOUo5Rkt0SDRpWXVZ?=
 =?utf-8?B?eFpGZFFkY2kxa0VIbytpR0daLzE0T0ZMQWJqbU4yVXVDVmI1M3FoalRDV0NF?=
 =?utf-8?B?N3Z2UEcrUi9CZzhRdFMxQTFMSElaZFNNeHl5TEV1QUFXSXpnKzN4WWRqYmt3?=
 =?utf-8?B?MVB4RTN4WUZnd01BZ3JRRW1FSDRJNEtKWFpkanVScFdjMjdoNk5rRm5kbExn?=
 =?utf-8?B?Rmw0WXIrWGkzdk52NE0vUzJQZDljcTVSWnVlYTdzWW5VSE5RTHAyYlZrbm1T?=
 =?utf-8?B?dEZmS2JocnlzZDJ5YzJFRmZaTDBrR2Z6UWYrUHhHUGNVek0zNDJpU0VqN3pr?=
 =?utf-8?B?b29MRUNjMzd2TWRjTCtFdmVjOUtVT3dVZHpTcG01ZFJsMTUySXNjUS8vR08v?=
 =?utf-8?B?Z2lPMzZheFowUVk0cWxYdERtRmJNd0U4eHZxOWxYckNhK3crM2FGSW84L2dS?=
 =?utf-8?B?cUFHenE5WkEzL1FDcFlaTmVzUTg3U3lSWGRGRTRYRVJrVDR4ald3VllCSHFU?=
 =?utf-8?B?MWIzL1dUUzV5ektCdTUzMUdjT0F0REJSbEpoNThmb2VNOXZUbThTZDhhZHpP?=
 =?utf-8?B?Z1Nwc2phMFpsWTI2MmV1S1RiaHJEQXF0a3FBL2ZaYW5TTS9Sckh6cGI4WERa?=
 =?utf-8?B?VmJPeE95S0NPL3dPUFQ4Rkl4cEJYUmo3dVBwS1Fwd1V4cE1wTUJNLzhvZ0JR?=
 =?utf-8?B?MGg1eEI5QjVtQnAwUmZnekJVeGV1ZkdVR1Y0dEVLd21sa00ySmVqVzhBK01m?=
 =?utf-8?B?eWpBRkNiT29Da2lWS1QyMldPQStsWGlVbW1iakU2YVpZaCtvWFgzSkl2TUVY?=
 =?utf-8?B?SDkrbW1FU2lvT2N4RVM4c2Fsbk9aMzZnR3pxVFIxRFBzNzZzU2IwS2JOUS9U?=
 =?utf-8?B?SmtiaGpYQVJ3TFAwbVU0YTZ1aUZhaG1OR3RjZmFzZjk4dU9teE1tdXpXemZQ?=
 =?utf-8?B?WFp3ZXgxKzVVUGRaMHcydTRrQmJLWTR1VU12MDFLeHl2UlN3dHlXV2xuTUJy?=
 =?utf-8?B?dUhWM1BLWC9sU1pRRlVLWElReUpzNXo4NEN0SjhNYktnMkFGRGg1empwa0N5?=
 =?utf-8?B?cWFCY3FPbVJGdEE2WWc3cWtwNVZYcGpJZzViMExUb0VRWHZXQjF6SE5VcFNN?=
 =?utf-8?B?bDJGeERiVGJsTlFla0wvMEFRakc3UmM1ckxDc1RRUnhFTWROOHRnZlRWUFk1?=
 =?utf-8?B?L2NFdGFzR1FjRDBXMElaSlFyM3luSkkxcW5xUWhENHF4L3EvT2g1czlOTzhP?=
 =?utf-8?B?Q0pNMDBSY0p3VDNiZ1hxdlBkdStVdlVkMXYrSEtiMTZmemlKcEc0TWdPdzIv?=
 =?utf-8?B?UFJ4Z2diQkxWaHRDZlVETjRzNlFxRFhIdUhQZXAvSXpOVmY0aVorQ2dHTXNO?=
 =?utf-8?B?U1B3T3BaMUNwdWs4WUlvN1JBbzdSOGJXQU9EaFNJakdVaHdnN1NKb1F0OTJL?=
 =?utf-8?B?c0tSclhqN2ttQ1I4VnNHM2YvdE1jaGs3MkZXUThOWTNhVGdidFZ1eW9SR3dD?=
 =?utf-8?B?cXJXc0ljVitVcUNLYkZHUUdHTXpuWXhSMXJKd0YrSEx2Y2RuaU50aWJ2eFcz?=
 =?utf-8?Q?g7ld4FTEiYfqv/aYgzGwxoCCS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00aa881f-e561-499e-e67b-08dd99311818
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:03:49.5217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H24UbsNsOVaySo7jF3BLpWrGbCs5srQ04JbAQa2J+KSrUdFeYhPf4IS/CL7xCooW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678



On 22/05/2025 14:49, Luca Fancellu wrote:
> Hi Michal,
> 
>>> +
>>> +pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>>> +{
>>> +    unsigned int attr_idx = PAGE_AI_MASK(flags);
>>> +    prbar_t prbar;
>>> +    prlar_t prlar;
>>> +    pr_t region;
>>> +
>>> +    /* Build up value for PRBAR_EL2. */
>>> +    prbar = (prbar_t) {
>>> +        .reg = {
>>> +            .ro = PAGE_RO_MASK(flags),
>>> +            .xn = PAGE_XN_MASK(flags),
>> Shouldn't you also initialize .xn_0 and .ap_0 or you rely on compound literal
>> implicit zero initialization of unspecified fields? But then you do initialize
>> .ns to 0 fror prlar...
> 
> Yes, because there I would like to specify that value 0 means Hyp in secure world,
> but of course if you want I can explicitly initialise also these two
I'd prefer that way (so that it's more clear what are all the fields initialized
to) but I can understand that this is very subjective so you have a freedom of
choice here.

~Michal


