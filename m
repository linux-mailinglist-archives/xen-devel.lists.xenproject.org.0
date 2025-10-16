Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D0BE4935
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 18:27:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144644.1477986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Qp0-0003v7-Aa; Thu, 16 Oct 2025 16:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144644.1477986; Thu, 16 Oct 2025 16:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Qp0-0003tT-7n; Thu, 16 Oct 2025 16:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1144644;
 Thu, 16 Oct 2025 16:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9Qoy-0003tN-Ow
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 16:27:20 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fac47dda-aaac-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 18:27:17 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by BN9PR03MB6042.namprd03.prod.outlook.com (2603:10b6:408:137::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 16 Oct
 2025 16:27:13 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 16:27:12 +0000
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
X-Inumbo-ID: fac47dda-aaac-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAN+my2Ardh193b7m2l50cRekeJm6Ep/9FcJnrayM4vJq2Vjw/yhHA2a5XPoM+5ZvKGn14A6SRzk5pefXUiFV+TipLNbFMREQ2KFuitXCqmq0dSSODkK97AwN5McDF1qkaNeuzKTJ4Tj5ISFIGqs8gG4s4tJVqK43DpPEOVc5YRKeli3dGagN96YYOCj9rqvJO+r0r4PtrC8iwijbhrmTW+KkgzaE1LCblnhzFX7+b2wnNdDre4RguB1XD5N1VJLrCRqLIkH2/SP7KQEwRIFvVCj8mti8fkd2xFWM7d2SDJ0HZgQzXEgWJ4CKpgTfUq+Sx0PpUUBRAiS3XcZ9fzJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szVWMCLcw5g4qjwk4j0p7wYe2rI/mlOBQkDrIOIRDE0=;
 b=V18ArW7HMfpl8uNXbgwYuNFtmigKCvkE7SzvJ3f/luRsBpdB1C6nZt40tdFQMPKCyxkbMKGN3eeZuNPYFSjlx2jHfXktubs/91j7j9aUSF5UIeknxiXedYbMdbDBu5OC3CrqxBkrT+UvaGz1Pi+rZqYE4ILP7uINgKqZt9x7Hs4r4yYDDOu/sLGYhmUHayVlY94GeqPdxcRQjXeTZLnQDG9Q/SvxhGGMpQn8ITi/5dwOeCO0TGghIOHzh5HnOojSwql7PzBJsOvUUkf1KHViHZBWW0Hp0ReIC1Th4yMD3cYqYTIB4TEX/s3WZ8chslc2YXCEKUe14IdczF2ikfb5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szVWMCLcw5g4qjwk4j0p7wYe2rI/mlOBQkDrIOIRDE0=;
 b=KyqLczHrtbT2rBarnLp/SI+WQKe/oukOJr0Qte3A/4VRD78YgcLHDhCGewYkc4opdfsFKiEif04tuB7Hj6W/XoQBSz+yAQqFW+0fdolVCgZSl41WgZ4Skz46rUrbUk3QIlSxT9MK1Cv4AhAq4+uC57nVJIlVn1BFgeFRRglagCI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 18:27:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPEc3VWLI0ofq22f@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
X-ClientProxiedBy: MA3P292CA0018.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|BN9PR03MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 11960313-7446-426d-68f8-08de0cd0dc89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUMzQnZNazV0S1pWM2VKZWNUOFNmRGZRMVc0cHVrT3Q2VVpkT09WR2paQ25X?=
 =?utf-8?B?cXBpZnBqTlhkNEZaWEtwbEVVd2Rra3hUcE95eVU3dzlscysrU2VUVmcvU0NN?=
 =?utf-8?B?eU5OUmd3dTFEM0ZLZHI0SDBQWnNJMjdQU0hBUVFHR2lIN3RZUGZ5czhHWkFJ?=
 =?utf-8?B?ZnRpeFB5c0dITmZvTGNCOXl0bjZuSEwyT01vRUM1VlNycnpXdzZwQnJTdSta?=
 =?utf-8?B?TFdDN1VCOHRiTnFaNmJaN2Q1NWZQRHlmcTNwcUhSRW9FRnBDVGpqL3U5Rks3?=
 =?utf-8?B?eGQ5ZFVPd0ZwaUI1dnlOQkxtU2kzbUdleThOdFgzcGNPUDA5VS91QVgySXBj?=
 =?utf-8?B?d3FIZHp1K3pEbDlwWU5IQloyVmFwL2JLbWUwanVFYkJFKzFNVWdrdEFpck5a?=
 =?utf-8?B?M0k3V1dOMWNYUmNtbDhuWldya2Q5Z0pZVzZ1RUtESjNaaUJHdzZNelRtMStk?=
 =?utf-8?B?Zzl4MmU5RURMWTdNNmlyTEMwUlhodzF1MGVOTXBaTTBrMnlxaytsY2FQQm1K?=
 =?utf-8?B?blNiK2RxeUdZYmtveU9tcGUwT1NSQWl0OHpKVHpFakh0OUxaeDQwVWRocXN4?=
 =?utf-8?B?VExJeGc1bmp5RlJrNmd0SzNkNVgyUXNSbVRBbDc3cjNrMkFpS2xIc2NNY2My?=
 =?utf-8?B?bCs5eFppaHJCc3lMbHBGUWpWWWRlRXpVWFVNOURMZ0EvWDhwWk80UWUwME1p?=
 =?utf-8?B?bnkzTTVnT1l0MnEwVlRBckZ0MTF3MElaQklvQWNtVzNtL1l5MzZ0c1NNZlpr?=
 =?utf-8?B?eTRvNXhpUzdQKzJNYTZSYlBtT256eWh2UjBzc24zeE9wa094L01iUEFmRUxB?=
 =?utf-8?B?a1Q0MkRMUWZuSGlIamxJbE10UFlPRS8wYzB0UlQrL0ZGT2doanAzUWd1cG1w?=
 =?utf-8?B?VzcraXduUWVJNmthbDdEOWdEK3ZYT0E5WDdBZE1JSGYzWnpxQkVJd3dkeGtU?=
 =?utf-8?B?Z0lzWTFmZW5TRm9tZ09ET3hkaWV0ODVhQXNERkl0N01OQkp4ejQwUDJnODFt?=
 =?utf-8?B?ZFl4am9SM1NKUWtYV2hMTlljWjY5eHV3OWJrUi9hYVc2aHpyYUZlenJQV2Q0?=
 =?utf-8?B?b1NFN3NzMThRbG1ld3AxQkFYK3FtZ2JKOTRnQWVPU1JkSlZaRmdCL3Irdmtw?=
 =?utf-8?B?cmU1bklUNEZRRDVPUmgxem1zOUp1MlF5eDc1WVRrNGdEUlZheStXV3I2OFky?=
 =?utf-8?B?eFpDYzBjZlNlMndYcUZ6NVJrbGR0ckJvTzhZdGg3MGV2RVB3TlRLR3JnWThT?=
 =?utf-8?B?cmRPYUtEeGRGaHpNTm9YYVo4a3pSYUJmTmRkd2c2ajFxRlUrUXNTOWM5N2Jq?=
 =?utf-8?B?dW44WEVzR0wwenB4UnQwcEQ4ZFlIeGtHK1BBRVVOeHNJblM3NkhpOWhpaUZy?=
 =?utf-8?B?OUl5TGIveFZkejV0ZE9aeDJaak1LOXNubWsrOEZJWnJBWmUzTkFkQ1l2djFa?=
 =?utf-8?B?cnZxK3RFQVZRNUJTSFBSRlZaOTNzcWxlZ2pRa1ZmNCtjMkxXOVVTdlpWcldX?=
 =?utf-8?B?QUFBK1hudlErVXZxSXVYRll1clNJaFIvZ0FVY3FvUUROQVk2Y29tbmdxY2lX?=
 =?utf-8?B?QnBxeDUySGdySUFEL1dGampHMlV3a3RlYkVEUnhvU3ZXSG0ySmlSWGM5SVpy?=
 =?utf-8?B?aXFNd05NbTJqYnUwMVFKTEZqL2VBcmtXMFZzQXdMSlkyV3ljYW96NTNzWFdH?=
 =?utf-8?B?elJrcnRJcWJNSjQ1c2oyQnlqLzNMREtGazRSRXhCY2pxblg5RWFNU3JlSlo0?=
 =?utf-8?B?emZqd1VYd3RXYzRxa000TlFaSEZhL0V4UlZMNFU5bjJSOGVseDM1clplZGdu?=
 =?utf-8?B?VS9iQysrZ0NSdHBxaERvVnJpQzZzL0NDOUp5Z2RmQW9pd0FoZmowaEtjZ3lq?=
 =?utf-8?B?Mjh3MWYvRmdWaGtJU3RkN2JTTTJ5OXlObWN5YWdhSE9QbTh2R0ZFdW8vOXBN?=
 =?utf-8?Q?xWm3izLaUynkgO1DJAAQWGrIw3RnF4dS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzh4WWdic3hZSDQ3a3ZsU2JnYStYc2JlTENnUkE4d2hUSEdNd3MvMlBuZFhn?=
 =?utf-8?B?bU02cUdncXJLQ05yanRkbi9hVGZHcmlZVkFyb2NCTFFZWjM2ZlA5a0RPZjFt?=
 =?utf-8?B?MW1aNDJxQWVxSWd0RWdvTVY2Y0lGQlJpb3N3NGJxYjRiZXZuai9pdVpnRmNF?=
 =?utf-8?B?NW1aZ2RTc0ZsdS92NUlMS0RORFJsYU5GSkRid1JYVC9yK3BHY3V2VWtWVThK?=
 =?utf-8?B?dUxGQ3JYajh3UVhWa1I5VFQ0RDdib3BLYm5NU3kyT3RSaFdFdDRoWEVBSC9V?=
 =?utf-8?B?YWhRcURnYlAxLzhKNFVvT1JYWURYYXVRSEttTkRzTDM1N0lqdTk5YWZtWFlE?=
 =?utf-8?B?NnFNU2lhRXU4SEQ3MXY0UmpMd0dVSnJyUnR5MFRaY2pVS2Z1SGlIMHdHN1R5?=
 =?utf-8?B?WGl4cGdKUE9sMFZIcjd4NXBDb2F0dFNjN1VLTGJpRzBxMVh0M1FCY21SdGVR?=
 =?utf-8?B?VVUvUlJNTG9wUWJPOXdoVUx2NUgycmg1NGR2RjN4UC9BWkZSS2VHdWhuMERK?=
 =?utf-8?B?THJ6ZytVYk51OWVRRXNjZTBlRVpTcVo3RUtGbDRvTnNmU21lZVJsTzhJR2xY?=
 =?utf-8?B?eHR2UWtCZkNpcmw4aGE2M3JOd1o5VjBKNjhWYy9EL2h4ajhLTkFzS1FZdjdi?=
 =?utf-8?B?Z3A4aUxOOXVZQzk2QUhvQkFKdGZmczlLS2Z0c3lBS2xnMzFPbnlNYVRSWEM4?=
 =?utf-8?B?QzllQjNyTzZNL0xnNG5BSXhucVY0MDd1VHhCSFVxeVo3L2lFN3I0YUYzdDcr?=
 =?utf-8?B?citlV3FIdGFhNjdBcUwwQkpOU1RvQUIwdW9tSWtSRnZXdi9uaVljbmJsN2pM?=
 =?utf-8?B?MzdIOStJTVkzM2xkcm03MGJjcUpRTEtTN0hNMW5ZRE00WnBEWFFaTDdMbTAx?=
 =?utf-8?B?bGJLSDBOMWlHNlgyeUNod1RUcEtQNW5Rd0ljMGpkb0o3SUt0Tlk4cmRpZXFp?=
 =?utf-8?B?UzcyeHArM1FETk54dmtRYlJvaHhjUktzcEd4OWl1ZnNQMm1LU0xmdnpzbVVF?=
 =?utf-8?B?OEVncnY2S1pmcndSUWF1Z1FnVVhHbEhDV1pMNzhqY3NFVUM4amhPTFFPbDhD?=
 =?utf-8?B?MFR5NHRzUG5Xb2RRb2c2MlMybDNlekhiK29CdVRoWHA2dFpwcFF0U2RyVXVW?=
 =?utf-8?B?ZHpTUElIQUw3UVc0OG5OZDJ5NHN4Yy9PbDdDSGR1Y3J3Mk5vaHJXbjhXeDlz?=
 =?utf-8?B?dnU1QU9uajFmck5Ca29rZXVXdXduVExMTzFyWDNwOXgzZnhXYTczc08rQXRp?=
 =?utf-8?B?T3QybUJKK2dhblZLbzJ5MHNpeitpS0sza2dFdnU5TXViRHJrUE80aEcyV3Qy?=
 =?utf-8?B?WnRVV3NxMk5vWDgwem14TXJWR2N6K25WemVQbmlLc0JndXZxbDd3YjhwdElL?=
 =?utf-8?B?T3V2UUs5cnpuVWx0WSs3ZWwzbmVXVERmMzR2UzMxYTlzNjM3OXI1d1p5Q1k3?=
 =?utf-8?B?OUpSWENwYjFOU1h2WmgycWdoU2x2T3BoVGdyMG9NTnhKQXdQN1RobkE1RnVo?=
 =?utf-8?B?bFlsOUZJVVQ4MWRsT1I0WWZPc0tHWEhGS2tIdFY4azNwY0FYcndubHpkQ2ht?=
 =?utf-8?B?ZGpueHl4WS8rVGFvb2Y0MUtyTlRmYzZrQ2E3bTdUbnUydGNscWlSM0lIOFJZ?=
 =?utf-8?B?OGtqengweDllSVJqVjJrY2oraGdPTENERDNrSGhCc3JQeTNadWNJRk1BUnhw?=
 =?utf-8?B?TWY5YVBlQmVMbTIrOGtkVm9rWXFyRm9kU0lLOGJCUzgrZElLcGR1VGdDM1pE?=
 =?utf-8?B?ek5weE1lMmhYVEFvUzdTT3FDSkcyZUFnK1kwc3R6eko5dnduY05EeS8yYjJR?=
 =?utf-8?B?ZGY5bHJpb3JweXpGWno0amc0YjBoM1pZaHFFT0JKVFF6YlFLcTJWRFZmUkZl?=
 =?utf-8?B?djQvVUN3TGNuY21RVGN0TWwzQXdmR2NZb3pHNjBtZlhRajBKQi93V2pOVjdF?=
 =?utf-8?B?ZHg4b2h1ckp5MXNPZUxSNXZhNk81Y3c2QjVvbEQxWVNsQVhRQStvMFM2cmpZ?=
 =?utf-8?B?QXZMMENZdC9DWFN6NEE5bEJaUFZTSFZTS1MzOWZmeVBSNjdZeW9mT09IYzUw?=
 =?utf-8?B?VEloa1JnS3AzM0ZqRkdReU1JQ0VoeXJZV0xvVGtUcmJEbVFsL29jbjRPRFRn?=
 =?utf-8?Q?wWa1BuaetETwKUupACGdkFu1d?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11960313-7446-426d-68f8-08de0cd0dc89
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:27:12.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1h1v98uJST1J2SP9ij5AX2evv4bVdi1lolaNQsFoQop0B0W5ovf4DSl8RXj6L+IeZq4Almx+c0sgSxKYSRTMTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6042

On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
> Using dynamically allocated / maintained vectors has several downsides:
> - possible nesting of IRQs due to the effects of IRQ migration,
> - reduction of vectors available for devices,
> - IRQs not moving as intended if there's shortage of vectors,
> - higher runtime overhead.
> 
> As the vector also doesn't need to be of any priority (first and foremost
> it really shouldn't be of higher or same priority as the timer IRQ, as
> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
> and use a vector from the 0x10...0x1f exception vector space. Exception vs
> interrupt can easily be distinguished by checking for the presence of an
> error code.
> 
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
> 
> The Fixes: tag indicates where the problem got signficantly worse; in
> principle it was there already before (crashing at perhaps 6 or 7 levels
> of nested IRQs).
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -9,17 +9,19 @@
>  #include <xen/timer.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
> +#include <xen/cpuidle.h>
>  #include <xen/irq.h>
>  #include <xen/numa.h>
>  #include <xen/param.h>
>  #include <xen/sched.h>
>  
>  #include <asm/apic.h>
> -#include <asm/fixmap.h>
>  #include <asm/div64.h>
> +#include <asm/fixmap.h>
> +#include <asm/genapic.h>
>  #include <asm/hpet.h>
> +#include <asm/irq-vectors.h>
>  #include <asm/msi.h>
> -#include <xen/cpuidle.h>
>  
>  #define MAX_DELTA_NS MILLISECS(10*1000)
>  #define MIN_DELTA_NS MICROSECS(20)
> @@ -307,15 +309,13 @@ static void cf_check hpet_msi_set_affini
>      struct hpet_event_channel *ch = desc->action->dev_id;
>      struct msi_msg msg = ch->msi.msg;
>  
> -    msg.dest32 = set_desc_affinity(desc, mask);
> -    if ( msg.dest32 == BAD_APICID )
> -        return;
> +    /* This really is only for dump_irqs(). */
> +    cpumask_copy(desc->arch.cpu_mask, mask);

If you no longer call set_desc_affinity(), could you adjust the second
parameter of hpet_msi_set_affinity() to be unsigned int cpu instead of
a cpumask?

And here just clear desc->arch.cpu_mask and set the passed CPU.

>  
> -    msg.data &= ~MSI_DATA_VECTOR_MASK;
> -    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
> +    msg.dest32 = cpu_mask_to_apicid(mask);

And here you can just use cpu_physical_id().

>      msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>      msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
> -    if ( msg.data != ch->msi.msg.data || msg.dest32 != ch->msi.msg.dest32 )
> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>          hpet_msi_write(ch, &msg);

A further note here, which ties to my comment on the previous patch
about loosing the interrupt during the masked window.  If the vector
is the same across all CPUs, we no longer need to update the MSI data
field, just the address one, which can be done atomically.  We also
have signaling from the IOMMU whether the MSI fields need writing.

We can avoid the masking, and the possible drop of interrupts.

>  }
>  
> @@ -328,7 +328,7 @@ static hw_irq_controller hpet_msi_type =
>      .shutdown   = hpet_msi_shutdown,
>      .enable	    = hpet_msi_unmask,
>      .disable    = hpet_msi_mask,
> -    .ack        = ack_nonmaskable_msi_irq,
> +    .ack        = irq_actor_none,
>      .end        = end_nonmaskable_irq,
>      .set_affinity   = hpet_msi_set_affinity,
>  };
> @@ -347,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>  
> +    clear_irq_vector(ch->msi.irq);
> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
> +    if ( ret )
> +        return ret;
> +    cpumask_setall(desc->affinity);
> +
>      if ( iommu_intremap != iommu_intremap_off )
>      {
>          ch->msi.hpet_id = hpet_blockid;
> @@ -457,7 +463,7 @@ static struct hpet_event_channel *hpet_g
>      /*
>       * Try the least recently used channel first.  It may still have its IRQ's
>       * affinity set to the desired CPU.  This way we also limit having multiple
> -     * of our IRQs raised on the same CPU, in possibly a nested manner.
> +     * of our IRQs raised on the same CPU.
>       */
>      ch = per_cpu(lru_channel, cpu);
>      if ( ch && !test_and_set_bit(HPET_EVT_USED_BIT, &ch->flags) )
> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
>      spin_lock(&desc->lock);
>      hpet_msi_mask(desc);
>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;

I would set the vector table ahead of setting the affinity, in case we
can drop the mask calls around this block of code.

I also wonder, do you really need the bind_irq_vector() if you
manually set the affinity afterwards, and the vector table plus
desc->arch.cpu_mask are also set here?

>      hpet_msi_unmask(desc);
>      spin_unlock(&desc->lock);
>  
> --- a/xen/arch/x86/include/asm/irq-vectors.h
> +++ b/xen/arch/x86/include/asm/irq-vectors.h
> @@ -18,6 +18,15 @@
>  /* IRQ0 (timer) is statically allocated but must be high priority. */
>  #define IRQ0_VECTOR             0xf0
>  
> +/*
> + * Low-priority (for now statically allocated) vectors, sharing entry
> + * points with exceptions in the 0x10 ... 0x1f range, as long as the
> + * respective exception has an error code.
> + */
> +#define FIRST_LOPRIORITY_VECTOR 0x10
> +#define HPET_BROADCAST_VECTOR   X86_EXC_AC
> +#define LAST_LOPRIORITY_VECTOR  0x1f

I wonder if it won't be clearer to simply reserve a vector if the HPET
is used, instead of hijacking the AC one.  It's one vector less, but
arguably now that we unconditionally use physical destination mode our
pool of vectors has expanded considerably.

> +
>  /* Legacy PIC uses vectors 0x20-0x2f. */
>  #define FIRST_LEGACY_VECTOR     FIRST_DYNAMIC_VECTOR
>  #define LAST_LEGACY_VECTOR      (FIRST_LEGACY_VECTOR + 0xf)
> @@ -40,7 +49,7 @@
>  /* There's no IRQ2 at the PIC. */
>  #define IRQ_MOVE_CLEANUP_VECTOR (FIRST_LEGACY_VECTOR + 2)
>  
> -#define FIRST_IRQ_VECTOR        FIRST_DYNAMIC_VECTOR
> +#define FIRST_IRQ_VECTOR        FIRST_LOPRIORITY_VECTOR
>  #define LAST_IRQ_VECTOR         LAST_HIPRIORITY_VECTOR
>  
>  #endif /* _ASM_IRQ_VECTORS_H */
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
>          if ( !irq_desc_initialized(desc) )
>              continue;
>          vector = irq_to_vector(irq);
> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
> -             vector <= LAST_HIPRIORITY_VECTOR )
> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
> +                        ? LAST_HIPRIORITY_VECTOR
> +                        : LAST_LOPRIORITY_VECTOR) )
>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);

I think this is wrong.  The low priority vector used by the HPET will
only target a single CPU at a time, and hence adding extra CPUs to
that mask as part of AP bringup is not correct.

Thanks, Roger.

