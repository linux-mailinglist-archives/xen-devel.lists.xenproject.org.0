Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9977AE815B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024768.1400595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUOOR-0003ZA-1V; Wed, 25 Jun 2025 11:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024768.1400595; Wed, 25 Jun 2025 11:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUOOQ-0003X2-U3; Wed, 25 Jun 2025 11:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1024768;
 Wed, 25 Jun 2025 11:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GTF=ZI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uUOOO-0003Ww-P7
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:34:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51ed38a9-51b8-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 13:34:14 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB6931.namprd12.prod.outlook.com (2603:10b6:806:261::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 25 Jun
 2025 11:34:11 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 11:34:10 +0000
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
X-Inumbo-ID: 51ed38a9-51b8-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmZZPE1cNI+w8ZQXJXo1tmklHqp3mWlf9qnG45K1nIQkWLbpkF8CUgC7x9/WRdYBVuj7DbH8X1RKnmw4YyTr710G6rKkB7m3pczSJH8El7u7WT04+EiSTUvtQTCJVxkg/+l6tlgCDy2UByZo7BVC3psj7rviVT9dx3Ld4SMzJ/MK1fDAAjHZt+VzQWi4F0qkJd3o59hcdQNKhP73VZm0y99ia1Je0FYj5Hg1WuI3zv4EYri3Y/k6oG2ORH8GfjwfhguMxJvhP4QqFGyeYrgQXJSxaCBYPfbJ4pvn36hC3bnU4w9Uu4LwszvKZYK4PjMNQvTHcxqNPRMfYNIZTphbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHgeBPvj8ieZL/ZPJDqgX2qU3yp7ZynenHEeu1JWNe0=;
 b=GXepESVnzdadh/ZWmDGIgLoreW4/T4SsQ24XeXyKGf8nZZ64VRrxN7YCjbFNLxWKXfU1AipkYiSMC+eTCgHLY+EHwO9uJG4eZ2Ol4XQfh7ofQjdvHUCM61KdjR+QoCilxGcTR/BlGBq1hflZOXXqVQRVdCaOY1mhapnn22e+7Xayk5hISlHHJfq4qLXEMIzQwyVNdcBiwCQXw0W2/R61M9SCLTnw1oeHB3NAUSXpqC1GbJFWT58Cpal+N/vKpCHBQ0HZ9ouKV1TM/kA+GJhtDP5XNIQUcnLjO8eNnr/OfEkS6d9fkfgkuxir7V8Ih3tCtuqLTwxEMHhv3q6JfQEMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHgeBPvj8ieZL/ZPJDqgX2qU3yp7ZynenHEeu1JWNe0=;
 b=WXv6QM9oGgrk1/IjVknx6cvPBM65/7u9+fC9dWHbOzes9/VcE5IXnG26m+IkwqTWwR0H6h9WQj4G/6hgLSn1vhi3PHLGskJcqdHjl+RqYJVZxTjpnb5TAqR/rkN6J99h96TT85Fdj2aZSLMN2cR+G52dNzZLH7oUcY9/dfCA5As=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8f27f147-7755-4f78-bf56-884d3035d491@amd.com>
Date: Wed, 25 Jun 2025 12:34:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen: fusa: arch_specs: Definition of the Virtual
 Machines' roles
Content-Language: en-GB
To: Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <20250304183115.2509666-1-ayan.kumar.halder@amd.com>
 <c4e67301-22e4-464a-ae95-cd49f6df47f5@vates.tech>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c4e67301-22e4-464a-ae95-cd49f6df47f5@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dcbcc3-08ba-4577-7cde-08ddb3dc3436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTFnUmZsNXVQVkpoeGo1NU4vQmJYOURmbjJpQ3NwR240N3JtSFhZWjJ6MGgv?=
 =?utf-8?B?Q0JHSkV0QVZFeDJ4RzhSV05SRFVoSTEwNGtyNjlQeDhueklSam5aZG9nOXA3?=
 =?utf-8?B?V1Q1WVJ5QWJ3UDgwUGFTTkRsOEtMeDlSaHphSTAxVnFMNStLalhhbk9zWHIw?=
 =?utf-8?B?Q3haOVJRZHFBUjk4NGFtSnliei9iRkV4UXlTK0k2Sjh5bW90L1lyTHVYZkNa?=
 =?utf-8?B?Q3B4dWFuT21UeTJuRjh4Y2NTQWxZL0hTQ3paMGI2YnZmbGtzNk93ZE9pVTNt?=
 =?utf-8?B?NVFtbytlR1VSaHJBelduWXFBS25MUUNzUTR1WE96Z2RJc3ZoczRLcEZFTVZK?=
 =?utf-8?B?RUdkUlRkd0NrYTNWUXBCTysrU0xJdGJTYnlnNTd1UFJlUGZvbTd1WllBWXB4?=
 =?utf-8?B?SWFwY1hZVnFuMGtTZVJpV0hVbTRZSVZ3bTVFNnFQNGsvb0J6RTQyVFNHNk52?=
 =?utf-8?B?QUcyWGRFN1RLZVlYQlI3bWxBcEV3clVLUEI3UjBsblE0K2F2RUphRWlmVHhj?=
 =?utf-8?B?ZGZJSEtQVGYwbjhKcmdrbFQ2UGwrQ1JGOE82RDU1UVR3T0tBWkF3ZTVDSFA0?=
 =?utf-8?B?Z3ZLMnpvbk5GNlNxNVRnekhOdTBIUzBxRmFOcURQTmxXT2ViZ3pad2E4ME45?=
 =?utf-8?B?dWZobDdHUVU1UzVVcHdneTdhZmhsQXZPa2pkRmdxS2JqMDBJc3NxeThZa2hJ?=
 =?utf-8?B?OEUzZEloTlI2RWVUN0RkemVTUkJjb2R4dGcyNytuelNYd2pvbkUrdlp1MVVP?=
 =?utf-8?B?MUhlRUhaY25sNGlhaW5BcUVTcCt1SDF3b09iSy9zMjllRTZRU3BYMnlWUE1M?=
 =?utf-8?B?aGZObWROT0RPWlRNNUdMT2Jic1JVcEVUNzhqVTVBTWFGWVVRTm9hWDI4eWFH?=
 =?utf-8?B?QjVzTXFKZ3pFMTBqTEhwSnNvc3BhbFpHVUNwNk9aaDdVdk5KajFBam9udW5y?=
 =?utf-8?B?WG1nZEE4dCtXRGtmTnYvRFAwQXBIUzNMY0VOd0FyTm1Nd1h6Y2g1Y0FUWlJt?=
 =?utf-8?B?dUQ0dEpFOHpXZ1Z1LzhNbm5aZzg1TWRuTnAvMm1Jc3locER4NGFTZDFwbktG?=
 =?utf-8?B?Rm5ZeTgzQTMzaStHZEFjcXNIMHdTdlppYStMQ0p3dDlKTlZWcEZxd1NyNjRr?=
 =?utf-8?B?SzJab0JyMmM5ODJjUnNoQ1NRTnplcC9GcXBaWjVLTmNwcDgrZ3kvRWp6azkw?=
 =?utf-8?B?aWcvUU1ya25Dd01uT01ObEpqa05nN0lrSjJGNUQ5WUFGNG1CQUdyUnJubmR3?=
 =?utf-8?B?bUVvVVYxVXd1ZFdJbXRxWllIdGVySE1VN3drZk03dDZ5Q1lxYTZQa2lCd3NW?=
 =?utf-8?B?OTlUUUNUOHFhSWpZNFpkMDNkR245VWlxcnl4OFpITGhIVmZlR2VCMHd4SXJw?=
 =?utf-8?B?Rytvb0RUbDZKcEhPR2lvb2ZLQ05tZ3BsNGEzWE0xdWZYSU83ZTErcnJIWnVp?=
 =?utf-8?B?RjFDb2RLK1dpWnFtTzYwVXFCYnU5cmxzWDgwM1VOQlRlbnZPZTN4cUtWbU84?=
 =?utf-8?B?MElHY0lrSGVoRWlxVjI3ZGlRSFY1M01yK1FCaS90VllXTmFURUVHY0x6VkxK?=
 =?utf-8?B?TTUrcit4YURPc0pHU3ZaMzhqdTExV0FCOEF4bXRQTFNyWVIzcFprVWx3WU9F?=
 =?utf-8?B?c0pUUHdUcWhYbXI2RVQwM0dDSmxUenh3QTI5SWMxejlsaDNRWGYxRG4vU1hh?=
 =?utf-8?B?ZnJBZyszeFlYTWhEWUhrQkpXREZ6bnJjNSszYXIyY0xBNVBFMHRtTVdIS1dt?=
 =?utf-8?B?UHFuV0duQVR4OGd6SWtVQW45QzY1WHRGdE4yVnFtWUFLdXJPSmwzL0k3MWZ2?=
 =?utf-8?Q?CUj6PD92vzN2gcVGe9jrhwkJP8mqUv4pM29ek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRiZkhzdE1NQmZkUTExWW5hUFdva25TR3drU1pvQUM4WkZSZDlFeWVEemJk?=
 =?utf-8?B?WTVwQXJDVEs2UTd1YmtZQ3NNU21PS1dWblg0SGVEcG1UTExDRUt5Z05qeSs2?=
 =?utf-8?B?Z1ZPSG85RW00ZDN0NmR1VnBQTHFqRzI1dEIvbGQwaXdvQjFmQUZXL1p2dEh2?=
 =?utf-8?B?VWYvd1NxWi9rK0N1QTJwSVRhV3FwYk1PY01EV1RGU3NaTGZ5a2EvOEozeGNu?=
 =?utf-8?B?R3pqaHY0bVpwb1ErVkNjN2hla3JPY1JSWEhRdWpGTVF6V29maUtIQ1VPNHRn?=
 =?utf-8?B?OHg5ZlJlcVdFSVh0ekZDMzQzcGFEbXV5TWZPVWhmY25hN0hZc3dLNldMZVdo?=
 =?utf-8?B?Vm5wbUZwME5BNXRPRmdDc0g3VlFOVlVuQmJIQm94UkRLUWFuWVlOUXBaSng3?=
 =?utf-8?B?bExNQVFVNElGTDd1TEMwTnh2OUhjYTQvZFdkck41ZjVGTHdPa0svWlQxWE41?=
 =?utf-8?B?eldlWEVRMGgyOStZZmxOU09vY3Q1UVZaYjE4Si9VZkxCdEZ4S0lVaUxsekRz?=
 =?utf-8?B?NXFGcVBjRHRXcnE5T0JzN1ZRWC9KdWlXQlpZZFNBQXd3cHcrcFQ0a05JajNh?=
 =?utf-8?B?bWF0dFM3bkhlV2JnMVJJc3U2ZnlqTkRJbEhvcUdJb1JGTVFhaDFRb2VOSmx1?=
 =?utf-8?B?TjRYRkR5VVl1K1dWTjBUcXR1cUFvMENWTzdLMFExYXZEZUVuN2k1WW5udk5I?=
 =?utf-8?B?aEdZcGVWWnk3Nk02YmRxVjcwVW5DQkptZ201VmJQLzRZYlVyWk9HTVl4QmRa?=
 =?utf-8?B?SXpVU1k1TXNWYUhmTE5IWUhTODF6VHR1Q0tkWGEyRDZVYWRSd1BMdm1IcHE1?=
 =?utf-8?B?K0piZ2hWWlJDK2wvU2RnbzllekhpRnRzOGxnSXI2K2VsSXoxbi9CWDhtMzFw?=
 =?utf-8?B?eWpreHRWYnA2NXR2Q3dheEFwVkZrNEc2WkNVVVk4OTYxcDhqNTRubi94NEp5?=
 =?utf-8?B?eDE0dHZNVENPdVdVWXRzQU9HR3JtSzNXeVFGSmw2Mm1LWjZySk1NQXVRTy9E?=
 =?utf-8?B?SEI0cTZOU3RNR1JobjQ4Zi9XN0hvVm1GOE55YnJ1REZTQnFvYytsMjVoQnZu?=
 =?utf-8?B?U3JHRHZqSkE1Mm43SXU2cmlOUmRCQldFT3lMWlorMzROUFJMakNNbUxhUXND?=
 =?utf-8?B?SGhVRHFmdnZVZjRXMkFLMXUxOHo4WnpodWo5blFBYzNHTzN1NFFTb3Bua0xk?=
 =?utf-8?B?TzJHSUUrM21TT1cvazIvUC9RSm80NTlzU0RISm50UVorekhVNlVLb0ZkbGpO?=
 =?utf-8?B?TGZ1WFV6V1FzZTRGa2w5WkYvMmc0M0RKM3BEL0dsU3J4dTZXbXovR3QzVVNT?=
 =?utf-8?B?WXJJSEw5RGNYc3pZRG1TL3ZBVExkaTI1cjhESHRodE5iSnlrT3JSN1Q0b1Rz?=
 =?utf-8?B?UktqejVpQ2Z0a0RieWIvTHAwYkMrOXlzQ3owT1ZiTVBSbE1MSWJibDRta3NT?=
 =?utf-8?B?QnhMTzJGQ0V3M0xORURFQVVkYWxIOVQ0VVlVUzhLanZHMzV2NXYzN2hYMkl4?=
 =?utf-8?B?NlNDd2l5dWxmYVAvajRFdzhHTXJscG1VZGprYlVWbkhvNElPVzBZc25LTUk0?=
 =?utf-8?B?OFZ1VkhpZkkreVQyYWc0cEJ4OStwajFtNkhodlQzVjJ3Mlhoa0Fzdk1qc0J2?=
 =?utf-8?B?N3FoOE9ZdURYb01LK2F0a3VTalNLWHRNOFl5M0JQcTM3K2xhQUt5NzJ4dk1R?=
 =?utf-8?B?YkxOZk9CRXF1Y3V5NXRYYXkrV0dvV3d2ZXdWREZJT0xqU0U1OUVnV3Z2NjVk?=
 =?utf-8?B?aXAzKytTTnk4aFlPU2VpZTUvQklTbU8wSFE1UlZZUTF1R1puZlJKdWpOVktZ?=
 =?utf-8?B?Qm5Qd0Z6N1ZHMUlDQlNMenh1ZU1CU0xsVjZqdnRWNm1IZ3Y3d0FwNXFXUUM4?=
 =?utf-8?B?aGVmT1JQVVBVTGpSMGdERkVNdTZ6d3kycXdxWTJTaTJJUzBUWEJkRjQrTDdT?=
 =?utf-8?B?ZlpOMHptSHhwRUxXc0FHSDloa2VWOFM4OE15VExaVkN5RWpMMHdBN2dQWEU2?=
 =?utf-8?B?QWdpQnJKRGVQVC83MVduY0szL3JiUEQwYStTZHJIZm1LZW9jdVU2SVVERENw?=
 =?utf-8?B?bGV2cGpCbXlreklQczR2OHFzd0tiSjdsUVJWcTNpSy8raEIxV2h1Z3puU3ZK?=
 =?utf-8?Q?B0gT0+1CsXOdIUyPGe+94WKR5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dcbcc3-08ba-4577-7cde-08ddb3dc3436
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:34:10.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: impq7ErkQEtzrJu94GCDwkbwJY4Am7Fr6B75eQ074OE1ZNLIb2n8uVogrOsEUW/xmfi+ABFoflRYw7oWzmJFnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6931


On 23/06/2025 10:34, Yann Sionneau wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Hi Ayan, Stefano,
Hi Yann,
>
> This doc looks nice overall!
>
> However I do think that maybe the role part should be separate from all
> the explanations about virtio.
>
> I would say virtio deserves its own page.
>
> Also, I'm curious what "FFI" is.

"FFI" is freedom from interference. This term is taken from ISO-26262-6 
Annex D.  As per understanding, FFI for Xen means whether Xen is able to 
prevent or detect and mitigate interference to one or more VM from other 
VMs. The VM/s which cen be protected from interference, can be 
considered for running safety critical tasks.

Now, there are various operations which are used for communication 
between VMs. For eg grants, event channels, shared memory. Also, there 
are operations which have a system wide impact. For eg suspend, power 
off, clock control. Each of them is a potential source of interference 
between VMs. What we need to determine is whether Xen can prevent or 
detect such interferences for any (or a set of) VM/s in a given 
scenario/s using VM roles and other properties. The scenario/s will be 
validated for safety certification (under testing for FFI).

You can find some relevant discussion on "hardware domain and control 
domain separation".

@Bertrand , do you want to add something or correct me ?

- Ayan

>
> Thanks!
>
> Regards,
>
> Yann
>
> On 3/4/25 19:31, Ayan Kumar Halder wrote:
>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Define "Hardware Domain", "Control Domain", "DomUs", "SafeVMs" and
>> "UnsafeVMs".
>>
>> Explain the limitations that VirtIO introduces and the way they affect
>> the defined roles.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>    docs/fusa/arch_specs/roles.rst | 200 +++++++++++++++++++++++++++++++++
>>    docs/fusa/index.rst            |   1 +
>>    2 files changed, 201 insertions(+)
>>    create mode 100644 docs/fusa/arch_specs/roles.rst
>>
>> diff --git a/docs/fusa/arch_specs/roles.rst b/docs/fusa/arch_specs/roles.rst
>> new file mode 100644
>> index 0000000000..0b3fe821c3
>> --- /dev/null
>> +++ b/docs/fusa/arch_specs/roles.rst
>> @@ -0,0 +1,200 @@
>> +===============================
>> +Xen Domain Roles and Privileges
>> +===============================
>> +
>> +Roles
>> +=====
>> +
>> +We define the following roles that Xen domains can have:
>> +- Hardware Domain
>> +- Control Domain
>> +- DomU
>> +
>> +In addition, we classify domains based on the criticality of the tasks
>> +they perform:
>> +- SafeVM
>> +- UnSafeVM
>> +
>> +DomU
>> +----
>> +
>> +A DomU is a regular domain without extra privileges to perform
>> +operations that affect other domains or the entire platform. A DomU is
>> +therefore unprivileged and can only affect itself.
>> +
>> +Hardware Domain
>> +---------------
>> +
>> +The Hardware Domain is a domain that has direct access to all hardware
>> +peripherals by default, except for those controlled by Xen (CPU, MMU,
>> +IOMMU, Interrupt Controller, Timers, UART). Hardware resources can be
>> +directly assigned to other domains ("passthrough"), but the default is
>> +that they get assigned to the Hardware Domain. As such, there can only
>> +be one Hardware Domain in the system. The Hardware Domain is not
>> +privileged: it cannot perform operations that affect other domains or
>> +the entire platform.
>> +
>> +In cases where VirtIO is used to share access to physical devices among
>> +multiple domains, the Hardware Domain requires some limited privileges
>> +to run the VirtIO backends.
>> +
>> +Control Domain
>> +--------------
>> +
>> +The Control Domain has full privileges over the system. As such, it can
>> +perform privileged operations, typically implemented as hypercalls, that
>> +affect other domains and even the entire platform, such as platform
>> +reboot. There can only be one Control Domain in the system. A
>> +non-exhaustive list of these operations follows:
>> +
>> +- Reboot other domains
>> +- Reboot and shutdown the platform
>> +- Suspend/resume other domains
>> +- Pause/unpause other domains
>> +
>> +The Control Domain is optional.
>> +
>> +SafeVMs and UnSafeVMs
>> +---------------------
>> +
>> +A SafeVM is a domain running a safety-critical task. An UnsafeVM is a
>> +domain running non-safety-critical software only. No safety-critical
>> +tasks are running in the UnsafeVM.
>> +
>> +The Control Domain must be a SafeVM because the Control Domain has
>> +enough privileges to affect the entire system.
>> +
>> +Without VirtIO (see below), both the Hardware Domain and DomUs can be
>> +SafeVMs or UnsafeVMs. There are no restrictions. For example, the
>> +following configuration is compatible with safety:
>> +
>> +- Hardware Domain: UnsafeVM
>> +- 2x DomU: SafeVMs
>> +- 2x DomU: UnsafeVMs
>> +
>> +Privileges
>> +==========
>> +
>> +Full Privileges
>> +---------------
>> +
>> +A domain with full privileges has unrestricted access to all services
>> +provided by Xen, including the ability to perform operations that impact
>> +other VMs and the entire platform. Only one domain holds these full
>> +privileges: the Control Domain.
>> +
>> +Unprivileged
>> +------------
>> +
>> +An Unprivileged domain lacks special access rights, allowing it to
>> +perform only operations that affect itself without impacting other
>> +domains. For example, an Unprivileged domain cannot map the memory of
>> +another domain.
>> +
>> +VirtIO Privileges
>> +-----------------
>> +
>> +Domains running VirtIO backends, such as QEMU, require specific
>> +privileges over domains with VirtIO frontends to enable proper
>> +functionality. For instance, they need permission to map the memory of
>> +the domain with the VirtIO frontend. These additional privileges are
>> +necessary for standard VirtIO operation but can be removed when using
>> +the VirtIO extensions described in the VirtIO chapter. This is the list
>> +of VirtIO privileges:
>> +- mapping memory of VirtIO frontend domains (foreign map hypercall)
>> +- device model hypercalls targeting VirtIO frontend domains
>> +
>> +VirtIO
>> +======
>> +
>> +VirtIO is a specification and set of drivers to share a physical device
>> +among multiple domains. For example, assuming the Hardware Domain has
>> +access to an Ethernet device, VirtIO provides a way for the Hardware
>> +Domain to allow one or more DomUs to access the Ethernet device.
>> +
>> +VirtIO is based on a frontend/backend architecture: the frontend is a
>> +driver similar to a regular Ethernet device driver (using Ethernet as an
>> +example), running in the DomU. The backend is a "proxy" driver running
>> +in the same domain as the device driver and have direct access to the
>> +device. That domain is typically the Hardware Domain because it is the
>> +default domain for hardware assignment, but it is also possible to run
>> +VirtIO backends in other domains, provided they have been configured with
>> +passthrough access to a physical device. These other domains are called
>> +"Driver Domains," and the limitations discussed in the context of VirtIO
>> +for the Hardware Domain also apply to Driver Domains.
>> +
>> +There are multiple issues in VirtIO that affect freedom from
>> +interference, so deploying VirtIO introduces limits on the configuration
>> +regarding what domains can run safety-critical workloads.
>> +
>> +It is important to note that VirtIO is not the only way for domains to
>> +communicate with each other. Specifically, there are other protocols
>> +such as Argo and plain shared memory that do not have the same
>> +interference concerns.
>> +
>> +FFI: Shared Memory and Interrupts
>> +---------------------------------
>> +
>> +All VirtIO protocols are based on ring buffers over shared memory,
>> +called "VirtQueues." Although there are well-known methods to set up
>> +ring buffers over shared memory that are free from interference, in
>> +practice, the existing VirtIO specification and current frontend/backend
>> +driver implementations do not follow these best practices. Thus, the
>> +ring buffers over shared memory can be a source of interference.
>> +
>> +Given the current state of the VirtIO specification and drivers, it is
>> +recommended that both VirtIO frontends and backends run in UnsafeVMs
>> +only. This way, SafeVMs will not be affected by interference caused by
>> +VirtIO protocols.
>> +
>> +As ring buffers exist over memory shared between domains, it is the
>> +domains' responsibility to ensure they are safe. This is outside of
>> +Xen's responsibility, and out of scope for this document.
>> +
>> +FFI: Memory Mappings
>> +--------------------
>> +
>> +VirtIO expects the backend to access ("map") arbitrary memory addresses
>> +passed by the frontend. In other words, the backend needs to map any
>> +memory of the frontend, which is a privileged operation in Xen.
>> +
>> +Xen implements a Xen-specific extension to VirtIO to address this issue:
>> +"VirtIO with Grants."
>> +
>> +Xen has a feature called the "grant table" that guests can use to
>> +voluntarily share individual memory pages with other domains. This way,
>> +the backend does not need the privilege to map any memory page of the
>> +domain running the frontend, as the frontend whitelists pages for the
>> +backend to access.
>> +
>> +Unless "VirtIO with Grants" is used, to enable VirtIO, a domain with
>> +VirtIO backends (the Hardware Domain or a Driver Domain) is given the
>> +extra privilege of being able to map any memory of domains with VirtIO
>> +frontends.  As this is a source of interference, only UnsafeVMs can run
>> +VirtIO frontends without "VirtIO with Grants".
>> +
>> +FFI: Synchronous Emulation
>> +--------------------------
>> +
>> +VirtIO expects certain operations to be synchronous: the frontend
>> +virtual CPU requesting the operation is fully blocked until the backend
>> +completes the operation. If the backend does nothing, the frontend vCPU
>> +remains blocked. This is a source of interference.
>> +
>> +When VirtIO is enabled, the domain with the backends (Hardware Domain or
>> +Driver Domain) implements these synchronous operations for domains
>> +running VirtIO frontends.
>> +
>> +Xen implements a Xen-specific extensions to VirtIO to address this
>> +issue: "non-blocking VirtIO." Two extra virtio-pci registers are
>> +provided, allowing the frontend to perform non-blocking operations. By
>> +using the two Xen-specific non-blocking registers, the frontend virtual
>> +CPU doesn't have to block while waiting for the backend to complete the
>> +operations.
>> +
>> +Unless "non-blocking VirtIO" is used, to enable VirtIO, a domain with
>> +VirtIO backends (the Hardware Domain or a Driver Domain) is given the
>> +extra privilege of being able to implement these synchronous operations
>> +for domains running VirtIO frontends. As this is a source of
>> +interference, only UnsafeVMs can run VirtIO frontends without
>> +"non-blocking VirtIO."
>> diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
>> index 5f1e8acfc4..9d989f5105 100644
>> --- a/docs/fusa/index.rst
>> +++ b/docs/fusa/index.rst
>> @@ -7,3 +7,4 @@ Functional Safety documentation
>>       :maxdepth: 2
>>
>>       reqs/index
>> +   arch_specs/roles
>
> Yann Sionneau | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>
>

