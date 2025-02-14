Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2EEA35832
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888486.1297843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqTa-0005nG-2E; Fri, 14 Feb 2025 07:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888486.1297843; Fri, 14 Feb 2025 07:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiqTZ-0005ks-Ve; Fri, 14 Feb 2025 07:51:05 +0000
Received: by outflank-mailman (input) for mailman id 888486;
 Fri, 14 Feb 2025 07:51:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tsm2=VF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tiqTY-0005km-49
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:51:04 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2416::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ef19f2e-eaa8-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:51:01 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 07:50:56 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 07:50:56 +0000
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
X-Inumbo-ID: 6ef19f2e-eaa8-11ef-9aa4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRuGaDBbTIriN7fNG7vMcixjePPh4JLxljI0md/BCvqh0sPwAbPJZ2clBTCCqIOe5tFw7SA0TlZdVdqIioqX/9ah69ns+M5Fk8URJnDJkX6PnyLlBqI+5JN2Zj0GLEioF9AyKoERNW567FBMR8MthKbunK5Kzp6BFONCvt1m2UTSZBg00sDs8dS8GXuz+RqrzU+fiCQ4ilqBdCC5044AOLO+jsbipHbC0JOaT/h9fyHRUFAR7BYRtyl377gr0RWbuqXlU6pi+m2kaAhBmcF1xE99mqJd7QsSFDiJOcK2Gbc+eiwjYRdcgsx9BKH77sfzcnn8j0eXhnMInLVG7Z0xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+O9ePHdUaNWvb1Iv0PegRwSjmOSHdDyFSecjz18fFWQ=;
 b=VqvYPVGQqFX7bP8TpYtG8VmYKCi8CvweaWLfJz+0EWsOscwVOzTVFRmiy4bfKp6x6PafCvvZb3miLwPolSs98Nq9IpO3rey0k0nPnUq72khpVkgTl6J/mB85wLc012WGH9F6XrmeniTi61fRPxlAssuOFG7Demy6pmerVuGX0YnC/vimEoc3p0EZ06QiKYUicbF/hUXVmaDKqR54WCnpohCcK/ixf5tJux92P78CEkaz8SCUcArfLAQl9W9kZDHGoQqcaTP1VKtrma3D4cuesYSi8okTVx3C8wVWcrglB2zQAavNDNE4tS357clIsC5ywrp0lj6FH67mBzOcH32W4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+O9ePHdUaNWvb1Iv0PegRwSjmOSHdDyFSecjz18fFWQ=;
 b=auabUO8E3TMuDk8pILRS43nLoerPI2IjvSGu3sNTD4bfl7ggUW5AODRlACXjKRGHvVKOvHt1NiChXHidaYFAk6TCd+HOHpCOiDKndHo/Ck1lMEam0+Z33IFyA2FsyU73QURMPMTYMSM3i/Q8aq6y6ygwFJ4ouLAcfIBkKRvjkC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bd3d1061-695a-4177-be7e-ac2e5c1af88b@amd.com>
