Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD82B352BD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 06:24:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093844.1449222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqlDq-00046w-Fc; Tue, 26 Aug 2025 04:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093844.1449222; Tue, 26 Aug 2025 04:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqlDq-00044f-Co; Tue, 26 Aug 2025 04:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1093844;
 Tue, 26 Aug 2025 04:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofj+=3G=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uqlDn-00043p-UO
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 04:23:48 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74c386aa-8234-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 06:23:46 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA1PR12MB9740.namprd12.prod.outlook.com (2603:10b6:208:465::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:23:43 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:23:43 +0000
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
X-Inumbo-ID: 74c386aa-8234-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fC5AZNO5gzaAxzVEbHy6ToUMO2gqJGBmTBVb/0EsP14Fa8PWBpXPvo+xgaVgvbaHTlQUXTU7gQFwMuDQSnfShwYpM/blY8cujIzG8dXvRd5PRwWNPFQOLlDqC3niNeX3rso9AAOLBpktGD6HGLmXKFKM5kp/vM3TKvnJ+1UB8c6Ju2/4ESgQtspyYLgYPuGAiEboL+/uDEa92aRqT9hviUsgYibps5o4kGDfZhi7akH+L7x9mq9xl1ihV/+IJofQdoTV/gh6C0O4kEY8g7dq8z0eyOOFsIpawun98S+9UrZE7bUGuB3rolp7wjvuWD12Rf/JWPg3M3BfHN4yj6njDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeEMw0WAP8DEf+kBqsIYruecdXTSMqgZNOFHHH3nA9o=;
 b=bWpMftFlcQx65kBHDcNYmndlcDHKjo/1PpAfky7P+qQ6uhhoLTItAFvnUk4vZ6Sx9ECWCXJ7mHF1JiITihawsajjCmkMYoTXIerev8lOC0m2+pCkEaiaWPLrBzpz2GBwF4hnLuHFfoHWSCYFY3VZY8EmQAlrygpQT35HPg4L7wTUF8T/bb/SKX+F8q3u1ZoI6MATKo19LWmVWu4eItq2gwqpoKaV3b+bSWLjlbFmVqeskq9IET2649XF7+uXjMU9ALgKvi6jFROtlrnTS0aCH4HaTUplsjZUbOT4nppnJPSSVSKsir79kiyvUx5fMnBwHLszLpzenhnMs8eWl5qRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeEMw0WAP8DEf+kBqsIYruecdXTSMqgZNOFHHH3nA9o=;
 b=B5Z/a5vLfyLB3xjs5kGYJXNSnEow7d4ZA99VcgkxvtEZctn9znWRMKp1TH/fo9dh+DKF2y3QvIOcKtQrmEE0w9H7ThnP8vb67GHM2TU4BZ6i8qJ0nxEEIzH0ArdTkshfXFtnVPOTvxTRrkHKhtm6nDhmQn0hrOC0/yo6TRo7GFY=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 04/13] xen/cpufreq: add missing default: case for x86
 vendor
Thread-Topic: [PATCH v7 04/13] xen/cpufreq: add missing default: case for x86
 vendor
Thread-Index: AQHcE1LnYk6aQ+tCsUqjAHtQXx8uFLRzdoWAgADk8hA=
Date: Tue, 26 Aug 2025 04:23:43 +0000
Message-ID:
 <DM4PR12MB8451B4958835601AC8DE906DE139A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-5-Penny.Zheng@amd.com>
 <f6e4561d-a554-4ac1-afad-c4b010e1832b@suse.com>
