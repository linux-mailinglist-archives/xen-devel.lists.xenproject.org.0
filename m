Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9175017
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:50:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqe77-0001tc-BX; Thu, 25 Jul 2019 13:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqe75-0001tV-Ik
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:48:55 +0000
X-Inumbo-ID: ef3ca5f2-aee2-11e9-8566-632659052848
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef3ca5f2-aee2-11e9-8566-632659052848;
 Thu, 25 Jul 2019 13:48:52 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 13:48:50 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 13:43:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 13:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFXRf70YMxIrnr5EwBT8Gp1lh84rvur3m5mqACEHeYccjyazk0huIyEYXOvledEDBhn+14eiegj2fIosoKHOZBcqQupTwNtP2oPVM3QvG+XeWvK2Vcy94V/VNWoFxBklqy9kcHhr8gqohCHa0RQFiycDLxQZcHV3LIySQsC3vJ+dPv52G6BeRRWvTV7GpPpWwNqmoRBVZ4FYvv6+LkEl0fVcaoA01M5ExvQfeuqt4S6IKN3kX0UM5jUo810iCB1C0kwzAM7m7jvFxGjaXnqOVdn2qYZdm90xFlMK+JvLHXHg+LA7vhNxfp9pHLOXyz+9C+Ep3FA8E4gzXeser4jFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUyiF6kGYzGot0gbm2/Q2Lz9PVBarD1Y+sM3Tv/zBpc=;
 b=NuXU2I0a3pvvlz8+jaYuHezCnKcHSrFG2fAGHNDW+VkmtJs3VzVGM0LOdUiAlAQWcm9cKSaTvWP0oxGTiA98BQIoermPTXz3Rg16CNdrjMIsUqCeT/ISaVR0o6zBA4L+D3RndcieHtnMeqJ/2ouhQeIa+DnlgzebuQe6UaMFthwhBOQlMpyb+ndhCPpBUfcxSqL2C2RLmPtJZuUO6/VKQKBFSiTrSUOgezMV+TJU5DphiIGwInecRyxMTWkINPMQYAf0X5LQ7GO5U846sXK5Q+KYtxIH2hD0UWIE+OcxX7I5UhY23mCCH8aog+Wff565qKWmIFZuaFIVLwx5r6FDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5SPR01MB0002.namprd18.prod.outlook.com (52.133.255.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 13:43:35 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 13:43:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] CPU frequency throttling based on the temperature
