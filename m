Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE9F6BD8D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 15:45:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnkCm-0007jI-MM; Wed, 17 Jul 2019 13:42:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K3fL=VO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hnkCl-0007jD-2H
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 13:42:47 +0000
X-Inumbo-ID: c0d34dc3-a898-11e9-8980-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.91]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0d34dc3-a898-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 13:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9HYb426FMmkLREWWhEm4zyphyGCg2w+61moJMNww1AAaZp1ssbHdhYrxc8T+ZMJMNgGplXLW/b72+UEhSCGUJsep2z+LcD9gKblJkFakZSJoSInC9IScqWVeHWTXrLDsmih8ztGa4Lady17Gu5HC/LpZB1qpjS+ifwvHmLqFGPdTNyDd5LfOgSkngczGa5HwExQM7o3Yy6siiaz7JQEoryRAUNYPh7V9hVZD/cEovK+V/sth+HPSeAeGnX9YURJBnXaLWDGZzxHB6v2GnUAFiODUHK2w7lIl5tWtgo+iKmeaRov29+hCSWg5sr+ODrn2TKunUBuGE5DdEWNMSB5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSSdTw3NsSol1+uykRZQPH8GHsxoZFDzISwrMKVnyM8=;
 b=iGffJHU9IOgRfAtzyBDB25vVCUK/PRMWD2xa3Km6bZc+E2Q2sNi0qKg6JT66lhAUyg5fzRpOIuTOdN3YWe7V4V+SBpnWmHNTiiYjyAGcCRI7iRzBUBLXU4e752BArlmlL56zTiY8q3wPTDca1cKW39x8pS3pgMxfl9BTft09JyQvZrPbAY+Xrfp6KxcuqSupovQFLGD6JMDZolo/ygHRiFHtC0Hs04czwRGn2eFPbulJbP3Nlwqa9njvn548eV/X/qxugOren18n1lo1CrUvOLAn1ehW1hwxX9o/ffK6i4ma/mD+EOaVAj/ru+J7K19Y0kslm9G7/+DQ7kPmU3j1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSSdTw3NsSol1+uykRZQPH8GHsxoZFDzISwrMKVnyM8=;
 b=K1LEuX52EDL+YUiv/gZRt0sZjd4gfp9ZAPkUTC/d0yV3E1NlzHegJGYGQ73uuF4XQokkqJot1KvgdroYhUbigIpAq9U3nDku2J5wQcj+K5zs65fyD4GuoUql0D9KeiJ9rlHHqbpH/4EXOR3vRufso8lWFbOZwI5dh5n+sduqnjw=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3533.eurprd02.prod.outlook.com (52.134.18.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:42:41 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::299d:c795:8b09:fc03%8]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:42:41 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/jv2umzYjvL/UC5yd8hBXiIwKbO0wwA
