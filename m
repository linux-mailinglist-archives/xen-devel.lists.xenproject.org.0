Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5EA14D91E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:36:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix79f-0003oh-Qb; Thu, 30 Jan 2020 10:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix79e-0003oc-Ga
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:34:34 +0000
X-Inumbo-ID: 1b18282e-434c-11ea-8a2e-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b18282e-434c-11ea-8a2e-12813bfff9fa;
 Thu, 30 Jan 2020 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580380475; x=1611916475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mMQ20wiT7ORZ4LtUNYnognb5unuGz02K56FNSWY6gjM=;
 b=HfGLo3/1osmci6Civ+Cjhgb3MimZoLPVpIY8X/uKRdJz+tMZMxpKlLCx
 3ngZVKGdMRisatDMJNcwil0i3calupOnP68CPC7/KYICWtu4C9jNKQPDV
 BfgSt8bp7vqGAJBESfsMTmhsf7MnZ0eArDX1/ZUw8/SuTfCk+owrMCKER w=;
IronPort-SDR: 7qUGsIhw3zDSeV1XHI+yUYEN+zXFtd/9exi//roGU/o+D4ZwiMcfSNovme6dEsFdmYP8CkfB/F
 6dzBhIdmbeew==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="14910888"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Jan 2020 10:34:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id A9C8DA2A8F; Thu, 30 Jan 2020 10:34:31 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 10:34:31 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 10:34:30 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 10:34:29 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 12/12] x86/hyperv: setup VP assist page
