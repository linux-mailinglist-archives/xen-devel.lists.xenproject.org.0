Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6EAFE1CA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 10:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037798.1410320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZPmU-00030R-Db; Wed, 09 Jul 2025 08:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037798.1410320; Wed, 09 Jul 2025 08:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZPmU-0002yO-AX; Wed, 09 Jul 2025 08:03:54 +0000
Received: by outflank-mailman (input) for mailman id 1037798;
 Wed, 09 Jul 2025 08:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42hY=ZW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uZPmT-0002yI-9n
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 08:03:53 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f403:2407::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d4f5c8b-5c9b-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 10:03:50 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 08:03:40 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 08:03:40 +0000
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
X-Inumbo-ID: 3d4f5c8b-5c9b-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7juVyS+MSK7HvFuNlAvx+IHQ2x1esGgrhfKmybr+VRvyULx96p7w5QJqss57ZITA7ZmxsQ6j7YBCGxRFQabhEal27Y5YrphvPZROWW22o/tpl7xt3AvGjarw0ExmIgGK352U7maUfA4hwUvPxXx/nedA7W5EBASkxI0Oz126WLNdhqY06+iK99HU/PiJyCO4naCVNhZ1TSjp3j5N736BhaA7A+EL2YV3i0vZTjBJDseLTsIX+6R2ejMzTC3y4ffDNQ9MBSOF4QNaXchBNkHw6ye4CkPEG9viLtGYgb35FH0u4VLVT/AhglGebHM8KxS9E+ZDSj2THAQz2dvhtLyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBPbCObKd41Y8/NGu9mx8laYVJscCrnQJRfHXoz8O/A=;
 b=wgPNYtD2TCCpA4QixtME7as1z7uRqoO4UYiK4K4ecLhZMzBidjlWeNVbX4G+ixqOabnDRatEY2WjlBv8m6yr10Pj+93WEr0+0UPlNw9fznR54rnyEjjWcRhi20d1rISNfBkq27Xp1EgmTMSIKPaTE7obvll/jVxxqcEXF5N3ZGK+Jw6ZsdVEVn+oFRn6NivJhp3UAz86ZK767xyHGYoQ09BVPa0t698ZlqPa4XblDDECtC7CivmnaRlUEOccPy+2hWVIAPpOdUhWd7PBxz4eEtxI+1z2y4zMjf7ry0dFN+nEco0ks731U/9f+kp+cnpOPKIuJEQUpP3VffPaEVeU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBPbCObKd41Y8/NGu9mx8laYVJscCrnQJRfHXoz8O/A=;
 b=TdxXBytA8EPPkAX+EhdJNiBdAR0hPxnZ//EN9ahX2j+iuJsSpDrvVIYLIEbCGR/UUErnnzHX3iisv608xu4TFEsBvWwZ2tAAf4g8XdMoEyndkBf0CANuLsy3x1rLj6M+EhwVpuil91CkGq9uzuM2YoIg5XC2JaM1GCVNbYuKNhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8b8592ea-2508-435f-994a-826070cd68ff@amd.com>
