Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0CADE43A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 09:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018852.1395729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmsV-0006Pt-L1; Wed, 18 Jun 2025 07:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018852.1395729; Wed, 18 Jun 2025 07:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmsV-0006Ox-Hq; Wed, 18 Jun 2025 07:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1018852;
 Wed, 18 Jun 2025 07:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KBI4=ZB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uRmsT-0004wT-OW
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 07:06:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20606.outbound.protection.outlook.com
 [2a01:111:f403:2408::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c32f36da-4c12-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 09:06:32 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 07:06:27 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:06:27 +0000
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
X-Inumbo-ID: c32f36da-4c12-11f0-a30a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYirddU3zYB2S8rVr0eEm1t8NR/DrQjiRzWx9xFhnqW7AkyG7D4Jeyfeo7TQV1jOemLV7CTYkQcUpLfvVTfdeMzQhvIyHtq3rthgo2mtYzRxPA35z4vvvhCREcKsEGa68h+Z0Pq9l4hXhIlxhJjd7oZ9l0R6UJCB6W+aoWSJbiRO1lLsKQ5BAe9VA18a9COVrwblIos8daSJLre+gotkHva6bJrgc0bK8HaVXzNnNFyYyA5JzdzT2y5n+Tos+k2++Fa0ZiMlIFqsIVwiEES7m/6zrIqnwMQigPordxC9dC9Q+peViwpVPiHEfGaSCnzsRAbKwfu4oV+l1agptlbBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml9P/qbE0KF6UxVD6+jSSpsdZqlyn0DrI+ve2Nni0zI=;
 b=j4Twjztr2dd9BNDe/zXvFkqkLHLDdTzNwsNtodyEUlDJGGfOi3ctFmgtMSGdKrxtr0b7H/xDnmm90Ab9kYQIv/i6inWeeoyvNTK15lB45c9sLzp8L20zmebdJHUD7l7/AjMEgjuCHr8L5MeLvD8uj8Lh7l2exZVyKopKP+bkXomk8UslWgl2olJgR7BLxs7qkHumEnVn0edO6/99JcqV4PqhIoCjSXwUEnfq0/+VjwWShUGoLZAmVvQGjas2fuu+xANFtI4H92wVi/m1O3QKiOH9t2zFkrvmbA1zGOoEj2n/Gipq/XeyRmjNSByGIw5W4P+V66Z9hRzKIj0eBiJADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml9P/qbE0KF6UxVD6+jSSpsdZqlyn0DrI+ve2Nni0zI=;
 b=sPj0j7d4JprIhm0HBhjgyquRrpvRSgNPlFEZnC5zTrAoSdiTZvLWC4072uh57thrxn2MpU/gYtNELdDK8nzEuekR7VLzoRx6ubbCQcDW3UNE+zQZ/KY62lnYq+04ZE/We96JSXDKX8mllrZVs+nmtDdOjBKQEMnFLZ9JVK7REnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <a1b59e2d-0b18-406f-86e9-1b2a737a58e9@amd.com>
Date: Wed, 18 Jun 2025 09:06:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt: Remove loop in dt_read_number()
To: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250617171358.670642-1-agarciav@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250617171358.670642-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: a05efdd3-c5d4-4b1f-65e1-08ddae36a4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXBkYzd0cm1KcDBJNGZueFJwL3doTnFuZ01sQ2RaMkl0MXBnRHZaUmtXcGtk?=
 =?utf-8?B?RHQ4d3NkcXFQYW01Z1luTGE4aDVEQk9QZnNnS3dNV0xkQ1M5RlI5R2lhcUxm?=
 =?utf-8?B?MG50Sm0vNGdWQUZCK2VNSmhSRnNjZHRIMU9MZnNhamxtUWxKV2Y4NUlvUDRI?=
 =?utf-8?B?MGg0L0NJVGthRWE2YlBmYXhSQWR3OUk5UU5uSStXbTQ1U3JSZ3pwSC9pMXF0?=
 =?utf-8?B?YUFHVU5KNXU0NHlpODV5dGt6dkp5TEd4MlpjVnBtV3o4bGl1RlZ0QnhUQ2dp?=
 =?utf-8?B?TCtFZ3FKQmR4YmExMU56YTBIM2VmTE1ya09Bd05UanhNRmw4NFZMMXBIZlF3?=
 =?utf-8?B?WnBiRzNGMHNET1gzSTlGeDBFUWM1T2hDa1p0TFJoODJuTU5JcjZobmNpa3pn?=
 =?utf-8?B?azVnOHlTKzFoZFAyYno4dWx2OXlCenhOVXRJT3J0eExBeTdFUEZqVElGT05m?=
 =?utf-8?B?SDNXb0Uxd3JEa2h6NzVuMHdweThWMjNIT05PN1ZTeXlWSTh4MVNXdHJZUllq?=
 =?utf-8?B?cFdrQ1IvU2FYOTdhZEJxL3RybnpkckpSdHFiVDZXM3V2T3FEUllDd3hQZVBY?=
 =?utf-8?B?MHhBdDgxdjZibHhtMXQ3YkxCMDZsZXZTUE9JUUxoQjFEaUk4QXRPOUxwZHhR?=
 =?utf-8?B?Z0lTOWQzejhvdUhaZ3hkUFZ2RjRKOVYrRmFhVVN6RlFUWVlLejRQRFlaTVBQ?=
 =?utf-8?B?czFQc2ZSVExPOEQ0TS9zdDJIRi9MeVRubENJRE9SLzhxazV3QjNybkZCVGF5?=
 =?utf-8?B?VVYzQSt3dWJkazNnekVGZU1sbzlmcmJvSnc5YlczZUx3Szd5aGlMQWc5ejE2?=
 =?utf-8?B?NFRENDNoVjBtNHo2cVRmS1JjOTZ5RVJ4YzlJZVNpYi8yTlJhV0lCYkljeE42?=
 =?utf-8?B?bHdHS25tNVdYV3FMODlTTW5lbnpUWXdWbVRGRmJnWThyWDBpRks0SGNIZHBW?=
 =?utf-8?B?dXpJZXpxK3pncitrRmlzVkdtd3FnaHkwUkp3aTVlRlVhMGtXQlFEd2kxRzNk?=
 =?utf-8?B?ZE9UQzlkaUVCLzMzdjFWK1JFL0cvQXJ6eWlJcERES08wSHkwUXJBQzMyUHV2?=
 =?utf-8?B?SGlGS0REYzVTWnFTMlJXS1lGV2x0aWNkeCtZanIycitKK1g2RWlwL2s0alJq?=
 =?utf-8?B?YW44by9aQU55eTdJK3ZYTEhRcEZsQkhsYWtsUFhjaWpxWks2Sm1keGhBN3M2?=
 =?utf-8?B?b1ppTndyZVM5Q3RKUTI2S25ja0JzS2R2bHJsZncvdEJjejZtTHcxbHJmcnBE?=
 =?utf-8?B?a1BRZHJuY2VuMS9WVFZNWlFkc0xkREdFWlpNbDlSdTdqenpHZXcvK1p0SS9x?=
 =?utf-8?B?ODRSVUEvWUxtbjhMZnNEZEFSQzROYkkwNFJ4cTBWVFpnbmRlTU1OeTE4Q0xD?=
 =?utf-8?B?NXlONGsyS2hDMVgyNjNUQmxCckJ3d3pJdEE5eUN5NE1zbUF2aFJiWjA0RDEv?=
 =?utf-8?B?T1lHbXVXWHNkcTdubTdxOEdRUStITDNBcWxrREFoNmxpTlAwTVVYOHliV3dE?=
 =?utf-8?B?Qnd3UXRidHMrMVNSREZnNGVhaEkwQ2FySCszVnJ5TFAyUTJTdVhPb2ZKMlo3?=
 =?utf-8?B?Zi8ra0s1RUlDdk0xbHdVY09RYXVSVXNhYUk1cEVmRjNUK2JNQWtkMjRYOVhp?=
 =?utf-8?B?VVNMU3FMbEc4RUNmekJKYnB4Qk9YRnBxcGU1Y3VlK01ua3YwOUQ3bTB1dW5B?=
 =?utf-8?B?MEQ2bzl4ZTRBcCthOEc1elJFOFRCemQxK2JOYW9qUzY3SDBGV3hpVXpVaFVJ?=
 =?utf-8?B?ZUlwQUNwTTJyUU9QellLenFzbmNVSDFvSEtVS041Z3lzNUJ5bVlzWWcyU0da?=
 =?utf-8?B?WVhzQjFJc2wrbVV3RmxIVGV4K2dMVVE5N2VzODdyaUxuRS9yYnB3dXE2NmxP?=
 =?utf-8?B?YXlBNUN4R1hVMzFQRDRDRjZrUmo4Y0pObWpndUEzOTFzcUJlWDA4YzYvdjZU?=
 =?utf-8?Q?htYpMYSCMtA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlJON0xNMjZRK2RrNG9Rbnc5RDdacmlzZ0JBbjVtY28veFlIemsxMi9PTUhL?=
 =?utf-8?B?N2FoQW4ralBCazZjd3J6eVNaaUFpRmZSSXc2ZEtXT3RDcmxnaC9GR25yTEVs?=
 =?utf-8?B?QXRubFhNMFAxQ1o3Q3Z0Tmtpd3JJQUtGZWsycDZiQ3ZWVkROZTJvS0x1eU1K?=
 =?utf-8?B?Q09KYTlaVHVuR2h1a1IxazhPS3VMbUhQRjZMNjVadVk3cERnakpmdXBhR2Ji?=
 =?utf-8?B?NFlzWHg5MXNaZkUxb1U0SWJMUG1uVmUwZWNHWE9rN1dFOGd6dkVJTzZBWjFV?=
 =?utf-8?B?blA2cWNndlh6NkNUTlh1c2tyM2M5MWw1Z1NrUE5qVmdKL0dhYmVHN1d0anY4?=
 =?utf-8?B?K1dhcmNXaHVrdEVQODhyNnNnTjNITC9pVTdLRGQzdkhUdXRXYnFJRmQwYTVn?=
 =?utf-8?B?QzFJb2R4cFBUaFM3aUp2M1lRVEdyWW9nemk5dGZHTm5wTlVhc0ZWWW4zTEZB?=
 =?utf-8?B?bW10VTZlS0hzSnpaczJOOWZMVXYvNDh4TXB1bFlINjNQWDVONkpZMEhQZFF2?=
 =?utf-8?B?VEdKMlNLM3hxVk91MW54MHFxMDhJTy9zblFDTWdYa0tTMGhVNWdZM053M0Ny?=
 =?utf-8?B?TXJ0YWJFbTlXZlJwVkthYmdLSWtmSnkvb21oUnNnbGhUOGdwK3pmaWRQbkl4?=
 =?utf-8?B?ejlHaGFINGRaaXhXY3poMFAwQkdIWW15RU56OU5QY3QwRW5qcUFyU0lBQWx4?=
 =?utf-8?B?dk5Va3QrQStOTVZVbkZmaTZyejNLNzJCWmd2ZkgyZG5zMDBWdnRObXNPclNU?=
 =?utf-8?B?d0RnOHVva1VCVnpEMWpNN2VkQTl2VjdHQkJCeEY2bjI5MHB1TGM2SWZlc0RX?=
 =?utf-8?B?OGJaN25KY2p5R2NvM1F2cmIwNUN1cEh3NUtsOGIrYWlBcFQ3c0FkUDVlZ1lk?=
 =?utf-8?B?SWxyVk9zcWlGTWxHbEg4VVZJaXJBRXFzbHorOS9OcGZKT0lleE1oY1hIbkhT?=
 =?utf-8?B?ZXZyTDB6YU4rRW5Kay92Wjk3ZEkyTWFKU3BYbzAvaHBzTXprb2dmWEUzYXUv?=
 =?utf-8?B?ZTdSM0kzMW0yNm1DU3VHSEwrMzJwSFN4eUVzU2NNWFgxZk1GYzV1akVia2g1?=
 =?utf-8?B?Y0JMNmdhdzdpaE52elFSckh2KzR4MGpjSVF1TG80VExaNjcrbXJUaXZkK3hi?=
 =?utf-8?B?ZDVTVCtpWmdXZzd5bXIvVU9FMkl4ODJncExjVDV2a0NBVEZsWCtEK1RneDd1?=
 =?utf-8?B?d1NPQWFGT2o2cWFHcE4xWllBSnJRWHFYTFJjVnY2bm41d2hPamdpY2VOU3lO?=
 =?utf-8?B?dFNiZjA2eG02VkpTODN3Qyt3aVdQQVRGa3g0cUUybWNEamIvQ24zYmloQzhj?=
 =?utf-8?B?U2FZVXhJMjd3S2lVdjRLUEdLQjR5MHNGYnMvWE5BL3dTcGpvYlpVdUNjL1dM?=
 =?utf-8?B?RUVKeE9PdktFTVdNYS9ZQXp5VGNRRE81K0NyTFliR3dZSTNNcHAyU2lvNCtn?=
 =?utf-8?B?L3RiSm01cEtwVlh6UVpvTGZqWmxWSTlzcUZxN1ZHMTY0ZkZUTDV6MThFb3Qz?=
 =?utf-8?B?aGlCdXR6N2RydlZFZ09vOG5TR2RITjRlbWVsejlic1gzaUxtNEt3LzhyaTRs?=
 =?utf-8?B?WVN0UDRsU2Voc3hIRVI4c0JxQnJKaWNoaXluRnhSb2RLUkRwWDJnbWVHa25Y?=
 =?utf-8?B?UitTN3lIbjFjcWtTSFJveSt2QXNMSENKaStRQmowZ0FmcTFQTjFjZ1d0KzlJ?=
 =?utf-8?B?dHNhVHRVREd6WEI4K09YQ1JTOUJLNmZYMS9hQU1Xb0NZVTMzOTJGbjJycm1j?=
 =?utf-8?B?cmVBR2VNcXJQSjJwWGllVmJlMEp6L3JZTzF0MlVUTG5XVHpQNHFEUi9XU3lG?=
 =?utf-8?B?RXM3ZTMvQ0o0bEVva1lmUFZXRUU2NGIvOXVzOS9GRFRWUTY4UkpjbHAwcFJX?=
 =?utf-8?B?cnE1NVM2eExtRFhBYnBTTWE5L2l2U3NVeC9NU01PbzhkYmpoNi9KUUlCQUFD?=
 =?utf-8?B?VnpxWHlMZ3lWeU1ubEJseTN5dWhWV1JBaGo5MmsrSDhJM0xNRVVTQlJWOFBN?=
 =?utf-8?B?THhyNlBuUy9WV3VKcmNSMUU3aSt1VmZkQ2ozM2xVem9acnZPUkhBemZtTkdx?=
 =?utf-8?B?aVRES0drRWNCL1NOUjNMZmRLVUZvYzRLWCtLS0ZkaUcxYTZWVmtnVGFIYUIx?=
 =?utf-8?Q?F7QU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05efdd3-c5d4-4b1f-65e1-08ddae36a4ab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:06:27.2378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCm00JynhUirwizwXeddPIGnVS/6M1VbiIvvZHX3+YYGUUzobIsn0beawrL1qckx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839



On 17/06/2025 19:13, Alejandro Vallejo wrote:
> The DT spec declares only two number types for a property: u32 and u64,
> as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
> with a switch statement. Default to a size of 1 cell in the nonsensical
> size case, with a warning printed on the Xen console.
> 
> Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> v2:
>   * Added missing `break` on the `case 2:` branch and added ASSERT_UNREACHABLE() to the deafult path
> ---
>  xen/include/xen/device_tree.h | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 75017e4266..2ec668b94a 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,21 @@ void intc_dt_preinit(void);
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)
>  {
> -    u64 r = 0;
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +        break;
> +    default:
> +        // Nonsensical size. default to 1.
I wonder why there are so many examples of device trees in Linux with
#address-cells = <3>? Also, libfdt defines FDT_MAX_NCELLS as 4 with comment:
"maximum value for #address-cells and #size-cells" but I guess it follows the
IEE1275 standard and DT spec "is loosely related" to it.

~Michal