In-Reply-To: <f6e4561d-a554-4ac1-afad-c4b010e1832b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-26T04:23:30.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA1PR12MB9740:EE_
x-ms-office365-filtering-correlation-id: 70e06970-3cec-4dc1-4acb-08dde458578a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azdaaFlhVDZtMVZGeUNtQzVUbVVFbk1LUnd1eDN0ZlFlV0lmUXRmOFNZUjA2?=
 =?utf-8?B?TTA3dHZ3V0o4anY1NXV6dWhuRkcvVmhsbWtTT2lZWENJT1hGeEZHdnloeVBl?=
 =?utf-8?B?UVJyOWM3c3A0YTFOWHIxS3E4TlA5VU9jNFdhNEFXNVM2U28vT3pFRTNuY1Yz?=
 =?utf-8?B?VjFoYlVWTWIvTjA1NGhTOU0wU1R6YzhVY1h2OEs3c1RBMENlM3E4dU1rMlFO?=
 =?utf-8?B?V0N5dmNHWVJDVHZBNkdDclh4UU9Ka0pIQXpLSXNDSlV2dk9OYmxZRlBQcTNo?=
 =?utf-8?B?M1RZU3JTajc0bUVNcDFDeUVvYytoVUhBczZycjAwb2hwRHpCbzQ0dnIwVVRu?=
 =?utf-8?B?RVVHcGo1YURWOE5seHdhTW84VTAyZSt3OG5wME9KeFpxOFRqNUNBdlBGRWMr?=
 =?utf-8?B?YVIrTVRXUDN0Q3RzWml3Yzl6UlZzMGdEdFpmQ3N0N21USkZSNExiSVZ2R0Jw?=
 =?utf-8?B?bjY2eFp4a0YyYVhKVDJWcFZaZVp4RHcyUnBsN1ZCNDdZcnBuUXpBNERkRmtt?=
 =?utf-8?B?ZDJaYzF1OS84TTk4OWpFTGZWOGhZanBiY25NbXRsVWlpaEFab3VVNjVieVdL?=
 =?utf-8?B?cjdkeXZHa05Eb3hEU1hpNjZJRkJWcXExQ3JVRlYzYzMvT0lJUnNlN0R5NmRj?=
 =?utf-8?B?ckc4UU85WUNDdlJvYng4c1VhaVg3REhXUEdTYnJXTGRRQkZjNUp5T2RLUnV0?=
 =?utf-8?B?eHNxQ2IwWEhicmVqblVuTER2OUUyRjYwTHZ5dFVZRUozV3JEeFNaUm9Ec1dN?=
 =?utf-8?B?cXhBNE9iUytGZ21pT3NRamJpYU0rbGJndW9HTFYwZEpsNzU4b3FpRENyT0pt?=
 =?utf-8?B?MEhGVDVrZlI5YXJmU1JSOFloTVhEWkY2SEZnZSt1b3JjRWpxcHFyWkhZL0VY?=
 =?utf-8?B?UTNnQVZ1TlJneVQyNzZUNG14SlJUcnpmaXhvK3psM01hQ1cvaVoyVlJiemdG?=
 =?utf-8?B?NFE3NWdVbVp2dU5PRUh3MjdqWDZBak5wMG9HVDFtUUtvY2NycnZWWldMUzF6?=
 =?utf-8?B?eU1TLzRubWdwaDZSdTBpWTEvU1RoeE81cHo1TXVVS05OV1pKOGNxRjZIMGVM?=
 =?utf-8?B?RUFKKytySldjMkhIUHQ5YjNTN2JrN1E0Z1lsZThPdjlkV2tkeldqdmlUS1BE?=
 =?utf-8?B?Yy9GL0oyb3V1U3J3R3dkYVgxZHp4UXRNQzdRcGNudmZBMHp4TDNSK0h2cHFp?=
 =?utf-8?B?VFlVaDVCNFhvcUxjQmRiMGhEaHMyYTRZUkFIZmxMcTlzWDBBMFNtcmFxL0Ja?=
 =?utf-8?B?Zjh4MlRMaDk3WWppWWNTTDZGMU9uQjAwRGl0L1luV05aVGVHWXVIQnE4dTIw?=
 =?utf-8?B?Yzl4aXZXSHZLTGgrRW83MUIyaGhkWkdLTk9oSDBVeW93MFpzVGloUGFtZnF6?=
 =?utf-8?B?L2ZaZDRBeU5RK0FueWFmUTVTRXZnMW1EVWJhRTE2bDFmbTBiUU1ST3BzN20y?=
 =?utf-8?B?OHd6RkFsd3U1YmptUTE0anhuWnlLZmNUV3VKdVpWWmVqWVlBQ0V4Nmd4RHJU?=
 =?utf-8?B?UkJ5Z01wOERDUnlUUk1HWTBweSthMXBGMUxjYm05R1hhaWgzZ1FaWk1udjI2?=
 =?utf-8?B?Q2FKK2dzbkxlQzUwV2c5TGFBUkg3dE5JemhxblZwYzRvRWZaTFVPMXVpUGU2?=
 =?utf-8?B?ZmRuTGNUMDdCVHN4UjUvdldDQW9Xa2dDRndseStNNWlFU2M1ZWMxblUrM3Fx?=
 =?utf-8?B?TmE1V0NJTzN3M3BtWklLN2VDVG5iWnBPYmF3aWVKVU9XcXNYUks5OGtPR1N6?=
 =?utf-8?B?TGFiaDNtR0s4Q3BqMFhVU3VBdW9JNXNCeEdMR1ZKZms2WGpmNGRzTEVya3g4?=
 =?utf-8?B?aCtMRGJUU0tjbHNYNkpVWXZTdzVqVlhBd0NWNndZS3haUmJ1RWRmd0NUSWd0?=
 =?utf-8?B?cFBmQzlTWVU2WUp4cEUzc0JLS2JCeXdUY1hTbDVnd3YzZjh4aDM4am9ZNjN2?=
 =?utf-8?B?RzNMcTYwemd4NVI5Nlo2S2dNSlZuYmhhSXNiWFROSWgrYmQvQW9aNWFteVVW?=
 =?utf-8?Q?TE4LqpdvHn6CSJ9BXsr7j/LL1rxx3s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHIwVk1LUmhiNjd2ZWdYejVNc0F0VWtvQWliOUc3NGVZYlBad1Z4TmdSNG9s?=
 =?utf-8?B?bUpsdUowUHg5WDdsZXk4TXp2Qm81V0NUbU1aY2ozaFNBMzV3OVh4clJjVHlJ?=
 =?utf-8?B?QXJreTBqbU9pRXZFV0QrbkJCMkZ4dW5qWmtZd0Z1OG5zYVdtS29janJDRGRK?=
 =?utf-8?B?Ny96eXpROGFsb0pmNGlmM2pkcFF0MHlaNWlPcEdRaXoxOXJwRGRjcEp2dy83?=
 =?utf-8?B?cmV5bFY1SGd5cWJ3QUlSelhRVEdRY2pKRDhoNVl6S2J0MS90bWhNMThySmZJ?=
 =?utf-8?B?UVZuaWxpQTk2Y2xGYnk2clYyNkpITGlvdzFTOXFmUWhuOWcyQzltYys4Wmt0?=
 =?utf-8?B?cVdYK29pVzlJSzdlN09tRzBqWmNDU1dkTFZlc1lyd3hhaGpDNVE3b0poclh3?=
 =?utf-8?B?UGpRWVhJd0pDUlpaODJXakhKTTl0WXptVitJK2d2ZlJsWE5QbDhSMnFZdFRi?=
 =?utf-8?B?QU9PWGtxaUswU3N4SzJGQ3FIRkdpU2FaVXZjaUFhTWFYUksxdnhMUDM3eWl2?=
 =?utf-8?B?ZUdMMUJKZFhLSUF1NHdhNmY5WC8ySkxDb0pnbmpXbHhGa3AwN0VYb1cwU1ZG?=
 =?utf-8?B?UG1JOGxQTnRkWEFlUi9XTEhKdDYrY1MzSWVRZmp4d0pkS25uTFlTNFJaRUdn?=
 =?utf-8?B?ZTB1dHFhcTE0V25CUllpUFc2dmZWQlQ1bUpMQnVlZWFuci9YTUxZakJ2Zy9G?=
 =?utf-8?B?SEpyTVlIaHJyVGFDMmVOaXRxd0krT3ZxRElSYzJBd2tFQ3hvc3ZIMy82ZTlk?=
 =?utf-8?B?MDRBQnZIWCs1ZGRCZ0ttL3lDMk9za3ZCeXE1b1hEQ2tHd01XNkdsMDhUYmRx?=
 =?utf-8?B?a2Y3ZTZzcWEvVm92OGFWZ0J1dlNTZ1lMcy9GRTZLNlYrdXI2ZjVkWlk3MW43?=
 =?utf-8?B?Qk9RbnJ6RWR4ZTV4M01lY2xMRjFkY1ZoVm40enFHUHlKTHhQbEExaktuZWk1?=
 =?utf-8?B?dytYVHRSQ2o3bDZ3d1ErT2xBK3U4Z1ZiNXZhZEtidGRxc1NjSitYR2IvY0JV?=
 =?utf-8?B?MDZPcWNmNGpORHlCaW1YMVRmN2FNQ0tkTmhNK2N5a2gwTzZiL3poR2JyVnhs?=
 =?utf-8?B?M0FmamRkNlA4cGlNTUVTVVZIN2xLZXZOVTUxdms1WExHWFNuajF6dEQ3QmRu?=
 =?utf-8?B?Y1pWalZESzBzdWJlajA2c3NRVWZmZ3g1WGQweUhDZGZ6SmZEM2ZiVnRlNkR1?=
 =?utf-8?B?ejR1NHNSaUszVUlNVERGdnp5cXRwK0dWL003VTJsSzNPaXpadC9SdFFRWElm?=
 =?utf-8?B?ZUZ0d21vTUpKbENiZFBUT3BTYjdIRkh3VlFqdFMzRDFGNlBFdllFeUJQNElD?=
 =?utf-8?B?NzhqdEplVUhQc0pRRWhnNTJ1MzRzdlY5cVBDRUZXV0ZISW9qZGhUeWFZV1p6?=
 =?utf-8?B?MzJrRDQreE15TFhhbnp1WkFOV1dWNENjeERGS0pKWDVvazBOUTZUVElnZHpS?=
 =?utf-8?B?S1JXMGI3TWJUL2xhYms5RXFSQ0IrRng4cks4V1YrbTRPSDg0Y1REa0hQS01t?=
 =?utf-8?B?OHduUUdoR2pnNTBxZlZudUE3bVArdGk4SHZZaDFzZ3ZnZGQwMHd6SEp5OUlh?=
 =?utf-8?B?MWkvbW52L3N5OTNCMEMvVmdscENoa3F6TWgvdUtJV2RtOEVPV2hpYndibk4y?=
 =?utf-8?B?clErYzV1aW5zUlMrb2s4K3NjVUlTNGxQUGNnbjBHZVJwbko2M1ppalFtb01N?=
 =?utf-8?B?SmI0L1o0SEhHemxPNTgwcjhlWFFwNThpTTBrdmlnT3d6NjhnaDV1Y2k5eHN1?=
 =?utf-8?B?VDJRUGlFeTZOMmVWQzU0VEZoblhYL2E1N3I1bjVzdERKeEkrRjFGNTJjNi9k?=
 =?utf-8?B?RTR0UE1sbnEvQ0VhQnBBVGFQSjZGdkM1cWhhSHZRdDE1UzkyUU14R1lkdmJ3?=
 =?utf-8?B?UkZyZEJrUStHd3N1WDRuek9ISEtCTnZqMVh0ZHZoVG01U01walo2T1FKVnFT?=
 =?utf-8?B?MjJhdm5uOEloeGl3QmJaTjh0d3dLc1c0VDJDbUtYY2t3YlNHK1pieDZlb3hF?=
 =?utf-8?B?MlRMUEF4aHZkanI2NmRnbDI3ZG5ZQ1BvdndTdm5ZVU5rTkdDZHY4SDZmM3F0?=
 =?utf-8?B?QWxYb0dMOU1nWEtQMEVjai9Ec0IwYlZ3Rk9rb2ZwaTN2R2xKQ2hldjNoWkpx?=
 =?utf-8?Q?DvTE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e06970-3cec-4dc1-4acb-08dde458578a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 04:23:43.3286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: owaDiU0NeSM5r83TcJGqNQhbONEK7xzllEkpd6leZqJKkUm5pLFH5nXZfNc279Robii94bDMXB5rkVAZHWUGKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9740

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDI1LCAyMDI1
IDEwOjQzIFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NyAwNC8xM10geGVuL2NwdWZyZXE6IGFkZCBtaXNzaW5nIGRlZmF1bHQ6IGNhc2Ug
Zm9yIHg4Ng0KPiB2ZW5kb3INCj4NCj4gT24gMjIuMDguMjAyNSAxMjo1MiwgUGVubnkgWmhlbmcg
d3JvdGU6DQo+ID4gU2luY2Ugd2UgYXJlIG1pc3NpbmcgZGVmYXVsdCBjYXNlIGZvciB4ODYgdmVu
ZG9yLCB0aGVyZSBpcyBwb3NzaWJpbGl0eSAoaS5lLg0KPiA+IG5ldyB2ZW5kb3IgaW50cm9kdWNl
ZCkgdGhhdCB3ZSB3aWxsIHJldHVybiBzdWNjZXNzZnVsbHkgd2hpbGUgbWlzc2luZw0KPiA+IHRo
ZSB3aG9sZSBjcHVmcmVxIGRyaXZlciBpbml0aWFsaXphdGlvbiBwcm9jZXNzLg0KPiA+IE1vdmUg
InJldCA9IC1FTk9FTlRSWSIgZm9yd2FyZCB0byBjb3ZlciBkZWZhdWx0IGNhc2UgZm9yIHg4NiB2
ZW5kb3IsDQoNClR5cG86IC1FTk9FTlQNCg0KPiA+IGFuZCBhZGQgZXJyb3IgbG9nDQo+DQo+IFJl
cXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAob3IgU3VnZ2VzdGVk
LWJ5OiBpZiB5b3UgbGlrZSB0aGF0DQo+IGJldHRlcikNCg0KQWNrDQoNCj4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1kLmNvbT4NCj4NCj4gUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KVGh4DQoNCj4NCj4gSmFuDQo=

