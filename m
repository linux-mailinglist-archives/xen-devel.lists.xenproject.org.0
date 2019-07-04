Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70CC5F64B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 12:05:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiyZJ-0003Lm-62; Thu, 04 Jul 2019 10:02:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiyZH-0003Lh-C7
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 10:02:19 +0000
X-Inumbo-ID: cd277f06-9e42-11e9-be8b-c7e1360512e7
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd277f06-9e42-11e9-be8b-c7e1360512e7;
 Thu, 04 Jul 2019 10:02:16 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 10:02:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 09:54:33 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 09:54:33 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3298.namprd18.prod.outlook.com (10.255.138.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Thu, 4 Jul 2019 09:54:32 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 09:54:32 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 06/15] x86/IRQ: fix locking around vector management
Thread-Index: AQHVMcyH7uiuGeaERUuYWmuoYGXwl6a6OVWA
Date: Thu, 4 Jul 2019 09:54:31 +0000
Message-ID: <082166fe-8b4c-2e09-d5e1-a0c5b69b46be@suse.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE91530200007800230078@prv1-mh.provo.novell.com>
 <643c5eb5-f0cb-549e-681e-142f2309958b@citrix.com>
In-Reply-To: <643c5eb5-f0cb-549e-681e-142f2309958b@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0026.eurprd02.prod.outlook.com
 (2603:10a6:4:a5::12) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 566d071b-8080-4c93-bef2-08d700659cac
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3298; 
x-ms-traffictypediagnostic: BY5PR18MB3298:
x-microsoft-antispam-prvs: <BY5PR18MB32987A7B34951EE86F0A2BA8B3FA0@BY5PR18MB3298.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(43544003)(199004)(189003)(66446008)(66476007)(66556008)(64756008)(4326008)(66946007)(73956011)(31686004)(66066001)(14454004)(53546011)(5660300002)(102836004)(99286004)(6506007)(26005)(186003)(386003)(52116002)(76176011)(256004)(14444005)(446003)(11346002)(476003)(2616005)(486006)(305945005)(7736002)(71190400001)(71200400001)(25786009)(72206003)(81166006)(8936002)(81156014)(80792005)(6486002)(6436002)(54906003)(229853002)(110136005)(6512007)(316002)(53936002)(86362001)(36756003)(478600001)(8676002)(68736007)(31696002)(3846002)(6116002)(2906002)(6246003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3298;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1UzKifW+aotedVTL5qBt006K8irgwJpW6/mXjUL5L1qbNajnjhuxBG8Ki5hLghQ6+QRlb2qdq0R60ha+ujIyywbo8G3WdMWIPt4beLX1VRs0nl5cv3b1KyuRwdfT3JmOVYmoiPu0mc/0/V5aSrGeD7enEejqW6xZJAAKAVPU9R+ts7yAhU0f4RER2TIDmM9VAW5ShPvgqCZKDaURjN1vA6SMR8dRm6SOlMGeQpbiswcUxvZPgjD0Ds5yjmllbifhA1cSYmQlWvfAUiWUn88LCIm4QZlTxKeJy9m8ctqjbAQiU7f6ETdZ40cYYYpGM1XBOdVwGjBFWA5h3JK33fHQhipEmeN4tC811xNg/pSsSOCognUd/qrG8+p9HkQGVyE5xjgQRhyjxGFbf8Y+f/WAX8QMGHmfV3srNpUBo+Cp5g4=
Content-ID: <678442A68BC8C84D943C3120282FF21D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 566d071b-8080-4c93-bef2-08d700659cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 09:54:31.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3298
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 06/15] x86/IRQ: fix locking around vector
 management
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
Cc: Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAyMDoyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDUvMjAx
OSAxMTo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBBbGwgb2YgX197YXNzaWduLGJpbmQsY2xl
YXJ9X2lycV92ZWN0b3IoKSBtYW5pcHVsYXRlIHN0cnVjdCBpcnFfZGVzYw0KPj4gZmllbGRzLCBh
bmQgaGVuY2Ugb3VnaHQgdG8gYmUgY2FsbGVkIHdpdGggdGhlIGRlc2NyaXB0b3IgbG9jayBoZWxk
IGluDQo+PiBhZGRpdGlvbiB0byB2ZWN0b3JfbG9jay4gVGhpcyBpcyBjdXJyZW50bHkgdGhlIGNh
c2UgZm9yIG9ubHkNCj4+IHNldF9kZXNjX2FmZmluaXR5KCkgKGluIHRoZSBjb21tb24gY2FzZSkg
YW5kIGRlc3Ryb3lfaXJxKCksIHdoaWNoIGFsc28NCj4+IGNsYXJpZmllcyB3aGF0IHRoZSBuZXN0
aW5nIGJlaGF2aW9yIGJldHdlZW4gdGhlIGxvY2tzIGhhcyB0byBiZS4NCj4+IFJlZmxlY3QgdGhl
IG5ldyBleHBlY3RhdGlvbiBieSBoYXZpbmcgdGhlc2UgZnVuY3Rpb25zIGFsbCB0YWtlIGENCj4+
IGRlc2NyaXB0b3IgYXMgcGFyYW1ldGVyIGluc3RlYWQgb2YgYW4gaW50ZXJydXB0IG51bWJlci4N
Cj4+DQo+PiBBbHNvIHRha2UgY2FyZSBvZiB0aGUgdHdvIHNwZWNpYWwgY2FzZXMgb2YgY2FsbHMg
dG8gc2V0X2Rlc2NfYWZmaW5pdHkoKToNCj4+IHNldF9pb2FwaWNfYWZmaW5pdHlfaXJxKCkgYW5k
IFZULWQncyBkbWFfbXNpX3NldF9hZmZpbml0eSgpIGdldCBjYWxsZWQNCj4+IGRpcmVjdGx5IGFz
IHdlbGwsIGFuZCBpbiB0aGVzZSBjYXNlcyB0aGUgZGVzY3JpcHRvciBsb2NrcyBoYWRuJ3QgZ290
DQo+PiBhY3F1aXJlZCB0aWxsIG5vdy4gRm9yIHNldF9pb2FwaWNfYWZmaW5pdHlfaXJxKCkgdGhp
cyBtZWFucyBhY3F1aXJpbmcgLw0KPj4gcmVsZWFzaW5nIG9mIHRoZSBJTy1BUElDIGxvY2sgY2Fu
IGJlIHBsYWluIHNwaW5feyx1bn1sb2NrKCkgdGhlbi4NCj4+DQo+PiBEcm9wIG9uZSBvZiB0aGUg
dHdvIGxlYWRpbmcgdW5kZXJzY29yZXMgZnJvbSBhbGwgdGhyZWUgZnVuY3Rpb25zIGF0DQo+PiB0
aGUgc2FtZSB0aW1lLg0KPj4NCj4+IFRoZXJlJ3Mgb25lIGNhc2UgbGVmdCB3aGVyZSBkZXNjcmlw
dG9ycyBnZXQgbWFuaXB1bGF0ZWQgd2l0aCBqdXN0DQo+PiB2ZWN0b3JfbG9jayBoZWxkOiBzZXR1
cF92ZWN0b3JfaXJxKCkgYXNzdW1lcyBpdHMgY2FsbGVyIHRvIGFjcXVpcmUNCj4+IHZlY3Rvcl9s
b2NrLCBhbmQgaGVuY2UgY2FuJ3QgaXRzZWxmIGFjcXVpcmUgdGhlIGRlc2NyaXB0b3IgbG9ja3Mg
KHdyb25nDQo+PiBsb2NrIG9yZGVyKS4gSSBkb24ndCBjdXJyZW50bHkgc2VlIGhvdyB0byBhZGRy
ZXNzIHRoaXMuDQo+IA0KPiBJbiBwcmFjdGljZSwgdGhlIG9ubHkgbXV0YXRpb24gaXMgc2V0dGlu
ZyBhIGJpdCBpbiBjcHVfbWFzayBmb3IgdGhlDQo+IHNoYXJlZCBoaWdoIHByaW9yaXR5IHZlY3Rv
cnMsIHNvIGxvb2tzIHRvIGJlIHNhZmUgaW4gcHJhY3RpY2UuDQoNCkkgaGFkIHRyaWVkIHRvIGNv
bnZpbmNlIG15c2VsZiB0aGF0IGl0J3Mgc2FmZSBpbiBwcmFjdGljZSwgYnV0IEknbQ0KYWZyYWlk
IEkgY291bGRuJ3QgKGFuZCBoZW5jZSB3b3VsZG4ndCB3YW50IHRvIHNheSBzbyBpbiB0aGUgcGF0
Y2gNCmRlc2NyaXB0aW9uIGhlcmUpLiBUaGVyZSdzIG9uZSBpbXBvcnRhbnQgdGhpbmcgdG8gcGF5
IGF0dGVudGlvbiB0bzoNCk5vdCBhbGwgbWFuaXB1bGF0aW9ucyBvZiAtPmFyY2guY3B1X21hc2sg
YXJlIGF0b21pYyAoYW5kIHRoZXJlJ3MNCnJlYWxseSBubyB3YXkgZm9yIHRoZW0gdG8gYmUsIHdp
dGggb3VyIGN1cnJlbnQgY3B1bWFzaw0KaW5mcmFzdHJ1Y3R1cmUpIC0gYWxsIG9mIHRoZW0gYXNz
dW1lIHRvIGJlIGRvbmUgdW5kZXIgbG9jay4gQW5kDQpvdGhlciB0aGFuIHdoZW4gb2ZmbGluaW5n
IGEgQ1BVIHdlJ3JlIG5vdCBpbiBhIGZ1bGx5IHN5bmNocm9uaXplZA0Kc3RhdGUgd2hpbGUgb25s
aW5pbmcgb25lLg0KDQo+IFRoZSBjYWxsZXJzIHVzZSBvZiB0aGUgdmVjdG9yX2xvY2sgbG9va3Mg
bGlrZSBhIGJvZGdlIHRob3VnaC4NCg0KV2VsbCwgaXQncyBkZWZpbml0ZWx5IG5vdCBuaWNlLCBi
dXQgdW5hdm9pZGFibGUgKGFmYWljdCkuDQoNCj4gSG93ZXZlcizCoCB0aGlzIGFuYWx5c2lzIG5l
ZWRzIHRvIGJlIGFkZGVkIHRvIHRoZSBjb21tZW50IGZvcg0KPiBzZXR1cF92ZWN0b3JfaXJxKCks
IGJlY2F1c2UgdGhlIGJlaGF2aW91ciBpcyBleHRyZW1lbHkgZnJhZ2lsZSBhbmQNCj4gbXVzdG4n
dCBjaGFuZ2UuDQoNCldpbGwgZG8uDQoNCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4gW1ZULWRdDQo+PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+IA0KPiBXaXRoIHNvbWUgZm9ybSBvZiBhZGp1c3RtZW50IHRv
IHRoZSBjb21tZW50IGZvciBzZXR1cF92ZWN0b3JfaXJxKCksIGFuZA0KPiBpZGVhbGx5IHRvIHRo
ZSBjb21taXQgbWVzc2FnZSBhYm91dCBzYWZldHkgaW4gcHJhY3RpY2UsIEFja2VkLWJ5OiBBbmRy
ZXcNCj4gQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpUaGFua3MuDQoNCkph
bg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
