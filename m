Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C7CF7ED0
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 11:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196010.1513881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4mF-0006vJ-9q; Tue, 06 Jan 2026 10:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196010.1513881; Tue, 06 Jan 2026 10:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd4mF-0006sP-71; Tue, 06 Jan 2026 10:59:03 +0000
Received: by outflank-mailman (input) for mailman id 1196010;
 Tue, 06 Jan 2026 10:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vd4mD-0006sJ-LJ
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 10:59:01 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3699dd6-eaee-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 11:58:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB8006.namprd03.prod.outlook.com (2603:10b6:208:4ee::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:58:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 10:58:55 +0000
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
X-Inumbo-ID: b3699dd6-eaee-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr5AoxmO6/PwWORAeWF/ypc+T0I86ca6pfYixY5IMPy6wafagrBaXpC20st1PFTLJ12UkSocs9y4FzKXGEOhRgptZzQgkl6Sv5nwV2APoErtXI9SfD9CWXYSJxDhfe45Lp12qHJWsZyQykeV9vtKvfHWk8dRmR/9LkizBWO1hk5Pz26uTL+m6qMu0v8IAJA3bQo6u7GSbwmzZBSlX3EwtbQ1Ye0vw6X3UY3ZYzfaUPicfpeLbBSCPnjQJfa8cHT295gApRcrTDJ7KnZRxesPOG3lMoCLnwxi8yPW1Lf3rr3iejuSiTSnazCZhCTON1MHJR8HfvUVX2hJCqoDSurORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26l3ZTOJrrzdLT8AAIkQDwGgWRD9N4s7dh3yPy7iVWo=;
 b=HzN9TwpNCFyJcA6KnbsusbKoQzxVdk0fVviiPYx8/xShgTP/HlFfDxwRmlCBNamyXBZypaIfCEhRI0Bj+5GB2IVGZJChhF/SRgbcaGE3HZN8Hc9pIrMFU089p9nrrvQY2tWcg85Yn3Yog0ueHeOPyGEX0fmqBtNSdPA45wn3j7DzIflspZyOhdQWYTE+nNjeqsksT06K1Nx64BCv4XRH3Zj5udd5u2FAe0zhQhkxoZMm5+Q9EG3GrrJPaVljMZgqFcTFL2FshT9c6EdYUDI70dKfmOmMcj31Ffyiabs49bv9ryT5BKtaYEdcqwoEAV92wSc7PTBHkyFFfx5Gq5L0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26l3ZTOJrrzdLT8AAIkQDwGgWRD9N4s7dh3yPy7iVWo=;
 b=O63RvtuOFJbk7psFOfKYtlJj57mCBbOLrsE7VK2ELivm3jkt193KOtHfRvgmvyETA0obiaut3fLOhPfow9aA6PNq9f335AZCq9bmSX+rH7AHivdFSAsiyyHImTYf4oigzov7drdevERolMu99alJxB3jRpWxJLPnYzzmzMhMHYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5ae32738-9fef-4ba6-a53c-0f665e536eba@citrix.com>
Date: Tue, 6 Jan 2026 10:58:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Drop xenoprofile support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
 <724e78ef-b6ed-40db-a5c0-bd6473b6fe16@gmail.com>
 <8561e1dd-492b-4d51-bf10-0a4523c941a8@suse.com>
 <10a38a49-c19a-4bca-8616-1490c3ef6a57@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <10a38a49-c19a-4bca-8616-1490c3ef6a57@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e33b79b-b5ba-4a33-de76-08de4d1295bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YmxCaHF3Z3dsMkN6MTg3TnFIWFZPU2NaK1l3TDlTY3Ewb1p6dmxnVDdQL1lt?=
 =?utf-8?B?Ti85QXBMUUxTeGVVOWdYUTZIam1ONGQ4UzdWV1JxTTZCbkZYQXBMM1hCZDlP?=
 =?utf-8?B?ZSthVFNuTUp5UWx5REdkYmJBUEtSdk5zNFZmU2YwdHBiQWhZdTNua0Jibkxs?=
 =?utf-8?B?VE9pVFNvUnRIVkRheXNDQWpMWElncUxWYlpHQVdWZWRkMUdjL0ZwM2ljR0FZ?=
 =?utf-8?B?WUZRaWJtMFV0RWZqUnhZTS9MZWF4UVhCNWJTeEY5RDFPWVVQaFFBeFl6d0VL?=
 =?utf-8?B?aUV0T1BnZlRqbTA5OFJERlFDdElUUWJuNExrRUJCK2c4dkwxWXNIa0JJaTl0?=
 =?utf-8?B?SWZ5NTRDVnFhMG5udWc1K3NhZitYRG91SnFmMHVKU2hXaEQ0cHlBM3d2N3cy?=
 =?utf-8?B?RHdpU2JONy9KQllaRHZlVGM3MVRoZ0NSUjEwaTl2eXhaWTA1eEQvZWVSUUFw?=
 =?utf-8?B?WUtZRTZxaENHWDZFaHhwbzBuTFVqYXRFSEhxQ2RwY3lnVUZCVnd4K214MXN3?=
 =?utf-8?B?Vk5adzVHS3F2emFSRTljVUxHb0FHZXJvSk5zWUwyMys2bzFZWnRqZTdBcXgr?=
 =?utf-8?B?OXVXcHpQd2lPa3ZRaDFjU2huekxOeDJjMG55WXdOSGdad2tXV2RSM3Z4Tmow?=
 =?utf-8?B?SGRnenlBTTlNVWhRMUI2VlIyN253Z0I2aUQrbTlFL2pibDloOFlUNVI0bmtI?=
 =?utf-8?B?ajZQNWhpeWRIVjVTM0x0MEdsbDFXRFFFMHlOcW5nVjBod0tsdk5LdHdNTVI0?=
 =?utf-8?B?ejdQcUtTSG1pWncwQXgrQTVZVjJFOG1qZFVnbnZrZ3ZabEpCSnI0U0lDVHFR?=
 =?utf-8?B?WlAxek9BTms2Qk9iQnVSUGtzYldXOEdFSXYvRGQ4bW5kQkFKcnlGRG0xeVZs?=
 =?utf-8?B?cFpjc3hZRFlYUWU3a0RZaDdjLytqcGI1VFNuVlFhY0VtM1BwQ3VybDlKbVJB?=
 =?utf-8?B?TFJsSmsxWGk5VStEVVZTTDVjSjcrZGMvMmxoNG1PRitCdkRCdGNBZ25CNWdZ?=
 =?utf-8?B?cHBteUF6bWtmT2JtY3NsZERYQ25Ed0NIMHd3RjZ1Uk9uNUVIUlVGVi90QmE5?=
 =?utf-8?B?OERtWU5YeFdnR3JlY2dEWG9ZV0dUTlE1SUt1aVhzengvMUsyK0p3djkydXg1?=
 =?utf-8?B?Q3k2WkZoOE55YThsUzIxWXhPdDRYMXRoZ3lZemJ5ZzQyNUFjUWFmKzBoOC9W?=
 =?utf-8?B?OFNDQkhZUVA2UXVBR1FVVWNDS00wcEtja1EyRTAzbVRtRkxHRWw3VnMyMXZu?=
 =?utf-8?B?MXovcFlwdGJOOEJJNXBtdllDK1NWb1IzMlc0Ukloa21mU3MwWGxwbVVhWk9L?=
 =?utf-8?B?bTV5a3JoRlBhWnZkeUhPOTZWNkdpWWZYMW5Pb3pLaktuRERJQWw0YnFBWjdq?=
 =?utf-8?B?ZG91UHhMaEtianM2ejN1ZDM0WjBaV3VsL2JTNUxvVEdqWWF2KzBIcEl4MGo1?=
 =?utf-8?B?WDFEbmZDaXN5UEMzbTkrM2xmbUhlMmpXTk4rMmFNeHlzcUM1WEphMmVqVmFm?=
 =?utf-8?B?Szdud1Zmd1VPYnZBQlVzT0s4Rkd0clFvRytubG9BNk5UaWdwOWV3R0svb2x2?=
 =?utf-8?B?UlNuSXRxSFE3V3laNUN6ZTkwc0RzaWlmRDFUVjh5VVVsQWhCSmhEOERtZXVo?=
 =?utf-8?B?U29rdGRBV3dvcWhZTVBFUTFiWGhwcVNBR3NFN1JmNVJTU3VyNXpnYVNqS1lh?=
 =?utf-8?B?bTJOaFZhR1RRY1k4QlhYY2xsNDZpOWY1S0tWRlhhWlh1SzdIQjBaYmZsdk9p?=
 =?utf-8?B?a0RaVkovcmlsaXNPcEx4enhETmZtNzdmenhrTkVFVG9lUWZlK2lQelRKTXRD?=
 =?utf-8?B?VzI2SmF0SHk1cWZLWC9TQUFpR2I3VDJtWlZZNXJmSWFaNnZDNU9IL2l5NWtP?=
 =?utf-8?B?dDdqY3FTRnBoRkF1Z2FxblgzSEdFbHJ3anNVM3Z3bXhwbVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0lLZHliMnVKV2tRd0lHOXc1c2xDYitxckd5amRIbk5nb01aUkxwN0R2TlBm?=
 =?utf-8?B?ZUNyRHZiaThiMVBVQ1c3ZDhDK2xzdFgrbmNERFVFTzlpNUJJWmd5S3h4Wngy?=
 =?utf-8?B?VFp3Snd3SlpuWE1PREJJTmc4eHBwWFRCRzJxeFdWSGdiUTVUNXFVYzdib29p?=
 =?utf-8?B?ZEhMZEhzdUE5T2ZPMUdxTUtSQ1Vpbm9uSHhRRjh4dFNIdHFPcGxXVjQzeGxJ?=
 =?utf-8?B?ZDdwQUZhOTN2MjAwRUJuR2k0Tmc5c2JxNXJwQ0FVd1E4ZFBWa1I0cFkwSW5j?=
 =?utf-8?B?VEN5THdvSHNhbXhQZlVNeEFBcWJPaFBiMlhLUGcxU2ExRGkzeWEyZUZHKzhv?=
 =?utf-8?B?TlREL2k0WklheUpHY0lwSFN2RDczOW5nRTROYjl3UTRROGRKRFV0M3puUUFY?=
 =?utf-8?B?VWJLeWRmaFdyZVREdENXbkdaSnRSY21vN0FGemk4N05DV1pmbk4rTzFSenBG?=
 =?utf-8?B?L0x3ZHptS244NzN1WC9sTGYzWGFwNGhJYXpmTUs2NHEzMnhFYmh4NmdQTDhh?=
 =?utf-8?B?Ly9qNi9waE5pWE9rNDFXZ1ZWTUl4TjZmNzF0dUdqOGswK05KbVdmUk1wa2dP?=
 =?utf-8?B?T1FpNDgzM1h0NWV6Z2FpV01GNXJEUFV6UjFPUVdaN1dxY0h6YUg0RTdVNkRN?=
 =?utf-8?B?T2VZMDNOSXU5TFREMy9jdlRGMHlCZFAveHNzdnNONWIxelE2ejRkSGtmeHhW?=
 =?utf-8?B?RHdMa3QyU0lMcFVIQmthQkprTTcwWkhCZTFQRituc05RNS9ybm15ZjZxTWsv?=
 =?utf-8?B?d000N0lqVWtUZDRUd3RrYlM4bmJPTjkvcVdEM09WVkRzUC9Cd1BUbVhJKzJX?=
 =?utf-8?B?SWsySUNOWTU3Z0w1NzJJZjJkV0FCenQ4cHd6VkduV0phV3BLK0U5dVp6ZGdm?=
 =?utf-8?B?Mk94UVFBMlZ4b05STlB1cWtLVGh5aDhGOTB0RWgzYm1xeGJnUDVwNXhiLytj?=
 =?utf-8?B?ZTlmMzVUY0pRNFhndWV0WWZJV2dxTUZudjFQZzVSMXdsL3BYc1YyZHJ4em9J?=
 =?utf-8?B?Nm84VUR5eXB3NXVuaERPMEN3dmpKVU9SM2E5YS8yWHN3eVJzdXIwdklZNnJH?=
 =?utf-8?B?SDZwS2tvdnhkbnZJamRud0JFSnhUN08xUm5ZSkhmQTJ2Q0Z0UG55aWxtRVNV?=
 =?utf-8?B?ODZBMENGWjJqWFRhVWI4Mk02VVV5L0Rnb1JLWkN2RDRuTktKM0hKcW5wUC85?=
 =?utf-8?B?d25wdzBod1ZOa0tqMnVwRmVQNWR5amtiZVE5NDlwQVpPOXB3b28xR0lzUE0r?=
 =?utf-8?B?VWtsV2lrdDJ3bXM0dHFzbEl1MGtlK3NYbEtVL08wdk9xVDlmb0FHQnJKVGg1?=
 =?utf-8?B?NEFvNlVRSFhBTSt5ZjFkMVhoOU5OZ2NhdXpLR3M4R3JpODB2Q1haV2o5Zi9v?=
 =?utf-8?B?WnJnR3dDYU54SnFYbThlbjlKMFBMNXZOTlY0TlBHbHVrMmN1Mm16MXo3V1VH?=
 =?utf-8?B?M2ZwZ2tMTHJxbVVSOHNKNWxFUnplYUFOYjJGdmc4V2dJTUNRK2IxRHFFVCs3?=
 =?utf-8?B?WFIzZ3hsZHJiZGx2WFIxSUVkSmdLbjRISWIvMUNuMDQ1czNNNWZEbWRGdVVa?=
 =?utf-8?B?bHdvRU9HbUF4ZWtYYzFCTEJ0WHZKTjE0WExhTWRVUXBSQW9kRGx2RTlaajFm?=
 =?utf-8?B?ekVSNUErWThEWUNCWHJNdEUzZmRINEpqVTdGNWd6MGFMa2Ztd3gxK0RxVnZJ?=
 =?utf-8?B?ZHAxcE5lejJlNVlLUTUvbEY0aUFIbGw3MkpEbVJOM0p3UEV3UlplV3ZBWW1j?=
 =?utf-8?B?bmtwbEhQd0JyeERFOGhyNnhZajB6UHdkLzV4Q0Qvb01lcGtRS3FnSG1MSDYz?=
 =?utf-8?B?eWVaQVNLOWhnQXAvNzhxREZKdGFHa2l5cklTL3JCMzVEdm14QksyTmlDMWYv?=
 =?utf-8?B?L21IQmNPODdRbWtOUi9NbUNNYitQeUcrZjYxd01LdXg4dlExeUZPZjJpdnlD?=
 =?utf-8?B?QnNtcno5bmx6MGpYVnRGekd2OXk2alY5UVBva3NNWVgwak5EeG1YbWx2TWVO?=
 =?utf-8?B?Y25EQWppTjJGVTZIZFpNMTd4alJXVStoN2NGaDdzbk01S1dYejJvWG90aFht?=
 =?utf-8?B?emVKYmhGaGsrU2l3eG1pemVsOEtVOVJrMjBMR0NVRWk5M0RmSW50am9CUUl2?=
 =?utf-8?B?dmZmekltOS9oZXlWTHhnZVBzVzU4Q3pDcE5FTjBMN3lzNVRQMHovR3UxQTBt?=
 =?utf-8?B?WS93dlg5UmltdndEM2VKRnBvMUdPUmh3MmFWTFA5KzBKbTVId0k4TkR4SXV0?=
 =?utf-8?B?TUl1b3FOVGcxN2F3NjY5cld1MGJzTDR6OXl3dVduc0ZQVjl2UTE3UDVvcGtL?=
 =?utf-8?B?Uk9ydXJBbGptN2J2WkVvZ1lCTkJMbXRiZXBINnlYdjJrNENFdTZrWkpkY2J6?=
 =?utf-8?Q?PU05qzwCAuYaWLlI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e33b79b-b5ba-4a33-de76-08de4d1295bd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:58:55.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+wBDqINGQ6DaeAl66MQGFASV7h7JZm7PjFZObSY1PvSRh3kAlI8sM3MUSnZNxtJ5U/Qv+8cIAMEV1AvY9jXfyRxJTdMspZ7hmIJjtfrNAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB8006

On 06/01/2026 9:37 am, Oleksii Kurochko wrote:
>
> On 1/6/26 9:53 AM, Jan Beulich wrote:
>> On 06.01.2026 09:43, Oleksii Kurochko wrote:
>>> On 1/5/26 8:57 PM, Andrew Cooper wrote:
>>>> The most recent xenoprof change was 300ef0cb4fde ("x86: Add
>>>> Xenoprofile
>>>> support for AMD Family16h") in 2013, despite there being 42 changes
>>>> worth of
>>>> other cleanup/rearranging since then.
>>>>
>>>> Oprofile themselves dropped Xen support in commit 0c142c3a096d
>>>> ("Remove
>>>> opcontrol and the GUI and processor models dependent on it") in
>>>> 2014, as part
>>>> of releasing version 1.0 and switching over to using operf based on
>>>> the Linux
>>>> perf_event subsystem.  Linux's version of this patch was merged in
>>>> commit
>>>> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
>>>>
>>>> Drop xenoprof and all supporting infrastructure, including the
>>>> hypercall, the
>>>> XSM hook and flask vectors which lose their only caller, and even
>>>> shrinks
>>>> struct domain by one pointer which wasn't properly excluded in
>>>> !CONFIG_XENOPROF builds.
>>>>
>>>> Retain the public xenoprof.h header as it is ABI, but note that the
>>>> functionality is removed.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>>> CC: Michal Orzel <michal.orzel@amd.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Julien Grall <julien@xen.org>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>>
>>>> Despite appearing to be architecture neutral, the internals of
>>>> Xenoprof were
>>>> entirely x86-specific.  Another curiosity is that only the VMX MSR
>>>> hooks
>>>> called passive_domain_do_{rd,wr}msr(), and I can't see how this was
>>>> correct
>>>> for SVM.
>>>>
>>>> The real reason for finally getting around to this is the number of
>>>> MISRA
>>>> violations reported by the eclair-x86_64-allcode job that I don't
>>>> feel like
>>>> fixing.
>>>> ---
>>>>    CHANGELOG.md                            |   3 +
>>>>    docs/misc/xen-command-line.pandoc       |   6 -
>>>>    tools/flask/policy/modules/dom0.te      |   2 -
>>>>    xen/arch/x86/Makefile                   |   1 -
>>>>    xen/arch/x86/cpu/vpmu_amd.c             |   7 -
>>>>    xen/arch/x86/cpu/vpmu_intel.c           |   6 -
>>>>    xen/arch/x86/hvm/svm/entry.S            |   1 -
>>>>    xen/arch/x86/hvm/svm/svm.c              |   2 -
>>>>    xen/arch/x86/hvm/vmx/vmx.c              |   9 -
>>>>    xen/arch/x86/include/asm/xenoprof.h     |  95 ---
>>>>    xen/arch/x86/oprofile/Makefile          |   6 -
>>>>    xen/arch/x86/oprofile/backtrace.c       | 145 ----
>>>>    xen/arch/x86/oprofile/nmi_int.c         | 485 ------------
>>>>    xen/arch/x86/oprofile/op_counter.h      |  41 -
>>>>    xen/arch/x86/oprofile/op_model_athlon.c | 547 -------------
>>>>    xen/arch/x86/oprofile/op_model_p4.c     | 721 -----------------
>>>>    xen/arch/x86/oprofile/op_model_ppro.c   | 348 ---------
>>>>    xen/arch/x86/oprofile/op_x86_model.h    |  58 --
>>>>    xen/arch/x86/oprofile/xenoprof.c        | 106 ---
>>>>    xen/arch/x86/traps.c                    |   4 -
>>>>    xen/common/Kconfig                      |  11 -
>>>>    xen/common/Makefile                     |   1 -
>>>>    xen/common/compat/xenoprof.c            |  42 -
>>>>    xen/common/domain.c                     |   6 -
>>>>    xen/common/xenoprof.c                   | 977
>>>> ------------------------
>>>>    xen/include/Makefile                    |   1 -
>>>>    xen/include/hypercall-defs.c            |   6 -
>>>>    xen/include/public/xen.h                |   2 +-
>>>>    xen/include/public/xenoprof.h           |   2 +-
>>>>    xen/include/xen/sched.h                 |   3 -
>>>>    xen/include/xen/xenoprof.h              |  49 --
>>>>    xen/include/xsm/dummy.h                 |   7 -
>>>>    xen/include/xsm/xsm.h                   |   7 -
>>>>    xen/xsm/dummy.c                         |   2 -
>>>>    xen/xsm/flask/hooks.c                   |  35 -
>>>>    xen/xsm/flask/policy/access_vectors     |   4 -
>>>>    36 files changed, 5 insertions(+), 3743 deletions(-)
>>>>    delete mode 100644 xen/arch/x86/include/asm/xenoprof.h
>>>>    delete mode 100644 xen/arch/x86/oprofile/Makefile
>>>>    delete mode 100644 xen/arch/x86/oprofile/backtrace.c
>>>>    delete mode 100644 xen/arch/x86/oprofile/nmi_int.c
>>>>    delete mode 100644 xen/arch/x86/oprofile/op_counter.h
>>>>    delete mode 100644 xen/arch/x86/oprofile/op_model_athlon.c
>>>>    delete mode 100644 xen/arch/x86/oprofile/op_model_p4.c
>>>>    delete mode 100644 xen/arch/x86/oprofile/op_model_ppro.c
>>>>    delete mode 100644 xen/arch/x86/oprofile/op_x86_model.h
>>>>    delete mode 100644 xen/arch/x86/oprofile/xenoprof.c
>>>>    delete mode 100644 xen/common/compat/xenoprof.c
>>>>    delete mode 100644 xen/common/xenoprof.c
>>>>    delete mode 100644 xen/include/xen/xenoprof.h
>>>>
>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>> index 3aaf5986231c..1663f6878ef2 100644
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -15,6 +15,9 @@ The format is based on [Keep a
>>>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>       - The cpuid_mask_* command line options for legacy AMD CPUs. 
>>>> These were
>>>>         deprecated in Xen 4.7 and noted not to work correctly with
>>>> AMD CPUs from
>>>>         2011 onwards.
>>>> +   - Xenoprofile support.  Oprofile themselves removed support for
>>>> Xen in 2014
>>>> +     prior to the version 1.0 release, and there has been no
>>>> development since
>>>> +     before then in Xen.
>>> LGTM:
>>> Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md
>>>
>>> Nit: It is necessary to drop the extra space before "  Oprofile
>>> themselves...".
>> Why would that be? See the other bullet point in context, which also
>> uses a
>> two blanks after the inner full stop. This is deliberate.
>
> I just missed that a similar case was mentioned above. If this is
> deliberate,
> then I’m fine with it. It’s just not obvious (at least, for me) where
> it’s
> acceptable and where it isn’t to have extra spaces.

The hunk looks correct in
https://lore.kernel.org/xen-devel/20260105195717.601500-1-andrew.cooper3@citrix.com/T/#u

It's only your reply
https://lore.kernel.org/xen-devel/724e78ef-b6ed-40db-a5c0-bd6473b6fe16@gmail.com/
where it looks to have whitespace problems, so I suspect that will be a
local MUA problem.

~Andrew

