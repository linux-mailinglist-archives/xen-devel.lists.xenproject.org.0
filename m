Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKhJKcoUy2k1DwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 02:26:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E2362A44
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 02:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268207.1557519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Mw0-0005qi-Ko; Tue, 31 Mar 2026 00:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268207.1557519; Tue, 31 Mar 2026 00:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Mw0-0005nn-HL; Tue, 31 Mar 2026 00:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1268207;
 Tue, 31 Mar 2026 00:26:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w7Mvy-0005nh-FY
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 00:26:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Mvx-00Co09-Ct
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 02:26:17 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69cb1464-5cb7-0a2a0a5109dd-0a2a450c851c-40
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:26:17 +0200
Received: from [52.101.84.96]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69cb14a8-f93d-0a2a450c0019-34655460c057-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:26:17 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7316.eurprd03.prod.outlook.com
 (2603:10a6:20b:261::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 31 Mar
 2026 00:26:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 00:26:15 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2DDE0vcT4ZsaAq4ZnSmL/+GFGihfg7TOJNd9sASYaj+M9YOPGqxBLk1GfhgJLXmysG0FnDzoWk7kCGg/AAwcMlG/agP7zkrABrWO0Wad0xi4cO3Fgb5wvQsc835ecuFOjqqfgi5/lmO+UuBegJGZJDoTmceC3lh7kwA7X1hGTBLpGnCdYUxb/55RQ7FWArdgHttJDde8lnUq9pzwZIbKjx4ra2cvDewK4PZIRFnRPrFIhh3I/Vui5Ee/yb/Cfq1JIDNSvBC7wlsoweZRdylkeb5azdndElmUxevLnJVgv1FmNoc8UIp+rE5u6ClkBxe9oJzTW0u4E1SSBr4Qrn5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T8xl06VwrfDmJIbAUAM3zwIyafaALPF0ShcxU1b/34=;
 b=A3LllvFmFNhjsWjuHgas13XkhcbUEO/QN93NUn8J6pZCXzz1niliFGwxcLvtI6yZ40gKz4GbGHA9ZQ6hoXoxkEDl6nVT8SrLA0TZnEka4K5ZWhmZoIhBTagwAmOJiX9MEjyKtaTT4WtQN6QVjv5AxjU7jNLbkBq72cWQ9BQbLoylPeahHDLKPyQQxg3gRaycQ0FDCFZnz3KuDcDn0+9yBfHUuBE2F5siszg0GtW50qDzdbmHghESqBKsDLvsR5ZEhAcavnQ9VND5BSyws5XtFMsid4ChnDut3U5sGVg68wZ+9QeV6ov5TTBWcFQWB1LT9GeHPV7Zz09cgGAinOERnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T8xl06VwrfDmJIbAUAM3zwIyafaALPF0ShcxU1b/34=;
 b=Ux3KJWVW01JAhjJJwDT7fN/6sPpP4X8sPabsFjdWq19RmUDE1YErvkMNA8APKoJ0oczJr6b3RnLRU/2TevE1agem72GeZA34nnec+iVy62cxY1i7NCwG4xAl39GQNfdzbTtYaLIOcV+ziIpMgyEozGCqDTJ+sXwGz5vaOsj7o5uYzGGhJM88NITVI5kncCEm5PKsdfBhmGey9Q7uAcGVvtDqk/vFJek3c3iYNWEKMNPbsahF5bypyc5sNwo3gbsOY5rqUdsMUFRudrE/7BZUKuEetQk9D3Nujj7yoAPga+zQtqUXEDYK/YJ6Cea8XB4XS/tcr4+FfJ4KCEDtq9cmCg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/4] xen/arm: its: add platform match callback for ITS
 quirks
Thread-Topic: [PATCH 2/4] xen/arm: its: add platform match callback for ITS
 quirks
Thread-Index: AQHcvEPkvPnBPPoH7U6Wnzsnt2hLeg==
Date: Tue, 31 Mar 2026 00:26:14 +0000
Message-ID: <87a4vovo7u.fsf@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
	<10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
	<87341ovugw.fsf@epam.com>
	<CAGeoDV_1Zzh8pxBe=Mf7Yu1OXfNhzH7aFpsT+ktM62DwK-ropg@mail.gmail.com>
