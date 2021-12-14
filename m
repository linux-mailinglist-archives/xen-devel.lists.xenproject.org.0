Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF2474200
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246647.425364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6Z5-0003yW-Vi; Tue, 14 Dec 2021 12:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246647.425364; Tue, 14 Dec 2021 12:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6Z5-0003wQ-Qv; Tue, 14 Dec 2021 12:05:51 +0000
Received: by outflank-mailman (input) for mailman id 246647;
 Tue, 14 Dec 2021 12:05:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWHN=Q7=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mx6Z4-0003un-CO
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:05:50 +0000
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20719.outbound.protection.outlook.com
 [2a01:111:f403:7010::719])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51883309-5cd5-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 12:59:42 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:05:45 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:05:45 +0000
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
X-Inumbo-ID: 51883309-5cd5-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAN5QOoZ3Lr1THJhgTjh9Hiot44AtBL96LK0xqPGnhIjCJk51fsQQY41HCYInRmjU30NdoGnCC6j8FlF4PFRl8MsElhPfXE3nDlcn1TDPCuESLo/mzjQFkUEJ/g1vQRNy/YshDqVyyjxke/ui5WNguAs7ScZM74uucgYP7TrbzvS4+auHsedioZKOjUT9RRuxxzh0w+ByXvKiynLQLc9iYIRI6ieO0DveW4XW8Z9AUL4PdJamxYbrztwrlwR7naw6jg5cbNSQUoMdVgfsorQjf1g5y6SCEt0RK6K+63sauJXkm4SQFtZO1O9kmh5mAY1I2T5mbVVf18WYXazSoJ5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWR7wCZTh48p5KfsTZ1X+ycSMn64E2sBRAYS2QGRP3E=;
 b=QSAUifmDOP0GKgxlVr6abttTi/PVbDoHBQ8zrvq0zyAU0BNKcWYAu26Ru0sVHRup0aR4udTmCw6e48pVFg/LVNF59KZ5xmNaxEaIh/HwdO5unE2zsBKnMLfyXLGQ1VGMBjVvrP4QfPOEn6+vB7Ta6i+hFmlbUcGJwdKBTrGxR5O6GeqVmmBx9Wh2fq2O6RwBHOlv26aJaIELGO7BnLxj3D1nCmQAgTCrqmke543xu3xKescLjDhJkjHpLRkngMCKylAIiJ7CT/bN2B5l3UZPjb+GeREjm6DYWXi3ILWoS99htUcdUzj4z+FLs8DoT3VWtoTwiV3dFtjsD3mQrT0BQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWR7wCZTh48p5KfsTZ1X+ycSMn64E2sBRAYS2QGRP3E=;
 b=WGC9wKnhtqbmSUl8LPIir+ERvW9pwcIpiWgNOpOnKYVfensWxv5MQHvlsvvunX3iV+YcKWGN3Y8NQOzIz0A8AcxqpsPg3H0nPu8yKnL36eXZBvxYLwfEvMARVHJi5Ms3vjYV0UTHWQ93rtprjhua7vOPIkJBF19SIOBWOutzg8U=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 03/10] iommu/ipmmu-vmsa: Add helper functions for "uTLB"
 registers
Thread-Topic: [PATCH 03/10] iommu/ipmmu-vmsa: Add helper functions for "uTLB"
 registers
Thread-Index: AQHX47d6jEgJuhJME0m5DFdy3SZFF6wx9csg
Date: Tue, 14 Dec 2021 12:05:45 +0000
Message-ID:
 <TY2PR01MB369283B44CECFC3A5A148388D8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-4-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-4-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8acda79-c781-4b3b-1956-08d9befa0f40
