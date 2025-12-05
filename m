Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E1CA7933
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178922.1502587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRV0J-0006AF-VE; Fri, 05 Dec 2025 12:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178922.1502587; Fri, 05 Dec 2025 12:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRV0J-00068F-Rl; Fri, 05 Dec 2025 12:33:43 +0000
Received: by outflank-mailman (input) for mailman id 1178922;
 Fri, 05 Dec 2025 12:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRV0I-000687-Ti
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:33:42 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0411cd7-d1d6-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:33:40 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SN7PR03MB7155.namprd03.prod.outlook.com (2603:10b6:806:359::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 12:33:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 12:33:37 +0000
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
X-Inumbo-ID: a0411cd7-d1d6-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1gdWVkr7y03L5m0zbdAEIvwSmR8uM0tl0V3RGJ5h3pZrtMAk5mCIfMXbgxqyntckySboZO4nHgQAKFUBHTuN8zbi5DJfGcM05OW0Zk1heBTNY0WY4Hk+WsR7vh+vKmlwuQofkU//s2amlRucj33C+SZfrVJM3SgUyDAuq52KzgKo6/QHXKUFX36PZ+IFJ5ouW7T/T2lohxFNptFBfwsunXOIUOtxDlF53HspEhcGFr/wZi/3GgQnDo+QdqCiOfGIA6h4jajO64k64YluutjwkOnCgqNXOGFQv3DBtkYrbTrQ2wXa66TNcE32BVf1OKrE9Yg1394LKm/lFnYly1OBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3SIHF7hkLn08NTe2Npjo74PY4waU3gsUQ9r2fAufkI=;
 b=iagZakRl6FqZoJSESW7kW/mmsDppwh0H6xJOkG9ki6lcF2YuRPVoNipwWh7PqA3yW0TI0kJ48VxrC33qvzFlpa5If3hYDQuvHtksftSYD7ZZ69YPiZwn3Du71F0zpH2B9yf+w9UDpWZTwVg/OqZ3JVwJ03t3t3l37rc3ETU/ktpj5ukSPf6UVZl9NYwIFIE4nFj76ca0jqaiEDZMe8Z70x9dt48MLjoEefwuFd16DuQK6M0x6Kil/eT4SUBRMB72250RTg95L9TocTMOLidATkXNEUw6RLoNh3rlv3pftjuZt8LfyPl+LfR8IFxNOoG0qc4i/pM2F6EYgU+pepsalA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3SIHF7hkLn08NTe2Npjo74PY4waU3gsUQ9r2fAufkI=;
 b=KYkq+bO5DYuMwqh/UwKtjr23boe85cabT0mHDw5xRNINsfQ38ufpFpiCTJR0/uUxXZMwaf00r+VfTlB44qhd1HM7x54w/Egp0/4IbwmU+Bsu20mIOxcgbAyEyJflePVzQc/5WJGqpgwSq/ArQgpqCIGkGSJ1Iihxnxwascyw1Yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <50ff35c6-5da2-4c6f-94b2-025440ee618f@citrix.com>
Date: Fri, 5 Dec 2025 12:33:32 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v9 10/10] x86emul: support AVX512-BMM
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <732d56d9-d200-410e-8b52-48c5e25bcf5c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <732d56d9-d200-410e-8b52-48c5e25bcf5c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SN7PR03MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: f18b5471-bef8-42a3-77ef-08de33fa8220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZG5ickFmc3pNNHRCUVFGTG11eE1rMklHZS9VUVd0dnVRdy9WamprdWVZcVZJ?=
 =?utf-8?B?dzlPdEllbUpBdGhoMEx1MEZsSjJUMFRqUzFwUzJKU0l2Y0RNNVRyaWdhaWpH?=
 =?utf-8?B?dnRhYkZIWEFuRFFyd2MvQjFFVnJCOVhhTE1IYjBWTzRBbHN0VnRaOXZ2R3hR?=
 =?utf-8?B?a1Q0ZTRESURlYzZReU15eE9qRDVSUXlRMnAyWEVFRVNhbTAxMUJVSm9zRVlG?=
 =?utf-8?B?NFEyRi8rVy9WT3JNZXh6bExxdFM5TEM0M3ZwMS9lTnRpVHBSUkdQVFBsM0dY?=
 =?utf-8?B?UFU1N0I2ejkzODJJVnpJcG5SSS9ZU1NmQlR5S0J0VFdVN01vK3BOeFIyR2Vn?=
 =?utf-8?B?VmEyc3hZTmNzb2VlOUpEMWQ4dXhrT0VsS1BRcXVkTGh2YWJudDA2ejlFRmVV?=
 =?utf-8?B?bWI0MHJqVlliT2h4b1hwTmt4YkVuR2wxUTBZeS8vZFdsVUltOVdqMkRKMG9x?=
 =?utf-8?B?VXdHMUR3bGVZaFBBSlpHWnJDeVBqdU8wa0ZKSjREenVON0l3bGx6OUdsRTVH?=
 =?utf-8?B?bG85Y2dETnV1YnNOSnk5dzJISThiY3czM0R3Nmh1WERVUWJFbndQYUYvNU9v?=
 =?utf-8?B?ZEorZENUS1FKTXFKMVkvWGhTUXNEWXBZMjVSZStabEI2Z1lCYkFBcW1SdHFu?=
 =?utf-8?B?c1ZKZ09RenN4SjVLRUgwQXAzVFkzcUhBc2syQ3o4bHV1VjkwTTM3T1BzTi9j?=
 =?utf-8?B?aXBiOGY0ZldnRDRwT1NYWWxPRVIyaWUyTm12NHlnZVVBOEpxMFBQV05UMFdE?=
 =?utf-8?B?OG5YaGJrRTIxZjZmWnZlZzZkQ1BUbURxaDR4T3JtTzFGZnZaUHgva1pkTTA0?=
 =?utf-8?B?ZXo4WiswZkJFaG41My9oZEhYZlVRR2I5WCt2UU5BYlRiL0RaeERiak4yUUpJ?=
 =?utf-8?B?aGlvdC9xNW9yVUE2VDF4dVJCYWtjV05jbzVxaXZkZFBiMGFtQ21XSERIekhx?=
 =?utf-8?B?aW52NjRCSmFORWN4VkFCMThtcDBtdjdOWDBqRFlCcG40cHRqcUgwSEJUS0Y4?=
 =?utf-8?B?aEEvRmFtTEF3Q2s0VEhiVXJNUnRrUTlyT0VGVllWdzRMRnhwRHllYUtDV2pk?=
 =?utf-8?B?djU4ZHk1YStNbS9qV21vRkRlK3IyMW1weTBtdVFVSDFtSVJPY3JLYUdDbHRY?=
 =?utf-8?B?bWhsTUFBa004KzhZQVpBcDRESDJJeG9lZldObVg2V0E5bHNNNVFDV2pxUkQr?=
 =?utf-8?B?Y2RwY21XS2Y0elRuUkliVldSbFpUTkRubnVjYWhtRnBwUzdNbGJ4SVI1Vnoy?=
 =?utf-8?B?NGFMQmxOdzZ5bkhrT0RrWWcxNmtmcUpRUzdSUE5QbTgySHNLRDEybjJrSm1j?=
 =?utf-8?B?SG95ZWtLNWMxTTkxMU5WbHIzVkRxSi9vYzZadnNoaDROMmhQNGlhTWZTMnJy?=
 =?utf-8?B?YjQ1UGszU1RiNVA4Zi8ySTRVM3lxb2NpL0tlaUg4bTE4eVAvN092WW9hNXNT?=
 =?utf-8?B?emN5ZzVVNkRsUzVSK1pRUVA1SkpYRVRweXFzeW9vUWx5dkZDOFB6bUlJQjha?=
 =?utf-8?B?VkNNUUlGUk1DTUticU1GRHFCa0U1QnRUb1dJM1pMd096bkQ0NXZDOG85cWhE?=
 =?utf-8?B?dlQraXNyaTMyNnZJczVPWXBLZzc3VEI4Qyt5b3RwZlVaQnlwWTJtSFp2aXdu?=
 =?utf-8?B?YzZuSmRiVWVzRnNHMUl1YnpBV3hlekppMCtPTTlZc09pUEdUa0huV3R1QSs3?=
 =?utf-8?B?WE1LNlZ3RUkrdklWY3VRUEtNeHZPL1N3MlFaTnFUUG8wTGUrSzFwRitRMi9V?=
 =?utf-8?B?dFZZTnhmR0tuemg3YU5CSHFmRmQvSURHN1p1ajBnMUwrS0NETjl6aWE3UzZi?=
 =?utf-8?B?K05nRUx5b3d2OUljLzdWSzBickd2Z3RDdXFqQ1JPaHl5NFZJSDNUdlNiTklL?=
 =?utf-8?B?UnFUdDFncmNRekhseTdyNm9PRnBzRzFKTnd3OFJNeWhRVjNLRjIyRW4zTEFI?=
 =?utf-8?Q?qwqiF24Qa9FcK0L0xVmRUfYjAKUS9ytD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZqQU5KTWppUFliVytveW1mWkdHMWhUZzJWZVFyOHBSRXg5ZmRiYVV6L0tv?=
 =?utf-8?B?T1hFT3ZZK0dUOUcvZCtaSzM5akM1azl5ODdUdC83VlN0TmJuNVJJcTdHeURZ?=
 =?utf-8?B?NDFubTE2NDFldnhOSlBGNGR6Ny9uUDFab1RKaHRId243ZWZHRzV5VjRneUJ4?=
 =?utf-8?B?YlpwblpXSUlFUHVoNlhiQzhGWlBkTzhZSkRNZE5rbkhKZ29rVFprZjhTWjlM?=
 =?utf-8?B?QXh5VmpqKytrOHczWlZjckRuQXpqR0M1N1JRUmpwZ0ZNUm44MkU3L2VMejdj?=
 =?utf-8?B?ajZ2Z3pIMEZGNlQ1R1E3c2UzSGpYWmJzUXgxMjg3ckF3dHkvM0kxZmlkemY2?=
 =?utf-8?B?bURkaVdZZGlPblgzRStvT3o1K1VRWE9CNHRPWU9UaEhZSUNlT1VjSUdBelMv?=
 =?utf-8?B?Sm56OVpxU0dzS1JJMHQweXJqelAyMXpHbU5qZE5SSDVhWHJreCtpUmNRZStS?=
 =?utf-8?B?cUdXVjRuMDAvVVYwenZYdG5sdURzYVRjWnhvclpiMEpuWGNidi8rMURnblUw?=
 =?utf-8?B?cDNIeFZheWMwWTRMbW9KbHMyVUh5eUtFUjEvaGtRYjFmbFh5L3RHdTY4OGRk?=
 =?utf-8?B?WjVLcFlDQ2tBYm9BSkdjUC94UG5pUTJyaFlNMW41amJMNitJT0s3VUJ4b3M1?=
 =?utf-8?B?anFiS1Z2WlAxendrdk0yWXZ5MnVxUGFoUlZqUld3Uk9FNXZLRjZLVFlpMHUz?=
 =?utf-8?B?Y2VzSzh2SWxsMzRNQ3YvV1Z1TDRITlBkb295MW96QjBlaTc5TXpGNmkwM1BO?=
 =?utf-8?B?WmY3cXJEMjluWENNa1MwRkRZYUdtTGNGbW4xaG9hZWhXZUF0RU5FcUhkVzJk?=
 =?utf-8?B?dTZ4UU5SVG1JNVNpVjhraFpQa0tnNUYyZDMwWGdvaFBMcFhyRThKWWNxUmxX?=
 =?utf-8?B?eGsyN1c5NHZsbS9yN1FmcS9ZQ1I5S05SOGpkdFptWDlVL2dIUVE5bW90empC?=
 =?utf-8?B?UGxhYmJla1laVTF3MFIzTVVkZjIvMzFydjN2STcvMkxabnV3YmtqSUFJYlRC?=
 =?utf-8?B?azVzb1dVdDVrcmxOWk1qdFVWb21EbTR4dFBOWFo2eUpRT290VnkvY0dUcUhH?=
 =?utf-8?B?UlZpSVhNR3VlUkRzejFTSk8wNlBZRFdoTzBWMy9rRHVib2tRMTZ5RUVFM0Yz?=
 =?utf-8?B?b1h1K3ppdHl5a1V0d2JnMXgrQjFOUCswOE9VRTdnRkFvQXJHdFlYYW1VamZ2?=
 =?utf-8?B?ZXVNa0RtNW53VzBkVFV2KzNpUk9lZFBKODhCczFuZEUvNjVSdkhxWDFDeVpB?=
 =?utf-8?B?RHBLRTl1cG9NcHYxL29ISGNUZlBjcklxQWhsYU9CQUEwMzZ5cmwvdkN2bWdW?=
 =?utf-8?B?VlFIMHdwNHBTbDJ0NTZMRURjRXlrcmkwOHRIM2oyTHMwZGNwSnBBa1F5aW9u?=
 =?utf-8?B?QnJpZXd1eDN0MU1GdkZHcjd2cGJ1dFRzMXVRN0lYV3RIR2lzVGp4Ym9rMlNj?=
 =?utf-8?B?cVBXU1NzUW0yUGFYU1pnb01KV0k3V1dFL1lTZ1RmYTZSNFlSMG0ySjdmRjFW?=
 =?utf-8?B?ZTFnZ1F1MXMvVlBwclFMRlQyamJBTjVYZy81RlNwQmludzBuZThTa0g1aDlI?=
 =?utf-8?B?MHc5OWpWRHlNTUViekhUWXFYSGxsVWtmR2ZYNkswZXlLK1NRcWthdGs0d1Uv?=
 =?utf-8?B?ZVliVHJuWU51aHVKc1djRGJEWTd4cDZERzV4UUJicnB1Q3RESGR1Tjd5bkJw?=
 =?utf-8?B?bG05eGpnZFR1WCtHcGVmMU1DL1B4U0VOWE1CUk0wUngzbkpGUDJrRmlsOUVK?=
 =?utf-8?B?V1E5R3B1Y3duSW1JSzNTQUF0ZVV2SVVGKzdLMWdBVis0OExyQ2hNSzJ4ajkv?=
 =?utf-8?B?UDNNQWdhUG5UdCt5bEZLVEVlQURKaTArbUxHVUhvMnFxUVcrYnY3T2JNRVky?=
 =?utf-8?B?UmJ2NFFQR0NBTllWY05mMHAxSDRUaW9vTjgxYVBvcmRUWXdCeks2SW51MWZY?=
 =?utf-8?B?cExBQVAxRklZelVQMlExSkdDR0dzY3EvMkhuOHRFMzBkRHhBNDJVV01hVEd4?=
 =?utf-8?B?U3RRdVdpeWc3MGNmNXcvOEtIbVVlRWlvQ0dmMVpDRFVoWWZxTEMrU2hYWkFh?=
 =?utf-8?B?TWx3TWhFM1JZY3hkd0RML0FVT2J2ZFcrUm9QL2tzVmZDWVlyUkxhTkhuaUp0?=
 =?utf-8?B?NHNZcEI2djJxU0xobGlyWmdxMjV6T1Rlc2gzbUlJR3FiaUZMUFh1UFFZczk1?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18b5471-bef8-42a3-77ef-08de33fa8220
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:33:37.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tte1ydCGJgnU9HaQe3jJIUIuvfejfTmRQmEEPcjPKTKZYrvN+m+W54tfyDC4zwBXNCauqn+2siM+podjdYO1thubKvxaUZQ0+rwR7Y8Ep/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7155

On 24/11/2025 3:02 pm, Jan Beulich wrote:
> EVEX.W meaning is unusual for VBMAC{,X}OR16x16x16, but that needs taking
> care of only in the test harness.
>
> Like already proposed in "x86emul: support AVX10.1", use just
> vcpu_must_have(), not host_and_vcpu_must_have().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The Disp8Shift settings are guesswork; the binutils submission bogusly(?)
> suggests no scaling at all.
>
> No idea how to test this without having access to capable hardware. AMD,
> to my knowledge, offers no equivalent to Intel's SDE.

I'm not aware of anything equivalent for AMD.

IIRC, the binutils thread says Zen6 for these instructions?  I'm still
trying to get access myself.  No ETA yet.

Very tentatively Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Given that .W is wonky for these instructions, I wouldn't quite so
easily rule out other wonkyness.

Would the test harness pick that up?  Not AFAICT.

~Andrew

