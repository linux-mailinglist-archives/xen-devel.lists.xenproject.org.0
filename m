Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D9188809
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 15:51:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDW6-000767-8n; Tue, 17 Mar 2020 14:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=phrb=5C=amazon.co.uk=prvs=3385f804a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jEDW4-00075z-Fx
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:48:24 +0000
X-Inumbo-ID: 59cd009e-685e-11ea-bec1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59cd009e-685e-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 14:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1584456503; x=1615992503;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=MLgONaV1WfmAphvozN+llbmJB0BDmVKPm+DeIFP9pH4=;
 b=vOJ4e3279YMOf1LbZvwiqswo6Lx1ejRoFiq7ZuN+baz2KGy1adoIjJVo
 VcHbMpH+mMv3uX65bCewTj7KEsu65VZQ2OmFbHQ/QKU3nRKouTGLRQ0K+
 KcZg23N74a1CWJ6u6AJB/OuOGOpxKIS/uuqlMat/jzCbwHtb6EtC5Mn8M I=;
IronPort-SDR: aaU8oPVtC4JUqH58Frlr0SB7hkapMcFx1iNW2jYyEeEiZNWCJXdeMy9mQXRqYYQQ8uQJH3Knx4
 EkydbXzoqkfg==
X-IronPort-AV: E=Sophos;i="5.70,564,1574121600"; d="scan'208";a="22853117"
Thread-Topic: [PATCH v6 5/5] domain: use PGC_extra domheap page for shared_info
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 17 Mar 2020 14:48:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id 25185A2BA6; Tue, 17 Mar 2020 14:48:06 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Mar 2020 14:48:06 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 17 Mar 2020 14:48:05 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Tue, 17 Mar 2020 14:48:05 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQHV9wRBIgMJPUaXmkS0uWrq2JRSfahMzdYAgAAaBxA=
Date: Tue, 17 Mar 2020 14:48:05 +0000
Message-ID: <8a20f64eff704c5f98b230c050e8bdfe@EX13D32EUC003.ant.amazon.com>
References: <20200310174917.1514-1-paul@xen.org>
 <20200310174917.1514-6-paul@xen.org>
 <bb08d849-bc56-336c-aedc-baca08aa1f9d@suse.com>
In-Reply-To: <bb08d849-bc56-336c-aedc-baca08aa1f9d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.89]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 5/5] domain: use PGC_extra domheap page
 for shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDE3IE1hcmNoIDIwMjAgMTM6MTQNCj4gVG86IHBhdWxAeGVu
Lm9yZw0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVs
IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgVm9sb2R5bXly
IEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIHY2IDUvNV0g
ZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZSBmb3Igc2hhcmVkX2luZm8NCj4gDQo+
IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2Fu
aXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUu
DQo+IA0KPiANCj4gDQo+IE9uIDEwLjAzLjIwMjAgMTg6NDksIHBhdWxAeGVuLm9yZyB3cm90ZToN
Cj4gPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4NCj4gPiBD
dXJyZW50bHkgc2hhcmVkX2luZm8gaXMgYSBzaGFyZWQgeGVuaGVhcCBwYWdlIGJ1dCBzaGFyZWQg
eGVuaGVhcCBwYWdlcw0KPiA+IGNvbXBsaWNhdGUgZnV0dXJlIHBsYW5zIGZvciBsaXZlLXVwZGF0
ZSBvZiBYZW4gc28gaXQgaXMgZGVzaXJhYmxlIHRvLA0KPiA+IHdoZXJlIHBvc3NpYmxlLCBub3Qg
dXNlIHRoZW0gWzFdLiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBjb252ZXJ0cyBzaGFyZWRfaW5mbw0K
PiA+IGludG8gYSBQR0NfZXh0cmEgZG9taGVhcCBwYWdlLiBUaGlzIGRvZXMgZW50YWlsIGZyZWVp
bmcgc2hhcmVkX2luZm8gZHVyaW5nDQo+ID4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkg
cmF0aGVyIHRoYW4gZG9tYWluX2Rlc3Ryb3koKSBzbyBjYXJlIGlzDQo+ID4gbmVlZGVkIHRvIGF2
b2lkIGRlLXJlZmVyZW5jaW5nIGEgTlVMTCBzaGFyZWRfaW5mbyBwb2ludGVyIGhlbmNlIHNvbWUN
Cj4gPiBleHRyYSBjaGVja3Mgb2YgJ2lzX2R5aW5nJyBhcmUgbmVlZGVkLg0KPiANCj4gSWYgdGhl
cmUncyBnb2luZyB0byBiZSBhZ3JlZW1lbnQgdG8gZm9sbG93IHRoaXMgcm91dGUsIHRoZSBpbXBs
ZW1lbnRhdGlvbiwNCj4gd2l0aCBhIHJlYWxseSBtaW5vciBjb3NtZXRpYyBhZGp1c3RtZW50IC0g
c2VlIGJlbG93IC0sIGxvb2tzIG9rYXkgdG8gbWUuDQo+IE5ldmVydGhlbGVzcyBJIGNvbnRpbnVl
IHRvIGRpc2xpa2UgdGhlIGltcGxpY2F0aW9uIGZyb20gdGhlIGV4dHJhIGNhcmUNCj4gdGhhdCdz
IG5vdyBuZWVkZWQuIEFzIEkgdGhpbmsgSSBoYXZlIHNhaWQgYmVmb3JlLCBJJ2QgbGlrZSB0byBo
YXZlIGF0DQo+IGxlYXN0IG9uZSBvdGhlciBSRVNUIG1haW50YWluZXIncyBvcGluaW9uIGhlcmUu
DQo+IA0KDQpPaywgZmFpciBlbm91Z2guDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWlu
LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gPiBAQCAtMjYwLDkgKzI2MCwx
MiBAQCB2b2lkIGR1bXBfcGFnZWZyYW1lX2luZm8oc3RydWN0IGRvbWFpbiAqZCkNCj4gPg0KPiA+
ICAgICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPmV4dHJhX3BhZ2VfbGlzdCApDQo+
ID4gICAgICB7DQo+ID4gLSAgICAgICAgcHJpbnRrKCIgICAgRXh0cmFQYWdlICVwOiBjYWY9JTA4
bHgsIHRhZj0lIiBQUnR5cGVfaW5mbyAiXG4iLA0KPiA+ICsgICAgICAgIGNvbnN0IGNoYXIgKnRh
ZyA9IG1mbl9lcShwYWdlX3RvX21mbihwYWdlKSwgZC0+c2hhcmVkX2luZm8ubWZuKSA/DQo+ID4g
KyAgICAgICAgICAgICJbU0hBUkVEIElORk9dIiA6ICIiOw0KPiANCj4gUGxlYXNlIGNhbiB0aGlz
IGJlICIgW1NIQVJFRCBJTkZPXSIgd2l0aCAuLi4NCj4gDQo+ID4gKyAgICAgICAgcHJpbnRrKCIg
ICAgRXh0cmFQYWdlICVwOiBjYWY9JTA4bHgsIHRhZj0lIiBQUnR5cGVfaW5mbyAiICVzXG4iLA0K
PiANCj4gLi4uIHRoZSBibGFuayBiZWZvcmUgdGhlIGZpbmFsICVzIGRyb3BwZWQgaGVyZSwgc3Vj
aCB0aGF0IHdlIHdvbid0DQo+IGhhdmUgYSB0cmFpbGluZyBibGFuayBpbiB0aGUgb3V0cHV0Pw0K
DQpTdXJlLg0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
