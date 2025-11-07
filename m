Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CB0C3F653
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 11:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157461.1486228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHJaO-0003C1-CV; Fri, 07 Nov 2025 10:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157461.1486228; Fri, 07 Nov 2025 10:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHJaO-0003AH-9f; Fri, 07 Nov 2025 10:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1157461;
 Fri, 07 Nov 2025 10:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qRNH=5P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vHJaM-0003AB-R8
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 10:20:50 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb19e66-bbc3-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 11:20:49 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9124.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 10:20:46 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 10:20:46 +0000
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
X-Inumbo-ID: 6eb19e66-bbc3-11f0-9d17-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unq6TPvezPS4OYjjjNDH0Jb6ESJf8qzlZbShbIbAGVSfRy/scmfNBruBNkgBHho0VXfqz3HwfjtIUK2KXzBHguHyRSAH9pGJhHWGhMOugwmKGBZrSkVoAhBfG60ITJcQNMtO6Qj4OUDI8kN1tPHfPH87WB6NAMLB7d7PXrt296v4w7Ff2UuUBZSi4Fbg3QWubxpYNKOiZTPYeZAcf9cYp0u7M8cE5+yawQr/r12ItPN9LSTPsdDO0epGcLhR7Znvu3K/n9KdzUQ/yQl5mgqRJR4uzsoWCE+HlNI6J3XJsNCjwkhKyIT9wjRRo5SAD2hMZCbzhLJS/rr2J19HRxcAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ArRui7xmU0Fi7LEisehBujPu4Ubs2/KCh502Cj/GlU=;
 b=WyoSl4pgcnlA599wLn9kmGxWfLmfysSLeEkjzor06QyT2sBqgtDdlcRUUgv/hirjiWY8I/6WJD75KiWksWHt2I9Tmbbc0JGQkJn1WZqK7FvQStLuxcq1C6umcOnCIObo0P8kmMSwgTtvrHcIigYIIiNTUyR+mpm/yzQza9b1y106jLuRKlKKtyeA6QQOZFok20ZNmjcaiqXsc+ei715xJvRfSHnBmTXSauQ9VZPdcVQLrvcGPbMOYC2jeS6/l3SqybR+nA7AECOHYQo/vXHDWptlXi2PWo69uwNVoNm89xwWYFAtmKroVZPRXOuG6doxnHwW2VhKkhAFC8TnrwXWpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ArRui7xmU0Fi7LEisehBujPu4Ubs2/KCh502Cj/GlU=;
 b=DXHFpkEkGoae4pTy0HfpIzgWrgdMK92aqYhlcrvyOvrQxNZuQ2gsePD72etVu/TdSH+keEn9TW0YGD2nEYXFbax94IAeFvMpzVUziGnzrOKG8SthvgOtxCpMzYn6lgzL5ZG16vIGJYoVhgXb4U0ajXO4U9/r1/KQg/wxrzBjp+AZioAK+0Ezk0MgNHrnqO8Apy9GbMncTjyKvGrItFEbQlyyfLzBB1MgbUxxLMF//MMjDA330tmCRXt+1VFBMH4BYsJepapNr5eneOVbHjBd66QsuvvhecPpaca4zEVm3m9XrRkBHzLbSilzcl2TT4QpNpvHU2Zr4TJm/Q/ECgcQrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <e12a6c0e-fbc1-48c4-b1f2-daaecbc3c6b8@epam.com>