Date: Wed, 9 Jul 2025 10:03:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm/mpu: Destroy an existing entry in Xen MPU
 memory mapping table
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
 <b3ed60f28d7234f4091196d7bdab8c9ae12ea6d0.1751464757.git.hari.limaye@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <b3ed60f28d7234f4091196d7bdab8c9ae12ea6d0.1751464757.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f1bb8a-e325-4849-74dd-08ddbebf1dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0JKYU9CL29sRnRhRlZYQ2JoTnk3b0JaZWpxajJDUnhNcDBzOVFVMG1adVNT?=
 =?utf-8?B?Y1Jubkl2ZnJSRjNDa0dDVXJLbENISk9ERVNRVytVZ2dUanRIMVJPM05OUFVV?=
 =?utf-8?B?UStjMlA0SXI1bHZZZFZ2aUtXSXRHYXYzam9EMldlTWFGMytJWlY1YzhheWdZ?=
 =?utf-8?B?OUJEZmpBWVNlbjdIN09QQUowc3ZhZjZyTXFZR1puNlBtbXdtR29xcldBSTky?=
 =?utf-8?B?OGk0cVdweTl0UEw4Mk5QM05aOFlLYllRbUZWUXhsbE1lb3creFdmRHpycUhY?=
 =?utf-8?B?cHo5NTdaTkhLTTc2RXlBMER4cGtDRFI2YXprRGJ2TVBWRzBkVVg4YmxTRWdz?=
 =?utf-8?B?YkxwdGh6NEhOZStlZFYzS3RoMURtbHVMUGV1NzIvazdZbWg1ZUdVeXZFSXJJ?=
 =?utf-8?B?Wk1hbXZKV2V0NmNmVnlJenFuYlNveURFeTlpTGIybC9LbkhnWG93VElaRm9z?=
 =?utf-8?B?Q1hZQU5iT2loc1psWUQxOHg3SXY3c0dyaTViTjZ3S1hwNms1MHBKVmVTclhk?=
 =?utf-8?B?eTAxOHRQZDNjUEpOQUdNS1RMUjJGRko4YjdGd1A3OXdQM3BWUTBUVHd4N2RR?=
 =?utf-8?B?b3hRNWFPSFNXbzFFTDRCVFl6RThwM1JUZVB3RzdSM1JZRGtYU1B0dVg5R2h4?=
 =?utf-8?B?U3N4VWphZkxnWjQ2MXlVdmJSUUQ0U3U4cmF5VFU0b1F4RkhRNTVuYXBhY24v?=
 =?utf-8?B?MDVTSURodTRzY29IWnVTak5jd1NQZ1h2V3pjUXhOU0htZFJoQ2VGWThjazJy?=
 =?utf-8?B?eEtjTmFEZHpxOWtQMDd3OTA0Zzc2cC9qZHdyQUo0YjdyNWZJeDNuSm5tMWJX?=
 =?utf-8?B?RFp5c2FENnRpcmxib0F3VkJvSVNqM0hrelJJWUZMck5wTExwSnZuWmt1SXV1?=
 =?utf-8?B?emgweTc2LzF2azllQ0Vadk1vYW9wK09IZ3pLWUNMVmVGYmlQd2h1RnFMNUh6?=
 =?utf-8?B?UnJJOUNVVWFGSkJGU3RLR2FJc1lkenZmdFlwMGFSWjJLeWExWmJLdDJId0Nx?=
 =?utf-8?B?MG0zTGovR3U4a3FWclpia3doZFBPRTB0VXErZjRvNzZId0x3dk9YUzZldm1V?=
 =?utf-8?B?aTdHOHpicXJaeGlNcUpuRlpxK2hIa1kySjRpUVdkdU5rNmRhQ1R3ZE1FZE1p?=
 =?utf-8?B?d1Y4NU53RkkvaEJGRHEwZmhiWFAzcWNYQzdCN1Fpd2p6L1ZQUHhMYVordUJt?=
 =?utf-8?B?MU5DUE8xWHJSQkVWMTA0cmRSbnZYSEVHOHB1N2lsU3Z4Y0pjc3c5WFNDWktu?=
 =?utf-8?B?Lzh4RmU2MXNjNHd3SXVqcHk4ZUp2dFpXSnl4VW5mL3RMY1Y1b1ZyVHdIWWor?=
 =?utf-8?B?M1Byc0phZkZCOTZhQm52WnZiVmQraDA4dXVKTFBOQkwxcXRtc0RXTGdXNlYy?=
 =?utf-8?B?bTJiNlhOVGlJQ25lcUJ3U3RVaWdNOWptREFqWnV4SjQzdnF4RzIvOGZSTjZ2?=
 =?utf-8?B?dlk4dm9MN1F5eEQrekZWdTd2MmhzZXBzK203RmhQSnRRazU0a3JMUXBubjFI?=
 =?utf-8?B?b04yaW1CaWJmbzc2QmErWE1yL1NTTjV4UWd0b0xFUHMybjlaRkIxdTQ0NVV3?=
 =?utf-8?B?MFN4WG4wTjYvNm1wSHZ2Mzl0WGNobUZieVFqL05XSHFlZXdhRkgzQm8wdVVx?=
 =?utf-8?B?S1FRZ2llOWlCWDJhZm83bTRWcVMzVjNmcmpGYThJSlZQN3JmRXoxYWFkenRM?=
 =?utf-8?B?QUJKT0taZnlRUnEwMzlzUHRvUHdVTW9KRDNNTXkrOHNCNDQ0VzJHK3J1TzJH?=
 =?utf-8?B?YTl3ZzgvdnprTWsyc3hsU3N6Z1Y5OTdmQ0ljVDVHeWpHaVo0K0pMM3RDVWFi?=
 =?utf-8?B?STNvME5XM3BITXl6YlpBV2pmZVFwTXZEQUw1cmR2MllwQzlDT2lsc29wT29v?=
 =?utf-8?B?blNnaTN2V1FRQWRVR2Z1eHJ3K3hSakNQc04zMjNSQUZXSjJJK2QxaWxBOG5j?=
 =?utf-8?Q?JHZtouWib/Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhWd3FJWTlmZnNmUENNRGZJeGExdUc5aGhGenF3TEpsK0Z6anpYVEEyYi9w?=
 =?utf-8?B?YXRwRUhvcGRMS3lQT0VXNlB1RkZIZnFCNkpXam1oU2JDZ1pkMnU5clR3Q291?=
 =?utf-8?B?TjRzNXJsVkg2Vzh0NmluR0xXOEFDWXMwa2ZjWWZqTkZ0MVE5VEx1NkdNNUpq?=
 =?utf-8?B?MUtvOEhqc1FhanFIb2ZDODBvNjRjdG1TUHN0aGUySEFVeXRZd29WZnRzTllL?=
 =?utf-8?B?SlZsV1ZMR3RYUVUwT0pLWUlWaWNkK3RHc3VZam9xemc5MDBpWEQxRGtYWTBr?=
 =?utf-8?B?c1gvZFdHNjUwcFYzQkpEbHlKZm9DaVNUcXlKejYyOVpKbkpVOU15Y0hsNjFn?=
 =?utf-8?B?ZGF2SjNQSnQyNnJwdDlRVmNYQ2t0WDVCMGl0NGQyelZyNjk5NVBwVEorazlF?=
 =?utf-8?B?azhjcDZGL3I4SmVsV0REQmpsZUVtdWYzaVBacjB6ckxDM05obWE4RG02VGlY?=
 =?utf-8?B?Z2pqaExKcXFLSVRjc1NkVmkwbDIzeFRoS1VmMFhoeVRwSXh5TmFTSkprZWhJ?=
 =?utf-8?B?SmErK0lIcnBWNVpqV28rM21oMzBBK3ZNT0VnMlNoN3p0WDRJbnFmek11bDNq?=
 =?utf-8?B?YlFiejlIUzZCVGcraTV1LzlkbFNIQmVTNzBvSFRnZGp3RkNnbTJlTEtiS005?=
 =?utf-8?B?S0FuK2V3TGM4N0JWNGV6YzdORlFuRHA2OWRuKzNoNXRQNzNJYkxZb0I4RFJD?=
 =?utf-8?B?WmhhNHkrSW5HNm56Y3FTTEc2ZGtTV1pMOUFrcGsxYlVnU0xYbVQzaWlaQmdW?=
 =?utf-8?B?NTNGdW1oQlU4MG8rc0ZZT2dzMm8yNG5ZNDI4bTBFWisvOUdZeEJPWUtXMHdP?=
 =?utf-8?B?MTZydGRUN05ZUDIzTVJSR1F6d3Rsa2lJYkdpcmlmZ3VrMTRRRlBSdGhPcmFq?=
 =?utf-8?B?SlBYR01XS0drKzdGR0JnYy8zM2dJdFcyODkxWTdqdWk4U0F3TUVwNFlmMVdw?=
 =?utf-8?B?V0JSeEZvZ29ia3pUQS9EOCtVaFZYT0hyRDhiOUhKNGhObGZlTzJ1R2lWMUdU?=
 =?utf-8?B?ZFFOYnIxVVJVMHhSeHc2RDVBL2hqdDhJSFNPeTRVNGR5SXNzc0N2blJBSkpN?=
 =?utf-8?B?dTI4Z0kxQkl2UTF1cVg3RlBYT2wzVTVrOHRwaFFCamRPa2dMclBoZlY3bU9x?=
 =?utf-8?B?YVNsR2wwQTJrV0lnSEwrbE1Tc08zMWhtdVczWHd3WFdUS1ZXY0RZWUFTekc1?=
 =?utf-8?B?b2pBTlVYa2tSUFhlY2tjSFBZTW5HQlBHTUY1akFCYkdhY0JQR01mTVBVMG81?=
 =?utf-8?B?a2ZsYytKaldCcXFVa2lGdjUrQjdQUkErZzRiKzI3cVdGZ1czNUI2eHE0SFN2?=
 =?utf-8?B?b0NNbWxjbGszaG1PeDFyTTBueEJGeXVVYUpQYW8rckdORzRsaDVpeUhuY0U2?=
 =?utf-8?B?VU9OaGw0aHlpY0Rubk1KMHVzQ1dhQjk4MFZ3U1FIdWdXUzR6U1FBWmZlK3l3?=
 =?utf-8?B?MG14SC8yM2dhbkxaRDIycmdodlRmTGZsMm1ycTV3K3ExYnJ2cG80UXFrdVI3?=
 =?utf-8?B?VGV6TGltRmhpeVViQ2o5VFowN21LK0dmeUdzTHlOYWRZMW9lZmlla3o0NXpa?=
 =?utf-8?B?Vk9LVUtSWTVScXlRTmcxYjFZZ0RlSDg2Y3BNNmFQZlYxMXFZeUxlMkJHcVQv?=
 =?utf-8?B?RUNyc0RqMnRyYURGQUQ3N0ZUVjd5WVhtVzdqbmY3SGhwdGlpRm5KNW5haHlK?=
 =?utf-8?B?SzROZ3EvQ1RuQUROYUwwazdiUnRqN05RcUN4b3RNQjY1VHNmeVp1VEQzN3hD?=
 =?utf-8?B?SkNzWjdjWXZ3SS81aFFxR001d0g3dTh0ZThpTVRnQktHSG5yMVp1bWpQckdU?=
 =?utf-8?B?TUtuZzJnakdvUWxHT0RsbG9XMi8zQk5RYTdGa1JJRitzamVIbUVtYS9xUEZt?=
 =?utf-8?B?ZXk3Z3piZW5kMmM1eVZaajBvNHJrU0s4Y1ZuanBhWElWN3VRTnlGTDlEOHls?=
 =?utf-8?B?Tk9PN09FM1p3RHJiVXdCMmsyYTZJTzJaeXY1Mk9YVXA1V0dsRW9BdFlwanpY?=
 =?utf-8?B?bXMyNmhHeXdnK05zVTZrS0xlSDh4K0prVklOUmRGcnhOWUVrWm9MWGZKUzcv?=
 =?utf-8?B?Ymd2RDJkUXltcS9hYkhWVkt3NjVpK2cyOGFhTVBtMU5HNkw5N1lkdmQwQ1B2?=
 =?utf-8?Q?jb+RPEkzcdyIzrwEmQo+EABec?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f1bb8a-e325-4849-74dd-08ddbebf1dce
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 08:03:40.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNf5j9Wm7ZcXjZCEdBsNXusEBl+ta43ceiaVwRq70ti6KTlUOFqH1Zfmb2JirddC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790