Thread-Index: AQHVQiidALk+x0uDw0GmzsE7VlPwJabZ1pPngAANq/uAAARaX4ABYPjhgAACXQCAAAWCgoAACCGA
Date: Thu, 25 Jul 2019 13:43:34 +0000
Message-ID: <b2e44583-8969-7a61-0458-a8ceea245792@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
In-Reply-To: <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0049.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::11) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04715dc3-00d4-4906-34b7-08d7110616e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5SPR01MB0002; 
x-ms-traffictypediagnostic: BY5SPR01MB0002:
x-microsoft-antispam-prvs: <BY5SPR01MB00024650BC8E76039D97E46EB3C10@BY5SPR01MB0002.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(8676002)(6436002)(14454004)(6512007)(81166006)(2906002)(81156014)(8936002)(68736007)(3846002)(478600001)(6116002)(31686004)(7736002)(54906003)(80792005)(36756003)(66066001)(6486002)(6506007)(53546011)(6916009)(486006)(66946007)(316002)(52116002)(99286004)(186003)(26005)(76176011)(476003)(2616005)(11346002)(102836004)(31696002)(6246003)(386003)(446003)(14444005)(71200400001)(4326008)(71190400001)(66446008)(86362001)(256004)(5660300002)(66476007)(66556008)(64756008)(53936002)(305945005)(229853002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5SPR01MB0002;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ahEqFdCNmwv2YE/8OiBeTWuQLEv51TFvC+BVrCH0S8//5NBJp/UcvXbuBr5EnFTSI2zof1E0rwXNLPBUwlP4Z9Q+g+boEuAQ42Bkq5FGfi7NwPrpcUs88R3dqSl5Pb2QfEkj3pl2qa4s8A3OMyJCrA3jguMhq5zZsPzHEMZwrJ7UOPHtUV6qm35t/bEjgP4jhKJOZP6wp79z2U4+VCueRsUT49AcWPgzFbdmXWRpcEC09c2b+nI3YyTHk41G6snoiLaAvL9lEqcKfzGdtKh7TeaX1IR2PaPHoSRbQhKUGkus48UeJClNISMT+c2i35Kl7S20wSVL0hm5SE0+mpD4KkRR8Z60uXd6GkzvKlvYyVx/VeQZBTmoGQ7abgChczh+PINuwPjiz45uqhA+6oR5RkzXeXlx32xTH2bEhgVIGTg=
Content-ID: <C46ED9509B6D5044972EAC6D7370D06F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04715dc3-00d4-4906-34b7-08d7110616e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 13:43:34.9121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5SPR01MB0002
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "Fredy P." <fredy.pulido@savoirfairelinux.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNToxMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDI1LCAyMDE5IGF0IDEyOjU0OjQ2UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMjUuMDcuMjAxOSAxNDo0NCwgIEZyZWR5IFAuICB3cm90ZToNCj4+PiBPbiBXZWQsIDIwMTkt
MDctMjQgYXQgMTc6NDEgKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gV2hh
dCBoYXJkd2FyZSBpbnRlcmZhY2UgZG9lcyB0aGVybWFsZCAob3IgdGhlIGRyaXZlciBpbiBMaW51
eCBpZg0KPj4+Pj4+IHRoZXJlJ3Mgb25lKSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRh
Pw0KPj4+DQo+Pj4gSW4gb3VyIGluaXRpYWwgUE9DIHVzaW5nIFhlbiA0LjgueCB3ZSB3aGVyZSB1
c2luZyBMaW51eCBjb3JldGVtcCBkcml2ZXINCj4+PiByZWFkaW5nIGJ5IGV4YW1wbGUgL2NsYXNz
L3N5cy9od21vbi9od21vbjAvdGVtcDNfaW5wdXQgYnV0IGl0IGdvdA0KPj4+IGRlcHJlY2F0ZWQg
YXQgY29tbWl0IDcyZTAzODQ1MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjliM2Q0M2M2YzYNCj4+DQo+
PiBIbW0sIEkgd291bGRuJ3QgY2FsbCB0aGlzIGRlcHJlY2F0aW9uLCBidXQgYSByZWdyZXNzaW9u
LiBJIHdvdWxkDQo+PiBzYXkgd2Ugd2FudCB0byByZS1leHBvc2UgdGhpcyBsZWFmIHRvIERvbTAs
IHRoZSBtb3JlIHRoYXQgdGhlDQo+PiBjb21taXQgYWxzbyBvbmx5IG1lbnRpb25zIHVucHJpdmls
ZWdlZCBkb21haW5zLiBBbmRyZXc/DQo+IA0KPiBBRkFJQ1QgZnJvbSB0aGUgZG9jdW1lbnRzIHBy
b3ZpZGVkIGJ5IEZyZWR5IHRoZSB0ZW1wZXJhdHVyZSBpcyByZWFkDQo+IGZyb20gYSBNU1IgdGhh
dCByZXBvcnRzIHRoZSBjdXJyZW50IHRlbXBlcmF0dXJlIG9mIHRoZSBjb3JlIG9uIHdoaWNoDQo+
IHRoZSBNU1IgaXMgcmVhZCBmcm9tLiBXaGVuIHJ1bm5pbmcgb24gWGVuIHRoaXMgd2lsbCBvbmx5
IHdvcmsNCj4gY29ycmVjdGx5IGlmIGRvbTAgaXMgZ2l2ZW4gdGhlIHNhbWUgdkNQVXMgYXMgcENQ
VXMgYW5kIHRob3NlIGFyZQ0KPiBpZGVudGl0eSBwaW5uZWQuDQo+IA0KPiBOb3Qgc3VyZSBob3cg
Y29tbW9uIHRoaXMgTVNSIGludGVyZmFjZSBpcyBpbiBvcmRlciB0byByZWFkIHRoZXJtYWwNCj4g
dmFsdWVzLCBpZiB0aGUgaW50ZXJmYWNlIGl0J3MgY29tbW9uIG1heWJlIGl0J3Mgc29tZXRoaW5n
IHRoYXQgY291bGQNCj4gYmUgaW1wbGVtZW50ZWQgaW4gWGVuLCBhbmQgZXhwb3J0ZWQgc29tZWhv
dyB0byBkb20wLCBtYXliZSB1c2luZw0KPiBzeXNjdGw/DQo+IA0KPiBPciBlbHNlIGhhdmluZyBh
biBoeXBlcmNhbGwgdGhhdCBhbGxvd3MgZG9tMCB0byByZXF1ZXN0IFhlbiB0byBleGVjdXRlDQo+
IE1TUiByZWFkL3dyaXRlcyBvbiBhIGdpdmVuIHBDUFUuDQoNClRoaXMgd291bGQgbG9vayB0byBy
ZXF1aXJlIGp1c3QgYSBzbWFsbCBleHRlbnNpb24gdG8NClhFTl9SRVNPVVJDRV9PUF9NU1JfUkVB
RC4gUXVlc3Rpb24gaXMgd2hldGhlciB0aGUgTGludXggZHJpdmVyDQptYWludGFpbmVycyB3b3Vs
ZCBhY2NlcHQgYSBjaGFuZ2UgdXNpbmcgdGhpcyBYZW4tc3BlY2lmaWMNCmFsdGVybmF0aXZlIGFj
Y2VzcyBtZWNoYW5pc20gKGluIHdoYXRldmVyIHNoYXBlKS4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
