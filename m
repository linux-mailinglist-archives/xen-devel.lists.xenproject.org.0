Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7C2A5444E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903060.1310979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Jp-0001ut-NF; Thu, 06 Mar 2025 08:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903060.1310979; Thu, 06 Mar 2025 08:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Jp-0001so-J5; Thu, 06 Mar 2025 08:11:01 +0000
Received: by outflank-mailman (input) for mailman id 903060;
 Thu, 06 Mar 2025 08:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWNN=VZ=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tq6Jn-0001sg-GF
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:10:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2614::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86747253-fa62-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:10:54 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB6874.eurprd03.prod.outlook.com
 (2603:10a6:10:1f4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:10:51 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8489.025; Thu, 6 Mar 2025
 08:10:51 +0000
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
X-Inumbo-ID: 86747253-fa62-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UquG9Pk94P1xTxnGEE165xO4m32LeUYajF6DfmqLIYVQzmpiCOVZJkfziUbjMKRfhesrqxWbKIM4jArOMD6aNVmq1OntUhfjenAq8bDM7MVjJNsuhDYD1kGCrQWcxom/7v6dstvUTL8EVYxGmF8eP7ci6HBC4UDUU9lNy8qVrrBCnEDD4RxIuUYwo4atwAYRbDv6j/BMKGjU7hR+BYX7SPxIIa6y3eg3FIMLfOSn5EBkCWZEHTbCCkMOyujyFgtYHFbn6439QEZffVMgCVzCg5GZ+cagBOldoq1w4vPnnn4NnvW3QNk3qIyU8+DOUweyZzq/jXmqx8LQMx9m8Z/iYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVMiPmngu3IyrHcB/w5k6DACR3bShn+wAjZL+KGN7Lc=;
 b=KSCcI0LfNPDq2YjdZjnWn9hTfeigKIdgAvANkGgEfE9Bj2xnFkUtb11DprYJLrDyufs6iGNatpFWJYZNRegynW9uP2B5sY6BaVRW7dUzsgk++asBuN06VpoI2iodU863MVU3dUgUCnN3j7x7Duh9htc0wWI0BNAbDhk2Hzdeyq4lyUhRHCxRFUlNVhIWUmC3CrIl817dKeP2XrwC8VanWm46Q2dGTH0GqIDI28mIdMvR5XMt/0b97zxUKKo6XlkPVDZa1Sc7SUyvxSIzBcSYiW0pelT351qNlaF53sutIrOszbkA3kaXPDseMnAwU31DFM/tT1e/1/BjY29zn4LbjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVMiPmngu3IyrHcB/w5k6DACR3bShn+wAjZL+KGN7Lc=;
 b=cpqVMxa1rIAcx7b4oR4eQ8jVD1SiQlh8f9yIFTEgsSk69yQw5Ntw4K1FobqbfsPFAhsrTV2kzxm+FEfUM/ZbwAC2l36tLuXk8yoshGlEIEk1+kZMe0cnspYUTA/RP1giNqgKppHOt3+2E6Hc7fMJmmt5dv23deodHVPrqCa7IwlILzgCmS4OY/Xws3mg8Ohv6UxOiRMDLpgixC/H6TquLFOvMkvURPveBM+9wuCyKqa9RZEV3bhP07bjU4CYv54aNU48upGYtBTowIFAz+fpbmpCoBVnZroLRny4Jg9el8mp79yJ3vYUB8QRmLUi2gg3VQZuXRWLeFLEUef9teXOyg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/7] Add support for R-Car Gen4 PCI host controller
Thread-Topic: [PATCH 0/7] Add support for R-Car Gen4 PCI host controller
Thread-Index: AQHbhp0NQBdW76R7SUWOEr9t9KgJjLNlI3wAgACt1QA=
Date: Thu, 6 Mar 2025 08:10:51 +0000
Message-ID: <84bd9259-c326-4c41-b5c5-e26c185b4905@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
 <alpine.DEB.2.22.394.2503051346270.1303386@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2503051346270.1303386@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB6874:EE_
