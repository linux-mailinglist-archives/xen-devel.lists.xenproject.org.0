Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4CAA927B
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 13:56:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976060.1363313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBuRE-0005bg-1h; Mon, 05 May 2025 11:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976060.1363313; Mon, 05 May 2025 11:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBuRD-0005aC-Un; Mon, 05 May 2025 11:56:47 +0000
Received: by outflank-mailman (input) for mailman id 976060;
 Mon, 05 May 2025 11:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VAKQ=XV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uBuRC-0005AW-V6
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 11:56:47 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035634b8-29a8-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 13:56:44 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB6869.namprd12.prod.outlook.com (2603:10b6:806:25d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 11:56:40 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 11:56:40 +0000
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
X-Inumbo-ID: 035634b8-29a8-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IF0e0sxKMPiBo6SBQcbKUmDGKPsA/qIKiVVj69bQr4ZeG+e2kJU7nU5W58qJxeGxGXn3kWXMxEG6P5XUvTBciIXtlvPbOB1Mpk5EY66sBGVDPZsvgteQM99D1bA86tFdvpYTMYDVoHhhnlplWcQSH5UBKOkbmTXZlQ+15y+TLZnYfCiOGpcjxBKAFOB1wG83wK3JueBP9yQklCBpR0CqaEYyCcyG7RuBpmIJ9OxOBMUYsmtw5qmCZLurReZ+tt2HesNdS9sp7sp5Bfmu954kv9wpzY+lHayoWN6CwxmPsli69RWVi5kUfxGxODv1JfRE67l8oHtQNQVRWWpfmUCzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gdyd1A7VaCsDKtBqZm7s0KOI1JJTWCPGPRXkE6vmliU=;
 b=jM+xpHtUM8nCs9s/+W0RJLFFqX/6OhBLU03Ge+Wze+sn3OUH4R6cr7dDZCBPa2F/3izX+qKgkMsx73Vs+3j0bz50H4B42jHumSZsDzMzY/qL0Z1iuNhGzVSe7U/O2A3FyNPdJlGXoh/H/o0NbbXm033BHZSx0u3gplPhK0+t4Q7hYQwhDyf7GtRToTH0V7qf53sUZowpLPOhbLKAYV/QWA2t3Tks1lphA1yrrltC9Dc3gWZtswImKhmZXqC7UkAi5iPUveqdDgZ94NXXqw6+TgPAWkN2Hnk7/scNR4kQvNemtira+jrM4R0VYCVG6U7penWl92i0AFuw+0sm7eQewA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gdyd1A7VaCsDKtBqZm7s0KOI1JJTWCPGPRXkE6vmliU=;
 b=m2x7qFCPE4L8sLkHY7YQUAaKcIwDph5u4TYDNJpRIpndKpjm2EFrupXCCUh8gtYISYm7NasKSt+Odmsg8lUquvltJYFMk/jwNP7KMmAre858lgK+3ndpMzaNtq2YzXLf8mPD9eofoDvkJ4I2bSy4EfFegoyq585IbHjlYwjl9jU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e42080c1-495c-406d-b1a3-8af2db8fb22d@amd.com>
Date: Mon, 5 May 2025 13:56:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] arm/mpu: Provide access to the MPU region from the
 C code
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-5-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250429152057.2380536-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: caba65c2-20df-48a4-0f50-08dd8bcbe5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3Q4VkFyc3RLOGJ0S2lCaEdQWkpNN3dBb0lBcEtWc2dzYTlzUy91MlVBdU5U?=
 =?utf-8?B?Q2hCVm4xNVdnMnJCWjI1YkFEQVlrbC80cWhPTHFXVjZMeElMTUJtcSthMkJ0?=
 =?utf-8?B?cFpuUExWOVVBMms2NkJTZ0R2bVFXTmg3dkE2Tk1HQ1UrVTNqdnhCUzBkMGJY?=
 =?utf-8?B?TEVEazd3VWZCbkdrQXkzdzdTYmRvYWVFcGcyckxRSlhVdFJnc3FJS1B1RSsw?=
 =?utf-8?B?ZVl6NXFRcnhROGY2aGg3LzE5Y09ubGxuZ2J2ZlA4OTBwRVJJM1hZaHBrL0gy?=
 =?utf-8?B?TGRGeVA4eWk0THRNeFpVVFZ2aFdNMTRrTzVjdTlORlZwYUZIaWp1aWFEc3pZ?=
 =?utf-8?B?bmkrNE5QZEY1QXZ1eUhXNXUwV0hnaFdoeHdXRlRJVFVQeG9IVEpQdUh3Vkly?=
 =?utf-8?B?VjFRRnB0VUd3NFU4SHNjNFI2YSs3Tnh0aXEwaHp1YUJXakVidU9qNGlyTUxU?=
 =?utf-8?B?U3B2NjRNVzhOc0lNSEsxMUhaODZqeFFuRnZFSW0xQTZzVHU5TGd2YUh6VmZi?=
 =?utf-8?B?d2VFVkZLNWJUd1Vvc1JrYWQ1Skg2cmJ5SEZncDFYWTkxSXNveVN4Vk9SU0FN?=
 =?utf-8?B?c1ZVa29TaGRES21DenVYTDNNbCtmSlAvSU43K2RWYk01OVhObjIzYTh1R0FP?=
 =?utf-8?B?bVhETWc1ZHZyRWY2WUhVendiWlNXRXR2OEswa3ZvWms5RlZPblM5SmdYbEgr?=
 =?utf-8?B?WHBrczJBa0FlUy9LMWdneUJtWDZCYjdFOFZoSEFvVjFaZWZtSnFkTE9ybTVv?=
 =?utf-8?B?ZG1IUnRjd1RqaFZnYnh3eHNDK0Z3bEFsK0VLVHZ1N3hGNDhObG1UVHJIeHRa?=
 =?utf-8?B?aUtlT1VKVnpmZ3ZuRmgybWdnSlp5K1MwczNveHFNeEsxTGlLTFNhTi9rNUNh?=
 =?utf-8?B?QTJ5NDYrbjYzYjhTOHBaK0k0QzVEb2pVM0dDVi9GQUt4NFk5K25NeHpJYTBw?=
 =?utf-8?B?dXA2ZmhuYW4wTk05cDZQTFUzRlp3RGJuOVFySEdyNFo5M3UrbUdpZlVyWmRO?=
 =?utf-8?B?RjE5QThXYUlkWUFkbjNZbENFdjRaQk5uSzl1RngvZG1rNTl6QXN6YlAxSVZF?=
 =?utf-8?B?OEkzU0RUc3BvWktrVC84enRrNGRkVVFHL3pkWitLOUw1NU12OXRGWURmNlVV?=
 =?utf-8?B?R2R0ZXFZcEVoT0dhZW0zMjhvVmtRMVVtbTFhMVBQZnM0Y3ZmOUlKbjJkVG9O?=
 =?utf-8?B?ZkFvUE9HSHdMREFmZXc4UDZ1ejk2V1FCUHMzaXJZS0FISFZWYUQzbHB5a3Er?=
 =?utf-8?B?SmVHMHQxWDhJZUFZMU1uMlpYbS9JdHI0ZHNaMWhvTUZ4b1REbTArU0pVRHlS?=
 =?utf-8?B?RDFVS3ZPQXFmTlpoc3ZtT0pYNmw3U0VwQ0tTeXVVQ1FmRDVVakI5bnRYa2ps?=
 =?utf-8?B?NFprNHRDTGQ0MW5ocGFPNVk2QlFmNU1EMjkzc3ZZWTkyWFo4OWZOMWkydXd6?=
 =?utf-8?B?VHcwZDVFRGgxbWtmNzFMWEZST3BJT2lUcFQ5YjRUZjRFbWJha1pzcG5PcW8x?=
 =?utf-8?B?VEhWNG9zaE1KczcrcXBmUy9FV3dkc0VnYU53L3hlY1g4cXl2MFlkM0VJWDlh?=
 =?utf-8?B?K3Z1Ry9QNUppRGRsaGZwZGQvWlVTRGlYdkFUU2ZnNTFCaGhHTzFjZHhmY1h0?=
 =?utf-8?B?MVJ2N1NnRkZBSnlXY2NkWUt0NFZ2OVcrbTBQdUpybUhxNW1LWFZ4TGtadVZv?=
 =?utf-8?B?dzY4NzFVTzJ4NUxVRG1hemg4SDlKOXRsZmJhRWxPS1grYnpYM2JZVFc1ZUow?=
 =?utf-8?B?LzJsWDBjKzNUVXNiOFJpMnBWL0R2bW4rY1owaFl4WTNod1BFN253cWw2S1BM?=
 =?utf-8?B?RzNYVGVMS3VUdVZybG9VNjVHWkhuRWdMemphWXRabmdrNzV3MTdaSUVuODJQ?=
 =?utf-8?B?NFFDNndPeHdwUytDQmppTEJra0dvRUhiaExNTGNNUFJGNi94bVhaV1VXWGJ1?=
 =?utf-8?Q?TiOOA0ze60A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmxpWGJrTXFKVUhCY1lhODBLUFFCN3NHRHI4M1d2ckF5Rm9sZU44dFJLQjRC?=
 =?utf-8?B?TEZ0V05EaG5UQXF4dE0vc0ltdzdtTEN2TWhNWFEwK3QxSVZZRkQxT1dMR2tW?=
 =?utf-8?B?VFRXSE42SUJUNlljSldPRFZ0S0JyU2JmczhXbGxGQm1EZEE1QXlUekk5RUN2?=
 =?utf-8?B?N1VmQ29HUG43K28vRE44ZzR6U3dtS0xZajRaaHBhWGIraFdhS0RlNzI5OVJK?=
 =?utf-8?B?R3NLSzdhcnpnNDdMOWVBR3NtdFlDbVk1VFM0WmRIT0p0WTlidGhWN0FhczlC?=
 =?utf-8?B?ZlNxZXZsT29hVUpDQzg1OFNXcDdxSnllN1ExOEJCR3FYaTlXcy8veU5IcjJV?=
 =?utf-8?B?M3NaT2lXclBnV2Rhbkl4bnJXQ0hjcmw3azA2OWxYRndpRG10Rmt6ZGpGVkNF?=
 =?utf-8?B?MzkzQ3NUcDZtemRpTTRUaFpWbDNxT0hwRS9PS1UwU0JMbHVXTnFWSjhxNkxn?=
 =?utf-8?B?NzhTUktSZGIvb2lQRzBrdm1aSlQ0ZldyVTNNdGJ2TkpTSU1tMHBwc1NZc0k3?=
 =?utf-8?B?aC9KRjJQellWMGdiRE41VG9ySGZXNlVNMm1IMXB4bE5RZWxCNXVDSkNVQVFP?=
 =?utf-8?B?aDJla20rNWYrUEN1clBXK01XVTBTTm5sSW5ZaTFwV3MyNitORnFaWmhVN3JP?=
 =?utf-8?B?aE1jTEVOSExTWjlOQkg3SXF6UW53TWdvK3dIWjVXWVhPZlJQK2NrcEFMZzBE?=
 =?utf-8?B?VWFZOGk0VWNlV1ZqdEZycmo3azMya2g2RjVQTnpNRDF5Zk0xQmxyN3RQRFF1?=
 =?utf-8?B?eHQ0bkx1SXdFQ2tKUm0vdGpvMzFNUzQvN3owcUMxOERtQWdqTGtNN1M3OFJ4?=
 =?utf-8?B?TFc3VWFWcEQ2dHdEakdLZ3VxYXdLSFZKbng4WG4xbGZDdWcxbWp3dzNhOEM1?=
 =?utf-8?B?SHVRMlRwQjkyclN2TzVwalBLdEpnLzNNK1krSXN4dU5GeTdITjJuL1dRdUMw?=
 =?utf-8?B?bWNGYytnenhGek1JYTNMN09xNU00L2s2TktkNms3TWxBSnk0ZWhwNGJFWGVW?=
 =?utf-8?B?SWpTSVdBWExkNVYwcjMySC8zMWVXdDkxaEJqQU03WUtJbStCZWEwS2U2Zldt?=
 =?utf-8?B?R0pyU294MFNKWEl3bHkvT0dESVBHMWh5RlM0NGRTNFlyY1RrQWxCdEVUZTlx?=
 =?utf-8?B?eENrSWY4KzMvWk9RVFFaOS9YaXZselBsNlhJQWZDa2R5SFZEUTJUMlU5Mmdo?=
 =?utf-8?B?SUx1UHBLRWFUb2tyVitkM0doMUpjaHpHUVFIdndnbWxvbkNTZnJrczMrSHhF?=
 =?utf-8?B?N2N3dmdKcUdQNmFENjhieWMwZzFQNG9RcGt2TkF6ak5lU1VFaWl3SGh6c2ZX?=
 =?utf-8?B?bEx3SEdmSDBFN0plRkFCc09HaFdPZXNRVEZNN3U5d1c1ODJqcmhkUnlqZXdU?=
 =?utf-8?B?MnVEZTYzVzYvRVUyZWVkUTRzRndsKy8wckF5L3pnbTZvNWh0Y0RDakFaR1Az?=
 =?utf-8?B?ZENERHdDME05d3Q3RVRPMkFQSndmaWFyR2szSGlLQXJOL2VQelN5MzJZbGxa?=
 =?utf-8?B?Mnp4N0NNUnlTRFJLUVhKbW1SOXROQmhKclpLYlY1SEUzYkFuaVdUalFuVDEv?=
 =?utf-8?B?VlQyUmloc1JyOE1zMFZRYk5nRVllSkhlbDdBRUlVSi9Yb3ZzLzJKZm1zWmtO?=
 =?utf-8?B?WlJGdGNJMGx4TFF4bGM2U2RGMU9VR3F0ZmV1cW16Z3FNT04xV2E3ODdXTFhU?=
 =?utf-8?B?YUJOSXVvM3ZLdEE0N2VWc2RsNVo2cmR2L25OUDBpVHNocGlJK2dYTGMrUGFI?=
 =?utf-8?B?N1RjNG5GWWNpZW5HQVRnQUdtRWJKUHpCZm1LeklDUm1qYjhCMFp5TjRkZ0JO?=
 =?utf-8?B?VzFQMDROTTh1MEZ6QklmckNqTTZHdjk4TUJ5R25TV1U1R1p4eGI5QlVhbnhw?=
 =?utf-8?B?S1lmaXFBZTlUZlNKQzBlei96UGlnRUt5RlFYQzNyM0E2NGJuQm04aGhOYnJU?=
 =?utf-8?B?alo4NXYyN3VUQk96VHVjNzIrb2wvYWQ5cExaUTZEMDNQeEZQbXNvL0J6QnZx?=
 =?utf-8?B?R285dTZNWU5vMmx4TWFzZGVjRmwrNUFZUTVsbU1zWjRPbXJrQ3RCamlJYVR0?=
 =?utf-8?B?QldnZC9JL0xoNDhXdHRrMTY0L3NTMWtDYXdNT2t4bnZBTnU0U2lldUFQTEx4?=
 =?utf-8?Q?oDaU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caba65c2-20df-48a4-0f50-08dd8bcbe5c2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 11:56:40.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+X5u/+7NtQB181h9QnXqRMb+rPQmvAvNCcShO/q5h83A1JmijSArTI06w3fnQL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6869



