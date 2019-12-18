Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03136124114
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 09:09:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihULb-0006n5-Uv; Wed, 18 Dec 2019 08:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BItc=2I=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ihULa-0006n0-Ae
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 08:06:18 +0000
X-Inumbo-ID: 4348cf52-216d-11ea-b6f1-bc764e2007e4
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::716])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4348cf52-216d-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 08:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg0tjZf+8BCSruLKrlmr2jsJSVmwOxkXYkB+8MoAzdfBJ4Yx2Ckby/flUccypH5Yd6YzA1iY9bldZlTWivA4kbZ6iM1EUVO1G7DTB/biCXEXGN6obyZYT/rlji8XMoJsb39x8KqD+dNFOi7wJJcKAaXouEdmLjumOHL+m775157XM6GHJuAstMDAoyM8rqdfoCGuT/1w0LCgzXjirIvma/Sb0ojtsO33W9ynJZ7PtDFuSgv89aSDtUKAoL+uehL84qlMbdPP22a3yIRptjom7RTigXdtahZ6ku3WwzR2fLxapF/4Ih4l+dC2uPcGxdp891pny3St4W7y6qDBy2tqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8PP1cwGkJ3+Izfgu+JkdidAMGvYR5VQcH46Z0c8pOE=;
 b=Q63UrowtQ+21IWp4Yt/gZ/GvgidwFXpLRw43ZGHDE8EaJaBZkNiDn0amJl04Xb4m3DtoCcii2rzwPMzKlFh4aSpC8fwiLGjfP2THwq6WLgV7Zc9VVFXwAtrV9yntqjNEXgHQiV1hN5tWSiYoGDIigPcZ2FNUkLBNp3PD7lZMvekxOHpg9MEV+Ty+sXpH+ukWPUd9Aq7wcVK8zQcMDIm3IoeJlamnG4f97CdMP+NObAkBgwcaSfslVWjlh+aJoSABTdsDFVNNUyF96I5lNqlnVhWmRibkkxu+kmPnsU0o5fIe2uQdPBuFJCgf9VUfVmgsfaCWC9JpXnRkZLvf4On+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8PP1cwGkJ3+Izfgu+JkdidAMGvYR5VQcH46Z0c8pOE=;
 b=Qwkh2qVwOitDt4mUEd53y+6rNKQ0C36EywJ/gu8dCvI5qo5nn5Krm5axQgZiKtCojmgpc5kQM4pRSZ94VOQeY1puESU4/XGrnOlbPapQP88RXK9ycYC8htDGhwVkUsyq6lXtL/FZThDcEPApQK93fP2GXpcPSMXKPY+dsYwkuOk=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4513.eurprd02.prod.outlook.com (20.178.19.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.19; Wed, 18 Dec 2019 08:06:10 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 08:06:10 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V4 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVtOxhsG39wuvEP0STO9uvU+j0gae+ikOAgAD/5QA=
Date: Wed, 18 Dec 2019 08:06:09 +0000
Message-ID: <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <9012ab5f-4a3b-d469-6c03-20aa59773c2a@suse.com>
In-Reply-To: <9012ab5f-4a3b-d469-6c03-20aa59773c2a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0105.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::46) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52e6bb38-7055-479e-2dbc-08d78391242e
x-ms-traffictypediagnostic: AM0PR02MB4513:|AM0PR02MB4513:|AM0PR02MB4513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4513D7348FB55435D8F2980CAB530@AM0PR02MB4513.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(39860400002)(366004)(136003)(189003)(199004)(2616005)(81156014)(81166006)(86362001)(186003)(53546011)(26005)(6916009)(6512007)(478600001)(8936002)(6486002)(66446008)(64756008)(66556008)(66476007)(6506007)(66946007)(2906002)(54906003)(4326008)(52116002)(31696002)(31686004)(71200400001)(316002)(5660300002)(8676002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4513;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rBZuRZ2ai8OBuL9Rof1NWDbzEgPaLC2ed+h+LWrKIeOAcLTmPLsKIJRK8/fsRLwifABjig7m1W2S92+8rth7PdLWyZCwWrnFGuEigA0YnD9GLNpUMMbydRM46tCJFN8O6Qt6fpDHWQ74wD6EXKOc66Klflc+ojCZv45pr5/BWLs0Jaqv1jbARQSXfcclahZrrfzQwHtNtqa2eKlv0fZNUF/5BKHydJQx/YtKEt0S+bqdds0qeW1fm+rdV5/udxzHeoURUX6PghSTI701+NQjOzliUTHQHIktID5ugYW+NCTo1Uhw3glSMcPd6jDnwZcqFr4WHtQEjjyF/XAhnpddLgBVhSlKEFS27rSHGPM+/NW4R3zf4IQoTshA09ml4nJAQW5qhCXPX20WiAKTj6jMfCGEPlzKt2a7oAEnf+nwgCkTBpPK7ZevtW02yDTB1fZI
Content-ID: <FF0E3B647D9557419B125B2AFE7A8F14@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e6bb38-7055-479e-2dbc-08d78391242e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 08:06:09.8166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9oYKY2njmVBV51D2SirGbmIlIb+6R25bC7NPYz2K6/OhQqJLO6ODOSU8hozDc3zjHwqgnxqte4cvBORcDiI5aSXoooUMUf+0QsCbM05vSZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4513
Subject: Re: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE3LjEyLjIwMTkgMTg6NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMi4y
MDE5IDE2OjEyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNj
ZXNzLmMNCj4+IEBAIC0zNjcsMTAgKzM2NywxMSBAQCBsb25nIHAybV9zZXRfbWVtX2FjY2Vzcyhz
dHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIHVpbnQzMl90IG5yLA0KPj4gICAgICAgaWYgKCBh
bHRwMm1faWR4ICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0g
TUFYX0FMVFAyTSB8fA0KPj4gLSAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAy
bV9pZHhdID09IG1mbl94KElOVkFMSURfTUZOKSApDQo+PiArICAgICAgICAgICAgIGQtPmFyY2gu
YWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1BWF9FUFRQKV0gPT0N
Cj4gDQo+IFRoZSBib3VuZHMgY2hlY2sgaXMgYWdhaW5zdCBNQVhfQUxUUDJNLiBCb3RoIE1BWF8g
dmFsdWVzIGxvb2sgdG8gYmUNCj4gaW5kZXBlbmRlbnQsIHdoaWNoIG1lYW5zIGJvdW5kcyBjaGVj
ayBhbmQgdmFsdWUgcGFzc2VkIHRvIHRoZQ0KPiBoZWxwZXIgbmVlZCB0byBtYXRjaCB1cCAobm90
IGp1c3QgaGVyZSkuDQoNCkkgd2lsbCBoYXZlIGJvdGggY2hlY2tzIGFnYWluc3QgTUFYX0FMVFAy
TS4NCg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4+IEBAIC0xMzUzLDcgKzEzNTMsOCBAQCB2b2lkIHNl
dHVwX2VwdF9kdW1wKHZvaWQpDQo+PiAgIA0KPj4gICB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGkpDQo+PiAgIHsNCj4+IC0gICAgc3RydWN0
IHAybV9kb21haW4gKnAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsNCj4+ICsgICAgc3RydWN0
IHAybV9kb21haW4gKnAybSA9DQo+PiArICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9wMm1bYXJy
YXlfaW5kZXhfbm9zcGVjKGksIE1BWF9BTFRQMk0pXTsNCj4+ICAgICAgIHN0cnVjdCBwMm1fZG9t
YWluICpob3N0cDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOw0KPj4gICAgICAgc3RydWN0IGVwdF9k
YXRhICplcHQ7DQo+PiAgIA0KPj4gQEAgLTEzNjYsNyArMTM2Nyw3IEBAIHZvaWQgcDJtX2luaXRf
YWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaSkNCj4+ICAgICAgIHAy
bS0+bWF4X21hcHBlZF9wZm4gPSBwMm0tPm1heF9yZW1hcHBlZF9nZm4gPSAwOw0KPj4gICAgICAg
ZXB0ID0gJnAybS0+ZXB0Ow0KPj4gICAgICAgZXB0LT5tZm4gPSBwYWdldGFibGVfZ2V0X3Bmbihw
Mm1fZ2V0X3BhZ2V0YWJsZShwMm0pKTsNCj4+IC0gICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9
IGVwdC0+ZXB0cDsNCj4+ICsgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3Nw
ZWMoaSwgTUFYX0VQVFApXSA9IGVwdC0+ZXB0cDsNCj4+ICAgfQ0KPj4gICANCj4+ICAgdW5zaWdu
ZWQgaW50IHAybV9maW5kX2FsdHAybV9ieV9lcHRwKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2NF90
IGVwdHApDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYw0KPj4gQEAgLTI0OTksNyArMjQ5OSw3IEBAIHN0YXRpYyB2b2lkIHAybV9y
ZXNldF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwNCj4+ICAgICAg
IHN0cnVjdCBwMm1fZG9tYWluICpwMm07DQo+PiAgIA0KPj4gICAgICAgQVNTRVJUKGlkeCA8IE1B
WF9BTFRQMk0pOw0KPj4gLSAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baWR4XTsNCj4+ICsg
ICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhpZHgsIE1BWF9B
TFRQMk0pXTsNCj4+ICAgDQo+PiAgICAgICBwMm1fbG9jayhwMm0pOw0KPj4gICANCj4+IEBAIC0y
NTQwLDcgKzI1NDAsNyBAQCBzdGF0aWMgaW50IHAybV9hY3RpdmF0ZV9hbHRwMm0oc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCkNCj4+ICAgDQo+PiAgICAgICBBU1NFUlQoaWR4IDwg
TUFYX0FMVFAyTSk7DQo+PiAgIA0KPj4gLSAgICBwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1baWR4
XTsNCj4+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhp
ZHgsIE1BWF9BTFRQMk0pXTsNCj4gDQo+IEFsbCBvZiB0aGUgYWJvdmUgaGF2ZSBhIG1vcmUgb3Ig
bGVzcyBzaWduaWZpY2FudCBkaXNjb25uZWN0IGJldHdlZW4NCj4gdGhlIGJvdW5kcyBjaGVjayBh
bmQgdGhlIHVzZSBhcyBhcnJheSBpbmRleC4gSSB0aGluayBpdCB3b3VsZCBiZQ0KPiBxdWl0ZSBo
ZWxwZnVsIGlmIHRoZXNlIGNvdWxkIGxpdmUgY2xvc2UgdG8gb25lIGFub3RoZXIsIHNvIG9uZSBj
YW4NCj4gKHNlZSBmdXJ0aGVyIHVwKSBlYXNpbHkgcHJvdmUgdGhhdCBib3RoIHNwZWNpZmllZCBi
b3VuZHMgYWN0dWFsbHkNCj4gbWF0Y2ggdXAuDQo+IA0KDQpTdXJlLCBJIGNhbiBtb3ZlIHRoZSBh
cnJheSB1c2UgY2xvc2VyIHRvZ2V0aGVyLg0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
