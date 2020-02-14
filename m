Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABB15E7F7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 17:58:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2eG2-0006zZ-UP; Fri, 14 Feb 2020 16:56:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C8Gw=4C=amazon.co.uk=prvs=3060dd874=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j2eG2-0006zU-5q
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 16:56:02 +0000
X-Inumbo-ID: e15bdd78-4f4a-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e15bdd78-4f4a-11ea-b0fd-bc764e2007e4;
 Fri, 14 Feb 2020 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581699362; x=1613235362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v/ePTvKYBtdrnh6plTYuxHJG/ashgTfGBhyiyYaSvrA=;
 b=X4bRY2Mmz5tkJYiYhvKqQ4TbFvdNsePbiUdgDEIqK3ZjwKO4WOxqDauJ
 h6f6oQa9cpGXEG052d5D+b8196p7WOhoJ/J4Hi3SCB82Xb1m8ibqE0eO3
 wSEM9pXN0BFc4PH4bur84getbdd9gqiBoejXlaoMz0UM0Fvqq4Lw24mG5 U=;
IronPort-SDR: DDlQ7L/nWy2GBtX9Mf6cY1NmmbbZ5luwFNEadjJeNzi+oYiu0WezVd7099LtSHkjmkqi17hiBq
 KsnZpFmflb8g==
X-IronPort-AV: E=Sophos;i="5.70,441,1574121600"; d="scan'208";a="17790920"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 14 Feb 2020 16:55:47 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 301C1A1FEF; Fri, 14 Feb 2020 16:55:46 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 14 Feb 2020 16:55:46 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 14 Feb 2020 16:55:45 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 14 Feb 2020 16:55:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted TLB flush
Thread-Index: AQHV4zM1ogAqmhu8Uk+hk4DrI15YB6ga58mg
Date: Fri, 14 Feb 2020 16:55:44 +0000
Message-ID: <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
In-Reply-To: <20200214123430.4942-3-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.77]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
 Wei Liu <liuwe@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxNCBGZWJydWFyeSAyMDIw
