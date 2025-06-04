Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953EACD9AB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 10:25:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005216.1384728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjR3-0002RK-JV; Wed, 04 Jun 2025 08:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005216.1384728; Wed, 04 Jun 2025 08:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjR3-0002OU-Gc; Wed, 04 Jun 2025 08:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1005216;
 Wed, 04 Jun 2025 08:25:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUNH=YT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMjR1-0002OO-Lu
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 08:25:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71fa569c-411d-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 10:25:18 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 08:25:14 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 08:25:14 +0000
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
X-Inumbo-ID: 71fa569c-411d-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9uweb1VZ87CrPOXpUV0JQ9Ta6Ur/9Uf57rXK8/6swxvEgI24oTUumcmh+vWZy3S6tuG5SVuwuee7P5JpAZ54BZpU2enj1jAv4g97rU4RJZOuJp0vR7A/NRXou06/tkIw1/NnrtLpy9vV3Mtf22Ht1HXIiGFlSLpssz+OhV9I81Vu4Pgw1GpHOjc8NIsL8UzxEZvMaIZQy6DOIGTU4mvIYMfmYKLs6IUEUW9f2P2ltUPifWUIxPLq1/smq+R61b76bFNxenhmVEDNtSUtwQW0Wc4egl5F+N1ymyOdLPDLLgERKj4eAXY/3H89+VozK2O7otiY6Y6G98VSk/1+4a54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjpbt+0/ueKdclJinFewhBc63ULLjOAw6TcJiBj7BW0=;
 b=xlSNwKpPzbBZKMXOeZ//mN8gAreroNofy6M47tAMT0l60krd6+NUYcqA8X/vj8el6x4zo95AE1/AJSKLem2hqixG5kapEJQE5MFgs8ZaAdHEWSEdip1PYlBoP/0+tMesvY1EDHzNKyXZu5e9CUg936ZpT91+a189TXAatJALE5brUpBkY6xRwYr4ubSwSxKeb/SD+OfZqUMKjO8n1Ih1D7gGytvv4LP7/dMh1RkPsl/hodifnmjFSIow8P1UkIScswZC4OZw8SfnRPAoELh2PdSrKtqzsDDTRG/pAQHwMrc8M1/R3be1H5KoWHjqdZGzCpxWiO6leS+3crZZFfZW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjpbt+0/ueKdclJinFewhBc63ULLjOAw6TcJiBj7BW0=;
 b=GJRFKvw3eMWoNQSEc5stjGiee8moOdUeIR3AxgAUkmQv44yGnB7OfPiuPwwF/pGm/JpI4Xf3lk1K6uGW0tzy1VRP4kYpnbu4HrPGsX4EP8pllw60VNQelqmtHKPArf0nwpNu52PvQ7k5FOBEgcekrrfwcmk3WXzv2QQQhpkLtAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a72dc6ba-37a6-40b4-b38b-c543fac27786@amd.com>
