Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21B215453B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:46:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhRH-0004mk-3f; Thu, 06 Feb 2020 13:43:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RI0J=32=amazon.co.uk=prvs=29855b991=pdurrant@srs-us1.protection.inumbo.net>)
 id 1izhRF-0004mX-BZ
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:43:25 +0000
X-Inumbo-ID: a5e2a4a8-48e6-11ea-85ce-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5e2a4a8-48e6-11ea-85ce-bc764e2007e4;
 Thu, 06 Feb 2020 13:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580996605; x=1612532605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S1VcM3Ax4LoR6Ibe0xDIBYxe6VwnQEV8SQpOu030/M4=;
 b=GoKfyrXcmLR848h25mXJHdHggzwWe2hKOexhjrGBrJ6Eqi6HK3tEKooa
 j01VeMiYGvXGLulwvpVtFXMnnbL9FH5QsIczI/kVL5p4KSCG34DN8RRdr
 iMfYLeCS4P1EVdfevbWesarGARI3CBifGl0H3LRv5YS/GBnJJgduaxlbC E=;
IronPort-SDR: 6eS5yQZRRJCbKOhgwW9F+ofPF/7eIevNvPc+gILbivYcZZC0gfsy5VaSlGSKQt22QkQ0o2tSYF
 pjP8+nnea0nA==
X-IronPort-AV: E=Sophos;i="5.70,409,1574121600"; d="scan'208";a="15975082"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 06 Feb 2020 13:43:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 318B0A1B6B; Thu,  6 Feb 2020 13:43:20 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 6 Feb 2020 13:43:20 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 6 Feb 2020 13:43:19 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 6 Feb 2020 13:43:19 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 7/7] x86/HVM: reduce scope of pfec in
 hvm_emulate_init_per_insn()
Thread-Index: AQHV2FYx4wPadACvt0GbWu8iye/TpqgOMaFg
Date: Thu, 6 Feb 2020 13:43:19 +0000
Message-ID: <947b56a1a504415e976a85f30dc483fa@EX13D32EUC003.ant.amazon.com>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
 <a2fabad3-2a05-da71-64b8-bd77ac955b82@suse.com>
In-Reply-To: <a2fabad3-2a05-da71-64b8-bd77ac955b82@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.213]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 7/7] x86/HVM: reduce scope of pfec in
 hvm_emulate_init_per_insn()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuDQo+IEJldWxp