In-Reply-To:
 <CAGeoDV_1Zzh8pxBe=Mf7Yu1OXfNhzH7aFpsT+ktM62DwK-ropg@mail.gmail.com>	(Mykola
 Kvach's message of "Wed, 25 Mar 2026 18:34:04 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7316:EE_
x-ms-office365-filtering-correlation-id: 56d3a699-2a47-47a5-18f2-08de8ebc1e7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 JWJVNmIYJxQ05dGMWYG0v/TL9h6P+/7IMP/ECfMSgqQ6c0OMBgTIZU+L0ZVfYr6qxx46TJ8EBzUkOtM1+jTC0PATQ4OoD0Ib4glgNwZk7MviT2/i4PBa2yg6xfVHc7vZUEUHnG9eMx0caC27IcATFkLme6GfqMnt7nR1bVCs5dQoQ7BjNFGKcDJu/yag/MLyWUuQZzF2/aTkXbBXmvCXnGBRYuADrIazrdOnsRvX4/o7dykSPLh18I0rfFM8JwadIIMmz/g87gyq5dpjyeAvl+oxXnkEA/MHobd6CCiDrPoLvNwK7vx8cgTNVWIRQwmA8pBdXO9UgKa6S8Hn7cIB9TpBYRBASxgtn5ToKSw+bK+zTFoEiZnD7oVjE0Wngmo+IQCKuqTEUJfxdqPtB6piKLp8U1ItPrKxmctm3wtMBzF/BOEs7b8CBjaDD2mvMD9Jrb5YxdLZN+kQluJGAiiStvYbmijupWOlhBM0G4BeXJFYU6BahcOdKDtU1gfhKsiSHv/zknk61zXQTdn7GdU3P5CPYveEYNRddj3lBL+MlOF63QMiaqIkf5FQdjUFKtnYdIDFaAY6A74f5NPQYi8WdBiAEzEB+80FqgDt2KW+MAX0N5E/zNqsjub8o+zim0jncTOY/YZ0FWAG4VHxXl8M4bGyE7r1vzvhzFWhI97BX+ZD8c14Qjdm829LISswYKCJUHv01VvRNhfcBc9wUUnsLyHLFzGE/m8zvlhid8+1ijmJU4d3dUwKYmHBM3YlDV1nuzkbV5vfQ5yutw2T5pGsVYnuvqJTf2Dgzsk9jCAAOtY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N09LWnJocisrVzhiK3FzazdYNVhDTzQ2TG9ROGMycVJ2UDVLV2REWXNUQnZy?=
 =?utf-8?B?U3ZBbFg2ajkwOGYwSVF2Z0tiNU50RjFHUWNYMUovU0huWW84OTJpU01HZDNM?=
 =?utf-8?B?Z0ZSSVBITS9ZdDN6dm1mV3NrS3RHUnRXZVoxSm9laHFYM2VWNzdIRzN6elJ1?=
 =?utf-8?B?MHlseXp0eS9KeHJYaDZMUDZmelRFaTVEZkkvdjdzNFhqWHhKeFIvY1RLNTJY?=
 =?utf-8?B?TmxFVURnNklCeEJBczE3NnhYQlFodmdpTTgwcnJ2VXZLQ3I0YWhLbEpDTkty?=
 =?utf-8?B?SVU4NkVZRlBZbStCRW9uYWNTeGlabnpQQ1ArdEM2VGlNS2V4R3M1RTBGYVJS?=
 =?utf-8?B?U0hvNjZ3MG1tR1ZTYXpHSnRqbkJlZ2cwc2ZXTDFUdCtqMDhFeEFXZm4wemov?=
 =?utf-8?B?NFBrVEV2aWFTdzd6VllET2MzdlpCVVpXYmdQaHJOa2N0Mk1JRVVtdTFieVdu?=
 =?utf-8?B?aUpNcXZPaENlS1M4bFd2Vll3b0ZVdzA2VHV0Qk9YVnV4dThGVDhGSzg0ODV5?=
 =?utf-8?B?ZVVlTFAyOHpna0kxMUQzeDZoOHkySFJkUXEvV3dUZElQRnhTOVlSNWxJTm1X?=
 =?utf-8?B?OVQ2L0N0TE43RmtLbkp6SEgxZkpFOTNERnNleXo1Z2VxRUhGMzRsR01RNExz?=
 =?utf-8?B?L2xrWHcxUGNFb0MrYXF2NnRjVk9RaDhPb3VEV2dpRW5ocDFZd0tmcUNDNmMz?=
 =?utf-8?B?YXBLQjk5NTBNZUthQVBCUTVzcTM0K1UvdVZvWkhWZ3JPV1B6WitqcmV4cnNE?=
 =?utf-8?B?bXBvL2QrbGpQQWI3Y0tYNkNMRUhJNVZxNGpoWmIxejQrWHg0QnpTaXh3NjNN?=
 =?utf-8?B?UTU1WWZpMzFwZWdveGJyK29FcFAwUTZ0OXJ4T0JvT3BjRVc4WkQ2YVVYbEVh?=
 =?utf-8?B?WFZrcXJ3UzVieVF3ZjIwcERTOEFaZ01PZWNESmxnVE5FeHprTTRmbkxQOS8x?=
 =?utf-8?B?VSt1bnBzd1JGWklXTm5QUG9tQjdFWVcxQjkwV3hYU01SYUNjeDA1dmJteTY2?=
 =?utf-8?B?SHNra21aVUtXdmJ6L3EvR0dlV2J1U1pPSExRNnFNUFdPVkczS1ZHSTdmbFJ4?=
 =?utf-8?B?TURJN3BJRkpCRlRHOXFLdjEyL1kvWHVwSGN2U01TVnBGOE1jUTN5aC9YSmlC?=
 =?utf-8?B?ZjlxSG5EOEFLUHUzRlBKK3c4TUVJbUNrVGVmbC9XSklmUm5jaEhsdTFnU3BH?=
 =?utf-8?B?eGRiVS9YZVBzUEhjNGFsbzVEL2t0U3hYb3ZLTzVvS1ova1BFU3puWTdVbGFk?=
 =?utf-8?B?TjFESVFXRHdsMno5dEkvNnJRWlM3ZlhPUHdBZVJSdjRQVlJVK0tYOS8wbnI2?=
 =?utf-8?B?WVFNbW56Z3UwWFJ5MXFTMFM0b05yZll6M0J4b1cvazNkYXVWVkNId2xHdDJP?=
 =?utf-8?B?eTd0ZWdOQjNtSFIwZ1pITFFxVm1vMHhBK1p1dTJvZk1WWUpqbkJMMzl3T2d6?=
 =?utf-8?B?UklmYVNoYmpSeDczYStsUGNrL0dTSm5tSGcrQnQzSC9ydFpKejQzVGV6VFdZ?=
 =?utf-8?B?TEY3K3pwNnpTbjNiTm0xQ0lsZmREYTEwOU5MU1pVRUNvM3JFVko0dnYvbkFY?=
 =?utf-8?B?aVNiTThQbXJCWWt0Y0NyKzZxamMyVEJCZ2kyR29OZDFDU0o5SXQ0TUpnKzlE?=
 =?utf-8?B?TnlGL3poekRRdFdleVhvVXdrR1dTWmtQbkhKSmJYSGVnVkRHNm5ZcDFPdHZy?=
 =?utf-8?B?SDB1SEp3YW91RURwdnhGK2xVY2J0OStKTUhaT2xmd21BZTdIUWtPT2ozR2xF?=
 =?utf-8?B?RWJrQWFFeURyWWdzZ3dROG1kS1BZL3pUdERRS1BzdDFJaVJETjBaem53KzRD?=
 =?utf-8?B?SkVaV0c1bXVQV0J5cFBjQkUyb2ZSZGdxbW5WU1A0eWVIQjk3V2hnMWwyM1dq?=
 =?utf-8?B?UmF5c09BNGlGbHIzbjJnSnJJeUUwV0hYcEo0Q3g3Y3BFYUhzam5zYlRNYTdy?=
 =?utf-8?B?ZGhMWHVNZjJTV0g1cFBQQ2xZQkZHWHJCcGtpOWEvNnhoQ1YyRVUrbXBKR2Rl?=
 =?utf-8?B?SmxkTE5aUUlDQ09LUmdOZ1FrbEJ5bVdNZ0hteElGRVc2SUwvclRBdWNmZ2cy?=
 =?utf-8?B?bmdFdUNrbFE5ZjUwOEQ5YW53SnY2NC9tN0I0dVZZTENhbENyaW9Ja09Bb3Zw?=
 =?utf-8?B?MnRaMmhpUENMTDA4YllRQjhmN3IwY0dGTnUwR2NvSG0yK3NLWGdNU2p4ai92?=
 =?utf-8?B?Yyt5NHBuMTVVbWVoUGtza3VMVEUzWTNQSUdxUUhaam1KWVdBRDI1OVV2emRy?=
 =?utf-8?B?aVdTd1ZnSk91R1Nlb0pWdzB2Z2JUd2Q2eDdYbWY4cWFsY04wOTBDeUlSUURs?=
 =?utf-8?B?MUpLOUJ3NHNic0s3T0FTZlhmbUpNZkJleURPTmRMQmg3azZHdmV0QXNPS29u?=
 =?utf-8?Q?wm8YNBeCR830ONsU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DD613C7C3A7EC4AA7F0E3A74FBFD315@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d3a699-2a47-47a5-18f2-08de8ebc1e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 00:26:14.9435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izAANrL4B/MbHRY+/IpUSAbFPteIFm9cnOuOdVxWXul+5XemU21SJcOW1ykLFyrNRA/ByookndcetrDD+2H91sc9YmRv/KPaBFtquo2sPRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7316
X-purgate-ID: tlsNG-d25034/1774916777-F52B9734-385F4530/0/0
X-purgate-type: clean
X-purgate-size: 8786
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.832];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E25E2362A44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQpNeWtvbGEgS3ZhY2ggPHhha2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyaXRl
czoNCg0KPiBIaSBWb2xvZHlteXIsDQo+DQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCj4N
Cj4gT24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgNDo0NeKAr1BNIFZvbG9keW15ciBCYWJjaHVrDQo+
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgTXlrb2xhLA0K
Pj4NCj4+IE15a29sYSBLdmFjaCA8eGFrZXAuYW1hdG9wQGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4N
Cj4+ID4gRnJvbTogTXlrb2xhIEt2YWNoIDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+PiA+DQo+
PiA+IEV4dGVuZCBJVFMgcXVpcmsgbG9va3VwIHdpdGggYW4gb3B0aW9uYWwgbWF0Y2ggY2FsbGJh
Y2sgc28gdGhhdA0KPj4gPiBwbGF0Zm9ybXMgc2hhcmluZyB0aGUgc2FtZSBJSURSIGNhbiBzdGls
bCBiZSBkaXN0aW5ndWlzaGVkLg0KPj4gPg0KPj4gPiBVc2UgdGhlIGJvYXJkIGNvbXBhdGlibGUg
c3RyaW5nIHRvIHBvc2l0aXZlbHkgaWRlbnRpZnkgUmVuZXNhcyBSLUNhcg0KPj4gPiBHZW40IGJl
Zm9yZSBhcHBseWluZyBJVFMgd29ya2Fyb3VuZCBmbGFncywgcHJldmVudGluZyBmYWxzZSBtYXRj
aGVzDQo+PiA+IG9uIG90aGVyIFNvQ3MgdGhhdCBoYXBwZW4gdG8gdXNlIHRoZSBzYW1lIEdJQyBJ
UCBibG9jay4NCj4+ID4NCj4+ID4gU2lnbmVkLW9mZi1ieTogTXlrb2xhIEt2YWNoIDxteWtvbGFf
a3ZhY2hAZXBhbS5jb20+DQo+PiA+IC0tLQ0KPj4gPiAgeGVuL2FyY2gvYXJtL2dpYy12My1pdHMu
YyB8IDIyICsrKysrKysrKysrKysrKysrKystLS0NCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4gPg0KPj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2dpYy12My1pdHMuYyBiL3hlbi9hcmNoL2FybS9naWMtdjMtaXRzLmMNCj4+ID4g
aW5kZXggMDA1MjRiNDNhMy4uYzQwNjI5NzMxZiAxMDA2NDQNCj4+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL2dpYy12My1pdHMuYw0KPj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+
PiA+IEBAIC01Nyw2ICs1Nyw3IEBAIHN0cnVjdCBpdHNfZGV2aWNlIHsNCj4+ID4gICAqLw0KPj4g
PiAgc3RydWN0IGl0c19xdWlyayB7DQo+PiA+ICAgICAgY29uc3QgY2hhciAqZGVzYzsNCj4+ID4g
KyAgICBib29sICgqbWF0Y2gpKGNvbnN0IHN0cnVjdCBob3N0X2l0cyAqaHdfaXRzKTsNCj4+DQo+
PiBJZiB5b3UgYXJlIGludHJvZHVjaW5nIG1hdGNoIHByZWRpY2F0ZSwgdGhlbiB3aHkgZG8geW91
IG5lZWQuLi4NCj4+DQo+PiA+ICAgICAgdWludDMyX3QgaWlkcjsNCj4+ID4gICAgICB1aW50MzJf
dCBtYXNrOw0KPj4gPiAgICAgIHVpbnQzMl90IGZsYWdzOw0KPj4NCj4+IHRoZXNlPyBZb3UgY2Fu
IHVzZSBhIHByZWRpY2F0ZSBmdW5jdGlvbiB0byBtYXRjaCBhZ2FpbnN0IGlpZHINCj4NCj4gVGhl
IHJhdGlvbmFsZSBmb3Iga2VlcGluZyBpaWRyL21hc2sgd2hpbGUgYWRkaW5nIG1hdGNoKCkgaXMg
dG8ga2VlcA0KPiB0aGUgcXVpcmsgdGFibGUgZGVjbGFyYXRpdmUgYW5kIGVhc3kgdG8gcmVhZC4g
VGhlIG1hdGNoKCkgY2FsbGJhY2sgaXMNCj4gbWVhbnQgb25seSBhcyBhbiBvcHRpb25hbCByZWZp
bmVtZW50IGZvciBhbWJpZ3VvdXMgY2FzZXMgd2hlcmUgSUlEUg0KPiBhbG9uZSBpcyBub3Qgc3Vm
ZmljaWVudCB0byBpZGVudGlmeSB0aGUgcGxhdGZvcm0uDQo+DQo+IEluIHRoaXMgZGVzaWduLCBp
aWRyL21hc2sgcmVtYWlucyB0aGUgcHJpbWFyeSBtYXRjaCBrZXkuIElmIG1hdGNoaW5nDQo+IHdl
cmUgbWFkZSBlbnRpcmVseSBjYWxsYmFjay1iYXNlZCwgdGhlIHN0YW5kYXJkIElJRFIgY29tcGFy
aXNvbiB3b3VsZA0KPiBoYXZlIHRvIG1vdmUgaW50byBjYWxsYmFjayBjb2RlIGFzIHdlbGwuIFRo
YXQgd291bGQgbWFrZSBxdWlyayBlbnRyaWVzDQo+IG1vcmUgb3Blbi1jb2RlZCBhbmQgbGVzcyBk
YXRhLWRyaXZlbiwgd2hpbGUgdGhlIGN1cnJlbnQgc3BsaXQga2VlcHMgdGhlDQo+IGNvbW1vbiBj
YXNlIHNpbXBsZSBhbmQgc3RydWN0dXJlZC4NCj4NCj4gVGhpcyBpcyBhbHNvIGNsb3NlIHRvIHdo
YXQgTGludXggZG9lczogSUlEUi1iYXNlZCBtYXRjaGluZyByZW1haW5zIHRoZQ0KPiBnZW5lcmlj
IGRlY2xhcmF0aXZlIG1lY2hhbmlzbSwgYW5kIHBsYXRmb3JtLXNwZWNpZmljIGNoZWNrcyBzdWNo
IGFzDQo+IGNvbXBhdGlibGUgc3RyaW5ncyBhcmUgYWRkZWQgb25seSB3aGVyZSBuZWVkZWQuDQo+
DQo+IFRoYXQgc2FpZCwgSSBhZ3JlZSB0aGF0IHRoZSBjYWxsYmFja3MgaW50cm9kdWNlZCBpbiB0
aGlzIHNlcmllcyBhcmUgYWxsDQo+IGRvaW5nIHJvdWdobHkgdGhlIHNhbWUga2luZCBvZiBwbGF0
Zm9ybSBpZGVudGlmaWNhdGlvbi4gQSByZWFzb25hYmxlDQo+IGZvbGxvdy11cCBjbGVhbnVwIHdv
dWxkIGJlIHRvIG1vZGVsIHRoaXMgbW9yZSBnZW5lcmljYWxseSwgZm9yIGV4YW1wbGUNCj4gYnkg
YWRkaW5nIGFuIG9wdGlvbmFsIGNvbXBhdGlibGUgc3RyaW5nIGxpc3QgdG8gc3RydWN0IGl0c19x
dWlyaywgYW5kDQo+IHJlc2VydmluZyBtYXRjaCgpIGZvciBjYXNlcyB0aGF0IGNhbm5vdCBiZSBl
eHByZXNzZWQgdGhyb3VnaCBzdGF0aWMNCj4gZGF0YS4NCj4NCj4gU28gdGhlIGludGVudCBoZXJl
IHdhcyB0byBrZWVwIHRoZSB0YWJsZSBjbGVhbiwgd2l0aCBtYXRjaGluZyBsb2dpYw0KPiBlZmZl
Y3RpdmVseSBiZWluZzoNCj4NCj4gICBxdWlya19tYXRjaCA9IElJRFIgbWF0Y2ggJiYgKG5vIGV4
dHJhIG1hdGNoIHJ1bGUgfHwgZXh0cmEgbWF0Y2ggcGFzc2VzKQ0KPg0KPiBJZiB5b3UgcHJlZmVy
LCBJIGNhbiByZXdvcmsgdGhpcyBlaXRoZXIgaW50byBhIGZ1bGx5IGNhbGxiYWNrLWJhc2VkDQo+
IHNjaGVtZSwgb3IgaW50cm9kdWNlIGdlbmVyaWMgY29tcGF0aWJsZS1zdHJpbmcgbWF0Y2hpbmcg
aW4gdGhpcyBzZXJpZXMNCj4gYW5kIGRyb3AgdGhlIG1hdGNoKCkgY2FsbGJhY2sgZm9yIG5vdy4N
Cg0KV2VsbCwgSSBkb24ndCB0aGluayB0aGF0IGludHJvZHVjaW5nICJjb21wYXRpYmxlIiBzdHJp
bmcgbWF0Y2hpbmcgd2lsbA0KZG8gYW55IGdvb2QuIEFjdHVhbGx5LCBJIHRoaW5rIHRoYXQgaXQg
d2lsbCBpbnRyb2R1Y2UgbW9yZSBwcm9ibGVtcy4NCg0KV2hhdCB5b3UgY2FuIGRvLCBpcyB0byBp
bnRyb2R1Y2UgYW4gYWRkaXRpb25hbCBkYXRhOg0KDQpzdHJ1Y3QgaXRzX3F1aXJrIHsNCgljb25z
dCBjaGFyICpkZXNjOw0KCWJvb2wgKCptYXRjaCkoY29uc3Qgc3RydWN0IGhvc3RfaXRzICpod19p
dHMsIHZvaWQgKnByaXYpOw0KCXZvaWQgKnByaXY7DQoJdWludDMyX3QgZmxhZ3M7DQp9Ow0KDQpz
dHJ1Y3QgaXRzX2lpZHJfbWF0Y2ggew0KCXVpbnQzMl90IGlpZHI7DQoJdWludDMyX3QgbWFzazsN
Cn07DQoNCnN0YXRpYyBib29sIGlpZHJfbWF0Y2goY29uc3Qgc3RydWN0IGhvc3RfaXRzICpod19p
dHMsIHZvaWQgKnByaXYpOw0Kc3RhdGljIGJvb2wgcGxhdGZvcm1fY29tcGF0YmlsZV9tYXRjaChj
b25zdCBzdHJ1Y3QgaG9zdF9pdHMgKmh3X2l0cywgdm9pZCAqcHJpdik7DQoNCnN0YXRpYyBzdHJ1
Y3QgaXRzX3F1aXJrIHF1aXJrc1tdID0gew0KCXsubWF0Y2ggPSBpaWRyX21hdGNoLA0KCSAucHJp
diA9ICYoc3RydWN0IGl0c19paWRyX21hdGNoKSB7LmlpZHIgPSAweGFhYWEsIC5tYXNrID0gMHhi
YmJifX0sDQoJey5tYXRjaCA9IHBsYXRmb3JtX2NvbXBhdGJpbGVfbWF0Y2gsDQoJIC5wcml2ID0g
InJlbmVzYXMscjhhNzc5ZzAifSwNCn07DQoNClNvbWV0aGluZyBsaWtlIHRoYXQuIEluIHRoaXMg
d2F5IHlvdSBjYW4gdXNlIGVpdGhlciBhIGdlbmVyaWMgcHJlZGljYXRlDQpmdW5jdGlvbiBvciBp
bXBsZW1lbnQgeW91ciBvd24gZm9yIG1vcmUgY29tcGxleCBjYXNlcy4NCg0KPg0KPj4NCj4+ID4g
QEAgLTY0LDExICs2NSwyNCBAQCBzdHJ1Y3QgaXRzX3F1aXJrIHsNCj4+ID4NCj4+ID4gIHN0YXRp
YyB1aW50MzJfdCBfX3JvX2FmdGVyX2luaXQgaXRzX3F1aXJrX2ZsYWdzOw0KPj4gPg0KPj4gPiAr
c3RhdGljIGJvb2wgZ2ljdjNfaXRzX21hdGNoX3F1aXJrX2dlbjQoY29uc3Qgc3RydWN0IGhvc3Rf
aXRzICpod19pdHMpDQo+PiA+ICt7DQo+PiA+ICsgICAgaWYgKCAhaHdfaXRzLT5kdF9ub2RlICkN
Cj4+ID4gKyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gPiArDQo+PiA+ICsgICAgaWYgKCAhZHRf
bWFjaGluZV9pc19jb21wYXRpYmxlKCJyZW5lc2FzLHI4YTc3OWYwIikgJiYNCj4+ID4gKyAgICAg
ICAgICFkdF9tYWNoaW5lX2lzX2NvbXBhdGlibGUoInJlbmVzYXMscjhhNzc5ZzAiKSApDQo+PiA+
ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4+ID4gKw0KPj4gPiArICAgIHJldHVybiB0cnVlOw0K
Pj4gPiArfQ0KPj4gPiArDQo+PiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGl0c19xdWlyayBpdHNf
cXVpcmtzW10gPSB7DQo+PiA+ICAgICAgew0KPj4gPiAgICAgICAgICAuZGVzYyAgPSAiUi1DYXIg
R2VuNCIsDQo+PiA+ICAgICAgICAgIC5paWRyICA9IDB4MDIwMTc0M2IsDQo+PiA+ICAgICAgICAg
IC5tYXNrICA9IDB4ZmZmZmZmZmZVLA0KPj4gPiArICAgICAgICAubWF0Y2ggPSBnaWN2M19pdHNf
bWF0Y2hfcXVpcmtfZ2VuNCwNCj4+ID4gICAgICAgICAgLmZsYWdzID0gSE9TVF9JVFNfV09SS0FS
T1VORF9OQ19OUyB8DQo+PiA+ICAgICAgICAgICAgICAgICAgIEhPU1RfSVRTX1dPUktBUk9VTkRf
MzJCSVRfQUREUiwNCj4+ID4gICAgICB9LA0KPj4gPiBAQCAtNzcsNyArOTEsOCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGl0c19xdWlyayBpdHNfcXVpcmtzW10gPSB7DQo+PiA+ICAgICAgfQ0KPj4g
PiAgfTsNCj4+ID4NCj4+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrICpnaWN2M19p
dHNfZmluZF9xdWlyayh1aW50MzJfdCBpaWRyKQ0KPj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBp
dHNfcXVpcmsgKmdpY3YzX2l0c19maW5kX3F1aXJrKA0KPj4gPiArICAgIGNvbnN0IHN0cnVjdCBo
b3N0X2l0cyAqaHdfaXRzLCB1aW50MzJfdCBpaWRyKQ0KPj4gPiAgew0KPj4gPiAgICAgIGNvbnN0
IHN0cnVjdCBpdHNfcXVpcmsgKnF1aXJrID0gaXRzX3F1aXJrczsNCj4+ID4NCj4+ID4gQEAgLTg2
LDcgKzEwMSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXRzX3F1aXJrICpnaWN2M19pdHNfZmlu
ZF9xdWlyayh1aW50MzJfdCBpaWRyKQ0KPj4gPiAgICAgICAgICBpZiAoIHF1aXJrLT5paWRyICE9
IChxdWlyay0+bWFzayAmIGlpZHIpICkNCj4+ID4gICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4g
Pg0KPj4gPiAtICAgICAgICByZXR1cm4gcXVpcms7DQo+PiA+ICsgICAgICAgIGlmICggIXF1aXJr
LT5tYXRjaCB8fCBxdWlyay0+bWF0Y2goaHdfaXRzKSApDQo+PiA+ICsgICAgICAgICAgICByZXR1
cm4gcXVpcms7DQo+DQo+IEFsc28sIHdoaWxlIHJldmlld2luZyBnaWN2M19pdHNfZmluZF9xdWly
aygpIEkgcmVhbGl6ZWQgdGhhdCB0aGUNCj4gY3VycmVudCBmaXJzdC1tYXRjaCBzZW1hbnRpY3Mg
bWF5IG5vdCBzY2FsZSB3ZWxsLiBTaW5jZSB0aGUgdGFibGUNCj4gc3VwcG9ydHMgcGFydGlhbCBJ
SURSIG1hc2tzLCB3ZSBjb3VsZCBoYXZlIGEgYnJvYWQgZW50cnkgY292ZXJpbmcNCj4gYW4gZW50
aXJlIEdJQyBmYW1pbHkgYWxvbmdzaWRlIGEgbmFycm93ZXIgZW50cnkgZm9yIGEgc3BlY2lmaWMN
Cj4gcGxhdGZvcm0uIFdpdGggZmlyc3QtbWF0Y2gsIG9ubHkgb25lIG9mIHRoZW0gd291bGQgZXZl
ciBhcHBseSwgc28NCj4gdGhlaXIgZmxhZ3MgY291bGQgbmV2ZXIgYmUgY29tYmluZWQuIFRoZSBz
YW1lIGlzc3VlIGFwcGxpZXMgdG8gdGhlDQo+IG1hdGNoKCkgY2FsbGJhY2s6IGlmIGFuIGVudHJ5
IHdpdGggbWF0Y2goKSBpcyBjaGVja2VkIGZpcnN0IGFuZA0KPiBmYWlscywgdGhlIGxvb3AgZG9l
cyBjb250aW51ZSwgYnV0IGlmIGl0IHN1Y2NlZWRzLCBhbGwgc3Vic2VxdWVudA0KPiBlbnRyaWVz
IGZvciB0aGUgc2FtZSBJSURSIC0tIHdoZXRoZXIgd2l0aCBkaWZmZXJlbnQgbWFza3Mgb3IgZGlm
ZmVyZW50DQo+IG1hdGNoKCkgcHJlZGljYXRlcyAtLSBhcmUgc2tpcHBlZCBlbnRpcmVseS4NCj4N
Cj4gSWYgb3RoZXJzIGFncmVlLCBJIHdpbGwgc3dpdGNoIHRvIGFjY3VtdWxhdGluZyBmbGFncyBm
cm9tIGFsbA0KPiBtYXRjaGluZyBlbnRyaWVzIGluIHYyLg0KDQpJIGRvbid0IHRoaW5rIHRoYXQg
dGhlcmUgaXMgYSBnb29kIHVzZSBjYXNlIGZvciB0aGlzIHJpZ2h0IG5vdywgc28NCnBlcnNvbmFs
bHkgSSdkIHNraXAgZmxhZ3MgYWNjdW11bGF0aW9uLiBKdXN0IHdyaXRlIGEgY29tbWVudCB0aGF0
IGNvZGUNCnN0b3BzIGFuZCBmaXJzdCBtYXRjaCwgc28gbW9yZSBzcGVjaWZpYyBxdWlya3Mgc2hv
dWxkIGdvIGZpcnN0Lg0KDQotLSANCldCUiwgVm9sb2R5bXly