x-ms-office365-filtering-correlation-id: 294b542c-9d9c-42aa-908e-08dd5c866903
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SXZIQS9HSW1Kelh0UVRBczVENEFKeXZ5TkFtK0ppQjlOZnNROEJVOExLYVBZ?=
 =?utf-8?B?aDZhbytWendkU0JZN0pLNmFLZ1MrTHVsb3FCQUluYUNpOW5mcVVRRzFXQ2c0?=
 =?utf-8?B?YTdOekFNalh1bVBqZmp3Y292ekMrc2FxaWM5QXcrcXliRFJUa1kwaUFjNVI1?=
 =?utf-8?B?aXo4TDFwRVY4Q0RsWGxhS1dOLzdVZFJ3a1Nxbm9JZ001UXN4ZC9rMURFL3dE?=
 =?utf-8?B?QkRNODhBeU1tbXVGa2htRVMrMUVHTGJ6RkJjb3poOFczLzE3djdkc1g3WHZK?=
 =?utf-8?B?RFpCMWpGaTVJL2N3Y2VpbHRZYVRFeVp2NDJTYmU4d3JJK1ZCSlBFTEZwRHE0?=
 =?utf-8?B?STI5OGxyYlpZNExkY2E0cVhHUEJ0c3RONzM2MzU0OXgyRWZaZzFPaFZKeFo2?=
 =?utf-8?B?VW10WXFNZ0tvRSthL1FUMzRPWldLdWVuUkFPNDJBdDVyRkJFZExENGMxQ0lZ?=
 =?utf-8?B?QWZ1SWdva3NKZS9zbUwzYXhacEl0UnZjZ0thd1QzQzFWK1ViTDcvaFVuaWdC?=
 =?utf-8?B?dnk1N2FRUnBXbisrRWFrMi9UVlJwaU5lcTBDOFVrQldmTCtucjdRNEtPZDlv?=
 =?utf-8?B?aUtkK1BGL2VmWVN0MnMreVZxUUF4akdsQjljS0hXNldaamRSL0hsQ0pFTnBD?=
 =?utf-8?B?cWJYdVRhRTB4QTYyeTZyb1IweHVzUmZFbkdCUjBBdE5nNWorN2Y1L3h0R1NH?=
 =?utf-8?B?ckwwVTZGazExczRoczgrVWIwU1BCRXFNUlorRjF6b1JXWjVQbXgwZmxGSU5V?=
 =?utf-8?B?ZTlkUWFlZFQweVdlaEJiWXJSYjBpTVZBclU4KzE3T0pVdnF3eWJ6UGd0dTFv?=
 =?utf-8?B?VnhiM3dFeUQrcGZmVExML2lVOEhOWUduZjJXTlNYbnF3dU9QOWJTZXAwdC9B?=
 =?utf-8?B?d0FadktISHVBTUJCbjF5b21zTG9TaXQxcElkRVlldTh4RWh6NGNjNHlvRnlP?=
 =?utf-8?B?NVQ2Q240RXVRWjhUMmF3TGZzYldsK1p5bVZscm1qTmdQd0RXcXcyRjV5cWhM?=
 =?utf-8?B?QldjUkx4d0F4NEVKM3NCanF4LytBMTdTTkdHK1ZmQ0pqSU14Wi9JVy9sYnho?=
 =?utf-8?B?aE96UXB6SzlGTE5JcHRDUndGVFBOYWcrMWhCd3NqMDh6N1p3RDB5OC9WbXNW?=
 =?utf-8?B?S3JwVDQrY1J3OEtFeS84WlJTTDAvbytHTzVKTklnSWVsK3BDKzF1ZE1vM00v?=
 =?utf-8?B?ZGpuMjdzcE5SaHliY2grUEV5dDdJdHFRanN5YkdRVFFCR0oxSjlrNHByVHZm?=
 =?utf-8?B?cnVaL0x0aUFVR2RTSFVaTnFtcXZxL1hHayt0cjdxK29nVldRWFIrcGp6TTZH?=
 =?utf-8?B?UVhUdWpzZXQ3dHNoOGVwQ0dZQ3A1S3owUFJxU0Irc09VbUV6U2Q1RFB2OFpF?=
 =?utf-8?B?NmJJREVLWllWOGNlZUVxMFA2eWVKemxyL0ROeWpFK1NYWmlvZWNZd3FlblRi?=
 =?utf-8?B?dnlkeG1SL3g1ZHRkSXlTYWxWQVBieUppMjBaZDFPajZJTkNuQXlPQUNsUnZa?=
 =?utf-8?B?QXFSWmhYVGo2ZG1qc1V2UklzMFJvem5nOGNabWhwU2p5ZnVySnJjeTZISFdR?=
 =?utf-8?B?VXFFekN2TU1JcFVGSFR0MVFMMEd2ZTFnVWFnOGwxQ05YQ1JuQnhHZzJjM2JE?=
 =?utf-8?B?TEgrbWxQUmJxT1FHYlpLV1RnMm1zdlV0Uzd5NnhWSE04VUl3VmwvWFVGMEV4?=
 =?utf-8?B?YjhBSnE5by9PajFPSy9YdEZXZ3MwMTJRRnlwUVVNcmtaR3d1TSs0M1RrVGFu?=
 =?utf-8?B?alZMdm8wNHlNWGhWTDdRWlZKNTNMSDFQYklCT1R4Vm5GQjNMeSsxSzZvVlRv?=
 =?utf-8?B?ajJDUEtwSCtkOGt1c1VGTEg1UERLOUIvcEtiL01rSTdOVlJHWkZtZzh2OTJD?=
 =?utf-8?B?WWcyQlFpYTdPQkQ5aVk1WVRBeTJqc2g1M2lRRUdUOW1LWHNRVENOS1NpNVA3?=
 =?utf-8?Q?0HBR/n8SglavdK+qtH7MKtLeZosVMFPB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cHFUQWt6NTNGMGFwUERCbFNDVzExZXl5N09ZZUFTSGFuRkZncE9qWStab3Qr?=
 =?utf-8?B?d0ZwZ2ZBYmxSd2VRMHNreExhU1ZWWDNPcm9YeklYVlp0SjNCMmtab2Y3aWth?=
 =?utf-8?B?QU9kOC9lakRzTmU5NXFkTlFUTW9HekxRMXpFZTl0VDloZWhDT2k2MjM2eUI5?=
 =?utf-8?B?bG9VWUtMeCt0d04rZGRmYTEvL2lVcVFldHJEMXF2bUVwNi82YWczdDZpZlVJ?=
 =?utf-8?B?a2YwaGZmRjhqeWdYVmd5NlEvYmdNb2NjeEFRSzcvQ2FlVllsODVLbXp4amMz?=
 =?utf-8?B?VW5ueUM0S0Y3Nmd6S2EzaitpRWZTd0VUUWxRNWl6cGs4SlhuVnUvVW5BUzkz?=
 =?utf-8?B?RzRxWUQ5dkQ2WG5IRk80cWJTVDBWS2JKaHlCdzdnNTE3UnhrdzArR3lsR1cw?=
 =?utf-8?B?TzFELzMwQkkwR0VHdHJpNlFyU1hrMG12U21zTFlFaDNMWnpKRTd4d0g3UklM?=
 =?utf-8?B?MzBXQlhZbzZZV083WEFUYThTaW5yeUlMMzdoaGcxVmJITXJPbnc5dndUa2Ur?=
 =?utf-8?B?UDRib0R1YnVvaDVKdWtlbmxxdS9WeGtxWnBtcWgrYnZSdm92NHkwbDVSK0Mz?=
 =?utf-8?B?TUpWYXZaUVBiSHI3VkEvTG1SOXJsbGtraUhNVExsdnh1Y3BycXhwZ2I1eUNh?=
 =?utf-8?B?YkowRzhzczVqRE9xQkFnaGM3Unh4K3NlNXdBYm5OT3B0V3M3OE5aUUF3RlVq?=
 =?utf-8?B?azNpbmoyL0tiNFZJb1puOTlMTWRxRnZtT1dwdVg1RWh1YWtYZ0tuMkNnNUVm?=
 =?utf-8?B?UTJNc1E1ZGJVdTZUQlVWV3g1Ky9ObTJEeE9RTDlzNWJyMWM5by9xd3ZOZDYw?=
 =?utf-8?B?aGJNaG85UWR3dHErTCtaOXRubjRBUW54K1dYd3BWRExVR3JRNjYySEhPbGhB?=
 =?utf-8?B?RzEyVlNhbzJZRE5WaHlVQ1JRS0R4c3gvaFlwL1ZCMWxNMUczZllGZ1BjL1JS?=
 =?utf-8?B?Q1laQ1JzWmptZ0ptMjdPVUtsb1A5bXNsRWljT1cyWlRhNEpLVFd2QTdVQkZV?=
 =?utf-8?B?SWM0UzZ5dGxCWklHNnAvcmlTOFdMaVJHOStvOEU1UCtTYTg0M3V1NkczMEw3?=
 =?utf-8?B?OGpieGJXVS9HdSt5SmNGbGtEWmovaitnWUdoRFRZR3pRT0pIelhJYUxuU2ll?=
 =?utf-8?B?RjA2aVpVRzlQM2grTVJZSDVPVjA2S1g3azUxd1BhbVV6ZFgwbnNsM3ZTSzRq?=
 =?utf-8?B?ODEwbEp1R3dPcDFzM0ZpVFlmMGtPNUJTNHRmMFBLOElIZTZ3WTR1b2M0K2Fl?=
 =?utf-8?B?SytXT0x3K1lzRTFEemgyWGxnaDA3SmVtNWZkNlpZMHBVMzVqdmN5WHdESkNz?=
 =?utf-8?B?cmV2bE1vVE5TckJWN2FlWVVSUy8xdmlyQkZ2UjJBMUszZzhSTWVINlRaMU9Q?=
 =?utf-8?B?UTc1RmoraC9CeGs2Q2VYNC9vNjJXUkZKS3UzL3YyVGNJRGVkK1ZEL045a0Mv?=
 =?utf-8?B?Z01yaEF4cDBUTW43N0d0RDRsK2dqVlpWZW9kZHhLK1M4SmRQMXR2ajFGRU1S?=
 =?utf-8?B?ckJVQzdqM0RYOXc2U1FmcXVSZ1VxRUVHMTJSOXFGVFNRbzNkL3lSYjNZc09O?=
 =?utf-8?B?bjd0Z2R0dVVSSDBIakR5Y3hYZkZnYWVTejk3dDBDcVlsWVlWTW9PNE5tbmhR?=
 =?utf-8?B?OW82RVBSdlArNmdLN2dHM0JjV1M0Mi9GV1ZSRkpTTUUybWhHbWxiOVhWMGNE?=
 =?utf-8?B?UDQ2MlhWdGlUK2h3dzQxUDk4MjBjVzJ6MysyalBDcmY0SngzOEFXOGFJM2w3?=
 =?utf-8?B?TmNYMG5ZZWxLVzF3dlJvQzBPTnJuVmtvUlU2MXBkcXE1aGg2bjQ1Uk54NTB4?=
 =?utf-8?B?WHZtdVJVWE44TVZEOC9vaEdHckhuRnMrTEU0UGtJQ3YyaGNSVmVYNlV6Yk5O?=
 =?utf-8?B?Ly9NZ05QZVU2SkNYa2RKWnZNd2haUGlycTZzbFVOV3RBTmIyeFdwdU1EK2U4?=
 =?utf-8?B?OXJRT0xCb1Y4NkhYNnVLWldSVXZndlJ3Y3hkR0JDZ2lFVUFXaGVTaTVleVlF?=
 =?utf-8?B?eW1iZytmRGJKTCtvNTM1Q3RVRStwemlSUDQ0TSs3NlpBZTFvWUJRZVdqQXJx?=
 =?utf-8?B?bDdDSnZSOXo3WnNpY1Q2MUg2eEJGbXFYMVQyVEFYNUJmUmEvejRNTDFsdjBO?=
 =?utf-8?B?TFdmRndreFR4L1Q2T2daVkZwWUt6S1pSSlhDMlhUUEx5VTVKUU9KMDcrSERh?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35A69084EA220140A4F12499DC678E80@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294b542c-9d9c-42aa-908e-08dd5c866903
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 08:10:51.3603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UC0mqmOKHiYLd9lRPLVCICW7BpuM9mEz+vvU/V1h/Q0pOohWGpjTe7GYiU4VKnpqSEJEKw6XNjlvX3rH7pSRDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6874

