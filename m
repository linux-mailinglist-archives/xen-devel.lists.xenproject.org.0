Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D5DB5053
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 16:27:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAEP2-0001Oa-Ia; Tue, 17 Sep 2019 14:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2JF=XM=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1iAEP1-0001OR-9t
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 14:24:23 +0000
X-Inumbo-ID: d7a02948-d956-11e9-b299-bc764e2007e4
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.95]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7a02948-d956-11e9-b299-bc764e2007e4;
 Tue, 17 Sep 2019 14:24:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzZAzE1nMUMzg4tHGy0CYNz1n6zjLgndY7LLKv0HvoeiEzjbnxi1TkwRlhheH7lsrE4oLxb7AisLe7In29vAwbi6GpmJ7FyUQ1Ql8SJumFZfpj3xgLFk8oGyJcG32IaluwwUYSdd9FoSzLWJviVdSNSR3eBkfGcShsMeHdld1UQuQ71k9aT5tdQ68zQi+xXUveXh/tl74W34pvIvVTyk6biAcoBeTLCqR7SnyoF1729QI2uTw83RLpOaziufzUDPGJL+l/zzWXmdTopRqOnjJwJhyAv472EeHHyI1Y5pYvVDCCYQkCaLVey9q0R+s/80/jrUlOTKPRXf7ojzbfwF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvABcL4BEPa3E4XQOL7YN6iEdbI9Nt17Y6/lw5QCzBQ=;
 b=Vntd8rfrcnANGHWNxmyC6vFKoXirUG5QWe3nV06lMn1ZAp46k1AMo6Sb5ss6DS61igcqNRMt+k2IfDLjoa0k3P2k16CFQB7TK9GlK3UnHf5OTHS3LE39iAIbiiMqln3HvZRf8wZXuJx6d5Gbm9kiVsDJZYqg05u7gZp6KCkR86BpHM9tKpTeuN4cBIAP4aZzlH2H2oUTcCyrQX4OcAB0p72R3WnI+cYsFVacjMAdDdMZF1KweUxBUzKtsR2YMiGWg2L+01jwGxBed2PjILvg9TM/If7DBscrTNbSTbFpsnOH/Rt5GDqXkNOlAGvh4+rHb1cn38r9I1au8eeW+f0ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bbu.bitdefender.biz; dkim=pass header.d=bbu.bitdefender.biz;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvABcL4BEPa3E4XQOL7YN6iEdbI9Nt17Y6/lw5QCzBQ=;
 b=nYS3RoRSnpxZb87zAF3CcQs2JszqyOHCqqV29jyYrKVO4qJwv0xEay6ayCmKiFhhsSJtXEjQnQyh/bxoxn3N7l7peAm8bsRTHv6UWuUDkqXCpB+cEIs3yxM6V8KQDgAeCIa+7TPOXSj2ohlac6UulPyvJrMMKsbITINlKRD1c7A=