Date: Wed, 4 Jun 2025 10:25:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250604072128.16628-1-michal.orzel@amd.com>
 <d8fc3301-30b9-48bd-9832-b4fc18828a0c@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d8fc3301-30b9-48bd-9832-b4fc18828a0c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0014.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::19) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 73900408-ea8d-4ee9-99ac-08dda3415490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1RXZlpORGQvWmh2azhPcDJ3VEIrb0VwVVFWYmQrSm41SEMvYjJZR1ltY2p1?=
 =?utf-8?B?RjZMeGdxbDJmQmdDOElYTXlPN2tuWmpydGplZ2k4RzRQMFdwTlhNOG04dmpC?=
 =?utf-8?B?NEhMK05oWkxjMzNFUWlkUTRRRmlzNFAvWE9UNnIwOC9ONjV3RjlTbUlZL2J4?=
 =?utf-8?B?KzdHWVAycEpwNjBPbE9mY29pZU9xK3FObmZSUWJzUmJORXA0MDhtcjBUMlpm?=
 =?utf-8?B?YnFyOEg2d2pMY1pPV1UvVmxhRXhROE9aaXowT3Y2Qjd3M1pKODhIVU56cTNo?=
 =?utf-8?B?Q01PaXc0cWQ3ZWIvb1hLVklHbHhRcUtRY2FwN3hPY2JuYzRDMDJSekdRTzhJ?=
 =?utf-8?B?d1ZXTWZEMTMzamVIYVo1WnJUbkFkdHZiL0xZSndoOGdQVFU1YURud0o1c0tE?=
 =?utf-8?B?d1dCYzFwTk1QcEdUSGU2eUxlR2cxVzZWMDUzTlhVZk5HeCtIamZ3d0VoNWo2?=
 =?utf-8?B?dHhTYmJwQWh3QXM1WURxR0dDVS9FcTJrWjAyVUhlbzNIc0ovR2IzL3NwYTJT?=
 =?utf-8?B?cm5pTjA4Mm9QcFA1RkN0QjFhQ1hHVHhSU1RuL09uWlRtWDVPM2tYNmJKV1N5?=
 =?utf-8?B?aVBlckgrN1Zjb3JJYzQxNmJEMjBMZWx5MllIUnp0ZllVWVpnd09hUldjaFdN?=
 =?utf-8?B?RFlFbW9weUMxQmI1a0xLcXJ4K3RSTllzcFdqR2ZqSmhHektVY0JpN2FzV3cx?=
 =?utf-8?B?S0NvUFJUT3hIdUtrNGZicldwd0h4cHdLb0lVbDRWc294SmdrUWJQdkZMNnBu?=
 =?utf-8?B?U2hsdW5UQVhYaHFPbXBnTmwrSnp2Y0g0dGdndW1obTlHN2JyMzFjeFhYV1cr?=
 =?utf-8?B?Z1hSUnZuVlFmaUp0UkVDSTVqWUNMZjVvdVU2OEt1dGUrRGVoL1ExaWd4QlJQ?=
 =?utf-8?B?NXBqSXVkcUNPdVRRMExaQy9hdXJlSS9Zb2M4cEtZSndTMTVabHZoMFRyQldW?=
 =?utf-8?B?Q29VWHc2VFZWWXFScjlGc1hybXZsU3MrYllnQnNWbjV1TjdGQmU3ajlMMG1a?=
 =?utf-8?B?Q2dMSTkyQ2p2MEtLU0dnbWs5YlpCTU9SdXorZm1KZlVnYjB4TCtlUmROelhl?=
 =?utf-8?B?elpxYnRnN3lLTVZDckp4SjFDVFJPZ1ZObERVV0NqMjd1QXJ2VDI3NllKdUls?=
 =?utf-8?B?VC9LT3hYTjc3MTNwaTBCL1NCd0tDNVMvVEE1eENYY3RvZ2p1eGpUUUY3cnVG?=
 =?utf-8?B?UXhMK2pLdFpzVlh5SldBMUs0WGgxTTlRSE0yeGlHckJCSk9hZThjcHVCVVI4?=
 =?utf-8?B?MG81aDRLeTNsMGVJd1EzU01KSit0ajhyWitocHcrSUVLc2dtbWZwM2F5ckl6?=
 =?utf-8?B?aVFmL2FOSms5UVkrd05TaW45NmMvUnVuWmp6d2R6OUZ4ajVHb0NPWHVRZTFP?=
 =?utf-8?B?NXV1NEVkUnAwbTBmTVdhQ2czS01mYVNsU0o0NG1jakN3YkFLUHhDeFZIa1pn?=
 =?utf-8?B?dDlteTkvdWpSOEFnUlBOaFEycXRMZUJSNUcwUVJQZjhqMHdsTFFTam51OHFl?=
 =?utf-8?B?TVZQZHVQVUhUSW1hWGgzOU5HLzREbHhBbCtFbFlvbUhaZjdxdFM5M0JGTUJx?=
 =?utf-8?B?Rllra3BVeWlnRU9QSXhtZmluSkNVL09tMGt3WUNqYkxkZUd6MHVML2wvNHk2?=
 =?utf-8?B?Mm0zN3ZoZy8rTk5JcGdZa1BQT2FxMzF4cVFxUFNmVm5WM09oRmFFMW4zbHpG?=
 =?utf-8?B?dEs4Zy84RENnUjBaYWFYU3ZTbCtSZTVPUHdxZDlJemVkR0ZjOGlhQVRJVUQy?=
 =?utf-8?B?RXVNTFdKYVBWVTJWc3pHTU52WldXdW4xVWR3K3FDRGdkYldoMkhDenNWUUVw?=
 =?utf-8?B?U0wvTm1MMG50ZEpVbTlNWk94cFlJNHk1YmdldmZrRDJ2RTRyZlVjeHk3Q2Ir?=
 =?utf-8?B?bHFEUjFnZldGR09xWTlXVFlocmd3WmFDbXplb3UwODRXZFVQbmtPNjF3Smhk?=
 =?utf-8?Q?d89TXeUrVyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REdCS0dLZ2pWUmxuVUVtU3ppb09sOXZvbU9iK1AxbzFXV1J1TjVTYU92T3Fr?=
 =?utf-8?B?allqYTVGVFl6UThOdnNIaTJ4d212NEw4SE5PaU5OdEQ2Vzd4ZFFCcGVHQzBZ?=
 =?utf-8?B?Q28vNGpUcG1OTC9wZE8xVUxHOTl3aTNKcmZPUnlRVHN5Y2VVRUQxbXUreWF2?=
 =?utf-8?B?WE13VjllcmJZVTFhRHZ3TlNIRStkaklMUUNSK25qVjVNbUpWZWFaM2ZaZ2pO?=
 =?utf-8?B?Q2FZVjFHQUJGblZtdTcyYmZ3ZWsyeDlsdFo5RHJBSXJDSGFTeFBlc3IyK2xv?=
 =?utf-8?B?QkpuUW5RTUNzbDYwNFlTRWpEaXpyUUVIWWZ2OEJGUStwRTdOOGF5citoVmxS?=
 =?utf-8?B?eENhZXM3U2J0SzF0VkhlUFFlMTJiams1RE1SZ0dtaHZiYVdDQi9Fb3NwSm94?=
 =?utf-8?B?NE5pdzNxa2p1bmRpMFpwNExtT1ROYm1STUxQL2ZJU3VoVS9iSHFBTVF3alFa?=
 =?utf-8?B?dUdMcSt2dlY2N1VGQWI5N1hPeUtxak9xYnZiaUs2bmtmSktPdE5FT3EwdEFN?=
 =?utf-8?B?NmJpTmJpc2pON0hIN0RpSENXUkZRMkplUkZ5RmZjS05UVXBBS1JvK2oyYzlJ?=
 =?utf-8?B?a1BPcEJRSEFzUXZxRUJqNjlpUnMwRTRiVUNxYnVtVTdZb08vdmFsYXBVbzN3?=
 =?utf-8?B?VDRaOTF0R1oxMTBCMklBMCtQeS82andHdkl4bm1zUWJnZjZic3dlZTF1MGFR?=
 =?utf-8?B?Q1MvT0hScEhiaEFuVCtTUWIvMTNNM0g0NTVzaEF5R1p4ZGRLWFFMMzRvQU1J?=
 =?utf-8?B?Z1lFajhVVEJ5TUpWNU1JNnNxU3hySDR3WkRTU0ZieUFybnhHTXh4My9FekRU?=
 =?utf-8?B?dmhTNVV0b0xHeWR3TWxzRS9WcnFaVzdZWG95Y1pJYkNhbkZsQWdFcXMvZmEy?=
 =?utf-8?B?dWZvVmdwL3hDazJOOGV6d3pTakFLZnl1M2E2YWV4UGs3MDdSeEFUdFJSL1FT?=
 =?utf-8?B?SjdaZDFJQzhJTW5OdjFtWlIxT0d2WXRGbGsrYndHbGU5YlpWMHpTME9XNEFm?=
 =?utf-8?B?TTYxZDJ6dU9jYTJESldvVWJQVEM1OEdwYk9oOUZjZ1VSSDIvZlB3YSszME5M?=
 =?utf-8?B?ckVnWHNtTzg2VzlWbTRsdjBNYm1BVGVaZkp2Smk5RkVCYUtsMlFyclVaTVVZ?=
 =?utf-8?B?dEUyOHFxc0hQKzI4Lytic1dOVVg1d3ZwVWNienJrQ1NGYlJRR3dTcWJBQXc1?=
 =?utf-8?B?OUxjSnlDSWxvMlJ3WVc0aldybFpFV2VoOGM0VXkrQzJUZjJhc08weUZNVThB?=
 =?utf-8?B?QmpieHZjb3A3aDdwaEZyUGdhZ1NheE9ndkhZZnpYNEYzVUtzeVdDV0FOYzdw?=
 =?utf-8?B?NDFFc0xSSUd2Q2UwNEV2QmUvQXNMZVJKZ3hDYkp0c3JaRzlVVktJMnhQdys3?=
 =?utf-8?B?ZGV2S2Y1dXliYVhKc0cyMk5Lc2NCYUhMRjRWcDlpWEdQazBva3ArNkI3YUNP?=
 =?utf-8?B?R0hkWWhwQU5vSmYrNHdNSlorcnpsY291aFQ1UTF2YmRJdllzaGFOVTZsLzFw?=
 =?utf-8?B?dVA2ODFLbWVKZ2kxYWFYNUd3ZEtvbGZVZTV0NGRMK21Vc1Z3cU1XSEZZYThm?=
 =?utf-8?B?V0NxMy9JZUlFK1ViVXdpRkt0UklCR3d5Zld1YUdlM083VkRTbVpwR25JdEhX?=
 =?utf-8?B?Ymp5cTJqeEhXS3NVbEJ0SU9mUXo3MEhFV0o2eWFKNmpycjQxaXhrZ0RpVlll?=
 =?utf-8?B?bmdvSCtsc3pJSlI3cGd3Q3AwWWtvd0U3ZW5HODZodS85VDZPeDBhQjVFV3Bm?=
 =?utf-8?B?WkpWWGNiSkswVVRIeGp6YjEwbnNWazFqTGNUajZTWkJyemhUTDNjY2VoaDFy?=
 =?utf-8?B?SXFIb3BVNFdYV3A4QllRTEowdEFuM091RTZtdGV5ekp0d0VPSStrVWEvZXkz?=
 =?utf-8?B?OXFGU2VNaGR1Z2hzSUsvRkZKQ2lQMCtpdDc5dDJqMUZGT3JsVnZBdEMyMThO?=
 =?utf-8?B?cmd0VXJvanVzNlU5Wlllc3ZXWTJkUTZma0p6bzNSNHdDSGhkYm9SNHI1T0g3?=
 =?utf-8?B?NXFHZkNybkhJcmsyWWNOb0cveU1WUjF1djNxc2dCUmV2UjNadkcrZWl2Z2ZX?=
 =?utf-8?B?a1RVWjY0a1R1OHk2dW9Pb3NrNklacGFWcWsreGtzVlc1Mjd1ZUhPRVp2b1Fl?=
 =?utf-8?Q?MnZw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73900408-ea8d-4ee9-99ac-08dda3415490
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:25:14.6086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhxSkkC94aAh86Md0WMFLeAPxYNZu/XuIdIFDdjuYJizece0HPLUsrRs06DuTx8V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763



