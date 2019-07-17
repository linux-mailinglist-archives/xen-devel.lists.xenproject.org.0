Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B876B9A1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 12:00:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnghK-0005tF-7C; Wed, 17 Jul 2019 09:58:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N/EB=VO=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnghI-0005tA-La
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:58:04 +0000
X-Inumbo-ID: 5bc15fda-a879-11e9-95f2-8fd7e6af4590
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.110]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bc15fda-a879-11e9-95f2-8fd7e6af4590;
 Wed, 17 Jul 2019 09:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdNwY3shMu4BRjga+Dd8GTUea92hIkQLuaTmCbI35AJQeLlgnY8rYtHNgukN2veJfps9ONA/Zc9a+oFPeHmbhid+M9f/ci5yZCDCmDtNUhyDh4Qzt/lJNASKfaQO+smq8bjofHVKY9FFpv0VLY8fS7oiVPZGRI5Q4gPvSdnA+iI9Ficwz0QDOzpbfh6sOMUuTOFsv3UTVHJmYAMm9Xf1NBIourdCVJH4/JxceyrHQMlbf0BC1inylWbXk2Cm4jkihJHpS7125ZspfKoQRlnpSpJTJEvwHFLMvuaXiImwaSlOhFLByXEcYR8LBQHeJWGFigvs/DvrnVkbe5JtK7KhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOeVBzhAb9bxUhO8GAZ22q8dptpBKeqUR26TUGSDJhI=;
 b=amTmmq402jlfU/tg8H6Gzy9Nn7SmbPD1FLQVo0xHyI0AkXFdGcOyqph3xXMocuccnmhsrwnUBYFRI1sF8ogoPB3pux+ZP9nfCOkUKbe0Wa6ZAaXuovbKP6wYIxAe68bLL0RnvpmuDoC/qYhEgEBgS4yymX4M6TZA1GvAgRE7BJHpS6iw+EOSdo9JJHfCFJGtTtXLFCYI0OjdwcMruOyUbIGGiXFxvF8IrJzlo79KkYUhrBIoXC7Nqyop8ZstmV2w2+iR+jmySWBOsG40rOC4O88qcmKTbnt84O74DkFQbY6iPD0N0eW6H6hIxVQSRC0VJSKhVhgvQEVNNn1Ryxbc9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bitdefender.com;dmarc=pass action=none
 header.from=bitdefender.com;dkim=pass header.d=bitdefender.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOeVBzhAb9bxUhO8GAZ22q8dptpBKeqUR26TUGSDJhI=;
 b=RPNIs/4Uxc06qE9lxii/6aFFnoz4T5qrnpnnx5+DBS0puTDD2EpcGK/kZiAJZlOub/5U07iBuELIPoA70DC5SMMlK5QSkk9XW7/ozoh2VVUO5RF6NNMct1F5OnhrvW8E7fZqBwkNbPG/MeuzXTnUfH6j7zf00kFUs9A8Ub1bhq4=
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com (20.177.198.89) by
 AM6PR02MB5048.eurprd02.prod.outlook.com (20.178.88.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 09:57:58 +0000
Received: from AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00]) by AM6PR02MB4615.eurprd02.prod.outlook.com
 ([fe80::8185:36ef:58bb:9a00%2]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 09:57:58 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 01/10] vm_event: Define VM_EVENT type
Thread-Index: AQHVO/jiC7r7Phv/mUucGqu2PM/TjKbOgQIAgAATQYA=
Date: Wed, 17 Jul 2019 09:57:58 +0000
Message-ID: <1d4310ed27bb8a596f49861d72a0439e39b0f9d5.camel@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <e42d2c771da20ac7d8e3bdf0351aea1a01b1600f.1563293545.git.ppircalabu@bitdefender.com>
 <b5b9d063-2e54-aa36-9f2c-2027a5239dce@bitdefender.com>