On 02/07/2025 16:13, Hari Limaye wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
> destroying an existing entry.
> 
> We define a new helper "disable_mpu_region_from_index" to disable the MPU
> region based on index. If region is within [0, 31], we could quickly
> disable the MPU region through PRENR_EL2 which provides direct access to the
> PRLAR_EL2.EN bits of EL2 MPU regions.
> 
> Rignt now, we only support destroying a *WHOLE* MPU memory region,
> part-region removing is not supported, as in worst case, it will
> leave two fragments behind.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
> Changes from v1:
> - Move check for part-region removal outside if condition
> - Use normal printk
> ---
>  xen/arch/arm/include/asm/mpu.h        |  2 +
>  xen/arch/arm/include/asm/mpu/cpregs.h |  4 ++
>  xen/arch/arm/mpu/mm.c                 | 69 ++++++++++++++++++++++++++-
>  3 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 63560c613b..5053edaf63 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -23,6 +23,8 @@
>  #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>  #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
>  
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>  #ifndef __ASSEMBLY__
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index bb15e02df6..9f3b32acd7 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,6 +6,9 @@
>  /* CP15 CR0: MPU Type Register */
>  #define HMPUIR          p15,4,c0,c0,4
>  
> +/* CP15 CR6: Protection Region Enable Register */
> +#define HPRENR          p15,4,c6,c1,1
> +
>  /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>  #define HPRSELR         p15,4,c6,c2,1
>  #define HPRBAR          p15,4,c6,c3,0
> @@ -82,6 +85,7 @@
>  /* Alphabetically... */
>  #define MPUIR_EL2       HMPUIR
>  #define PRBAR_EL2       HPRBAR
> +#define PRENR_EL2       HPRENR
>  #define PRLAR_EL2       HPRLAR
>  #define PRSELR_EL2      HPRSELR
>  #endif /* CONFIG_ARM_32 */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index dd54b66901..2e88c467d5 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -185,6 +185,42 @@ static int xen_mpumap_alloc_entry(uint8_t *idx)
>      return 0;
>  }
>  
> +/*
> + * Disable and remove an MPU region from the data structure and MPU registers.
> + *
> + * @param index Index of the MPU region to be disabled.
> + */
> +static void disable_mpu_region_from_index(uint8_t index)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +    ASSERT(index != INVALID_REGION_IDX);
> +
> +    if ( !region_is_valid(&xen_mpumap[index]) )
> +    {
> +        printk(XENLOG_WARNING
> +               "mpu: MPU memory region[%u] is already disabled\n", index);
> +        return;
> +    }
> +
> +    /* Zeroing the region will also zero the region enable */
> +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
Is it ok that for a fast case (i.e. 0-31) our representation of prbar/prlar will
be different from the HW i.e. xen_mpumap[index] is 0 vs only .en bit of prlar
being 0 in HW?

