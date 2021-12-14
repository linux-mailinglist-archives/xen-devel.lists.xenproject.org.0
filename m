Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0CB47421E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246672.425397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6cD-0006Y1-4m; Tue, 14 Dec 2021 12:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246672.425397; Tue, 14 Dec 2021 12:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6cD-0006V5-0c; Tue, 14 Dec 2021 12:09:05 +0000
Received: by outflank-mailman (input) for mailman id 246672;
 Tue, 14 Dec 2021 12:09:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWHN=Q7=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mx6ad-0003Iz-A3
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:07:27 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [2a01:111:f403:700c::701])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 660d7a2f-5cd6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:07:26 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:07:23 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:07:23 +0000
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
X-Inumbo-ID: 660d7a2f-5cd6-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYU6HRAs26/rosbWFMkzwMALOLLLS1EJKqcbCuLqSD9HW7vITymu1xB3UpX4OjfUFeqyRSKwk16K3+jr+NL4V9h3W/W9cO6U+arh7vjDBKOxwe9AKAZo7FGjalWZQgYvv4uYojKx5JNS23n0QPNB/lsVQIPkhF9SwR5DLlAM1YF+crh94QfckYew/MJhzpuZr35W3kh/89lBJUlb/w4bZoFY9xg3JpQ+qLd9hwMQS/2rjFb3Lrlw/SWqf4hX5r2XxzUksdxI+lmzBMQDPncF+6J9zvy6bKUeSQ0Q75dBeHZHzkdYH777dt9z5Tm1PRf9dphoqMDSqZO0H+Fbgmh2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAAonJQdAc7aQfXPD2alQm8jM9VZWLKpyhWrVw2c8AM=;
 b=EcioW0BtikiWt2GEdpM5vOKSTytkGYGLH9obCHoulMJbp5d1A55Rnro3kRZTN2iK5mq7PP1MSwSHglDa+RQiY1xNv/cF3EqzSpJqOmrBmtDP1Jua4EUm7CPtYfR8Zy1xIaiKherZhq6iJg0Rzk6LqWOntOGF91XPc9tBXt4ca/RrKIrDCzdHJVhFeCSstHANFyXPItIBCuKcjODi8HoumqQ7NxE4vR3ddxXZKbmRH39AMXeKPjcwepaS3i3KSy0cGsWACjIs5Er0mTRK9dRtHtNgnnnR7mMwnKXctE0asjXxA95RzQS52TTJFMGrjWt2v/RX0qubDcJtyXSQ5zAaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAAonJQdAc7aQfXPD2alQm8jM9VZWLKpyhWrVw2c8AM=;
 b=n2ujv8bVrHOHp4G8MRo6usC2AM20CyNny8omc5W5Z5tjAiaf4gFVT2tKfucF3C1epjCOSONjXz9+A+q4ll6jK/wm/mx5HOmHAqIuqRP15FzRu8jcUCwmYnf4p4LHACMddwKZcNyDwJUgcTbzebRBhXCrjFhHB3Rjoc+XoUzHI8w=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 06/10] iommu/ipmmu-vmsa: Add utlb_offset_base
Thread-Topic: [PATCH 06/10] iommu/ipmmu-vmsa: Add utlb_offset_base
Thread-Index: AQHX47d6c2c4q5ZGtk6fn0XsGVxVaqwx+WZQ
Date: Tue, 14 Dec 2021 12:07:23 +0000
Message-ID:
 <TY2PR01MB3692B63DA7286321DD50870ED8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-7-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-7-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5482a9e-20a8-4129-2b37-08d9befa49b3
