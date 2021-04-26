Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A936B0D5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 11:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117526.223450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laxkb-0000gG-JP; Mon, 26 Apr 2021 09:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117526.223450; Mon, 26 Apr 2021 09:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laxkb-0000fr-GE; Mon, 26 Apr 2021 09:41:57 +0000
Received: by outflank-mailman (input) for mailman id 117526;
 Mon, 26 Apr 2021 09:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mXBP=JX=amazon.com=prvs=74380e36c=hongyxia@srs-us1.protection.inumbo.net>)
 id 1laxka-0000fm-Mc
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 09:41:56 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71f77170-66e2-478b-8dcf-df5a3c4a83c2;
 Mon, 26 Apr 2021 09:41:54 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-4101.iad4.amazon.com with ESMTP; 26 Apr 2021 09:41:48 +0000
Received: from EX13D37EUA003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id D46B5A1D41; Mon, 26 Apr 2021 09:41:43 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 26 Apr 2021 09:41:42 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1497.015;
 Mon, 26 Apr 2021 09:41:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 71f77170-66e2-478b-8dcf-df5a3c4a83c2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1619430115; x=1650966115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JQi79qMmHO7NYKbh8fcMxghGDhxN/rf8QDLGHzK2lV0=;
  b=g0V7h4cjRq654J3QbU/rbkHtfmq388yN09r9v13qrtwxuRBCzj0csxg+
   yIBRnw3CiWTQ5oqbP7mV9ITBn+XrbLvHMrD41vLy72hl5/+ALBazO0yXE
   QEsot2mxQTy2nxspe7CJg9YJScwIwwC6LQ4/ga+xo9kUQ2PuBmtRbyfev
   Y=;
X-IronPort-AV: E=Sophos;i="5.82,252,1613433600"; 
   d="scan'208";a="103927592"
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "julien@xen.org" <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Penny.Zheng@arm.com" <Penny.Zheng@arm.com>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>, "Wei.Chen@arm.com" <Wei.Chen@arm.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com"
	<wei.liu2@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"hongyax@amazon.com" <hongyax@amazon.com>, "Henry.Wang@arm.com"
	<Henry.Wang@arm.com>, "wl@xen.org" <wl@xen.org>, "Grall, Julien"
	<jgrall@amazon.co.uk>, "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [PATCH RFCv2 12/15] xen/arm: add Persistent Map (PMAP)
 infrastructure
Thread-Topic: [PATCH RFCv2 12/15] xen/arm: add Persistent Map (PMAP)
 infrastructure
Thread-Index: AQHXOoBcsB9zBVKLMkGe/ouZ8wFP5w==
Date: Mon, 26 Apr 2021 09:41:41 +0000
Message-ID: <baccb4ab6c71a655a4ac19cc27f2eacc116b8d4b.camel@amazon.com>
References: <20210425201318.15447-1-julien@xen.org>
	 <20210425201318.15447-13-julien@xen.org>