In-Reply-To: <b5b9d063-2e54-aa36-9f2c-2027a5239dce@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0177.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::21) To AM6PR02MB4615.eurprd02.prod.outlook.com
 (2603:10a6:20b:6a::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7cea31d-bb54-4b51-50d4-08d70a9d3f3c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR02MB5048; 
x-ms-traffictypediagnostic: AM6PR02MB5048:|AM6PR02MB5048:
x-microsoft-antispam-prvs: <AM6PR02MB50489DEC5F805EE048546CA8D6C90@AM6PR02MB5048.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(366004)(346002)(136003)(199004)(189003)(186003)(53936002)(52116002)(68736007)(26005)(76176011)(99286004)(486006)(102836004)(6506007)(386003)(53546011)(2616005)(3846002)(6436002)(476003)(256004)(11346002)(446003)(8676002)(2906002)(6512007)(54906003)(110136005)(6116002)(6486002)(2501003)(86362001)(14454004)(36756003)(118296001)(316002)(25786009)(478600001)(4326008)(7736002)(6246003)(229853002)(7416002)(4744005)(71200400001)(8936002)(305945005)(50226002)(81166006)(66556008)(66476007)(5660300002)(81156014)(66446008)(66946007)(64756008)(66066001)(71190400001)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB5048;
 H:AM6PR02MB4615.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tEd3fVX8ZoiSaCvE70Y2RVlETlEFEIm75pxOz2odTpLYietrn6DVucDmj363eENcqOwZCxLqxE2X+nNhKfqlQ77V1uSeS5FVQ5MWATJd0Ofh9lS9PvndDJlJ84Ne03dz3XKHhVFQGg03GBldu+avAlpSQZe86HZPTKLmEy/JJdtoZWEXKkDrAtEIAFRoyY8KX4CjMDTyefeuI+d/orBpSu5sd4Z5jqJ9CKxEOpwYMdeoq6RllaFvO/aSlhWongcLWPLunIo3mEcYCFrTtimscZEthTnBTkBUfvYyh0U+a+xJVJkTBMTznd/x2Ls1YkKZx1DU2UAsn72q6Irf057Ro8LtIBTw02eKZKjmIPfT1SIiSuoG5qKwZzcEJ4ayoRPwj4vEpPCBDH98tS4S2ZZwowbiLxDDsWUr6MpqV3JCvv4=
Content-ID: <DF9B504355094C48AD22F1E4784B70F5@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cea31d-bb54-4b51-50d4-08d70a9d3f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 09:57:58.4604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppircalabu@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB5048
Subject: Re: [Xen-devel] [PATCH v2 01/10] vm_event: Define VM_EVENT type
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
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDExOjQ5ICswMzAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gDQo+IE9uIDE2LjA3LjIwMTkgMjA6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90
ZToNCj4gPiBAQCAtMTAwNCw3ICs5NDIsNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9wc3JfY210X29w
IHsNCj4gPiAgICAqIEVuYWJsZS9kaXNhYmxlIG1vbml0b3JpbmcgdmFyaW91cyBWTSBldmVudHMu
DQo+ID4gICAgKiBUaGlzIGRvbWN0bCBjb25maWd1cmVzIHdoYXQgZXZlbnRzIHdpbGwgYmUgcmVw
b3J0ZWQgdG8gaGVscGVyDQo+ID4gYXBwcw0KPiA+ICAgICogdmlhIHRoZSByaW5nIGJ1ZmZlciAi
TU9OSVRPUiIuIFRoZSByaW5nIGhhcyB0byBiZSBmaXJzdA0KPiA+IGVuYWJsZWQNCj4gPiAtICog
d2l0aCB0aGUgZG9tY3RsIFhFTl9ET01DVExfVk1fRVZFTlRfT1BfTU9OSVRPUi4NCj4gPiArICog
d2l0aCBYRU5fVk1fRVZFTlRfRU5BQkxFLg0KPiANCj4gVGhlIGFib3ZlIGNvbW1lbnQgc2hvdWxk
IGFsc28gYmUgYWRqdXN0ZWQuDQo+IA0KPiA+ICAgICoNCj4gPiAgICAqIEdFVF9DQVBBQklMSVRJ
RVMgY2FuIGJlIHVzZWQgdG8gZGV0ZXJtaW5lIHdoaWNoIG9mIHRoZXNlDQo+ID4gZmVhdHVyZXMg
aXMNCj4gPiAgICAqIGF2YWlsYWJsZSBvbiBhIGdpdmVuIHBsYXRmb3JtLg0KPiANCj4gQWxleA0K
VGhhbmsgZm9yIG5vdGljaW5nIHRoYXQuIEkgd2lsbCBjb3JyZWN0IGl0IG9uIHRoZSBuZXh0IHBh
dGNoc2V0DQppdGVyYXRpb24uDQoNClBldHJlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