Date: Fri, 14 Feb 2025 08:50:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | b5b2f987
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 VictorM.Lira@amd.com
References: <67adff3bd57c7_2ec97344998c@gitlab-sidekiq-catchall-v2-74bbd94c4d-5p8wh.mail>
 <35e47b81-7a87-4e8e-b8de-ec37a5ea984a@suse.com>
 <alpine.DEB.2.22.394.2502131215140.619090@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2502131215140.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::17) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d4fb1c-ff3f-41a0-2796-08dd4ccc5088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejlHU2JRNHh0NlVBVTJTN054OUo2NG5mMng4eWpDWUNSNnE5OS81ZTh2a0hF?=
 =?utf-8?B?TTd6dXVkamVYOFFkZHNuaDZKZWZEaFR4SldQRjZ3c2djQkNXWGhwY1UyMDhh?=
 =?utf-8?B?eXRTaDh2U0owS25NWHlxWkJYR3RKaVJPc2ZpNDI1Y3MwakdxREYxaFFLZWVI?=
 =?utf-8?B?bFBoc0lLYit4Nkk3dHJYelhWUEg0Wi8xTTJuMUpOdVRkMStEN05qSE04WFlP?=
 =?utf-8?B?ME5HcUtiWVR2M1VTWDUveXZON1NMNkloaVVUR1R1cjl0bEhWaU1qUkRvazFR?=
 =?utf-8?B?Y2hOQ3l5dk96bjB6Ym1idHcwZGdIM0dWMXBRMUFoOWNUaUVVemp0YTQ3bERn?=
 =?utf-8?B?NkIzTGRUa0d0UTRhUWhZbHR6bTFiWUl3c1lUbVRxcUVQYXd3a0R3ZksyUzhB?=
 =?utf-8?B?V0RwQVpJY3NiemU5NFJCdGZZVStmNm1aY0NXN2M4d2ozUnBlL29lOC9zSmdB?=
 =?utf-8?B?WTJxM20rbm1IMVFFdU80R25FVSt6MU80VGd2c1cydStTWVBDM1JYVG0wOTh2?=
 =?utf-8?B?MG5pUGg5ZHFQWHNRdUlsOHgrMU00SjQxQlUwSFZYeElJYldwaXZzdVpublRl?=
 =?utf-8?B?T1RjQnlkWER4WjJuTFEwa2ZpemgvNkpuRnp1c21YUlhTZ3JnekNML2xMa294?=
 =?utf-8?B?Qm4rLzlqZXMwNjdIUm1yWFFzaFViUmlwVjdHNFdKN1ZLRVRUUldXeVMxNXE4?=
 =?utf-8?B?c2hWdXBEMVgyVzJPaFlTQnV6U05rQjhEMGhPTzZSUFNkOEs2MXZRREhoR2ls?=
 =?utf-8?B?ZkF6V2V1Z3d1OVA2Rzg3cUphM0sxR2h0amtieUpJaWVMbDZwQkpSa2U1L1V5?=
 =?utf-8?B?K1dxTVF0aHdaVmM3SGNOL1BmZ3ViU1RSME0vRUg5TlJOM0N5K3picXJiTTIx?=
 =?utf-8?B?MmFIWUZxRm1qZngyMHZ0dVUwWmVYUjl0NHE2VVBPWXQ2WDF5d0Y0TXdLeUts?=
 =?utf-8?B?aDhGZU43NGpvMHcvOTJnMEJ4bnRod2NKUlgwNFp3Z3E0bnhsS2czYmIvcURP?=
 =?utf-8?B?Yi9oUk9KM29TeEp6cWQ0QzhYL05yVW5jck11d2Z1aGFQMUpORHZ0dWE2QWJJ?=
 =?utf-8?B?c1ZydEFZeEVGZUJKekROZUJLYXQ2SFNWT2J2bkVwbjcrbWoyQ0dyZnIvSVNt?=
 =?utf-8?B?dXo1T3dGaSswTEE2Z0lmN1FFaW9GOHduR0lxdjR4aGFCTFE5TFJjV1lEREsv?=
 =?utf-8?B?YlZrN3Ird1l1VWY1R1kvK1B2bEhpQzhzK09ObndZaHYwVjlaZmJ6Q2VRbU5F?=
 =?utf-8?B?L2NvSWN4cXNwNzNmM2ZXL2F6cUQzTk51V2V3ZVJ2UE5Cc1hJSnRoNGhLVVJT?=
 =?utf-8?B?bXg5Qml0QmowVlpZVzJNVGNkVGg3TDA0OXlVV2ZndVJ2Yi9oeTZUWHhqYjBH?=
 =?utf-8?B?dUpDbHZ2ZE8wV1JUem12ZzlrcTZDWWdENndBcDk0dTlqOEF2UVR2ZDRaQnI5?=
 =?utf-8?B?OW94NlFyYUV4VklvZGFBN1d4TUNYTERlb3BsVlJ3dXNySDJiUnZuUC81Q0xO?=
 =?utf-8?B?TXoveUcxazZnLzlYNzhGeWRGV3lLSzkvZXZ5OFFkYkFmZHcxMGZxREJVLzhZ?=
 =?utf-8?B?RHk4RmwvOUdibElWTDMxcE5HNVdaZTNlNVNyZDdkM0piSFhKWFlNTy9Dak1U?=
 =?utf-8?B?MElGSTJwOHY3V0hMcnJIS3FDNjhWMUk3T1RJT2RpT1dMRS95UW1aQnhiT09L?=
 =?utf-8?B?V0djU0FPckV0UWw1UldLcE1WeXZRcXpGd0V4Q0Y5Tkc3czgwR0J1T005VVFK?=
 =?utf-8?B?NFNiVXdUaEV1M2tvRXAxMDJZWFRaVDhkV0krWC82OXVqT09iWlNick9YRjgw?=
 =?utf-8?B?MENHQzZnMGZ4Qit3eUo3dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkdSTkREcm5vVTdNdmEraHVhKzhQOXdZeG44a0EwZHZqN2V1OUpGam5BTzZt?=
 =?utf-8?B?TG1YVmZ5UmF0VTVjRjZsTnQ1RWhIQzFId1kyUnBaYlEwMU54RVZVWUprdVFK?=
 =?utf-8?B?TTJxYzMzTnlVMEh3eGV5Qlk3THhpM2tzTk80WkFHVlJRUzN4QksrcXdZbHVo?=
 =?utf-8?B?Q3dpeU8wTXNvL2hYZXlwejJPR0RRS1BaNEVITTdIT2JmUDdRZEdZTCtGaTJu?=
 =?utf-8?B?eW9uWDQra3EzSXJBL1lNVnFYcWs2enhSdlp6anFnMGpRYm1WL3ZNZlRUb3Vk?=
 =?utf-8?B?YkdiWWszd3dFT3FkS0FjTnVHWGlPOXFrOUU4NHlNK3l6NXdTdVBmQzVnaE00?=
 =?utf-8?B?MmU5RHVLK0hPRlIycUlVSG91MjF4MGVCRC9MUmR1c3FNaXhtaEhLVGtrbjZQ?=
 =?utf-8?B?OHVSb1B0SUdQejlDeTJxaFYwWlhFZDJFVVFwZkpQODI1djlOamV3OU9KaHJN?=
 =?utf-8?B?cEJ4UmN5aE9vSEt2Q3dZU0VkbVd2dWZ4dTNoWHFSNGZpVCthWmJhNUlzOXkz?=
 =?utf-8?B?dU84bUNVNWErVEprR0ZDSGJ0SlNZTkZ2a0hKVzlkZDE0Y1l4VlN1elkrVW9v?=
 =?utf-8?B?VEQxY21VMHFHRXRNRHRUUnY5RHEyaFlFVlk5ODlQSGhPT04wRjJWcWJxbEp2?=
 =?utf-8?B?WHQxUnpSVW5YeElwRU1HbktQa1cvNlA5dkk3ZjFsWWdpdXZrb3V4ejRwWFNz?=
 =?utf-8?B?bVpmY2FpTFpPcUlHbXdTeWRMM2tIdTJ5YWhqSXk0S21uTTQ3T1ZvK0NnMkpC?=
 =?utf-8?B?TXlPcHNWS20wTGx1ZTNhd2VuQnBjdFZ2cGhRL1h6UnA2ZXk4LzBDQ2xSNFlq?=
 =?utf-8?B?OHVFNitqZ2F1NytPa1FjYjhHUTduaXpSU3U5aVJ6c3JyZ1BoeWJTRUpCT0NF?=
 =?utf-8?B?UnVuSUJUTHhNWC84SlhscGFKcUNNOXp3dU1YNHJkcHdacEIwSVB2dHZaTTNs?=
 =?utf-8?B?c2NPTG9QNzlhL3lHdnVHNlRJaVorMHhJcXdEY0JnQitNc2swM1dvMC9mMkRT?=
 =?utf-8?B?RjFVbWdhMkJ0U0o0QUJXVFBrRUdyQ3g3MjJWTmgvVm82RnE4OFVQWmtjZ1Yv?=
 =?utf-8?B?dC9DdThZM2QrdXFJcmxoSE9YSmNWTU9iK0xnTXNER2Naa1B4RkpXQ0k1R3M3?=
 =?utf-8?B?S3Rac1YwaEpSdXJUZFcvZUNwRVEvRkZoSU1iNnlaM2piWWN5bDR5MTNJbEdM?=
 =?utf-8?B?ZzdLMitQZjZnNUFsUTNrVnZldGpvN3V3TXVud1l0UGhUN0hwUU80YnYwZ3g1?=
 =?utf-8?B?ejZLdkhNWG9rSGxQOVluU3EzSGcrUDV5dEtRR0ZZSDg5T2pYL3hJTVEyOEFs?=
 =?utf-8?B?TWZjRGZxN1JXQ05Sbk1QOTgrR3RwZm9TZS9kem9YSHEvUVA0eFlrT2NXeGRS?=
 =?utf-8?B?ZWNpdHhDV1ZwdTV3R2JVSHFwak1zdjZvTUVaVmwva1VIQ2pHd09tUVZDRkpY?=
 =?utf-8?B?R0JGNzBuKyt0eURTdU1sc0ZXOWVDT2E3OHpFMnBmTHdnUlZuWUxLd0kyZUJW?=
 =?utf-8?B?L2RoTVhBNFlCdVgxSWs2TmlWQm1DMHN1dDN2ZUQybFN5RHpNdy9FeEpqMDdh?=
 =?utf-8?B?QW5pWVdlUGtKa0xsYktFY3Q5aHlYQVQvOFA1T3BXRzVBR21FS2p0MnpZams2?=
 =?utf-8?B?YWdhT2dSYVdLemU1ck9ZdXAvZmJ3eFdVZUtKWjFmRXR0S2lIbUpvRjNsakU5?=
 =?utf-8?B?dWJtdlNZU2NxUUFOTTFwTU1IaVhTZUhSdHZ3WEl6NGN2NGdNc0lEbXV4Snla?=
 =?utf-8?B?cjhDdXRoeDZWNDI4Q3Q3Sm9OTnNseE5lQmhQcmNiU3haYXg3YzZUb0dIenI1?=
 =?utf-8?B?ekZDMm1FYlV0NXhUZHdnQXIrQk9kckFFWHMyRktoT01hVWlEWXkvT1NZaFJq?=
 =?utf-8?B?eC9Ed3BhWFpocW03UUZQN205T2hzd2pFeFBKOEsyZGNBcmx3S2ptVzh0MUNl?=
 =?utf-8?B?WnZkTGVZTkZzMmt1WW1vNnJLaW1NV2NvejQrMk00NFdzSjJCd1JzL3BBMUZN?=
 =?utf-8?B?UnFXZk52clQrQnp3T0Y4RCs4RVJrWktsOVc3MEVQYXFPYWdFZTlOR04xRUp3?=
 =?utf-8?B?ZDVTa3l2b3hnOHZpN25KSDkzOGg0NVpXak9hemhIc0l2L21QTFljWDkwQlBI?=
 =?utf-8?Q?J3d8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d4fb1c-ff3f-41a0-2796-08dd4ccc5088
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:50:56.7250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sD4i+m6wMdhA7BI6CLoNCnxU+d9KYapf0QrR1NINbpq3i48b2VLB36uhLTMrHoPx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032