In-Reply-To: <20210425201318.15447-13-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.162.28]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6E7D978078988419BCAEDDE1B852C82@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gU3VuLCAyMDIxLTA0LTI1IGF0IDIxOjEzICswMTAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+
IEZyb206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IA0KPiBUaGUgYmFzaWMgaWRl
YSBpcyBsaWtlIFBlcnNpc3RlbnQgS2VybmVsIE1hcCAoUEtNQVApIGluIExpbnV4LiBXZQ0KPiBw
cmUtcG9wdWxhdGUgYWxsIHRoZSByZWxldmFudCBwYWdlIHRhYmxlcyBiZWZvcmUgdGhlIHN5c3Rl
bSBpcyBmdWxseQ0KPiBzZXQgdXAuDQo+IA0KPiBXZSB3aWxsIG5lZWQgaXQgb24gQXJtIGluIG9y
ZGVyIHRvIHJld29yayB0aGUgYXJtNjQgdmVyc2lvbiBvZg0KPiB4ZW5oZWFwX3NldHVwX21hcHBp
bmdzKCkgYXMgd2UgbWF5IG5lZWQgdG8gdXNlIHBhZ2VzIGFsbG9jYXRlZCBmcm9tDQo+IHRoZSBi
b290IGFsbG9jYXRvciBiZWZvcmUgdGhleSBhcmUgZWZmZWN0aXZlbHkgbWFwcGVkLg0KPiANCj4g
VGhpcyBpbmZyYXN0cnVjdHVyZSBpcyBub3QgbG9jay1wcm90ZWN0ZWQgdGhlcmVmb3JlIGNhbiBv
bmx5IGJlIHVzZWQNCj4gYmVmb3JlIHNtcGJvb3QuIEFmdGVyIHNtcGJvb3QsIG1hcF9kb21haW5f
cGFnZSgpIGhhcyB0byBiZSB1c2VkLg0KPiANCj4gVGhpcyBpcyBiYXNlZCBvbiB0aGUgeDg2IHZl
cnNpb24gWzFdIHRoYXQgd2FzIG9yaWdpbmFsbHkgaW1wbGVtZW50ZWQNCj4gYnkgV2VpIExpdS4N
Cj4gDQo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHN3aXRjaCB0aGUgcGFyYW1ldGVyIGF0dHIg
ZnJvbSB1bnNpZ25lZCB0bw0KPiB1bnNpZ25lZCBpbnQuDQo+IA0KPiBbMV0gPA0KPiBlOTJkYTRh
ZDYwMTViNjA4OTczN2ZjY2NiYTNlYzFkNjQyNDY0OWE1LjE1ODgyNzgzMTcuZ2l0Lmhvbmd5eGlh
QGFtYXpvbi5jb20NCj4gPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpv
bi5jb20+DQo+IFtqdWxpZW46IEFkYXB0ZWQgZm9yIEFybV0NCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCg0KWy4uLl0NCg0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3BtYXAuYyBiL3hlbi9hcmNoL2FybS9wbWFwLmMNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi43MDJiMWJkZTk4MmQNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi94ZW4vYXJjaC9hcm0vcG1hcC5jDQo+IEBAIC0wLDAgKzEsMTAxIEBADQo+
ICsjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vbW0uaD4NCj4gKw0KPiAr
I2luY2x1ZGUgPGFzbS9iaXRvcHMuaD4NCj4gKyNpbmNsdWRlIDxhc20vZmx1c2h0bGIuaD4NCj4g
KyNpbmNsdWRlIDxhc20vcG1hcC5oPg0KPiArDQo+ICsvKg0KPiArICogVG8gYmUgYWJsZSB0byB1
c2UgRklYTUFQX1BNQVBfQkVHSU4uDQo+ICsgKiBYWFg6IG1vdmUgZml4bWFwIGRlZmluaXRpb24g
aW4gYSBzZXBhcmF0ZSBoZWFkZXINCj4gKyAqLw0KPiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+
ICsNCj4gKy8qDQo+ICsgKiBTaW1wbGUgbWFwcGluZyBpbmZyYXN0cnVjdHVyZSB0byBtYXAgLyB1
bm1hcCBwYWdlcyBpbiBmaXhlZCBtYXAuDQo+ICsgKiBUaGlzIGlzIHVzZWQgdG8gc2V0IHVwIHRo
ZSBwYWdlIHRhYmxlIGZvciBtYXBjYWNoZSwgd2hpY2ggaXMgdXNlZA0KPiArICogYnkgbWFwIGRv
bWFpbiBwYWdlIGluZnJhc3RydWN0dXJlLg0KPiArICoNCj4gKyAqIFRoaXMgc3RydWN0dXJlIGlz
IG5vdCBwcm90ZWN0ZWQgYnkgYW55IGxvY2tzLCBzbyBpdCBtdXN0IG5vdCBiZQ0KPiB1c2VkIGFm
dGVyDQo+ICsgKiBzbXAgYnJpbmctdXAuDQo+ICsgKi8NCj4gKw0KPiArLyogQml0bWFwIHRvIHRy
YWNrIHdoaWNoIHNsb3QgaXMgdXNlZCAqLw0KPiArc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0
ZGF0YSBpbnVzZTsNCj4gKw0KPiArLyogWFhYOiBGaW5kIGFuIGhlYWRlciB0byBkZWNsYXJlIGl0
ICovDQo+ICtleHRlcm4gbHBhZV90IHhlbl9maXhtYXBbTFBBRV9FTlRSSUVTXTsNCj4gKw0KPiAr
dm9pZCAqX19pbml0IHBtYXBfbWFwKG1mbl90IG1mbikNCj4gK3sNCj4gKyAgICB1bnNpZ25lZCBs
b25nIGZsYWdzOw0KPiArICAgIHVuc2lnbmVkIGludCBpZHg7DQo+ICsgICAgdmFkZHJfdCBsaW5l
YXI7DQo+ICsgICAgdW5zaWduZWQgaW50IHNsb3Q7DQo+ICsgICAgbHBhZV90ICplbnRyeSwgcHRl
Ow0KPiArDQo+ICsgICAgQlVJTERfQlVHX09OKHNpemVvZihpbnVzZSkgKiBCSVRTX1BFUl9MT05H
IDwgTlVNX0ZJWF9QTUFQKTsNCg0KVGhpcyBzZWVtcyB3cm9uZyB0byBtZS4gSXQgc2hvdWxkIG11
bHRpcGx5IHdpdGggc29tZXRoaW5nIGxpa2UNCkJJVFNfUEVSX0JZVEUuDQoNCkkgbm90aWNlZCB0
aGlzIGxpbmUgd2FzIGFscmVhZHkgcHJlc2VudCBiZWZvcmUgdGhlIEFybSB2ZXJzaW9uIHNvDQpw
cm9iYWJseSBteSBmYXVsdCA6KCwgd2hpY2ggYWxzbyBuZWVkcyB0byBiZSBmaXhlZC4NCg0KPiAr
DQo+ICsgICAgQVNTRVJUKHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9zbXBfYm9vdCk7DQo+ICsN
Cj4gKyAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7DQo+ICsNCj4gKyAgICBpZHggPSBmaW5kX2Zp
cnN0X3plcm9fYml0KCZpbnVzZSwgTlVNX0ZJWF9QTUFQKTsNCj4gKyAgICBpZiAoIGlkeCA9PSBO
VU1fRklYX1BNQVAgKQ0KPiArICAgICAgICBwYW5pYygiT3V0IG9mIFBNQVAgc2xvdHNcbiIpOw0K
PiArDQo+ICsgICAgX19zZXRfYml0KGlkeCwgJmludXNlKTsNCj4gKw0KPiArICAgIHNsb3QgPSBp
ZHggKyBGSVhNQVBfUE1BUF9CRUdJTjsNCj4gKyAgICBBU1NFUlQoc2xvdCA+PSBGSVhNQVBfUE1B
UF9CRUdJTiAmJiBzbG90IDw9IEZJWE1BUF9QTUFQX0VORCk7DQo+ICsNCg0KRnJvbSBoZXJlLi4u
DQoNCj4gKyAgICBsaW5lYXIgPSBGSVhNQVBfQUREUihzbG90KTsNCj4gKyAgICAvKg0KPiArICAg
ICAqIFdlIGNhbm5vdCB1c2Ugc2V0X2ZpeG1hcCgpIGhlcmUuIFdlIHVzZSBQTUFQIHdoZW4gdGhl
cmUgaXMgbm8NCj4gZGlyZWN0IG1hcCwNCj4gKyAgICAgKiBzbyBtYXBfcGFnZXNfdG9feGVuKCkg
Y2FsbGVkIGJ5IHNldF9maXhtYXAoKSBuZWVkcyB0byBtYXANCj4gcGFnZXMgb24NCj4gKyAgICAg
KiBkZW1hbmQsIHdoaWNoIHRoZW4gY2FsbHMgcG1hcCgpIGFnYWluLCByZXN1bHRpbmcgaW4gYSBs
b29wLg0KPiBNb2RpZnkgdGhlDQo+ICsgICAgICogUFRFcyBkaXJlY3RseSBpbnN0ZWFkLiBUaGUg
c2FtZSBpcyB0cnVlIGZvciBwbWFwX3VubWFwKCkuDQo+ICsgICAgICovDQo+ICsgICAgZW50cnkg
PSAmeGVuX2ZpeG1hcFt0aGlyZF90YWJsZV9vZmZzZXQobGluZWFyKV07DQo+ICsNCj4gKyAgICBB
U1NFUlQoIWxwYWVfaXNfdmFsaWQoKmVudHJ5KSk7DQo+ICsNCj4gKyAgICBwdGUgPSBtZm5fdG9f
eGVuX2VudHJ5KG1mbiwgUEFHRV9IWVBFUlZJU09SX1JXKTsNCj4gKyAgICBwdGUucHQudGFibGUg
PSAxOw0KPiArICAgIHdyaXRlX3B0ZShlbnRyeSwgcHRlKTsNCj4gKw0KDQouLi50byBoZXJlLCBJ
IHdvbmRlciBpZiB3ZSBjYW4gbW92ZSB0aGlzIGNodW5rIGludG8gYXJjaCAobGlrZSB2b2lkDQoq
YXJjaF93cml0ZV9wbWFwX3Nsb3Qoc2xvdCkpLiBTdWNoIGFuIGFyY2ggZnVuY3Rpb24gaGlkZXMg
aG93IGZpeG1hcCBpcw0KaGFuZGxlZCBhbmQgaG93IHBhZ2UgdGFibGUgZW50cnkgaXMgd3JpdHRl
biBiZWhpbmQgYXJjaCwgYW5kIHRoZSByZXN0DQpjYW4ganVzdCBiZSBjb21tb24uDQoNCj4gKyAg
ICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7DQo+ICsNCj4gKyAgICByZXR1cm4gKHZvaWQgKils
aW5lYXI7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgX19pbml0IHBtYXBfdW5tYXAoY29uc3Qgdm9pZCAq
cCkNCj4gK3sNCj4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArICAgIHVuc2lnbmVkIGlu
dCBpZHg7DQo+ICsgICAgbHBhZV90ICplbnRyeTsNCj4gKyAgICBscGFlX3QgcHRlID0geyAwIH07
DQo+ICsgICAgdW5zaWduZWQgaW50IHNsb3QgPSB0aGlyZF90YWJsZV9vZmZzZXQoKHZhZGRyX3Qp
cCk7DQo+ICsNCj4gKyAgICBBU1NFUlQoc3lzdGVtX3N0YXRlIDwgU1lTX1NUQVRFX3NtcF9ib290
KTsNCj4gKyAgICBBU1NFUlQoc2xvdCA+PSBGSVhNQVBfUE1BUF9CRUdJTiAmJiBzbG90IDw9IEZJ
WE1BUF9QTUFQX0VORCk7DQo+ICsNCj4gKyAgICBpZHggPSBzbG90IC0gRklYTUFQX1BNQVBfQkVH
SU47DQo+ICsgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiArDQo+ICsgICAgX19jbGVhcl9i
aXQoaWR4LCAmaW51c2UpOw0KPiArICAgIGVudHJ5ID0gJnhlbl9maXhtYXBbdGhpcmRfdGFibGVf
b2Zmc2V0KCh2YWRkcl90KXApXTsNCj4gKyAgICB3cml0ZV9wdGUoZW50cnksIHB0ZSk7DQo+ICsg
ICAgZmx1c2hfeGVuX3RsYl9yYW5nZV92YV9sb2NhbCgodmFkZHJfdClwLCBQQUdFX1NJWkUpOw0K
DQphbmQgdGhlIHNhbWUgZm9yIHRoZSBhYm92ZSwgc29tZXRoaW5nIGxpa2UgYXJjaF9jbGVhcl9w
bWFwKHZvaWQgKikgYW5kDQp0aGUgcmVzdCBpbnRvIGNvbW1vbi4NCg0KRnJvbSBhIHF1aWNrIGds
YW5jZSwgSSBkb24ndCB0aGluayB4ODYgYW5kIEFybSBzaGFyZSBhbnkgdXNlZnVsIFRMQg0KZmx1
c2ggaGVscGVycz8gU28gdGhlIFRMQiBmbHVzaCBwcm9iYWJseSBzaG91bGQgYmUgYmVoaW5kIGFy
Y2ggYXMgd2VsbC4NCg0KPiArDQo+ICsgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiAr
fQ0KPiArDQo+ICsvKg0KPiArICogTG9jYWwgdmFyaWFibGVzOg0KPiArICogbW9kZTogQw0KPiAr
ICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPiArICogYy1iYXNpYy1vZmZzZXQ6IDQNCj4gKyAqIGlu
ZGVudC10YWJzLW1vZGU6IG5pbA0KPiArICogRW5kOg0KPiArICovDQoNClsuLi5dDQoNCj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcG1hcC5oIGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9wbWFwLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi44
ZTFkY2U5M2Y4ZTQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJt
L3BtYXAuaA0KPiBAQCAtMCwwICsxLDEwIEBADQo+ICsjaWZuZGVmIF9fQVNNX1BNQVBfSF9fDQo+
ICsjZGVmaW5lIF9fQVJNX1BNQVBfSF9fDQoNClRoaXMgbGluZSBkb2Vzbid0IHNlZW0gdG8gbWF0
Y2ggdGhlICNpZm5kZWYsIGJ1dCBpZiB0aGUgZnVuY3Rpb25zIGFyZQ0KbW92ZWQgdG8gY29tbW9u
LCB0aGlzIGhlYWRlciBjYW4gYmUgbW92ZWQgdG8gY29tbW9uIGFzIHdlbGwuDQoNCkhvbmd5YW4N
Cg==