On 29/04/2025 17:20, Luca Fancellu wrote:
> Implement some utility function in order to access the MPU regions
s/function/functions/

> from the C world.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>  - moved back PRBAR0_EL2/PRLAR0_EL2 to mm.c and protect
>    them with CONFIG_ARM_64, changed comments, fixed typos and code
>    style
>  - Add PRBAR_EL2_(n) definition, to be overriden by Arm32
>  - protect prepare_selector, read_protection_region,
>    write_protection_region by Arm64 to ensure compilation on both
>    arm32 and arm64, Arm32 will modify that later while introducing
>    the arm32 bits.
> v3 changes:
>  - Moved PRBAR0_EL2/PRLAR0_EL2 to arm64 specific
>  - Modified prepare_selector() to be easily made a NOP
>    for Arm32, which can address up to 32 region without
>    changing selector and it is also its maximum amount
>    of MPU regions.
> ---
> ---
>  xen/arch/arm/include/asm/mpu.h    |   1 +
>  xen/arch/arm/include/asm/mpu/mm.h |  34 +++++++++
>  xen/arch/arm/mpu/mm.c             | 117 ++++++++++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 1368b2eb990f..40a86140b6cc 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -17,6 +17,7 @@
>  #define MPU_REGION_SHIFT  6
>  #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>  #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> +#define MPU_REGION_RES0   (0xFFFFULL << 48)
This does not look like a common macro. It's arm64 specific.
Also, it looks like you use it in macros that are common too.