x-ms-traffictypediagnostic: TY2PR01MB3436:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB3436BB42B8A428CB252D17A8D8759@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:534;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eM2Vu88KM0mMe9yHkVQQ2T6ff3Cxcap1flRKg2tk6zzukbLDcDP5XApCb4Ktf0QCH9O0IdutNKY5bT3BIYIa0m7OCXuJepModUQ6b4hCXZrvVzR9McOfdvpmqdzFTgNZsx7FkoBkqOAeKSE14h1sHOCKS4XxNhcGltOF1R/oCldsSWguHsT1M1ShTCIxcLSjGTCqC95tUHW+A0KZifxd6mxWCBTwyM9AYHYEV2vF1zqHgNHwIitaxpBNuwT0nbmzAJmS/vsA2VpYDAb2iFrX9gLoHLsFKMG/FFWHs50qQlNmOgEU3XrMKlFwsYvlhEhwqOGiHolGax1KaK6WE1yBsUpCMdmlLl+XMPVZ8Gf071pdEzXTR+qmKPLjNrCueIy2/dxP2HNxpNcN8gGuy6B0Zxy5ua5q/jEmbX9hmrvJ8WGZsFPVsHhcVCM0dd1p0rC8YIcqjTzBQikh6aVm/PCas8Dptxy5DD14Fhzq+QMDqr1vSnU+D4G6IN01BZyHiGKh0xGpPoOiH9njGLTFULPY0FQarczFTC104yqDGn5M8E5duY0JNYZHKsVUAe4WnoY/EcwYzgsLNNQyVzj31d1vOJ+JqAuMcqGNBDKpowpj8MXEfWs6vOrUDBaAZ6tAZXLo3eQ6m9jqNTUqftA4qaMtGppOLTPK7aS/sptIMpCkVm+kGdAKiLb8d5UeUx9Ikco16TLYMIJWG8f7B7K1H3y1rw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66574015)(54906003)(83380400001)(110136005)(6506007)(38100700002)(508600001)(186003)(8676002)(5660300002)(55016003)(64756008)(71200400001)(66476007)(66556008)(66946007)(38070700005)(76116006)(66446008)(122000001)(52536014)(4326008)(86362001)(7696005)(2906002)(8936002)(33656002)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TERRaUpKcjh6TGdLUUN3VzUrZzcvWTFHRC9sOG5VSU1xN3hLOC9keVRtbUxU?=
 =?utf-8?B?S2RNSjVycUt3YisrbkpPbmpJVVF3bkozcUlHZ3NmZVYxa0xsV0hSUXloUTFL?=
 =?utf-8?B?TnRtM3BTZmM3Wm5ndW5EbjB2TVpHTG1OTXJZcFVPMFBuN2EwbFVUYXVseHdF?=
 =?utf-8?B?am9mcmFsUnlzaU8xdy9Ed0dlZXFKdHlPMGZhVjN5a0pDSDk3aXJrbTU0UlVw?=
 =?utf-8?B?bzFrSkxHdWVjMm9uSE1rdnNDMVBHL1pHeWVPTThwQy9MT2Y1eUd3WTNOT0J1?=
 =?utf-8?B?Ny9hcjJwZXA3OS9NVVYvcGhtSmhVRlRNbFZFT1daSlZIMVpDeTkrNkNxZ0ww?=
 =?utf-8?B?ejJ1TFNld3lnTlBZK2Y1SzQxckJ2bGoyNGwwbWIvS01qK0prc29rTTRYQzhG?=
 =?utf-8?B?cHdYT3hrVm1iVFNyZ1VpT3A0VCtpaTFGUHJqaTRqdkhSRkVIL1BNTGt6enNF?=
 =?utf-8?B?Q2VuRVpBazFrVXNYRmxybnA3Qm14blRWQVlKZmJoZjlJdUVIWlFiYUx2UlNQ?=
 =?utf-8?B?YmYvUVg1UmdLaGp1eExzZU13ME1CZHFMZ05BRkpTZUZIdnFndzlQLzJsTHN5?=
 =?utf-8?B?ZUc0QlpSZFgzWXpkcDlyT1JkYzg1VlBOYlZITFB6b2YyL04yU1lnREEyZzNh?=
 =?utf-8?B?Z2VPZU9sS09aYzlWSTY3bGl0TXBSdXVmV0duYTBKRDhtOTBFeEM0b052NDM4?=
 =?utf-8?B?N2dreUlhczVQMHdkSHlFZUJPajU3ajE3VE91WUdZWURuWnZUQjZsQTJpbkZ1?=
 =?utf-8?B?RlhNQ3lYdXJHTWI1V3RKWkpOakIyYzRIN01zT1VWQWFWMXBaaUsyV0hQMkxW?=
 =?utf-8?B?Wi84MUxUMHFCMWVlS3FpR1NBWlkvdzJUV2RqTjVITmk0Q1FLcG9vbTV1UUQy?=
 =?utf-8?B?a29pTCtES0N6UkRGTlRWbnZOWC96NThHeExwNVhsNTRTTWJMTGpURVlpM3Nm?=
 =?utf-8?B?SjdsYnVWbWxsK0paY1l0bll1UFJnRWkxNnZwVS9aZTJaaFhDMVhQZ05zUnRi?=
 =?utf-8?B?NUJ4VE81UzRVelM3S2NNR2dyK0NYSW44SUFxaVErRDA4TmxrZlZBWWlxeDNy?=
 =?utf-8?B?UERvZ1NuVGVTam13cDN0b1d4bFd1aWg1UlVNUHBoVXcyQUJYVnJDb1lZb2R6?=
 =?utf-8?B?eFhUaXN3V2JoS3NTK0JodnU1cFJNZGw1b1FrdXdvdVBoeHRMZmxLT2V4YTdo?=
 =?utf-8?B?MWR6eXlNeXFWRDB6aVZvbWpENVRxS01nZG1mYnhyZFA4VkpibTcyTmhUK3hL?=
 =?utf-8?B?ek5jcG8yMVFkYXEwbzFEM3dFL1NOT3N5MG1tRVdRV1k2a000SmgyNVBuUWZa?=
 =?utf-8?B?K015WFZkZHVIRytuRlltZmFRemVJclFhMndjcW1GN2c3NmNJdzIwZmVGblBT?=
 =?utf-8?B?NFk2OUQ4cWpiOGswUEp0N1lSWW91VWRmUXpTZzhNMGhUYmFTMlpjV0VOQmoy?=
 =?utf-8?B?U0ZBSlF6RkQ3TUUvSDVQTHpWVWo2blR2aW1BcVgxTTJCUWJxVnFzRGQxM1ZI?=
 =?utf-8?B?eGhNc2lrQ25TTkpZYVFsdzR2aFcvSDBUcEZpMk1seHRlOExsV2dNMDV6NmI3?=
 =?utf-8?B?aEtHbHhiNkRrVW96cDZ4Q1Q4T080Y0ZRRmZteXF0WFdXOGpFS3JOUnF1Uzdh?=
 =?utf-8?B?RXAyT1E0bEdXS0hpdXNoaHd5OHdtR2MrSE5GZW53a3VpcGhDOW52NFlhODFa?=
 =?utf-8?B?T09waXlFcW5iUFlzMzBzNVdZQkp1N1owMXhhMDRJQ2FmcTZHeTZXbVRkUk1z?=
 =?utf-8?B?NVVhcndXcnBuRjc4dVVBdXBzblJGMFhNdkgwdjFIWlVtVElSN1NzOHF0V0s2?=
 =?utf-8?B?OURLUytXTE9PNEZQMlVMTExtT3ZaTVFQVEJyeGJmeDFaUSs0UmkvcnF5ZTFK?=
 =?utf-8?B?djcwelE5M096dTNSNENFY1JhcHRzVXpTeHFFUlQ1bFppVTFLSDVtNUhodTM3?=
 =?utf-8?B?OUhJNmlHaVFiUTFpWmFrR3hIU1FIOVJNOWY1OWNhQUdqRDUrV0VhcUV4dEpC?=
 =?utf-8?B?NkJVcE5EcE5xSzNkenhnbzVDVkNGODV1a3NpWG9INmpvSWNRd0MvNnFDTW9F?=
 =?utf-8?B?RzBsWE1jTUFaQjBaMzliK1VUMlBiRkNncTl0RE5IUzV0MU1rVHFNakxGbnhi?=
 =?utf-8?B?SGNLbEVxWDlScXBubmRSOUxwTTM1K1I4eXNaeU5BdURzbTRQM0QzazJJR0M3?=
 =?utf-8?B?R3hrb2JtU0pNeVJtaUdhYlZkdTE1cjRwTWZRVHJpR1lLWUIrTWJXMk9LNEln?=
 =?utf-8?B?WEFnSHNnT2Z1NnZ0WlE4TFhQazhKZHQzc3RBT0JyaXJJMUtDam9uUGpFRVFD?=
 =?utf-8?B?bk8yVWlVNkd3TGZlY1IvMFEvQmwvYzM1N0JSZXNIN2p0dTI3ampUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8acda79-c781-4b3b-1956-08d9befa0f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:05:45.5616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpOIyPO5jsTPv7Iyfl/9uYt3qNC+4Lcb6TWRUfY0t+wCJrsRZ3cwJvuscsBeURK3AzcX4sqgR0ZwaY9/1ij0GesWuvLGUAL7vAzGTTBQIUG4RfNL8unX8tKGxEHJ8G3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436

