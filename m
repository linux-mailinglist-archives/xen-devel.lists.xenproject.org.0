Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F0CBA3523
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 12:16:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131411.1470511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v25UN-0003HH-N9; Fri, 26 Sep 2025 10:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131411.1470511; Fri, 26 Sep 2025 10:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v25UN-0003FX-Js; Fri, 26 Sep 2025 10:15:43 +0000
Received: by outflank-mailman (input) for mailman id 1131411;
 Fri, 26 Sep 2025 10:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehmb=4F=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v25UL-0003FL-7Z
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 10:15:41 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c09a2921-9ac1-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 12:15:40 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by GVXPR03MB11091.eurprd03.prod.outlook.com (2603:10a6:150:2aa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 10:15:33 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:15:33 +0000
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
X-Inumbo-ID: c09a2921-9ac1-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORgHvWrk1G1kxq/4cyIEU2/Ik2R5OGKxLNEibf2KJn7V1q1ba2mh+vmTnF/qlbO/Jbxuy0PjRrt4ok9y3XXO/Ms6KJP/qCy4b/AXGWyAu0fsrxJjcYSlF+MFoHAENvpUGvjwf0+Zrepq2f2PKoXg6LuuCU4Oyd6+GleYFV1z9KlFaEpLr1R/V1u9WPZWSHMpVkRRgIzJl47PF/k5mMBUp7+1X6217azUrGRAdAWvqx0s6GHfl93Ox+LlnHz/AoGgX5O+eDj0peHz1VPGOIDpw4ETuavqRv41lR6UDSRjv2Io06tsbxGK6mhTS/ksAHqyBA8BtIe+S79+f/rGW1JNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqsp/BiTQvzhn/fc4wT8/PjtXP2QjbmzR8ieVMF8EUo=;
 b=KgUpS+r5817omUBeblvFSfX+L6EPBPm5jVw+pdovLB2olko2/blP4ec25U7gGysXO5tO4wKyfFmFOv9eKWfG3z3gshLmAIJF2m3ee2DeuxuPNn5UetB8LmAxAETwznFmLNuHHJmW9x6ryDuBaplmA84H4ditZBTYP7MqK6z9GkAqWq5MXKfuiV/VXrNx+AKvPW9T0v8ftDkTkKWArjBHzk6oYS7QBOqnBXUOZ7S/OHpKaIHSnBpceZpx2xtPes94rBA1wYJ7qkhqBEYBdgYZ6a18qSG71E/Pxt82TL3Nvcvu1Oq7DxH1OyIdJwIr51kjTwNsTNdunLu2cpEoSt2fqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqsp/BiTQvzhn/fc4wT8/PjtXP2QjbmzR8ieVMF8EUo=;
 b=d2zmBbRHkLXsWkgJDQa7MQqyxzv9EsfUk3/MBoTjhF3LLFR/pBUruRW+z34JWVjR0FAIZ1VAIEPpXujJ47j1fkeORYhS8DSEBIfe26iZZuoc6r1JnRJu2h38wk2+MKrSfQajS9k1YBqptL/ANdjt9kJsZmtQUPooIqrj/tvgjiCcl9vQdvnUdzzVmOhp8cHeP1NF5uxlKAi7R4t51OH8JQriQNE5ifuiadNbo0++0Drj+b2WtXyvmTrm7EDySdcdBnuTxHVLlVHiJpSu8ROl/q8Y+QOz3NSJOIBW/HItEm3mPeD8TNbZq423zhPMU6T2vNmpDsm+kx367xo/VTImmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d7548a6f-f8a2-440b-b520-d70f1e02a74a@epam.com>
Date: Fri, 26 Sep 2025 13:15:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: mem_sharing: add dependency from
 CONFIG_INTEL_VMX
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20250925195607.521021-1-grygorii_strashko@epam.com>
 <9cf8925c-87c6-44ec-9d46-f8b0ed30f94a@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <9cf8925c-87c6-44ec-9d46-f8b0ed30f94a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|GVXPR03MB11091:EE_
X-MS-Office365-Filtering-Correlation-Id: eace240b-35c9-4953-2000-08ddfce5a0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjM3SDhTS2V4WTJIN1pDZFNyNHU1UC9IbE56UHhabXcrUTRDNVB3MmpKUTVB?=
 =?utf-8?B?TWFCa3N3aFRmVGx6Qm84MnBGeEJ2MSt0eDJmSDB1VW40NlFGaG83T2NySUpt?=
 =?utf-8?B?VjkyU1pSa2Vid3ZJU0FXZVZIRERFZ3Z1eVJyenhpam1MTzZaSlJFeWJabFJQ?=
 =?utf-8?B?aE5PL2M5L2l1UUt5S04vWHRBaTFQYVhqcWxOUTJwdlo5bnNtcUZOUzY1bzNT?=
 =?utf-8?B?Yzk0UGd1V1cxSkZPam56RDVMMmFJVFFYVklCRktkbHNPTDV6VWlYeHFmekF4?=
 =?utf-8?B?L1VxaDFrSS8wdnFzVUJ3cENoc0toK0c4SEtUN0NsTVNnQjVoSkRxNmtpZVFT?=
 =?utf-8?B?RHpkbkovcGRNZkxCY0dXNXFwUE1jL25ZMEthbXRWTWtZbDhyUFp2VnV0WTdI?=
 =?utf-8?B?aUs5bFJYQXBUc1FQVTdQUTVWZGQwM1lYMU9nWE8raHN6Y0plK3ZQekVXRGZV?=
 =?utf-8?B?SlJTSmpVcWZzY1pMTHp1MW5Dd3NyWlRoTDVVU2tzbW5JT3JWY1U3YjhQNDc1?=
 =?utf-8?B?TFNyTEd2N2ExNXh2WDlZcDFlZTdWYWFobmZtY1FTbUY2eUFRLytPR3RhY1Az?=
 =?utf-8?B?QXFia1h0RXY5TUNtT0dRODFBRzZETk9QV0w1ZWhLTkg5TEdpZVNFZnVzakhL?=
 =?utf-8?B?YWtxOTA2eGt4b3BzNndNUGMyZ1h3NlBRSDRmOHZjaUdIV0hCc2cyMGhvNm9Y?=
 =?utf-8?B?WFNLR1BsS05yOS8zOG13TUh5TGNrbFMzWWlpdGZab2N2cTMrNHpRK1FlUEpk?=
 =?utf-8?B?VEEycllYRW1ra1h4MFJySFRwRkpSMm5HRDM3MG1IbVBtcEc0M051UlJFeVdN?=
 =?utf-8?B?RHptTi8xbnR4bk4yQ0tPRlZNeWNFMXFseTBhdENSdEtkQ0hPWnVwU3ZFYU1U?=
 =?utf-8?B?d1A1cWpyVHFOTlRDT1dXckYvRG5nb0Fvd3FHcXp4eFNqenljRWdJUWh4SEZH?=
 =?utf-8?B?aklYOFpuc2VTQmdQekhwNS9KMURXVnRyTTZsRjhQelJ2MndxeDJPdy8vSEEy?=
 =?utf-8?B?Y3BFMDloYXd5ZCswSDVxYmFXN2YrcUlmd1FBRmdFY0k2WXdkdXQxdHFlNTcr?=
 =?utf-8?B?RjVUOE0vbVNVOGJPRHd4SHl3b3V3d3ZEWmx4YnlxbjhweGs1YWNzZnROMlNH?=
 =?utf-8?B?b2tPdGpnZW1Fb3pxaytYTG9HUllZNzVUcFp2ZWFCanNHOVZoZGNpUzBqandn?=
 =?utf-8?B?RzBiSTkvVDl5VWdsUGFxOElUZTZPMnVmSXo2L2N2RU4rVDlISmlIcmd3RllW?=
 =?utf-8?B?ZFBLS1l5SHBLVW1mNVJvT0pQZnI0MmpmTFhwbGdiVjBUUlBORHNXTTMwS2hX?=
 =?utf-8?B?ZVVKVGN0ZmcxK3V6bm56clpiSElkNld2aXpFalY4NFVSZFQ0c2JIOW5sUWJj?=
 =?utf-8?B?V0JiUWtURFpuKzYvQzZQbTVXMXlNanNDMnRMSUhKTU1OQ2FVSUR5S0RuK3hL?=
 =?utf-8?B?WThaSmc0eXBlTHA4NVVNczk2ZTBzWG9OMDRhM3g2bUFsWFp3azlyQTU0azBI?=
 =?utf-8?B?MkVZREFHZG1LY2NjMFJDK0FMU1VqRmtyUkFnUE13N2x3UGxZQWtCYjlOcEJI?=
 =?utf-8?B?L2RvZEJmUXRETFBCWDJSZ0thbDEzOTBPU2U3dlBWWUhYMjd1SjVlcDlQdG9P?=
 =?utf-8?B?eGlrY01hbU5IMk10SzhBN0RvTnFBTTdBZTVRWUtQR1l4Y1hnR1QvOGxOVysz?=
 =?utf-8?B?dmFNSVJ6YkgydStFU2pHUzl5aUNleHliSEFlT3dKenI3VFBxUWNVdEhybnhh?=
 =?utf-8?B?TkM4bE53K05EZ09qdlhkTWVWdW9zRzFac3pNREwxS01hcFdKMFBjd2JvZ1NP?=
 =?utf-8?B?QU4vOHRDQ2drSUhnbm95VlNKVmNaYy8yZDJPTXo3WEZocStSOExxaTkrR3hX?=
 =?utf-8?B?SWJUZHlyWVE4R1kxekkyd1prcXl2NVJPeTNGUVQ3c2R4aWRoMUgybWVTN3Rt?=
 =?utf-8?Q?KRN3jiHHSDldzlYMdxQzUovCpWKIMJaa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alJYdGM2RktVc0dkQUNjQ0dpSHFuME9JSXdIUVlDQ2psNTJtd2NRaDZEZWNo?=
 =?utf-8?B?MzR0bG5CMVV3c1JZWWUveHdCUjFoRFFlWFVGa1dmVXlwcjZRZFhtd2YrcUFF?=
 =?utf-8?B?SUlVcVdJWlVIVzhNYVRRY0cyaXV4MnBURWVKODdPSjdVTXF1WUhzQzVTMkVX?=
 =?utf-8?B?dEdqZm1Sdm9pVy9yY1N1aVpNSGxmUEUrb2krSFFIY0tMcERvbWFMb2FRMnRG?=
 =?utf-8?B?OUxxLzhpcjJXWUFxZDFKSW96OXdWUjhqUmEyeDAyZFdVOHFaVC9DSnl0am1v?=
 =?utf-8?B?OCtYOXM3d1NuSkZoOGRBRlQzN3VSQThjdlpSdEg1bkJReXp2M0kvaG1xcU4v?=
 =?utf-8?B?VkQvanp6SlNCbjJwOW9rdXpkd3lCWFVrQVBWUHJuLzNBVFdTaUx1ZHVQSEpD?=
 =?utf-8?B?TW5zZVByWU82VVd5WGt3dGZLRUJzL2R3cy80aGhyQlFabVpvM25PMldPVlU1?=
 =?utf-8?B?KzJuRzBMNStEN3cxQ2MramY3Sm1rK1VTN01YSjVJYmJReXhjK3JWT0NWYUNw?=
 =?utf-8?B?S21yTnNMT2U5RUJMaGdKaXA5WXZ4NnQ5RmtUTUw1V3pBa2wvSkx4d2NBSjhn?=
 =?utf-8?B?a2ZoNG9YbllpZGliNjlpbGc1M3dBTjd1OU5lRDJpYWFyZVZwR29USitlUHNa?=
 =?utf-8?B?QVJmUklGNkhRN1BGRy9mZWFURU1vRkNIUTRNcEN5R2Y1dXBHbitmMkFUbGRm?=
 =?utf-8?B?LzBVaExNMWpsa1ZkRFNVMGRIUE9hVjJXckh5Y1VMMyt1b0ZTVEJBdmRQL0oy?=
 =?utf-8?B?aFdndjZpdVlzTFpDNEJFUFRTYUFsaVM5VWlLRlYxU2RCNVgzblNZR0Y5c3VM?=
 =?utf-8?B?RFJrKytIUnlWL1B2K0d2Q0tkSDRITWVyRUVlQUl3c0xYZktSSngrK2xtUHcy?=
 =?utf-8?B?UWt3TE9zK1Era29KK0ptd0xtbWVRSFByNkN0R2lmWlE0WnNMK0xVc0FsOEd5?=
 =?utf-8?B?WlA3dlZ3SEh4eWVuWTh6YStNRGRIdzZqVythZVN6T2ZKSGhZQzZYVnIzYmw2?=
 =?utf-8?B?Z2k1LzRKVGdOazNJSHRIa3pIb2c3bmNQd2NQa3E3YXRnVGtxNmRTbzQ1MFkv?=
 =?utf-8?B?TjNQQ0ZYS29QaG1MK2N0V2tSWGZVNEtjd0VXUkZLc2FvQ0wxa20zRWlmOWdN?=
 =?utf-8?B?a1ZmUEhmVXNMT0h6RGhiaU0yM0JvMnFjS1o5Zk1uS3dNb28rV2Z3bFVtczJ3?=
 =?utf-8?B?ME40ZnRyOUUyTHEyNEJNRkRBSmMyZjRPM09lUlhCRjJoV0dmOXBKeHo4ZXhZ?=
 =?utf-8?B?R2NTOHY0dWJONW5CYWJ5bVQvQVMxK0hybXFvUUlXZU5BME1zUEppMHZhN3k2?=
 =?utf-8?B?aTFKa28rbjJhc1NUWnpML2x4Nm9FMlMxekxWN3BKU3FYV3RSN1o3NStqMUEz?=
 =?utf-8?B?d01HQnQyTVM1dHU4a2lzUncwU2h1bFdIVzdVSlp0bjV2N1dxWjViNkt3YXhw?=
 =?utf-8?B?SVVVTWpkODdJQ2lqdXBwa0ovd20rVzZoamphZjE5UTZwWVMyMTFBekJWa09y?=
 =?utf-8?B?a0dRU2FVamtwRUxzRGtETlBPbkJ6aU1aZUI4c3hxYlFDMnExdFRIZkZBNmdt?=
 =?utf-8?B?dVJIMWdoVXp2c2lLNTRJa0VDOXBXaDYreXVKNGFJMVBWbnIzd2Q3RmI1Tm5T?=
 =?utf-8?B?dDZGQTU1eVk0eGppU0RGTnNXR0Uwa01qTEppVTJpdEJ6VU9acitUc1lUN3l2?=
 =?utf-8?B?RS9uN2NodHo1TVUxbmdnT0UvWmFMeTA4LzBVazFlL2l2QzB5S1JIVnl5MzhX?=
 =?utf-8?B?akxGMllFcjBwZEYrWGhiVXFJdzZCVHgrOW1xY0U2aFdJSzNJd1ZlaHAxSG1t?=
 =?utf-8?B?Rk9rWEtqQ1Z3VVgrVTduWGtNNUhkdnlMU1dCWHhGM0crMEdRZkkrWWdGL0p1?=
 =?utf-8?B?dHZJSTFzaUhJOWZ5aHhqa1hOcjVieGNuOGtOWGsyazVtUUF6K0V2U1NJNXBI?=
 =?utf-8?B?Qk54TlRrTUNuWkh2bWZqY2F5b2ZCdFZxMlE3VUVDU21iWjJMMEtYU05WOVhS?=
 =?utf-8?B?dEtlMmJXa2JWWlJneTdOeUVPQmQwa08yaDdtQjFiZ2VvUUZwS3FUbTA1TTA3?=
 =?utf-8?B?QWc1eU5xZzl4V0VabnowNElNNTAzNkd1SWRLZkJ3OHhyRmdMMWg5cWZ3Yktp?=
 =?utf-8?B?VGdhZ2dyZHExY0lCTjVhdFl3ZEZkMHc1YjFCdjlrK0dJSDFJZGNRKzU3OUlQ?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eace240b-35c9-4953-2000-08ddfce5a0f7
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:15:33.6687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PU3+se7ul9288LSFPBXUmpB+COnRQ40KgYEoEOFfr+S9AksWGDF/EV9IAK59TVRi+JzcsEb0w3nYpqP2k04tIFSPWNNbielt9+9w0JROJzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11091



On 26.09.25 09:37, Jan Beulich wrote:
> On 25.09.2025 21:56, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> According to the commit b66e28226dd9 ("x86/mem_sharing: gate enabling on
>> cpu_has_vmx") the Xen memory sharing support is only possible on platforms
>> with "Intel VT-x" (INTEL_VMX=y) enabled.
>> The same commit is also added runtime check for "cpu_has_vmx" in
>> mem_sharing_control() which blocks access to XENMEM_sharing_ops if
>> !cpu_has_vmx.
>>
>> Hence add dependency from INTEL_VMX for MEM_SHARING Kconfig option.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> You should have Cc-ed Tamas, for being the maintainer of mem-sharing.

Sorry, I relied on add_maintainers.pl script.

> 
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -79,5 +79,6 @@ config MEM_PAGING
>>   
>>   config MEM_SHARING
>>   	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>> +	depends on INTEL_VMX
>>   
>>   endif
> 
> Wouldn't this want accompanying by replacing the cpu_has_vmx in
> mem_sharing_control() with using_vmx()? The gain in this case may not
> be very high, but it would serve a doc purpose.

There are no benefits. if !INTEL_VMX the whole module will excluded from build,
if INTEL_VMX - it will end up calling "cpu_has_vmx".

What, potentially, might make sense is to move mem sharing code to HVM
x86/mm/mem_sharing.c -> x86/x86/hvm/mm/mem_sharing.c

As it is strictly HVM specific. Just is potential TODO item.

-- 
Best regards,
-grygorii


