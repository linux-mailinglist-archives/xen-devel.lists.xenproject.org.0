Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D655EACC05E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003985.1383626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLL1-0000fJ-UZ; Tue, 03 Jun 2025 06:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003985.1383626; Tue, 03 Jun 2025 06:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLL1-0000ck-RX; Tue, 03 Jun 2025 06:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1003985;
 Tue, 03 Jun 2025 06:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMLL0-0000cc-Ib
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:41:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2414::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6de7e71-4045-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 08:41:29 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 06:41:25 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 06:41:25 +0000
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
X-Inumbo-ID: c6de7e71-4045-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERWlHnt4ZDS74VEkHMLqWQSLYcmKAHbuOlGSjPgfr6xetKuvFbpOYTjWbWtD7kIeh7TXDPdBTyxZxGcvENaIzlBl7PhOeS3C2gcRuTTau/NMres71dif65CkzWYQIWWtU0mSpJ4lVdqzAY4hT2srm/2tyvcAyZ8NbuJW+pe50PgTn4aGkqm1YFgDDAi3KWuDAgwDt+DwYGZnhK0yesofYNePoF6DcA0e8tE7yCs9zRTktAbz2ox0el7rU6z/miiF83aBm0KeDYJrDUCs+NVyYSnzhVTb2XrdQ0g8dbot1XN5IeIghYCaPN6O6vWECHs34aoSoiKAKEbrrfJ+Jsbqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOjuW9QwbIty0CAr6oR6MYezSB5oFWNTZo6fdq2u8t8=;
 b=aR04URdDH3aiyxo/azqeXE1c4vwbYTeZ6vfBtZ+ng6JvIOmP0TqvbRXtbR5dWuKmEjiRz3FnByC4koKR9CWY5+U5OpTVjk9TkyE2wU30QtbDcwPMu/TGT/o5Nq8U3tUK3//BxXIVj6C1L5YRoe+83kBQ+MNk3WgU6P+J3t49ENczIjV16KT7nWxiXP91CMeRBzRR8AjS/Ew048qAwfS2rhAbhXV0sXAM3cHALET7ZIvnODyEBz4hUmkGwzKoc46VgNfanSfGbNPNUDGxio2zUTxUeNGdxf4c1oEJ5eWqc/IxvcIhYwAcZclKc3Q5BAKyhhEYtYr3vQs9RDjUuRH+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOjuW9QwbIty0CAr6oR6MYezSB5oFWNTZo6fdq2u8t8=;
 b=hGLZedIamzUlB6c7w0k3c2KthIQ79wRAxjv1MqvMSHmf20mpT1otgl7jJUuVZr5PfGU51rqMriRDJKmVrw5b3PcyOdN9hNGx7YEq9SqijLeYVN1i9WpiNmxkeDrAAflLaDoKzd4gOO1HRefPd7dOkBuJ/sWDXVMFeXcXzeNkjWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c7612188-d918-495e-91d3-e54fd08cb7d6@amd.com>
