Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D936E49F11
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdC9Y-0000dz-65; Tue, 18 Jun 2019 11:19:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kstG=UR=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hdC9W-0000do-Hw
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:19:50 +0000
X-Inumbo-ID: fbbf2785-91ba-11e9-8980-bc764e045a96
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::619])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fbbf2785-91ba-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmnfUq+iJprOKSIMpTv8MD401suuXBEUMgGrCafzP64=;
 b=KIft4Dj+YTxa31IP5eHcsGZ/BrDXPcPO/17HFu3HNLjC9iFTxelv2ZOZzRIDaTRaLeugDKHOYxP4okgnFNWkBpVLZvI8uM+DbxS4s1DmWpBd4o7Zgv9/UMEMUVyVuGwsKqNROqHUMSvOAf523zUu6RcVlyzDlfp76SClqmf7iMt/+CocxLxIHB8DJLyJ1vqah5f5mZBKFnbWsK3Ors5OSF+sfyVimuCEba/SVWLR+MT8Ik0FlGRZC9NpszmZ4S3dB8Rd5sQxllLSMVGR5rTT4kdV8UTjK472C506IfjmTQ8zQ+LgK9XWCg6jL69erNTBfKCzIa3rPuYnpJPfNQ9aww==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB4897.eurprd03.prod.outlook.com (20.178.22.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Tue, 18 Jun 2019 11:19:47 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1987.013; Tue, 18 Jun 2019
 11:19:47 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
Thread-Index: AQHVIIYF6TDvIT4pIEiasF2jZbMN/KadGvGAgAQzegA=
Date: Tue, 18 Jun 2019 11:19:46 +0000
Message-ID: <87v9x36sz1.fsf@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
 <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com>
In-Reply-To: <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 056b2358-9db7-4590-f055-08d6f3dedf14
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB4897; 
x-ms-traffictypediagnostic: AM0PR03MB4897:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR03MB48971BA134EC69C1DD4C443BE6EA0@AM0PR03MB4897.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(366004)(136003)(396003)(199004)(189003)(6436002)(68736007)(72206003)(486006)(8936002)(256004)(6512007)(966005)(66446008)(91956017)(305945005)(73956011)(446003)(7736002)(71190400001)(5660300002)(66476007)(6116002)(14454004)(71200400001)(54906003)(99286004)(2906002)(11346002)(66946007)(476003)(2616005)(229853002)(53936002)(4326008)(6306002)(6486002)(25786009)(3846002)(81166006)(478600001)(80792005)(316002)(6506007)(76116006)(8676002)(14444005)(64756008)(66556008)(53546011)(81156014)(26005)(186003)(55236004)(6246003)(36756003)(66066001)(76176011)(102836004)(86362001)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB4897;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vJSPp0r9QGqW1deWp89kvbgBLdWjxpkxYInURs99/674Im7D5XBpeZVOoIZhYSd498ocm1njO4dQZrQ9SRls37g8XODsW21UtuUN3I+t0TT0D6E6MnKxJuG7mI0pmmSJs9UyN1cwDuBR4jY7sg2mNcZNvlVy/QcerNIQyE7U0aYpAI3Ts/2T8Hd8MuijJLk+IxASgvlu8JxOGPZhpKj8sDSUl/8IzQiaW7V34DDXF/SIDvGqO3fTljeMwU9PQuZ35YYEUHt5RA75729ukPCYhH6mvp5eEE9iYqiJYaE6ZbWBKGWAaho2b0FCHKGpRIdGISpYwLEm5x8NSB6XFBVui9Olr+yYlq/6xxTC+c9YFg7571SEAY/I70I0VrTQqQnMX8KXYVXGm0NnQTQFUPjCMZPc9pr3komZWIFzIwntkNg=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 056b2358-9db7-4590-f055-08d6f3dedf14
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 11:19:46.9015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4897
Subject: Re: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpIFZvbG9keW15ciwKPgo+IE9u
IDYvMTEvMTkgNzo0NiBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+IFRoaXMgZW51bWVy
YXRpb24gY29udHJvbHMgVEVFIHR5cGUgZm9yIGEgZG9tYWluLiBDdXJyZW50bHkgdGhlcmUgaXMK
Pj4gdHdvIHBvc3NpYmxlIG9wdGlvbnM6IGVpdGhlciAnbm9uZScgb3IgJ29wdGVlJy4KPj4KPj4g
J25vbmUnIGlzIHRoZSBkZWZhdWx0IHZhbHVlIGFuZCBpdCBiYXNpY2FsbHkgZGlzYWJsZXMgVEVF
IHN1cHBvcnQgYXQKPj4gYWxsLgo+Pgo+PiAnb3B0ZWUnIGVuYWJsZXMgYWNjZXNzIHRvIHRoZSBP
UC1URUUgcnVubmluZyBvbiBhIGhvc3QgbWFjaGluZS4gVGhpcwo+PiByZXF1aXJlcyBzcGVjaWFs
IE9QLVRFRSBidWlsZCB3aXRoIHZpcnR1YWxpemF0aW9uIHN1cHBvcnQgZW5hYmxlZC4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0u
Y29tPgo+Pgo+PiAtLS0KPj4gICBBbGwgdGhlIHBhdGNoZXMgdG8gb3B0ZWUuYyBzaG91bGQgYmUg
bWVyZ2VkIHRvZ2V0aGVyLiBUaGV5IHdlcmUKPj4gICBzcGxpdCB0byBlYXNlIHVwIHJldmlldy4g
QnV0IHRoZXkgZGVwZW5kIGhlYXZpbHkgb24gZWFjaCBvdGhlci4KPj4KPj4gICBDaGFuZ2VzIGZy
b20gdjU6Cj4+ICAgIC0gUmVwbGFjZWQgIm5hdGl2ZSIgd2l0aCAib3B0ZWUiIGluIHRoZSBjb21t
aXQgZGVzY3JpcHRpb24uCj4+ICAgIC0gVXBkYXRlZCBhbmQgZXh0ZW5kZWQgZG9jdW1lbnRhdGlv
biBiYXNlZCBvbiBKdWxpZW4gR3JhbGwncwo+PiAgICAgIGFuZCBJYW4gSmFja3NvbidzIHN1Z2dl
c3Rpb25zLgo+Pgo+PiAgIENoYW5nZXMgZnJvbSB2NDoKPj4gICAgLSAibmF0aXZlIiBvcHRpb24g
d2FzIHJlcGxhY2VkIHdpdGggIm9wdGVlIgo+PiAgICAtICJ0ZWUiIHByb3BlcnR5IHdhcyBtb3Zl
ZCBmcm9tIGFyY2gtc3BlY2lmaWMgc2VjdGlvbiB0byB0aGUKPj4gICAgICAgZ2xvYmFsIG9uZS4g
RG9jdW1lbnRhdGlvbiBtb3ZlZCBpbnNpZGUgIkRldmljZXMiIHNlY3Rpb24uCj4+Cj4+ICAgQ2hh
bmdlcyBmcm9tIHYzOgo+PiAgICAtIHRlZV9lbmFibGVkIHJlbmFtZWQgdG8gdGVlX3R5cGUuIEN1
cnJlbnRseSB0d28gdHlwZXMgYXJlIHN1cHBvcnRlZAo+PiAgICAgIGFzIGRlc2NyaWJlZCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UKPj4gICAgLSBBZGQgTElCWExfSEFWRV9CVUlMRElORk9fQVJDSF9B
Uk1fVEVFIGRlZmluaXRpb24KPj4KPj4gICBDaGFuZ2VzIGZyb20gdjI6Cj4+ICAgIC0gVXNlIGFy
Y2gudGVlX2VuYWJsZWQgaW5zdGVhZCBvZiBzZXBhcmF0ZSBkb21jdGwKPj4gLS0tCj4+ICAgZG9j
cy9tYW4veGwuY2ZnLjUucG9kLmluICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4+ICAg
dG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgIHwgIDUgKysrKysKPj4gICB0b29scy9saWJ4bC9s
aWJ4bF9hcm0uYyAgICAgfCAxMyArKysrKysrKysrKysrCj4+ICAgdG9vbHMvbGlieGwvbGlieGxf
dHlwZXMuaWRsIHwgIDYgKysrKysrCj4+ICAgdG9vbHMveGwveGxfcGFyc2UuYyAgICAgICAgIHwg
IDkgKysrKysrKysrCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcu
NS5wb2QuaW4KPj4gaW5kZXggYzk5ZDQwMzA3ZS4uZTY1YWI2MTExZiAxMDA2NDQKPj4gLS0tIGEv
ZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCj4+ICsrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5p
bgo+PiBAQCAtMTU0NCw2ICsxNTQ0LDI3IEBAIFNldCBtYXhpbXVtIGhlaWdodCBmb3IgcG9pbnRl
ciBkZXZpY2UuCj4+ICAgICA9YmFjawo+PiAgICs9aXRlbSBCPHRlZT0iU1RSSU5HIj4KPj4gKwo+
PiArQjxBcm0gb25seS4+IFNldCBURUUgdHlwZSBmb3IgdGhlIGd1ZXN0LiBURUUgaXMgYSBUcnVz
dGVkIEV4ZWN1dGlvbgo+PiArRW52aXJvbm1lbnQgLS0gc2VwYXJhdGUgc2VjdXJlIE9TIGZvdW5k
IG9uIHNvbWUgcGxhdGZvcm1zLiBCPFNUUklORz4gY2FuIGJlIG9uZSBvZiB0aGU6Cj4+ICsKPj4g
Kz1vdmVyIDQKPj4gKwo+PiArPWl0ZW0gQjxub25lPgo+PiArCj4+ICtEaXNhYmxlIFRFRSBzdXBw
b3J0IGF0IGFsbC4gVGhpcyBpcyB0aGUgZGVmYXVsdCB2YWx1ZS4KPiBIb3cgYWJvdXQgIkRvbid0
IGFsbG93IHRoZSBndWVzdCB0byB1c2UgVEVFIGlmIHByZXNlbnQgb24gdGhlCj4gcGxhdGZvcm0u
IFRoaXMgaXMgdGhlIGRlZmF1bHQgdmFsdWUuIi4KSSdtIHBlcmZlY3RseSBmaW5lIHdpdGggdGhp
cy4KCj4+ICsKPj4gKz1pdGVtIEI8b3B0ZWU+Cj4+ICsKPj4gK0FsbG93IGEgZ3Vlc3QgdG8gdXNl
IE9QLVRFRS4gTm90ZSB0aGF0IGEgdmlydHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFCj4+ICtpcyBy
ZXF1aXJlZCBmb3IgdGhpcy4gSWYgdGhpcyBvcHRpb24gaXMgc2VsZWN0ZWQsIGd1ZXN0IHdpbGwg
YmUgYWJsZQo+Cj4gT09JLCB3aGF0IGhhcHBlbiBpZiBPUC1URUUgZG9lcyBub3Qgc3VwcG9ydCB2
aXJ0dWFsaXphdGlvbi4gV2lsbCBYZW4KPiBmb3JiaWQgdG8gdXNlIGl0PwpZZXMsIFhlbiB3aWxs
IGdldCBhbiBlcnJvciBmcm9tIE9QLVRFRSBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbi4gVGhp
cwp3aWxsIGxlYWQgdG8gZG9tYWluIGNyZWF0aW9uIGZhaWx1cmUuCgo+PiArdG8gYWNjZXNzIHRv
IHRoZSByZWFsIE9QLVRFRSBPUyBydW5uaW5nIG9uIHRoZSBob3N0LiBHdWVzdCBjcmVhdGlvbgo+
Cj4gcy9yZWFsLy8gaXQgaXMgcmVkdW5kYW50IHdpdGggdGhlIHJlc3Qgb2YgdGhlIHNlbnRlbmNl
LiBIb3dldmVyLCBpdAo+IGRvZXMgbm90IHJlYWxseSBhbnN3ZXIgdG8gdGhlIHF1ZXN0aW9uIHJl
Z2FyZGluZyBpc29sYXRpb24uCllvdXIgYXNzdW1wdGlvbiBpcyBjb3JyZWN0IC0gT1AtVEVFIHBy
b3ZpZGVzIGlzb2xhdGlvbiBvbiBpdHMgc2lkZS4KCj4KPj4gK3dpbGwgZmFpbCBpZiBPUC1URUUg
aGF2ZSBubyByZXNvdXJjZXMgZm9yIGEgbmV3IGd1ZXN0LiBOdW1iZXIgb2Ygc3VwcG9ydGVkCj4+
ICtndWVzdHMgZGVwZW5kcyBvbiBPUC1URUUgY29uZmlndXJhdGlvbi4KPgo+IEhvdyBhYm91dCB0
aGUgZm9sbG93aW5nIGRlc2NyaXB0aW9uIChjb3JyZWN0IG1lIGlmIG15IHVuZGVyc3RhbmRpbmcg
aXMKPiB3cm9uZyk6Cj4KPiAiQWxsb3cgYSBndWVzdCB0byBhY2Nlc3MgdGhlIGhvc3QgT1AtVEVF
IE9TLiBYZW4gd2lsbCBtZWRpYXRlIHRoZQo+IGFjY2VzcyB0byBPUC1URUUgYW5kIHRoZSByZXNv
dXJjZSBpc29sYXRpb24gd2lsbCBiZSBwcm92aWRlZCBkaXJlY3RseQo+IGJ5IE9QLVRFRS4gT1At
VEVFIGl0c2VsZiBtYXkgbGltaXQgdGhlIG51bWJlciBvZiBndWVzdHMgdGhhdCBjYW4KPiBjb25j
dXJyZW50bHkgdXNlIGl0LiBUaGlzIHJlcXVpcmVzIGEgdmlydHVhbGl6YXRpb24tYXdhcmUgT1At
VEVFIGZvcgo+IHRoaXMgdG8gd29yay4KPgo+IFRoaXMgZmVhdHVyZSBpcyBhIEI8dGVjaG5vbG9n
eSBwcmV2aWV3Pi4iClRoYXQncyBtdWNoIGJldHRlciB0aGFuIG15IHZlcnNpb24uIFRoYW5rIHlv
dS4KCj4gSG93IGNhbiBhIHVzZXIga25vdyB3aGV0aGVyIE9QLVRFRSBzdXBwb3J0cyB2aXJ0dWFs
aXphdGlvbj8gSXMgaXQKPiBjb25maWd1cmFibGUgYXQgYnVpbGQ/ClllcywgdGhlcmUgaXMgYSBz
cGVjaWFsIGNvbmZpZ3VyYXRpb24gb3B0aW9uIENGR19WSVJUVUFMSVpBVElPTi4gVGhpcyBpcwpj
b3ZlcmVkIGluIE9QLVRFRSBkb2N1bWVudGF0aW9uIGF0IFsxXQoKWzFdIGh0dHBzOi8vb3B0ZWUu
cmVhZHRoZWRvY3MuaW8vYXJjaGl0ZWN0dXJlL3ZpcnR1YWxpemF0aW9uLmh0bWwKCi0tIApCZXN0
IHJlZ2FyZHMsVm9sb2R5bXlyIEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
