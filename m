Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A41BA3615
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 12:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131427.1470521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v25qX-0006FA-K1; Fri, 26 Sep 2025 10:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131427.1470521; Fri, 26 Sep 2025 10:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v25qX-0006CU-GD; Fri, 26 Sep 2025 10:38:37 +0000
Received: by outflank-mailman (input) for mailman id 1131427;
 Fri, 26 Sep 2025 10:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehmb=4F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v25qV-0006CO-T4
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 10:38:36 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f39657bc-9ac4-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 12:38:34 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DB8PR03MB6313.eurprd03.prod.outlook.com (2603:10a6:10:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 10:38:31 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:38:31 +0000
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
X-Inumbo-ID: f39657bc-9ac4-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXZgIU/6tpieYzlmdtbfFCPxXa/9uz+32e1Q1JM5cN3FtzgqxM+l4ZYO55KvK8msY0fTdj7GUlp7P2cMHTIPF1Bxd/WC6vve7FdtpKNRhwsMH3ivgUFv7k+SBlKLtjAfNecJwHSdSJmYEQmLMGUVOqtDk3wCW5Lb4vJ+0JckMwson6gJh7SHmDqAlujsSIzXtXrUEaVvFcJS1UxgL+5GHkOiwVzOmt9fM8Rx7jEzVvc+1Da0LNDrpczwbFTeQskXtSANjqpwSLwiauPQdCIqyE4LXXsBLycZ8Rcitw0zs/MYmKPZANyeUydOuzJLPdZpZp9aiRWImLd1IjMJeVlk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pUm2+0UDQ2Drkum0xrdaLQRYNpNgjevFFTyg4o/+N0=;
 b=BJk3xAMmuQD8/dc9r+Bc8/YOUUjyvNGCMkJN7ufyfqQwg/fJhu9e+0yFXB4pgE5sBrf8Mrk4QDhq68QhHosrlgUpg4NuOsNet+Zq/tUCtA8JL2rYHO5J4qLEMdYL9TlJGJ6QXhtMnA8TBg4r36V693TRN/8yQdHMObgiLvDkIyiGXfipktUPbaiy2N6ryMBTnOsQIEBxA/6w0x3MI5zD9ojKoaZ4SLXX6WGCt9Vjlhk+SHnnT5DhQU8M/1FBNuWZRokA4MNKRe8QkihJztOrJYRxGyTxBrpwEt27LVKFm5u1v0SDydlXUfP/086+S/1gEZ0kgbyeLDhY0AfgIsLdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pUm2+0UDQ2Drkum0xrdaLQRYNpNgjevFFTyg4o/+N0=;
 b=B59dsIwz3zX7dE3TLfqgjP6XKi+Mlh9JYxUSxJF6iECepQDkjXgeNnJRJ8ObPzkQzNUO8GBTnmSg8YHyFuaPuJxH9UaYWOjK7AY+8WMSqX9LQy4NzLUVXQcdM6tTVvI5SMotLOFod41J+KdbxsMBskgTPkatJGQ7KGikcoJWO0qQvBCb+rXgyfiLYY/cALyb+/oPWhH4diG4e+zMCv3q7aDol0xHSGRpqAOh0YZGTK46LzxTylFfeQl/BmtWdoTSJz0hCEyxxi7Uko8n33YmPCKiibEB2Nea127v1doDZgbL4v552ObwprgF89R584NgckqfkSM/QLrluyxS6YcwHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f6354369-80fa-409d-98ef-d0d67c823807@epam.com>
Date: Fri, 26 Sep 2025 13:38:30 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: vlapic: fix RO bits emulation in LVTx regs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250925195558.519568-1-grygorii_strashko@epam.com>
 <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a90600d2-a6aa-43be-8977-6d407ef7bb06@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DB8PR03MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa834b5-3b0c-4df6-eea9-08ddfce8d649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHEwR0VoaWsrU0RQZDBzdkw0SHQwRzF1MEhZMDBaTFNtSDhnc05DVDJuZzFn?=
 =?utf-8?B?RVVDL0l5bmRpb3VkYlJzd25vRFJCeWVDVVZCT3RESXhPQW50bVJnc0tSSjlB?=
 =?utf-8?B?S0JNZHRoaTNBY0RDZ0haTzVOcEdVQlBuY2xoVU1XSFV6MklOVk8rYlhKcEw3?=
 =?utf-8?B?TlR1R1NmVXdLZ0UwbGkxK3paSGtTR3ZnUkhVZjlaaWZVNzZXN092VVZNZExt?=
 =?utf-8?B?ZW5ab2EvY2c5b2tSdHlYNHBSMU54aGZXMVVSS3RZVkV6ZHpJWnNCbnJvQWRZ?=
 =?utf-8?B?QktHWXdla2FrWWhrNytwZ2YxSFNZU2k4TWt5MFdybkRsTEcwRzdJRmV4SDA5?=
 =?utf-8?B?OFQ1Mkl4aWhpSWxOOW81bWJLTS9vQnZ0dnJVem9yTkpQdFYxYlNLclkvZW1V?=
 =?utf-8?B?SFNualJJOEY4MTZsd3lqbFR2SkNEVGJzVHFIS1hzNFFEYU5HY1FYOFZVWmMy?=
 =?utf-8?B?SnJpVHJpZG04MUdSYW9keDBmRTBwd3labzQvRnlHR2MyalhFSWYyck9HcnFC?=
 =?utf-8?B?R0JEMStBWVlKMFV6aFFyYTVnT0lEYndqTzZXcVpHUm42U1FFd0d5NGl2Nmth?=
 =?utf-8?B?amgwYUZHTHVIUXhYNlpkT2lETWZaV25JOWpiY2UrM1VQak1VZi90UFhlajAy?=
 =?utf-8?B?VWhOcXNwUmV6dW9CZ1A3NTJZek9NRzVVZi9XampVY2dvaEZwNHNXeFllaGxi?=
 =?utf-8?B?NFpDRVFjMExyMjVtQ0c5dUtqSm1RVXRxeFMyWXlkTU9EWU4yZDlLdlpGemlJ?=
 =?utf-8?B?djRDejc0SXppMUM5TzlVTTh5WUx4WElZN0ZwYXhxQ280eG5UbU9XTHVRWVNB?=
 =?utf-8?B?VEtVR0VjY0wycW1ESENCMFZ4TmZRNjMzdkJmTnNaaFFEY3hhQkd6NnlwQVN6?=
 =?utf-8?B?NW5aS1YwVVV3bGNoUzJ2bXlrZSt6UDh1di9PMGtPU3dka05vcEJmaVNFYXla?=
 =?utf-8?B?MFJRbENGOWM2K1N4bXZpbloyNTY0WW5DeEVpL1pBdXo0K1JlZ1lwSlgwMUMy?=
 =?utf-8?B?cXZlOG5MZHYzYzVVc203K2lIZmc4WlJwMU9sZXZJRGdyR1ZKL2d0R20wU3hw?=
 =?utf-8?B?aGd5eWVoaVA3dkdXemZDajhGNUNCQThCUHJvbHc2R3NYREllT21HN2svOGVE?=
 =?utf-8?B?ZEh4TUlKZDRGOFpSZDVjVzMyOTRpZWhUVWZ6WmlyWUl5SWcxcXBWUDluV0pP?=
 =?utf-8?B?MDVhaVo4VEpxN0EwTTRFYzN3aHc0d1hZbUt6WC9tWnNteThSMVJUNExmaldX?=
 =?utf-8?B?aTcvZ0U0RGE4U2QzR1RDOUZ6M2NaK3pQUDVtcTk5YXhJWk5lcFd4dG15VE9m?=
 =?utf-8?B?MEViWjZZakRlem5zMzVtMEhuWnFuaTBjYTAwQUpITUF2OG14NENqZWgrNEVi?=
 =?utf-8?B?ZDdWWm5NZUt1L2JvdHp0bEtoZmlyd20vaHB0b2tCMjlFejNmc0FNQjcyaUVF?=
 =?utf-8?B?NmsxVHBaRlBiK1RqWS9mRlNDa0ZGNzVKZGZxa2dXY1ZGN1lrRWdVTjlSekY2?=
 =?utf-8?B?U0ZnM1JMMlFWblp4anM1NG9wZUcwU0NMdHNET1V2cGJSUjY0czlLOXVoVVZQ?=
 =?utf-8?B?SDVzdktMaEQ2NC9YdWVoYmo5K1RRU2FuRTZPYnpRZlBYdGJDK0JqbnQxVkRj?=
 =?utf-8?B?anl4K1VubExTQTNaTzdYRE5RSTBvN0xPUTJxM0FEZXRXTGx4YW1EZlhtR2hS?=
 =?utf-8?B?bHNaemhNM2hPT05XVW04bDVoRi9TWjdqWEFhZlQrZWdmK2luTkxtSVJHbmkv?=
 =?utf-8?B?Vng2anFDMjE5SnJrZ3EvNnAzZ0hEcVd0WGpMOTNIZlVGYytrdk8zK1Zsem10?=
 =?utf-8?B?NG1JN2Z6dTVaRkt6UlJUdW8zUEszR2tNVjVHNTd1NDVYQit5bDNPcksrakFn?=
 =?utf-8?B?VzBzcXpZVTVKOGNSdU40YnJXUk03Y211SEcveTZYZzNrSW54MG9iQ2U4aE5x?=
 =?utf-8?Q?e6Xl9W7H+S0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCs2cmYrbTcrRzdIWll3bm5QSUxBaU9YRzhyenltN2gwWVlXTTdlRENUMHJt?=
 =?utf-8?B?bHk1L0dEOHZUanpJbGd1Q0tHVmJxVVlwNDl6eHBYYkNHTEYxVUQ5ZXJPMk5I?=
 =?utf-8?B?bVd2WU01QUpEcC82VzJMNWxRaWpRUk9wVU00ZklUWWtpTjFmVFA2cmIrYm8r?=
 =?utf-8?B?ZTlUNURnMmd0cWFBaXo0ZXAxMnBIVVZ4S29IM010QjlGVkpHNkQ1MTVGNklS?=
 =?utf-8?B?NnlxdkNXVlFhVHhtZ3hvVXdmQzJ3NG01anNyY2hkK0tmVjRWTFJSSGQxL2dh?=
 =?utf-8?B?L1VyMnNCSXdXRWhUOGNsT08xSEk0eDNma2VxY3lqeUhkSnF0eStlREdjT0gy?=
 =?utf-8?B?VUE5NWNqTGxqbzBXTmtBcXFIdEt2akkxSkQvcXk3VUcrNllQY1c2YXZmRmls?=
 =?utf-8?B?K0EwQkk3dytsNVNvL1JOOUhXVksyMFRRVWF3VC9oQjJhaFAzc0FwVTlxVXFV?=
 =?utf-8?B?UysxMVBFci8yOVM4cGh1TTZaYTZMTk8va08wU2JoSnJpbTlaVzRzZ1JQN2tZ?=
 =?utf-8?B?L2pLOHR2SlJUWTJXcTBVQnhoZ2ZUSVF4eWt6aTZWb1JNZHdETmJORERBbEti?=
 =?utf-8?B?cThDOXM0OFZoWHRhZ2oydnRPSFZhWXZjWDRjeEVWZnpOT1VaTlNIbFJtVGJr?=
 =?utf-8?B?Vlk2N3RFL3NnUVhyd01sVTJuNzlBcWYwWGhqZGI3c2g3YlZUS2pPVHlXaWhs?=
 =?utf-8?B?T084Q01tTW9tZGNEUExvcnNXcDhFYTR6VXMzQWZES3NVTkcrbWxKbWdYS1p6?=
 =?utf-8?B?ejBIN0VrUHhwelNnRE5nQkVIWVpjNVN6UVU2cDZ4Y0M5R3NFL21GN1hsQkZq?=
 =?utf-8?B?WUdwbllmb2NHOGRwS1hIdlByUmVNR3M0cW5HR01VdUpFdWxoQUxTY0dheG5R?=
 =?utf-8?B?TXI1VVFSYUxxaXhiYlk3UllvSk5DOEpsbXRFZk0rVk5xeFg4TzNUSDhBNUho?=
 =?utf-8?B?VlBUSEE5bHpWOUR0d3FrdGlQR21JbHpzVHBIMmtwSmZsWUJsSVB5L3VTSUFJ?=
 =?utf-8?B?ZzZXTk5wS0RkNmFoYzJFQnY1U2VyK2RHcUlmR1pvVEdIWGdMZDFOTkZiamZB?=
 =?utf-8?B?RTArbmpkWG0rYXJ0QnV5RkRzdVllNjlKNXlLd3JLSHhqaXQwNFgzTzZ6VGlp?=
 =?utf-8?B?U3pGeU9rUG5md1NUWDlTTVpEMWM4R3FXMmZLT21pWHk2U1IzRCt5bDZrTzQv?=
 =?utf-8?B?NFkzRVBzc0NnOHpVWERWemRCRXpYSFptTU1aeThNSldRUHNTQ1liYURJUXZv?=
 =?utf-8?B?L1dwUWF0Rko5bFlkMjQycHZGa1JMdlUzTW5YZldBTWRkRDl1aVlFeG96djdB?=
 =?utf-8?B?Nnp0ZjAzcEZxUFdPdjBPeTJCK3RwTEhLdDhPZ1piQXAzOHVvU1RoQzBOTTda?=
 =?utf-8?B?dnlRb0xYUUlpb05Ecmc0WjYwTW40T1JteVVVWFFEbFRma0FOMVNkZ3c3dGRo?=
 =?utf-8?B?VXlQK3gyNlBCcjNDNlhCazhRSjhmM3F4Q1JPQ0NEa3paNTl5S0djSTJDNXVY?=
 =?utf-8?B?VjBydkJtSDgwTW5NemlWRmpHNjJhWWplOG13LzM2aW0xcGZYdVp4eWtkaUZz?=
 =?utf-8?B?VnVCU1JhTW56SkdTQUtxT1dmR0dlK0FSRDRTc21nbnFzbTI2ZWl5OUxrZFhQ?=
 =?utf-8?B?SUpwM3Z5ejZXa0ViV21YaXJLMWJKd2JOcExNT01CMmdsc09IbDE1NXlsV0Q3?=
 =?utf-8?B?cUhua3Z1UG5Gdzd6M0NWa0w0VmsvYzN0SjU1MldlWVNKazBqZEJMVGRQMUJR?=
 =?utf-8?B?RDNEZW11bFFiR2pKUE9jVmoxZU81cDZKQlUvb2hUWk5YdU9MSEJ4dFo3U1dL?=
 =?utf-8?B?UmZUNnBYNGwrdXBreTRPSW5IbTVjOUplMGd4em94ZWpCVld0bWMxd1pXLzVX?=
 =?utf-8?B?NjRJcFBoWEI4ckNaS2p0bEJ3akl2aEZnUmNrK3BWQXVtV092aldqWm50dEQx?=
 =?utf-8?B?QTd5V3d2OW0zc3M1c3lHbGxLV1ZlWEdQUk5sbFU1VHQzeExCL3NZK2tYMTFK?=
 =?utf-8?B?K2xWZERKRW5yMDBrMFBLaXBucUlza2ZrdW42MkNSdnpnNXJFb3lsOEtMRW1a?=
 =?utf-8?B?bTRWditZTWFJVk1DZ2xEMDJ3ZkxaZGEyYS9iSDdkQTZVaFZvNHJiU0VpMDQy?=
 =?utf-8?B?aHNzdUdlYjNBQ0ZYOUJGVk5uQlhOMEswbGw4bHVuRWt2dHBYUlRZTmg1SkRZ?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa834b5-3b0c-4df6-eea9-08ddfce8d649
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:38:31.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoqkFaOWqehuJoUtmTZer7J6bqs1YwpAjYmPE0U8+jGwgP2JZVMKMpOr2JRjwOdA0TSDHC8x/3buX7hszE0kpNjZ6vearm4Um/Qhv73bJdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6313



On 26.09.25 11:17, Jan Beulich wrote:
> On 25.09.2025 21:55, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The LAPIC LVTx registers have two RO bits:
>> - all: Delivery Status (DS) bit 12
>> - LINT0/LINT1: Remote IRR Flag (RIR) bit 14.
>>    This bit is reserved for other LVTx regs with RAZ/WI access type (MMIO), while
>>    WRMSR (guest_wrmsr_x2apic()) has appropiate checks for reserved bits
>>    (MBZ access type).
> 
> Question is what the behavior is for writing the r/o (but not reserved) bits.
> I wasn't able to find any statement in the SDM.

Me too. Usually RO/WI on most HW.
For example, LAPIC MMIO "Write" will be ignored (WRMSR will trigger exception).

> 
>> and the current vLAPIC implementations allows guest to write to these RO bits.
>>
>> The Delivery Status (DS) is not emulated by Xen - there is no IRQ msg bus, and
>> the IRQ is:
>> - or accepted at destination and appears as pending
>>    (vLAPIC Interrupt Request Register (IRR))
>> - or get rejected immediately.
>>
>> The Remote IRR Flag (RIR) behavior emulation is not implemented for LINT0/LINT1
>> in Xen for now.
>>
>> Hence it is definitely wrong to allow guest to write to LVTx regs RO bits,
>> fix it by unconditionally cleaning up those bits in vlapic_reg_write().
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Please also add a Fixes: tag when correcting code.

This is veeery old code. Probably
f7c8af3a6476e ("[XEN] HVM: Clean up and simplify vlapic device-model code")
or
50b3cef2eecb0 ("[HVM] Place all APIC registers into one page in native format.")

> 
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -880,6 +880,7 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
>>           if ( vlapic_sw_disabled(vlapic) )
>>               val |= APIC_LVT_MASKED;
>>           val &= array_access_nospec(vlapic_lvt_mask, (reg - APIC_LVTT) >> 4);
>> +        val &= ~(APIC_LVT_REMOTE_IRR | APIC_SEND_PENDING);
> 
> There shouldn't be a 2nd &= here; what needs adding should imo be added to
> (really: removed from) vlapic_lvt_mask[].

I'll try it.

  (Orthogonal to this I wonder whether
> guest_wrmsr_x2apic() wouldn't better use that array, too.)

WRMSR checks for MBZ. RO bits are not MBZ, so masks are different.

> 
> While looking at this, don't we have an issue with CMCI as well?

I see no APIC_CMCI write emulation. only read.

> guest_{rd,wr}msr_x2apic() handle it, but vlapic_reg_write() doesn't. I.e. on
> AMD we would fail to deliver #GP when the guest accesses it, while on Intel
> we would lose the value written. And we also don't set its mask bit in
> vlapic_do_init(). I guess I need to make a patch ...

Is'n it depends on CMCI capability exposing to guest? (have no idea what's CMCI :)

-- 
Best regards,
-grygorii