> +    clear_bit(index, xen_mpumap_mask);
> +
> +    /*
> +     * Both Armv8-R AArch64 and AArch32 have direct access to the enable bit for
> +     * MPU regions numbered from 0 to 31.
> +     */
> +    if ( (index & PRENR_MASK) != 0 )
> +    {
> +        /* Clear respective bit */
> +        uint64_t val = READ_SYSREG(PRENR_EL2) & (~(1UL << index));
On AArch32 the register is 32bit, so I think you should use register_t type.

> +
> +        WRITE_SYSREG(val, PRENR_EL2);
> +    }
> +    else
> +        write_protection_region(&xen_mpumap[index], index);
> +}
> +
>  /*
>   * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>   * given memory range and flags, creating one if none exists.
> @@ -203,11 +239,11 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>      ASSERT(spin_is_locked(&xen_mpumap_lock));
>  
>      rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> -    if ( !(rc == MPUMAP_REGION_NOTFOUND) )
> +    if ( rc < 0 )
>          return -EINVAL;
>  
>      /* We are inserting a mapping => Create new region. */
> -    if ( flags & _PAGE_PRESENT )
> +    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )
I think we need more sanity checking. What if flags has _PAGE_PRESENT but rc !=
MPUMAP_REGION_NOTFOUND, e.g. function called to modify existing entry? You will
silently return success. Maybe a similar function as for MMU is needed to
perform some sanity checks depending on the reason of the call?