Date: Fri, 7 Nov 2025 12:20:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20251106222630.2777457-1-grygorii_strashko@epam.com>
 <0dd91607-6df5-4be8-a92a-c3046542748c@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0dd91607-6df5-4be8-a92a-c3046542748c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0279.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::11) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS2PR03MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 610fb602-f637-4ad1-da94-08de1de75097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXVGcVQzK2FXb3RDR0hwOUUwMFN2N1R1a2NObi9EUGZ1aXErbGg1c2hQcmRj?=
 =?utf-8?B?UDRkNFE4U29LaTdjT0JSVVBldGkybTdaSlBjR2FpWmRFdDVDUm9xRThiU1p1?=
 =?utf-8?B?LzdZL2s1U05PQVY3SENnRXdicGdSOHQwL3F0RjBtcmFwL21PT2hPbnpiejEr?=
 =?utf-8?B?MXVhQnFPYWMyY1pWTHR5ckIzUEV0aWhJdXBLaFRSNjJLS0xTWFRHdXIrN1FV?=
 =?utf-8?B?R2IvZkszamJwY0JBY2ZUQ3FsV3NwYUJEc0IvNkU4NW1JWTFXZC9XeHFvd1JF?=
 =?utf-8?B?V1dGU05ZcVJDT1VESlJRcmNHcUxTV2pYdDg5ZVVZNDZjM1lOWm0xUVEwZDJB?=
 =?utf-8?B?aHAwajVrOVU2SnV1ZDhxLzBRdVIyMElQY2I5d2JpUHFEZy9YcmZwbHJWNTF2?=
 =?utf-8?B?WDhpLzQzQ0c1Y0NMc1huVTJld1VEVHNkc1YrTFJUdTJhQ2FBSEsrM0wyd2s0?=
 =?utf-8?B?Vk9ySkdFMXE5SjRxbTJzTkxGRnlsYUQwZ2grSC82N0VUY0tMR0g3Tyt2SkhS?=
 =?utf-8?B?c1cwbWFZWnZPVHhaYWRxdVVQdmJRRUVySk5HM0FKVE1mbWpjcXY2cnJhcU9v?=
 =?utf-8?B?Ty9nZXNGNE5nakd3YUZoVFpGcXlyRGNseEFKZTVRM05kc0RuMHd6OHpTTk9F?=
 =?utf-8?B?cVJBam0zWGhQUnFhbTRDR3R2NWduSGpobmw4ckRHRGRsdUtJajlXMGVjbEs1?=
 =?utf-8?B?cDhEZnlKU3RFa3NZTC82bE83MW9RREQ5RjMwVy9OZTVVMEZ4SFo2SE5SYW9k?=
 =?utf-8?B?QzJ5RnV5eENnN3RVV09PUWk4UXlZWk1YYXRVcGJaWXlPdjljMzBFZjJqZ1VF?=
 =?utf-8?B?VWN5MVB1QUo1UFZFUm1aSzJZRy9OYnR6eXdLZkViWklZQnRrMlZmMk1pSTF4?=
 =?utf-8?B?NGwwL0lqT2l5dndxQ25oZjUycUh5R043ZXZLT1ZncFZwc0xOMGtDbEdCNjI1?=
 =?utf-8?B?TXg4cHN0aXVWMFpEOGF0ZklGejlFdFJQb0lBSERUQ1hwcnZlNTdVbjJkYkNK?=
 =?utf-8?B?dU1SancveUJDTHRoSkFmSGhHSVVqQVdZc21qNkZxekV4K3k4UUsyRlFiQW5C?=
 =?utf-8?B?SDYrWUZYcFVXMGN2UHZETm5GVVRDVjFCQloyMWtYU01lZ0o1TmRVMjJiUFZk?=
 =?utf-8?B?WmsyejJyQW02Z0RNeFNxb3F3d2lENCtFbGdiQkN5RlJnc0pOaldaRmdlUU5W?=
 =?utf-8?B?TmlGY1kzWnRwWFdvSDI2bkRkTXNJTUswM2wzQ0tvc1BvdERkSEpFMjcrc3Iw?=
 =?utf-8?B?UE9JTTlKUkdVemRvM0gvM0RwYjlXM2Z2enV6ZFQrK0JDeFhab1dLeUQ1dGM4?=
 =?utf-8?B?VnJJZ0hvNzdhaUduV0Joclk0K3hOcDJVd1F3c1pveU9VTTFHd0ZIQkVPNnVO?=
 =?utf-8?B?N2xVVlJibFU5RGJZSHpuQzM0dEszT1NwOXZEN2hOdE1PK2E2bkFGbzB2SkJV?=
 =?utf-8?B?bjdUWWxMM1ozdjVVdklId3hLS1hBKzJrb05CWHczdnFYNW91YnZqUnJrOGJP?=
 =?utf-8?B?c29DWjZhSS9oU3RVcC9iM0tuSlRkSDZIVWkyUmtUN3F5bThWTlJTSlFFY1dn?=
 =?utf-8?B?YW16bUpjS0JLazJZMzhDSVZJOGRTbzhZdXJVRGljMkFSMnVaV1VJVUVjV25R?=
 =?utf-8?B?TU9iVnFvTDE4UHVuVDMwcnFBUk9XZHVsa3NUZ2wvM3pLdE5sak43NjQ2dU05?=
 =?utf-8?B?ZU1YMUxFMUx1UHE4VFJmNlNQY3FOdk1GNEFPREwwaWNLVW9QK1hBdkhSYmRk?=
 =?utf-8?B?WEVpaDZKR0NndTgxNXQzT2RoeHBnbUNlUjJhU3dYUUlDWXY3WVAxZHNsQ0xu?=
 =?utf-8?B?SXpWQmpncENKUVEyd2VoOGllVWJ5SXFHZUUxOWNtcmExVklvZC96NUd2K05W?=
 =?utf-8?B?S21qYTJONmQ5L2srK3NqOUZWNlhQWGZ6cnhtSUkvcTJtdkpJWG1TTUo5ZHc0?=
 =?utf-8?Q?cN/UT6QwBwanKpPP/OEXPQWM14QvMaD/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm5LNHhxMEFmSVVsdTJzdDY3am9TbzVUZ0wyUUVOcUZZb2xDZGoxOTRkQXNX?=
 =?utf-8?B?Ni8rbGtKVVFIV3VrWXFleG0rQXRMY09pVXZGMU1rbEdrU0F3NXdsSEUzOGJE?=
 =?utf-8?B?WkZTOVZvREovY1hkMDJrZjdPNnI0RUZDeFNPUUJtZlNjVUJvSGEybEpQSkFp?=
 =?utf-8?B?OFd2Yi8wTFo4NGx6aGFQTHBIMHc5bWdZV0MwekFjajRrOWhaUWI4MnVMR00y?=
 =?utf-8?B?MXgwNXQ4ZTdRLzE1dE5qZ0wzN2gzQmNhdnN4cU5ab1UrUktQNGdaYmJvUzlC?=
 =?utf-8?B?U0tTbURQMVdRZ0dpQ3QreTMwcHJJNnNJUnBBK3dacVZIUzFNa0xKOU12YUlx?=
 =?utf-8?B?cWYzdGh4dFc3MFZhSC9zNFVFd3VaQ1MxQTk1cUNINnhQNU5EaEV5bWxFVGd5?=
 =?utf-8?B?SkNpR2dZT0tWQ3lDSFRXa2NnVzBKbStjNFAzc1g4bStWUXo1WGZ4OXZ5RXFF?=
 =?utf-8?B?OWg0ZnpCSVNWMXBwZ2IrQ25CZi8xZnBFK2ltRzZNSFVibXc0bWJGSUc0ckRF?=
 =?utf-8?B?Z05WNVJSUkJ0Wk8zQ1hRNEpaYkZBRU5rYnhqM2VVOU9ySmdTejJKckFJSjZp?=
 =?utf-8?B?WnJMb2lkZytOWHE1TFMvWlpnUXZJS2EwQS9hNHVpajhack5IZ2krYmJKdHIv?=
 =?utf-8?B?dUVpNGhCT0dPWnFNQ2RObjc5alF1cDRiVnVwTml3WGtubGNVdnFKbkRVRm82?=
 =?utf-8?B?WWtja0Y2bFhTbzVYWGNSd0NiRW5ZMkw1UFY5WkM2NUNqSDhTMWljVCtucDJO?=
 =?utf-8?B?UUFYWnVKR2djK3U2ejJKNHM5VjJ1WXBjZzc0RjB2Zk1pdjlCRnB4U3VoaENT?=
 =?utf-8?B?NFIxZmxOd2pWTHF2dHB0R1NIQWJUb2hwK3MzZ1lMQndnTExCTlRvY1hLL3Ro?=
 =?utf-8?B?aXRqbWxBYW15MlVuVnNyNWEyWk9pUVBsdGpJUGVQSVlmTjRwOW4vMkJadEU1?=
 =?utf-8?B?ZDh4dm1vYjl2Rk5Nb0VwQ0dXUkpibDRHVmZyalVYTHUvQ0Z2ZnEwY1lUWkVH?=
 =?utf-8?B?U3d0S2VaOXJhV3pOVUlGdUVhL21BbGdWT25xTmI4QWp6OURac1kyQ2Zlbjdq?=
 =?utf-8?B?VUJTSHFFSkNxRXNoNGpNMTVMK0ptV3hoUWQ4dm9JeG1jUG41OVlZci8wVkN6?=
 =?utf-8?B?eDZLR251QVEzelgvWVM0dWhnL0FCbzBaRThFUGVYaUxZWWlkT2xzUktwTnR0?=
 =?utf-8?B?Q2Y2dmxuUXZqelRjaVJSajE2VmtES2xHYzVOdVdITXAwU3RWbXVra2VWL3pU?=
 =?utf-8?B?bzZIWFQ3dmd1QUtEQTJtazNqdG5FcHlMakQyTzRFNU14T0ZYZFZEbEs1Z1FO?=
 =?utf-8?B?QXpvenZEQ2JSOWl4T21naUFrbC9WUGl5akc2QysrVUUzSlhTY3dUY1JkTWpC?=
 =?utf-8?B?R2xxczV5YXMyS3VrOW5Da094R25VUFJpVTY3eGNTdzBOOEVpbmluVGdVeXdL?=
 =?utf-8?B?OVdPSUx3SmUwcXpXZ3hmaEViNWZuNUpONmJ2b0I4UmFBYjIvbFVSWWh5UDdx?=
 =?utf-8?B?TWpSOVR2MUxuMWEyVkY2L1dkVnoxN0g4dDY1UkxwajkzbzNER0pOWmtYcm81?=
 =?utf-8?B?N2ZjR2piMHdkeGZFWEcveG9Zd0xKM2p4RHRsbHJDYXhmWEFyTS92ZWhGQWs0?=
 =?utf-8?B?dW9qdkRFTkw1d041YnFhY25nOXduMit0ZHNVQTBuU0VPMHRNV0JGVnJVdVRw?=
 =?utf-8?B?NzBZQ3RYS1FhY2dSbWpvRHVtV0RuNnZ3cEpqTEI0K2tNaEdPNDNSRldOVUU1?=
 =?utf-8?B?bE52U0NrbS9VY1V1NUhMN0g5YUcrWXF0NURTMVphem1DYzIzU2dBTXpZNnBZ?=
 =?utf-8?B?Q0VyWlFzL0MwY2s3MjZnQXVUZkpOcHE1K3ZuWEdaRkJzZkJQL1BXaWFrNHpY?=
 =?utf-8?B?YWFyaFdQZ2dub3VnSjhjamU3bkNreW45cVE2Mkw2VFZNbmk0aXVMdm11eVNQ?=
 =?utf-8?B?MzE0VFJiaG5tallOakRwd3dvSzNHdWxUTDhlU2xoVTdDc3dtMkxzSXpJUDQ3?=
 =?utf-8?B?S05LWjBXbDRIQ0ZqSkhIYkJteGpMcnhKZTVmWG4xNFJpWFdiUVdDMkRGTSth?=
 =?utf-8?B?STVWU3cxV0lQM3ZQdGd5NEFNbHJRZERJNW44NkZDWDRGSUpXZUl2SThiTVov?=
 =?utf-8?B?WHZWVEVZSUpGelVGSXNWVnBNRlNMa3BXWDdhdkZ4UEZOUElDOGllUVoxS28x?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610fb602-f637-4ad1-da94-08de1de75097
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 10:20:46.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trAbLmEV5Kh+DTe8RQsL857GPR0gdHWUz5ntOzdDppQsmBqLRzU++4l+iJ8Ia8DBO6NC34JU1MRukaloW0SgMUw9Pek6mKbrpQ6avsxJFxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9124