Thread-Index: AQHV1uGhcoTsmC/2GEutOXg9wJhmV6gDAr+Q
Date: Thu, 30 Jan 2020 10:34:29 +0000
Message-ID: <e899b1596ef245bba2d0c19313c6f3bc@EX13D32EUC003.ant.amazon.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-13-liuwe@microsoft.com>
In-Reply-To: <20200129202034.15052-13-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 12/12] x86/hyperv: setup VP assist page
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAyOSBKYW51YXJ5IDIwMjAg
MjA6MjEKPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz4KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWlj
aGFlbCBLZWxsZXkKPiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+OyBXZWkgTGl1Cj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0ggdjUgMTIvMTJdIHg4Ni9oeXBlcnY6IHNldHVwIFZQIGFzc2lzdCBwYWdlCj4gCj4gVlAgYXNz
aXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBzb21lIGJp
dHMgaW4gaXQKPiBmb3IgZWZmaWNpZW50IG5lc3RlZCB2aXJ0dWFsaXNhdGlvbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+IHY1Ogo+IDEu
IERlYWwgd2l0aCBlcnJvciBwcm9wZXJseSBpbnN0ZWFkIG9mIGFsd2F5cyBwYW5pY2tpbmcKPiAy
LiBTd2FwIHBlcmNwdSB2YXJpYWJsZXMgZGVjbGFyYXRpb25zJyBsb2NhdGlvbgo+IAo+IHY0Ogo+
IDEuIFVzZSBwcml2YXRlLmgKPiAyLiBQcmV2ZW50IGxlYWsKPiAKPiB2MzoKPiAxLiBVc2UgeGVu
aGVhcCBwYWdlCj4gMi4gRHJvcCBzZXRfdnBfYXNzaXN0Cj4gCj4gdjI6Cj4gMS4gVXNlIEhWX0hZ
UF9QQUdFX1NISUZUIGluc3RlYWQKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYyAgfCA0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMKPiBpbmRleCBhZjBkNmVkNjkyLi5iYzQwYTNkMzM4IDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCj4gQEAgLTMxLDYgKzMxLDcgQEAKPiAKPiAgc3RydWN0IG1zX2h5cGVy
dl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2Owo+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01P
U1RMWSh2b2lkICosIGh2X3BjcHVfaW5wdXRfcGFnZSk7Cj4gK0RFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NU
TFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gCj4gIHN0YXRpYyB1aW50NjRfdCBnZW5l
cmF0ZV9ndWVzdF9pZCh2b2lkKQo+IEBAIC0xNTUsMTYgKzE1Niw1NyBAQCBzdGF0aWMgaW50IHNl
dHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAKPiAr
c3RhdGljIGludCBzZXR1cF92cF9hc3Npc3Qodm9pZCkKPiArewo+ICsgICAgdm9pZCAqbWFwcGlu
ZzsKPiArICAgIHVpbnQ2NF90IHZhbDsKPiArCj4gKyAgICBtYXBwaW5nID0gdGhpc19jcHUoaHZf
dnBfYXNzaXN0KTsKPiArCj4gKyAgICBpZiAoICFtYXBwaW5nICkKPiArICAgIHsKPiArICAgICAg
ICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4gKyAgICAgICAgaWYgKCAhbWFwcGlu
ZyApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwcmludGsoIkZhaWxlZCB0byBhbGxvY2F0
ZSB2cF9hc3Npc3QgcGFnZSBmb3IgQ1BVJXVcbiIsCj4gKyAgICAgICAgICAgICAgICAgICBzbXBf
cHJvY2Vzc29yX2lkKCkpOwo+ICsgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArICAgICAg
ICB9Cj4gKwo+ICsgICAgICAgIGNsZWFyX3BhZ2UobWFwcGluZyk7Cj4gKyAgICAgICAgdGhpc19j
cHUoaHZfdnBfYXNzaXN0KSA9IG1hcHBpbmc7Cj4gKyAgICB9Cj4gKwo+ICsgICAgdmFsID0gKHZp
cnRfdG9fbWZuKG1hcHBpbmcpIDw8IEhWX0hZUF9QQUdFX1NISUZUKQo+ICsgICAgICAgIHwgSFZf
WDY0X01TUl9WUF9BU1NJU1RfUEFHRV9FTkFCTEU7CgpQZXJoYXBzIGl0IHdvdWxkIGJlIG5lYXRl
ciB0byBwdXQgdGhlIHZpcmlkaWFuX3BhZ2VfbXNyIHVuaW9uIGludG8gaHlwZXJ2LXRsZnMuaCBh
bmQgdGhlbiB1c2UgdGhhdC4KCiAgUGF1bAoKPiArICAgIHdybXNybChIVl9YNjRfTVNSX1ZQX0FT
U0lTVF9QQUdFLCB2YWwpOwo+ICsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMg
dm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAgewo+ICAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uo
KTsKPiArCj4gICAgICBpZiAoIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpICkKPiAgICAgICAg
ICBwYW5pYygiSHlwZXJjYWxsIHBlcmNwdSBhcmcgc2V0dXAgZmFpbGVkXG4iKTsKPiArCj4gKyAg
ICBpZiAoIHNldHVwX3ZwX2Fzc2lzdCgpICkKPiArICAgICAgICBwYW5pYygiVlAgYXNzaXN0IHBh
Z2Ugc2V0dXAgZmFpbGVkXG4iKTsKPiAgfQo+IAo+ICBzdGF0aWMgaW50IGFwX3NldHVwKHZvaWQp
Cj4gIHsKPiAtICAgIHJldHVybiBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKPiArICAgIGlu
dCByYzsKPiArCj4gKyAgICByYyA9IHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpOwo+ICsgICAg
aWYgKCByYyApCj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICsgICAgcmMgPSBzZXR1cF92cF9h
c3Npc3QoKTsKPiArCj4gKyBvdXQ6Cj4gKyAgICByZXR1cm4gcmM7Cj4gIH0KPiAKPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7Cj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCj4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3ByaXZhdGUuaAo+IGluZGV4IGMxYzI0MzFlZmYuLmZjZGRjNDc1NDQgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKPiArKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+IEBAIC0yNSw2ICsyNSw3IEBACj4gICNpbmNsdWRl
IDx4ZW4vcGVyY3B1Lmg+Cj4gCj4gIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X3BjcHVfaW5w
dXRfcGFnZSk7Cj4gK0RFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7Cj4gIERF
Q0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKPiAKPiAgI2VuZGlmIC8q
IF9fWEVOX0hZUEVSVl9QUklWSUFURV9IX18gICovCj4gLS0KPiAyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
