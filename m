Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E4A461DD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896679.1305439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnI7A-0006og-Nd; Wed, 26 Feb 2025 14:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896679.1305439; Wed, 26 Feb 2025 14:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnI7A-0006nE-KQ; Wed, 26 Feb 2025 14:10:20 +0000
Received: by outflank-mailman (input) for mailman id 896679;
 Wed, 26 Feb 2025 14:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9aM=VR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tnI78-0006n0-TZ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:10:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2413::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67366685-f44b-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:10:16 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 14:10:13 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 14:10:12 +0000
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
X-Inumbo-ID: 67366685-f44b-11ef-9897-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWlBtQmWfhC/surAD6A/LqVZ9Xoy21QfZOifrV6tRJWrUCjDHQmdDzuFwNuzOJnf8H91POlIAxEhkZdZJ8L3ycB2OozQNvWnlmrjcRYE3V3yvGGx5cviil5L30dg2XKRp41xviRrs0lVMSGQkGlatDbDe4qaZUvstrbFhomRz5eXdwVJTimSIGopUEz4ydZmi1+4k4nnHokyDOaLH/Vwy/SDkCvafk3CC6/RAgs/eGc6KzflHbT6zC9wmgW989YEZsWmUFIEFDMUx+Qhvy1Wu/1buvXGd+DmUNVndNrFtskFAy8VfMATIzWGchqRu+J2QNKS1cmUA2QLaAQWYzpq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX7B2LbKgiROv/N4IJd7rS3bgn8L2vYhf0UmpYm8ABY=;
 b=Q4nrP5z0trKLLlhWiKlmi2+LOwUe6qKcmF0JDRm7f7sJ+HYD963QWzgY0KfMoM78Olxwr9eyq6BNTxoULCOpdN28GwPgsLvKIbkiiFSGG53hx997YrFSypBcTrqamhJesmX5TE8bPVKvnWwqu3mocPN3B87C4PY/A1JFlpZIZbjUZxBMoLjFCP4p9lTizM/mdWSQsl31nIlhm5YXuigTLXoUusg1tv8HpV95HIQ+/bLqol+S54KyKV2QSTVQbtuyxFRFSi8jgxzyWrOp378ambY8URd8SUs5k3x/06tlPpjTXRUbRdGdB6IlMwPPgKw/tlS3tcL/+ejHXHkgVWkteQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX7B2LbKgiROv/N4IJd7rS3bgn8L2vYhf0UmpYm8ABY=;
 b=5l3iaRfkcdrq9urRfTVASWKqbSKKxAztJC9ALxKuE+S+xpeAgobjhCT8FuiQKl4HfJqL6FBGOerSJsYvYSVNmF4Md3t81lzDE0yUsyyAWbhPjv25ZvEIsoI5xa/1QE4EKSXLX18UqyiaM8t93nAU//WaN8udCcVNqR5oy6HJS8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <af93139b-0e62-49a8-9405-bd485a2bccaa@amd.com>