SGVsbG8gT2xla3NhbmRyLXNhbiwNCg0KPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbywgU2Vu
dDogU3VuZGF5LCBOb3ZlbWJlciAyOCwgMjAyMSAyOjUyIEFNDQo+IA0KPiBGcm9tOiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IA0KPiBUaGlz
IGlzIGEgbm9uLXZlcmJhdGltIHBvcnQgb2YgY29ycmVzcG9uZGluZyBMaW51eCB1cHN0ZWFtIGNv
bW1pdDoNCj4gMzY2N2M5OTc4YjI5MTFkYzFkZWQ3N2Y1OTcxZGY0Nzc4ODU0MDljNA0KPiANCj4g
T3JpZ2luYWwgY29tbWl0IG1lc3NhZ2U6DQo+ICBjb21taXQgMzY2N2M5OTc4YjI5MTFkYzFkZWQ3
N2Y1OTcxZGY0Nzc4ODU0MDljNA0KPiAgQXV0aG9yOiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ICBEYXRlOiAgIFdlZCBOb3YgNiAxMTozNTo0
OSAyMDE5ICswOTAwDQo+IA0KPiAgIGlvbW11L2lwbW11LXZtc2E6IEFkZCBoZWxwZXIgZnVuY3Rp
b25zIGZvciAidVRMQiIgcmVnaXN0ZXJzDQo+IA0KPiAgIFNpbmNlIHdlIHdpbGwgaGF2ZSBjaGFu
Z2VkIG1lbW9yeSBtYXBwaW5nIG9mIHRoZSBJUE1NVSBpbiB0aGUgZnV0dXJlLA0KPiAgIFRoaXMg
cGF0Y2ggYWRkcyBoZWxwZXIgZnVuY3Rpb25zIGlwbW11X3V0bGJfcmVnKCkgYW5kDQo+ICAgaXBt
bXVfaW11e2FzaWQsY3RyfV93cml0ZSgpIGZvciAidVRMQiIgcmVnaXN0ZXJzLiBObyBiZWhhdmlv
ciBjaGFuZ2UuDQo+IA0KPiAgIFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gICBSZXZpZXdlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gICBSZXZpZXdlZC1ieTogTmlr
bGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rlcmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+DQo+
ICAgU2lnbmVkLW9mZi1ieTogSm9lcmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+DQo+IA0KPiAq
KioqKioqKioqDQo+IA0KPiBUaGlzIGlzIGEgcHJlcmVxIHdvcmsgbmVlZGVkIHRvIGFkZCBzdXBw
b3J0IGZvciBTNCBzZXJpZXMgZWFzaWx5DQo+IGluIHRoZSBmdXR1cmUuDQo+IA0KPiBCZXNpZGVz
IGNoYW5nZXMgZG9uZSBpbiB0aGUgb3JpZ2luYWwgY29tbWl0LCB3ZSBhbHNvIG5lZWQgdG8gaW50
cm9kdWNlDQo+IGlwbW11X2ltdWN0cl9yZWFkKCkgc2luY2UgWGVuIGRyaXZlciBjb250YWlucyBh
biBhZGRpdGlvbmFsIGxvZ2ljIGluDQo+IGlwbW11X3V0bGJfZW5hYmxlKCkgdG8gcHJldmVudCB0
aGUgdXNlIGNhc2VzIHdoZXJlIGRldmljZXMgd2hpY2ggdXNlDQo+IHRoZSBzYW1lIG1pY3JvLVRM
QiBhcmUgYXNzaWduZWQgdG8gZGlmZmVyZW50IFhlbiBkb21haW5zLg0KPiANCj4gTm8gY2hhbmdl
IGluIGJlaGF2aW9yLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28g
PG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aCENCg0KUmV2aWV3ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K