>      {
>          rc = xen_mpumap_alloc_entry(&idx);
>          if ( rc )
> @@ -218,6 +254,20 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>          write_protection_region(&xen_mpumap[idx], idx);
>      }
>  
> +    /*
> +     * Currently, we only support destroying a *WHOLE* MPU memory region.
> +     * Part-region removal is not supported as in the worst case it will leave
> +     * two fragments behind.
> +     */
> +    if ( rc == MPUMAP_REGION_INCLUSIVE )
> +    {
> +        printk("mpu: part-region removal is not supported\n");
You mention removal but why do you limit this place to removal only? You don't
have any checks making sure that flags is 0 at this point.

> +        return -EINVAL;
> +    }
> +
> +    if ( !(flags & _PAGE_PRESENT) && (rc >= MPUMAP_REGION_FOUND) )
> +        disable_mpu_region_from_index(idx);
> +
>      return 0;
>  }
>  
> @@ -251,6 +301,21 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
>      return rc;
>  }
>  
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    int rc;
> +
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s <= e);
> +
> +    rc = xen_mpumap_update(virt_to_maddr(s), virt_to_maddr(e), 0);
> +    if ( !rc )
> +        context_sync_mpu();
> +
> +    return rc;
> +}
> +
>  int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>                       unsigned int flags)
>  {

~Michal