Date: Wed, 26 Feb 2025 15:10:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Don't use copy_from_paddr for DTB relocation
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250226112625.2217195-1-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250226112625.2217195-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::16) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 48dda339-a097-4502-53e5-08dd566f4944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzVpL3RwMkYvWVBNUFBVbjFTcGhrM0hTaUNxclR0bHQyZm02V3BDTzlZSkZ6?=
 =?utf-8?B?NWkxUFV6dDErUVM0a2RMK3hHRyt5UWVSU0RtYTZCRHNCM2dacGpueTZyQk9L?=
 =?utf-8?B?VWN6bmN1NkJSLzhWbkVhRlYxL2hTR1F6WWdGSEx3NnN5M2F3K2dFTVpzb2Jo?=
 =?utf-8?B?WFYrampBbnpZNGtNYW5hckhsRFpKQVE4a1V1WnFFL2VlZFNNdEJ3MkFtclZ0?=
 =?utf-8?B?azVkVFRVNnlQWCtMWWhWa0FIUllLSHQzeFhZbU95YW1WTzViMzNJK2lXWGZP?=
 =?utf-8?B?U1REalBNaHNDdHBSS2xGVnJWcVlvYlJEYW1DYldVbDlSTDB4eUthbzdPeFpj?=
 =?utf-8?B?S0ZKcklYb1dCY1VCNTZOa2Q1UGppZ2FBL0lZcVpSQ1BEU0RITFlJV2RMN2Z1?=
 =?utf-8?B?aStKNFF6NGRFY1o1ZEE2cVBXcjZMRTVrT0gwVDA0V3pUV1NRN1ZmUUo1dFJj?=
 =?utf-8?B?cVJCaUhmYlRnamhvcFpJU25NclNTaWVMQWZyclNaNWEwd1VZaVBPTmVydWpF?=
 =?utf-8?B?QXd1dU4rVy95RGVlRWk1QS84MWhhbkJIQWZOYk1qMDNnQklWYURYclQzaFVT?=
 =?utf-8?B?UTZXKzl3TmdRUmEzYnVKRktaL253VXVCQ0d0bGwydUdIMnR0bTJtSXRBdHdV?=
 =?utf-8?B?N1hIYTZmRzNCaFJpUkFtbDJCWW8yY0NJSG5LY0JjOFpmU3FVei9nSXFQZnBZ?=
 =?utf-8?B?UGhlUXEzNlQxczg4TGJMUmlpcmgyOUY4QlhSbHpMUWMvdnRRL3M2MnhaUmxM?=
 =?utf-8?B?VG54WkdEamtjdE5kRXNDWVVDRTZvQlNjdktkSXIwaEVvSUhON2h1WWE2MFRN?=
 =?utf-8?B?WkU4RHRzQWJsVXNXbmQ1V1B4a3lUd2ZOVHZwRWUwaWpjaGpLZ0RQdzhsSWND?=
 =?utf-8?B?UmdoM28yZEUyaTZoRHVCNzk3cGtscTM4b3M3bG9CU1UvcU5oNk5rVURBTGdH?=
 =?utf-8?B?ajNUQnpjOUFYRFQ5bThMZWEzd0dJRUczclFDZ3VjMFh0eFRSTHRXeWhjdDlE?=
 =?utf-8?B?Q25tN0dDa2Y2WnJkUXNzaVJEQzFBUjRtN1lCc1pxY0pENnhaN0d4d2xzWEVR?=
 =?utf-8?B?Mk5odWVRaHhQVWMybFo2aE5CeExaWTUzdFhFQ1owWnJXOXlpMjExVXFQUGlt?=
 =?utf-8?B?UVVvY1RKNVZLN25iTVZLeUpjU1l0TzYwelFGVzFUc2QySUExejl5eWJWWi9D?=
 =?utf-8?B?Um1lYUZKR25kS283dDVlQ0dheDJWZXpRY0NlK1FMOFF6RTVHbUxTWGh4R2R6?=
 =?utf-8?B?eTFWSDdKelIyUzlLWlVsUW5zTUhxOFJZYjN4anpNSnhsY0RjQ3B6M1JJL2tC?=
 =?utf-8?B?L1VFUTVYd3NIaUxNemdzeUdTTG9aa0JUazBCdjZvU29mdXlIN2NOZlRwQ3Nz?=
 =?utf-8?B?a1FVSUF1VDhLSUZRUHBKekhSSWhJbk45Y3drS21yUHdzM2xlRFg1OEZzTkhT?=
 =?utf-8?B?cHNxeDFUTXQxaml6cVdNcGM3U3pXWnFpMVc3aGkxSGp6Ry9FSStsT0Q0N2Qy?=
 =?utf-8?B?N1k2QlpTcndVOGpjUExOR1NZcjF2anNNVTl3emVKdU1xcHZndFMxSEFQRTc2?=
 =?utf-8?B?VXN0bE9GSEQ4bTk1WEdBYm5rbVZOc3AraUF3S293cmVHMGdFR0xjR2dCZDZN?=
 =?utf-8?B?RVRnVDFlZitLakRjdWlVU09wSVg4QWIrTUwyTUk4VXlMTEdpb0NaLzRiaU1a?=
 =?utf-8?B?SWh5RHFGRVJzTVRmQmNhVHVoMDJrei9hYk1JSC90eGNCWmZ4TUVCMFpTVkd2?=
 =?utf-8?B?VWphcW1tYmhhR1QvcC9yMGxQYUd0QkpiOGZVbTVSelBobWl6UTVJWjYwTzJt?=
 =?utf-8?B?TXk2bXF3OWdCd2hwcFNxdVh0WG8wc0E3Y1hqVG5hSkE1YUV4SUtyNTRjaEZ3?=
 =?utf-8?Q?rbCg9EmEdYAKn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STlmQ2wrUGlXQnprSmxreWhnbHV3SXdXWHpSZHR5L0J0QmMvR1RDL241N3Q4?=
 =?utf-8?B?eFV4SEFqcWx2aEtwQWlWakgxeGF3U1JYRjF6UUtWS0tEVVZBT2ZhNnlIeVhm?=
 =?utf-8?B?YUZYWHcwNWRBd2hmQVB3azcvTVc2WERwN3lyVGhDajVwMkV5RXgzbUtid0Ji?=
 =?utf-8?B?UmExcitJd3VobFY3ZzYrbU9DcjlpS21pbXhaUlZGaDd3WEFJU0ZsN3J3bWxH?=
 =?utf-8?B?MG13KzkvZGJNKzVHby9QUGN4eWpZRC9FOG1lbE1mY0M3K0ZOUWZ1S1grYXBz?=
 =?utf-8?B?NjZGd0Vhc3hjeTZpUjUxamFLeUVJNW5RVFU1YWdtYWJyQ1F4UGwvaE0rM2Ez?=
 =?utf-8?B?ODhVK1BydllNbEhqTVNHOGtlVzB2V2Zuckpjc3VOTkJ1cVZoTENZaWVSLzNu?=
 =?utf-8?B?Ui80MzZ1RlBUQnFQalVXcUMzbjRKS20wbXZFNkxCSVhidWJXa25aTkVBMlNO?=
 =?utf-8?B?V2NNdzVmcEMyM0VlMUtoNHZORStrQ1dOZVEwOEowWkhBaU5MT0I5dEp1cE5B?=
 =?utf-8?B?WWU1Z2F4M21CZXUzcUt6RW5ac3RWbEJHZlVQZW9yelFGSFFtWXFuMmlGVlhs?=
 =?utf-8?B?U1AydllQeHJFZVJXNFZHdnQ5ZW9wWlN5bDVIMTVVV2lKQXJFQ0RRVU0vbjU5?=
 =?utf-8?B?OEc2VXhOMjZadHBlU2Y3SHJvUzZ5bUt2ZVk5akkvRWRhdG9seGlKNVRsNlk1?=
 =?utf-8?B?TTFhL1d6dWxGNGtCaDdObUZwbWp4R3M5SjZoaCtVd2NITDVqenVYQkw1Wmsr?=
 =?utf-8?B?Q3FwZTRxZ0hmNHFsUjhjL3V2N0VQeXBib0h0TFR0em9maFdJWXdtcXZQVHNU?=
 =?utf-8?B?c2lFczkwRC9xYW1veklvbHhTM2ZjYW5Bay9WRzg5QjRnS2JRS3pTWWpBam9X?=
 =?utf-8?B?WXphby9Yejc1M0NSdXBKUGRGbldvK3VHU0NyaFBTZm5FTDQ5Z1BJcUcydmRy?=
 =?utf-8?B?Zjg1ZW5oa0dtcDJ0QnpSK3JlRjVPb2E4VGI4VVhmdGFWeHpOTEFHZ0NzbmJ3?=
 =?utf-8?B?RWtPT0FXbUJXYk5hS1o5RDFYRzZHWXBrWUk3VnJRT3QvRnRYRFBZWkFkKzFB?=
 =?utf-8?B?SEpMUE0zZ01PeUdZYldNZXpRU2o5N3FqcVlXZTdUblB5ekx2Q1ZwaklPMkJO?=
 =?utf-8?B?T3dtVnM0bUp0aDlTQ3VlM01vSHY3bTFnQlUrTXY2cWdTN29HZUVHYXFMVEVn?=
 =?utf-8?B?MGJONzZ6MDdNREhvelFBNHNJREtzS0psaDNXcDJrdUpsMklWYm1qc0tsSWxC?=
 =?utf-8?B?SUdqbEk3OXRacEsrMDZyUGNXT3N1RkZTR0haR1ZSaUtrRmlCd2RjL0QwV0VL?=
 =?utf-8?B?Rm40ZUxaN3J0VVp0VmNEVWQxTWZZeStyelBOUTd6M1prQmkxck43L1hwNzZX?=
 =?utf-8?B?UlRPM0grNkNNQmtiZUxFdUVJYkJGRyswSEdBUzlWVnUraVgyRDNyd2RFT1hh?=
 =?utf-8?B?NFRLaE5XdUlXTWx2T09malBYTzdVRjdMRDROOTNKK3JySmNiTlV2THg0MzVQ?=
 =?utf-8?B?S2RWcmQvNmpZZnFhakNMNENvVXMxSE5Yc3lFMjRhUVFuYWluTTNyM09Ba0hW?=
 =?utf-8?B?TzhsM3RmZGhYU0FTUE55ZER5MjZMVmRSSTNiUEdLL05mTHpoN1FDYi9LUE1H?=
 =?utf-8?B?TnAvaytTdm1WRG4wa2Eya0NCeW1oTFRGVmdoYStLMnBUZmhnUVQ2L2hRdG5J?=
 =?utf-8?B?YXc3ZEJRQWU0dTFjR2NKOHZqVTNWR1BwYXRsdjYyNzRCVCtvSTVORVdKcTA4?=
 =?utf-8?B?R242ZGl2WTFML3lXZm80cEJ4RVdyb3BqeTNzRzc5S3JqWUJSOWtRUDBqRHlp?=
 =?utf-8?B?VTFPUnZSSFByMTJ3a2l5aCtEV1BnSW9ndklSc3Zac3VOVXZIZUVrMXFGNHpG?=
 =?utf-8?B?THNRMTlDdDNaZHlVNlg4YjFSTHcrZnpGZlEvS0NBSVR0bE9OUTVQcmhSTFBG?=
 =?utf-8?B?WUdvcXdhNCtqT08wb1I0WEpJcTBIT0VId2M3MjJhYTZ3QVRmdjZJM2xYOTNX?=
 =?utf-8?B?WUszMHZMRU9qM203enpNQmR3cmdnZ0NYaVJLbWEvbmJqSkQ0M01aZXM2bEpz?=
 =?utf-8?B?MmdxSDh0bGlmRk5XdlRwUUVmYzFOdVVNaHNKbitiSUpFMHZIR2t2bVhRY3hz?=
 =?utf-8?Q?61HC9/vVPl0tGT204Xv0skbUZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48dda339-a097-4502-53e5-08dd566f4944
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 14:10:12.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+6Dwhx/15NdtwqyxaBldCPmyEnrZjuAMhslTftS1oHobML5eLUEGCcfPFiiAGxV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170



On 26/02/2025 12:26, Luca Fancellu wrote:
> 
> 
> Currently the early stage of the Arm boot maps the DTB using
> early_fdt_map() using PAGE_HYPERVISOR_RO which is cacheable
> read-only memory, later during DTB relocation the function
> copy_from_paddr() is used to map pages in the same range on
> the fixmap but using PAGE_HYPERVISOR_WC which is non-cacheable
> read-write memory.
> 
> The Arm specifications, ARM DDI0487L.a, section B2.11 "Mismatched
> memory attributes" discourage using mismatched attributes for
> aliases of the same location.
> 
> Given that there is nothing preventing the relocation since the region
> is already mapped, fix that by open-coding copy_from_paddr inside
> relocate_fdt, without mapping on the fixmap.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


