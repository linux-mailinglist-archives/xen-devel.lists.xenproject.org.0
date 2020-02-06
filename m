Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D444C15410D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 10:21:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izdIO-0005DH-2z; Thu, 06 Feb 2020 09:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izdIM-0005DC-Tn
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 09:17:59 +0000
X-Inumbo-ID: 9081ffa2-48c1-11ea-8952-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9081ffa2-48c1-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 09:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580980678; x=1612516678;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hj5wsW+QKJyG5c4/WV92QW1KIvXC59UHKj1v4+DHcss=;
 b=CJu7FdS3gmiWOVgkVTGlG2Ece8lGEgKUeEHF3TUYXj7mNmc6jC8brDwt
 qcxv+UapQm1ynJi7GGwTK1m4Ys9tr/7wkygTidLvYnrM5lsUxzJqjZPze
 UtdTAQ10ahVByzNfmp/KYLXr2W14FyAQ+cx0u7mXP4p2FeSF+RQ3McrBp I=;
IronPort-SDR: uAxSC2OwE2P9ejg/ygU8yP7P/KskWPYe7KXQgTXcfXc9pQA3JEwY7TMSPDEYwMtwT+MnL9bevA
 OEsIuSvCOF2A==
X-IronPort-AV: E=Sophos;i="5.70,409,1574121600"; d="scan'208";a="14988858"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 06 Feb 2020 09:17:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id E904CA1792; Thu,  6 Feb 2020 09:17:45 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 09:17:45 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 09:17:44 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 09:17:44 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, 
 Julien Grall <julien@xen.org>, Tim Deegan <tim@xen.org>
Thread-Topic: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
Thread-Index: AQHV2oCoSQ6jJjHUtUGr3S6VkEPAzagN2XmQgAAFMgCAAAcEMA==
Date: Thu, 6 Feb 2020 09:17:44 +0000
Message-ID: <91137906fece4250abbdf7ccad975cdf@EX13D32EUC003.ant.amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <fe250b28cc42442c86fdb108e1702c45@EX13D32EUC003.ant.amazon.com>
 <97420ba1-ecc1-8545-d36b-8d67d6ac226a@suse.com>
