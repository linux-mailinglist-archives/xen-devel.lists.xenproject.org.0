Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F70AF1113
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030850.1404520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuJs-0007yU-7v; Wed, 02 Jul 2025 10:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030850.1404520; Wed, 02 Jul 2025 10:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuJs-0007x0-54; Wed, 02 Jul 2025 10:04:00 +0000
Received: by outflank-mailman (input) for mailman id 1030850;
 Wed, 02 Jul 2025 10:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HY8L=ZP=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uWuJq-0007wu-WB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:03:59 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:2418::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de61bf45-572b-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:03:57 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 10:03:54 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 10:03:54 +0000
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
X-Inumbo-ID: de61bf45-572b-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sxh0tmLQJUlAn9I1JNs4roo0UXoWCjpNrZXUZVhc9/3ZzAjfZeedCypSNWE7oai//ma6wYWB4cnHYwXoBhvf5pwc89DY3QjHBtD6FtHLJecg3nkNncz0UqaZWWlKIcs3XoiCJC6lr+tAAf1rualqID3SmIle4LOZKTdrdybBr4qLjKQ3fRXz/JBJ/dAEqa9my204vkD6tGHEO3CelyYHpP0ENO1/DvaXF33+Mu6uTa19TesvIF/A+Xxo/eSZgt5c8BVt+vjUwxaObHcZUcyNjfrg9x62FlmZ9rpLQ8F1AvkHPrOBjB/8RPcQUyuhswcQ7HSsXI6DE/t9vka3Nqr/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7BZj2j6hsne7824DNTf+YpUiLMoQcv9np7k4QccvlM=;
 b=nDvOoN7dQpLhGfR3FcfRMjHZOIivWOekFJaMmcMx94U+poVyNpWEu34sQLWQladCWjrCjUnkS+e66O4xamppqrLaOFdS47AUTNEzVGVYG5ZMLdnohcJY0xeWaGNnkkf/JHc1BI9LMAXafbhbedGCLozPgIVOAbKEHivXenOHKYPIA98pwyaIGdMbIOuZzBAnCCgLPndSDAUaGuUUc3LJ/Mk1C2D9q3ZTlIaxtiqtitIaVM7J1gVLeRtYJjYtMmUfIzbQ/Z+BkcIW59+gj+7gVzGEvA7X03sgH3f28EA1SyEtHeLtbHDQRbkC2bvewjAIrVWtuSHR6XjywY6ZG9ez+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7BZj2j6hsne7824DNTf+YpUiLMoQcv9np7k4QccvlM=;
 b=G7lqPyq0HVJTRZznmGryqjzwgt8TviyHlc6hnnf44jWJ4PmikE1Gl3ZENTwxTfqgN14x6ifHVP4iFGSIsrN7BKyO7U5hGgcM5mfsLcruMu6n/GSiMROIIloLeOICgeRvb8MT191fCsJ6pJLFG9YwLLtOFus0g5+YxVw2ynAWqm8=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver
 for cpufreq scaling
Thread-Index: AQHbzuRFzooSbGuOOkWtJb1ZJ/MIx7QGEZYAgBiv97CAABFLAA==
Date: Wed, 2 Jul 2025 10:03:53 +0000
Message-ID:
 <DM4PR12MB8451A72A4C28C6FE4F0C623DE140A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-11-Penny.Zheng@amd.com>
 <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
 <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
In-Reply-To:
 <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-02T09:00:04.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB6277:EE_
