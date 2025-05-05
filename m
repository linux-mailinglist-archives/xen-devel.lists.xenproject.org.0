Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC02DAA8EF7
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 11:09:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975924.1363214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBroa-0004QL-3T; Mon, 05 May 2025 09:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975924.1363214; Mon, 05 May 2025 09:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBroZ-0004OR-V2; Mon, 05 May 2025 09:08:43 +0000
Received: by outflank-mailman (input) for mailman id 975924;
 Mon, 05 May 2025 09:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAKQ=XV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uBroX-0004OF-SU
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 09:08:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2414::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 886caaf4-2990-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 11:08:40 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 5 May
 2025 09:08:34 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 09:08:34 +0000
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
X-Inumbo-ID: 886caaf4-2990-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF65BuhwTF2xk9MWr83tX5aj/DdLS4QM2kMMhc6eoEYrgVzwUnTAObEaaiT1B+ZFLbgrA1F/J7Itc0Lu4jgi5T8xL0zYwstEqh5fFqPjwTJ3PG5O/4GGuHlNELK+EKE5Dl0UV90D2Kxz+sIh4grFc5xOVi15VJy5JbHdGz6HSTZ0CAiBQsr7GrFwRz9yRCZxqxl/AGNlKyZgRRgZ9ZhXgiXD47tygBmTva7154f1a1qVcU8s5Je4EklpgxlfVO5fTWTXXTFimxpwewHCsQA4td2Zg6139IMWLpDWDRihT/5kVkSGUec3acx6Jj3FeuseOYkHmRrqFc7tLjqJOI/q2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB+ToReMZ+sEm46yEXf8goUKEDsp2weTO8yY8r014t8=;
 b=xN9mixoL7c4Qsp31zS6QLgTopCMaXTtfkqydkr+juqpN1SvQQAFERxv6vpx342RA1CT2blIvwQjWmmjGjT286vHqlgIZVFXyZVmK13Kw2YSYM5Z7aHKu9w0SS/xwfPeT8p35Cp3lcfpHc5djczUWynEyMbspLz9gyn7aerhmCXHrDiEIEdns/YQSZsbpO1lcPFUWEjS4gtL/EfuaPjmko6Y+ERj5Dw2ln+d4YX4T8m+kKlMV14ukUzvl3skLRClNdjfICkjhr9O7LYCkcWYkU0iRM9EXnRW9HOcFMb41jFV8EALs9U0sXOtpmfCC5iISZDffWn/VpSjHMOZNZ441lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB+ToReMZ+sEm46yEXf8goUKEDsp2weTO8yY8r014t8=;
 b=D1AihvxAWe2BfpCTura+x/pMbWX8D+aKU82i9nwCSg9d6fXfwClDqQfyk6kSabSwGWGYYyxpRQzfQFp07UUcApBoKdMYkb6i37yyyiL7kkKDMOjw5Xqm8QuBNEKy1HjDUbaXS2N0HIWdImNSNKpeccUEv6r4XeLj96XfFUSQmhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <468fa57c-7e64-4a52-bfac-1280fbab4aee@amd.com>
