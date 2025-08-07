Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8AB1DD14
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073324.1436295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Ox-0000dI-EI; Thu, 07 Aug 2025 18:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073324.1436295; Thu, 07 Aug 2025 18:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Ox-0000ck-A6; Thu, 07 Aug 2025 18:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1073324;
 Thu, 07 Aug 2025 16:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3u8-00073q-1E
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:55:48 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d133ed2-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:55:46 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:55:44 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:55:44 +0000
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
X-Inumbo-ID: 5d133ed2-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1B9aUjeSW81eRL76e91fjpYwCyFKE8E+wVvBTCkkOF27S2D5u104WKlB+b5rdOfuWc0P1rBKXrWebmzJGGbLF8xiMLVfmqmHhn6ViVYh7CYUpxdLneCOL64Rblixme5/MNFPvYg5cfqkLEoAiSovE0yQYFxVnt33gCgdBVWOpmlksKn/XF22XhIPkCr1LcTVU/xqeopaV6r+IH44Uypl/CkfJitxeWsYYZfHRJBfSIIHhEHz3iXqqRNRgLUJ30xdZpy53x+0sDJfCv2KbeuGnUVHOYKFYuJ1bnJ0C36opLTS/pR2xh03kTV89pdqMWgmxeqmEvGE7A5pfea45Va1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztXQRdBq5/xIoulB1DpAIj1IW5SpeQp22L/j7ir9SBQ=;
 b=EUHT42F1OGC47q1jy6tH+wuvnYtSw+tKGx67ADiBr5AUENlzWl3TQPbboyh6BzZK/7Gg7ZQYLXkeZDSkT0NhEROm33XQkKUBd7R5lMUQgQLN53BX5gy+BM1C2ND0iKnqkuU0CdkkHXfdoYi7u1lQhYYfCuNbRRVfbvOWjdz+VAJ2ddmKC+wOAmqVDQ4YEg71rRcI7jmkVnuX+Nfoou89Rl5I9U0YA6GkAZT0jARJmdVa5f6vLReyeL6duKuvYqR6i5pYmftruPhFaRzuu4haZZvZEFDRQJpaV0aE6GZyY/xzjlJGzMx6BbyivZslYG3twGRf4YpybyYYMpx0doFmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztXQRdBq5/xIoulB1DpAIj1IW5SpeQp22L/j7ir9SBQ=;
 b=keqNsVm+h+ZKKdsbBIL5TKHHTe93Jl75dO2alNfYLCmkfOH4/ItSfCvcyZ0SBK71XuFs/M2uueTdN6Zfgi9g4z72Shl9fvsV1cVMY76XcjC/aPkEMON4D0krCZGI1V8R2qTpCdj0XCEujB7pcjGV/URz27THdS/Yp/OtbCs6qjt88oDO7Y5kJJEirg0PZJchmtxXdU4J5cnY6En7QWweam4nPJaT+ge143LFnAOtVuXLAc1KBFnmglPPEgtA8FFK5E5lMHHBycBxyA/OQ2JEV+RkG6MhdbgDOp6jEVfKojD1XC0IaxK1evCRxYoSfy55JoeeAuX846QqMb9sIpRrSw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Nick
 Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>, Juergen
 Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Topic: [PATCH 00/20] Add SMMUv3 Stage 1 Support for XEN guests
