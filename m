Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F52A6A0E2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 09:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921429.1325278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAr0-0003Hy-8K; Thu, 20 Mar 2025 08:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921429.1325278; Thu, 20 Mar 2025 08:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvAr0-0003Ez-4i; Thu, 20 Mar 2025 08:02:14 +0000
Received: by outflank-mailman (input) for mailman id 921429;
 Thu, 20 Mar 2025 08:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSLU=WH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tvAqy-0003Et-DA
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 08:02:12 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20606.outbound.protection.outlook.com
 [2a01:111:f403:2409::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f62211b-0561-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 09:02:10 +0100 (CET)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Thu, 20 Mar
 2025 08:02:06 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 08:02:06 +0000
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
X-Inumbo-ID: 9f62211b-0561-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9rGWCw+QQjBjiGRPtZPUodxl52ahCBYugRkxk63t2wB/wnFgF0twuDigAgqFVTDK3nlbStWUxcRqa7GdwPwvCLojrMDhLhr2qE/Xadw2PFXmMpaebEprQdGhrxiNsQ+wXGyaz+hsxp1PQz6vCaZqgUcAauaZCiDjaNGc+0pyn4MD7Wt1EuBBpecZ6s2UP/HQ4c2mtYF8u86cZACc/U7NZoPm4BnGvZK7I4q2W4ANyHireeV5Qyb1IaZoZBHhutwtJOE//+NclcRVy2cINtyhUY1DenswyHrLaC+8P8nqzesAQ/6Kx2UYgyjR783LZ77FGMMAEXyPkblAYs8Zl4InA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m/AZj2/PKzFjC6LtWPZqpowG/21vdhOrIi/odUM3VY=;
 b=H4yK/xi8Hwn0oryxxfMZ4mhr98ytzIPU/IRO3QXHU6B1eBy3u/NlnfxTMv1J/TitFA+TK4e7WlJjPaTuzzHp622yz/Di9GOr3r25qcKI1Ca94YxIaCaLnG3T+jYFHId/83qP0foZj5bEzn7pS7YSkigkxUgCxpQYm2ikWju+zbKPRwRr6Rov8Y1AFgvDPBgx110YR2yWf5BhRzOZf7MBdLrolDCuwVFmdxPAwmRICdfMx2D9vr1cYS/t32LX745T3hYOR20076S7qUiu0vvya4GjSVLMtZm0m81DaCz4y5riG5I9lFjgn09bFdOw/CegDm7KU8x4dNYbtyQWeiof7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m/AZj2/PKzFjC6LtWPZqpowG/21vdhOrIi/odUM3VY=;
 b=BxZXyiG3Jwa6VzP7TN/huTvTcvAy2HKFuoDNWeVbiacOyGxFS1MuN3EX7IgcaDJOfbrMcBbxNeIX4jAYHPKulYb+BjfRmQuVTaYx4B0htClQj7Xz2vFXQoqSq23U2w8tJn8dmxAR3cbWizUb0kVe84D8tLttSZjcEf7Xv5k48NE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: RE: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Thread-Topic: [PATCH v1 03/19] xen/sysctl: wrap around XEN_SYSCTL_readconsole
Thread-Index: AQHbkwQ4YtLwdtCzBUqbGFlzJHozTrNw+akAgAq7AVA=
Date: Thu, 20 Mar 2025 08:02:05 +0000
Message-ID:
 <IA1PR12MB8467691D93E223033398DCBCE1D82@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-4-Penny.Zheng@amd.com>
 <D8F4G80E0LHU.5GHN1ZVVNHYB@cloud.com>
In-Reply-To: <D8F4G80E0LHU.5GHN1ZVVNHYB@cloud.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e9adbf12-7c75-4df9-9e09-071175f508fb;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-20T08:01:58Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|SJ2PR12MB8134:EE_
x-ms-office365-filtering-correlation-id: e4d12a71-587f-40cf-18f6-08dd678581aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWFTeEtvSTJXL3doTWp6dm9lblBtRDVvRFhETitIemQ5OFZNZkZHUzUyM0g0?=
 =?utf-8?B?dW9KQ0d5VkVBckh0RHdoemphdmcxQ2pKUkRrZHdJcTR4VXRUVlc1aXJTMmlH?=
 =?utf-8?B?R0xZcWxRWjFiMU4xdDQyTVYxVXAvNGpzL0Rwbld6c3pxQjgzbys3Q1dCYVpH?=
 =?utf-8?B?bzFRTFE5MXdvWnpqZ2ZMR1RlS2p6NlBucnRyOFBMN1hhbG8wSUEyQXNQeC9L?=
 =?utf-8?B?OVZjTFZEMW05UFZ0TXVtQUF2TFhkdXhaYkYwdzFLS2tpRExQWEx4UWVyT3RD?=
 =?utf-8?B?SUFCdnlkUWU1MFFCa0VaZFNoZ243a2VOUXIxTldMeEpSN3l0cFBGaEhQem92?=
 =?utf-8?B?TUVFdXBDdGtaODY5anJmNnoxQS9wNCtmODI2RitRTytFbHQxMVAyd1RGL0xO?=
 =?utf-8?B?ZHd6eFJkUk9hWGN3eURZU0ZiQ1pvaU1OalNaNFRLR2V4L05GaVgyWnRNT0Uy?=
 =?utf-8?B?RGwvSHlqZGEwVnBGcTc5VzRQQXh6aVhwSTFmaSswVHlVSEI3TFJXWEw0aTVK?=
 =?utf-8?B?UXRvelJpL0VoSGJUVDBTMWdCTkF1SXhpS2ZZUmdBTmV3alhoVzIxVTBzaTZl?=
 =?utf-8?B?Z09Ed2p4TzNERDZVV2pSK05mUFl0REJ2ZExySVdqOU51Y3NpNDI1TzZWYy8x?=
 =?utf-8?B?aDNGd2FTN1Q1aHZ1RUN6Q1o3aVVaRm5pUzlJZUFtUm9xSlJmZ0lzQWFKQ3Er?=
 =?utf-8?B?dWFIaFNiQVhpditvSDJxMW5qa1Q1VExKV1NoaEtrUnlwMTZVK1Uxc1FBRkdD?=
 =?utf-8?B?U0ZrREhCUUVHZUdoOTA3MGJZSy80WFBoN1pQOFNUWmtleTFpS1RGTFBsZ05z?=
 =?utf-8?B?RTgxa3h1LzJFeXhqUmZSWHJzZ2g5NW9CaU9Ua0NyeSszb3JvcjFRR0N4aWU2?=
 =?utf-8?B?eXJVRHFpMndoSVo3WEU5WmNOaUZZcTdyZWp3aFQyMU1pUkxNRnEweXVUd3pn?=
 =?utf-8?B?T25lT3dsemlUcnhLODVSdW5pc3RsOTFIeWRHWGxlSzRRa1JPMU4rUzY1ejZn?=
 =?utf-8?B?TlZjYVBXUHRuM25GTUtjdksvSTQrTzhnNlR1RkNxZ2o4dVVVTk1TY3kvbURI?=
 =?utf-8?B?U3JjL2R0d3drbnI1TUdaWjZvK0x2cmJ5Tkp2WFlBZEx3Rm82OFh0SU1ORkhB?=
 =?utf-8?B?ZU5BczlVaG5kV0FXZVdKMGIrT0szUitNeWhuNFFaQlUwbUZ6R3JoL3pKZlNq?=
 =?utf-8?B?Zk5VSWhoRFlkanBETDFxWWdvSnB1eS8vWFZwQUgza3krcXJ5NEpjMlNHaGVo?=
 =?utf-8?B?MjBQWGRXakZreHNsR0I0L3ZnanZqVFdRSHVUZVpUb3grQTNWeFkrRmllUk9s?=
 =?utf-8?B?eHRVcmpxaGtEQkk5ZjVuK3BvOGhtSHJ4dUZFT21KV2dhRWkwaWJLWHFrK2xS?=
 =?utf-8?B?Tng5eWFDUXM3eHlxa3V3YVJNWmZmUFBVU2lVbWJzQXErZndnTmczUURYYURU?=
 =?utf-8?B?cGhvT3JJZ1ZyNUFkc0tTekNFY1MxQlRHTXBGb0J0VmY3VEZNWWZZVlErMGFn?=
 =?utf-8?B?aUpNRUJBUUlTT25vb3VTajVWVTI1OThuWnhCR1hTUkkraGFtK3lOUFc5dmY3?=
 =?utf-8?B?Ykx2NWpXQUFJKzRnMHB4SDBzVGxsYllZd1B6SHlsK1Y2aTMrYnRJMEdydVN5?=
 =?utf-8?B?V1gwWEtJWno1elREYXoxRERlcXM4elZ3UEM4Vnhub0dSNU9OcjhQSWNMRjdp?=
 =?utf-8?B?Um5BWWYxUzZkZmROQ3VKeUcvdDk1S0kxK0hBdzVFZGJoaWp4OUZzdEpYYmhN?=
 =?utf-8?B?aldITFhNZXRtTE45WGNUK1IvUit3eUdEZDFEQU5BSWcrK3NwdHBpRUhrRUVX?=
 =?utf-8?B?cEQvQS9PQ2k2OEt4WU5RWTFka05TTTFiTlhGMk13OEJtMTYyaWxOSE1TbGR6?=
 =?utf-8?B?RTFENllZZmtMbG8yUzVlb00wK1dMNkkwTkRQSVVuRUZwUzB3OGtrUW5zMDRx?=
 =?utf-8?Q?LEHMSZed6CYP3Bw/7OdRua54hgcaJZBJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eU1hNllLNTlRNThnK1g5YkVWN3Y5TGtxa3hFcHJ5blhhUk1SK0VpcE4xeHc3?=
 =?utf-8?B?Wk5pOHRiNFF3M25LV1pyQ3M2bjdnSm5wQkd6Ryt2ZzYxb0ZuM0lsYktoOVVE?=
 =?utf-8?B?eHIyWVl2aCtGWURBcDJrN0ZzeGNYdGFRYjlOWUpLYWdpcXIzUXRyRk0vaXRR?=
 =?utf-8?B?azYxL3FqKzQyclZsNXZNWVk1bEZNdWJWcmJvN1pUSUlUcXhTSzJHUHA1d1hM?=
 =?utf-8?B?Mm14MTd0OTE4RWphbHlrek4wM0hFTStPeStPRGlEODc3TS9xR0ZZV3UyeUQv?=
 =?utf-8?B?UXdKMXI5SUExWjZiREp3YjJvMy9zTkY5ZDRFZ2R4UElwSkhSczlmKytZaEtK?=
 =?utf-8?B?dCttNnc0c1RMTVE3TWFzejlzRGNLYzFHYUgvZ1ZZeEppWjJpcE9qNkxFTC9R?=
 =?utf-8?B?ZUI0Zi9KaEgweVNsc1NqaUZMZURucnJsdHpMdG05bnNRaWhNVUFVV1VXNDh6?=
 =?utf-8?B?eHFOU2dtempyZzY2aEloZ2ptT2E0eGkvVlMzYTkvZ1FNK1FubklTbFR2MDZu?=
 =?utf-8?B?WnNsMCtybzlEeUo2MlQvVEdyWjJEZnRPeDh1Mm5lRkZvNmpLWS92d3RvQS8v?=
 =?utf-8?B?aHN6S1llSFh3Q1gzbFI4cmIwdzExMVNiazdsYTJSOW0yVHRjNnhoSitJdVdJ?=
 =?utf-8?B?VGJ2UnFWV3k3UTZua1dUeU92ZEVyV1dSUEtRRzB5ODBITkJ2eVcyeEVFcG02?=
 =?utf-8?B?bFAwTWNvRzBPRmZHN2I1UlZ0R2orSEtlU2JUV203NnRBRzl4WG5tMjFHaVha?=
 =?utf-8?B?WktJenpvSzZRWXRiV2ZoR05yZU8zRVA4a01GTFB1akdCZ0hVeWtjd1M3NXZl?=
 =?utf-8?B?Q1AydGJMTW1sQTVTQmVISlBYZ001dmx5RWQyaE9IajZqT1NHUUNZNzMrRFRj?=
 =?utf-8?B?VmpGK2tlU3k1amVJVjV5bWx1TWIvWVdndUlsY2tkdS9rNllGOTFLbVJ6TUla?=
 =?utf-8?B?c3RGVjlpVHVGekZ4WVlyd1RhVU5sM2U5R0RncDFDNWtFcmdxeG1YOE5QVGlF?=
 =?utf-8?B?MXpmTHgvbVRNbzdNOWNrVVczTzgvbUZzT0RMRWJYTkVpd2VFSXpnOGluNjRs?=
 =?utf-8?B?OSsweTRRYmhUVWdUbDQ5VmdrQzVwSEpFMzlCL3htandmTDZwV1o3WEhrL2wr?=
 =?utf-8?B?eDZaRS9pR0hLL2FjTkRIcXowbnRmMVVOd1NXb2UxTkZhSmIrQk1DR01pNjNp?=
 =?utf-8?B?K0xOczVSRlFVdHM0VkEySXVIbEVnbVd1OHhTR2lNSUU3cUNjYUtOOGVmMHMx?=
 =?utf-8?B?Zk85RERxYzRKM1N1eGxxcGRQRU9Wbis0Nm80ZGY1emNhNEIweERDSmN0SjZG?=
 =?utf-8?B?bEJZYStBeUxIaXJmNU9UenkxbXFMemlqbU1mVXdBMm9CNGt5REJWUzg0TEFD?=
 =?utf-8?B?SzNyelg5TzdFTUdhVnJhS3lCdHdqdmFaMXd6VzRpSEVRNHJyVS9URnA2SHVB?=
 =?utf-8?B?ZU8xKzJ6YXFuWTZkZ1pMb1JLY0JOY1UyRlNRWlUyZjJhU216aDNlOUg0UnEr?=
 =?utf-8?B?M2tiY0d2ZDdrenpUSmZITzRkZHhQSHRjYlBONkdhZnRoakVRT2NlQXpTbHFO?=
 =?utf-8?B?TC81bUo3MDVTdnBJWjVvMUhKRldaTzFtUjFVbDhnallCVnZPYVNRZnp2NEUw?=
 =?utf-8?B?UkJMS1ZzOGFxcTBTNEk1ZTFEVUwxUE5LbHR2U2lHaktmUDZERjhwTCtPWXdn?=
 =?utf-8?B?SVR5alcvNjUzd05EdlJoR1AxUndkNEhDQm1jSnRCSFBNTzVzWFk5YVJLRTVl?=
 =?utf-8?B?bXhDYWoxUmJndDNvMzNiNDRDVGM4eWpTTHdTQndCR3dxWVB5OFBrUVgrQnVi?=
 =?utf-8?B?NkRnS0ljN1FCcHdPaVdTdVZma1JqVWJtMkM5OTRBWWxBMHR6bUUrcnhjVG5Y?=
 =?utf-8?B?Z1JBRENtN1BzRUJseFR5ZVFVM1FRNWRaSHFNeEErOUZkakhSV0JXUXREdEZa?=
 =?utf-8?B?WmZRb0hud1p0V2pQeElBaWVrN213YUZxQ2RtZWZlajA1MjViK0FoWlFhYTk1?=
 =?utf-8?B?ZjRMdkhQaW1sSGdyNlNlR0JrTUY1OHFhTTBUN0w1Z2puZnI1ZTFDcXFabVpG?=
 =?utf-8?B?b3NGcU1SQTlrOWJUdVlqcU9BRGNwTjYxLzB1VW9PaVlwUGw4MTNGaEd1Vnh5?=
 =?utf-8?Q?y1zQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d12a71-587f-40cf-18f6-08dd678581aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 08:02:06.0105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4D7U2m1zAokiyvak6B1fw4lwZV2Au6J3tV8Om8kewLsui7ihB1933ofSTd9NcgaIkJeRUUXnRK//5hd1nL63Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134

W1B1YmxpY10NCg0KSGksDQoNClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgZ290IHNpZGUtdHJh
Y2tlZCBmb3IgYSB3aGlsZQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEFsZWphbmRybyBWYWxsZWpvIDxhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBNYXJjaCAxMywgMjAyNSA4OjAzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBl
bm55LnpoZW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRl
cy50ZWNoPjsNCj4gT3J6ZWwsIE1pY2hhbCA8TWljaGFsLk9yemVsQGFtZC5jb20+OyBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ow0KPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vDQo+IFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBEYW5pZWwgUC4gU21pdGgNCj4gPGRw
c21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDMv
MTldIHhlbi9zeXNjdGw6IHdyYXAgYXJvdW5kDQo+IFhFTl9TWVNDVExfcmVhZGNvbnNvbGUNCj4N
Cj4gSGksDQo+DQo+IE9rLCBzbyByZWFkY29uc29sZSBpcyBkb25lIGhlcmUuIEkgc2VlIGhvdyBp
ZiB5b3UncmUgYWxzbyByZW1vdmluZyB0aGUgY29uc29sZQ0KPiBoYW5kbGVyIGZvciB0aGUgc3lz
Y3RsIHRoYXQncyBhIGJpdCB1bndpbGVkbHkgdG8gZG8gaW4gb25lIGdvLg0KPg0KPiBJIHRoaW5r
IG15IGVhcmxpZXIgcmVtYXJrcyBzdGlsbCBob2xkIGluIHRlcm1zIG9mIHJlbW92YWwgb2YgZWxz
ZSBicmFuY2hlcyBvZiBpZmRlZnMuDQo+DQo+IE9uIFdlZCBNYXIgMTIsIDIwMjUgYXQgNDowNiBB
TSBHTVQsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IFRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zIGlz
IHRvIGRlYWwgd2l0aCBYRU5fU1lTQ1RMX3JlYWRjb25zb2xlIHN1Yi1vcCwNCj4gPiBhbmQgc2hh
bGwgYmUgd3JhcHBlZDoNCj4gPiAtIHhzbV9yZWFkY29uc29sZQ0KPiA+IC0gcmVhZF9jb25zb2xl
X3JpbmcNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bh
bWQuY29tPg0KPiA+IC0tLQ0KPiA+ICB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8ICAyICsr
DQo+ID4gIHhlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmggIHwgIDggKysrKysrKysNCj4gPiAgeGVu
L2luY2x1ZGUveHNtL2R1bW15LmggICAgfCAxMSArKysrKysrKy0tLQ0KPiA+ICB4ZW4vaW5jbHVk
ZS94c20veHNtLmggICAgICB8IDExICsrKysrKysrLS0tDQo+ID4gIHhlbi94c20vZHVtbXkuYyAg
ICAgICAgICAgIHwgIDIgKy0NCj4gPiAgeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgfCAgNCAr
Ky0tDQo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyBiL3hl
bi9kcml2ZXJzL2NoYXIvY29uc29sZS5jDQo+ID4gaW5kZXggMmYwMjhjNWQ0NC4uNmU0ZjNjNDY1
OSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYw0KPiA+ICsrKyBi
L3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jDQo+ID4gQEAgLTMzNiw2ICszMzYsNyBAQCBzdGF0
aWMgdm9pZCBjb25yaW5nX3B1dHMoY29uc3QgY2hhciAqc3RyLCBzaXplX3QgbGVuKQ0KPiA+ICAg
ICAgICAgIGNvbnJpbmdjID0gY29ucmluZ3AgLSBjb25yaW5nX3NpemU7ICB9DQo+ID4NCj4gPiAr
I2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgbG9uZyByZWFkX2NvbnNvbGVfcmluZyhzdHJ1Y3Qg
eGVuX3N5c2N0bF9yZWFkY29uc29sZSAqb3ApICB7DQo+ID4gICAgICBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKGNoYXIpIHN0cjsgQEAgLTM3OCw2ICszNzksNyBAQCBsb25nDQo+ID4gcmVhZF9jb25z
b2xlX3Jpbmcoc3RydWN0IHhlbl9zeXNjdGxfcmVhZGNvbnNvbGUgKm9wKQ0KPiA+DQo+ID4gICAg
ICByZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICsjZW5kaWYgLyogQ09ORklHX1NZU0NUTCAqLw0KPiA+
DQo+ID4NCj4gPiAgLyoNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2NvbnNvbGUu
aCBiL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgNCj4gPiBpbmRleCA4M2NiYzlmYmRhLi5lN2Q1
MDYzZDgyIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9jb25zb2xlLmgNCj4gPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5oDQo+ID4gQEAgLTcsMTIgKzcsMjAgQEANCj4g
PiAgI2lmbmRlZiBfX0NPTlNPTEVfSF9fDQo+ID4gICNkZWZpbmUgX19DT05TT0xFX0hfXw0KPiA+
DQo+ID4gKyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9pbnR0eXBl
cy5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL2N0eXBlLmg+DQo+ID4gICNpbmNsdWRlIDxwdWJsaWMv
eGVuLmg+DQo+ID4NCj4gPiAgc3RydWN0IHhlbl9zeXNjdGxfcmVhZGNvbnNvbGU7DQo+DQo+IFRo
YXQgZm9yd2FyZCBkZWNsYXJhdGlvbiBzaG91bGQgcHJvYmFibHkgYmUgaW5zaWRlIHRoZSBpZmRl
Zg0KPg0KPiA+ICsjaWZkZWYgQ09ORklHX1NZU0NUTA0KPiA+ICBsb25nIHJlYWRfY29uc29sZV9y
aW5nKHN0cnVjdCB4ZW5fc3lzY3RsX3JlYWRjb25zb2xlICpvcCk7DQo+ID4gKyNlbHNlDQo+ID4g
K3N0YXRpYyBpbmxpbmUgbG9uZyByZWFkX2NvbnNvbGVfcmluZyhzdHJ1Y3QgeGVuX3N5c2N0bF9y
ZWFkY29uc29sZQ0KPiA+ICsqb3ApIHsNCj4gPiArICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4g
PiArfQ0KPiA+ICsjZW5kaWYNCj4NCj4gVGhpcyBpcyBvbmx5IGNhbGxlZCBmcm9tIHN5c2N0bC5j
LCB3aGljaCB3aWxsIGJlIGNvbXBpbGVkIG91dC4gV2h5IGlzIHRoZSBlbHNlDQo+IG5lZWRlZD8N
Cj4NCg0KQmVjYXVzZSBJIHdyYXBwZWQgdGhlIHN5c2N0bC5jIGluIHRoZSBsYXN0IGNvbW1pdC4N
CklmIHJlbW92aW5nIHRoZSBlbHNlIGNvbmRpdGlvbiBoZXJlLCB0aGUgY29tcGlsYXRpb24gd2ls
bCBmYWlsIG9uIHRoaXMgY29tbWl0Lg0KU28gZWl0aGVyIEkgYWRkICNpZmRlZiBpbnRvIHJlYWRf
Y29uc29sZV9yaW5nIGZ1bmN0aW9uIGJvZHksIG9yIGluIHRoZSBsYXN0IGNvbW1pdCwNCkkgZHJh
dyBiYWNrIGFsbCB0aGVzZSB1bm5lY2Vzc2FyeSBlbHNlIGNvbmRpdGlvbnMsIG9yIGNvbWJpbmUg
YWxsIGNvbW1pdHMgaW50byBvbmUNCkFueSBwcmVmZXJlbmNlPyBPciBhbnkgb3RoZXIgc3VnZ2Vz
dGlvbj8NCg0KPiA+DQo+ID4gIHZvaWQgY29uc29sZV9pbml0X3ByZWlycSh2b2lkKTsNCj4gPiAg
dm9pZCBjb25zb2xlX2luaXRfcmluZyh2b2lkKTsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUveHNtL2R1bW15LmggYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaCBpbmRleA0KPiA+IGFmYzU0
YTBiMmYuLjM1ZDA4NGFjYTcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveHNtL2R1bW15
LmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94c20vZHVtbXkuaA0KPiA+IEBAIC0xODYsMTggKzE4
NiwyMyBAQCBzdGF0aWMgWFNNX0lOTElORSBpbnQgY2ZfY2hlY2sNCj4geHNtX3N5c2N0bChYU01f
REVGQVVMVF9BUkcgaW50IGNtZCkNCj4gPiAgICAgIFhTTV9BU1NFUlRfQUNUSU9OKFhTTV9QUklW
KTsNCj4gPiAgICAgIHJldHVybiB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBjdXJyZW50LT5k
b21haW4sIE5VTEwpOyAgfQ0KPiA+ICsNCj4gPiArc3RhdGljIFhTTV9JTkxJTkUgaW50IGNmX2No
ZWNrIHhzbV9yZWFkY29uc29sZShYU01fREVGQVVMVF9BUkcNCj4gPiArdWludDMyX3QgY2xlYXIp
IHsNCj4gPiArICAgIFhTTV9BU1NFUlRfQUNUSU9OKFhTTV9IT09LKTsNCj4gPiArICAgIHJldHVy
biB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBjdXJyZW50LT5kb21haW4sIE5VTEwpOyB9DQo+
ID4gICNlbHNlDQo+ID4gIHN0YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVjayB4c21fc3lzY3Rs
KFhTTV9ERUZBVUxUX0FSRyBpbnQgY21kKSAgew0KPiA+ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Ow0KPiA+ICB9DQo+ID4gLSNlbmRpZg0KPiA+DQo+ID4gIHN0YXRpYyBYU01fSU5MSU5FIGludCBj
Zl9jaGVjayB4c21fcmVhZGNvbnNvbGUoWFNNX0RFRkFVTFRfQVJHDQo+ID4gdWludDMyX3QgY2xl
YXIpICB7DQo+ID4gLSAgICBYU01fQVNTRVJUX0FDVElPTihYU01fSE9PSyk7DQo+ID4gLSAgICBy
ZXR1cm4geHNtX2RlZmF1bHRfYWN0aW9uKGFjdGlvbiwgY3VycmVudC0+ZG9tYWluLCBOVUxMKTsN
Cj4gPiArICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gPiAgfQ0KPiA+ICsjZW5kaWYgLyogQ09O
RklHX1NZU0NUTCAqLw0KPiA+DQo+ID4gIHN0YXRpYyBYU01fSU5MSU5FIGludCBjZl9jaGVjayB4
c21fYWxsb2Nfc2VjdXJpdHlfZG9tYWluKHN0cnVjdA0KPiA+IGRvbWFpbiAqZCkgIHsgZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hzbS94c20uaA0KPiA+IGIveGVuL2luY2x1ZGUveHNtL3hzbS5o
IGluZGV4IDI3NjUwN2I1MTUuLmQzMjI3NDBkZTEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1
ZGUveHNtL3hzbS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUveHNtL3hzbS5oDQo+ID4gQEAgLTYy
LDggKzYyLDggQEAgc3RydWN0IHhzbV9vcHMgew0KPiA+ICAgICAgaW50ICgqZG9tY3RsKShzdHJ1
Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgY21kLCB1aW50MzJfdA0KPiA+IHNzaWRyZWYpOyAg
I2lmZGVmIENPTkZJR19TWVNDVEwNCj4gPiAgICAgIGludCAoKnN5c2N0bCkoaW50IGNtZCk7DQo+
ID4gLSNlbmRpZg0KPiA+ICAgICAgaW50ICgqcmVhZGNvbnNvbGUpKHVpbnQzMl90IGNsZWFyKTsN
Cj4gPiArI2VuZGlmDQo+ID4NCj4gPiAgICAgIGludCAoKmV2dGNobl91bmJvdW5kKShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgZXZ0Y2huICpjaG4sIGRvbWlkX3QgaWQyKTsNCj4gPiAgICAgIGlu
dCAoKmV2dGNobl9pbnRlcmRvbWFpbikoc3RydWN0IGRvbWFpbiAqZDEsIHN0cnVjdCBldnRjaG4g
KmNobjEsDQo+ID4gQEAgLTI2NiwxNyArMjY2LDIyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHhzbV9z
eXNjdGwoeHNtX2RlZmF1bHRfdCBkZWYsDQo+ID4gaW50IGNtZCkgIHsNCj4gPiAgICAgIHJldHVy
biBhbHRlcm5hdGl2ZV9jYWxsKHhzbV9vcHMuc3lzY3RsLCBjbWQpOyAgfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIGlubGluZSBpbnQgeHNtX3JlYWRjb25zb2xlKHhzbV9kZWZhdWx0X3QgZGVmLCB1aW50
MzJfdCBjbGVhcikNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuIGFsdGVybmF0aXZlX2NhbGwoeHNt
X29wcy5yZWFkY29uc29sZSwgY2xlYXIpOyB9DQo+ID4gICNlbHNlDQo+ID4gIHN0YXRpYyBpbmxp
bmUgaW50IHhzbV9zeXNjdGwoeHNtX2RlZmF1bHRfdCBkZWYsIGludCBjbWQpICB7DQo+ID4gICAg
ICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gIH0NCj4gPiAtI2VuZGlmDQo+ID4NCj4gPiAgc3Rh
dGljIGlubGluZSBpbnQgeHNtX3JlYWRjb25zb2xlKHhzbV9kZWZhdWx0X3QgZGVmLCB1aW50MzJf
dCBjbGVhcikNCj4gPiB7DQo+ID4gLSAgICByZXR1cm4gYWx0ZXJuYXRpdmVfY2FsbCh4c21fb3Bz
LnJlYWRjb25zb2xlLCBjbGVhcik7DQo+ID4gKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4g
IH0NCj4gPiArI2VuZGlmDQo+ID4NCj4gPiAgc3RhdGljIGlubGluZSBpbnQgeHNtX2V2dGNobl91
bmJvdW5kKA0KPiA+ICAgICAgeHNtX2RlZmF1bHRfdCBkZWYsIHN0cnVjdCBkb21haW4gKmQxLCBz
dHJ1Y3QgZXZ0Y2huICpjaG4sIGRvbWlkX3QNCj4gPiBpZDIpIGRpZmYgLS1naXQgYS94ZW4veHNt
L2R1bW15LmMgYi94ZW4veHNtL2R1bW15LmMgaW5kZXgNCj4gPiAwYTVmYzA2YmJmLi40Yzk3ZGIw
YzQ4IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi94c20vZHVtbXkuYw0KPiA+ICsrKyBiL3hlbi94c20v
ZHVtbXkuYw0KPiA+IEBAIC0yNCw4ICsyNCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeHNtX29w
cyBfX2luaXRjb25zdF9jZl9jbG9iYmVyDQo+IGR1bW15X29wcyA9IHsNCj4gPiAgICAgIC5kb21j
dGwgICAgICAgICAgICAgICAgICAgICAgICA9IHhzbV9kb21jdGwsDQo+ID4gICNpZmRlZiBDT05G
SUdfU1lTQ1RMDQo+ID4gICAgICAuc3lzY3RsICAgICAgICAgICAgICAgICAgICAgICAgPSB4c21f
c3lzY3RsLA0KPiA+IC0jZW5kaWYNCj4gPiAgICAgIC5yZWFkY29uc29sZSAgICAgICAgICAgICAg
ICAgICA9IHhzbV9yZWFkY29uc29sZSwNCj4gPiArI2VuZGlmDQo+ID4NCj4gPiAgICAgIC5ldnRj
aG5fdW5ib3VuZCAgICAgICAgICAgICAgICA9IHhzbV9ldnRjaG5fdW5ib3VuZCwNCj4gPiAgICAg
IC5ldnRjaG5faW50ZXJkb21haW4gICAgICAgICAgICA9IHhzbV9ldnRjaG5faW50ZXJkb21haW4s
DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svaG9va3MuYyBiL3hlbi94c20vZmxhc2sv
aG9va3MuYyBpbmRleA0KPiA+IDdjNWU3ZjU4NzkuLjdjNDY2NTdkOTcgMTAwNjQ0DQo+ID4gLS0t
IGEveGVuL3hzbS9mbGFzay9ob29rcy5jDQo+ID4gKysrIGIveGVuL3hzbS9mbGFzay9ob29rcy5j
DQo+ID4gQEAgLTkzNCw3ICs5MzQsNiBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX3N5c2N0
bChpbnQgY21kKQ0KPiA+ICAgICAgICAgIHJldHVybiBhdmNfdW5rbm93bl9wZXJtaXNzaW9uKCJz
eXNjdGwiLCBjbWQpOw0KPiA+ICAgICAgfQ0KPiA+ICB9DQo+ID4gLSNlbmRpZg0KPiA+DQo+ID4g
IHN0YXRpYyBpbnQgY2ZfY2hlY2sgZmxhc2tfcmVhZGNvbnNvbGUodWludDMyX3QgY2xlYXIpICB7
IEBAIC05NDUsNg0KPiA+ICs5NDQsNyBAQCBzdGF0aWMgaW50IGNmX2NoZWNrIGZsYXNrX3JlYWRj
b25zb2xlKHVpbnQzMl90IGNsZWFyKQ0KPiA+DQo+ID4gICAgICByZXR1cm4gZG9tYWluX2hhc194
ZW4oY3VycmVudC0+ZG9tYWluLCBwZXJtcyk7ICB9DQo+ID4gKyNlbmRpZiAvKiBDT05GSUdfU1lT
Q1RMICovDQo+ID4NCj4gPiAgc3RhdGljIGlubGluZSB1aW50MzJfdCByZXNvdXJjZV90b19wZXJt
KHVpbnQ4X3QgYWNjZXNzKSAgeyBAQCAtMTg4OCw4DQo+ID4gKzE4ODgsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHhzbV9vcHMgX19pbml0Y29uc3RfY2ZfY2xvYmJlciBmbGFza19vcHMgPSB7DQo+
ID4gICAgICAuZG9tY3RsID0gZmxhc2tfZG9tY3RsLA0KPiA+ICAjaWZkZWYgQ09ORklHX1NZU0NU
TA0KPiA+ICAgICAgLnN5c2N0bCA9IGZsYXNrX3N5c2N0bCwNCj4gPiAtI2VuZGlmDQo+ID4gICAg
ICAucmVhZGNvbnNvbGUgPSBmbGFza19yZWFkY29uc29sZSwNCj4gPiArI2VuZGlmDQo+ID4NCj4g
PiAgICAgIC5ldnRjaG5fdW5ib3VuZCA9IGZsYXNrX2V2dGNobl91bmJvdW5kLA0KPiA+ICAgICAg
LmV2dGNobl9pbnRlcmRvbWFpbiA9IGZsYXNrX2V2dGNobl9pbnRlcmRvbWFpbiwNCj4NCj4gT3Ro
ZXJ3aXNlLCBzYW1lIHJlbWFya3MgYXMgaW4gdGhlIHN5c2N0bCBob29rcyBmb3IgeHNtLg0KPg0K
PiBDaGVlcnMsDQo+IEFsZWphbmRybw0K