Date: Mon, 5 May 2025 11:08:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] asm-generic: move parts of Arm's asm/kernel.h to
 common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <0c16f8fb2702db5fd6751c7da347a97caa431002.1746199009.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0c16f8fb2702db5fd6751c7da347a97caa431002.1746199009.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f769ca8-e522-4d75-77c1-08dd8bb469ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWk3ZEQ1Y3Iwcm00eTdwUXdIQm53ZDhuQnFDWGNPZldaR2dYV0syNTFYL0ho?=
 =?utf-8?B?SU9lRDMrWWI0REFwNFBROGtDTXpQNVk2ZXMyeWpwWi9zRlN3cG5JMkV5b0d5?=
 =?utf-8?B?R0hnVUpSRDZsRzg5akZib0w1S0ZWUENLS04xRlA4NlNoQzNmdGRVb1gvMVVC?=
 =?utf-8?B?dXVBQXIzaElZZ1BmZUxpK3FLUjFvUUw4V0RHK2UvU2x1RHFoN3pDRTdTZWcx?=
 =?utf-8?B?MDZXamtlL1pGL3NnY1JveTQ4a1NsVm02Z2hjUkliaGZwQUFNdTRpSUNsQ2NR?=
 =?utf-8?B?bTg2N2M0Rkx5V01kQWg4RVRtSnRENzRVU2o1OG5FUUJFMGhGMjB2YkdLYU5w?=
 =?utf-8?B?REEyOTlnNUtURjZ1QURvOVJQMzQveTlJTFlscGJVelFHVFlJNjRwRVlmb0VJ?=
 =?utf-8?B?WXRveUhRbkFLY3Y5ZzBiWnhoWUhTaHlldzloNVlCdVYvRC9xeENpeElYREZx?=
 =?utf-8?B?Kyt4NW5FYXJ5OVl5Y0QwVXcwYy8vQzMyWTNGUlRGS1FnK0ZoVDFqZXJlT1My?=
 =?utf-8?B?K0IwL1F0cUpWOXpnek1ucXNMTGRUOG5pd29FZnNWaG4waEdPVHhjUkZJTEx1?=
 =?utf-8?B?UHd0amVicGVOeXVRVHA1VUZLTlVoSEtnWmxiUmJ0cUVPbzRzZ1Voa2VIMFow?=
 =?utf-8?B?ZmthK3h2RzZaYkdWcGdBeDJWRmt6YjA3bk00ckRlSVJxVW1sMlY2emFadkF3?=
 =?utf-8?B?cTRjY1AyQlVJbiszcHdrcHc2elFHNWVLVDVQeWJ6TU1HcUdZVGc3R1NQMDFI?=
 =?utf-8?B?bXpkdURvS1VSa1Q3akZLZXpOTVUrSFVrcW9MNERIREpweVd3ZVhEa2RMUklN?=
 =?utf-8?B?OFVYRm5mZnY1bXlGY1JlSFU4RTdwT09ucG5qdzFtWG5vRVAzZFlsc2VhMlVF?=
 =?utf-8?B?Z2ZQc2kxRkozb05SSzZoYW9mWHVGSmJkU045c2JiS1dZbUZyUlhDVUF5Q1Z6?=
 =?utf-8?B?aE1QcnlRd0pSOSs1dDc3NTRtWVovM2h5c0FHVGVFWHRnZGZKRmVEaVlwdUFE?=
 =?utf-8?B?cElXU3YyaUlCU1V4cDczUW1YSTZQQWxrZS9KQTFoUGJGWW9kMzlHaDdQMHho?=
 =?utf-8?B?dW5jNy8xTm5jcmpVa2gzRThEYnRpTGFKV0lVaHN5cDZyQjBvczRXcGZ2M1gz?=
 =?utf-8?B?Znc3SnRxelRpamxJYkx0TDNlZEZYUlBhanN1aGgwbisvWHJ5K1BvWmdWdGVn?=
 =?utf-8?B?Tm1tWWQ0OWlTM0cwTUprekZDUkFGWERSM2VxMmcwUWp6eUErZnhmRWtWQlhU?=
 =?utf-8?B?NUp4cDNMVVRmeXhsRzFscXM4NUQ0K1JoRzhwMG16SHAxcjd4eUVvRzZzMitP?=
 =?utf-8?B?ZEVkd3N6RHNNeHlqckV1dGpvTTBadGttRWRqTFprQ1BsUm96S0xINm5RMjhR?=
 =?utf-8?B?VnVYeDZxZ3MybUVDMW1uRE16SUhpQmhZS2E4NUN1Njl5WjVMZktYZHhQNnVm?=
 =?utf-8?B?VFROTyt6czJQK2VldzlCcjdQeDh6MXcvNlBEeGZnZG1BSUlpeWZoTll3bjJu?=
 =?utf-8?B?ZDYvRGdMbS8wTlpVcitUT25leVNZTzVpQlMxUUZBdngvWmxYaUFiTDFPc3NK?=
 =?utf-8?B?VjVmeUVqUlkxWkx1aVM2OTR3R21wQmo4emNJd1RMemNPTWtpVU9BUmZBdW1J?=
 =?utf-8?B?Qllaa1E2M2ZIOGJPeGxnVGdnU0gwTS96c3FiSFNXYVBhQzFXVXRnTTdLTVdy?=
 =?utf-8?B?b1JxdVc2aXpwMCtObldxOWxUeFc2a2JLMkhFbzlNQVkzQ2J6enoxdThQQjZZ?=
 =?utf-8?B?dHFpWUxQR1Nib1Vsc2pKd1dMTDRIMWJLUGljUTcwNUdTWEozaHhUZUtJcWFW?=
 =?utf-8?B?WVlsa1crVWEyOGtLTEQxTzVZU1p4bjZWR0RGOG1kZHprdUdid05wdUFNYWFY?=
 =?utf-8?B?QVU1VkcrQk9kbWR6MGRDazkrWms3MXgxWEtzRmM3TWVaYVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnBId0QrZmcvR3hOTnFyTHVndDdvWGw5WThFRzhydDh1ZDJYL2wreDNaSm40?=
 =?utf-8?B?TitoMmNkeTFyMlkrZjZia2JrWTNEUDhTeGFBUVRnYjVWMEtYeEpWRHhrVENX?=
 =?utf-8?B?aGo2Y3ZIQ1ZOLzR3clUySkxMODRCY3NMVSt5WkVyZ0JUVTFSR3RBQUpJZGlh?=
 =?utf-8?B?aVFJcEJ5Rzd2R2FUZkJzMEdNVXZzVkdEOXZqeEVmVnB3RGdKZERrd3Z2VXBa?=
 =?utf-8?B?Uys2djV3MmtOSUdhRjJONVRnN0IxMzN0K3UzWlpLQkZlSzh0dXpMRmo2OTZU?=
 =?utf-8?B?dWhQQUl3VlJOR25zWXdHb2RPNi96ZVZwL2ZYNm9JV2lvejRUWmRxU3JmdmRT?=
 =?utf-8?B?NXUzRUUza1ZsanZpRncva2RTUU12R0drcFlyd0JSZkhBSHRJWlgxb2NLaFk3?=
 =?utf-8?B?cEtaVXc4YU42ZkI1NWpLdU1vVkFwY1l4SGJxcjl4M0tHME5qeE1YYTFma256?=
 =?utf-8?B?R3pGUTlzYzhXRHVXUU03NWVycG5iaitZZlRyY1JrM3hySU9OMW9sQmdTRHY5?=
 =?utf-8?B?aHFISnhidFpMRXhoNVA5bmVpb0g2UTN0UmtBOVlST1VrbGRQc3BxOW9yVk5N?=
 =?utf-8?B?R3EzRGVsWXV4bDNBNjBTV0ZSQU1hTEVoa3lOWTNJRVJUTnlwYWFPZGlsbW8w?=
 =?utf-8?B?emI5RWxMR2NzZk8ycWlkTjVTOUxLNElFRklKd0dzcUlZZFNQM05acC96SmZ0?=
 =?utf-8?B?MEpYT1Jrblp4dzNoMjIvUW1iUHRkcGIwd3NZNlZDRFRweEtsNDBNUGpVSEVo?=
 =?utf-8?B?elFQK0VQbFYwbi9ybkpackoxdjIza29VUFZ6S1FqZjNMTENwSmNLZ2dKNUZY?=
 =?utf-8?B?TlExYm9aM3FQbFE5Tlc0TnhPdFBMeTVxNEdmSWZVYkxYSGNFdHNwNm44Sm9p?=
 =?utf-8?B?S3R1Q2tYVElVREM5OVVmYWs1RjhabDY3Mk9LemJvMzdKV2VyejBER0JPT0Rl?=
 =?utf-8?B?MnBNdm54dU5iZ3Z0SlJBalpGSTNNZkhOc092Wk1Sc053MXp3dkcxTDZTY1N6?=
 =?utf-8?B?cXJVU3V0Q000TmpHSkNrSUQrZ0VwcVNoYnMwRWJYeFY2dmFKQW9MbVh4cXdQ?=
 =?utf-8?B?K1BoNjNmQjFsV0VNY3I0bk9KL0Jvem41b05nSzBWc2VQSkpJN3dNaUpuNWpS?=
 =?utf-8?B?Z2ljcmMrMnZmb2tKZFpXa01naVVaYjlHblpBTWVnNnVoY2ZPN0d4S3hqM3Ix?=
 =?utf-8?B?ZTNWWDRHanBYMUxYSUFMa2g5QkxPUjhnWlVzVUFHaitPOEZibkpCVlZ5OHpa?=
 =?utf-8?B?c295SXBZQVdldjMzR01waUhyMmpTdVdCSTV4eU13djVlTDlBelpRcG1rNHlr?=
 =?utf-8?B?ZGdlaTF4YmxEVEJXV0ViT0FJM1cwZVcwL0VMRnZmL2NqMTRWNWJ1dVlDbDdo?=
 =?utf-8?B?U3REN0w1YzE0a2EyQ3NaeG9QYXdXMFpuSXdnSUphbWxoUWxaeWF3MEw3V29s?=
 =?utf-8?B?bG1KM2t0eG9UNVpmUTJjSGVSbFhGd1hSTWhCZExrbktQYUU2OWFsNnZlTDFJ?=
 =?utf-8?B?Z1JwWmVQbHowUjJtZFZpRHJ3eGRhaHdvY2IzSUZCRVZaaHZKT1h6aWN6aWFj?=
 =?utf-8?B?VXVjcEhMcWpuWnZ0R09tYnNuZHVKOW90RS9SdW9sUXY2NklRa0F4SlhjcGJa?=
 =?utf-8?B?b1pNUkMxemx4Y0M0RFFnS25yRmowVmo4MThxNVREV2JTVXo5ekk0a2IrSitv?=
 =?utf-8?B?TjJaMGJZYkNwVEgxeHFWbVpOSE04K01yRVJlVlM5MGxzbXBkNzFmT2hVaU9X?=
 =?utf-8?B?MU5SdWZETHNYSzZnVE5HR1lBbE9CS1llYkNkTDN1KzJzL1E0WGlVZUc4V0xt?=
 =?utf-8?B?bitHQ1o2TExnU0J0ZDhEaHFHN0cxRXZUbUNGdG9MWEI2aGQ0ODRnUEhKTWpS?=
 =?utf-8?B?MVpieXZoRFZyVmxNU01wM3pHM0tDc0d4YkdBd0NlbVcrMWVlenR5alNVT3lD?=
 =?utf-8?B?anpOdkdWUnUzbCsySll3SmlkRFJidnZ6Tlg5Q05zdUdUOGF4cjJ2dXdaVTVS?=
 =?utf-8?B?RkNpbkZuTlhVbXNmS0xIQnY5TlREcUVYTHIwYTRneVZqVldhQlpWTEhvdURH?=
 =?utf-8?B?VzN1UXVXR05yUDErbjRHMUo0YjJweXJtMUdyOU55and4aWVWNVhGL0hoTXk1?=
 =?utf-8?Q?zNNY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f769ca8-e522-4d75-77c1-08dd8bb469ef
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:08:34.6375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTXJK/7z/ySWWdU89UDxz7+JhRgnIQXCN2HqsbI/KzFwlvURn9tyJVUihNCbXxky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571