Thread-Index: AQHcB7wdmg15F24Gc0ClRsxpCVedRA==
Date: Thu, 7 Aug 2025 16:55:44 +0000
Message-ID: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 37fde6cf-ed8e-4272-4b22-08ddd5d33ff8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UG5YVzZnMTRHSzFzQXBqN3VDVWFQS01TWm5LT0FSNkROTjZxY1daVXdTT3F1?=
 =?utf-8?B?ak5kdWxSTWRmZVF6cW9xVXRhNGxQQWFSMi9vYnoxY2NZVHhJT1FnZzgwalF1?=
 =?utf-8?B?NjltNUdFc2VxYUM5czV1QmwwQzM0ajNVSnFoR0ZSaWtnWWpPalJaUWdFMGpu?=
 =?utf-8?B?UlNDR21XbzBxRitrc255Y3hqRm81YVFna2ZadnFOTnpQd21qbG1QeEhnVnpB?=
 =?utf-8?B?cXJLOWRkTE1iOW5mblU2S2VtdVNUY25FTENYQ3IxcGhjUlY4TU5PKzA3OHdp?=
 =?utf-8?B?L3FWRVl5Y3RzdmVoUHM0ZWNUN0FqbzhtVmF3S01LTXp3SHNVZUlydGFXNmxH?=
 =?utf-8?B?dHVpeUtaWjhpZWxSU096SVJLSm9DTFJZdzg1OUFhU1FUYjkzOVQ4L01RbEg1?=
 =?utf-8?B?TkcyeDliZkd0WFlOK0ZkQlNWOXJSRmd2Ty9DYW1xWjlja21pbWpjNXE2bklN?=
 =?utf-8?B?dUxGaGhRSHJ4bUwxZk5qMDUzRDJLWHBvZG9McHFleExzbEJ6by9BY21QN2ZV?=
 =?utf-8?B?OWh4UjBhdXpXSUpVcHBVclpIV05aV0lNdDgxbFMySnlrL2pCYU04ckF3Rmdr?=
 =?utf-8?B?a3NUOGhpU3J3aVY1aGJKN1pCYkJ6Qk5mOHdoWGFLU1VDK1BvSjhGYnNvMy9q?=
 =?utf-8?B?MHRpOW81MERuMDg5Q2xkZXdjU1NRUGpJb3VJWDVuMFZ5Rk5PZGZ2YkQzdVB5?=
 =?utf-8?B?L0FkQm84OHc3ZkpxU003S1U1UDY1aDdrSWx2a241K0laQjdOZGFpWkNHQzI1?=
 =?utf-8?B?eTVQZXJmL2NIUWFuNTRlRERkcU1jR002R0lQT0UvTzhWakQwNEhjWXJxU2ZF?=
 =?utf-8?B?UG5TTmdHMC83dFR5dU9yMkpqcjgrWWlZbHdCdCtTTmlqR1BjWFg3VWhKa2dR?=
 =?utf-8?B?R21pRHNzNkRvbVVDUGRQMkNocWl2NGFIQ2dGZllOQkZGSlR5dlBMU0JRU1Jm?=
 =?utf-8?B?MXBqY3NjM1BkTm5TL01OMUV6KzB0eUFEcVB2anNxaGhjSkppbGh0a0UyWnNt?=
 =?utf-8?B?T3FPZ0dNUCtaM2pCd1hHallaMmxRbCtzbEM1eUUwL1ExK0V6R0FJSnE3T0NF?=
 =?utf-8?B?LzVLTW9Wa1NqSjY5SWpXUmdDdkdEK2lXejJiemlDSklSUGN6NEFmdTFpOEtr?=
 =?utf-8?B?clk5WWdtelQ1U0t2Qm9pY3QvcC9UZFR3WnJVdmFjVmU0bzk3VVIxbTFLKzYv?=
 =?utf-8?B?aXdHcExUVENGZ3lvT3ppOUFzbzQwdEhQV3psWWl6NmI4M3VFb0Z4a2wvMFVJ?=
 =?utf-8?B?K2VKY2dCbElDSW9DVHZ1QVBpU1Q1NklkMGNhZGVpaXdhRXJnNHM3OGtqeXFU?=
 =?utf-8?B?VHZsc1luM1RQa3UycUhVSjJlZ1haUHVOYisvWWh1NytuOCt4cDhYdlJVSW1E?=
 =?utf-8?B?a25XaGZZVTVYQ1c5blEvQUJucy9ua1owOUl6d3hPUXlrYzFmVkhHY1Yxdkoy?=
 =?utf-8?B?VmxNbjZCcHVYSUdJN2I2c1JyZXhSTUU0ZGtKdjc1YmZHYU1wVm5iUEpOdG9r?=
 =?utf-8?B?RXZCUHYvQnpDV2JTYzJIM1hqc2JNOHNWZFdFTFdjekVxYUJMZE9lMjhyblk4?=
 =?utf-8?B?OUZ2cU0wYlpyYmcyaklSNy9tT0I5cHFKdHcvN3Jidzh3M1Jlc2RqU1BIdGRw?=
 =?utf-8?B?VVpKVzVta3EyTUxualpkTWh6MkY4MjgwK3NaUDVjaXJFdk5jM1c1WUkwd0V2?=
 =?utf-8?B?NTk3OUxaQ1hHWWpzcHRIa2FmUEM1V3lvQU1hMisyVHRlSHhHZ3AzSXZrQlZr?=
 =?utf-8?B?ZWs0WWdQZVhOVWdkRzZXaHQrZHltS2hZVmVyWlNhb2dib0x5WG02ODRCTitJ?=
 =?utf-8?B?aGVmNW5XRDNYbmMxb1JIZThPZ1V1SU0vQ043M3NCeGk4Vno5RVpuYkVqOHB0?=
 =?utf-8?B?QWpzUVNoNEdzekMvTG0yWjJUanlXUGpaOG5YTW5JNHQ3UmdLc3FxbjVwZktZ?=
 =?utf-8?B?R2wwNDd1dFZlWTBnUXlXd0xveGRNQkxUVXA1SXZYaWlXSUI2REx2cE81ZEFC?=
 =?utf-8?Q?XUwo2a6FG50+f7yU2h2nrCiV3wa0Y0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QXVCRzVkZE51OWNRTEhFL0lPd0RaSktCWXhxbnh6RHlQQ1dWd3p6ZDMxOVhx?=
 =?utf-8?B?UlFmaVU1eTZQSXRndytwdjFpSXRkSmo4OFFHa3BBY2J1bEVJZHhDbnFRNHJu?=
 =?utf-8?B?UzhsRk1ITEg1ZlQyL2UrcnBXWkVDMWxUY1hDamovK3RrdWVEcHR3ejRIUjJ3?=
 =?utf-8?B?TTZUd05kZ2daTEcvV0tCcE81WmJvTVJkQ2MrUUIxSFFVYzlDK3NWQ3dSNW5C?=
 =?utf-8?B?NmFJY0R2bzNrMWtxNXc2Nk56cm1xZVc1ZjBuVnRlSkpCaENKVnd1RmhCWDk4?=
 =?utf-8?B?aWVBOVpaZXlnZm91NXJhSnNqR3NVc2hqNjZBYlpWNzNqTDYzWm5IL09tT0dp?=
 =?utf-8?B?OS92K2dBVDhlUDNmaTl6K0dFcW92UjFYRUpPcjJ3TEt4SUNPRDNlc3dEY0hC?=
 =?utf-8?B?NUhURkFKWS9KbTdFV2h1QWRsTHY1SnVTRTFwcWhSOStqeVZ6R0Q3Q05UaHVx?=
 =?utf-8?B?ZEp3WVp2QW03Vm9FS2k5WlBLckdmc3VKVGZmdzJIa0pNV1BmdHpVcFBtME90?=
 =?utf-8?B?RWJXVEtYaldJdkNUWENRNGgxN1hSRDBGOFN4MFNhTGhSWTBIeWhraEQzaTJ5?=
 =?utf-8?B?bklCMTRwQkc4TDFXemRyMTN3TWhRTW11aDEzMUhrODBWZXJKQjEwVFYyS3Rl?=
 =?utf-8?B?cnRzcjY1Wk5MTWtqSDdXNXN0OXU0ZjB0Vk9XRVpWQko3ckNhRWNZaXRyRVlV?=
 =?utf-8?B?T1hOY2ZhNEhSUmJlaU5YR3laK1g1ZE9OcEhSVG1LZnVhUVZGTEpOb2FRd0FP?=
 =?utf-8?B?eVh1VGMrTTFvdjQ1bFFSWXpZUzFVOVB6N00ySFlHemE2U2Qrcmx5K25jZEo1?=
 =?utf-8?B?TlFyOFNDTDZ2RDdNZGdCTmNJMGViK081akc2bFZCQ0RJbjlsR09YcTJBOEtQ?=
 =?utf-8?B?S3NmOGJIWjlsRE96dlZjSFcvTENEN2dicDZMODIxY215QjZDbzduZEpXVVhm?=
 =?utf-8?B?V0FXVFZlbHM3c293cTBWRXF1NERVN1hPTkFqRlNtcExZcjZINFhFVlpjajVW?=
 =?utf-8?B?MWU1UFYvSEEzRGZqb3JmUmh0QVU5eHZNR3ZhM2svN1dnQ0RMV2x3TmZLYldZ?=
 =?utf-8?B?ZEo1dEJKMXlvcWF1dFJVSGNuK2lTYmtVcDhGbURzd2QycnFsbXdEc05TUGNX?=
 =?utf-8?B?VHlaSjhBOEVCcVhJblBoSXNXRFZrckZnNjY5ZGpyMXNWM2tDOElva3NNTU5M?=
 =?utf-8?B?NUJFU0tVQ2xYVnpsRldkc1JSMTljTS9zZjMzMk51TlZYdTNRaTVFTHpQYlVT?=
 =?utf-8?B?TlJGOG5MK2YyZm5HZmpJUGU3S3BaMmxkZkRqVnpJdGErMUx4bEYyU1l6QXd2?=
 =?utf-8?B?RGZZbDN0K1lta1l1Slg4a01NbGFMZWZmY3BsdG82Rm5JN2NnRExhSFUyV00w?=
 =?utf-8?B?cjU5WWNwcmFYQU5rRDgvWEtGeFhidEx4S0xMMjMvbU5lUDdHaE9rU3BWeDZs?=
 =?utf-8?B?alZPbTRNWlNXd3lSQkFISDNLY3lvaW1uVXlwMFhjcUdZQUoyaUpYcDBzTlFY?=
 =?utf-8?B?VWRkV2JpUTcwMFNVLzNZZUY3dUEzRCthSXZEL2FzWDZaVDNPbGo2b2xoMTdj?=
 =?utf-8?B?K0dFLzg1WVdqOThhaGJIWU13aW9TeDVjb0xOUk1WRnp2TC90d210SjJMdjhD?=
 =?utf-8?B?YW9qUmN5cjRvT0dIWWlQeXpkR2tISi9Tb0RRdVk1NGJpYjZnUHBsK0g4U09X?=
 =?utf-8?B?UHd5cDg3WXk0WFRQSFdIcDlKbUVHTm5pbDlKS0VDRTU2ckYyeituc2VpRkxW?=
 =?utf-8?B?Mk5WVUp5cS95MWtQR2I1MWR6TS9lSjN4UnRsRm5WREJOUmd3TkNtVGVRZmVD?=
 =?utf-8?B?UEdGQjRjK2ZYeHJpbnFJYTJZd1dwVkdWd3BTc1QyTUlEa0g3REhJeW5oY3JU?=
 =?utf-8?B?MjFMRUpFQ2F6dVVlSzNkQmhsOVZGUnZ5UGVpdXVhYWU3NDROQjVYVVNSUnJ5?=
 =?utf-8?B?RlF6T21NeGNqMFArSzBmTmdDN0J6U3kwODZXS0tBci9BeGhvbXMvZlJRakxC?=
 =?utf-8?B?bzVVKzE3bWtobldHOG9wZThxUTVUNEplVXhVNFN3cFlOUjFjeEhoWjJYWldm?=
 =?utf-8?B?VEFqMU9HL3IvL2czMkVUQkkrWGtKV0FoT09zbzl0STFPZUVtSitaU0U5eWVa?=
 =?utf-8?Q?OvU8iD8z5vrOBfgGc1uvS1h09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD23E2052339E645986CD34D9F7A0CBA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fde6cf-ed8e-4272-4b22-08ddd5d33ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:55:44.4086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGfn0QRSyubO2xgfssrMlug5W6ChPcpI+USsyhxHBvqO5M+mG/dfpL3dU1dxwR0xm3cWyIVFyyQgqjpLXy+Dfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