>  
>  #define NUM_MPU_REGIONS_SHIFT   8
>  #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 28339259c458..e2235e568e81 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -41,6 +41,40 @@ static inline struct page_info *virt_to_page(const void *v)
>      return mfn_to_page(mfn);
>  }
>  
> +/* Utility function to be used whenever MPU regions are modified */
> +static inline void context_sync_mpu(void)
> +{
> +    /*
> +     * ARM DDI 0600B.a, C1.7.1
> +     * Writes to MPU registers are only guaranteed to be visible following a
> +     * Context synchronization event and DSB operation.
> +     */
> +    dsb(sy);
> +    isb();
> +}
> +
> +/*
> + * The following API requires context_sync_mpu() after being used to modify MPU
> + * regions:
> + *  - write_protection_region
> + */
> +
> +/*
> + * Reads the MPU region with index 'sel' from the HW.
If you use @foo style, you should use @sel here.
But IMO this comment does not bring any usefulness.
The name of the helper and parameter description is enough.

> + *
> + * @pr_read: mpu protection region returned by read op.
> + * @sel: mpu protection region selector
> + */
> +extern void read_protection_region(pr_t *pr_read, uint8_t sel);
> +
> +/*
> + * Writes the MPU region with index 'sel' to the HW.
> + *
> + * @pr_write: const mpu protection region passed through write op.
No need to say const in parameter description

> + * @sel: mpu protection region selector
Same here.

> + */
> +extern void write_protection_region(const pr_t *pr_write, uint8_t sel);
> +
>  #endif /* __ARM_MPU_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 9eab09ff2044..40ccf99adc94 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -8,6 +8,8 @@
>  #include <xen/sizes.h>
>  #include <xen/types.h>
>  #include <asm/mpu.h>
> +#include <asm/mpu/mm.h>
> +#include <asm/sysregs.h>
>  
>  struct page_info *frame_table;
>  
> @@ -26,6 +28,35 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
>  /* EL2 Xen MPU memory region mapping table. */
>  pr_t __section(".data.page_aligned") xen_mpumap[MAX_MPU_REGION_NR];
>  
> +#ifdef CONFIG_ARM_64
> +/*
> + * The following are needed for the case generators GENERATE_WRITE_PR_REG_CASE
It's read a bit odd. Perhaps remove 'generators' word and use 'cases:'

> + * and GENERATE_READ_PR_REG_CASE with num==0
> + */
> +#define PRBAR0_EL2 PRBAR_EL2
> +#define PRLAR0_EL2 PRLAR_EL2
> +
> +#define PRBAR_EL2_(n)   PRBAR##n##_EL2
> +#define PRLAR_EL2_(n)   PRLAR##n##_EL2
> +
> +#endif
> +
> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
> +    case num:                                                               \
> +    {                                                                       \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
> +        break;                                                              \
> +    }
> +
> +#define GENERATE_READ_PR_REG_CASE(num, pr)                      \
> +    case num:                                                   \
> +    {                                                           \
> +        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));          \
> +        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));          \
> +        break;                                                  \
> +    }
> +
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> @@ -36,6 +67,92 @@ static void __init __maybe_unused build_assertions(void)
>      BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>  }
>  
> +#ifdef CONFIG_ARM_64
> +/*
> + * Armv8-R supports direct access and indirect access to the MPU regions through
> + * registers, indirect access involves changing the MPU region selector, issuing
s/registers,/registers:/ and perhaps use bullet points

> + * an isb barrier and accessing the selected region through specific registers;
> + * instead direct access involves accessing specific registers that points to
> + * a specific MPU region, without changing the selector (in some cases) and
What do you mean by "in some cases"?

> + * issuing barriers because of that.
> + * For Arm64 the PR{B,L}AR_ELx (for n=0) and PR{B,L}AR<n>_ELx, n=1..15, are used
If for n==0 you used (), why not following the same style for 1..15?
It all improves readability of such long comments.

> + * for the direct access to the regions selected by PRSELR_EL2.REGION<7:4>:n, so
> + * 16 regions can be directly access when the selector is multiple of 16, giving
s/access/accessed/
s/is multiple/is a multiple/

> + * access to all the supported memory regions.
> + */
> +static void prepare_selector(uint8_t *sel)
> +{
> +    uint8_t cur_sel = *sel;
> +
> +    /*
> +     * {read,write}_protection_region works using the direct access to the 0..15
> +     * regions, so in order to save the isb() overhead, change the PRSELR_EL2
> +     * only when needed, so when the upper 4 bits of the selector will change.
> +     */
> +    cur_sel &= 0xF0U;
> +    if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
> +    {
> +        WRITE_SYSREG(cur_sel, PRSELR_EL2);
> +        isb();
> +    }
> +    *sel = *sel & 0xFU;
> +}
> +
> +void read_protection_region(pr_t *pr_read, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_READ_PR_REG_CASE(0, pr_read);
> +        GENERATE_READ_PR_REG_CASE(1, pr_read);
> +        GENERATE_READ_PR_REG_CASE(2, pr_read);
> +        GENERATE_READ_PR_REG_CASE(3, pr_read);
> +        GENERATE_READ_PR_REG_CASE(4, pr_read);
> +        GENERATE_READ_PR_REG_CASE(5, pr_read);
> +        GENERATE_READ_PR_REG_CASE(6, pr_read);
> +        GENERATE_READ_PR_REG_CASE(7, pr_read);
> +        GENERATE_READ_PR_REG_CASE(8, pr_read);
> +        GENERATE_READ_PR_REG_CASE(9, pr_read);
> +        GENERATE_READ_PR_REG_CASE(10, pr_read);
> +        GENERATE_READ_PR_REG_CASE(11, pr_read);
> +        GENERATE_READ_PR_REG_CASE(12, pr_read);
> +        GENERATE_READ_PR_REG_CASE(13, pr_read);
> +        GENERATE_READ_PR_REG_CASE(14, pr_read);
> +        GENERATE_READ_PR_REG_CASE(15, pr_read);
> +    default:
> +        BUG(); /* Can't happen */
> +    }
> +}
> +
> +void write_protection_region(const pr_t *pr_write, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> +    default:
> +        BUG(); /* Can't happen */
> +    }
> +}
> +#endif
> +
>  void __init setup_mm(void)
>  {
>      BUG_ON("unimplemented");

~Michal


