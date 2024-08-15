Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD22952BD2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 12:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777975.1188044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXZq-0003LJ-Bq; Thu, 15 Aug 2024 10:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777975.1188044; Thu, 15 Aug 2024 10:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXZq-0003IA-8z; Thu, 15 Aug 2024 10:19:30 +0000
Received: by outflank-mailman (input) for mailman id 777975;
 Thu, 15 Aug 2024 10:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2AJB=PO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1seXZo-0003I4-Vw
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 10:19:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e88::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d97ce659-5aef-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 12:19:27 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 10:19:22 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.018; Thu, 15 Aug 2024
 10:19:22 +0000
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
X-Inumbo-ID: d97ce659-5aef-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBmq1uPzCmqkjjJnl6j7elu5IL6+wI957UUOceusXKFS6USR3aO5/LcSpgYM5eMQRXDu5U7LW2NxE0/anairGhgD+9+VlVO+cENHSBM5KHzayYf72QEw8J4TObWd+cNlqFvAP+xAM4otSiKOxYckxS28bv4hKe/uyNikfpA0VlVLS/LQH1losT9KbKyjwNwJoX2iIsfbvMnDghk1fw4HVj8jS7QH+rFDZzxyx2n7qSL7QE4XYUfa5115b/inb1ZwsZjcw26wteokeq2S1Lyf7H5njXjuA8GYh4jwLsuNiZr+LudH0yHbM4EIra72w3BIYwo1Sxq7gTtnXO2ARl10Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDq+aa1b/tTy5PKA4RYeHTiQ1wnB1oMO2F5Fw9ngVqg=;
 b=NzESjjjOtfYGlEOypzYhWJnRG4IEwKCRgSDN/wXVLRJchzxeLo6M7FJ3Vu9EAcY53aq2jwSkaKQyoh2OvP8ZKeL+ndDaFAFFtk0xeHH1IWOlKi52IzGFGItAqPUz3Fob4D2cRQt5KWudc0EE54wVhnunP5AfO3pCsjRococi+ucF0igNqbaRVGTeiQM6AbLhcJuiMdUJjk+AbGmOCQaT3c4/BqouOGqK4uF+Kb/EWv4cznP+mZsrBnI//MkWciLYARNfoUUMiwnINX0x+K1yeHlind44KPy7L5rTjop6Nyqwb9piWrBeZomaO9bYt161amK1WBcns/warvt6JQj19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDq+aa1b/tTy5PKA4RYeHTiQ1wnB1oMO2F5Fw9ngVqg=;
 b=OmuaFSQWjNaQisPUlgTg1VahMIBMyFktzuxf9vw3weyaG1w2hLvrNgTGZlisYYBnxdqsfeMUT9M4TmOs1EuUGQIwXQ+g5oO3H+ImG14V6VLNWLmPVtuGrMQm7ZnonaCRjvYYCNtjHdzNAMfgUWTSae7pHrdxTner6wxCCf5ahQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <49a1c722-e6d1-4f26-b8bf-71651661d0db@amd.com>