Date: Wed, 17 Jul 2019 13:42:41 +0000
Message-ID: <24c588b3-41db-b558-cae6-d586970038b2@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0216.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::36) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33837ad5-3f7e-4439-9bea-08d70abca399
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3533; 
x-ms-traffictypediagnostic: VI1PR0202MB3533:|VI1PR0202MB3533:
x-microsoft-antispam-prvs: <VI1PR0202MB35338185C06C59FE530302D7ABC90@VI1PR0202MB3533.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(86362001)(14444005)(256004)(66446008)(6436002)(31696002)(476003)(66946007)(26005)(2616005)(478600001)(76176011)(7416002)(5660300002)(64756008)(6486002)(6246003)(6116002)(446003)(66476007)(66556008)(81166006)(102836004)(8936002)(11346002)(68736007)(7736002)(386003)(305945005)(3846002)(2501003)(6512007)(186003)(229853002)(14454004)(6506007)(52116002)(4326008)(36756003)(31686004)(25786009)(486006)(316002)(53936002)(66066001)(2906002)(81156014)(71190400001)(71200400001)(110136005)(54906003)(8676002)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3533;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FUifW4h7EUeVzeQgZfibukygkrocfiGguNQtrlk6PXuXhRbBk38iteoUkrDGPoVTQv8o5/8VrJad/1sn8Cy2F4+JJYyH3hXaIFau18GnZtXtEvYMG0HiT66EoRi1HEg3nU39NiJvO6Qc8obDIR0LPGbf2asnCuOCmAmTHdaV3bEqjFosw8H32eEhPlwUEXvV11P0hMet1V+0U0uIMf2gdQSAPKPfrjJBbTlkFhUh/ESZ4VJ2AXMUo+CCyt84NRIQcmdwcD+2XJZZdOPgDAKZ/YYlXEsfFARl44B60d14ArttssdPqwNbR/J0dIkNfQvr9Us/0+1YV/s24wRDm45lzDKuco7aQPyGJT3uPq9fAs+F4CuFntmBZSVcGOoJFwJLVC3ZIiIopdlePpl/roZJNdR3qAvhFRAZJ0FRdr18SfM=
Content-ID: <9060682F4C297C45AFE584565BA0B740@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33837ad5-3f7e-4439-9bea-08d70abca399
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:42:41.3018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3533
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+ICsNCj4gK291dDoNCj4gKyAgICByYzIgPSB4Y19kb21haW5fdW5wYXVzZSh4Y2gsIGRvbWFp
bl9pZCk7DQo+ICsgICAgaWYgKCByYzEgfHwgcmMyICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGlm
ICggcmMyICkNCj4gKyAgICAgICAgICAgIFBFUlJPUigiVW5hYmxlIHRvIHBhdXNlIGRvbWFpblxu
Iik7DQo+ICsNCj4gKyAgICAgICAgaWYgKCByYzEgPT0gMCApDQo+ICsgICAgICAgICAgICByYzEg
PSByYzI7DQoNCllvdSBjYW4gdXNlICFyYzEgaGVyZS4NCg0KPiArICAgIH0NCj4gKw0KPiArICAg
IHJldHVybiByYzE7DQo+ICt9DQo+ICsNCj4gK2ludCB4Y192bV9ldmVudF9uZ19kaXNhYmxlKHhj
X2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21haW5faWQsIGludCB0eXBlLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgeGVuZm9yZWlnbm1lbW9yeV9yZXNvdXJjZV9oYW5kbGUgKipm
cmVzKQ0KPiArew0KPiArICAgIHhlbmZvcmVpZ25tZW1vcnlfdW5tYXBfcmVzb3VyY2UoeGNoLT5m
bWVtLCAqZnJlcyk7DQo+ICsgICAgKmZyZXMgPSBOVUxMOw0KPiArDQo+ICsgICAgcmV0dXJuIHhj
X3ZtX2V2ZW50X2NvbnRyb2woeGNoLCBkb21haW5faWQsIFhFTl9WTV9FVkVOVF9ESVNBQkxFLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSwgWEVOX1ZNX0VWRU5UX0ZMQUdT
X05HX09QLCBOVUxMKTsNCj4gK30NCj4gKw0KDQoNCg0KPiAgIA0KPiArc3RhdGljIGludCB2bV9l
dmVudF9yaW5nX3Bmbl9wYXJhbSh1aW50MzJfdCB0eXBlKQ0KPiArew0KPiArICAgIHN3aXRjaCgg
dHlwZSApDQo+ICsgICAgew0KPiArI2lmZGVmIENPTkZJR19IQVNfTUVNX1BBR0lORw0KPiArICAg
IGNhc2UgWEVOX1ZNX0VWRU5UX1RZUEVfUEFHSU5HOg0KPiArICAgICAgICByZXR1cm4gSFZNX1BB
UkFNX1BBR0lOR19SSU5HX1BGTjsNCj4gKyNlbmRpZg0KPiArICAgIGNhc2UgWEVOX1ZNX0VWRU5U
X1RZUEVfTU9OSVRPUjoNCj4gKyAgICAgICAgcmV0dXJuIEhWTV9QQVJBTV9NT05JVE9SX1JJTkdf
UEZOOw0KPiArI2lmZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkcNCj4gKyAgICBjYXNlIFhFTl9W
TV9FVkVOVF9UWVBFX1NIQVJJTkc6DQo+ICsgICAgICAgIHJldHVybiBIVk1fUEFSQU1fU0hBUklO
R19SSU5HX1BGTjsNCj4gKyNlbmRpZg0KPiArICAgIH07DQo+ICsNCj4gKyAgICBBU1NFUlRfVU5S
RUFDSEFCTEUoKTsNCj4gKyAgICByZXR1cm4gLTE7DQoNCkJsYW5rIGxpbmUgYmVmb3JlIGZpbmFs
IHJldHVybi4uLg0KDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgdm1fZXZlbnRfcGF1c2VfZmxh
Zyh1aW50MzJfdCB0eXBlKQ0KPiArew0KPiArICAgIHN3aXRjaCggdHlwZSApDQo+ICsgICAgew0K
PiArI2lmZGVmIENPTkZJR19IQVNfTUVNX1BBR0lORw0KPiArICAgIGNhc2UgWEVOX1ZNX0VWRU5U
X1RZUEVfUEFHSU5HOg0KPiArICAgICAgICByZXR1cm4gX1ZQRl9tZW1fcGFnaW5nOw0KPiArI2Vu
ZGlmDQo+ICsgICAgY2FzZSBYRU5fVk1fRVZFTlRfVFlQRV9NT05JVE9SOg0KPiArICAgICAgICBy
ZXR1cm4gX1ZQRl9tZW1fYWNjZXNzOw0KPiArI2lmZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkcN
Cj4gKyAgICBjYXNlIFhFTl9WTV9FVkVOVF9UWVBFX1NIQVJJTkc6DQo+ICsgICAgICAgIHJldHVy
biBfVlBGX21lbV9zaGFyaW5nOw0KPiArI2VuZGlmDQo+ICsgICAgfTsNCj4gKw0KPiArICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOw0KPiArICAgIHJldHVybiAtMTsNCg0KaGVyZQ0KDQo+ICt9DQo+
ICsNCj4gKyNpZmRlZiBDT05GSUdfSEFTX01FTV9QQUdJTkcNCj4gK3N0YXRpYyB2b2lkIG1lbV9w
YWdpbmdfbm90aWZpY2F0aW9uKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcG9ydCk7DQo+
ICsjZW5kaWYNCj4gK3N0YXRpYyB2b2lkIG1vbml0b3Jfbm90aWZpY2F0aW9uKHN0cnVjdCB2Y3B1
ICp2LCB1bnNpZ25lZCBpbnQgcG9ydCk7DQo+ICsjaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklO
Rw0KPiArc3RhdGljIHZvaWQgbWVtX3NoYXJpbmdfbm90aWZpY2F0aW9uKHN0cnVjdCB2Y3B1ICp2
LCB1bnNpZ25lZCBpbnQgcG9ydCk7DQo+ICsjZW5kaWYNCj4gKw0KPiArc3RhdGljIHhlbl9ldmVu
dF9jaGFubmVsX25vdGlmaWNhdGlvbl90IHZtX2V2ZW50X25vdGlmaWNhdGlvbl9mbih1aW50MzJf
dCB0eXBlKQ0KPiArew0KPiArICAgIHN3aXRjaCggdHlwZSApDQo+ICsgICAgew0KPiArI2lmZGVm
IENPTkZJR19IQVNfTUVNX1BBR0lORw0KPiArICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZUEVfUEFH
SU5HOg0KPiArICAgICAgICByZXR1cm4gbWVtX3BhZ2luZ19ub3RpZmljYXRpb247DQo+ICsjZW5k
aWYNCj4gKyAgICBjYXNlIFhFTl9WTV9FVkVOVF9UWVBFX01PTklUT1I6DQo+ICsgICAgICAgIHJl
dHVybiBtb25pdG9yX25vdGlmaWNhdGlvbjsNCj4gKyNpZmRlZiBDT05GSUdfSEFTX01FTV9TSEFS
SU5HDQo+ICsgICAgY2FzZSBYRU5fVk1fRVZFTlRfVFlQRV9TSEFSSU5HOg0KPiArICAgICAgICBy
ZXR1cm4gbWVtX3NoYXJpbmdfbm90aWZpY2F0aW9uOw0KPiArI2VuZGlmDQo+ICsgICAgfTsNCj4g
Kw0KPiArICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KPiArICAgIHJldHVybiBOVUxMOw0KDQph
bmQgaGVyZQ0KDQo+ICt9DQo+ICsNCj4gKy8qDQo+ICsgKiBWTSBldmVudCByaW5nIGltcGxlbWVu
dGF0aW9uOw0KPiArICovDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
