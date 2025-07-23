Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BAB0F76C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054452.1423258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebhf-0008R1-Hd; Wed, 23 Jul 2025 15:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054452.1423258; Wed, 23 Jul 2025 15:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebhf-0008OD-Dk; Wed, 23 Jul 2025 15:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1054452;
 Wed, 23 Jul 2025 15:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE//=2E=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uebhd-0008O7-8S
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:48:21 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75150d44-67dc-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 17:48:20 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7905.eurprd03.prod.outlook.com (2603:10a6:20b:420::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 15:48:17 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Wed, 23 Jul 2025
 15:48:17 +0000
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
X-Inumbo-ID: 75150d44-67dc-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvkwIAEA9UT3quraS5pxaNVHeiZ3BBag+kQ1QgGKdqZvPUJJV+he63lni1nCsMiqtt6rRxsAGXU77TBxZxHqRZ/kw1A2AjZY6gUf4zbCcVYV9hxQbQnah7/JiBZuIguMNuRC+1uaT+dfw7G/dGuGABcWp8edJXGsKiNfXcQyGHax0J5sALL+BU3sDmC6wvLrVVHWFBEwjTAKebw+JV0f9vTLVnzXNkeNgMZKfUCt9oPyrjBu8myjVg0U15GHdfLxahhmIFgBf+nikjWrniumBvqTNiJ2gwAMga005b9EgFdgg3GOMCoBfNViCN32dgeWWPbGSH/A+NkPm0YWRLq1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYZxGavtRa2p0+t5ZJe/kMkJt1tnfKA1V5eGMLHK20A=;
 b=heYDb5IMI/LAteT+EMIS5EGzid3xd5rgnx2za6kC4/Tye+wYXnIOgJPS1rdmMYG9fx3xloZvNTOhmhgD4+Ha2SQCPJlPUmMYT2ZqrKEDIev4rhUyVJXaAqxvhfWxyBUwsC+Pqnp2Dzux0AlHzRTb8pOXZzk1hRb8w3dLHeLT19rmXPJPiYgIW58FnKtwWVGrbR2oSaTTtwEmPy5H3I3qYNpoMTzl2lEie1uzDBj8P/Jfjffo9PI93CyOh/Ysz/FoSnhcyEqwv8lld8w+CPfCTUKa0OvBZJV75EjZMJNKAUm6BWbI9Ic9eerJ4UvO7ys27XRPVZ5qg08WVCMZPZduoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYZxGavtRa2p0+t5ZJe/kMkJt1tnfKA1V5eGMLHK20A=;
 b=MHcPtEikubjBstoKFYBV65QbpMKEAXY42M9E59Ly/2lKgr5IEkA19gmlD/Oav4mDMEUqAxNV4Cl++atKO1T4mvwf4VgBVVerWvIo9kOGE30UBJh+TxwB8LewyVpw6R79zaUAlxrUFyJVCMugDoqZfK0wejJoyrBuecwulNWGNTdR9RJ0p9hWkLFTPX0zTa8LJGe/C8Jh1bajpT4tOFn1XKaBtQKWPFpfPreFHMCgPQN3XZAl3qccwyPS5grIvL5p7BCDNPybD8kUeGohReLYLB7uou5ZQXvmViAvwsVnq0FM8UksLsxS0IBTBuD34HI/E4rpXrmqvKB57dP1vJoo6Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, "amd-xen-safety@groups.io"
	<amd-xen-safety@groups.io>
Subject: Re: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Topic: [PATCH] xen/arm, xen/common: Add Kconfig option to control Dom0
 boot
Thread-Index: AQHb+9rNCD0pdC1VhE+OyU7cYZL/l7Q/xA4AgAAB2ACAAAiFgIAADEcA
Date: Wed, 23 Jul 2025 15:48:16 +0000
Message-ID: <ebcb5eba-179e-4672-ac89-024bae9890b2@epam.com>
References:
 <9c1169345d916cb542bf3f28ddf854f6308a402a.1753279365.git.oleksii_moisieiev@epam.com>
 <60627444-420d-42a1-b7b6-d74dec2479e0@suse.com>
 <f8d6e3b2-aca2-4a0e-8913-0f52f2016846@epam.com>
 <9814144b-5eb4-421a-93f3-2a15232a7dd3@suse.com>
In-Reply-To: <9814144b-5eb4-421a-93f3-2a15232a7dd3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7905:EE_
x-ms-office365-filtering-correlation-id: d1b3c65d-2afa-4982-f250-08ddca005756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTZkUkxtYlBHdndISy9NclZSQk12VUZrRUlUUmdYNzFTUWNuQUVveTM3dkZI?=
 =?utf-8?B?U0VKVC9LRVQ0dlYrR1ZESjkxdnFTRHJxbVp4YUFoVXI3MzZGWUgyR2ozMWUw?=
 =?utf-8?B?NlBCWWZMMmFJeEVBTHhtOEI1bzMyb0hPZDBuakEzUUhZMXpRRHR2TVNzRG9y?=
 =?utf-8?B?UzRDOGJ0Zyt2U0UwYUNuRVk2VkJVblR3RlJvNU50Sjk0ZkVOenVoVVc1Vlho?=
 =?utf-8?B?dXNQbGovOVBlbTdpdUd4T0h6dkNWemhWWUMvOHZWVy8wZm1LWTVMQTlFK2RO?=
 =?utf-8?B?bjlqWGVZZ0JTeUVvUzhIbkl2S0hjaWpoMHpCTld4dldMa3hiNklYQmRxRlNI?=
 =?utf-8?B?aWo0Mkg1RnNGcGdOWmdmYXpPcUFrMkJaS0FnakdueXRCcVVqOFZCODZEOUZC?=
 =?utf-8?B?dFA1TnV5SVM4SVhaRkFCSHl1aThLOWtiNitmVHNybU9OMm9zMzY3RkxJTjBL?=
 =?utf-8?B?SXU0Q2xPQ1hDSVd5bDVZQmtOVTlIakZBYVBMZFlNcUlMRVdPNytVWnRCSmdw?=
 =?utf-8?B?NjBMQmZZcHlQbWVzQlRTSGhDM0gxNU9qODJUb1lTcDV3MEZnVGRNbk05dzV3?=
 =?utf-8?B?MVdCZm1lZkRBdTY3c2JVdlc0QzhUeFVPWXVaY2I3VE5aOFZPczhlUDNnSVFq?=
 =?utf-8?B?LzJaV3FnTUs5MmFuRDdGTDhqY0V6SjQxOFltL2N0dThKc3hvNjkwSmdadklm?=
 =?utf-8?B?SmRLaUFaQjRpWDBzQ1BzRDFhODVzbDE2ZGtoRGhzb0hkUDdOTHFDQndhVjBG?=
 =?utf-8?B?VVdrakc4bTlHUkRYR0VCQTE2MU9FaHQzc2RZWlZmcnJxNWFvbFhOcVRkR3dz?=
 =?utf-8?B?Uk9jTjVzbEJiMzZHbVZmd2lrSDg0TkRpMnFOcUNFZmY1Y1pDRDBDSTlCYWVV?=
 =?utf-8?B?bGYyNUNvVmVRR3BrMjAzYVhBQ0pzdHVGNVNKWTE1VWRMcUl1bzlpMTBHYWNG?=
 =?utf-8?B?UGErK3ZnaHhtUUVESGExbjNINUlCVVB2RVVqdUoxQTVCeFl4emtTRU9leEJs?=
 =?utf-8?B?UXJ3S2czYkhyaFRGcHMzR2h4Nk8waHJ0dnZNRVFGa2NLb2xyc0o4K0JhSjBT?=
 =?utf-8?B?ZEhyNWxTK3VUb0p5R3MvY2ZMV2tEYm5iMTJKQ1k4N3lSS01VNThJQVFCTTNU?=
 =?utf-8?B?YnhZaUVjRkV1VnZock9DLzdUNU02aFNaT2JiLzN5b2xrNXNPVGxybDZYT3RS?=
 =?utf-8?B?aWRXQU5oUGsrQlBNUmtmY24vcm0xc092REVJWkp1UVovK1NKUVY5NU9BZzhE?=
 =?utf-8?B?VGxuZkI5amNrYkJkL0tyM1JSVmF2NXRBdi9uQjZSbW5iRm1FOTZwdzU4QnU1?=
 =?utf-8?B?L1AxZE55SFJsbjdhQWI5SUVPUFg2TWhSTmdiNUpaTG90c1FNSmxWdzZQV1FC?=
 =?utf-8?B?N0dVMzFReTJtRnN3dW9mSDhxYUVHVGp0dHJFWDdhSVdaaVA3R2cyYmRyelBv?=
 =?utf-8?B?M0ZtVlE2MEdld0JsQmd4Q0VtVEFpOHNoMk5DRlZkK20wMU5LQkExaDhPU2ds?=
 =?utf-8?B?Z3dwNE9xR1A3bDBNUnA5b2pGUmprMm85TEYxdWNwdVZibTVWTFpONVNXb1Zj?=
 =?utf-8?B?OE02TTFzcTFwZHQ4TEkzNHBGWWhIZ2RNT3RYS05kVFJMenNRdTN0dEZJQmsr?=
 =?utf-8?B?NHN0VUJkTVJoOVdxZGovVE43RlJFNXhUclF1TFc0MjExd0RKVHJHZVZUMnQy?=
 =?utf-8?B?MDhOS0ltZTB1VisvTDhEeVJLVHQyckhjLzlHaHRPU1ZLQUQ5cCttbkIzU3Jq?=
 =?utf-8?B?a1cxUmdxbm1GZjA1dGNQL0h4Q0lpQzNaUGlKKzlPMks5UDJEc0ZLZFVCaXRE?=
 =?utf-8?B?YndVdEtNZm5SdVFIUlRGbThhYWNrTFdNcWt6bVRDSjNueHp4a3ZwR0w5dlNR?=
 =?utf-8?B?QkJ6ZmFRdkNpTm5IcE5oSWthaEwvQ09YcGlKTEl0MWNkQ3RkOG1wVmZWOUhh?=
 =?utf-8?B?YmhnVFpVSGJkUlNVaDVScE83eUkzazdKKzlEeElEalhXWUc1S1h3U3RHUlF1?=
 =?utf-8?B?K0YzREFBQ2t3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STdBVmUzQWxBYnFWZThBMUlsNTZNNDlXQ1dIUWZoVW02ZmQ2Vk5tU3kwMEkw?=
 =?utf-8?B?d1pNdmlQVzlUZEtEUDlKT2w1dlVHK0JBaGsxL1ltQWFwWDdrRVJ1czJheGJL?=
 =?utf-8?B?RzB5KzFLdkVvL2ZXVXlxRC9XZm9SNVIvOTRzb29hd0x6U3RXa2pudmRHZ3pB?=
 =?utf-8?B?WEloRmpkdWl0N0xtRi9mQXVDYXYwSWpybTB4WURicllBZmQwaS9udDdOcnNo?=
 =?utf-8?B?T0d1N3dRMnk5ektwQm5GTFZVbVE4VWd5V3lzZXZFakYrYjZldUlxRWcyaUxi?=
 =?utf-8?B?Szh3QlJhT0Vxa3JaZ09WcS9CSUt6aFhmYndFazFxdU1NaUwzUWtzaUNNcWp3?=
 =?utf-8?B?QXp3bWJUZ3R5SE1UN2pzQ2NpbThpVWhvZWhFdWRvdDBBVUQrN1ZGUDltNm9N?=
 =?utf-8?B?OGd5VXVQUnhEOXdKOG1uT2ZtaFZYa2R4K1F4R3VVWHZjL1ZTNTFnMDh2bjN0?=
 =?utf-8?B?K0M2TFA2ZXBET3BJN1RhOUJnaGczTDlpb0p0THZoWTIydWd6ZWRDZ3F5NnRt?=
 =?utf-8?B?R2VMbGhuTUZqZWNjZDBkVVVBbW1uTXVqT1ZyMFJTR3J2WUhPTHJuRkYrbnNn?=
 =?utf-8?B?WjlkdFYrYzJVb1ExZzhqUzdBTC8xa2dMMEh3ODRxd3JZc09KYzZvUmpGQUsz?=
 =?utf-8?B?VDgvbndicWZlUTkvODFudU1RdmVaTlZFQVZrZjZtSHNnM0dnUVBtUGFYcXB2?=
 =?utf-8?B?TzRLOEdwOW1Wd09hZlppWUFzd2EwZlRMZUY0a0lYZmZnTVRMYXp2ejE3UWVm?=
 =?utf-8?B?elQyc3BQRndOcWt4M2orU0dPWXFJTVY1NWFCUEphMWZTVjI1WWx1djZ5QXAx?=
 =?utf-8?B?U2VpL0U0L0xYQm5xeFB3eVBLb3VNOEFKem9PaUJ6Z2x3MnRkdzFPRUk3dTM3?=
 =?utf-8?B?UnUvWW01OUdvYnh6U3hxRkZDREZUbHM3U1hsa1ozcjZoaWVGcDNHVS9rQWFC?=
 =?utf-8?B?aXV6MjJLRHlQNVowSFJIakNUaC85QVVDMC9xeHJMZUNKV0RlUE5taUFudDF4?=
 =?utf-8?B?TjFyektyRVYvS0xYSlBHbWpleUxSSi9HM2RjUDZlWWszeU1VUUdSRjhicFBm?=
 =?utf-8?B?Zm1pek91akZYUXNuVzBuc1IyTHVscWNQNzV6aXExTUtiY0RtY0IwRDlOUUZZ?=
 =?utf-8?B?d0JuTzFIcUM5dXlsVFRoNUpmNmdYejlrdzMvMWNBQjEvYTJIazVPZW52RDFJ?=
 =?utf-8?B?bTBYTkUwRWxnOWlOWVduMytoc0I3L0lKT0RDNndFQnZpR3lrWFVnbmJvaDNG?=
 =?utf-8?B?dDRjbGRvTVBuYXZYQmdTYXNqd203anlEUERNOXJ2LzZLM1dod3ozVFRRYndR?=
 =?utf-8?B?Q3J1QVFJMEV6UmpML2dwU0ozUWl6VXF3SUhmWGpvdUxUM2R6dTRzeVNSSXJ6?=
 =?utf-8?B?VGNpOEs2U3ZqSHFNL21IZ1FoTVdaRHZtc1VYUGtjK0picEhVeWZIeFhzYi9w?=
 =?utf-8?B?U2d3YzZ1SUhYUUdNVW96ODFjTnVWR1pPYURJSlZxWm5xRFJ6ZExzZVdLT3gy?=
 =?utf-8?B?cVkzR1c1b3pzdXFHUitNRTZ1NXdhdkpoRlpaNERzakN0RmxYOGZ6VnhCRVM1?=
 =?utf-8?B?bXI1aWN1MnVjR1ZJMUwrMW8xcHZiWmpWSEg5NXdjSk92WjVVcFp5bjl6ZklZ?=
 =?utf-8?B?RFlSNGV6aVdiejFKU21ya1VJQ1ZTZmVWR2ZENHFjenVzWG5OSzNDaCt1dUNW?=
 =?utf-8?B?dkxqRWhQWU9oV2IvZzNQVkxVYkFHYW9IZHBMcEp2V0VxdktwNE5pNk5aY2Za?=
 =?utf-8?B?NlkvT0l5eWNFbG1MdE14M0kzZExLSWZwM001Ym9zYXpuRldyMGxGRXgrWkRm?=
 =?utf-8?B?cytZUDRBT0sxZGM0eVRNaTBoV3MvUFBUYTFWYW5qRU80NkRkbVY1Y1ZaSEs1?=
 =?utf-8?B?WHpDWXNGc21BRW5MRDBVTU9BclYvNEtMbzhzZWZ4QjVUVE5MQ2tvSzVYaFdL?=
 =?utf-8?B?TUZTdThaejNKVkRLdFgxMis3Q2VQcGNWRUdsVmo4Q01RQUJ3dzhTNWhYMnpZ?=
 =?utf-8?B?ZEZvaHBXa2ZSNWQyQnVYdkxGUDRDR3p6MnpyS2U2S2N2WWpmZEwwUmhaVHNU?=
 =?utf-8?B?aXM2K2s5OHJIVzY5N0psYU90STZEdVVFdXJBUm91VGRMVkE5TnNMMk5uK2Zw?=
 =?utf-8?B?WFk5bWh0emg3bTNJVFRxMWFucUhLb2lXcERuZzl6QmZxNGNoNWxKY0NmUXFN?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4057DF5668D4B449AECDD58A83D43E69@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b3c65d-2afa-4982-f250-08ddca005756
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 15:48:17.0143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12HalMcVhWCnPun5bwYclEGtA/fWwFN9v5DKeJQszBSqenUH3CPOI9brZPS0w/gbHth0awSP/B3Aq7KP6rSTix2iP8kP/bTMkfKByunVUlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7905

DQoNCk9uIDIzLzA3LzIwMjUgMTg6MDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4wNy4y
MDI1IDE2OjMzLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IEhpIEphbiwNCj4+DQo+PiBP
biAyMy8wNy8yMDI1IDE3OjI3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyMy4wNy4yMDI1
IDE2OjA1LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJt
L0tjb25maWcNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+Pj4gQEAgLTE5LDYg
KzE5LDcgQEAgY29uZmlnIEFSTQ0KPj4+PiAgICAJc2VsZWN0IEhBU19BTFRFUk5BVElWRSBpZiBI
QVNfVk1BUA0KPj4+PiAgICAJc2VsZWN0IEhBU19ERVZJQ0VfVFJFRQ0KPj4+PiAgICAJc2VsZWN0
IEhBU19ET00wTEVTUw0KPj4+PiArCXNlbGVjdCBIQVNfRE9NMA0KPj4+IFRoaXMgd2FudHMgdG8g
bW92ZSBvbmUgbGluZSB1cCwgZm9yIHRoZSBzZXQgdG8gcmVtYWluIHNvcnRlZC4gQnV0IHNlZSBi
ZWxvdy4NCj4+Pg0KPj4+PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4+Pj4gKysrIGIveGVu
L2NvbW1vbi9LY29uZmlnDQo+Pj4+IEBAIC0yMSw2ICsyMSwxNCBAQCBjb25maWcgRE9NMExFU1Nf
Qk9PVA0KPj4+PiAgICAJICBYZW4gYm9vdCB3aXRob3V0IHRoZSBuZWVkIG9mIGEgY29udHJvbCBk
b21haW4gKERvbTApLCB3aGljaCBjb3VsZCBiZQ0KPj4+PiAgICAJICBwcmVzZW50IGFueXdheS4N
Cj4+Pj4gICAgDQo+Pj4+ICtjb25maWcgRE9NMF9CT09UDQo+Pj4+ICsJYm9vbCAiRG9tMCBib290
IHN1cHBvcnQiIGlmIEVYUEVSVA0KPj4+PiArCWRlcGVuZHMgb24gSEFTX0RPTTAgJiYgSEFTX0RF
VklDRV9UUkVFICYmIERPTUFJTl9CVUlMRF9IRUxQRVJTDQo+Pj4+ICsJZGVmYXVsdCB5DQo+Pj4+
ICsJaGVscA0KPj4+PiArCSAgRG9tMCBib290IHN1cHBvcnQgZW5hYmxlcyBYZW4gdG8gYm9vdCB0
byB0aGUgY29udHJvbCBkb21haW4gKERvbTApIGFuZA0KPj4+PiArCSAgbWFuYWdlIGRvbVUgZ3Vl
c3RzIHVzaW5nIHRoZSBYZW4gdG9vbHN0YWNrIHdpdGggcHJvdmlkZWQgY29uZmlndXJhdGlvbnMu
DQo+Pj4gV2hhdCBhYm91dCBub24tQXJtPyB4ODYgaGFzIGEgRG9tMCB0b28sIGJ1dCBkb2Vzbid0
IHNlbGVjdCBIQVNfRE9NMC4gSXQNCj4+PiBhY3R1YWxseSByZXF1aXJlcyBhIERvbTAgZm9yIG5v
dywgc28gdG8gbWUgSEFTX0RPTTAgaXMgYSBtaXNub21lci4gTWF5YmUNCj4+PiBIQVNfT1BUSU9O
QUxfRE9NMD8NCj4+IFJpZ2h0IG5vdyBET00wX0JPT1QgaXMgdGhlIG9ubHkgb3B0aW9uIGZvciB4
ODYgc28gSSd2ZSBtYWRlIHRoZSBjaGFuZ2VzDQo+PiBvbmx5IGZvciBhcm0uDQo+IEJ1dCB0aGlz
IGFzcGVjdCBvZiB4ODYgaXNuJ3QgcmVmbGVjdGVkIGluIHRoZSBvcHRpb24gcHJvcGVydGllcyBh
Ym92ZS4gSW1vDQo+IGF0IHRoaXMgcG9pbnQgeDg2IHNob3VsZCBoYXZlIHRoaXMgb3B0aW9uIHNl
dCB0byBZIHVuY29uZGl0aW9uYWxseS4NCj4NCj4gSmFuDQoNCkZhaXIgZW5vdWdoLiBIb3dldmVy
LCB0aGlzIHdpbGwgcmVzdWx0IGluIGFuIGVtcHR5IGNvbmZpZ3VyYXRpb24gZm9yIG5vdyANCm9u
IHg4Ni4NCkkgY2FuIGFkZCBpdCBpZiB5b3XigJlyZSBva2F5IHdpdGggdGhhdC4NCi0tDQpPbGVr
c2lp