In-Reply-To: <97420ba1-ecc1-8545-d36b-8d67d6ac226a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjAgMDg6NDYNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5v
cmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBBbmRy
ZXcNCj4gQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+OyBUaW0NCj4gRGVlZ2FuIDx0aW1AeGVuLm9yZz47IEp1biBOYWthamltYSA8
anVuLm5ha2FqaW1hQGludGVsLmNvbT47IFZvbG9keW15cg0KPiBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHY5IDAvNF0gcHVyZ2UgZnJl
ZV9zaGFyZWRfZG9taGVhcF9wYWdlKCkNCj4gDQo+IE9uIDA2LjAyLjIwMjAgMDk6MjgsIER1cnJh
bnQsIFBhdWwgd3JvdGU6DQo+ID4gQUZBSUNUIHRoZXNlIHBhdGNoZXMgaGF2ZSB0aGUgbmVjZXNz
YXJ5IEEtYi9SLWItcywgb3IgYXJlIHRoZXJlIHNvbWUNCj4gbWlzc2luZyB0aGF0IEkgbmVlZCB0
byBjaGFzZT8NCj4gDQo+IEFjY29yZGluZyB0byBteSByZWNvcmRzIC4uLg0KPiANCj4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPg0KPiA+PiBTZW50OiAwMyBGZWJydWFyeSAyMDIwIDEwOjU3DQo+ID4+DQo+
ID4+IFBhdWwgRHVycmFudCAoNCk6DQo+ID4+ICAgeDg2IC8gdm14OiBtb3ZlIHRlYXJkb3duIGZy
b20gZG9tYWluX2Rlc3Ryb3koKS4uLg0KPiA+PiAgIGFkZCBhIGRvbWFpbl90b3RfcGFnZXMoKSBo
ZWxwZXIgZnVuY3Rpb24NCj4gPj4gICBtbTogbWFrZSBwYWdlcyBhbGxvY2F0ZWQgd2l0aCBNRU1G
X25vX3JlZmNvdW50IHNhZmUgdG8gYXNzaWduDQo+ID4+ICAgeDg2IC8gdm14OiB1c2UgYSBNRU1G
X25vX3JlZmNvdW50IGRvbWhlYXAgcGFnZSBmb3INCj4gPj4gICAgIEFQSUNfREVGQVVMVF9QSFlT
X0JBU0UNCj4gPj4NCj4gPj4gIHhlbi9hcmNoL2FybS9hcm02NC9kb21jdGwuYyAgICAgfCAgMiAr
LQ0KPiANCj4gLi4uIHRoaXMgKEFybSksIC4uLg0KPiANCj4gPj4gIHhlbi9hcmNoL3g4Ni9kb21h
aW4uYyAgICAgICAgICAgfCAgMiArLQ0KPiA+PiAgeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMg
ICAgICB8IDI1ICsrKysrKysrLS0tDQo+IA0KPiAuLi4gdGhpcyAoVk1YKSwgLi4uDQo+IA0KPiA+
PiAgeGVuL2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICB8IDE1ICsrLS0tLS0NCj4gPj4gIHhl
bi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMgICAgICAgfCAxMCArKy0tLQ0KPiANCj4gLi4uIHRoaXMg
KE1NKSwgLi4uDQo+IA0KPiA+PiAgeGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYyB8ICAy
ICstDQo+IA0KPiAuLi4gdGhpcyAoc2hhZG93KSwgLi4uDQo+IA0KPiA+PiAgeGVuL2FyY2gveDg2
L21zaS5jICAgICAgICAgICAgICB8ICAyICstDQo+ID4+ICB4ZW4vYXJjaC94ODYvbnVtYS5jICAg
ICAgICAgICAgIHwgIDIgKy0NCj4gPj4gIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgICAg
fCAyNSArKysrKystLS0tLQ0KPiA+PiAgeGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jICAgICAgICB8
ICAyICstDQo+ID4+ICB4ZW4vYXJjaC94ODYvcHYvc2hpbS5jICAgICAgICAgIHwgIDQgKy0NCj4g
Pj4gIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgfCAgMiArLQ0KPiA+PiAgeGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jICAgICAgICB8ICA0ICstDQo+ID4+ICB4ZW4vY29tbW9uL2tleWhh
bmRsZXIuYyAgICAgICAgIHwgIDIgKy0NCj4gPj4gIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAg
ICAgICAgfCAgMiArLQ0KPiA+PiAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgICAgICAgICB8IDc4
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+PiAgeGVuL2luY2x1ZGUvYXNt
LWFybS9tbS5oICAgICAgICB8ICA1ICsrLQ0KPiANCj4gLi4uIGFuZCB0aGlzIChBcm0gYWdhaW4p
LiBJIHRoaW5rIGFsbW9zdCBhbGwgYXJlIGZvciBwYXRjaCAyLCB3aXRoDQo+IGFuIEFybSBvbmUg
bmVlZGVkIG9uIHBhdGNoIDMuIElmIEkgb3Zlcmxvb2tlZCBhbnksIHBsZWFzZSBwb2ludCBtZQ0K
PiBhdCB0aGVtLg0KDQpPaywgdGhhbmtzLiBLZXZpbiBoYXMgY29tcGxldGVkIGhpcyBhY2tzIChw
YXRjaGVzICMxIGFuZCAjNCkuDQoNCkdlb3JnZSwgSnVsaWVuLCBUaW0sDQoNCiAgQ2FuIEkgaGF2
ZSBhY2tzIG9yIG90aGVyd2lzZSwgcGxlYXNlPw0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