On 13/02/2025 21:18, Stefano Stabellini wrote:
> 
> 
> On Thu, 13 Feb 2025, Jan Beulich wrote:
>> On 13.02.2025 15:18, GitLab wrote:
>>>
>>>
>>> Pipeline #1669696445 has failed!
>>>
>>> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
>>> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
>>>
>>> Commit: b5b2f987 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b5b2f9877a8777af6b78944407527e0a450389a2 )
>>> Commit Message: x86/HVM: use XVFREE() in hvmemul_cache_destroy(...
>>> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
>>>
>>>
>>> Pipeline #1669696445 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1669696445 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
>>> had 1 failed job.
>>>
>>> Job #9129817480 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/9129817480/raw )
>>>
>>> Stage: test
>>> Name: xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough
>>
>> >From the log I can't spot what it is that failed. Stefano, given it's a
>> Xilinx test, any idea or hint?
> 
> Hi Jan,
> 
> Thank you for bringing this to our attention. Michal also mentioned it
> to us this morning.
> 
> As far as we can tell, it appears to be a transient networking
> issue. Specifically, U-Boot on the board was unable to successfully
> complete the TFTP transfer from the TFTP server. We are not sure why
> this happened, but everything is functioning properly again.
> 
> I have been considering whether switching to a TCP-based protocol might
> be a better approach. In any case, we are still investigating the root
> cause, but for now, everything is working again.

Issues with TFTP transfer in U-BOOT are difficult to debug because even if one
u-boot command fails, it proceeds to execute the following ones. That's bad. I
think we either need to set timeout retry to a very high value (> test timeout)
or add support in ImageBuilder to separate commands with && to fail on first
error. This will at least help the observer to easily spot the issue is network
related.

~Michal