On 02/05/2025 18:22, Oleksii Kurochko wrote:
> Move the following parts to common with the following changes:
> - struct kernel_info:
>   - Create arch_kernel_info for arch specific kernel information.
>     At the moment, it contains domain_type for Arm.
>   - Rename vpl011 to vuart to have more generic name suitable for other archs.
Why do you want to make it common? At the moment it referres to vpl011 which is
Arm specific, so it would be better to move it to arch specific struct. Also,
there can be more than one emulated UART (especially if you want to make the
parsing of vuart common), in which case enum would be the best fit.

Also, one remark...

[...]

> diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
> new file mode 100644
> index 0000000000..c81e759423
> --- /dev/null
> +++ b/xen/include/xen/fdt-kernel.h
> @@ -0,0 +1,133 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * For Kernel image loading.
> + *
> + * Copyright (C) 2011 Citrix Systems, Inc.
> + */
> +#ifndef __XEN_FDT_KERNEL_H__
> +#define __XEN_FDT_KERNEL_H__
> +
> +#include <xen/bootfdt.h>
> +#include <xen/device_tree.h>
> +#include <xen/types.h>
> +
> +#if __has_include(<asm/kernel.h>)
> +#   include <asm/kernel.h>
> +#endif
> +
> +struct kernel_info {
> +    struct domain *d;
> +
> +    void *fdt; /* flat device tree */
> +    paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
> +    struct meminfo mem;
> +#ifdef CONFIG_STATIC_SHM
> +    struct shared_meminfo shm_mem;
> +#endif
> +
> +    /* kernel entry point */
> +    paddr_t entry;
> +
> +    /* grant table region */
> +    paddr_t gnttab_start;
> +    paddr_t gnttab_size;
> +
> +    /* boot blob load addresses */
> +    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
> +    const char* cmdline;
> +    paddr_t dtb_paddr;
> +    paddr_t initrd_paddr;
> +
> +    /* Enable uart emulation */
> +    bool vuart;
> +
> +    /* Enable/Disable PV drivers interfaces */
> +    uint16_t dom0less_feature;
> +
> +    /* Interrupt controller phandle */
> +    uint32_t phandle_intc;
> +
> +    /* loader to use for this kernel */
> +    void (*load)(struct kernel_info *info);
> +
> +    /* loader specific state */
> +    union {
> +        struct {
> +            paddr_t kernel_addr;
> +            paddr_t len;
> +#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
> +            paddr_t text_offset; /* 64-bit Image only */
> +#endif
> +            paddr_t start; /* Must be 0 for 64-bit Image */
> +        } zimage;
> +    };
> +
> +#if __has_include(<asm/kernel.h>)
> +    struct arch_kernel_info arch;
> +#endif
> +};
> +
> +static inline struct membanks *kernel_info_get_mem(struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->mem.common, struct membanks, common);
> +}
> +
> +static inline const struct membanks *
> +kernel_info_get_mem_const(const struct kernel_info *kinfo)
> +{
> +    return container_of(&kinfo->mem.common, const struct membanks, common);
> +}
> +
> +#ifndef KERNEL_INFO_SHM_MEM_INIT
> +
> +#ifdef CONFIG_STATIC_SHM
> +#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
> +#else
> +#define KERNEL_INFO_SHM_MEM_INIT
> +#endif
> +
> +#endif /* KERNEL_INFO_SHM_MEM_INIT */
> +
> +#ifndef KERNEL_INFO_INIT
> +
> +#define KERNEL_INFO_INIT                        \
> +{                                               \
> +    .mem.common.max_banks = NR_MEM_BANKS,       \
> +    KERNEL_INFO_SHM_MEM_INIT                    \
> +}
> +
> +#endif /* KERNEL_INFO_INIT */
> +
> +/*
> + * Probe the kernel to detemine its type and select a loader.
> + *
> + * Sets in info:
> + *  ->type
Arm specific information in generic comment.

~Michal


