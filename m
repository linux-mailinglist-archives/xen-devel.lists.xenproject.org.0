Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693F1A76C9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 11:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOHQl-0006BB-OQ; Tue, 14 Apr 2020 09:00:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kDu3=56=amazon.com=prvs=3660aa63e=havanur@srs-us1.protection.inumbo.net>)
 id 1jOHQj-0006B6-RN
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 09:00:29 +0000
X-Inumbo-ID: 6387078e-7e2e-11ea-b58d-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6387078e-7e2e-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 09:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586854830; x=1618390830;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=juGS2dA845dYKqsQtbYyJr/Y8af+TDtRnPgCBZcuLYg=;
 b=pSi3yE7aBk7Hpv+NJjHeuLwNqnVglNZOZvDNqR6hrj6uU1vXUkfEltiw
 76IrGX0f2ZT0B45PyXnVB0pYJHVoZ7R8rIo7qQrC/CJMX4zpEXtMiDluY
 Xc3hRVZQCyqk+YWUZHPK9RPbl9qA102LeDWQQVz/pRy8yR7CYgttyZ050 0=;
IronPort-SDR: NZ69YP2JD23iLnUNaAYgAozhCj9TAa5RUTjlybAQh/YYH3+//7pez0QUg+qMnNYjf8NCRrjmYI
 DXx8PovwuZJQ==
X-IronPort-AV: E=Sophos;i="5.72,382,1580774400"; d="scan'208";a="25370979"
Subject: Re: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Thread-Topic: [XEN PATCH v2] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 14 Apr 2020 09:00:18 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6FA2AA259E; Tue, 14 Apr 2020 09:00:15 +0000 (UTC)
Received: from EX13D36EUC002.ant.amazon.com (10.43.164.99) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 09:00:15 +0000
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC002.ant.amazon.com (10.43.164.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 09:00:13 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Tue, 14 Apr 2020 09:00:13 +0000
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Index: AQHWEdtGZKnSIpkNZ0SB6/WfFUNDKah4PMkAgAAVt4A=
Date: Tue, 14 Apr 2020 09:00:13 +0000
Message-ID: <612892f2fed5cb02cbec289589e437d9badb8cc1.camel@amazon.com>
References: <bca361efe8061c470a4a27470dd247ee8d53af59.1586813622.git.havanur@amazon.com>
 <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
In-Reply-To: <c7882dcb-9708-414c-98fb-0a0283db0f34@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.191]
Content-Type: text/plain; charset="utf-8"
Content-ID: <73F473A1284C4846B6C6222E27467FA0@amazon.com>
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