Date: Thu, 15 Aug 2024 11:19:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: Hide FEAT_SME
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814210054.67520-1-julien@xen.org>
 <22dcdbbf-5000-4b92-b746-5e01c0160776@amd.com>
 <7612e207-7eff-436a-b884-3a0227aababa@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7612e207-7eff-436a-b884-3a0227aababa@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::19) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: ce62aa6c-8f27-4b0e-824b-08dcbd13bb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGl2bkxVV1pKajUveDlnT2VUeXB5WFlUcEV5aFVtSi9FdWVYdmZUTk1qdjZZ?=
 =?utf-8?B?NGZwU0pIRldCWFVIdHFxcDE3VTB5eVBjNW5Bc3M3Q2xiRklUSUIzMkxxYWJ5?=
 =?utf-8?B?UWZrZWVHdG1pTEpWRlY4MUpuUmMyTi9oVXN1VEZNQ0VXQUlSSnhqaDFOWjFw?=
 =?utf-8?B?VitjV1BoUm1wMkZhd2JkRUtaVUdKcXRobEw5d2NKL3JtMnJ5ZEZYWnROeUNS?=
 =?utf-8?B?ZW5zUzYzUTVqS2FTSTBsYTI5T0ZObDh0UUY2VVJEeURFeEJSb0czQysvbmZM?=
 =?utf-8?B?SVVRN3ladStHRUZBclBPZFJrQU90RkxBMXVyb1BBUW81RW13SUtXRzdMWXo2?=
 =?utf-8?B?cm4xWUNxSENoR3FXbWhwMUdJT1hTS2plMG53NUxWamNGTWR2NTZEOEtQWjYr?=
 =?utf-8?B?RXk3YWtkbDcwTlZXaDdtaTkwTW9FM1pkK3ZUVzFSQ3JNNUt2VG9JTGY1c0lh?=
 =?utf-8?B?TlJqajZoRGN3Si9DMUprajdjb3BicFlJOGQ1Rk9FRXVtUmJmS3BlMGZnR0Zx?=
 =?utf-8?B?dzlIUUllZjNhS2JxOTAxSk5YVXRHYTJtdXgrc09KZ2VZUERLaGRMMHZNSk1y?=
 =?utf-8?B?ZmJPVWIwMlE2RkR4eG1hSXF0bWZlQVUxSG5WT2tMckxhRlBOdWV6WW9SOElL?=
 =?utf-8?B?bXFGUXhwR1NORTNEck52ai9hUlU1Mi9oUXdEREVZRUpFc0lzUWNxZGNlaGJP?=
 =?utf-8?B?NHRjdUJkOEdFdU8xWENsWTdhRVp0UHRRekdWQmcwK2srQUZ2YnVuYTVoMGJH?=
 =?utf-8?B?Kzd2c05SNzBmM2E0elpBUjQ0QzNjVkwremFjRzVFQk9SV1lMaHkxbGFaRm9I?=
 =?utf-8?B?Y1pYdDVsNG5nTmhxWWJCdFM1NGVPckZyTlpoeFJoTHNBVG8xcGNuSFBaMTM1?=
 =?utf-8?B?OTBaWlJHN0dPODR4c2FCZ0ZxWEFzeEtBWEhDMWs4Q05YTzRKTUVwQjFROHJC?=
 =?utf-8?B?anN6VHdVZ0xHeG91ZHBRU0hnRGczcHV0WG13WDlkS1ZiaFkvUWdQZ3pLLzlX?=
 =?utf-8?B?anZyc1hrcUdiSnozekF4enorMHVkbGptaEMreUlSZWZsWG1oSzFQck1MWFNZ?=
 =?utf-8?B?TTNsT0lvMGxkZkFWYStRV214bnkyTWdMcjFXZlpqTDN6Y0czblhtTVRTRTVB?=
 =?utf-8?B?S3JMdDhqRFVRK3BBNzJrYlhVS09oeDlaeTdZTVRkeU83dkdFNFQ4U3VSL1Nl?=
 =?utf-8?B?VytzQThreFRCbWdXMzcwUnZzY0tCemJZOXNrVzA2ZGNzL1BSTU9BMThEc1Nt?=
 =?utf-8?B?SnM0TXVZaitxd3BUSmlNOVR5dk9QWU1DQTFIbWs0bUlzZnpReldOSFRFd0Ez?=
 =?utf-8?B?TGxSMXcrNGZaRXZZVkR5UkxKQ0FFZXJCelNqN09GMm1hMkIwdUdMR3M1WTNW?=
 =?utf-8?B?Z285Y1YzTE1wb2NseENGTzl3a0tHN2Z1ZVJFMGVUSEh1YXMxdFpkdDJ1V1hq?=
 =?utf-8?B?aExaWWZ2dkdmcWNVNEpqRlpRbHVBbXNBd1gzNkd3NWEzbnIyUWc0RVM4d3VP?=
 =?utf-8?B?a2hXenJpaUEvcWhXMXVjT01UbUFTdHZqNlVNWVhHRHVqMG5WWklCNXY5a3RU?=
 =?utf-8?B?WUNEUFJtOUdvSkNtVFVzR0dhSmlRSEhKTVAzeFpkNGw4Mmttc0c1SkNHbUZN?=
 =?utf-8?B?VENBbHVLVlRDa2JIblZCVjhoeXBKNlVSQnd2VW1HdmIycWs1U2J2OVNubWZU?=
 =?utf-8?B?cjdQQUM3L3JoTTFPeUcrMGl1TWkwUk4ybFgzUjI0QUYvZTExUGdQYlVQOHhB?=
 =?utf-8?B?WkovaDFnVFlDc3FWKzgxMmtDeUU4T2F5dFNqanVmZEpkZjdHa2hGWTU2Z1o1?=
 =?utf-8?B?VzNMWXMwKzhZYTBLTnNsQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1pWZldyTjQxSGR0RTNjRktCYnkydnFralBlWFlMR3RNREtQS3RFVTAyWXFO?=
 =?utf-8?B?SnF0a2t5bkp2Y1dwSVd0RFgyT05RekVSNEwxdWwrVUVDS0hKRGRyS1U2c05O?=
 =?utf-8?B?eE45MWNtYWtqVHJtWGJ0c0JqQ2NCSnppU3kxSE13czVXQU9TN1Uzenhsd2tu?=
 =?utf-8?B?U2phSEV4MEMzbjhyWHZqUWhQbCs1dVMxVXBoY1RWNGZqYVU1Z0V5aGU5V1dL?=
 =?utf-8?B?aWkwTFlURCtNSTBleDdhTUVQTEZKbHg0K2hhd0tVRlFTK2t6eWJZYSs4VUFQ?=
 =?utf-8?B?MkJQSFk5ZllXejg3VXZlR0tRVVVYcnVLTjdFeXd2WUdxOGVEOWw0L1BoNkhw?=
 =?utf-8?B?dWFGWmtXRVI0dVZVR2hlemdvbFAyOXpCQjJUYnpYSGJtd09kQzNDVEtpMFNO?=
 =?utf-8?B?eGdSb2pHOE1DSS9MZVA3ZHBza0dKZ3RNR2psaWQ5cXNtTGFaZ3piSFZuazBv?=
 =?utf-8?B?RzZDVmVuKzdmU2gyVGl0dEhXZDVYdzhOSkgrS3g0U01uOVJONWIyWXlXVTRE?=
 =?utf-8?B?aUYzZERXL2FlNmdnQXF3NXFpWCszZk5DeVk1RFA5eU9wcVpyMWJudlk5V295?=
 =?utf-8?B?NGZ4dnBoOGN6MG5YMmxEcDRRUURwbEVKbW1IODRubFh6a2VNcFl0QW9tU09O?=
 =?utf-8?B?VG4vUThtTlVvNW91SXpNc3hSVjlmeEtHN2t6aGI5dnVFTjUzb1ZtWHBneVdr?=
 =?utf-8?B?K2sxeG13ZWxhY2RyU0wrT21EZDJpVXMxc1BGTzdyNWMrSVlOVC94UWd4MWdr?=
 =?utf-8?B?WHJETU1aTWxmT0tqaEp3NXFld0dnUm1Pbk9YR0E1a0Jocmt3ZmZmN0c5NkJ2?=
 =?utf-8?B?a1E5K1g4U0IxNWNFMVVHNUJhNFNjWlVKbjJBcVBJVVpMbmdNU2F3Mm10UE5J?=
 =?utf-8?B?Z0hGUytmdE1sOFJVellvNzhzWVYxRXBWTERRNVUyblhRNHErbi9QK0NZWVN6?=
 =?utf-8?B?MXN4b2l0clhnN2hnYXZIa0dMYzludUhoNU5UWjFxVTlBWm5YSzdDZnJEbU1R?=
 =?utf-8?B?Wmc1NEFGRHJ0ZHRWYlhFS3ZCV1BzUmdRZ1RUM1NBRktFV1dzaTF6QmVHdmtG?=
 =?utf-8?B?V3oraUQrc3cxM3hkMDBrOUlXZENJZkRONkw2VkxnNnZZK2YrdTFuTmxGbTha?=
 =?utf-8?B?VG1XZGNmNUNMeGNmZG9kdmViUFJDOG94dzVDbjlrbGx0cTlhQWViY2cvSUE0?=
 =?utf-8?B?M2NlYTljb05PM3RaWGxLVlhuZDlVc3gwNVRURFhMK2k3a2NtWm5ySXhLaDVj?=
 =?utf-8?B?UHZENDJxNU95aDZxb0xLNXpkYS8xb1pESXQxTUc0dWpvbSttZWVHRi95TzlT?=
 =?utf-8?B?dUp0NVg4dFlZNzZkL2NZSUpaNGQvSlNtbkRITlVUL0lZNjVpczc2MkMxbUc4?=
 =?utf-8?B?ODc0MER2NS8xZnJNajEwOGt6RXdUc1Rma2NDRWcrTTFBMk1DZlpoaDV3WW1a?=
 =?utf-8?B?RGk1ckJnRjh6NEg3bEhwSUROZzZRWTdjTSswU29WOTlyT1hSK09OV2JJcTdC?=
 =?utf-8?B?NlFYNVk2cWtGVkRDNUJSUGxxa1o3UGlFQmZyNGFxK1E4YlhPd0NDeHVmSytT?=
 =?utf-8?B?TlpmQ2NPRWY5UnNjR0tKWjZITUhDZm9XNVFKNnZjcW02bzJVcHJGcDJCanFT?=
 =?utf-8?B?WGJzMkpablFmSzNkcHIybC9Qd244dFBCdzU5NzRaTldTd2Z5ZmFLVWFXWGdE?=
 =?utf-8?B?VGtaQXBkbUlwRDgxUU5hbHZYVjB2YUlqamlvbUFjT0NxdkpzR01WUW12Ym5v?=
 =?utf-8?B?THlEWDlxWE95UzNNZ0FEbUxHdGN3NHJISmVYRjlqaWpFRG1OUUpQakRoS0Vh?=
 =?utf-8?B?L1JzTjBPaGVkb0s5RXk3QURIaWJES0FZcDNRaGpMUWJUajdwTmpET3N1M2tL?=
 =?utf-8?B?ckFOZ2tTaUVQU3hUUVdrREh4eksxL1ZTTnhWb0FIZzhBWWpnQjR4dm01SkRw?=
 =?utf-8?B?TkU5dy9Nc0V4aVRyUDZwWFBUa01weVJsUkcvMUMxc2J4Smw0Q0lRakN2dnBP?=
 =?utf-8?B?cVpjaWRRYnpxN1JESllYcEFCcXljeXJ0cm1TVWlsejYvdjZFMGkxRzJwb1RK?=
 =?utf-8?B?TlFYaGpEUjh0aWk5a2o1aEJrdEY2RTIvQUNmMWcxNkJBam1PSDJOVGZwSERF?=
 =?utf-8?Q?efrK8QfbrO/SEJF9lssiHjchF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce62aa6c-8f27-4b0e-824b-08dcbd13bb51
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 10:19:22.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/dQJaGVdwf7/z3LZfvGvjh/qzicOFcKBg9wkStURn2ucVaRrHGuQPLCPoZ+ETkbcdxOVOSyQ/n+E/L+4cD/rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6374


