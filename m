Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305AACFE9D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008221.1387463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSvf-0001Bw-Jc; Fri, 06 Jun 2025 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008221.1387463; Fri, 06 Jun 2025 08:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSvf-0001AV-GO; Fri, 06 Jun 2025 08:59:59 +0000
Received: by outflank-mailman (input) for mailman id 1008221;
 Fri, 06 Jun 2025 08:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Fse=YV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uNSve-0001AP-LA
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:59:58 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20603.outbound.protection.outlook.com
 [2a01:111:f403:240a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d76056c-42b4-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:59:55 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB7030.namprd12.prod.outlook.com (2603:10b6:303:20a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 08:59:51 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:59:51 +0000
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
X-Inumbo-ID: 9d76056c-42b4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdrSDoUy6ZG8QGr9ZS0JbuZV0lofNP5UOu02L8VRFJQw+WVfxuhy279tQvX2XHfvaKyDxKFYmQblcsSfc3sp78HHKaRfI7aYpGj3aUX3vCWpjDIZMR3GScYvPdJD4uQrIFG+4HtfS868bDf9luMGEQHS4a1BGKMqWsUSRRF5VI7iNbg8UdfAiQWDZ5G6PTU8FUK/I+JhCEDApP/3mNSf5XlpuHNU3/kSdjZKVIUyB7iLX/E28fCnYvTCPmeQJSATMHp2rOoRhQR0E+iXTmgxrouwEJ5tVRutJihMhNQBHM3WyGyUCRc2HY987fye+H0QAPqgfYNM2vVofGWPH7ovnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt7+JgPak//uhAmKdPFbycTD6ldH9c/uva0/xO3FQBY=;
 b=U7zX5gvIjWKhjRQPsF0qL9AZOMP4/465uMD77Grr4tSs7mSRLVLqS0QI/+KqDQIsnCOssO7HgoOvw+O6N8tduTPQxqn2zcoBcLTQA/hi8zwOOtwt+SBYFqmkGFGSf+jZdhln//RYdCXF5zIGfPl4hSOkbX+vLcP7Qo1cmewBPjxOvlF5l6mpIczV21wjIVz9b951WypG6X6JonaUcHMeGo7AAeqp6noPBwnwqTaLLppM6NBh1dA+JGiWnPK5chgpC7hntDzip6iXCXIYZp8b1la9cWXgtTQmCxuHDzvXWhuro//VRSJ5x/12CtwBOKWkNKGMoI1dTIyjjUsOmkbVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt7+JgPak//uhAmKdPFbycTD6ldH9c/uva0/xO3FQBY=;
 b=wHjh2sC5EkrhbnUSZbrqaHS7Dvszu0VzsFUMFknZnS4LKDhs8EFIwYWhWJYCpyPRQH/BYlVlraC+t5habrwroX7sAm6wcq5Oj+xYHiRlRJwG0diBWgJFIaQVgdH9TnNyGemeDuoxPp7fpzl2f/wPJ+fvRULczgCSPxyq4l82d6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <633ffa7f-cf26-4ec3-a153-28404c39d882@amd.com>
Date: Fri, 6 Jun 2025 10:59:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] xen/dt: Move bootfdt functions to xen/bootfdt.h
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-9-agarciav@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250605194810.2782031-9-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DXXP273CA0018.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:2::30) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 8813d543-1282-46e8-f593-08dda4d87f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDlDMmluWno1cG1wRjIxSS80V2xVL3I5VTMySHZKMUlrMDJnM0h5K3NLMmNx?=
 =?utf-8?B?L0lBR3dWb3Bpb25EYnZxSWNhbndxd0dVci8zSjdDUHVKM1h4ZExpWENycUl4?=
 =?utf-8?B?ZmkxVHZIUHV4RGRLaHhwcUNqa1IvVzRvTGtqeHRRNFcvZTRKcEdJUmZqUWVj?=
 =?utf-8?B?TXJMMWxqajBva0Z6UHZYZXZ0K3p6aXVmYnNqWUxObFRxZ21xeVlFdTduZDZr?=
 =?utf-8?B?MU5GeEVaMkJ6S1E2YW5QL0ZnenEzUDRBbEJxRFJWeW41Tmt6MlNCYURSSjBQ?=
 =?utf-8?B?M0dSc1JyYUhTZ1pxZmV4c0dNUXlEOEI4dW85US8xUlZMdGkwaHRoRnJtZVdM?=
 =?utf-8?B?QnBiK2lGN2V4THNOQ2k3NkdFcjlpVGpqTDluUFZwdUsydTFJbFl1RXhLeEdO?=
 =?utf-8?B?MXVMa0FKa2ZmSTk3YUl3d01PYjBjTVlYMmkzVm9iM3A4eHkrakpaOVVHaEVR?=
 =?utf-8?B?T1k2eFFWMFJKR0RNKzdGTUlhRFJzV3ZTa0RlUFZpdmxyVjFERXU0ZUh5RDNR?=
 =?utf-8?B?NTJBK2J4bUtvdzBWajhsUFYyYjBudkkrM0YwcFFGVTdWQWpWZlhEQkFZamNO?=
 =?utf-8?B?UXBhdm8rcWh2NlVqMEwwOW5QZDlLbWNHRU9IV0hpd0xiRmwrL20xbDNnN0Vx?=
 =?utf-8?B?S3ZOcVFqcWdTL0VGSE5QQVAzelVPcUQ5ZDJDc0RDN2pRNEZpblhwcjZ4QzlT?=
 =?utf-8?B?Y3A4U3BpV0VlV0tTYXRtd0F0a1R1TFlXUXY4My9ad1hXSDNwM29EeGlyc01y?=
 =?utf-8?B?aHBiNFhaWjk5cXIyRzlabTdvSU96THNyOFdycThyWWpWTWwwUEE3ZTdEMzhy?=
 =?utf-8?B?LzZ1aHZqSWd0UTUwK1pWWlZ6elZLL3p5bzhlN1M5akZHbFlpM2p4R0tkOFNU?=
 =?utf-8?B?UVRabU5MUWpsTXhMai9TOXEvL3Z6T3owWjFmZC9aNXF4clBZbjlXMXN3QjU0?=
 =?utf-8?B?Y1BEZDZqL3AxUFBhaW1EQ0dWZDNuZGttbVZOQXA1OVdiVmMrZUlGR21hTVcz?=
 =?utf-8?B?Y3RFTU9Pb3AvdnpmT1dlYjdpVy9ua0RNSldOZVV1RHNweGZzbmU3MXpDRUpI?=
 =?utf-8?B?RHBFQnA1WVgydGN5QjFVSmsraWNaakxESkkrNWNyQlNjNFJCNmViU2M0RTJr?=
 =?utf-8?B?QlFSM1ExUWNCTWpjeUZBMk9NUzk4aWlMdjVrZ1FxRTRRU3N5aGFBTjBHRExJ?=
 =?utf-8?B?TkY5M0ZCeE1jdmM5UjBPRVZCeS9EdE91bGtGVVFneXU1amtGRTFWSkdMRGZB?=
 =?utf-8?B?VjRMenEzSGFKNmJFc29KYTA4aEcwaGhTcXYrZGVlQlJsMkxNQkVDT0pXbGFi?=
 =?utf-8?B?ZGZKQVJZdGpLU0VkZDlqQTc3R0xXM3J3dFE1U3ZhU25BYVNoY3NRMzY1eDEz?=
 =?utf-8?B?YTJENVZyK0NWano5cldzSERQeU9RUEdTNjRpMkZRQ1d3bUxmVTc2bXN1dy9y?=
 =?utf-8?B?WkM4RlNYWUtKU0RiK1lZZ3pTR0hWSWZHNXVCVFdTQUUwVjJZRXkzVHl3OTNs?=
 =?utf-8?B?cDRBWEVKbkVHdUtFYzYwdGJyZWorTGZWUVdQOWllTUI4MldYQkhyNGhVL0xJ?=
 =?utf-8?B?VU1QbG1aaVArS2lzUzVMMUJqcUFFdjFLZFRVanYzNXc3Mi9JWjJRb1o5Z0NT?=
 =?utf-8?B?aG5EM0lFRnUveHJ6M0YzWDcrQi95QlVkNkVlOFBUOVRzVkpnQVc4L0xPaHgy?=
 =?utf-8?B?RklEb0xjelArcHFrMkI2ZE1xd3kyT1l4amNHYW4wTG9NOWJka0s3M3Q4UEtn?=
 =?utf-8?B?Zjg2YWxHK1BXZWdvMUp2VTBDM01pUksyOTFockJyV01PSHlDSDlhTHFhdGZK?=
 =?utf-8?B?UzlEczQrRWtsL0g4cHI3Z3JmSm95K2swVStZUGlaUFBacWJ6TUk5OVlNdkM5?=
 =?utf-8?B?OHU1YjJwT1d2d1NpVVBUREhpTm40RmZHZlRJTkhrSWd6RXdnU2hEc0hlbUgz?=
 =?utf-8?Q?YUXyoeDlNJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW12Z2IyckdXLy9ES1F3bjhOZ3I5Mmh5WDk2ZThyTFhLL0YvVGRIcnIwYjgy?=
 =?utf-8?B?alhiRXpXbGRhbnoyWUZxQ1dVU2VqZ2xaN1IrUnRTY3h5aHdOTVJoM09TY1g1?=
 =?utf-8?B?dm9NZVlLNGhJOEpaZzBvN3RNckxqcWhpVlVaRW5lR3VORWxXTk1kd3E2WlBN?=
 =?utf-8?B?RWw5M3Q1VDZLaTlMaW9yU0lLU3VnVlExU1FlMUhPZWRadjFWK1c4akt0cUo4?=
 =?utf-8?B?a2psbkVIa0tITHA5S3NiakM1N3JUV0N2L0MwVjJZb0tiVTJtaVJycFZDSW5a?=
 =?utf-8?B?WFJ1Rk4rd1k1SXQ0VGRibXphNVhxcFFtREh0NUlnVm56N1FYNld5RFdSTnVp?=
 =?utf-8?B?N0VLVnZmZVBnblg5dWNNdDFSVmhkdVl1TXRPM0hwRmlMb2FoNTh3QXN6TjRZ?=
 =?utf-8?B?MU40N0tyOXZuSkp1aWVvNk9Lc1JnS0RsOXJKTzFDd01rUndxVWhwS28yTllY?=
 =?utf-8?B?eXl0SUo0RHpKeFUxOExKemQrdXpLVnQ5dEZFSy9qT2hwc3JPRWg0OG1xZHVT?=
 =?utf-8?B?NjhYZ1FwaXMxVG96T25nSHFXRURuYVF1RzE5b0pKeDdIMnE5N2p4RFBhZnMw?=
 =?utf-8?B?bXdJQ2ROeFRvQ1MrTFBOYXFxcWQ1Qzg3MlZRcHpjUlU5YVFmLzl1YnR1S0hM?=
 =?utf-8?B?RGxnb2JqeEEwTk9GanQwNmZDeFdyM1ZHUVhRQmlLRUFqSmZCakhzNFpoUUdZ?=
 =?utf-8?B?STlaWkkvUFd5M2NwODVTRWVVRk9ER1ZwVFJjdnkydHVXWGNUbWZ6dHE4Uytt?=
 =?utf-8?B?Zk9KQmhsNFZsc3hRcU9DMlJTbWVxdVdGRGF1TmhUb3lrUzJudkpCTVdqVjZS?=
 =?utf-8?B?N1Zka1FLbVRwTHF1c0hJQjVDYTN6MW0zVTYrSndWcDZyYllGZ2FiQkQ5VWdx?=
 =?utf-8?B?TU9HUC82MndMUGdSMGR4U1NnUHEza3ZIaXlwRExoR28zd0ZObVUzTWdsTGVj?=
 =?utf-8?B?NFNTREozMFlKTncvTWE5cnJJd3V4aDB6cy9icXZLeVp2VkVKNEwvY3lQKy9p?=
 =?utf-8?B?cTVucVBqQW41TkZWZ2VuMllnWG9pWnk0S0xJOHdxYW1LeFNQdjVyWW5wdFBm?=
 =?utf-8?B?Z3lYcUZYU0dJZUp1RnRhanV1YnJCNDBnM2Q5Sy9nUExzOHZmczg4am5zVzY1?=
 =?utf-8?B?L3puQlZlTWU4L0lxRjVnemFtbEZyQzdkbjY2V2RWMDhsZmJBUCthTUU5dHlz?=
 =?utf-8?B?N2txalN1Q09tb2pCUUZwOWI1YUN5MEpTcENtdjZjYzlkVE9acVp6VmdXS3Fm?=
 =?utf-8?B?b0VTVUdubFFJaTF3dTdVQ2NZVCtsVU1xOXBlay84ZHZOVEZDd1ZSTTFtbXUx?=
 =?utf-8?B?K0ZCK2JnTHRhM3ZQWEtNT0ZocDdjQURNTmUxUFRhRkdYaGtJMmtsWFVWVE96?=
 =?utf-8?B?Z0RGV0w1N1phNTFmckhJT0ErRGpyRzU3Mzl4Qm1MZk83OVQrSUdVSEFReURB?=
 =?utf-8?B?Qk96aUJ1Y25JelZYVXFha3EwOW4ybEV0YXAvSTV2Z0IwRTJlbTJVMDRjcHJC?=
 =?utf-8?B?dHRqWThSamN4SWZpV3dzWjkrNDllako1cTRQYlE0NXR5cmxIK2tuQXlFand2?=
 =?utf-8?B?dW91UVh3WkM0MU9tM3F3S1d0THlXaThZazZ1L2I5MEVLUzlvWDczNmNoc29Z?=
 =?utf-8?B?UFdoTENiV3FWN0FnaTB5TGdPTU5yWWZGZm1PZVFOeUpsL2hQM1pvc0VkWmlS?=
 =?utf-8?B?U2NmaWdOMFRRWk9LQk1KZHU2MGI3MjNvTit3aHMyS1VQejZMaEo1QVRlMk1q?=
 =?utf-8?B?bkdqK2czN0ZNNUl3azlOZk52dUZzTFdCWTdkV2R0dk9ySE0zWUpiS3dKMXpq?=
 =?utf-8?B?bkRuTEUxWDVRcStSaFJHS0ZZYUgzRjQ1Q0FPNkhIZXBRaGVxa1UvK2lmUzlR?=
 =?utf-8?B?RWFPQU5Vbk5OVG95aTBlRDlRdXpla1llRXpIYUNSK3FwRUtOSHhCd2hsTHJT?=
 =?utf-8?B?OVBuN1FOSEdjVTVHUFJIV3JaZWplOGYvQzhBOEp0MXltSUdYTjZUU1RPcllZ?=
 =?utf-8?B?ZWQxWEJvWW8yRmlKdkcwWWZTaUhXSVBBOWREN2lTVkxBdTFldzJNMktieUdB?=
 =?utf-8?B?RE00Rk5Na29ZS2U3OEpTbUllRC8yTTc0aHl6L1EyVXpNTmpRN3Vhd20wMCtt?=
 =?utf-8?Q?FpGTDQ1vIMgYFw6pYEtBdatx1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8813d543-1282-46e8-f593-08dda4d87f3b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 08:59:51.3739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH06Z38FbWKAp8BOrp535pYGKzc7TL78nXFDoCK9m1kRKeEvWo1sYzyUrBPuq3lC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7030



On 05/06/2025 21:48, Alejandro Vallejo wrote:
> Part of an unpicking process to extract bootfdt contents independent of bootinfo
> to a separate file for x86 to take.
> 
> Move functions required for early FDT parsing from device_tree.h and arm's
> setup.h onto bootfdt.h
> 
> Declaration motion only. Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v2:
>   * Remove the u32 identifiers in the device_tree_get_u32() implementation
I don't understand the reasoning behind changing u32->uint32_t only for one
function in this patch while leaving others unmodified. Also what about u64?
Either don't change any or change all.

>   * Fix an existing const-stripping case.
These points should be mentioned in the commit msg.

~Michal


