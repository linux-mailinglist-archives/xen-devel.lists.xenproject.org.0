Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A7CA60B60
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913975.1319812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0O7-0006aG-NH; Fri, 14 Mar 2025 08:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913975.1319812; Fri, 14 Mar 2025 08:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0O7-0006YM-IP; Fri, 14 Mar 2025 08:27:27 +0000
Received: by outflank-mailman (input) for mailman id 913975;
 Fri, 14 Mar 2025 08:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaPW=WB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tt0O5-0006YE-HP
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:27:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2413::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26cfb2f8-00ae-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:27:23 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB8139.namprd12.prod.outlook.com (2603:10b6:a03:4e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 08:27:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 08:27:20 +0000
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
X-Inumbo-ID: 26cfb2f8-00ae-11f0-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQEAXyy8ew242E+TPJ9VX5cSovQ4Clj94jBPlnprbjtwunOAvmmH11T4vR1vtX1DNGFQzFLnMgSnIn/AeyUE2uEGFcO5kv5VUeU6quppLuYLAlKAPqKM4FI++ml70ZX3FQ8pvvzDc8c0zu1cBD7pFYUBiGigQm7tPC4Q2ynxHXL3V3GKGiIv6UT//Jal3wDWkEZXh2RbzhV3cYNCT9c1BpIqaeUzWKdCJ0qFjF7EVE2SHuKoOPe9+rzPKBSu1PN94334GsrWqtGH2MRHXHGStG70I8VTbyBxVQpCSw/rZ8anUKbj1v2kW0gFQdyHGPEqiMAzqxr+TdUm2hPfuZQYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6xLy6Dm3oA6iKy2bgzZ1pJy4RJlVZC6iXu7JlWoF9Q=;
 b=yKHuLtB4zFmLvMxdqmakK/yC0b4p8hqgkHVUPWjpN3assF3UDz8p0IM508ZKD0x+6BcFRG29AOxzaQSHeLg7b+AIrwHSY3LHDH+lVwLl5CqSw7sE48VBD2OPlT855HLhdjVVW5iAtC/No7vVZzqHoDIS6A2x2ePu3guZNzYrvAPuIbGTW1jdwIJn3WbS0rDHcHWZHe/3ypOr1l6wF3dp/K2TBPnZ8MybVvZvtEyHPh+jqmYi/iN4BXW9W4zWLfAOphKXc5HYwdiOAmTKU1EVTlC52xUHQpIbbZ/txayW+R7jKYO5feyHP5E6DuSOR1wuCpcZg4tTSkaDcDthxWKOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6xLy6Dm3oA6iKy2bgzZ1pJy4RJlVZC6iXu7JlWoF9Q=;
 b=iDlDaAG8WPT2uIQFJjai4SdmSugNwAdiKfKpj5E6M8j5X/Xss3pJ8pBzJrlTfWrpRfMVETSRqX3byEDbuKgtgkgLgNcvxpx8YB2wJfwG7AVxbjnJZ8X8NfbDMgQAz73MyyXq52Rk9GqHa0ciWZhXkPJumZD8GR9XFHeo9q2TeEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <40606489-99b4-4cc3-b202-9abae4cd1ec0@amd.com>
Date: Fri, 14 Mar 2025 09:27:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm/mpu: Create the skeleton for MPU compilation
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-11-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-11-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 0344a0fb-c165-4ba3-d9b9-08dd62d20978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVJRUEVsZElkTVNjeTJBVDRqeDBWOGl4bUc5dEV1VTdidDJjZDVPZE1BRGNR?=
 =?utf-8?B?aHgwVHpqdTJOcHJGbzIwYnVGNHM1T0hGV2JuNmxKd0pxOGpsMmJNb29mY29H?=
 =?utf-8?B?Q0NYZitPcXA0Zml6UjlRTlBDTXVlS0JzdGkycnYvQVVDa3hhV1dFOTBlUXNN?=
 =?utf-8?B?K0owdjNKSzBrRnVEb3MrdjY2azVNUFM0ZDUyb1NrK290dmZrcHBEcW9vRjR1?=
 =?utf-8?B?UlJacDhiZHozU3c4UWtoVU5YRFlKeHNVZEM5RlRwL1dYSG5HMTZqaG9wZjNp?=
 =?utf-8?B?ZzR5eXBnUzUrdzJOZ01CcVhjK3BzbVJkZDlWQklZei9TVHgwNzFGUkwyeG1p?=
 =?utf-8?B?cmlDeVFQenpxR1JNMk0zUlVJMldiRmxMOWJ6aVpaQ3p4ME9EektqYW91SG9N?=
 =?utf-8?B?WndwbVFWZjlMUWQxUzZhcUZOUU93VnV6OWVRZjF1RFlscDdFZ25xU1lZUDQy?=
 =?utf-8?B?bHdUUytHS29kOFE2aTAyKzBycm5NSGplMzk3UXIwU1M2K2hiMmpSZDBmTmxn?=
 =?utf-8?B?Z2pwTncyS2JyR0FrNVNsSUxXU2xVdVVUUndjUXZpb28xNTcrVGxQeEMrbGlZ?=
 =?utf-8?B?a1FuM2tzNmVGMVp1TW0yZUFEdzlVeHNIeXpkV3pKdXRiaGwvZUlLcU5KZWxq?=
 =?utf-8?B?bEgvWkFVeElFZlA5WkExdlg2Q2w5d3BxdVJMc1ZneEg3TFJFZktFVTF2YjF6?=
 =?utf-8?B?SXR1WlBqYWJ6K3AxT0NVc0NkOEdSU1p0cTF5RDFDZnVhREtWalp0QXZqNTdF?=
 =?utf-8?B?VVExTElrU2hnRzU4OEU3aWJQeGFzZ3JOTWtMUDV6emJrcmNkNVNqd2lrMDgw?=
 =?utf-8?B?NFoxSzM2OUFDVE56VUZVbnlWd3p4WnJYc1g0aXBiVlNPd1dzNjJhNmo0Zzdo?=
 =?utf-8?B?a1lJMU1LeXIveC9WT05zNkllTHRXbld2ZlVtd3FMdjB6c29mUjQrdEhNSzNu?=
 =?utf-8?B?Zld5anl4Z0pOR1Awc1kwOHo2RmxnbDlvYWF4dVlPSkZIcDkrYXhNb1hOWHVV?=
 =?utf-8?B?YWRxRXh4WmI1TFpNYy82ZE5YR3diaVpJM05ZVUcvTHFtd2pldVViRDFDTGp2?=
 =?utf-8?B?aEZEc3V6NGJqdXQvWTRySHAyVWFlYm1qM0FqemVtb1grbWFOeXN0c2VyV3VW?=
 =?utf-8?B?ZUgvMHkxcS9EVEk2RExGMCtqYlpyYmM0QU56YlJYdkMzQ1FsVlZSd1Z2K1No?=
 =?utf-8?B?aHArZjY0cGRUNnJLRDM5bFo2RS9MbUcvai80dVVaVkNTTVFVeEw5OEg5MjNT?=
 =?utf-8?B?RytBWEJuU09LRE8vaTZSTVdRLytwSy90MzhGQTdZc1UzNGlEcEYwVjQyZHQy?=
 =?utf-8?B?WU9UKzkrV3g4aExNMGVrWkRaRVVHallRWE90SGdtdGRQSko0MU1vUVRiU0Nm?=
 =?utf-8?B?ZXo0eE96U085V3didWZodHhBVmt6QzBMcWJuczBmRUFuL1gzUC9ibmNNR0FE?=
 =?utf-8?B?NnJ4eElyV0IvTElBRXRLelYrWmo5MXgxR25qTEIrZnZibVJ4M2dHMEp0NzNo?=
 =?utf-8?B?OTEzM01hVVFaZjJmUkQza0pjZkFnajQ0NTBXSkxHbmpFWExQUzNiUG0vNkda?=
 =?utf-8?B?eStlR2VackhvKzNKYnpVd3ZVNStyUXZTRDBHZXVRTHVsUW1zY2FYdHdOSERR?=
 =?utf-8?B?YTZaNlpVYnBmZmdCYjRza1cvQllIU1BTeE5vdHBveXU0dVd1aUhCMWt5L3U2?=
 =?utf-8?B?QzdoclFDL2N3NFRHZ1N0djZZUEJyemZWa0hER2lCckRiT1hSdjkwSGhjQ2dE?=
 =?utf-8?B?M0FnWmJwNFRBSnFmRzRPVlZuWW5MODVxNU1wdXRhS1VyRDBueTcxaGZ3dFhD?=
 =?utf-8?B?SkkwZlQ0MHFZQ3c1QnlzSnhiYzN4MWhjUi96anc0bEFWVXVLaDhBZ0R3Q29a?=
 =?utf-8?Q?snBuhoudGY1es?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjJCdFoyTUdid0g3S2FBcStTU3dsR0lGRFdRc2ZuSC92cTZSdXBkTHRLWlc5?=
 =?utf-8?B?NTFVTDhOSTdrT2dhRCtCWGNrTDUyOHVEbUtNNWpIZytBMEgzOTI0YzRnYTJu?=
 =?utf-8?B?b2ptSWY3RmgzTWJpYm5GbU5PRmZhMEtIRTFodnVXN1dGVnB4YjBSc1pEUEtV?=
 =?utf-8?B?TFdpZDdzMVU0Vnk0TVJObWVqTVdpTkswOHF5OVcwMFF6alpEdlJ4N2R5c0k0?=
 =?utf-8?B?cmxlNHVHRWhiNDBNNjFGWnV1aFBpa2lmZ1RDWUF0SDhjazY2VFpVOUVDQTF4?=
 =?utf-8?B?WlR6UHVzTVhDTUc2S3pPaG8rcEl5c2svemd4RnpxamJlVGRPell5dnMydENw?=
 =?utf-8?B?VEVsNmlWNUdURSsweCtvWk9Nc0RMU002c3BVbitsK0c1NFVwaitYeVdOZkg1?=
 =?utf-8?B?ZG9kbStBZFpKcWw5ek5ZWVUzazM0UGpyWng4Y2lST2dMVzl2ZllJbnFMQ2dm?=
 =?utf-8?B?K0duVW11ajNlMVdONDRYTDh5b0dQb1dnTDZTMHlYTWkwK291allEMlJwRXRq?=
 =?utf-8?B?bDVidDNrYVRvMlZ3VzZ6QWsyU1A2bUpCWm5mOTVRdithb3FrMi94Y1FuNlRR?=
 =?utf-8?B?Zm4xZTcxU3lWQlE1MWhoK2xxd3pYZkYrZHQxUm1HTmx1OCsrY0ZoMGRXVlla?=
 =?utf-8?B?TXlIMWI0ci9iREUvcVBkUytVanovbStKMlFwT3dna1c2N254NUJZdk5KNmJP?=
 =?utf-8?B?MVBJZ0UvYTJSNU8ra0w5YU5RcTdONDNWbktJT1pWWk13cVhjU0tJREFxRnQ4?=
 =?utf-8?B?T2NHSWNqZXZLNU5QWTJTK0JXSHBFdk9sSnlHd2c2N1pNaEU1bThaTGkxc0Fi?=
 =?utf-8?B?aXJpcnp1eGF1VmRGbnh5YUdGV0FXMlNIOGt6OGx1bmJMaTc4Nmk4Yk1LZXI3?=
 =?utf-8?B?emtKMytpQitlNll3YVlUSXJHQm1LMllZQVpIQUhDVXBYQkQ5cWFIUGtYbjFU?=
 =?utf-8?B?TVlMVWxoQTc5ckwvUVo2Y3RlSUk5RGVwQUFaYWZUQ1FnNWJ1dURONFFERkNW?=
 =?utf-8?B?YUE4NkREY3lJaUI2M2NxZWMzOHhiS3BoaWtjcWxmTHcyV0xCSlFMcXRnYm9B?=
 =?utf-8?B?Ri9RRlZnMXU2WVdlL25iVjRaYjZCZzQ1RWZNNlpla2pQV1FZaDBaenVuWHh3?=
 =?utf-8?B?TU1BQkJiSHRPY29jUzJ0cjVLZ2dEWWJRTTR6NExQaWlnVWNGTTVDVlpIM0Fu?=
 =?utf-8?B?YmJLYVM0VWNNZVIxSU1jUVdoMkNPN3JSZFRjT2Y5bGdTOGxtd0k4TTl6UlZ0?=
 =?utf-8?B?eHFtMnpYMWI2NUkzS05zdEdHMWI0bTJVeGNOb0djM21obUM0UjdQaGFROG9i?=
 =?utf-8?B?L1JpamROWUlrZ0Q1LzlrcDZLMWZQWWVyNWdVRG41UTBIM3cwL1pjYzI5M3Ex?=
 =?utf-8?B?dVJVTkJZR0pXazRVcFczRlNYTG1Vb2FYWGlIdFplN0VaWTFRNGJYekVpN3VE?=
 =?utf-8?B?SnI3U2g4MWl2ZXJhWUhSOGp4UmprcXVnMmRFdmpmSWNuU05DZGlZTFprOFha?=
 =?utf-8?B?am43U3FjQTI0dFBGZEFDUjBGYXZMQmJTcXIvMjM3eVFwSzRHN3BWOU0xZ0J2?=
 =?utf-8?B?Zjh0RE9QN0QzcEEzYVNUZXNrSE9DcllvRkljTEhPaTlvY0ttOUdPc1p5ekFG?=
 =?utf-8?B?UG9qV1RDSVV0VkZWa1RaamNIVVBJdGRiTXAvTEJxSU9lc3NxZk5pRngzQi9s?=
 =?utf-8?B?QjBVNUJHNkNuYkFUMllleTZmR2FWNS9kR2JHOFd6bFlCMUNBUHpMRC9XZnFz?=
 =?utf-8?B?ZXNXVFdLdFJkTXNpSUlhc1JJeEdESXoyZFVXd20xUFE3dnluSi9CZzVBN0Fx?=
 =?utf-8?B?bzJndGY4eE9tTW1JWWZzWHh0YUJ3VGcyT3B1TE10WTBMcVNreHoxT3ROQkh5?=
 =?utf-8?B?SzVLbE93dkp4T1BhRDI3dXEvVkp3SEFOMzdHUVNTYTh0RHY4Q0dzdnZYQXY5?=
 =?utf-8?B?cFVNckNsU01ldHYzbUM1eVdJY3FOak1Dc1hPN3BtdHlGNnF6QW5RczJCMnJU?=
 =?utf-8?B?MlRvRzBWTktxK3ZWU2QvcEdhdXl3MTJmZXU2QitWNWZYdS9ueHIwQlZrMjVx?=
 =?utf-8?B?c1Z1T3NBZU5qb2tyVUkwcFR5NTNDb3pSaTJaWGFBZmUrR2kwd2U3YWQ2cjJq?=
 =?utf-8?Q?o+T+DREWBzgtTy+jMWnS8bw3z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0344a0fb-c165-4ba3-d9b9-08dd62d20978
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:27:19.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNOcUHRwhXyc3MLLEIQLncyPc4idGvTqZafwUAj0faWFzSC2+N5T8xTT1tQBmITV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8139



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> This commit introduces the skeleton for the MPU memory management
> subsystem that allows the compilation.
You forgot to mention that you're talking about Arm64 only. For Arm32, Ayan has
a series containing a few patches to enable compilation.

P.S.
Once your series are merged, I'll send a patch enabling CI compilation for both
Arm64 and Arm32 MPU.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> The implementation of setup_virt_paging() is under arm64/mpu
> because it will have a different implementation from arm32.
> ---
> ---
>  xen/arch/arm/arm64/mpu/Makefile    |  2 ++
>  xen/arch/arm/arm64/mpu/p2m.c       | 18 ++++++++++
>  xen/arch/arm/arm64/mpu/smpboot.c   | 23 ++++++++++++
>  xen/arch/arm/include/asm/mpu/p2m.h | 20 +++++++++++
>  xen/arch/arm/include/asm/p2m.h     |  2 +-
>  xen/arch/arm/mpu/Makefile          |  1 +
>  xen/arch/arm/mpu/mm.c              | 22 ++++++++++++
>  xen/arch/arm/mpu/p2m.c             | 58 ++++++++++++++++++++++++++++++
>  xen/arch/arm/mpu/setup.c           | 24 +++++++++++++
>  xen/arch/arm/mpu/vmap-mpu.c        | 24 +++++++++++++
>  10 files changed, 193 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/arm64/mpu/p2m.c
>  create mode 100644 xen/arch/arm/arm64/mpu/smpboot.c
>  create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h
>  create mode 100644 xen/arch/arm/mpu/vmap-mpu.c
> 
> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
> index 3340058c08c6..cf0540aecc84 100644
> --- a/xen/arch/arm/arm64/mpu/Makefile
> +++ b/xen/arch/arm/arm64/mpu/Makefile
> @@ -1 +1,3 @@
>  obj-y += head.o
> +obj-y += p2m.o
> +obj-y += smpboot.o
> diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
> new file mode 100644
> index 000000000000..df8de5c7d823
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/p2m.c
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <asm/p2m.h>
Why do we need to include p2m.h at this stage?

> +
> +void __init setup_virt_paging(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm64/mpu/smpboot.c b/xen/arch/arm/arm64/mpu/smpboot.c
> new file mode 100644
> index 000000000000..3f3e54294e54
> --- /dev/null
> +++ b/xen/arch/arm/arm64/mpu/smpboot.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
I can't see anything mm.h related here. I'd expect types.h/stdbool.h and bug.h

> +
> +int prepare_secondary_mm(int cpu)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +void update_boot_mapping(bool enable)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> new file mode 100644
> index 000000000000..e5c0e302167c
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
Empty line here please

> +#ifndef __ARM_MPU_P2M_H__
> +#define __ARM_MPU_P2M_H__
> +
> +/* Not used on MPU system */
I personally don't see a value in such comments. Initially when there were just
1, 2 instances I was ok, but then I realized you keep adding them. It's pretty
clear that if a stub does not have BUG_ON, it means it's not used. I worry the
files will look awful with so many "Not used on MPU system" comments. If at all,
the only place they would make sense is if they were in MMU/MPU common code. Can
we get rid of them completely?

> +static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
You should at least forward declare struct p2m_domain.

> +
> +/* Not used on MPU system */
> +static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
> +
> +#endif /* __ARM_MPU_P2M_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 594dc4004138..2d53bf9b6177 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -168,7 +168,7 @@ typedef enum {
>  #if defined(CONFIG_MMU)
>  # include <asm/mmu/p2m.h>
>  #else
> -# error "Unknown memory management layout"
> +# include <asm/mpu/p2m.h>
>  #endif
> 
>  static inline bool arch_acquire_resource_check(struct domain *d)
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index f1417cd1b9db..a963b35db88d 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,3 +1,4 @@
>  obj-y += mm.o
>  obj-y += p2m.o
>  obj-y += setup.init.o
> +obj-y += vmap-mpu.o
What's the point of adding -mpu suffix to the file located already under /mpu?

> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index b196661a2312..12703c4f3d4f 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -18,6 +18,28 @@ static void __init __maybe_unused build_assertions(void)
>      BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>  }
> 
> +void __init setup_mm(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +void dump_hyp_walk(vaddr_t addr)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/* Release all __init and __initdata ranges to be reused */
> +void free_init_memory(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
>  void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index 7525d9b00bcb..b059c86bde43 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -4,6 +4,64 @@
>  #include <xen/domain.h>
>  #include <asm/p2m.h>
> 
> +int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
> +                  mfn_t smfn, p2m_type_t t, p2m_access_t a)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
> +                    p2m_access_t *a, unsigned int *page_order, bool *valid)
> +{
> +    BUG_ON("unimplemented");
> +    return INVALID_MFN;
> +}
> +
> +void p2m_dump_info(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +int p2m_init(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +void p2m_save_state(struct vcpu *p)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +void p2m_restore_state(struct vcpu *n)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +void p2m_final_teardown(struct domain *d)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/* Not used on MPU system */
> +void p2m_flush_vm(struct vcpu *v) {}
> +
> +bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
> +{
> +    BUG_ON("unimplemented");
> +    return false;
> +}
> +
> +/* Not used on MPU system */
> +int relinquish_p2m_mapping(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +/* Not used on MPU system */
> +void p2m_domain_creation_finished(struct domain *d) {}
> +
>  /* Not used on MPU system */
>  int p2m_teardown(struct domain *d)
>  {
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index 45214bfeb661..28119e008341 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -2,12 +2,36 @@
> 
>  #include <xen/bug.h>
>  #include <xen/init.h>
> +#include <xen/types.h>
> +#include <asm/setup.h>
Please sort alphabetically

> 
>  void __init setup_mappings(void)
>  {
>      BUG_ON("unimplemented");
>  }
> 
> +void * __init early_fdt_map(paddr_t fdt_paddr)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/*
> + * copy_from_paddr - copy data from a physical address
> + * @dst: destination virtual address
> + * @paddr: source physical address
> + * @len: length to copy
> + */
> +void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +void __init remove_early_mappings(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/mpu/vmap-mpu.c b/xen/arch/arm/mpu/vmap-mpu.c
> new file mode 100644
> index 000000000000..cb92407476de
> --- /dev/null
> +++ b/xen/arch/arm/mpu/vmap-mpu.c
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
> +#include <xen/vmap.h>
I don't see any use of vmap.h in this file

> +
> +void *vmap_contig(mfn_t mfn, unsigned int nr)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +void vunmap(const void *va)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.34.1
> 

~Michal