x-ms-office365-filtering-correlation-id: 3a8a3648-fd7e-46e9-75b0-08ddb94fc083
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?enIyQnQxTGNGUzF2MW4rV0tGTGJRaHZRMzBGV0IxYWVUdk1SVFZVMHVCZkhs?=
 =?utf-8?B?Qm9SVmRlczY1R0lqei9QRHlNZi9IRjBMdjNJcTVsNWNxNGRxaWw2a0hBc2pq?=
 =?utf-8?B?YWFacFVndzE2VmZMTytreHVXblVZQUw2YzIwNWxQMStlV2xKdGNSS3lWOEVZ?=
 =?utf-8?B?dmljbDRsRFlEUWIraGY3bGw1ZENYYk1sRmIzMm4wdGh2M2ZWRVpuRTVKaklG?=
 =?utf-8?B?bVBBT1VCQndwMTNtV2lSWi9BUVRHcE1panFHTXRWSjdScVQrZjJ3ZkVpZThB?=
 =?utf-8?B?TmV3ZUlUeWYxOVVKUytkU1A1ZTFZelNQay9NNHBFdmJWZTRTS2J4TDlLODhk?=
 =?utf-8?B?SHdxeWV6V2Q3N0lvQThFVUNUZUVkTzQyRXhqQURZRk9pVi85TjAxN1hrdkg2?=
 =?utf-8?B?NFVHb3loM3RZUUdlR25KTXc0L2M0L1JKK3VBOTJjYkFTQ1NYeklGZDlqSFVk?=
 =?utf-8?B?bmZSUjVuTUNydVJGSk5XS0RVL28rSnc5NGQ0NXUyM1UvOXpRR09FM2thVzBV?=
 =?utf-8?B?bU1IeWdxOGtJbnRhaSs3NEtWWTlXeGxKek5FMk96V1RTWDhzNjluejZxUEkr?=
 =?utf-8?B?THhqU2kyNkN3QVFhcHE1empBbTUxa293OVh5TDRBTFFCdXN6SVBmemcyL1VH?=
 =?utf-8?B?dGszR3VpN051WDVEVEJINHExREdFYjRHZktrbXl0b0VpRndWN0pNK1hjWjd4?=
 =?utf-8?B?TVM5RGx0R2xkaFJKenBwNGtveHpTYVFvNVpiQlI3cEpFdXZ0dkhWSEZ5QzRs?=
 =?utf-8?B?c1RHY3hYakdzZEQwalNKeDkzMVFMUHdtSFUxa1h3UHRKdmdTNXh4Sk03Z1BX?=
 =?utf-8?B?Ynd1SmZRTzlqT1dUNmhzb1BDd2o2endySkV3aXRwTHBscnhxaGdxVW5iYW9k?=
 =?utf-8?B?WUZNZ2lzNXFqSHl1RjgvREdaUnlYUldyaC9rZWFOeEtFdFQ4Y2VYaXV4amxK?=
 =?utf-8?B?TzF5eVk1NnJrQWcyeHRMa2JyazdiM1VETDd1blF3R01CWHlYcUdhRlpzVTBV?=
 =?utf-8?B?SDZSYUQwM2VXeUpIcDByb2tyQnRoYkxYbHlId0NrcjBZM1JTMjRYMkVoSm51?=
 =?utf-8?B?VlNWNyt3UjNXY0VuOXlmN2N3SU9SNHh5VnAyUUlzc252NGJGMVBEcHlMTi9S?=
 =?utf-8?B?MmNmNm5JZ1JTMHhrc2FGRllYaTdlS2dmNmk5SlQydHpXSGVWM1lVZnNlTHVZ?=
 =?utf-8?B?UUZsSlB6K3VvTTFzK3BYNDhsM29tOFRHS0gvL3huOFNsZjJMTHdEZ1phU2pn?=
 =?utf-8?B?c2pMOTlsclRKS0p0dUdDNi8wMENqUklGUXFKVjVVclZBcGE4YnpuVmp1Mmcv?=
 =?utf-8?B?SWFtUGpJVTg2VzV6Zk1GbUlCZUFPT3A3clFpU0pOS2JOMVU5TlVaaEoyRFVE?=
 =?utf-8?B?d3FHUXNFK3BJa3k1VHFnVlpTR091M21vNW12Ui9MNXRUV2lOTUE0azh6VXdW?=
 =?utf-8?B?bEVKUG1vdTkvcEh6Y1lCSEs1Y012NVJQQk9hV3BLZmZaQVhhZnlsdUU4NVp5?=
 =?utf-8?B?WncxcXQwa1FoYjJuK2xBWC9iUHFScThYMFgzNHlTSU54VnAwYWJOcVJsNkJ5?=
 =?utf-8?B?dnVmVUYzY1p6cTdUNzJ2YXBHYnpudVRxOUNGQ0pQRTdFanF2TU1ZWXB3K1ZD?=
 =?utf-8?B?Z2hza0xMd2g4U2E1N2lHWkVEWE1jRXZaTVhtdnhBUTZGb1BNTUQxMmJKODNn?=
 =?utf-8?B?V1RCUUZ5ZVA4bDB5UVdCUXArV1MzUVNtaHdpT2w5RzFHVXFEWXBhWTU2SHBy?=
 =?utf-8?B?RVNLMU5OOENnNC9icG1nenV1ZGNUUG9VQlVkN0d5Y0tvazI1K0NQWGMza1c4?=
 =?utf-8?B?Rms3elRzNEpPSFAvcXVwWUtURGw0cWFpOFBBcU41NXY0d1NJQzE0YnJha1dm?=
 =?utf-8?B?SU9JQWpXdXRpTWM3Q0RHKzcxYUtDQXRLY0k1Q3N4THVybURyME04WXdYTHRT?=
 =?utf-8?B?MS9uekQ2Rmc5OUZQMW9FQklyNktMYzIrU3BBRXZ1MlZFTjNDb0Z4Q2szcjFl?=
 =?utf-8?B?WHNEczN6Sk1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2h2UXQwYWcxYzVzREx0bkw3b1Z6UERyS21vbzBuN1NKbDR3SHBWK1RzT0pZ?=
 =?utf-8?B?T2hyUEdEOGRwV1Y3cXg2c2pVMHRmZmlxL09veWpGWjFVVVg4T2hIa3JHSUtW?=
 =?utf-8?B?UTdhS25sc2h3UHZ4SFpQN3FONUZxZGE5b2JudjNGSlQ4Q0o2Y200bDcycWpq?=
 =?utf-8?B?Q0tyYjhhbFkzM0JVaHptSTFqR2g1YWR0aWV1azhUR0pkQTVJeTdjYVVNVFJU?=
 =?utf-8?B?T2x5YTlhNXl1TWJGSXFwMkhEbG1oSVdtMVJrVXB5R29xeFc2YURTckp5NWVT?=
 =?utf-8?B?MU4wQWs2SEQycmV3eVE3Wno3VXd0c3Y0TnVSSHRaeUNVVGJtd0ZvdUtCMjAy?=
 =?utf-8?B?WThvRXNxMGN3TWtaaDNEdW1hZFoydEsvZjcyMDdFWUxrejk0dUN2Q1kyUTNW?=
 =?utf-8?B?aEhjd3RQTXRFSnRoUytSZjUxVC9qelhZN1hVcm9MUklsTE9NTHY2K09XdVZI?=
 =?utf-8?B?RnFHbVBBV3lvVDN5ZFVkcWlMUmlhQnp5R1A1M1hDVDRsTTBRMkJaWFpzbXJF?=
 =?utf-8?B?bWJ6c3A5NWhRMm5iMytuSjlQRDdWMEpIV21kTHdFdUlyUjlIU3M4elRzWXVv?=
 =?utf-8?B?c2QwTysvVTdacDRTUFhMZEVVeUVScUpDckxWWmFxSzIwUVlNUDdEY0pkeWRX?=
 =?utf-8?B?MTRnQXM1Z09Wcno1VGxObkhubTFKY0NmNVNmYUx0Q0p3VWxLWUM2bmR5bmpQ?=
 =?utf-8?B?amNNdG9MeW5tZzZzMUV2cld4b0JoY21JUnFLUWZnUDlIWWJ6emd1eXRHY1VY?=
 =?utf-8?B?RzVvNGpHbXd2elJuVzVWUHMzYlA5Vmd5azI5RDhaa3lXdWlGWlFpdmVISXFm?=
 =?utf-8?B?azNLNVFlN0k1SzZ5Y21JRnBFVzhYazM4OHdSenVjMU1VU1lnYSt5R05SUlBz?=
 =?utf-8?B?R1A2ZFp1cFhnVkE1VUJ0eEJJYlNmbGY3ZVRrU2dUVll6RG82b0tFSVNsV1Zl?=
 =?utf-8?B?Mk42VjhaSHBIaVdNZXJlbk1uZHBtRTV5TDZzVURHdlZ3UW13YmlnbndIQWx1?=
 =?utf-8?B?MGE2RUw2aWR6YzkwZ1BqNzZIUytlanhJZ2VBQVliL1FHT01kOWZvdzcwUEJt?=
 =?utf-8?B?THlsZGdLV1lxK3UyNloyWE5vTXcvNDRLaVdPNGphUmNvbWRabnQ3RWg3QVVm?=
 =?utf-8?B?UFo3dlhCNWpLcGpyUzBFelJLUmNzcU12S1pPRnBEWC9DSDZmSEFiVjArRWdB?=
 =?utf-8?B?Z2syc1ZOVFhKcTl5b0VidTQ5TTZwUjV1bnNuQldFdEwxSDF1bEE4UDhwQWZi?=
 =?utf-8?B?bmhEV1ExTVRqLzkxVnEwS2RpbGxOZkhDZlVZL2N3T2xRZnV1dDdYaEp2dTZD?=
 =?utf-8?B?VTBUVXlmVkxLeFI0VkpXOUNiTGJUSjNyWFFjVnAwY2xueWc2UWdqZXQ2Y0tW?=
 =?utf-8?B?RGc3dE9scTlNNkVHOHVlSFBIa0M3NGkxbmtwTW54OXJsZk9kRzU4dWhjcDZi?=
 =?utf-8?B?SThkR01iNnhGWFg4SStHYmtva0sxSjR6TFhwUjY1QjRBUTY4UjF1Y3poMnZp?=
 =?utf-8?B?ZXBHeE1lbnVEclY0Y2ZqT2hKMzFwaDkyVGU1c1hVME5HbnRSQ0tIWG0vaXpU?=
 =?utf-8?B?ZWcrVDlCOGhqQ0hWNDFMdzhKdmNLM1pLZWZYbG42N1dtWUNYT3BUdXZWZEsw?=
 =?utf-8?B?N3Vyb2pLelZSNXEvcmhkbW9WQ2dpTWdRNERsb210dG9xOUpQeCtodHlhUUt6?=
 =?utf-8?B?cWk2RFhEQWVvOVRlSGZoSlovVW1SMkdDckl1WGFvU1pPcnZiSWdKTjFOdG9H?=
 =?utf-8?B?NGgxZ0FpR2hnZ1d5N3lPVEVjRXI4VVgzcUNZWWoxQm5UUTV2Tnh6VXR6bUkw?=
 =?utf-8?B?K0t6L0pOLzZrYUpUQU5Wa0VZTlRQTGw5TEM1dERTNm9EZ1owcGhoSDFvaTNB?=
 =?utf-8?B?UituRzA3TnI4TUl2ckR0SlRxMXlGL3h3ajE5RHNCZ0F3TGRkR1B2M2U2ZkJn?=
 =?utf-8?B?Zjl1MXB3dVdydzBXQS9MQ2NQNnZIOTQvUkZUd0VRbGxQcWJ5M0JqVlJjTmxV?=
 =?utf-8?B?ZHc4ZmlzMU5xcVQ5RlM1TmlHaVUxS3Jud3VlNTJ6dnFmTnBZcVd6Z0xjK2p0?=
 =?utf-8?B?TGhEc0VHNVR6WkNaQzd3eC9wN0x4UVRqaDlINkkxa0xSOUhHWkMweDZDZnpT?=
 =?utf-8?Q?DpkU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8a3648-fd7e-46e9-75b0-08ddb94fc083
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 10:03:53.9683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cXZcLMR/+8HGp58+xRbZLYUUJBGPBPb5bRnTXLOmmc7wRDQrBQBf5nV4403by3trug4oE9vC1/X6rVC+M7583w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZW5ueSwg
WmhlbmcNCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDIsIDIwMjUgNTo0OSBQTQ0KPiBUbzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5n
QGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsg
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4tDQo+IGRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMTAvMThdIHhlbi9j
cHVmcmVxOiBpbnRyb2R1Y2UgYSBuZXcgYW1kIGNwcGMgZHJpdmVyIGZvcg0KPiBjcHVmcmVxIHNj
YWxpbmcNCj4NCj4NCj4NCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBTZW50OiBUdWVzZGF5LCBKdW5l
IDE3LCAyMDI1IDEyOjAwIEFNDQo+ID4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1k
LmNvbT4NCj4gPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29v
cGVyDQo+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT47DQo+ID4geGVuLSBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTAvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1
Y2UgYSBuZXcgYW1kIGNwcGMNCj4gPiBkcml2ZXIgZm9yIGNwdWZyZXEgc2NhbGluZw0KPiA+DQo+
ID4gT24gMjcuMDUuMjAyNSAxMDo0OCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2FtZC1jcHBjLmMNCj4gPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYw0KPiA+ID4gKyAgICAgICAgLyoNCj4gPiA+ICsg
ICAgICAgICAqIFdlIGRvbid0IG5lZWQgdG8gY29udmVydCB0byBrSHogZm9yIGNvbXB1dGluZyBv
ZmZzZXQgYW5kIGNhbg0KPiA+ID4gKyAgICAgICAgICogZGlyZWN0bHkgdXNlIG5vbWluYWxfbWh6
IGFuZCBsb3dlc3RfbWh6IGFzIHRoZSBkaXZpc2lvbg0KPiA+ID4gKyAgICAgICAgICogd2lsbCBy
ZW1vdmUgdGhlIGZyZXF1ZW5jeSB1bml0Lg0KPiA+ID4gKyAgICAgICAgICovDQo+ID4gPiArICAg
ICAgICBvZmZzZXQgPSBkYXRhLT5jYXBzLm5vbWluYWxfcGVyZiAtDQo+ID4gPiArICAgICAgICAg
ICAgICAgICAobXVsICogY3BwY19kYXRhLT5jcGMubm9taW5hbF9taHopIC8gZGl2Ow0KPiA+ID4g
KyAgICB9DQo+ID4gPiArICAgIGVsc2UNCj4gPiA+ICsgICAgew0KPiA+ID4gKyAgICAgICAgLyog
UmVhZCBQcm9jZXNzb3IgTWF4IFNwZWVkKE1IeikgYXMgYW5jaG9yIHBvaW50ICovDQo+ID4gPiAr
ICAgICAgICBtdWwgPSBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZjsNCj4gPiA+ICsgICAgICAgIGRp
diA9IHRoaXNfY3B1KHB4ZnJlcV9taHopOw0KPiA+ID4gKyAgICAgICAgaWYgKCAhZGl2ICkNCj4g
PiA+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+IFdoYXQncyB3cm9uZyBh
Ym91dCB0aGUgZnVuY3Rpb24gYXJndW1lbnRzIGluIHRoaXMgY2FzZT8gKFNhbWUgcXVlc3Rpb24N
Cj4gPiBhZ2FpbiBvbiBmdXJ0aGVyIHVzZXMgb2YgRUlOVkFMIGJlbG93LikNCj4gPg0KPg0KPiBJ
ZiB3ZSBjb3VsZCBub3QgZ2V0IHByb2Nlc3NvciBtYXggZnJlcXVlbmN5LCB0aGUgd2hvbGUgZnVu
Y3Rpb24gaXMgdXNlbGVzcy4uLg0KPiBNYXliZSAtRU9QTk9UU1VQUCBpcyBtb3JlIHN1aXRhYmxl
IHRoYW4gLUVJTlZBTDsNCj4NCj4gPiA+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGFtZF9jcHBjX2Nw
dWZyZXFfdGFyZ2V0KHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5LA0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHRhcmdl
dF9mcmVxLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHJlbGF0aW9uKSB7DQo+ID4gPiArICAgIHVuc2lnbmVkIGludCBjcHUg
PSBwb2xpY3ktPmNwdTsNCj4gPiA+ICsgICAgY29uc3Qgc3RydWN0IGFtZF9jcHBjX2Rydl9kYXRh
ICpkYXRhID0gcGVyX2NwdShhbWRfY3BwY19kcnZfZGF0YSwNCj4gY3B1KTsNCj4gPiA+ICsgICAg
dWludDhfdCBkZXNfcGVyZjsNCj4gPiA+ICsgICAgaW50IHJlczsNCj4gPiA+ICsNCj4gPiA+ICsg
ICAgaWYgKCB1bmxpa2VseSghdGFyZ2V0X2ZyZXEpICkNCj4gPiA+ICsgICAgICAgIHJldHVybiAw
Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICByZXMgPSBhbWRfY3BwY19raHpfdG9fcGVyZihkYXRhLCB0
YXJnZXRfZnJlcSwgJmRlc19wZXJmKTsNCj4gPiA+ICsgICAgaWYgKCByZXMgKQ0KPiA+ID4gKyAg
ICAgICAgcmV0dXJuIHJlczsNCj4gPiA+ICsNCj4gPiA+ICsgICAgLyoNCj4gPiA+ICsgICAgICog
U2V0dGluZyB3aXRoICJsb3dlc3Rfbm9ubGluZWFyX3BlcmYiIHRvIGVuc3VyZSBnb3Zlcm5vcmlu
Zw0KPiA+ID4gKyAgICAgKiBwZXJmb3JtYW5jZSBpbiBQLXN0YXRlIHJhbmdlLg0KPiA+ID4gKyAg
ICAgKi8NCj4gPiA+ICsgICAgYW1kX2NwcGNfd3JpdGVfcmVxdWVzdChwb2xpY3ktPmNwdSwgZGF0
YS0+Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYsDQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZGVzX3BlcmYsIGRhdGEtPmNhcHMuaGlnaGVzdF9wZXJmKTsNCj4gPg0KPiA+IEkg
ZmVhciBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIGNvbW1lbnQsIGFuZCBoZW5jZSBpdCByZW1haW5z
IHVuY2xlYXIgdG8NCj4gPiBtZSB3aHkgbG93ZXN0X25vbmxpbmVhcl9wZXJmIGlzIGJlaW5nIHVz
ZWQgaGVyZS4NCj4gPg0KPg0KPiBIb3cgYWJvdXQNCj4gYGBgDQo+IENob29zZSBsb3dlc3Qgbm9u
bGluZWFyIHBlcmZvcm1hbmNlIGFzIHRoZSBtaW5pbXVtIHBlcmZvcm1hbmNlIGxldmVsIGF0IHdo
aWNoDQo+IHRoZSBwbGF0Zm9ybSBtYXkgcnVuLg0KPiBMb3dlc3Qgbm9ubGluZWFyIHBlcmZvcm1h
bmNlIGlzIHRoZSBsb3dlc3QgcGVyZm9ybWFuY2UgbGV2ZWwgYXQgd2hpY2ggbm9ubGluZWFyDQo+
IHBvd2VyIHNhdmluZ3MgYXJlIGFjaGlldmVkLCBBYm92ZSB0aGlzIHRocmVzaG9sZCwgbG93ZXIg
cGVyZm9ybWFuY2UgbGV2ZWxzIHNob3VsZA0KPiBiZSBnZW5lcmFsbHkgbW9yZSBlbmVyZ3kgZWZm
aWNpZW50IHRoYW4gaGlnaGVyIHBlcmZvcm1hbmNlIGxldmVscy4NCj4gYGBgDQoNCkknbSBhZGRp
bmcgYSBmZXcgbW9yZSBleHBsYW5hdGlvbiBvbiBoaWdoZXN0IHBlcmZvcm1hbmNlIHRvbw0KYGBg
DQpDaG9vc2UgbG93ZXN0IG5vbmxpbmVhciBwZXJmb3JtYW5jZSBhcyB0aGUgbWluaW11bSBwZXJm
b3JtYW5jZSBsZXZlbCwgYW5kIGhpZ2hlc3QgcGVyZm9ybWFuY2UgYXMgdGhlIG1heGltdW0gcGVy
Zm9ybWFuY2UgbGV2ZWwuDQpMb3dlc3Qgbm9ubGluZWFyIHBlcmZvcm1hbmNlIGlzIHRoZSBsb3dl
c3QgcGVyZm9ybWFuY2UgbGV2ZWwgYXQgd2hpY2ggbm9ubGluZWFyIHBvd2VyIHNhdmluZ3MgYXJl
IGFjaGlldmVkLCBBYm92ZSB0aGlzIHRocmVzaG9sZCwgbG93ZXINCnBlcmZvcm1hbmNlIGxldmVs
cyBzaG91bGQgYmUgZ2VuZXJhbGx5IG1vcmUgZW5lcmd5IGVmZmljaWVudCB0aGFuIGhpZ2hlciBw
ZXJmb3JtYW5jZSBsZXZlbHMuDQpBbmQgaGlnaGVzdCBwZXJmb3JtYW5jZSBpcyB0aGUgYWJzb2x1
dGUgbWF4aW11bSBwZXJmb3JtYW5jZSBhbiBpbmRpdmlkdWFsIHByb2Nlc3NvciBtYXkgcmVhY2gs
IGFzc3VtaW5nIGlkZWFsIGNvbmRpdGlvbnMuDQpgYGANCj4gPg0KPiA+IEphbg0K