On 15/08/2024 10:37, Julien Grall wrote:
>
>
> On 15/08/2024 09:58, Ayan Kumar Halder wrote:
>> Hi Julien,
>
> Hi Ayan,
Hi Julien,
>
>> On 14/08/2024 22:00, Julien Grall wrote:
>>> CAUTION: This message has originated from an External Source. Please 
>>> use proper judgment and caution when opening attachments, clicking 
>>> links, or responding to this email.
>>>
>>>
>>> Newer hardware may support FEAT_SME. Xen doesn't have any knowledge but
>>> it will still expose the feature to the VM. If the OS is trying to use
>>> SME, then it will crash.
>>>
>>> Solve by hiding FEAT_SME.
>>>
>>> Signed-off-by: Julien Grall <julien@xen.org>
>>>
>>> ---
>>>
>>> The current approach used to create the domain cpuinfo is to hide
>>> (i.e. a denylist) what we know Xen is not supporting. The drawback
>>> with this approach is for newly introduced feature, Xen will expose it
>>> by default.
>>>
>>> If a kernel is trying to use it then it will crash. I can't really
>>> make my mind whether it would be better to expose only what we support
>>> (i.e. use an allowlist).
>>>
>>> AFAICT, there is no security concerns with the current approach because
>>> ID_* registers are not a way to tell the kernel which features are
>>> supported. A guest kernel could still try to access the new registers.
>>>
>>> So the most annoying bits is that booting Xen on a new HW may lead to
>>> an OS crashing.
>>> ---
>>>   xen/arch/arm/cpufeature.c             | 3 +++
>>>   xen/arch/arm/include/asm/cpufeature.h | 4 +++-
>>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>>> index ef77473bf8e3..b45dbe3c668d 100644
>>> --- a/xen/arch/arm/cpufeature.c
>>> +++ b/xen/arch/arm/cpufeature.c
>>> @@ -208,6 +208,9 @@ static int __init create_domain_cpuinfo(void)
>>>       domain_cpuinfo.pfr64.sve = 0;
>>>       domain_cpuinfo.zfr64.bits[0] = 0;
>>>
>>> +    /* Hide SMT support as Xen does not support it */
>>> +    domain_cpuinfo.pfr64.sme = 0;
>>
>> Instead of this, can we do the following :-
>>
>> domain_cpuinfo.pfr64.res1 = 0;
>> This would imply that SME, RNDR_trap, CSV2_frac, NMI, etc are not 
>> supported.
>
> I could but I haven't done it for two reasons:
>   * AFAICT, there are no issue to expose RNDR_trap to the guest. Also 
> not all the bits in the field res1 are defined yet. So effectively, we 
> would be implementing an allowlist like.
>   * In the future, we could split res1 in two. If we are not careful, 
> we would expose the feature again.
I see your point.
>
> So I find this approach rather risky. There is also a more general 
> question on how the features should be handled (see what I wrote after 
> --- and below).
>
>>
>> If later Xen decides to support any of these, then they can be 
>> selectively turned on for a domain in do_sysreg() 
>
> do_sysreg() is just returning the ID registers. This only helps the OS 
> to discover the features at runtime and it is free to ignore them. 
> What matter is the configuration in of the trap registers (such as 
> HCR_EL2).
>
> If a feature is not gated by a trap register, then it could be enabled 
> everywhere. So effectively, the decision will depend on the feature. 
> In the future, we may have to take care of suspend/resume or 
> live-migration between two Xen versions. At that point the feature may 
> need to be per-domain.
>
> > (Similar to SVE).
>
> The main reason SVE is enabled per-domain is because of the large 
> state. But if we have feature that doesn't have an impact on the 
> memory usage, then they could be enabled everywhere.
>
> Anyway, the first decision we need to take is whether we want to 
> change to an allowlist. There are pros and cons with both of them (see 
> what I wrote above). At the moment, I am still leaning towards the 
> existing model which is expose everything by default but hide features 
> when they appear and Xen needs more handling.

This makes sense. The existing model is simple.

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