Date: Tue, 3 Jun 2025 08:41:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
 <811c154c-d7d4-480c-8898-a21f62f2cf6a@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <811c154c-d7d4-480c-8898-a21f62f2cf6a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 804c88e5-2458-487e-f48d-08dda269a908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1hoQWY5NWZ6Tms4ZThGT0ZCUWZ1eHQzWjlYajZadVIzcGRySUUxUDU2NU9O?=
 =?utf-8?B?YlJ0aXBOODEzRk9kLy91dVJCU2ZxMVBGcUVKeEZaZUIvUXJWcjZRb25Vb2to?=
 =?utf-8?B?NklTNWJsS0w0Z0pIOGJUVEwvL1FNRzJlamhaZ05CUXppR2RnUEI2WnRlRDAz?=
 =?utf-8?B?R0IyT3Y5NmQzMmQzWG54QXVKckxHS0lreis1ZkNyR24vOXlvejR1ZVRvczM2?=
 =?utf-8?B?S0NXYm9GMWdZTEluZURvNWNZVE1GOCs1cWlMSEVRUlovWHpwa0lOQlM4bTJa?=
 =?utf-8?B?Vkllc0hvNm9QOFIvcTdVTmROb1kyYXUvbzljajdPNWZMbGNnSlQ2UE5XbEVp?=
 =?utf-8?B?NkZIS090MnBXOUtpdHNTamdPOERBQkNqS2QwRFVwN05hK3d3aFQvMC9GYUlN?=
 =?utf-8?B?SFEwMGdUZFlWbkRsRkVXU3hqWGFOUDBDOWRHUG9kR0NiRzVjSit3TzVkaHhZ?=
 =?utf-8?B?NlZBaGJSQkh2VldXbFMwYlFMRFp3UXluZFMwcitNRm5CT1FhcVlQemx4M0R0?=
 =?utf-8?B?ZHg0SDFJekFLd1dSa2F3d1BnUEgybkJFbUhkUVM5MTEzcHRsNDg2UVk5bUpR?=
 =?utf-8?B?aUdWNTNTY3FyR0xlMVN2b3JVU2Q0cXVlNmk5UDR5M0pJY2dmYUdSVWZRMlVJ?=
 =?utf-8?B?aHR6UlliRUZYcEtvTTU2RzhBYTNXYktPUVUyOVJreXppdGIvSEN2OCthREZa?=
 =?utf-8?B?SlcyOUM3NkZGUVAwaHE5YU9teTN6aGhFeituMWpRMm1kVi9NZ05SVS9YMUp1?=
 =?utf-8?B?VEZjeVJ1QkdjcjY0NG5sQ1hLUUpYZVlVd1NVUEpKYy9xaUVzSlUyeVRqWDBn?=
 =?utf-8?B?endBaGhMQUxSdGN5eWxnaWx0NmVYTE1jR2hzL1gycCtMUzM2eXlRT3NzS2pT?=
 =?utf-8?B?WHRzZUx4U0dnczVBS0VvNmlwZHNZKzM3S3pTN0xhY2duQ3NiNUZwTkhBRURE?=
 =?utf-8?B?SUVwQmtQb2d6bjU1b2FTbG5Va0tEY1h0L3VsNUxwSlQrc3hhOWRSOTdoRVlF?=
 =?utf-8?B?TXdRbVpVR3pzbTV4VzRnNU44OERKMXlyT0dDQzQwN0Z5TytjazFkRFJ3RGYx?=
 =?utf-8?B?Qmc2RVhuNHVUMXo5ZDRQQ0FoMWxFcFdiazZjTEV1ejNRVUNrQ2RRUU1ZOEkx?=
 =?utf-8?B?T2ZXaVI5ZjkxaDk5SGNPY0tOcXhucUlkSzNXSHBOZkZvaUNWdWc3dDJaWVpo?=
 =?utf-8?B?U1c3ZEp6MlcxeUt5Mi9yckM5d2JzTzVVU1hzZllZN3R2RG5kK01NYmY2UWZv?=
 =?utf-8?B?N0tTY0Z0ZWR5VkpkTnhsS3NGL1ovVlVMWGJmTENwWVE0NXM1S0QyZkZaL0RQ?=
 =?utf-8?B?VEFQbmpyMkU5YXo5Uk5NR3h4L3l5WUtjMWczdUNVemhKSVd3VldmN3VDbGls?=
 =?utf-8?B?QS9WZDZjRzM0bWJSSUlxK1UvTC94Y25EeVI2Y2Jyck9EbnNNL1p3bW5yRmFP?=
 =?utf-8?B?WDkrbisveUxKbTIrUU1nR3d1Vnh3SmQzUHBBNFlXU2loVmxsZlNCR09uQWF6?=
 =?utf-8?B?dFZIYmJDMVpLMFZuOFozQlV2dnE5bmRUL2Z0Z1BLNVlWQUZ1WjJGWUlGSVFt?=
 =?utf-8?B?cVkrWDdIOG9UQTVlMWVpa1dPK3dtbmZFR1pUY2k1Sk9UNUpVUzYxNUZZVGRR?=
 =?utf-8?B?VHR3ZlZxS1V4dVlMZXp4dmxKWHlydUxScWM4RmlIVVY0NHVUM0JuRE5BQmkz?=
 =?utf-8?B?U1RkRGprcDhaWFlrUnloeEU3dkMvaDZ3ZGUvc2grSzB6YWY3a3VZNXlPbkhm?=
 =?utf-8?B?bVFjTnZzK0l4eE5uNllDcDI5Y0pUNC84QkREaGxFOWRsK2szTDZVeDFmSyt4?=
 =?utf-8?B?bnM0eVlncVFLNWVMYmFvS3ZwQ242ajcrd0JZRmlucXNBS0l1b3ZJMXpVRGVq?=
 =?utf-8?B?TWRyMi9BQk0yMkhZdjJpVHlYM1pKQWdRZnB4YmFLNjRaU0RYbVpsdW1DN3do?=
 =?utf-8?Q?1h5IRtxJrhE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFtRnpUUHVaVTdNK2xPb0dBclJIdTJGZGpKR05mZW82MkF2N3YxZllYUm85?=
 =?utf-8?B?ZFBtZHFsZ0lTeXdaaFp0bU1Celg2bEEyNFhyOVR2bEFJeUNqU29XWVpLQWw5?=
 =?utf-8?B?SWpCbmNwSDM1VzNpSHRYWWo0UDJZcFdNVXJaamFlM3l5cTMxOE9tbVVnZG4w?=
 =?utf-8?B?QXZRVmorWjRUUUFsc1o0T2dyZ2d0WUhSMjFQcGx6R1djelVLNjNVNXZsbmJl?=
 =?utf-8?B?dm14VXBmQ3pJVHZJWnQrZmEyV1FicnA1Mk5SVW9wc2VCSmtGOVh5aGJXOGcz?=
 =?utf-8?B?cUF1NldTRG9TRzdYUk94ZGp6MHljZlA4QUpjM2FrWjhadzJpUmZzMEt0anZ1?=
 =?utf-8?B?MWxMaGtrQkVadUNHZW1GSldCekF1ZFBWeGlIZTVJdk5oemJ5MU41SG9mUERB?=
 =?utf-8?B?WjY3eHNSaFNwajh3TEQ4RlJYS3YzbDIwM2RxZndlQ1Z2bFI4cTJVUGVKMXBn?=
 =?utf-8?B?MlVCcjl1aTgzYVg3K3N2T1llR0FheFdTdUpoM3dSWThqeWJGRkNmMy9VZHI4?=
 =?utf-8?B?QlZBbWZJSTF1OE1rZGsreTduL1VCRkZqQ3RSaWFIS0hHYXQxNGphOTZVdTY2?=
 =?utf-8?B?Nkk1Y2dlYnNETmErcTYxVkN0TlhDbkFpcXNYSkdUNGJZOHZHVlRmK1IvRlVH?=
 =?utf-8?B?Sk9SMGc3dVNqbTdiWnp4cUdjTUpPZnlpQ0E1NFd5ZVY4L1BTaWpwcUZHeWNz?=
 =?utf-8?B?b1dVVGFuSGF5SjFhWkY0blM5ZHhwWk1xMEYyZmwvenN4TmJ1MHowTWxFTnFM?=
 =?utf-8?B?S1kvMFhreVFuUG8yL2xqd2dyd3ozOW9qZUJxU25jS0dFN1kyLzlBeGI4SzUr?=
 =?utf-8?B?M0xGQ0lQTFNMRDBvaWlPTE4yQmFoL0xQZWk4OUNBb2JkbWdYS2tmc1ZWcExn?=
 =?utf-8?B?bXpPTk9sbHJaTnJUU3JtaHVZdi9aUGtDejNkeFBxSnFYUzdERmJxNHlvVXQ2?=
 =?utf-8?B?dVFJdVZKOW9aNkMrZFJJRHF5ZXdIbWE3dVdIbTFReWRnTVhTS3ZteGU2dlNi?=
 =?utf-8?B?THBERC9ROHY2NFc0SEd5bGt3L1JNbTl3cU5iaVFTL0tlTGQ4RVB5VWRpdUFq?=
 =?utf-8?B?V3ExbW9LdjhQbDRyUVo5WGFKbWI4OHBXTktpbmRRYk5NRGJ2UGJ2aUlvNU1S?=
 =?utf-8?B?YldMTDYrVjNMcm55eDAxOUQyS3l1bzI1SEdDVmN6TlJwekFxS0dxVEFIRktk?=
 =?utf-8?B?TWs4SUMwMVR5NWVydlFwUjVzRmZaRCthTUphV3FrYXhodUc2N2dYaEEzNEZm?=
 =?utf-8?B?SWJ0ZUR1bDVaYk1oWGR3VWRUdllTT3BtcXgxN2FneWJkM1NZOUVpUWNKc2FQ?=
 =?utf-8?B?MjFTa0tvanRoZDRlaE1JZUdwajh2TUtra2RPKzZDQURNRjFLQnNtMXpiMFJT?=
 =?utf-8?B?NEV0aG0yTFJKRGltVEtkQlp6Sk44aU1udGtuVkdJaldHVkdhWDk0TjVYYjls?=
 =?utf-8?B?a1FwYi84aFBwK1lxbjY2ZEdiQ1M3WXpoZmhlWlAxUG5DeXNrOWwxU0twTkdn?=
 =?utf-8?B?d2s3R0NmZkVVTkk5L0lJUGh3bGt5cTFLVWFaNU5OM0hrMDY1aGhyTUFWeS9X?=
 =?utf-8?B?RWhMTUhIMS8zT0lubnN2czhEb1VsaXovNmh4Y3Q1ems3RTJaRExCUW5Da0Jz?=
 =?utf-8?B?MnJEMThPRThwRW5tUStWVDltd2MxVHJMVktFRmxMSU1wUENGK3RuN3czWFAw?=
 =?utf-8?B?Mit5bnJVRUpPcVpNNzZLdFBDOThycm1sbE4xS0VCdWlnT3V0NjFrMkVidEFm?=
 =?utf-8?B?djJYNEYxU2g1VU1BZVNOSHRkOUdYVnoxWjNyTlI1U3RzdXdYYTY5cXpaUFBR?=
 =?utf-8?B?WUc5L0Rrd2c1Q2hDcktQZ29pWXJKUk1SdUlYaUFmR2NMYTROSSsyZjZPT2hB?=
 =?utf-8?B?N3FRWHpFdzBMcC90L1hKZnVObnVxRkpLYWFwR3NYS2N5OFBmQ2czZElmRUZS?=
 =?utf-8?B?eDB1Y3dkbkNGZHFKaDQ0YWx6cExuM0VSTlV0QTdFWlFCZkVpN2xlRUZMTFBv?=
 =?utf-8?B?V1ZJQWJrVHB2VkxDSkkwMXNFb2tKd1IzR21HSG9SN0FNWjZYL2lJbzhtT05P?=
 =?utf-8?B?MzAzWnhHTkRZSlUxWFlnb3QvcDNRUzlEZ1h0MHRwUU0yM1d3RzNyZnNtampr?=
 =?utf-8?Q?VGAoywFR6Dth3k2JsZlAnYUgN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804c88e5-2458-487e-f48d-08dda269a908
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:41:25.1016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPbdDk8Mga4kedKGD/O4O79fkYZ8Id3N1AN0cHMG0cix1mywSHPggqF815mhQteT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678