Received: from VI1PR02MB5790.eurprd02.prod.outlook.com (52.133.244.12) by
 VI1PR02MB5072.eurprd02.prod.outlook.com (20.178.15.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Tue, 17 Sep 2019 14:24:18 +0000
Received: from VI1PR02MB5790.eurprd02.prod.outlook.com
 ([fe80::c979:2ad6:63a5:dc3a]) by VI1PR02MB5790.eurprd02.prod.outlook.com
 ([fe80::c979:2ad6:63a5:dc3a%2]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 14:24:18 +0000
From: Razvan Cojocaru <rcojocaru@bbu.bitdefender.biz>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbGY5LYraxeTPu06yM6Qe3Haip6cudlQAgAEKjgCAAATfAIAAZPcAgAADo4A=
Date: Tue, 17 Sep 2019 14:24:18 +0000
Message-ID: <d0bdb8eb-dcd9-cd44-259e-44da6602d3be@bbu.bitdefender.biz>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
In-Reply-To: <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0077.eurprd07.prod.outlook.com
 (2603:10a6:207:6::11) To VI1PR02MB5790.eurprd02.prod.outlook.com
 (2603:10a6:803:12d::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=rcojocaru@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 241d998f-7ada-41f0-517e-08d73b7ab9b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR02MB5072; 
x-ms-traffictypediagnostic: VI1PR02MB5072:|VI1PR02MB5072:|VI1PR02MB5072:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR02MB507293022816015CA0F57F95AB8F0@VI1PR02MB5072.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(376002)(136003)(39860400002)(189003)(199004)(6486002)(26005)(42882007)(71190400001)(31686004)(305945005)(316002)(5660300002)(229853002)(52116002)(2906002)(76176011)(6506007)(110136005)(6512007)(386003)(53546011)(99286004)(14454004)(54906003)(476003)(4326008)(8936002)(6246003)(25786009)(11346002)(186003)(2616005)(7736002)(102836004)(446003)(6436002)(8676002)(486006)(66066001)(71200400001)(478600001)(31696002)(3846002)(256004)(66946007)(6116002)(66446008)(64756008)(66556008)(66476007)(81166006)(14444005)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR02MB5072;
 H:VI1PR02MB5790.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IPjsoOGvydjN1GS4FoUGgiSwfNMaiP40/w1nddW+nIupBa49ZhJGkPNGN3Sr8ylbIPUgIUFqs/I5XBzHT1LJYJHCNusVVb8E3FGYEd5O8qPNJcL/9jUyZbAlhKfYdRmjVnO2KfkaruYCWD4cYb5XFfwmhkGLOnaGKnuTdvSBs9PeAmd6wVKWmCWHqUBbZ3vR/XlRePo2PLXsSCqSLSYaUAm/c2O6gjGhQAojKS4K8IUIWO+YaCbQF1ojwI7exyQ99H0C0JYlS6qfOkE0fKTdg0qg3WFLu75/lUApoOpG6g3FQ08eBqFaBeam1PWMi67Z9mkQ/WZJ6jcaB7IGQz7AQn1pSjFi0/GtoaV7Rsst1baTyxI12Zqr43iggi4DxGHG3VCp2n3BbqPKFKwSwNZ9u/FyHOmwVPPuXJQhKL0jwXU=
Content-ID: <F5219257D5D0AB4BB90AA01B36A8070C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bbu.bitdefender.biz
X-MS-Exchange-CrossTenant-Network-Message-Id: 241d998f-7ada-41f0-517e-08d73b7ab9b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 14:24:18.6357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VK45mKEJYTGSkc6wqVZKQzl3wwpF84yYADpdSlsxViCHTtnKfyEnA2NC3alFZ+6YswL5K3zErGd1h+/rs+yTt76+G0DdxS/tiVRtfOMKEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5072
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNy8xOSA1OjExIFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+Pj4+
ICtib29sIGh2bV9tb25pdG9yX2NoZWNrX3AybSh1bnNpZ25lZCBsb25nIGdsYSwgZ2ZuX3QgZ2Zu
LCB1aW50MzJfdCBwZmVjLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQx
Nl90IGtpbmQpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICB4ZW5tZW1fYWNjZXNzX3QgYWNjZXNzOw0K
Pj4+Pj4gKyAgICB2bV9ldmVudF9yZXF1ZXN0X3QgcmVxID0ge307DQo+Pj4+PiArICAgIHBhZGRy
X3QgZ3BhID0gKGdmbl90b19nYWRkcihnZm4pIHwgKGdsYSAmIH5QQUdFX01BU0spKTsNCj4+Pj4+
ICsNCj4+Pj4+ICsgICAgQVNTRVJUKGN1cnJlbnQtPmFyY2gudm1fZXZlbnQtPnNlbmRfZXZlbnQp
Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBjdXJyZW50LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2ZW50
ID0gZmFsc2U7DQo+Pj4+PiArDQo+Pj4+PiArICAgIGlmICggcDJtX2dldF9tZW1fYWNjZXNzKGN1
cnJlbnQtPmRvbWFpbiwgZ2ZuLCAmYWNjZXNzLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhbHRwMm1fdmNwdV9pZHgoY3VycmVudCkpICE9IDAgKQ0KPj4+Pj4gKyAgICAgICAg
cmV0dXJuIGZhbHNlOw0KPj4+PiAuLi4gbmV4dCB0byB0aGUgY2FsbCBoZXJlIChidXQgdGhlIG1h
aW50YWluZXJzIG9mIHRoZSBmaWxlIHdvdWxkDQo+Pj4+IGhhdmUgdG8ganVkZ2UgaW4gdGhlIGVu
ZCkuIFRoYXQgc2FpZCwgSSBjb250aW51ZSB0byBub3QgdW5kZXJzdGFuZA0KPj4+PiB3aHkgYSBu
b3QgZm91bmQgZW50cnkgbWVhbnMgdW5yZXN0cmljdGVkIGFjY2Vzcy4gSXNuJ3QgaXQNCj4+Pj4g
LT5kZWZhdWx0X2FjY2VzcyB3aGljaCBjb250cm9scyB3aGF0IHN1Y2ggYSAidmlydHVhbCIgZW50
cnkgd291bGQNCj4+Pj4gcGVybWl0Pw0KPj4+IEknbSBzb3JyeSBmb3IgdGhpcyBtaXNsZWFkaW5n
IGNvbW1lbnQuIFRoZSBjb2RlIHN0YXRlcyB0aGF0IGlmIGVudHJ5IHdhcw0KPj4+IG5vdCBmb3Vu
ZCB0aGUgYWNjZXNzIHdpbGwgYmUgZGVmYXVsdF9hY2Nlc3MgYW5kIHJldHVybiAwLiBTbyBpbiB0
aGlzDQo+Pj4gY2FzZSB0aGUgZGVmYXVsdF9hY2Nlc3Mgd2lsbCBiZSBjaGVja2VkLg0KPj4+DQo+
Pj4gLyogSWYgcmVxdWVzdCB0byBnZXQgZGVmYXVsdCBhY2Nlc3MuICovDQo+Pj4gaWYgKCBnZm5f
ZXEoZ2ZuLCBJTlZBTElEX0dGTikgKQ0KPj4+IHsNCj4+PiAgICAgICAgKmFjY2VzcyA9IG1lbWFj
Y2Vzc1twMm0tPmRlZmF1bHRfYWNjZXNzXTsNCj4+PiAgICAgICAgcmV0dXJuIDA7DQo+Pj4gfQ0K
Pj4+DQo+Pj4gSWYgdGhpcyBjbGVhcnMgdGhpbmcgdXAgSSBjYW4gcmVtb3ZlIHRoZSAiTk9URSIg
cGFydCBpZiB0aGUgY29tbWVudC4NCj4+IEknbSBhZnJhaWQgaXQgZG9lc24ndCBjbGVhciB0aGlu
Z3MgdXA6IEknbSBzdGlsbCBsb3N0IGFzIHRvIHdoeQ0KPj4gImVudHJ5IG5vdCBmb3VuZCIgaW1w
bGllcyAiZnVsbCBhY2Nlc3MiLiBBbmQgSSdtIGZ1cnRoZXIgbG9zdCBhcw0KPj4gdG8gd2hhdCB0
aGUgY29kZSBmcmFnbWVudCBhYm92ZSAoZGVhbGluZyB3aXRoIElOVkFMSURfR0ZOLCBidXQNCj4+
IG5vdCByZWFsbHkgdGhlICJlbnRyeSBub3QgZm91bmQiIGNhc2UsIHdoaWNoIHdvdWxkIGJlIElO
VkFMSURfTUZODQo+PiBjb21pbmcgYmFjayBmcm9tIGEgdHJhbnNsYXRpb24pIGlzIHN1cHBvc2Vk
IHRvIHRlbGwgbWUuDQo+Pg0KPiBJdCBpcyBzYWZlIGVub3VnaCB0byBjb25zaWRlciBhIGludmFs
aWQgbWZuIGZyb20gaG9zdHAyIHRvIGJlIGENCj4gdmlvbGF0aW9uLiBUaGVyZSBpcyBzdGlsbCBh
IHNtYWxsIHByb2JsZW0gd2l0aCBoYXZpbmcgdGhlIGFsdHAybSB2aWV3DQo+IG5vdCBoYXZpbmcg
dGhlIHBhZ2UgcHJvcGFnYXRlZCBmcm9tIGhvc3RwMm0uIEluIHRoaXMgY2FzZSB3ZSBoYXZlIHRv
IHVzZQ0KPiBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeSgpLg0KDQpJbiB0aGUgYWJzZW5jZSBv
ZiBjbGVhciBndWlkYW5jZSBmcm9tIHRoZSBJbnRlbCBTRE0gb24gd2hhdCB0aGUgaGFyZHdhcmUg
DQpkZWZhdWx0IGlzIGZvciBhIHBhZ2Ugbm90IHByZXNlbnQgaW4gdGhlIHAybSwgd2Ugc2hvdWxk
IHByb2JhYmx5IGZvbGxvdyANCkphbidzIGFkdmljZSBhbmQgY2hlY2sgdmlvbGF0aW9ucyBhZ2Fp
bnN0IGRlZmF1bHRfYWNjZXNzIGZvciBzdWNoIHBhZ2VzLg0KDQpUaGVyZSBhcmUgaW5kZWVkIC0g
YXMgZGlzY3Vzc2VkIHByaXZhdGVseSAtIHR3byBjYXNlcyBmb3IgYW4gYWx0cDJtIHRob3VnaDoN
Cg0KMS4gUGFnZSBub3QgZm91bmQgaW4gdGhlIGFsdHAybSwgYnV0IHNldCBpbiB0aGUgaG9zdHAy
bSAtIGluIHdoaWNoIGNhc2UgDQpJIHN1Z2dlc3QgdGhhdCB3ZSB0YWtlIHRoZSBob3N0cDJtIHZh
bHVlIGludG8gYWNjb3VudCAod2l0aCBvciB3aXRob3V0IA0KcHJvcGFnYXRpb24gdG8gdGhlIGFs
dHAybTsgSSBzZWUgbm8gaGFybSBpbiBwcm9wYWdhdGluZyB0aGUgZW50cnkgYnV0IA0Kb3RoZXIg
bWF5IHNlZSBzb21ldGhpbmcgSSdtIG1pc3NpbmcpLg0KDQoyLiBQYWdlIG5vdCBmb3VuZCBpbiBi
b3RoIGFsdHAybSBhbmQgaG9zdHAybSAtIGluIHdoaWNoIGNhc2Ugd2Ugc2hvdWxkIA0KcHJvYmFi
bHkgY2hlY2sgYWdhaW5zdCBkZWZhdWx0X2FjY2Vzcy4NCg0KDQpUaGFua3MsDQpSYXp2YW4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