IDEzOjM0Cj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBXZWkgTGl1IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPjsgV2VpIExpdQo+IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BB
VENIIHYyIDIvM10geDg2L2h5cGVydjogc2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVz
aAo+IAo+IEltcGxlbWVudCBhIGJhc2ljIGhvb2sgZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaC4g
VGhlIGhvb2sgbmVlZHMgdG8KPiBjaGVjayBpZiBwcmVyZXF1aXNpdGVzIGFyZSBtZXQuIElmIHRo
ZXkgYXJlIG5vdCBtZXQsIGl0IHJldHVybnMgYW4gZXJyb3IKPiBudW1iZXIgdG8gZmFsbCBiYWNr
IHRvIG5hdGl2ZSBmbHVzaGVzLgo+IAo+IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRp
Y2F0ZSBpZiBoeXBlcmNhbGwgcGFnZSBpcyByZWFkeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L01ha2VmaWxlICB8ICAxICsKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
YyAgfCAxNyArKysrKysrKysrKysKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRl
LmggfCAgNCArKysKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYyAgICAgfCA0MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDYzIGluc2Vy
dGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
dGxiLmMKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmls
ZQo+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+IGluZGV4IDY4MTcwMTA5
YTkuLjE4OTAyYzMzZTkgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiBAQCAt
MSArMSwyIEBACj4gIG9iai15ICs9IGh5cGVydi5vCj4gK29iai15ICs9IHRsYi5vCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBpbmRleCA3MGY0Y2Q1YWUwLi5mOWQxZjExYWUzIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiArKysgYi94
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gQEAgLTMzLDYgKzMzLDggQEAgREVG
SU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiAgREVGSU5F
X1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ICBERUZJTkVfUEVS
X0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKPiAKPiArc3RhdGlj
IGJvb2wgX19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5Owo+ICsKPiAgc3RhdGljIHVp
bnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4gIHsKPiAgICAgIHVuaW9uIGh2X2d1ZXN0
X29zX2lkIGlkID0ge307Cj4gQEAgLTExOSw2ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQg
c2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiAgICAgIEJVR19PTighaHlwZXJjYWxsX21zci5l
bmFibGUpOwo+IAo+ICAgICAgc2V0X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8
IFBBR0VfU0hJRlQpOwoKU2hvdWxkbid0IHRoaXMgaGF2ZSBhdCBsZWFzdCBhIGNvbXBpbGVyIGJh
cnJpZXIgaGVyZT8KCiAgUGF1bAoKPiArCj4gKyAgICBodl9oY2FsbF9wYWdlX3JlYWR5ID0gdHJ1
ZTsKPiAgfQo+IAo+ICBzdGF0aWMgaW50IHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+
IEBAIC0xOTksMTEgKzIwMywyNCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1
Y3QgZTgyMG1hcCAqZTgyMCkKPiAgICAgICAgICBwYW5pYygiVW5hYmxlIHRvIHJlc2VydmUgSHlw
ZXItViBoeXBlcmNhbGwgcmFuZ2VcbiIpOwo+ICB9Cj4gCj4gK3N0YXRpYyBpbnQgZmx1c2hfdGxi
KGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCj4gKyAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBmbGFncykKPiArewo+ICsgICAgaWYgKCAhKG1zX2h5cGVydi5o
aW50cyAmIEhWX1g2NF9SRU1PVEVfVExCX0ZMVVNIX1JFQ09NTUVOREVEKSApCj4gKyAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArICAgIGlmICggIWh2X2hjYWxsX3BhZ2VfcmVhZHkg
fHwgIXRoaXNfY3B1KGh2X2lucHV0X3BhZ2UpICkKPiArICAgICAgICByZXR1cm4gLUVOWElPOwo+
ICsKPiArICAgIHJldHVybiBoeXBlcnZfZmx1c2hfdGxiKG1hc2ssIHZhLCBmbGFncyk7Cj4gK30K
PiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgX19pbml0ZGF0YSBvcHMg
PSB7Cj4gICAgICAubmFtZSA9ICJIeXBlci1WIiwKPiAgICAgIC5zZXR1cCA9IHNldHVwLAo+ICAg
ICAgLmFwX3NldHVwID0gYXBfc2V0dXAsCj4gICAgICAuZTgyMF9maXh1cCA9IGU4MjBfZml4dXAs
Cj4gKyAgICAuZmx1c2hfdGxiID0gZmx1c2hfdGxiLAo+ICB9Owo+IAo+ICAvKgo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+IGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKPiBpbmRleCA5NTZlZmY4MzFmLi41MDliZWRhYWZhIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCj4gKysrIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKPiBAQCAtMjIsMTAgKzIyLDE0IEBA
Cj4gICNpZm5kZWYgX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXwo+ICAjZGVmaW5lIF9fWEVOX0hZ
UEVSVl9QUklWSUFURV9IX18KPiAKPiArI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+Cj4gICNpbmNs
dWRlIDx4ZW4vcGVyY3B1Lmg+Cj4gCj4gIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lucHV0
X3BhZ2UpOwo+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ICBERUNM
QVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gCj4gK2ludCBoeXBlcnZf
Zmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCj4gKyAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncyk7Cj4gKwo+ICAjZW5kaWYgLyogX19Y
RU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAgKi8KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi90bGIuYwo+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDhmNTI3MjI5ZQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jCj4gQEAgLTAs
MCArMSw0MSBAQAo+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gKioqKioqCj4gKyAqIGFyY2gveDg2L2d1
ZXN0L2h5cGVydi90bGIuYwo+ICsgKgo+ICsgKiBTdXBwb3J0IGZvciBUTEIgbWFuYWdlbWVudCB1
c2luZyBoeXBlcmNhbGxzCj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJl
OyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Cj4gKyAqIGl0IHVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5
Cj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2Yg
dGhlIExpY2Vuc2UsIG9yCj4gKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24u
Cj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLAo+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhv
dXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgo+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3Ig
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4gKyAqIEdOVSBHZW5l
cmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4gKyAqCj4gKyAqIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
Cj4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5n
bnUub3JnL2xpY2Vuc2VzLz4uCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMCBNaWNyb3Nv
ZnQuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+Cj4gKyNpbmNsdWRlIDx4
ZW4vZXJybm8uaD4KPiArCj4gKyNpbmNsdWRlICJwcml2YXRlLmgiCj4gKwo+ICtpbnQgaHlwZXJ2
X2ZsdXNoX3RsYihjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAo+ICsgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gK3sKPiArICAgIHJldHVybiAt
RU9QTk9UU1VQUDsKPiArfQo+ICsKPiArLyoKPiArICogTG9jYWwgdmFyaWFibGVzOgo+ICsgKiBt
b2RlOiBDCj4gKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKPiArICogYy1iYXNpYy1vZmZzZXQ6IDQK
PiArICogdGFiLXdpZHRoOiA0Cj4gKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAo+ICsgKiBFbmQ6
Cj4gKyAqLwo+IC0tCj4gMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
