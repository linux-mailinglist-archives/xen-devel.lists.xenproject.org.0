Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29641A9902
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 11:33:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOePQ-0005sP-D4; Wed, 15 Apr 2020 09:32:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lpyF=57=amazon.com=prvs=367615363=havanur@srs-us1.protection.inumbo.net>)
 id 1jOePP-0005sK-49
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 09:32:39 +0000
X-Inumbo-ID: 0b17da51-7efc-11ea-8a1e-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b17da51-7efc-11ea-8a1e-12813bfff9fa;
 Wed, 15 Apr 2020 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586943157; x=1618479157;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=p+a9pwPcuOF2QCgGDOQQyu7qTSIDuuYYPkkAPKsD7y4=;
 b=HXUVBqsJhWWPFw+048qzJ/q4gcJaJfGen2av3qk3efmFCoUdDChH+LC+
 Yl+DiGdGppVHJGCX/T/V9seXvb3lUpzK077fkU4ZLYENKdcoHhMJrnmxW
 40R63CpMicYdhAJ8ZJZZHvCj9RG76EVI4fzLSZelQpwL2+mBfUOfR6guy M=;
IronPort-SDR: EiadF9FGcF2rHiZ0Q6pc6CVoNrw5XJwq9rU0YxMyJFYCEhJrg+1n/wf66fMnaey3drexl5YRRg
 jI6H2mPNJWLg==
X-IronPort-AV: E=Sophos;i="5.72,386,1580774400"; d="scan'208";a="25641125"
Subject: Re: [XEN PATCH v4] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Thread-Topic: [XEN PATCH v4] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 15 Apr 2020 09:32:25 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 99702A23D5; Wed, 15 Apr 2020 09:32:22 +0000 (UTC)
Received: from EX13D36EUC001.ant.amazon.com (10.43.164.105) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 09:32:22 +0000
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC001.ant.amazon.com (10.43.164.105) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 09:32:21 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Wed, 15 Apr 2020 09:32:21 +0000
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Index: AQHWEoA+bzxN65iSaU+AQK01+fBaZah5xbMAgAAm0QA=
Date: Wed, 15 Apr 2020 09:32:21 +0000
Message-ID: <538d839fda5fc78c7519200e990d1888e56a6e06.camel@amazon.com>
References: <4b6c017245698c18b063d156be645b8b633c0a99.1586884502.git.havanur@amazon.com>
 <81c7ca01-c272-9114-a5d0-12ca94090eb2@suse.com>
