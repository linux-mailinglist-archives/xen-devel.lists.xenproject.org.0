Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337EEA761FF
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932059.1334330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAVm-0001UF-9t; Mon, 31 Mar 2025 08:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932059.1334330; Mon, 31 Mar 2025 08:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAVm-0001Rg-74; Mon, 31 Mar 2025 08:28:50 +0000
Received: by outflank-mailman (input) for mailman id 932059;
 Mon, 31 Mar 2025 08:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDqH=WS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzAVk-0001Ra-VU
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:28:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2413::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28d22d63-0e0a-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:28:45 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB6901.namprd12.prod.outlook.com (2603:10b6:a03:47e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Mon, 31 Mar
 2025 08:28:42 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Mon, 31 Mar 2025
 08:28:42 +0000
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
X-Inumbo-ID: 28d22d63-0e0a-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPyB0N/v5na1bRdd8v8MM8s5xwjdQRM5FlYMWc9BjqLjm1PyCcX/dPbMPS6rnJeNlq9EX739XrUxguu+7GIiunyBwgmMGEgG1LwIesczIqxeF5ouUZedecQYKHWFbQGEOm2tqBQpX8gkKtCNcKgTh9tEBxiw2ByyrQfRhwVHkQxZC0cUOFpI1BXhzgcqVqf61cnyVke80+PKMiVUpHE6+mvnPQ9M1zt75x5jwq1d7ihC3kr2SU7KRQprl+OmHAKxdWmPs8gz5BOzK098N7nXFhNvF2Eo/ybvxV3qSVaSaLZGOG7hU2tPzlPBmLFR25HOL+sJCOG3x014SOTcyItCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QX9+efKPmyD3YQxBSvmQTKpZUjSLqGSzjbUAT2SCvYA=;
 b=Ezii3YuF3ivqIVKKstfSYMql/lo0aCFFMNC4OAfVT7CI7YxbEzVMS3XTYB7JVBPXKdHF74+BHUHCCmbvznyKZtZquuZSKvCq6tdfsH3f/Nu/ZJAzzf1IPc0NBfAQaHjjXejJ5Gk6dfj7CABv3BS2iT07A1N401o798pGanhswLEUv71aUIhtMS6fzU9I/U2AmKc+SRdMDlqtn2fpQ4pWPc4jHYMZHUYL1lB8FdrHdnGY/q/TJ605JHOmAu3VygXOcN8BmMXlwfwvjSymBXOgyYXYLP3/213ynhxr7f/Ux4j+dVwy+TebNVCNH29LSV/X01MptFLrRxKn47gG1J8E/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QX9+efKPmyD3YQxBSvmQTKpZUjSLqGSzjbUAT2SCvYA=;
 b=AK9nn/HjCmPJ6IuxYufVSCvLOTKk/5crN1l8lJtGw+utGJRJg9ZcjeZOgHECp2uR8O1iW4exd/U/awxCuHCpfwe9unkFX5PEA6g8OaO+MRbuOYqnvKTEg7QgaKdXEbnZ3JRAYMy8627z6Mqv8SQqbdZNAf6R3NIz0DV3vRy9HRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8be0fc7a-1c28-4630-a4aa-d897af81383b@amd.com>
Date: Mon, 31 Mar 2025 10:28:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] xen/arm: Move some of the functions to common file
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
 <20250330180308.2551195-3-ayan.kumar.halder@amd.com>
 <4d57c061-ec16-4467-8bd1-08a40161ab0e@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4d57c061-ec16-4467-8bd1-08a40161ab0e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 539bf9fb-c3b0-467a-47e9-08dd702e0b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rlo3TkN6VGt2MlRjcjArKzBNOHJ4VGw2N1FnQkc4M2o4bWtDYU9OajE5SzVZ?=
 =?utf-8?B?QlUzbFJxRnVqTnRSeko2ekZ3aC90M1NMYlp5Rys3dm1ESk1aYTB6bTRQaUNo?=
 =?utf-8?B?bFJJWndFdy9UNnVDZUNNUFFXU052NjNDUEMwWDdRa2tGeTFDRFBjYlAzTmFy?=
 =?utf-8?B?UHpHbWt2ek1YN1ptMjAvaTJSVmdvdkdYVTVoZENCUmI5WldpZnJwMnJhdVdk?=
 =?utf-8?B?UGcvSHBsakJQOGhXcC8rNWsyVFRvdHdoSlIzZGtQY1lMd2F6OFVFNGk1VGpP?=
 =?utf-8?B?WTYzZFpwU3BXcUJNWlZ6VmttbHJRbWxNS3RSRnJiMWQveTZnNDJReGhNOW5y?=
 =?utf-8?B?aElVUGc4ejQ3RlkrWFFjS2lxYUM1UmFkS2NzS1o3L1ozaVNiZXgzU1pobVBN?=
 =?utf-8?B?ZHBBSkc2UjZYUXlqeWw0Vmp4b0ZRTTRWRWN0RENXWlFJQnVHbXpnRlVOWVNF?=
 =?utf-8?B?WlpLUmxrSmFUd0hnd24xMVpISnhhQy96NE5mYnhnYmlmb2RscGdPZk9QK2M4?=
 =?utf-8?B?cmI2UjBFME5yT0VIQ3VHdDdYa2M4MVRNbXRpdGg1T3F6RStkd0l2U2dlMi96?=
 =?utf-8?B?SFAxb2pZZzZFQjMxckdJUjltaEpod0ZPYzRJa3ozRFZ1UTA2WFRkWmtPdDhh?=
 =?utf-8?B?bjVJZ253UlFlRHJweVhGd0JVeHdZZk9jQ1U1bm9UU1BQUFdEN0ZaNVJ2eGNn?=
 =?utf-8?B?UlhjaXJtdjh0Rlh3dzUrV2ZwMEJlSW1VNm52WXE3UVNPSTFnRUlKbEdBQkZE?=
 =?utf-8?B?em0ycjU0V1dSd0t0N2VMNDhmTWR0d2pOWVBlTjZNT0pYYllQZEJBM1I1cXNr?=
 =?utf-8?B?dVFSNWlhMHMrVkt1bU9vVHVJRFpoVHU0OGljaUZXVER0aW5NL0Z6aVRaM1k0?=
 =?utf-8?B?N3FPK2s4NVdHclQ1MXVUS1duenVFVjh6ZmtaUzlrSmViQWhzdzk0VVlSL3gv?=
 =?utf-8?B?M0lObDVZV0xyV1lvYmpQcEZLVzFIZ0hWai9kbjlBNUZHbHdobmM5aDY1OFhP?=
 =?utf-8?B?OWFrRGVUMVFlVTZqN0t0S0tZNHlnR3hYYUEwcnIrZHBHaWlMTEVRSmQwWjJh?=
 =?utf-8?B?ZmhYVVJxSUpCU1pCTjJrNkxCYW4zYytwUncwSERZZnNLNkYwdXJWdXgwcWJT?=
 =?utf-8?B?UWRyU29JR3dhVExJem13Y2lNSVBmRUNja0xXVS82b3EzZ0xCQVhaM3l5bUNl?=
 =?utf-8?B?WGJ2WFhScTBzR3pSSnptKzFJV0ZidjdjdnJWUGdnOVpHK2NYQ0JWaGU0eitS?=
 =?utf-8?B?VW9tNDNZNk1EdE9MWVM3Mm1wUUVpSXVzVEgvdzRRbVE5cmg5TU0vS3VGb29I?=
 =?utf-8?B?Q3VxZUpOTGppK01ZQWlBZlJ4N1E1R1pyYURha2Y1S2JDa2RHclFsZ3pyNDB3?=
 =?utf-8?B?ektxcHFwQlpIbUYxOC9UMnMreUJhM0wxQWZSamJneUFUT1prZVFtRk1xYklT?=
 =?utf-8?B?dGZMSzhrOWZ5WmxYWUZ2QVFldTF5NGxPSGNWOFR0RGQzQmo2RDdsOHJkNWFl?=
 =?utf-8?B?RGsrK0dHZ3B5ZVhRbXBqZEdiTFpqZkl2N1YvYnhXbnhJamVyYXhqTndXVDNq?=
 =?utf-8?B?c0M0a3NvdXJlUEdXOFg2TDMrOG9vMGVJNitpaG01akFYUlJWeFhlTngwbVQw?=
 =?utf-8?B?dVpPS2RILytvZmV4Mm14RFpQRXc0Y3R1bUpPaExwS2ZSdmFPSGRIdVNmQkw1?=
 =?utf-8?B?cjRsalRRK3hCMHhBeXFsRW1YS2o4U2Y2SGErendLcWVMOWpkWldyTlZ3TS9P?=
 =?utf-8?B?d3NIZXJlSGRHc3lqbG91QjcxSVBVZlhBU01jbldkUGdoRS9keXZSbUlpcncv?=
 =?utf-8?B?dXJya0Q4Y1VIeHJWMWVqMUhqVXdqdmxXTzE1SldPcncyQ1N3RWZMMTNGcktl?=
 =?utf-8?Q?Bk9jof0ghjl7/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1lTRTd1cThONDd4b1FFNGFjdEdRQlNJeVlJUS9mWUQxU3BEai96TDYvY2RO?=
 =?utf-8?B?eEgwUlJ0SGJ0MlZaakU0eVQwTWNtYTJXbHh0cUd2Q3J1MjE1bTUya2IzNklk?=
 =?utf-8?B?aEQ5aHI4dURJakRPVE83NGpoYUNxUXRuNWtKeVJ3NUczUVBJL3F2Z1EzYlNY?=
 =?utf-8?B?SGt1V1NpWllINThneURUcVZrVEYydWxIdHZtZG4zcS9uQnFFalhVZ0F6dUlO?=
 =?utf-8?B?c09oOUtrMU1xMnZRMkJiV3BSbkJ3Q1NITCtWK3VaelNXbTBtclBkOEVnUUU4?=
 =?utf-8?B?YWpybjlKRE9RWWZ3UExCcURiN1FaM2J6UzVRNm5PQTI4dDV2VG1nbUE4Mkdq?=
 =?utf-8?B?UG9CYnVPeHd3YXVkZ3NtSDBGdHBhNDNJVkxiNENOV2ZIS2t5UnVMeVU1dXJK?=
 =?utf-8?B?QW52emNGVXh2ck1ieFdXZXdsZkxUR3VabjZFVjVXdWsycENCODBoZWE5NDlT?=
 =?utf-8?B?bWJYK2hRU3p0SXhTUS9JZmU3am9mRGdrc2JmS0MrVDRkN2NZM1c2TkV5Z01i?=
 =?utf-8?B?bEZMbUlGbWQxalplYW5RRmVhakk3U3F3NGZXV2dyRnVoYXlQNmhkeHJTUUZp?=
 =?utf-8?B?cVE2M1g1dzhPN2RHQXpBcG1lbGluM0twK3ZTQlhsUHBHZHZhSW54NG5ZNWEy?=
 =?utf-8?B?WkN2cSt5U1psY29jN0tsbkhyZ3VPUEd3N0dnakhka1p5azJsOW9XZWx4VDN0?=
 =?utf-8?B?dVFCN1lzY3pieXRPYkRmWmQ4Y1VhM2F5M3BaQ29QZzlRZERKQ20zSG1SOWpK?=
 =?utf-8?B?SVg0NUdHMEtpN3FtWnV5VVByZDhuRW1xTzFaVERiZFplcUk2cnplNDNGbnhq?=
 =?utf-8?B?S25mNFhDZTArSlBuV1ZkUkVKME5JcjZnemFNQ0J5ZnYzNkhuM2hyZkdRTTlL?=
 =?utf-8?B?bXdRVGlBamJPMjQ0WTZ0VmVwQmpzY1FZNkIrVmtxcDZCOFBoVHJBeXJRRmcy?=
 =?utf-8?B?dzVPQnlRMk5iVFBpR244bU1LTjVOWkIvcDBJclhqc1ZsZ0g3Q1BxSk1iVFVq?=
 =?utf-8?B?VFgxNGNEVE9YRjVHTzNiZ0hJbjk4ZDY3dDdRT2RGLzV6azkyS1BxLzNFRHJ3?=
 =?utf-8?B?TXJKR0w2ajYxTXZsOXZSZDd4TnlSc3NGckcralE3MnNTTHJEQ1ptUmFQV2VU?=
 =?utf-8?B?TmRYa3lXbDNlOVVCVHN4N1Y5dGZzVG1zZ3FvelFCbjBoZk9lVnUrcUQvU0pW?=
 =?utf-8?B?WDg3KzZobUVzQnI3Nit4dlNWb1J3NXdFc1ZnQWpNWHFoLzlLZTVxRjFVMVdF?=
 =?utf-8?B?bUNiV3RJWVNwUFFGVlJDUWVMTXVRRmtGU0VuZUZnVFhuKzNjQkJyU09xa3BV?=
 =?utf-8?B?R3RDeHM5Y3FCKzhXTnBZbUtmb3ZGRmE1VkxwVDZrK0xTOGwvUG02OHgvTVRo?=
 =?utf-8?B?dTFibVdmeldTb09IRzR0c0JpdTFCTGY4bGhGNWkwaTM2SEVyQnR0bXVEMmVM?=
 =?utf-8?B?cG9KMmJCZVlFUGozay9kYzhGN2tqVG0yV0ZMWUt3aEdNYnVJNlBVNEtJaFZk?=
 =?utf-8?B?MUk2ZGM1NWRCUXMwY3RZKzFKZUF2bkRLZjBnN3FndkoyUDIxOG9McTUrT3J1?=
 =?utf-8?B?N2lRU2pUV2paZXJIVTNOdHJES2Q4QkdjOVVWOGdISkdyMU1JQzJ4cVRaai9j?=
 =?utf-8?B?dS9SaFZPSXJFenVjMUx2L3hGRGVmOVgxQ1Y3ZEpES09SOXZVZDM3M1JyVkNL?=
 =?utf-8?B?aHVDaldNanFQTEVjYzlndEhuRzA3VjFsbHRwNWhnR015VU9QU0JBZTJIMWc4?=
 =?utf-8?B?anpFcUFwYTZLQy82UXl2ZzZKbTcyeFNjaTBZSmc1SGNoY1U5bExHTmFmZk1s?=
 =?utf-8?B?RWRoQWJldkpuRmpQQ2huVUlLVkpEM0xvVitlL2phQjBIb0p1LzJVTjlLNGFT?=
 =?utf-8?B?aStLQWkxOGpzbnNQbFEzc21aNkVJRnVocDE5eVlxOTBCYm56SnhqZ3piTVlq?=
 =?utf-8?B?QnZyWFU5Z3lYY3JxbGo3cXZFZTVuclNHeVNXRWM0TzNkREo0M2FQU0FTYkdC?=
 =?utf-8?B?b3BkcXQ3dUFzOXoyNVlpVm1wWlFzUzBIVlpKaDdsMjByREFOZXVlTEY5K1R0?=
 =?utf-8?B?cDJ2aFdzNitxclhnWE5FN0F2SXRMbWhIQ3gyZlUyajExeHlBMTl1eGVteXBK?=
 =?utf-8?Q?QtUJPjyYevI5MRkH75cKj2p4Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539bf9fb-c3b0-467a-47e9-08dd702e0b55
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 08:28:41.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUxICfGkpeDtk02/QELfpW/ZvLCM3XFH6jOpkGhCHjT7vu5li9yC3LptLaYZ0UGU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6901