On 07.11.25 08:52, Jan Beulich wrote:
> On 06.11.2025 23:26, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Xen uses below pattern for raw_x_guest() functions:
>>
>> define raw_copy_to_guest(dst, src, len)        \
>>      (is_hvm_vcpu(current) ?                     \
>>       copy_to_user_hvm((dst), (src), (len)) :    \
>>       copy_to_guest_pv(dst, src, len))
>>
>> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
>> - PV=y and HVM=y
>>    Proper guest access function is selected depending on domain type.
>> - PV=y and HVM=n
>>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>>    and compiler will optimize code and skip HVM specific part.
>> - PV=n and HVM=y
>>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>>    No PV specific code will be optimized by compiler.
>> - PV=n and HVM=n
>>    No guests should possible. The code will still follow PV path.
>>
>> Rework raw_x_guest() code to use static inline functions which account for
>> above PV/HVM possible configurations with main intention to optimize code
>> for (PV=n and HVM=y) case.
>>
>> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
>> guests should be possible in this case, which means no access to guest
>> memory should ever happen).
>>
>> Finally build arch/x86/usercopy.c only for PV=y.
>>
>> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>>    add/remove: 2/9 grow/shrink: 2/90 up/down: 1678/-32560 (-30882)
>>    Total: Before=1937092, After=1906210, chg -1.59%
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> [teddy.astie@vates.tech: Suggested to use static inline functions vs macro combinations]
>> Suggested-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Just one formal request for now: Please send patches To: the list, with individuals
> on Cc: as necessary.

Sure, sorry.

-- 
Best regards,
-grygorii


