Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F61A8192
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 17:11:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jONDy-0002uP-KH; Tue, 14 Apr 2020 15:11:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kDu3=56=amazon.com=prvs=3660aa63e=havanur@srs-us1.protection.inumbo.net>)
 id 1jONDx-0002uH-Gh
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 15:11:41 +0000
X-Inumbo-ID: 3dd9a1b6-7e62-11ea-8955-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dd9a1b6-7e62-11ea-8955-12813bfff9fa;
 Tue, 14 Apr 2020 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1586877100; x=1618413100;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=O4KQn8GhwCIq7cc2LAUDQtlEwMHMN/dpe0tMSTYfI3Y=;
 b=Musk3doSShyQQedTNP0LhB9KeQjaLRqNA1hxDLoPS+pqA1331WizZO04
 4tzaYXvNB9u2rQPeIEtCJl0wJcM2WdO7wF52G64uU+Azrcc9nDnzPH3eL
 fAbyGUU7IYzf/czqPhgwmXMA4pARwgDGDTM6imohdNVtX1B4YgQ5N/4E7 s=;
IronPort-SDR: y214ylhVr/OHMyomMlCQWgieIl7UOvnZAe4jJJg9OvgsXeTbYkOrwOUPwamqT1kfagr0PAkhzS
 xirzLit44j7g==
X-IronPort-AV: E=Sophos;i="5.72,382,1580774400"; d="scan'208";a="38395537"
Subject: Re: [XEN PATCH v3] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Thread-Topic: [XEN PATCH v3] hvmloader: Enable MMIO and I/O decode,
 after all resource allocation
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Apr 2020 15:11:37 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id D95A8A1EC7; Tue, 14 Apr 2020 15:11:35 +0000 (UTC)
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 15:11:35 +0000
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC004.ant.amazon.com (10.43.164.126) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 14 Apr 2020 15:11:34 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Tue, 14 Apr 2020 15:11:34 +0000
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Index: AQHWEk2MZgsqhznwdkqhrf4NhmkbBKh4qLgAgAAQpIA=
Date: Tue, 14 Apr 2020 15:11:34 +0000
Message-ID: <34a2bded0f4f15b2885ed8c22bf9e20fb82d5932.camel@amazon.com>
References: <758e3427f147ed82774edcbbe80b0b29c812e6e4.1586862721.git.havanur@amazon.com>
 <3926fb02-2058-6e3a-6dcd-3ac5c4b97de5@suse.com>
In-Reply-To: <3926fb02-2058-6e3a-6dcd-3ac5c4b97de5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.198]
Content-Type: text/plain; charset="utf-8"
Content-ID: <15FB1521A9E3E140A8230011B6907DA0@amazon.com>
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