Y2gNCj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE2OjQ2DQo+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0
cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaQ0KPiBMaXUgPHdsQHhl
bi5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gU3ViamVjdDogW1hlbi1kZXZl
bF0gW1BBVENIIHY0IDcvN10geDg2L0hWTTogcmVkdWNlIHNjb3BlIG9mIHBmZWMgaW4NCj4gaHZt
X2VtdWxhdGVfaW5pdF9wZXJfaW5zbigpDQo+IA0KPiBJdCBuZWVkcyBjYWxjdWxhdGluZyBvbmx5
IGluIG9uZSBvdXQgb2YgdGhyZWUgY2FzZXMuIFJlLXN0cnVjdHVyZSB0aGUNCj4gY29kZSBhIGxp
dHRsZSBzdWNoIHRoYXQgdGhlIHZhcmlhYmxlIHRydWx5IGdldHMgY2FsY3VsYXRlZCBvbmx5IHdo
ZW4gd2UNCj4gZG9uJ3QgZ2V0IGFueSBpbnNuIGJ5dGVzIGZyb20gZWxzZXdoZXJlLCBhbmQgaGVu
Y2UgbmVlZCB0byAodHJ5IHRvKQ0KPiBmZXRjaCB0aGVtLiBBbHNvIE9SIGluIFBGRUNfaW5zbl9m
ZXRjaCByaWdodCBpbiB0aGUgaW5pdGlhbGl6ZXIuDQo+IA0KPiBXaGlsZSBpbiB0aGlzIG1vb2Qs
IHJlc3RyaWN0IGFkZHIncyBzY29wZSBhcyB3ZWxsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50
IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQo+IC0tLQ0KPiB2NDogTmV3Lg0KPiANCj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVs
YXRlLmMNCj4gQEAgLTI3NjIsOCArMjc2Miw2IEBAIHZvaWQgaHZtX2VtdWxhdGVfaW5pdF9wZXJf
aW5zbigNCj4gICAgICB1bnNpZ25lZCBpbnQgaW5zbl9ieXRlcykNCj4gIHsNCj4gICAgICBzdHJ1
Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7DQo+IC0gICAgdW5zaWduZWQgaW50IHBmZWMgPSBQRkVD
X3BhZ2VfcHJlc2VudDsNCj4gLSAgICB1bnNpZ25lZCBsb25nIGFkZHI7DQo+IA0KPiAgICAgIGh2
bWVtdWxfY3R4dC0+Y3R4dC5sbWEgPSBodm1fbG9uZ19tb2RlX2FjdGl2ZShjdXJyKTsNCj4gDQo+
IEBAIC0yNzc4LDE0ICsyNzc2LDIzIEBAIHZvaWQgaHZtX2VtdWxhdGVfaW5pdF9wZXJfaW5zbigN
Cj4gICAgICAgICAgICAgIGh2bWVtdWxfY3R4dC0+c2VnX3JlZ1t4ODZfc2VnX3NzXS5kYiA/IDMy
IDogMTY7DQo+ICAgICAgfQ0KPiANCj4gLSAgICBpZiAoIGh2bWVtdWxfY3R4dC0+c2VnX3JlZ1t4
ODZfc2VnX3NzXS5kcGwgPT0gMyApDQo+IC0gICAgICAgIHBmZWMgfD0gUEZFQ191c2VyX21vZGU7
DQo+IC0NCj4gICAgICBodm1lbXVsX2N0eHQtPmluc25fYnVmX2VpcCA9IGh2bWVtdWxfY3R4dC0+
Y3R4dC5yZWdzLT5yaXA7DQo+IC0gICAgaWYgKCAhaW5zbl9ieXRlcyApDQo+ICsNCj4gKyAgICBp
ZiAoIGluc25fYnl0ZXMgKQ0KPiAgICAgIHsNCj4gKyAgICAgICAgaHZtZW11bF9jdHh0LT5pbnNu
X2J1Zl9ieXRlcyA9IGluc25fYnl0ZXM7DQo+ICsgICAgICAgIG1lbWNweShodm1lbXVsX2N0eHQt
Pmluc25fYnVmLCBpbnNuX2J1ZiwgaW5zbl9ieXRlcyk7DQo+ICsgICAgfQ0KPiArICAgIGVsc2Ug
aWYgKCAhKGh2bWVtdWxfY3R4dC0+aW5zbl9idWZfYnl0ZXMgPQ0KPiArICAgICAgICAgICAgICAg
IGh2bV9nZXRfaW5zbl9ieXRlcyhjdXJyLCBodm1lbXVsX2N0eHQtPmluc25fYnVmKSkgKQ0KPiAr
ICAgIHsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IHBmZWMgPSBQRkVDX3BhZ2VfcHJlc2VudCB8
IFBGRUNfaW5zbl9mZXRjaDsNCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOw0KPiArDQo+
ICsgICAgICAgIGlmICggaHZtZW11bF9jdHh0LT5zZWdfcmVnW3g4Nl9zZWdfc3NdLmRwbCA9PSAz
ICkNCj4gKyAgICAgICAgICAgIHBmZWMgfD0gUEZFQ191c2VyX21vZGU7DQo+ICsNCj4gICAgICAg
ICAgaHZtZW11bF9jdHh0LT5pbnNuX2J1Zl9ieXRlcyA9DQo+IC0gICAgICAgICAgICBodm1fZ2V0
X2luc25fYnl0ZXMoY3VyciwgaHZtZW11bF9jdHh0LT5pbnNuX2J1ZikgPzoNCj4gICAgICAgICAg
ICAgIChodm1fdmlydHVhbF90b19saW5lYXJfYWRkcih4ODZfc2VnX2NzLA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZodm1lbXVsX2N0eHQtPnNlZ19yZWdbeDg2
X3NlZ19jc10sDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHZt
ZW11bF9jdHh0LT5pbnNuX2J1Zl9laXAsDQo+IEBAIC0yNzk1LDE1ICsyODAyLDkgQEAgdm9pZCBo
dm1fZW11bGF0ZV9pbml0X3Blcl9pbnNuKA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZhZGRyKSAmJg0KPiAgICAgICAgICAgICAgIGh2bV9jb3B5X2Zyb21fZ3Vl
c3RfbGluZWFyKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYsIGFkZHIsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGh2bWVtdWxfY3R4dC0+aW5zbl9idWYp
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBmZWMgfCBQRkVD
X2luc25fZmV0Y2gsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TlVMTCkgPT0gSFZNVFJBTlNfb2theSkgPw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBmZWMsIE5VTEwpID09IEhWTVRSQU5TX29rYXkpID8NCj4gICAgICAgICAg
ICAgIHNpemVvZihodm1lbXVsX2N0eHQtPmluc25fYnVmKSA6IDA7DQo+ICAgICAgfQ0KPiAtICAg
IGVsc2UNCj4gLSAgICB7DQo+IC0gICAgICAgIGh2bWVtdWxfY3R4dC0+aW5zbl9idWZfYnl0ZXMg
PSBpbnNuX2J5dGVzOw0KPiAtICAgICAgICBtZW1jcHkoaHZtZW11bF9jdHh0LT5pbnNuX2J1Ziwg
aW5zbl9idWYsIGluc25fYnl0ZXMpOw0KPiAtICAgIH0NCj4gIH0NCj4gDQo+ICB2b2lkIGh2bV9l
bXVsYXRlX3dyaXRlYmFjaygNCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0DQo+IFhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