T24gVHVlLCAyMDIwLTA0LTE0IGF0IDA5OjQyICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbw0KPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMTMuMDQuMjAyMCAyMzozMywgSGFyc2hhIFNoYW1zdW5kYXJh
IEhhdmFudXIgd3JvdGU6DQo+ID4gSXQgd2FzIG9ic2VydmVkIHRoYXQgUENJIE1NSU8gYW5kL29y
IElPIEJBUnMgd2VyZSBwcm9ncmFtbWVkIHdpdGgNCj4gPiBCVVMgbWFzdGVyLCBtZW1vcnkgYW5k
IEkvTyBkZWNvZGVzIChiaXRzIDAsMSBhbmQgMiBvZiBQQ0kgQ09NTUFORA0KPiA+IHJlZ2lzdGVy
KSBlbmFibGVkLCBkdXJpbmcgUENJIHNldHVwIHBoYXNlLiBUaGlzIHJlc3VsdGVkIGluDQo+ID4g
aW5jb3JyZWN0IG1lbW9yeSBtYXBwaW5nIGFzIHNvb24gYXMgdGhlIGxvd2VyIGhhbGYgb2YgdGhl
IDY0IGJpdA0KPiA+IGJhcg0KPiA+IGlzIHByb2dyYW1tZWQsIHdoaWNoIGRpc3BsYWNlZCBhbnkg
UkFNIG1hcHBpbmdzIHVuZGVyIDRHLiBBZnRlciB0aGUNCj4gPiB1cHBlciBoYWxmIGlzIHByb2dy
YW1tZWQgUENJIG1lbW9yeSBtYXBwaW5nIGlzIHJlc3RvcmVkIHRvIGl0cw0KPiA+IGludGVuZGVk
IG1hcHBpbmcgYnV0IHRoZSBSQU0gZGlzcGxhY2VkIGlzIG5vdCByZXN0b3JlZC4gVGhlIE9TIHRo
ZW4NCj4gPiBjb250aW51ZXMgdG8gYm9vdCBhbmQgZnVuY3Rpb24gdW50aWwgaXQgdHJpZXMgdG8g
YWNjZXNzIHRoZQ0KPiA+IGRpc3BsYWNlZA0KPiA+IFJBTSBhdCB3aGljaCBwb2ludCBpdCBzdWZm
ZXJzIGEgcGFnZSBmYXVsdCBhbmQgY3Jhc2hlcy4NCj4gPiANCj4gPiBUaGlzIHBhdGNoIGFkZHJl
c3MgdGhlIGlzc3VlIGJ5IGRlZmVycmluZyBlbmFibGVtZW50IG9mIG1lbW9yeSBhbmQNCj4gPiBJ
L08gZGVjb2RlIGluIGNvbW1hbmQgcmVnaXN0ZXIgdW50aWwgYWxsIHRoZSByZXNvdXJjZXMsIGxp
a2UNCj4gPiBpbnRlcnJ1cHRzDQo+ID4gSS9PIGFuZC9vciBNTUlPIEJBUnMgZm9yIGFsbCB0aGUg
UENJIGRldmljZSBmdW5jdGlvbnMgYXJlDQo+ID4gcHJvZ3JhbW1lZC4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBIYXJzaGEgU2hhbXN1bmRhcmEgSGF2YW51ciA8aGF2YW51ckBhbWF6b24uY29t
Pg0KPiA+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+
ID4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+
ID4gLS0tDQo+ID4gIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9wY2kuYyB8IDM1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLQ0KPiA+IC0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gVGhlcmUgbm90IGJlaW5nIGFu
eSBkZXNjcmlwdGlvbiBvZiB3aGF0IGhhcyBjaGFuZ2VkIGluIHYyLCBJIGFsc28NCj4gY2FuJ3Qg
ZWFzaWx5IGp1ZGdlIHdoZXRoZXIga2VlcGluZyB0aGUgdHdvIHRhZ3MgYWJvdmUgd2FzDQo+IGxl
Z2l0aW1hdGUuIEluIGFueSBldmVudCB5b3UgZG9uJ3Qgc2VlbSB0byBoYXZlIHRha2VuIGNhcmUg
b2YgYWxsDQo+IHJldmlldyBmZWVkYmFjayAod2hldGhlciBieSBtYWtpbmcgY2hhbmdlcyB0byB0
aGUgcGF0Y2ggb3IgYnkNCj4gcmVwbHlpbmcgdmVyYmFsbHkpLg0KPiANCj4gPiAtLS0gYS90b29s
cy9maXJtd2FyZS9odm1sb2FkZXIvcGNpLmMNCj4gPiArKysgYi90b29scy9maXJtd2FyZS9odm1s
b2FkZXIvcGNpLmMNCj4gPiBAQCAtODQsNiArODQsNyBAQCB2b2lkIHBjaV9zZXR1cCh2b2lkKQ0K
PiA+ICAgICAgdWludDMyX3QgdmdhX2RldmZuID0gMjU2Ow0KPiA+ICAgICAgdWludDE2X3QgY2xh
c3MsIHZlbmRvcl9pZCwgZGV2aWNlX2lkOw0KPiA+ICAgICAgdW5zaWduZWQgaW50IGJhciwgcGlu
LCBsaW5rLCBpc2FfaXJxOw0KPiA+ICsgICAgdWludDhfdCBwY2lfZGV2Zm5fZGVjb2RlX3R5cGVb
MjU2XSA9IHt9Ow0KPiA+IA0KPiA+ICAgICAgLyogUmVzb3VyY2VzIGFzc2lnbmFibGUgdG8gUENJ
IGRldmljZXMgdmlhIEJBUnMuICovDQo+ID4gICAgICBzdHJ1Y3QgcmVzb3VyY2Ugew0KPiA+IEBA
IC0xMjAsNiArMTIxLDkgQEAgdm9pZCBwY2lfc2V0dXAodm9pZCkNCj4gPiAgICAgICAqLw0KPiA+
ICAgICAgYm9vbCBhbGxvd19tZW1vcnlfcmVsb2NhdGUgPSAxOw0KPiA+IA0KPiA+ICsgICAgQlVJ
TERfQlVHX09OKCh0eXBlb2YoKnBjaV9kZXZmbl9kZWNvZGVfdHlwZSkpUENJX0NPTU1BTkRfTUVN
T1INCj4gPiBZICE9IFBDSV9DT01NQU5EX01FTU9SWSk7DQo+ID4gKyAgICBCVUlMRF9CVUdfT04o
KHR5cGVvZigqcGNpX2RldmZuX2RlY29kZV90eXBlKSlQQ0lfQ09NTUFORF9JTyAhPQ0KPiA+IFBD
SV9DT01NQU5EX0lPKTsNCj4gPiArICAgIEJVSUxEX0JVR19PTigodHlwZW9mKCpwY2lfZGV2Zm5f
ZGVjb2RlX3R5cGUpKVBDSV9DT01NQU5EX0lPICE9DQo+ID4gUENJX0NPTU1BTkRfTUFTVEVSKTsN
Cj4gDQpUaGlzIGlzIGEgbWlzdGFrZSwgSW4gZmFjdCBpdCBzaG91bGQgYmUgY29tcGFyZWQgYWdh
aW5zdCB1bml0OCBhcyBJIGFtDQpzdG9yaW5nIHdob2xlIGNvbW1hbmQgdmFsdWUgbGF0ZXIgaW4g
dGhlIGxvb3AuDQoNCj4gVGhpcyBsb29rcyBsaWtlIGEgY29weS1hbmQtcGFzdGUgbWlzdGFrZSAt
IGFyZSB5b3Ugc3VyZSB5b3UndmUNCj4gYnVpbGQtdGVzdGVkIHRoaXM/IChUaGlzIGFsb25lIGxp
a2VseSBpbnZhbGlkYXRlcyB0aGUgdGFncywgYXMNCj4gcGVyIGFib3ZlLikNCj4gDQo+ID4gQEAg
LTI4OSw5ICsyOTMsMjIgQEAgdm9pZCBwY2lfc2V0dXAodm9pZCkNCj4gPiAgICAgICAgICAgICAg
ICAgICAgIGRldmZuPj4zLCBkZXZmbiY3LCAnQScrcGluLTEsIGlzYV9pcnEpOw0KPiA+ICAgICAg
ICAgIH0NCj4gPiANCj4gPiAtICAgICAgICAvKiBFbmFibGUgYnVzIG1hc3RlcmluZy4gKi8NCj4g
PiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIERpc2FibGUgYnVzIG1hc3RlcmluZywgbWVt
b3J5IGFuZCBJL08gc3BhY2UsIHdoaWNoIGlzDQo+ID4gdHlwaWNhbCBkZXZpY2UNCj4gPiArICAg
ICAgICAgKiByZXNldCBzdGF0ZS4gSXQgaXMgcmVjb21tZW5kZWQgdGhhdCBCQVIgcHJvZ3JhbW1p
bmcgYmUNCj4gPiBkb25lIHdoaWxzdA0KPiA+ICsgICAgICAgICAqIGRlY29kZSBiaXRzIGFyZSBj
bGVhcmVkIHRvIGF2b2lkIGluY29ycmVjdCBtYXBwaW5ncw0KPiA+IGJlaW5nIGNyZWF0ZWQsDQo+
ID4gKyAgICAgICAgICogd2hlbiA2NC1iaXQgbWVtb3J5IEJBUiBpcyBwcm9ncmFtbWVkIGZpcnN0
IGJ5IHdyaXRpbmcNCj4gPiB0aGUgbG93ZXIgaGFsZg0KPiA+ICsgICAgICAgICAqIGFuZCB0aGVu
IHRoZSB1cHBlciBoYWxmLCB3aGljaCBmaXJzdCBtYXBzIHRvIGFuIGFkZHJlc3MNCj4gPiB1bmRl
ciA0Rw0KPiA+ICsgICAgICAgICAqIHJlcGxhY2luZyBhbnkgUkFNIG1hcHBlZCBpbiB0aGF0IGFk
ZHJlc3MsIHdoaWNoIGlzIG5vdA0KPiA+IHJlc3RvcmVkDQo+ID4gKyAgICAgICAgICogYmFjayBh
ZnRlciB0aGUgdXBwZXIgaGFsZiBpcyB3cml0dGVuIGFuZCBQQ0kgbWVtb3J5IGlzDQo+ID4gY29y
cmVjdGx5DQo+ID4gKyAgICAgICAgICogbWFwcGVkIHRvIGl0cyBpbnRlbmRlZCBoaWdoIG1lbSBh
ZGRyZXNzLg0KPiA+ICsgICAgICAgICAqDQo+ID4gKyAgICAgICAgICogQ2FwdHVyZSB0aGUgc3Rh
dGUgb2YgYnVzIG1hc3RlciB0byByZXN0b3JlIGl0IGJhY2sgb25jZQ0KPiA+IEJBUg0KPiA+ICsg
ICAgICAgICAqIHByb2dyYW1taW5nIGlzIGNvbXBsZXRlZC4NCj4gPiArICAgICAgICAgKi8NCj4g
PiAgICAgICAgICBjbWQgPSBwY2lfcmVhZHcoZGV2Zm4sIFBDSV9DT01NQU5EKTsNCj4gPiAtICAg
ICAgICBjbWQgfD0gUENJX0NPTU1BTkRfTUFTVEVSOw0KPiA+ICsgICAgICAgIHBjaV9kZXZmbl9k
ZWNvZGVfdHlwZVtkZXZmbl0gPSBjbWQgJiB+KFBDSV9DT01NQU5EX01FTU9SWQ0KPiA+IHwgUENJ
X0NPTU1BTkRfSU8pOw0KPiA+ICsgICAgICAgIGNtZCAmPSB+KFBDSV9DT01NQU5EX01BU1RFUiB8
IFBDSV9DT01NQU5EX01FTU9SWSB8DQo+ID4gUENJX0NPTU1BTkRfSU8pOw0KPiANCj4gVGhlIGRp
c2FibGluZyBvZiBNQVNURVIgd2FzIHB1dCB1bmRlciBxdWVzdGlvbiBpbiB2MSBhbHJlYWR5Lg0K
DQpEaXNhYmxpbmcgb2YgTUFTVEVSIGlzIGRvbmUgd2hpbHN0IHByb2dyYW1taW5nIEJBUnMgYW5k
IGl0IGlzIHJlc3RvcmVkDQpiYWNrIHRvIGl0cyBwcmV2aW91cyB2YWx1ZSBpbiB0aGUgbG9vcCBh
dCB0aGUgZW5kIG9mIHBjaV9zZXR1cA0KZnVuY3Rpb24uDQoNCj4gDQo+ID4gQEAgLTUyNiwxMCAr
NTQyLDEzIEBAIHZvaWQgcGNpX3NldHVwKHZvaWQpDQo+ID4gICAgICAgICAgICogaGFzIElPIGVu
YWJsZWQsIGV2ZW4gaWYgdGhlcmUgaXMgbm8gSS9PIEJBUiBvbiB0aGF0DQo+ID4gICAgICAgICAg
ICogcGFydGljdWxhciBkZXZpY2UuDQo+ID4gICAgICAgICAgICovDQo+ID4gLSAgICAgICAgY21k
ID0gcGNpX3JlYWR3KHZnYV9kZXZmbiwgUENJX0NPTU1BTkQpOw0KPiA+IC0gICAgICAgIGNtZCB8
PSBQQ0lfQ09NTUFORF9JTzsNCj4gPiAtICAgICAgICBwY2lfd3JpdGV3KHZnYV9kZXZmbiwgUENJ
X0NPTU1BTkQsIGNtZCk7DQo+ID4gKyAgICAgICAgcGNpX2RldmZuX2RlY29kZV90eXBlW3ZnYV9k
ZXZmbl0gfD0gUENJX0NPTU1BTkRfSU87DQo+ID4gICAgICB9DQo+ID4gKw0KPiA+ICsgICAgLyog
RW5hYmxlIG1lbW9yeSBhbmQgSS9PIHNwYWNlLiBSZXN0b3JlIHNhdmVkIEJVUyBNQVNURVIgc3Rh
dGUNCj4gPiAqLw0KPiA+ICsgICAgZm9yICggZGV2Zm4gPSAwOyBkZXZmbiA8IDI1NjsgZGV2Zm4r
KyApDQo+ID4gKyAgICAgICAgaWYgKCBwY2lfZGV2Zm5fZGVjb2RlX3R5cGVbZGV2Zm5dICkNCj4g
PiArICAgICAgICAgICAgcGNpX3dyaXRldyhkZXZmbiwgUENJX0NPTU1BTkQsDQo+ID4gcGNpX2Rl
dmZuX2RlY29kZV90eXBlW2RldmZuXSk7DQo+IA0KPiBZb3UgZWZmZWN0aXZlbHkgY2xlYXIgdGhl
IHVwcGVyIDggYml0cyBoZXJlLCByYXRoZXIgdGhhbiByZXRhaW5pbmcNCj4gdGhlbS4NCj4gDQpJ
biBmYWN0IGNtZCBpcyBhIDMyIGJpdCB2YWx1ZSBhbmQgSSBhbSByZXRhaW5pbmcgb25seSBsb3dl
ciA4IGJpdHMgb2YNCml0LiBUaGlzIHdpbGwgYmUgY29ycmVjdGVkIGluIHYzLg0KPiBKYW4NCg==