In-Reply-To: <81c7ca01-c272-9114-a5d0-12ca94090eb2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.71]
Content-Type: text/plain; charset="utf-8"
Content-ID: <818FFC9DFBF3F048A9A9F9E72A160B66@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDIwLTA0LTE1IGF0IDA5OjEzICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbw0KPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMTQuMDQuMjAyMCAxOToxNSwgSGFyc2hhIFNoYW1zdW5kYXJh
IEhhdmFudXIgd3JvdGU6DQo+ID4gQEAgLTEyMCw2ICsxMjEsMTEgQEAgdm9pZCBwY2lfc2V0dXAo
dm9pZCkNCj4gPiAgICAgICAqLw0KPiA+ICAgICAgYm9vbCBhbGxvd19tZW1vcnlfcmVsb2NhdGUg
PSAxOw0KPiA+IA0KPiA+ICsgICAgQlVJTERfQlVHX09OKCh0eXBlb2YoKnBjaV9kZXZmbl9kZWNv
ZGVfdHlwZSkpUENJX0NPTU1BTkRfTUVNT1INCj4gPiBZDQo+ID4gKyAgICAgICAgICAgICE9IFBD
SV9DT01NQU5EX01FTU9SWSk7DQo+ID4gKyAgICBCVUlMRF9CVUdfT04oKHR5cGVvZigqcGNpX2Rl
dmZuX2RlY29kZV90eXBlKSlQQ0lfQ09NTUFORF9JTw0KPiA+ICsgICAgICAgICAgICAhPSBQQ0lf
Q09NTUFORF9JTyk7DQo+IA0KPiBUaGlzIHN0aWxsIGlzbid0IGluIGxpbmUgd2l0aCBvdXIgZGVm
YXVsdCBzdHlsZSwgeW91IHdpbGwgd2FudCBlZzoNCj4gDQo+ICAgICBCVUlMRF9CVUdfT04oKHR5
cGVvZigqcGNpX2RldmZuX2RlY29kZV90eXBlKSlQQ0lfQ09NTUFORF9NRU1PUlkNCj4gIT0NCj4g
ICAgICAgICAgICAgICAgICBQQ0lfQ09NTUFORF9NRU1PUlkpOw0KPiAgICAgQlVJTERfQlVHX09O
KCh0eXBlb2YoKnBjaV9kZXZmbl9kZWNvZGVfdHlwZSkpUENJX0NPTU1BTkRfSU8gIT0NCj4gICAg
ICAgICAgICAgICAgICBQQ0lfQ09NTUFORF9JTyk7DQo+IA0KPiA+IEBAIC0yMDgsNiArMjE0LDIw
IEBAIHZvaWQgcGNpX3NldHVwKHZvaWQpDQo+ID4gICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAg
ICAgICAgIH0NCj4gPiANCj4gPiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIERpc2FibGUg
bWVtb3J5IGFuZCBJL08gZGVjb2RlLA0KPiA+ICsgICAgICAgICAqIEl0IGlzIHJlY29tbWVuZGVk
IHRoYXQgQkFSIHByb2dyYW1taW5nIGJlIGRvbmUgd2hpbHN0DQo+ID4gKyAgICAgICAgICogZGVj
b2RlIGJpdHMgYXJlIGNsZWFyZWQgdG8gYXZvaWQgaW5jb3JyZWN0IG1hcHBpbmdzDQo+ID4gYmVp
bmcgY3JlYXRlZCwNCj4gPiArICAgICAgICAgKiB3aGVuIDY0LWJpdCBtZW1vcnkgQkFSIGlzIHBy
b2dyYW1tZWQgZmlyc3QgYnkgd3JpdGluZw0KPiA+IHRoZSBsb3dlciBoYWxmDQo+ID4gKyAgICAg
ICAgICogYW5kIHRoZW4gdGhlIHVwcGVyIGhhbGYsIHdoaWNoIGZpcnN0IG1hcHMgdG8gYW4gYWRk
cmVzcw0KPiA+IHVuZGVyIDRHDQo+ID4gKyAgICAgICAgICogcmVwbGFjaW5nIGFueSBSQU0gbWFw
cGVkIGluIHRoYXQgYWRkcmVzcywgd2hpY2ggaXMgbm90DQo+ID4gcmVzdG9yZWQNCj4gPiArICAg
ICAgICAgKiBiYWNrIGFmdGVyIHRoZSB1cHBlciBoYWxmIGlzIHdyaXR0ZW4gYW5kIFBDSSBtZW1v
cnkgaXMNCj4gPiBjb3JyZWN0bHkNCj4gPiArICAgICAgICAgKiBtYXBwZWQgdG8gaXRzIGludGVu
ZGVkIGhpZ2ggbWVtIGFkZHJlc3MuDQo+ID4gKyAgICAgICAgICovDQo+IA0KPiBQbGVhc2UgY2Fu
IHlvdSBicmluZyB0aGlzIGNvbW1lbnQgaW50byBzaGFwZT8gVGhlIGNvbW1hIG9uIHRoZSBmaXJz
dA0KPiBsaW5lIGRvZXNuJ3QgZml0IHdpdGggdGhlIGNhcGl0YWwgbGV0dGVyIHRoZSBzZWNvbmQg
bGluZSBzdGFydHMgd2l0aC4NCj4gUGx1cywgaWYgeW91IHJlYWxseSBtZWFuIHdoYXQgaXMgbm93
IG9uIHRoZSBzZWNvbmQgbGluZSB0byBzdGFydCBvbiBhDQo+IG5ldyBvbmUsIHRoZW4gcGxlYXNl
IGFsc28gaW5zZXJ0IGEgbGluZSBjb25zaXN0aW5nIG9mIGp1c3QgKiBhdCB0aGUNCj4gcHJvcGVy
bHkgaW5kZW50ZWQgcG9zaXRpb24gYmV0d2VlbiB0aGUgdHdvLiBBZGRpdGlvbmFsbHkgdGhlcmUn
cyBhdA0KPiBsZWFzdCBvbmUgbGluZSBleGNlZWRpbmcgdGhlIDgwLWNoYXJzLXBlci1saW5lIGxp
bWl0Lg0KPiANCj4gPiBAQCAtMjg5LDEwICszMDksNiBAQCB2b2lkIHBjaV9zZXR1cCh2b2lkKQ0K
PiA+ICAgICAgICAgICAgICAgICAgICAgZGV2Zm4+PjMsIGRldmZuJjcsICdBJytwaW4tMSwgaXNh
X2lycSk7DQo+ID4gICAgICAgICAgfQ0KPiA+IA0KPiA+IC0gICAgICAgIC8qIEVuYWJsZSBidXMg
bWFzdGVyaW5nLiAqLw0KPiA+IC0gICAgICAgIGNtZCA9IHBjaV9yZWFkdyhkZXZmbiwgUENJX0NP
TU1BTkQpOw0KPiA+IC0gICAgICAgIGNtZCB8PSBQQ0lfQ09NTUFORF9NQVNURVI7DQo+ID4gLSAg
ICAgICAgcGNpX3dyaXRldyhkZXZmbiwgUENJX0NPTU1BTkQsIGNtZCk7DQo+IA0KPiBUaGUgbW92
ZW1lbnQgb2YgdGhpcyB3YW50cyBtZW50aW9uaW5nIGluIHRoZSBkZXNjcmlwdGlvbi4NCj4gDQo+
ID4gQEAgLTUyNiwxMCArNTM4LDE3IEBAIHZvaWQgcGNpX3NldHVwKHZvaWQpDQo+ID4gICAgICAg
ICAgICogaGFzIElPIGVuYWJsZWQsIGV2ZW4gaWYgdGhlcmUgaXMgbm8gSS9PIEJBUiBvbiB0aGF0
DQo+ID4gICAgICAgICAgICogcGFydGljdWxhciBkZXZpY2UuDQo+ID4gICAgICAgICAgICovDQo+
ID4gLSAgICAgICAgY21kID0gcGNpX3JlYWR3KHZnYV9kZXZmbiwgUENJX0NPTU1BTkQpOw0KPiA+
IC0gICAgICAgIGNtZCB8PSBQQ0lfQ09NTUFORF9JTzsNCj4gPiAtICAgICAgICBwY2lfd3JpdGV3
KHZnYV9kZXZmbiwgUENJX0NPTU1BTkQsIGNtZCk7DQo+ID4gKyAgICAgICAgcGNpX2RldmZuX2Rl
Y29kZV90eXBlW3ZnYV9kZXZmbl0gfD0gUENJX0NPTU1BTkRfSU87DQo+ID4gICAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgLyogRW5hYmxlIGJ1cyBtYXN0ZXIsIG1lbW9yeSBhbmQgSS9PIGRlY29kZS4g
Ki8NCj4gPiArICAgIGZvciAoIGRldmZuID0gMDsgZGV2Zm4gPCAyNTY7IGRldmZuKysgKQ0KPiA+
ICsgICAgICAgIGlmICggcGNpX2RldmZuX2RlY29kZV90eXBlW2RldmZuXSApDQo+ID4gKyAgICAg
ICAgew0KPiA+ICsgICAgICAgICAgICBjbWQgPSBwY2lfcmVhZHcoZGV2Zm4sIFBDSV9DT01NQU5E
KTsNCj4gPiArICAgICAgICAgICAgY21kIHw9IChQQ0lfQ09NTUFORF9NQVNURVIgfA0KPiA+IHBj
aV9kZXZmbl9kZWNvZGVfdHlwZVtkZXZmbl0pOw0KPiA+ICsgICAgICAgICAgICBwY2lfd3JpdGV3
KGRldmZuLCBQQ0lfQ09NTUFORCwgY21kKTsNCj4gPiArICAgICAgICB9DQo+IA0KPiBUaGlzIHN0
aWxsIHJlZ3Jlc3NlcyB0aGUgc2V0dGluZyBvZiBNQVNURVIgYWZhaWN0OiBZb3Ugb25seSBzZXQN
Cj4gdGhhdCBiaXQgbm93IGlmIGVpdGhlciBJTyBvciBNRU1PUlkgd291bGQgYWxzbyBnZXQgc2V0
LiBCdXQgYmUNCj4gc3VyZSB0byBob25vciB0aGUgb3JpZ2luYWwgY29kZSBub3QgZG9pbmcgdGhl
IHdyaXRlIHdoZW4gdmVuZG9yLw0KPiBkZXZpY2UgSURzIGFyZSBhbGwgb25lcy4NCj4gDQpJZiBj
b25kaXRpb24gZW5zdXJlcyB0aGF0IGZvciBkZXZpY2VzIHdpdGggdmVuZG9yL2RldmljZSBJRHMg
YWxsIG9uZXMNCmFyZSBza2lwcGVkIGFzIGl0IHdvdWxkIGV2YWx1YXRlIHRvIGZhbHNlLiBCdXQg
dGhpcyB3b3VsZCBhbHNvIHNraXANCmVuYWJsaW5nIEJ1cyBtYXN0ZXIgZm9yIGRldmljZXMgd2hv
c2UgdmVuZG9yL2RldmljZSBJRHMgYXJlIG5vdCBhbGwNCm9uZXMgYnV0IElPIG9yIG1lbW9yeSBC
QVJzIGFyZSBub3QgcHJvZ3JhbW1lZCBmb3IgdGhlbS4gSXMgdGhlcmUgYQ0KcG9zc2liaWxpdHkg
b2YgdGhpcyBoYXBwZW5pbmc/DQo+IEphbg0K