DQoNCk9uIDA1LjAzLjI1IDIzOjQ4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIE1v
biwgMjQgRmViIDIwMjUsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gVGhpcyBzZXJpZXMgYWRk
cyBzdXBwb3J0IGZvciBSLUNhciBHZW40IFBDSSBob3N0IGNvbnRyb2xsZXIuDQo+Pg0KPj4gVG8g
ZnVsbHkgc3VwcG9ydCB0aGUgY29udHJvbGxlciwgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIHdlcmUg
bWFkZToNCj4+IC0gR2VuZXJpYyBtZWNoYW5pc20gdG8gc3VwcG9ydCBQQ0kgY2hpbGQgYnVzZXMg
aXMgYWRkZWQuDQo+PiAtIFByaXZhdGUgZGF0YSBmb3IgUENJIGhvc3QgYnJpZGdlIGFuZCBtZWFu
cyB0byBhY2Nlc3MgaXQgYXJlIGFkZGVkLg0KPj4NCj4+IFRoZSBzZXJpZXMgYWxzbyBpbmNsdWRl
cyBhIHdvcmthcm91bmQgZm9yIHByb3BlciBBVFUgcHJvcHJhbW1pbmcgYW5kDQo+PiBvcHRpbWl6
YXRpb25zIHRvIGxlc3NlbiB0aGUgcGVyZm9ybWFuY2UgaW1wYWN0IG9mIHRoYXQgd29ya2Fyb3Vu
ZC4NCj4+DQo+PiBUaGUgc2VyaWVzIHdhcyB0ZXN0ZWQgYm90aCBhcyBhIHBhcnQgb2YgdGhlIHBj
aS1wYXNzdGhyb3VnaCBwYXRjaGVzWzFdIGFuZA0KPj4gc3RhbmRhbG9uZSBvbiBTNCBhbmQgVjRI
IGJvYXJkcy4NCj4+DQo+IA0KPiBIaSBNeWt5dGEsDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhlIG5l
ZWQgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzIGluIHRoZSBjb250ZXh0IG9mIHZQQ0kgYW5kDQo+IFBD
SSBQYXNzdGhyb3VnaC4NCj4gDQo+IFlvdSBhbHNvIG1lbnRpb25lZCB0aGF0IHlvdSB0ZXN0ZWQg
aXQgYXMgYSBzdGFuZGFsb25lLCBtZWFuaW5nIHdpdGhvdXQNCj4gdGhlIFBDSSBQYXNzdGhyb3Vn
aCBwYXRjaGVzLiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggc2VyaWVzDQo+IHdp
dGhvdXQgUENJIFBhc3N0aHJvdWdoPw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gU3RlZmFubw0KDQpI
aSBTdGVmYW5vDQoNCkkganVzdCBjaGVja2VkIHRoYXQgaXQgZG9lc24ndCBicmVhayBhbnl0aGlu
ZyBpZiBJIGZvcmNlIGVuYWJsZSBIQVNfVlBDSSANCm9uIHRoZSBjdXJyZW50IG1hc3Rlciwgd2l0
aG91dCBhZGRpdGlvbmFsIHBjaS1wYXNzdGhyb3VnaCBwYXRjaGVzLg0KDQpIb3dldmVyLCB3aGls
ZSB0cnlpbmcgdG8gY29uZmlybSB0aGlzLCBJIGhhdmUgZGlzY292ZXJlZCB0aGF0IEkgc29tZWhv
dyANCm1pc3NlZCBzb21lIGZpeHVwcyBkdXJpbmcgcGF0Y2ggcHJlcGFyYXRpb25zIHNvIHRoaXMg
Y2xhaW0gaXMgc2FkbHkgbm90IA0KdHJ1ZSBmb3IgdGhpcyB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMu
IEFuZCBJIGhhdmUgYWxzbyBmb3VuZCBhbm90aGVyIGlzc3VlIA0Kd2l0aCB0aGlzIHdoaWxlIHdv
cmtpbmcgb24gb3RoZXIgc2VyaWVzLg0KDQpTbyBwbGVhc2Ugd2FpdCBmb3IgVjIgYmVmb3JlIGxv
b2tpbmcgZnVydGhlciBhdCB0aGlzIHNlcmllcywgSSB3aWxsIHNlbmQgDQppdCBzb29uLg0KDQot
LSANCk15a3l0YQ0KPiANCj4gDQo+IA0KPj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gKDQpOg0K
Pj4gICAgeGVuL2FybTogYWxsb3cgUENJIGhvc3QgYnJpZGdlIHRvIGhhdmUgcHJpdmF0ZSBkYXRh
DQo+PiAgICB4ZW4vYXJtOiBtYWtlIHBjaV9ob3N0X2NvbW1vbl9wcm9iZSByZXR1cm4gdGhlIGJy
aWRnZQ0KPj4gICAgeGVuL2FybTogYWRkIHN1cHBvcnQgZm9yIFBDSSBjaGlsZCBidXMNCj4+ICAg
IHhlbi9hcm06IGFkZCBzdXBwb3J0IGZvciBSLUNhciBHZW40IFBDSSBob3N0IGNvbnRyb2xsZXIN
Cj4+DQo+PiBWb2xvZHlteXIgQmFiY2h1ayAoMyk6DQo+PiAgICB4ZW4vYXJtOiByY2FyNDogYWRk
IGRlbGF5IGFmdGVyIHByb2dyYW1taW5nIEFUVQ0KPj4gICAgeGVuL2FybTogcmNhcjQ6IGFkZCBz
aW1wbGUgb3B0aW1pemF0aW9uIHRvIGF2b2lkIEFUVSByZXByb2dyYW1taW5nDQo+PiAgICB4ZW4v
YXJtOiByY2FyNDogcHJvZ3JhbSBBVFUgdG8gYWNjZXNzZXMgdG8gYWxsIGZ1bmN0aW9ucw0KPj4N
Cj4+ICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BjaS5oICAgICAgfCAgMTYgKy0NCj4+ICAg
eGVuL2FyY2gvYXJtL3BjaS9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKw0KPj4gICB4ZW4vYXJj
aC9hcm0vcGNpL2VjYW0uYyAgICAgICAgICAgICB8ICAxNyArLQ0KPj4gICB4ZW4vYXJjaC9hcm0v
cGNpL3BjaS1hY2Nlc3MuYyAgICAgICB8ICAzNyArLQ0KPj4gICB4ZW4vYXJjaC9hcm0vcGNpL3Bj
aS1ob3N0LWNvbW1vbi5jICB8IDEwNiArKysrKy0NCj4+ICAgeGVuL2FyY2gvYXJtL3BjaS9wY2kt
aG9zdC1nZW5lcmljLmMgfCAgIDIgKy0NCj4+ICAgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1y
Y2FyNC5jICAgfCA1NDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB4ZW4vYXJj
aC9hcm0vcGNpL3BjaS1ob3N0LXp5bnFtcC5jICB8ICAgMiArLQ0KPj4gICB4ZW4vYXJjaC9hcm0v
dnBjaS5jICAgICAgICAgICAgICAgICB8ICA5MSArKysrLQ0KPj4gICA5IGZpbGVzIGNoYW5nZWQs
IDc2NCBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtcmNhcjQuYw0KPj4NCj4+IC0tIA0KPj4gMi4z
NC4xDQo+Pg0K