On 30/03/2025 23:06, Julien Grall wrote:
> 
> 
> Hi Ayan,
> 
> On 30/03/2025 19:03, Ayan Kumar Halder wrote:
>> Added a new file prepare_xen_region.inc to hold the common earlyboot MPU regions
>> configurations across arm64 and arm32.
> 
> While I understand the desire to consolidate the code, I am quite
> unconvinced this should be done for assembly code. A few examples below why.
> 
> I would be interested to hear the view of the other Arm maintainers.
I think consolidating the code is ok as long as we don't go to extremes.
Consolidation should be done for things only where it makes really sense
(macros, helpers). For example, in places where we don't predict that given
implementation might be different due to certain arch optimizations, etc. (like
you mentioned for mov_w). If we worry that it'll be difficult to asses what to
make common, I might suggest to consolidate only common macros.

In case of this patch, I think we could have a single implementation for
prepare_xen_region and fail_insufficient_regions, whereas enable_boot_cpu should
be implementation specific. I also think that a common .inc file is a good place
for storing stubs such as enable_secondary_cpu_mm(). One day, if let's say arm64
decide to add support for SMP, it will add it's own implementation, leaving the
stub only for arm32.

> 
>>
>> prepare_xen_region, enable_boot_cpu, fail_insufficient_regions() will be used by
>> both arm32 and arm64. Thus, they have been moved to prepare_xen_region.inc.
>>
>> REGION_* are moved to arm64/sysregs.h. Introduced LOAD_SYSREG and STORE_SYSREG
That's not a good name as it makes me think it's ldr/str.

>> to read/write to the system registers from the common asm file. One could not
>> reuse READ_SYSREG and WRITE_SYSREG as they have been defined to be invoked from
>> C files.
Therefore {READ/WRTIE}_SYSREG_ASM() could be used to denote ASM only usage.

~Michal