x-ms-traffictypediagnostic: TY2PR01MB3436:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB34361A9BC6312B3953BDEF0ED8759@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 pjJFx8YwcTFkzOXrRUEh3ZA2JB202OauodBTR8k+dde4QKz2FlmYRvswWOXNzJ9q1estKYSgouuggmHo6ZKheg0oYrJpa5TsNvEUTX5OiT0TjMbRpJnPBgt5tJlv1oGU/7IeY/CQk45chZT2c3/19tS47qTWkZ38Rdm6WhnkOBY5YQLQUH86V0hgfBGJ12aTNOb0OJlVeA4UZq7EJblIpeILxop/5gqlOm4a6DtTHXQBpP2rywHvq06ZzfTK5NRRF7MTMb4fv0wsrO3uNr18B0mObkqdZlz16cMVni6R71mMsBEDqBM1Vvf8arPp39nNJe+jgSee1HHFS/sw+Tg1gDlSgNghOrJZmxst8K2DfHnZ+7yrlNOy4X3NL8aVKKkNSx2xJj5hOGx9/Rs5DtbU3Vr10xIjRQ6Q0NVEzZv3V3XSut0vTIHhVvH58o3wF6A5CbiHhVcNoaJlaNN0UO1dVO4KeaJz6qFgU8kV7iEXJEBYKluG5dYzFrZ/plOU8vRRelm5w2xHlTJF5o3g480pjd74prUmIB9Oooi0o7zd71VnT0EpEJ2N27w1hg3iAnPoFfrgAhfEktXYm2uJvsuOhXrVwt/QC3AgNj1pNWd5i0rZYu1U3oaYEIIXB5TEsFOYiMRkfGcDkDBrhvP09s2nEH0+iOKxpE/hZYxvXlT1GUsUcPtIfYIAwMvYoJEPkID3jLBw1KEY0zeqD/FdTsBfVQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66574015)(54906003)(83380400001)(110136005)(6506007)(38100700002)(508600001)(186003)(8676002)(5660300002)(55016003)(64756008)(71200400001)(66476007)(66556008)(66946007)(38070700005)(76116006)(66446008)(122000001)(52536014)(4326008)(86362001)(7696005)(2906002)(8936002)(33656002)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eXN5L1lsVnRnSTlzTmt4ZjluRVJaL2FBNmNkSzBMYnNQVzNKeWhTUFpRZnk0?=
 =?utf-8?B?TC81V3FFWjBJQUlEY3RUKzIySGNWWmZoSGxQT1FpdGozTVZWckQ4c2cxWmkx?=
 =?utf-8?B?aEo5ZEtiTldwdVpKOE5HRGhkVnF0Rjg1TDdWMHZOS1UweU0wK3o5T0xMajF1?=
 =?utf-8?B?SGpRQWNVWkwrTCs5QjI1VmFxWklKU1Q1cmNyejNLdG1pK3JSMkx3ZWNYQWlJ?=
 =?utf-8?B?UVRjTUJlYlJHakd0cXBnL0JGNi81ZngxUC8rK3VLTFBlWXFWN1pJTlVqS1RZ?=
 =?utf-8?B?R2VZMXIzTndkSU1YWDh1citmc1g1bUh4dXdGTGJKNjRhdUxoeXp4YStnNzhw?=
 =?utf-8?B?Smx0cXdXSmdob0ptSjJscTNwcDFVb1ozRnE3cERSVVllRjJaSzVDUE5lRVp2?=
 =?utf-8?B?MUsvd2Z6cFFJYm5pZEt4OUlIRWc5a21VZEsvQzBDRWtUWUUvTjMrbUZDUjdB?=
 =?utf-8?B?L3VTYWYyNE9XZHN1VWRrRjh4TVh1eGVxc1BHMmNzSjJJQUsvWEhOT1hvVG56?=
 =?utf-8?B?Tm1BbUZQOVdNNm1YUlhIMlcvTEpla1VPTzl4WGhFNDRkUFpyRm5zK1Z5YThr?=
 =?utf-8?B?OUtzMGk1TW1sMWxyZ0UxSS93eGw0RHhWOXFHODFyazk5WDlnMXZKTmJBU1g5?=
 =?utf-8?B?UHdXT3cyYUpLVjJONkw1Sk0yN2x5U1N1OGZhTnRTM0N5MExGcXM3R1pqZHMv?=
 =?utf-8?B?VW1PaUZqOE15b0d0WkNGQldMY1dGRDZWdUZYUENtTFQ5VU9ndmNrK3lmVTE3?=
 =?utf-8?B?cmFTUUllcWtXZHlJR1pMUHZYN1FNMm9IaXdyNGxJcDdxaG5QbGVjb0FpeU42?=
 =?utf-8?B?SzIrdVFvbCsyQnNyRFZRcHVrYWJZbXN3azdNa2lpS1RkQVM2U0VXWFAxRU1R?=
 =?utf-8?B?WkhlZDBWKzJNVW0ya1Jxc2JlM3g3VWVrcEUwK1hjWWpzVEN5ck1CdFVKOUda?=
 =?utf-8?B?aitBUk1SSGtqTklDNXNhTHBqcHdUSC9yd0RCMFVwdVRyRHMzRElDbGgvaXlB?=
 =?utf-8?B?c1M0Rk5sTFVHdEMvcmFLUVFYSFJaUUFyVU5OdDFnZDV2NEJjWUEwUkFIWGRI?=
 =?utf-8?B?d29Ld3lsTTJOUkNPOC82Skplek5tcTBYR2kyRFdhdDJXVVNFVHNsbW9vSVcz?=
 =?utf-8?B?Y0lhU2NCc2NFWExCMWNVVkszUlQ3bFZQTGo1czl2c1RNTmI0MGJPa1Bvd2xN?=
 =?utf-8?B?cUxaVGc2dGFZMmJQbWtSb1RYZGxrVjd6ZVE4bVB4cENWY2JOVWhIY2ZDTklm?=
 =?utf-8?B?K2RDcllPWlRabGdtSC91QVZ4emMrNW83U1JYRndnMkl5WnNNN0FlLzFxZ1JX?=
 =?utf-8?B?d2VuWFVjYlNCRTJGMEJabW1yZ0JRQ3QzL3dETit4YTJqVjdFZlRIakt5cVFL?=
 =?utf-8?B?Y3lkQ282Rkh5M1lMTm5pY2txS1dUQ0JPdEZFYUVrWFBHYmdIYVQ0YkdXcDFS?=
 =?utf-8?B?VHJjbE01NnUwaEhWVk0yYUJWMmFZdnlxQ2dUSXQvWEcva1J6S0Q2eTk1ZWZl?=
 =?utf-8?B?YjByUmg3d1FuQWFHRmdwTE1OMGFRMjA5VnVkejFISFBYWkhkVVh3UndZaEdR?=
 =?utf-8?B?TWNtNFREOEZJYWo0L3RzWllHZVRIRUk5ZGRhLzQyV1AyRW5FaDJDMTFwSTR3?=
 =?utf-8?B?UWhzMlNqbkJCQ3VJTUllc3luZlp6WDM2anNtYTJMeEo3QUM5M2kzODZqeGtQ?=
 =?utf-8?B?VmozV0I1L1NmYVYzTHY4OWdkZ1E3Uld2T2pReVlEU1ppWGtidUpHajVmemFE?=
 =?utf-8?B?anRjMnhBYlhnZW9rYWY2ekh6RVg4NkVLcDQ0c2lKK2xrV05JOGJoaGdtbzF0?=
 =?utf-8?B?VWVCQ3FORk9zcDJQYnp3TTRLWU9hN1JsUU9pcDhCY3ViZGRIL1gyOG9rdnFH?=
 =?utf-8?B?VWlSQUN4Smo4STFkYlI5Tlpubm9Ea3V4SlFPYnIxd1IyZE4wNVdJVENQNS9M?=
 =?utf-8?B?SVRhenVUZDRRTW1nd0hUQmk0VXFJREtIVzFNS21NRmdKRitRcUlabUJWR3Rp?=
 =?utf-8?B?cnIxYVNiTm1OWlVDK3N6aXNrRlRlMEdtQ1NGdUpRNDBHeXNENU1XL3p1Q0FB?=
 =?utf-8?B?Z2l4MmhkckM1dDE5L0ZHTlhCbFBOZjZCak8ySjBjWGJqa0NydjFDSm5vNlpm?=
 =?utf-8?B?Z2VPaEtSUWpyU1h6cXI3Z3Y4RmNuNU1xNTBRQyt5WkdVL2JPSkVnY1RSVGwy?=
 =?utf-8?B?L1BCa3BsaW82WXY4M0lEdkE5U3duZ1UxSFE1aDRwVVB4NnB0RmpFOE11d1Iz?=
 =?utf-8?B?RFY3V1pFWGJyQ29RdFNTZEhxZFZNby9wNXFWMWhTc3FUOHhiY2FMSEs4S2Q1?=
 =?utf-8?B?cWkvTTdLN0lLbUE5K3JmRnNWRnVINzhmL1Q3MnpWS08zNVlERExnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5482a9e-20a8-4129-2b37-08d9befa49b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:07:23.6786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtFe+Xhp6ImsYnzPwd4sMLDoiq3oh2a2MZTdsYbpzVlL4vpLaUgwt623kcEciW9SxqrWUtMIxsUFAIuL0O6cLH0SRv3uvET8NmhLginOXsnZTfBefHJSwKWeKIh8+o49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436