VGhpcyBwYXRjaCBzZXJpZXMgcmVwcmVzZW50cyBhIHJlYmFzZSBvZiBhbiBvbGRlciBwYXRjaCBz
ZXJpZXMgaW1wbGVtZW50ZWQgYW5kDQpzdW1iaXR0ZWQgYnkgUmFodWwgU2luZ2ggYXMgYW4gUkZD
OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL2NvdmVyL2Nv
dmVyLjE2Njk4ODg1MjIuZ2l0LnJhaHVsLnNpbmdoQGFybS5jb20vLg0KT3JpZ2luYWwgcGF0Y2gg
c2VyaWVzIGNvbnRlbnQgaXMgYWxpZ25lZCB3aXRoIHRoZSBsYXRlc3QgeGVuIHN0cnVjdHVyZSBp
biB0ZXJtcyBvZiBjb21tb24vYXJjaC1zcGVjaWZpYyBjb2RlIHN0cnVjdHVyaW5nLiANClNvbWUg
bWlub3IgYnVnZml4ZXMgYXJlIGFsc28gYXBwbGllZDoNCi0gU2FuaXR5IGNoZWNrcyAvIGVycm9y
IGhhbmRsaW5nDQotIE5vbi1wY2kgZGV2aWNlcyBzdXBwb3J0IGZvciBlbXVsYXRlZCBpb21tdQ0K
DQpPdmVyYWxsIGRlc2NyaXB0aW9uIG9mIHN0YWdlLTEgc3VwcG9ydCBpcyBhdmFpbGFibGUgaW4g
dGhlIG9yaWdpbmFsDQpwYXRjaCBzZXJpZXMgY292ZXIgbGV0dGVyLiBPcmlnaW5hbCBjb21taXRz
IHN0cnVjdHVyZSB3aXRoIGRldGFpbGVkIGV4cGxhbmF0aW9uIGZvciBlYWNoIGNvbW1pdA0KZnVu
Y3Rpb25hbGl0eSBpcyBtYWludGFpbmVkLg0KDQpQYXRjaCBzZXJpZXMgdGVzdGluZyBpcyBwZXJm
b3JtZWQgaW4gcWVtdSBhcm0gZW52aXJvbm1lbnQuIEFkZGl0aW9uYWxseSwNCnN0YWdlLTEgdHJh
bnNsYXRpb24gZm9yIG5vbi1wY2kgZGV2aWNlcyBpcyB2ZXJpZmllZCBvbiBhIFJlbmVzYXMgcGxh
dGZvcm0uDQoNCkplYW4tUGhpbGlwcGUgQnJ1Y2tlciAoMSk6DQogIHhlbi9hcm06IHNtbXV2Mzog
TWFpbnRhaW4gYSBTSUQtPmRldmljZSBzdHJ1Y3R1cmUNCg0KUmFodWwgU2luZ2ggKDE5KToNCiAg
eGVuL2FybTogc21tdXYzOiBBZGQgc3VwcG9ydCBmb3Igc3RhZ2UtMSBhbmQgbmVzdGVkIHN0YWdl
IHRyYW5zbGF0aW9uDQogIHhlbi9hcm06IHNtbXV2MzogQWxsb2MgaW9fZG9tYWluIGZvciBlYWNo
IGRldmljZQ0KICB4ZW4vYXJtOiB2SU9NTVU6IGFkZCBnZW5lcmljIHZJT01NVSBmcmFtZXdvcmsN
CiAgeGVuL2FybTogdnNtbXV2MzogQWRkIGR1bW15IHN1cHBvcnQgZm9yIHZpcnR1YWwgU01NVXYz
IGZvciBndWVzdHMNCiAgeGVuL2RvbWN0bDogQWRkIFhFTl9ET01DVExfQ09ORklHX1ZJT01NVV8q
IGFuZCB2aW9tbXUgY29uZmlnIHBhcmFtDQogIHhlbi9hcm06IHZJT01NVTogQWRkIGNtZGxpbmUg
Ym9vdCBvcHRpb24gInZpb21tdSA9IDxib29sZWFuPiINCiAgeGVuL2FybTogdnNtbXV2MzogQWRk
IHN1cHBvcnQgZm9yIHJlZ2lzdGVycyBlbXVsYXRpb24NCiAgeGVuL2FybTogdnNtbXV2MzogQWRk
IHN1cHBvcnQgZm9yIGNtZHF1ZXVlIGhhbmRsaW5nDQogIHhlbi9hcm06IHZzbW11djM6IEFkZCBz
dXBwb3J0IGZvciBjb21tYW5kIENNRF9DRkdJX1NURQ0KICB4ZW4vYXJtOiB2c21tdXYzOiBBdHRh
Y2ggU3RhZ2UtMSBjb25maWd1cmF0aW9uIHRvIFNNTVV2MyBoYXJkd2FyZQ0KICB4ZW4vYXJtOiB2
c21tdXYzOiBBZGQgc3VwcG9ydCBmb3IgZXZlbnQgcXVldWUgYW5kIGdsb2JhbCBlcnJvcg0KICB4
ZW4vYXJtOiB2c21tdXYzOiBBZGQgImlvbW11cyIgcHJvcGVydHkgbm9kZSBmb3IgZG9tMCBkZXZp
Y2VzDQogIHhlbi9hcm06IHZJT01NVTogSU9NTVUgZGV2aWNlIHRyZWUgbm9kZSBmb3IgZG9tMA0K
ICB4ZW4vYXJtOiB2c21tdXYzOiBFbXVsYXRlZCBTTU1VdjMgZGV2aWNlIHRyZWUgbm9kZSBmb3Ig
ZG9tMGxlc3MNCiAgYXJtL2xpYnhsOiB2c21tdXYzOiBFbXVsYXRlZCBTTU1VdjMgZGV2aWNlIHRy
ZWUgbm9kZSBpbiBsaWJ4bA0KICB4ZW4vYXJtOiB2c21tdXYzOiBBbGxvYyB2aXJxIGZvciB2aXJ0
dWFsIFNNTVV2Mw0KICB4ZW4vYXJtOiB2c21tdXYzOiBBZGQgc3VwcG9ydCB0byBzZW5kIHN0YWdl
LTEgZXZlbnQgdG8gZ3Vlc3QNCiAgbGlieGwvYXJtOiB2SU9NTVU6IE1vZGlmeSB0aGUgcGFydGlh
bCBkZXZpY2UgdHJlZSBmb3IgaW9tbXVzDQogIHhlbi9hcm06IHZJT01NVTogTW9kaWZ5IHRoZSBw
YXJ0aWFsIGRldmljZSB0cmVlIGZvciBkb20wbGVzcw0KDQogZG9jcy9tYW4veGwuY2ZnLjUucG9k
LmluICAgICAgICAgICAgICAgIHwgIDEzICsNCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5w
YW5kb2MgICAgICAgfCAgIDcgKw0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5n
byAgICB8ICAgMiArDQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbyAgICAgIHwg
ICAxICsNCiB0b29scy9pbmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICAgICAgfCAgIDUgKw0K
IHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgICAgICAgICAgICB8IDEyMyArKystDQogdG9v
bHMvbGlicy9saWdodC9saWJ4bF90eXBlcy5pZGwgICAgICAgIHwgICA2ICsNCiB0b29scy94bC94
bF9wYXJzZS5jICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKw0KIHhlbi9hcmNoL2FybS9kb20w
bGVzcy1idWlsZC5jICAgICAgICAgICB8ICA3MiArKw0KIHhlbi9hcmNoL2FybS9kb21haW4uYyAg
ICAgICAgICAgICAgICAgICB8ICAyNiArDQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAg
ICAgICAgICAgIHwgMTAzICsrLQ0KIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaCAg
ICAgICB8ICAgNCArDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zpb21tdS5oICAgICAgIHwg
MTAyICsrKw0KIHhlbi9jb21tb24vZGV2aWNlLXRyZWUvZG9tMGxlc3MtYnVpbGQuYyB8ICAzMSAr
LQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcgICAgICAgICB8ICAxNCArDQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlICAgIHwgICAyICsNCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jICAgfCAzNjkgKysrKysrKysrLQ0KIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmggICB8ICA0OSArLQ0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS92aW9tbXUuYyAgICB8ICA4NyArKysNCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hcm0vdnNtbXUtdjMuYyAgfCA4OTUgKysrKysrKysrKysrKysrKysrKysrKysrDQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3ZzbW11LXYzLmggIHwgIDMyICsNCiB4ZW4vaW5jbHVk
ZS9wdWJsaWMvYXJjaC1hcm0uaCAgICAgICAgICAgfCAgMTQgKy0NCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvZGV2aWNlX3RyZWVfZGVmcy5oICAgfCAgIDEgKw0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5o
ICAgICAgICAgICAgICAgICB8ICAxNCArDQogMjQgZmlsZXMgY2hhbmdlZCwgMTkzNSBpbnNlcnRp
b25zKCspLCA0NyBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL3Zpb21tdS5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FybS92aW9tbXUuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuaA0KDQotLSANCjIuNDMuMA0K

