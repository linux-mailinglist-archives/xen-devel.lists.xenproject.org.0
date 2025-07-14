Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D2FB03ED8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 14:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042804.1412863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubIQx-0006pX-5H; Mon, 14 Jul 2025 12:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042804.1412863; Mon, 14 Jul 2025 12:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubIQx-0006mv-2X; Mon, 14 Jul 2025 12:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1042804;
 Mon, 14 Jul 2025 12:37:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaQv=Z3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubIQv-0006mp-JA
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 12:37:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 492c1bb8-60af-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 14:37:22 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MW4PR12MB7264.namprd12.prod.outlook.com (2603:10b6:303:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 14 Jul
 2025 12:37:18 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 12:37:18 +0000
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
X-Inumbo-ID: 492c1bb8-60af-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehEQjltYynmys7W68ybdS3MS2x4d4J2xuzEKC5fyU08yFWHrWgzUuoKOk+L/4JjUv7qeKWz2omnp5+tBSNkl/U/qn9Z6d1CzO27WE66DlAJR7TIVfJbH+eVlvh4QtIFUMt4RepFWR/C5bbqYn4dthgeOKJRkYAxUYVX6m1SusyaoGX3+aHa0YusaPcQsMfupNPRc8JUd1ROzvSy2BJzFhfmrBd42AOcOl6gZMagyhMu0J2USyyGq4CdBWZFht2NH4S1pmB+fWC9z99gI/QLFqU+HTd1EyvSDAYCvd+Nngx37OrJsDwZHqkty9SDHS7Tz+OMvyj2Tfsu2KUJyo9voSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi+oKlCdaAVR0zVjjBhze4WriwjNb6gEtgmaubLKlms=;
 b=B4gaNxot3TD09aNSLP0Mjj6rz1ndpJlw9I4n2CEGMTqHFzwknEa4C2BKDJGY7LHZiOss+EVajgoM1Qk7h1wwPS4yrwNXy9LGTw1IoOr0Hkf+rMsx2becQD6NP3v3ip9j+DwfhXOSVq1NYvBlZpuVd60O7X37tk/MSwVvo31NAF8RYeTZNFl+2trZ1sgyYu1YjOoUw6ng+B8WWci9qx0sJ/P6BvshA6yMAYfNBt0dP4utuzSOcWmXNNJn9gwMGES9RzUeEWk2q9Hm4kYjRY9MahvlyMgsBBOyJbbRajWZ+dDcQPSd11SKHHkHPqnkA/HNVi6NDIYV6z6X+ZBLa1/xTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi+oKlCdaAVR0zVjjBhze4WriwjNb6gEtgmaubLKlms=;
 b=BsElkJ166ck+Be4sCT/GR+px1gY9HKCsmNaNF7yMPS+C9i4gfpHiVqyR3pC5n4nVaAsLk73rhoomgWKIPl9rl3mtobCvRDoCfStBnFl9TYuCYS6X7KL5gXlPOzvwZ1I7yBTYpFPn/G0RkXbNgN59YFbfhetkTQLY0GZVIHs/F60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3708c185-a0a3-450f-b6b6-a6487fcc17f3@amd.com>
Date: Mon, 14 Jul 2025 14:37:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
 <a6ad4ea4-8eca-47f6-b814-84aeedd1ac3e@xen.org>
 <037ebff1-7e78-4170-a636-989e534dc11a@amd.com>
 <6b89c55b-3aa1-49e6-8ee4-0761234aa7bc@xen.org>
 <b10f4263-c01b-4a87-b2a5-9ad13dc343fc@amd.com>
 <00f0a56f-999e-40c9-a43f-43709963058c@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <00f0a56f-999e-40c9-a43f-43709963058c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0397.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MW4PR12MB7264:EE_
X-MS-Office365-Filtering-Correlation-Id: a71fc4e9-9f0b-47c4-d1e2-08ddc2d32b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mi8wd09NWTQ4ZVVWVHJjWGlpMDYyT0R5SjYxR05zV1RkVDVDZjdMRFhvalhv?=
 =?utf-8?B?VStGYzZ0TGFLREZoUDVGQWxwWkNxMXlid1R3NllLVnFNenJxdXRtNGF1dmZT?=
 =?utf-8?B?eTRSM3lhZlQ3UzNTdGpEenlYaVR5QkpQYVFQRXhwcFJXd1htdkRlWGU5OVJK?=
 =?utf-8?B?WmYzRHdpUllsSDRjVzNGKzNUSW5HYndXbFVuL2U2ZHlXdE11UEYySHlRN1JL?=
 =?utf-8?B?cXhvS3lkaGFNdEVJNFpOZ3YrbEw3bmkxMUFwRkhmZzZkL1QwaG8wSE92eG1m?=
 =?utf-8?B?RlF6NUVkaktvUlVsRExaNEtTeTNjSWZKdEtsUkh4dzN5WUtocWhTTGk4VE5M?=
 =?utf-8?B?SXFyNmRqaUtYUnB0TjZSaVhYNFRScEluY2JDdndVdVIxTithd1lWdndKRlQr?=
 =?utf-8?B?Qjd2dmpEWUIvYnFVdXN3U1Z3RWtzd2M3ejN1aVI1UWMxS1JHbUFLaVZmNzZX?=
 =?utf-8?B?eGxDRGJDWGNmWG56L3piZllVR2xrTGNlV0xFZVRRdmVhU1N2Y0JxNUUra2Zs?=
 =?utf-8?B?TXJGcTNoMUdWYy9jZk5jYTRBNTRjOERuR29sNGljc20waG0rUVZPSVNvN2Q2?=
 =?utf-8?B?MlY1M0tmdVNmbVIwMjY5QW5pVlErUXNzUXAybnd2czdwRUlaSUY1dXVKZ0Fu?=
 =?utf-8?B?WGxZVDY3d2pkZ09waE54VVdoSWJyOHRBcDlYN1N2RWNDNEV6bEV4WlFKRVFW?=
 =?utf-8?B?R1l5M1NWaU1uVXA3TEhTVEtmSjdGQ0RVK2kvQlJENzdLU1lROXI0aVpvYm43?=
 =?utf-8?B?cVE5bkI3VkRianJwemZuUWtuNGtsWE5JV2tCamVSL3ErWklkTkVCSVFCcGNP?=
 =?utf-8?B?TlZ2SEQ1eDFLdTNrcnZVcmtHR0srZzgza3ZmaVZScEhwSHNZT0paUEtTTkpQ?=
 =?utf-8?B?cmtmQXczMWMzZVdIb3N6ZkVMN2NCSzc2ZGRPd0RLVEhGVmhpWU1oU2FHTDZ6?=
 =?utf-8?B?NkZWdTdlc2x6SVZQKzYvUGNTLzYxTUhEOEpBSGN6cDBGdmtGZ0xNZklBQUZH?=
 =?utf-8?B?NzVOL1JQcVoxZ240em5ITmJ6cmV4NW5HY05nNVFNQVMvU1JINkNCWVF4dmFn?=
 =?utf-8?B?TW40VHZnZ1JScVVKcmtkZ1RTZEFGb0V4TWxGYklWUFA1dTEvK25TMENibksz?=
 =?utf-8?B?Wi9Ja0hacHgwMWdKSGw1RW1IR0JBOHpFL2hxclB1LzM3OUtyN1B0ZkdVbzMx?=
 =?utf-8?B?SHZZRzZJM1hlc3hnNjFQS3Q3YlkxbDlSbk80RC9URVNXOEwyZHRwVXlZRWlt?=
 =?utf-8?B?MXl1ZXpYdDIwS0hmWnJMV0J2VmdBdm14TzlRNndvT0VkZFp3citBdUtHUWlv?=
 =?utf-8?B?Rng5cUIrTGNOV0RHOFF5b0lXOEFlSUFVSEJlU01pUDJhdnllWTRvV29kL0Zz?=
 =?utf-8?B?dmROOVR3MGZLSGtOZW85MTRPRSs1WTcrRFl2RWFxTUpNRHZVRDNOTFIxU0Nt?=
 =?utf-8?B?WmdMSDFQK3lQVUFhcXE0NXBsNGlYMFFhTHl1RTVRbjJlZ0dHa0Q4dENmNTVw?=
 =?utf-8?B?Smt1OEZKcU9vaFNvMjVtODFkWXZDZWVhY1lTVHY5UVhIYmRWSmZHV2pndWJs?=
 =?utf-8?B?VnZxK1BRQ0xsczh2bnVXWTdUU042K2RPN2tvdzZlS2NGRmRYN3FaNm5tMU96?=
 =?utf-8?B?WkVZSnl1ZGw1QTNjUHVnZnVGUURFQXF4YzU3S05HczVKUUtIM1gxdDNvdDNR?=
 =?utf-8?B?UXU2Z1cwUjZ2NW5QN25oZUFYR05BT0lFSjlWRFlKL21TbWx1Qml6VVIyVzRB?=
 =?utf-8?B?RS9NeVg0N2xSM01HUmdTSEN4YVhzdUQzRTRvTW90RUo5ZWdhUHNWeGNIc29K?=
 =?utf-8?B?TlpOMXdydnI2UHltUFNCQ2N0WGovNmJFOWJtalk0a0Nwb2kySTNUN2xJbUlT?=
 =?utf-8?B?Ky9HZGFjNlkyS1M4VFhvYzM3OGNOSHB6TUpRUEJBbllrT1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJGRTlWbGFpUC9kTW15S0d3MkZUN2tJd25USUpnNjFYK0JYdGt0cmVPbUlv?=
 =?utf-8?B?cDNRb28rVVkyeitHNVRTa3V1NjBGdjFDUG5WMjkxYjAycTJuT3ZPUGxRaTc0?=
 =?utf-8?B?NUJZcW1hYVN5MFhra2xaOXVaSUt6YjZlZS82YzhOQitQVHhEL0VEU0xJOVFI?=
 =?utf-8?B?c0d2UEZKT2RDeXRiNkJIbGpub1RKdVZjNHlMdWhrZFZWTGRmZzZ4OFcwMG1W?=
 =?utf-8?B?U1JkUVR5MjdtNm9mSzkzcmNjbHFFTHpNK0REMlhJREhPSUNLWTZiWmJhcDZ1?=
 =?utf-8?B?RTFsWHBxTjB4aVRhWEZMbCtvOHNVdHBWWmc1K1V2S2JZRlI5TG9ER01nQWRR?=
 =?utf-8?B?bTFpOTJ6SEp6cXRmcm1aYjdwYVhZWDBCSW1aRUsxUEE3TGFoVkNxTUhwYUg4?=
 =?utf-8?B?Z1Y3WmdhQlN3d2JFeWFXNWJrYm9aQncxRUpEb1FmeEZ1OXJYb21ZUTg3K3By?=
 =?utf-8?B?cm0wdFAyVk91UFlKTVZydEUxNzEyaTNITm5NT01zbXlLUHoyOW1Pc2hVVU5m?=
 =?utf-8?B?NEM3RFNnOGF0NmcwQklHYkgrazFxK2pZQXRvK2lQZjRUZUJKUkVFSHZkL0JT?=
 =?utf-8?B?TGtzWXRsWlUvWS9VUGR3ODMyRU0rWW4zdWlmWVhEdVE0ZDhFaWNZUUcrczJC?=
 =?utf-8?B?L1V0UHV4Ukxlb25VTXM0U1gzYk9ZT2pnK2hWMUE5VWgxYkpxem9Pam15a0Vz?=
 =?utf-8?B?ZWpVTFlHaVYwYVZrTHVIbzNubHJUMDBTODhpYVRzQnNEdkxjdVliNloweDJv?=
 =?utf-8?B?cGlrZks4RnRVT0h4UGgzT3dwbHZzcXRIbjFPaHdRWmQwZHBQQktINURrREZo?=
 =?utf-8?B?VnIvYnBYYjB4QWtOSHRZanFLcytoblJpT1JVR0ZsNlo0RDVlQ1E0MllqY3U4?=
 =?utf-8?B?MXZPZ3ZzVDdxVkhkRW83bEIxMU05b1ppN2Z6WHlJc25BQmQyMTBCNnpuY0pq?=
 =?utf-8?B?US9hMlNTbEcvMVpYVmIzME4wdkFNNXQyeXRWYnVlbU5YTVZYbjJHNGYxbWhM?=
 =?utf-8?B?c3VFQ0hFNG1ZRTRRbE50TnYyOTJGeTV6NmRnRU14a1E4MDRRS0xMOVVEU1Z2?=
 =?utf-8?B?aS9IUDhRL3poVTV3NFNNb0paWEg5TENFMTRqaFJ0azRVY1RkUUg0ZjZmV3pM?=
 =?utf-8?B?VFlrdjFEOTJ5Q2t2ZVQ2MzF0TEdoZjNGbU9hOEJqdjkrN291VDBOSjVjd3Fv?=
 =?utf-8?B?aDNabktNc25ZM2Y2S3lPSVZZRTVqTUZCc3h2VERrUk5lTW5FVjZjNDFjeWVE?=
 =?utf-8?B?aHdQdGppczNaWm9UL1FuTFRVTk1VQXBwd0U0S08ydVkzM0pJcHFBM1pIUjQv?=
 =?utf-8?B?OWxDZjJMSlF0RklIdEdVUGdvR05TdUxmOWZYTmhlWG0yY2hlbDFTVlI3bkR2?=
 =?utf-8?B?LytzZ01MejYyZk9sL2l0Y29DZ3NxeUJxRmltcmVRWkVWMit3MjJHNDU1TEpi?=
 =?utf-8?B?TTZ4S21OVkYyL3NwNUMxaGp4YlI2bFdWTGVwMUdWMWlITjJkVDFWZm5NQzdz?=
 =?utf-8?B?dnBGK2RCOXZIMEdwMHNwSSsrSEVObEFaV0hsU0VkTmNDNGZSRnVRc09zZHBq?=
 =?utf-8?B?dnFSdXRQZ00zeFZCajlFd0h6VTczWWpYUzdnT3dvbEcvZ01MUnRsbVBXNlMx?=
 =?utf-8?B?MkNHTmV2TWhKeEVOU2RrWnMwWkZ1eDlIMnBEczJlY0pqM3c2Tlp6Ri9RSEtt?=
 =?utf-8?B?TVArRHZKajJsUTBIV3h3K2pnaUMrSGlyK2ZwN0czc0U0QXM4a2RFVWthYUl3?=
 =?utf-8?B?MjJTQnRpekVXeVNNSWRvZFdobExJT29OektwSlJtWVd6Wk4yYTZPcW0ybVMw?=
 =?utf-8?B?cTJPY3JROXBpVkJxZlBTOXBUL2FmdDlUWWpieEs1QjdJbm9neVNISXU2aXJo?=
 =?utf-8?B?YTZ5dlpSaDVmQWlxWGVHZFRSaE5ZNCtJeGlpMmFMWnhoZ09GaXYvWm5lTDJS?=
 =?utf-8?B?eHJ3ejZwQ2ZFcnYvSStlcy9oS3JyamFCcVk1UmM0ZFBoeFlLWmUxNitYNGk5?=
 =?utf-8?B?SWRUN0I3YW0wYzJmdk8rVVRJdUdRbThpazQ1UGF5dTBRZS91OG55VkpQRlVQ?=
 =?utf-8?B?cU12SFN2YnhmTk82TzA4MlM4QVZLUnFHRXhZYnRiazNPbDZiVCtlaC9pU0Ft?=
 =?utf-8?Q?zmwY6y+Q2xBXtI4v5BP19IRPQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71fc4e9-9f0b-47c4-d1e2-08ddc2d32b5d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 12:37:18.2812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1srqdYJXDFYqn4EtAPErGTfS1I1dlEDruPASYtqi9PLUKJCi985mHXKewTCwApB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7264



On 14/07/2025 12:09, Julien Grall wrote:
> Hi Michal,
> 
> On 14/07/2025 10:50, Orzel, Michal wrote:
>>
>>
>> On 14/07/2025 11:45, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 14/07/2025 08:37, Orzel, Michal wrote:
>>>>
>>>>
>>>> On 12/07/2025 12:29, Julien Grall wrote:
>>>>> Hi Michal,
>>>>>
>>>>> On 04/07/2025 08:54, Michal Orzel wrote:
>>>>>> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
>>>>>> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
>>>>>> sense to keep the two loops iterating over all the memory banks.
>>>>>
>>>>> I saw this was already committed. But I have a question. Wouldn't the
>>>>> compiler be able to optimize and remove the loops? Asking because we are
>>>>> trying to limit the number of #ifdef in the code hence why we have stubs.
>>>> Before submitting a patch I did disassembled init_pdx() with and without my
>>>> patch and in the latter case the compiler did not optimize out the loops.
>>>
>>> One more question. Was this in debug or non-debug build?
>> It was in debug build.
> 
> Ok. I would be interested to know if this change in non-debug build 
> because we have quite a few places in Xen relying on code elimination.
I did a test and with -O2 (non-debug), the loops are removed as oppose to -O1
(debug). That said, -fdce is part of -O1, so it's difficult to say what option
made impact here.

~Michal