SGVsbG8gT2xla3NhbmRyLXNhbiwNCg0KPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbywgU2Vu
dDogU3VuZGF5LCBOb3ZlbWJlciAyOCwgMjAyMSAyOjUyIEFNDQo+IA0KPiBGcm9tOiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IA0KPiBUaGlz
IGlzIGEgbm9uLXZlcmJhdGltIHBvcnQgb2YgY29ycmVzcG9uZGluZyBMaW51eCB1cHN0ZWFtIGNv
bW1pdDoNCj4gMTI4OWY3ZjE1MDAxYzdlZDM2YmU2ZDIzY2IxNDVjMWQ1ZmVhY2RjOA0KPiANCj4g
T3JpZ2luYWwgY29tbWl0IG1lc3NhZ2U6DQo+ICBjb21taXQgMTI4OWY3ZjE1MDAxYzdlZDM2YmU2
ZDIzY2IxNDVjMWQ1ZmVhY2RjOA0KPiAgQXV0aG9yOiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ICBEYXRlOiAgIFdlZCBOb3YgNiAxMTozNTo1
MCAyMDE5ICswOTAwDQo+IA0KPiAgIGlvbW11L2lwbW11LXZtc2E6IEFkZCB1dGxiX29mZnNldF9i
YXNlDQo+IA0KPiAgIFNpbmNlIHdlIHdpbGwgaGF2ZSBjaGFuZ2VkIG1lbW9yeSBtYXBwaW5nIG9m
IHRoZSBJUE1NVSBpbiB0aGUgZnV0dXJlLA0KPiAgIHRoaXMgcGF0Y2ggYWRkcyBhIHV0bGJfb2Zm
c2V0X2Jhc2UgaW50byBzdHJ1Y3QgaXBtbXVfZmVhdHVyZXMNCj4gICBmb3IgSU1VQ1RSIGFuZCBJ
TVVBU0lEIHJlZ2lzdGVycy4gTm8gYmVoYXZpb3IgY2hhbmdlLg0KPiANCj4gICBTaWduZWQtb2Zm
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
DQo+ICAgUmV2aWV3ZWQtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMuc29kZXJsdW5kK3Jl
bmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiAgIFNpZ25lZC1vZmYtYnk6IEpvZXJnIFJvZWRlbCA8anJv
ZWRlbEBzdXNlLmRlPg0KPiANCj4gKioqKioqKioqKg0KPiANCj4gVGhpcyBpcyBhIHByZXJlcSB3
b3JrIG5lZWRlZCB0byBhZGQgc3VwcG9ydCBmb3IgUzQgc2VyaWVzIGVhc2lseQ0KPiBpbiB0aGUg
ZnV0dXJlLg0KPiANCj4gQWxtb3N0IHRoZSBzYW1lIGNoYW5nZSBhcyBvcmlnaW5hbCBjb21taXQg
bWFrZXMsIGJ1dCB3aXRob3V0IHVwZGF0aW5nDQo+IHN0cnVjdCBpcG1tdV9mZWF0dXJlc19kZWZh
dWx0IHdoaWNoIFhlbiBkcml2ZXIgZG9lc24ndCBoYXZlICh0aGVyZSBpcw0KPiBubyBzdXBwb3J0
IG9mIG9sZCBBcm0zMiBiYXNlZCBHZW4yIFNvQ3MpLg0KPiANCj4gTm8gY2hhbmdlIGluIGJlaGF2
aW9yLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5k
cl90eXNoY2hlbmtvQGVwYW0uY29tPg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCENCg0KUmV2
aWV3ZWQtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2Fz
LmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K