T24gVHVlLCAyMDIwLTA0LTE0IGF0IDE2OjEyICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbw0KPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMTQuMDQuMjAyMCAxMzoxMiwgSGFyc2hhIFNoYW1zdW5kYXJh
IEhhdmFudXIgd3JvdGU6DQo+ID4gSXQgd2FzIG9ic2VydmVkIHRoYXQgUENJIE1NSU8gYW5kL29y
IElPIEJBUnMgd2VyZSBwcm9ncmFtbWVkIHdpdGgNCj4gPiBtZW1vcnkgYW5kIEkvTyBkZWNvZGVz
IChiaXRzIDAgYW5kIDEgb2YgUENJIENPTU1BTkQgcmVnaXN0ZXIpDQo+ID4gZW5hYmxlZCwNCj4g
PiBkdXJpbmcgUENJIHNldHVwIHBoYXNlLiBUaGlzIHJlc3VsdGVkIGluIGluY29ycmVjdCBtZW1v
cnkgbWFwcGluZw0KPiA+IGFzDQo+ID4gc29vbiBhcyB0aGUgbG93ZXIgaGFsZiBvZiB0aGUgNjQg
Yml0IGJhciBpcyBwcm9ncmFtbWVkLg0KPiA+IFRoaXMgZGlzcGxhY2VkIGFueSBSQU0gbWFwcGlu
Z3MgdW5kZXIgNEcuIEFmdGVyIHRoZQ0KPiA+IHVwcGVyIGhhbGYgaXMgcHJvZ3JhbW1lZCBQQ0kg
bWVtb3J5IG1hcHBpbmcgaXMgcmVzdG9yZWQgdG8gaXRzDQo+ID4gaW50ZW5kZWQgaGlnaCBtZW0g
bG9jYXRpb24sIGJ1dCB0aGUgUkFNIGRpc3BsYWNlZCBpcyBub3QgcmVzdG9yZWQuDQo+ID4gVGhl
IE9TIHRoZW4gY29udGludWVzIHRvIGJvb3QgYW5kIGZ1bmN0aW9uIHVudGlsIGl0IHRyaWVzIHRv
IGFjY2Vzcw0KPiA+IHRoZSBkaXNwbGFjZWQgUkFNIGF0IHdoaWNoIHBvaW50IGl0IHN1ZmZlcnMg
YSBwYWdlIGZhdWx0IGFuZA0KPiA+IGNyYXNoZXMuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBhZGRy
ZXNzIHRoZSBpc3N1ZSBieSBkZWZlcnJpbmcgZW5hYmxlbWVudCBvZiBtZW1vcnkgYW5kDQo+ID4g
SS9PIGRlY29kZSBpbiBjb21tYW5kIHJlZ2lzdGVyIHVudGlsIGFsbCB0aGUgcmVzb3VyY2VzLCBs
aWtlDQo+ID4gaW50ZXJydXB0cw0KPiA+IEkvTyBhbmQvb3IgTU1JTyBCQVJzIGZvciBhbGwgdGhl
IFBDSSBkZXZpY2UgZnVuY3Rpb25zIGFyZQ0KPiA+IHByb2dyYW1tZWQsDQo+ID4gaW4gdGhlIGRl
c2NlbmRpbmcgb3JkZXIgb2YgbWVtb3J5IHJlcXVlc3RlZC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBIYXJzaGEgU2hhbXN1bmRhcmEgSGF2YW51ciA8aGF2YW51ckBhbWF6b24uY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4gQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IA0KPiBZ
b3UndmUgZml4ZWQgYnVncywgaW1wbHlpbmcgeW91IG5lZWQgdG8gZHJvcCB0YWdzIGNvdmVyaW5n
IHRoZSBjb2RlDQo+IHdoaWNoIHdhcyBmaXhlZC4gQXMgc2FpZCBvbiB2MiwgaW1vIHlvdSBzaG91
bGQgaGF2ZSBkcm9wcGVkIHRoZSB0YWdzDQo+IHRoZW4gYWxyZWFkeS4NCj4gDQo+ID4gLS0tIGEv
dG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL3BjaS5jDQo+ID4gKysrIGIvdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL3BjaS5jDQo+ID4gQEAgLTg0LDYgKzg0LDcgQEAgdm9pZCBwY2lfc2V0dXAodm9p
ZCkNCj4gPiAgICAgIHVpbnQzMl90IHZnYV9kZXZmbiA9IDI1NjsNCj4gPiAgICAgIHVpbnQxNl90
IGNsYXNzLCB2ZW5kb3JfaWQsIGRldmljZV9pZDsNCj4gPiAgICAgIHVuc2lnbmVkIGludCBiYXIs
IHBpbiwgbGluaywgaXNhX2lycTsNCj4gPiArICAgIHVpbnQ4X3QgcGNpX2RldmZuX2RlY29kZV90
eXBlWzI1Nl0gPSB7fTsNCj4gDQo+IEknbSBzdGlsbCB3YWl0aW5nIGZvciBhIHJlcGx5IG9uIG15
IHYxIGNvbW1lbnQgb24gdGhlIHN0YWNrDQo+IGNvbnN1bXB0aW9uIG9mIHRoaXMsIHN1Z2dlc3Rp
bmcgdHdvIDI1Ni1iaXQgYml0bWFwcyBpbnN0ZWFkLg0KPiANCg0KSSBjaG9zZSB1aW50OCBhcnJh
eSBvdmVyIGJpdG1hcHMgYXMgdGhpcyByZWR1Y2VzIGNvbXBsZXhpdHkgb2YgY29kZQ0KdG8gZ2V0
IGFuZCBzZXQgaW5kaXZpZHVhbCBiaXRzLiBTb3JyeSBmb3IgbWlzc2luZyB0aGlzIG91dCBpbiB0
aGUgdjENCmNvbnZlcnNhdGlvbi4NCg0KPiA+IEBAIC0xMjAsNiArMTIxLDkgQEAgdm9pZCBwY2lf
c2V0dXAodm9pZCkNCj4gPiAgICAgICAqLw0KPiA+ICAgICAgYm9vbCBhbGxvd19tZW1vcnlfcmVs
b2NhdGUgPSAxOw0KPiA+IA0KPiA+ICsgICAgQlVJTERfQlVHX09OKCh0eXBlb2YoKnBjaV9kZXZm
bl9kZWNvZGVfdHlwZSkpUENJX0NPTU1BTkRfTUVNT1INCj4gPiBZICE9IFBDSV9DT01NQU5EX01F
TU9SWSk7DQo+ID4gKyAgICBCVUlMRF9CVUdfT04oKHR5cGVvZigqcGNpX2RldmZuX2RlY29kZV90
eXBlKSlQQ0lfQ09NTUFORF9JTyAhPQ0KPiA+IFBDSV9DT01NQU5EX0lPKTsNCj4gDQo+IFRoZXNl
IGxpbmVzIGFyZSB0b28gbG9uZy4NCj4gDQo+ID4gQEAgLTI4OCwxMCArMjkyLDIxIEBAIHZvaWQg
cGNpX3NldHVwKHZvaWQpDQo+ID4gICAgICAgICAgICAgIHByaW50ZigicGNpIGRldiAlMDJ4OiV4
IElOVCVjLT5JUlEldVxuIiwNCj4gPiAgICAgICAgICAgICAgICAgICAgIGRldmZuPj4zLCBkZXZm
biY3LCAnQScrcGluLTEsIGlzYV9pcnEpOw0KPiA+ICAgICAgICAgIH0NCj4gPiAtDQo+ID4gICAg
ICAgICAgLyogRW5hYmxlIGJ1cyBtYXN0ZXJpbmcuICovDQo+IA0KPiBQbGVhc2UgZG9uJ3QgZHJv
cCBhIGJsYW5rIGxpbmUgbGlrZSB0aGlzLg0KPiANCj4gPiAgICAgICAgICBjbWQgPSBwY2lfcmVh
ZHcoZGV2Zm4sIFBDSV9DT01NQU5EKTsNCj4gPiAgICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRf
TUFTVEVSOw0KPiA+ICsNCj4gPiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIERpc2FibGUg
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
ZGVkIGhpZ2ggbWVtIGFkZHJlc3MuDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAgICAgY21k
ICY9IH4oUENJX0NPTU1BTkRfTUVNT1JZIHwgUENJX0NPTU1BTkRfSU8pOw0KPiA+ICAgICAgICAg
IHBjaV93cml0ZXcoZGV2Zm4sIFBDSV9DT01NQU5ELCBjbWQpOw0KPiA+ICAgICAgfQ0KPiANCj4g
SSdkIGxpa2UgdG8gbm90ZSB0aGF0IHRoZSBkaXNhYmxpbmcgb2YgSU8gYW5kIE1FTU9SWSB5b3Ug
ZG8gaGVyZQ0KPiBjb21lcyB0b28NCj4gbGF0ZTogSXQgc2hvdWxkIGhhcHBlbiBiZWZvcmUgYW55
IG9mIHRoZSBCQVJzIGdldHMgd3JpdHRlbiB3aXRoIH4wLg0KPiBJbg0KPiBwYXJ0aWN1bGFyIGZv
ciA2NC1iaXQgQkFScyB0aGVzZSB3cml0ZXMgY2FuIGFnYWluIGNhdXNlIHVuZHVlIGVmZmVjdHMN
Cj4gb24NCj4gdGhlIGludGVybWVkaWF0ZWx5IHJlc3VsdGluZyBlZmZlY3RpdmUgYWRkcmVzc2Vz
Lg0KPiANCkkgYWdyZWUsIHRoaXMgbmVlZHMgdG8gYmUgZG9uZSBiZWZvcmUgd3JpdGluZyBCQVJT
IHdpdGggfjANCg0KPiA+IEBAIC01MjYsMTAgKzUzNywxNiBAQCB2b2lkIHBjaV9zZXR1cCh2b2lk
KQ0KPiA+ICAgICAgICAgICAqIGhhcyBJTyBlbmFibGVkLCBldmVuIGlmIHRoZXJlIGlzIG5vIEkv
TyBCQVIgb24gdGhhdA0KPiA+ICAgICAgICAgICAqIHBhcnRpY3VsYXIgZGV2aWNlLg0KPiA+ICAg
ICAgICAgICAqLw0KPiA+IC0gICAgICAgIGNtZCA9IHBjaV9yZWFkdyh2Z2FfZGV2Zm4sIFBDSV9D
T01NQU5EKTsNCj4gPiAtICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU87DQo+ID4gLSAgICAg
ICAgcGNpX3dyaXRldyh2Z2FfZGV2Zm4sIFBDSV9DT01NQU5ELCBjbWQpOw0KPiA+ICsgICAgICAg
IHBjaV9kZXZmbl9kZWNvZGVfdHlwZVt2Z2FfZGV2Zm5dIHw9IFBDSV9DT01NQU5EX0lPOw0KPiA+
ICAgICAgfQ0KPiA+ICsNCj4gPiArICAgIC8qIEVuYWJsZSBtZW1vcnkgYW5kIEkvTyBkZWNvZGUu
ICovDQo+ID4gKyAgICBmb3IgKCBkZXZmbiA9IDA7IGRldmZuIDwgMjU2OyBkZXZmbisrICkNCj4g
PiArICAgICAgICBpZiAoIHBjaV9kZXZmbl9kZWNvZGVfdHlwZVtkZXZmbl0gKSB7DQo+IA0KPiBT
dHlsZTogVGhlIGJyYWNlIGJlbG9uZ3Mgb24gaXRzIG93biBsaW5lLg0KPiANCj4gVG8gc2F2ZSBv
bmUgc2V0IG9mIHdyaXRlcyB0byB0aGUgY29tbWFuZCByZWdpc3RlcnMgSSB3b3VsZCwgYnR3LA0K
PiBiZSBva2F5IHdpdGggeW91IG1vdmluZyB0aGUgTUFTVEVSIGVuYWJsaW5nIGhlcmUuDQo+IA0K
R29vZCBwb2ludC4gSSB3aWxsIG1ha2UgdGhlc2UgY2hhbmdlcyBpbiB2NC4NCg0KPiBKYW4NCg==