On 02/06/2025 17:50, Jan Beulich wrote:
> On 02.06.2025 17:36, Andrew Cooper wrote:
>> On 02/06/2025 4:09 pm, Michal Orzel wrote:
>>> These tests are supposed to run on target. HOSTCC can be different than
>>> CC (when cross-compiling). At the moment, tests installation would put
>>> a binary of a wrong format in the destdir.
>>>
>>> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> Oh.  This didn't explode in GitlabCI because there's no ARM version of
>> *-tools-tests-*.
>>
>> Can we fix that too please, seeing as there is a real ARM board?
>>
>> Also, I guess we have to finally sort out the CC vs HOSTCC debate.
> 
> I think the situation here makes pretty clear that HOSTCC is almost always
> wrong to use for tests/. The emulator test harness is special in that it (in
> principle) needs a target compiler (CC) and additionally an x86 one (with no
> present representation). The present way of (partly) distinguishing the two
> by using CC and HOSTCC was assigning wrong meaning to one (perhaps both) of
> them. The (or maybe just my) problem is that in the toolchain world it is
> build, host, and target which are distinguished. As per Michal's description
> my understanding is that HOSTCC is matching "build" there, not "host".
Yes, I found this issue while building latest Xen with Yocto. Build is x86, host
is Arm. HOSTCC is x86 gcc, CC is Arm gcc.

I take as this patch is waiting for a maintainer tag? Not that it needs to wait
for some generic cleanup?

~Michal