On 04/06/2025 10:07, Jan Beulich wrote:
> On 04.06.2025 09:21, Michal Orzel wrote:
>> When cross-compiling, HOSTCC can be different than CC.
> 
> I'm sorry for being pedantic, but the two can also be different for other
> reasons (and I'd like to avoid this becoming a bad precedent, then getting
> copied elsewhere). Both may target the same architecture. Hence I'd like
> to suggest ...
> 
>> With the recent
>> `install` rule addition, this would put a binary of a wrong format in
>> the destdir (e.g. building tests on x86 host for Arm target).
>>
>> Take the opportunity to adjust the `run` rule to only run the test if
>> HOSTCC is CC, else print a warning message.
>>
>> Fixes: 96a587a05736 ("tools/tests: Add install target for vPCI")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v2:
>>  - change Fixes tag
>>  - add `run` rule adjustment from Roger
>> ---
>>  tools/tests/vpci/Makefile | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
>> index 9450f7593a41..f2226a5543bc 100644
>> --- a/tools/tests/vpci/Makefile
>> +++ b/tools/tests/vpci/Makefile
>> @@ -8,10 +8,14 @@ all: $(TARGET)
>>  
>>  .PHONY: run
>>  run: $(TARGET)
>> +ifeq ($(CC),$(HOSTCC))
>>  	./$(TARGET)
>> +else
>> +	$(warning HOSTCC != CC, cannot run test)
> 
> ... s/cannot/will not/ here. Alternatively, -dumpmachine output of both
If this is just s/cannot/will not/ I hope this can be done on commit.

~Michal

> could be compared, yet even that would leave us with false negatives
> (e.g. x86_64-suse-linux vs x86_64-pc-linux-gnu as I can see for my
> system compiler vs the ones I built myself).
> 
> Jan
> 
>> +endif
>>  
>>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
>> -	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>> +	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>>  
>>  .PHONY: clean
>>  clean:
> 


