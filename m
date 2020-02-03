Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364CC150540
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:27:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZqx-0002VN-Q4; Mon, 03 Feb 2020 11:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZqw-0002VF-IH
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:25:18 +0000
X-Inumbo-ID: daa935e2-4677-11ea-b211-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daa935e2-4677-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 11:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580729118; x=1612265118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AwKP1MQ7mlEb1GMEweUsc7mfaBnz+CphFE5NVLlXmMs=;
 b=WbcxO/2FTuwYSE8uCZftPhkmJRpXFyH3McMBOxrLeNYCoT/QnvtR2wb0
 pizEUe1vnZrS3n7nnTpXdg/FCD+DPXBST9rcki+2+9H6ZEGm645qeJMm5
 c3aq18T8rG7xstEHaqkR5uavMRdi6TQMg5+JqWYcC3VUPv6CeRt+UBCSC I=;
IronPort-SDR: dyViTONE4hcjXn43XrhgWBeO6ZD8snY4MQV6XJoK7HqzeUsWdktqmUykaOO9uY1HVDQklL4pUo
 HmK3GCEKzV+A==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="24022206"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Feb 2020 11:25:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7E57F14000B; Mon,  3 Feb 2020 11:25:14 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:25:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:25:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:25:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v6 11/11] x86/hyperv: setup VP assist page
Thread-Index: AQHV2F7kGv1I6AE+lkqjhFMZqvtv2KgJWFOQ
Date: Mon, 3 Feb 2020 11:25:12 +0000
Message-ID: <645c645204524596b9e640f13ab8ab46@EX13D32EUC003.ant.amazon.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-12-liuwe@microsoft.com>
In-Reply-To: <20200131174930.31045-12-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 11/11] x86/hyperv: setup VP assist page
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
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAzMSBKYW51YXJ5IDIwMjAg
MTc6NTAKPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz4KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWlj
aGFlbCBLZWxsZXkKPiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+OyBXZWkgTGl1Cj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0ggdjYgMTEvMTFdIHg4Ni9oeXBlcnY6IHNldHVwIFZQIGFzc2lzdCBwYWdlCj4gCj4gVlAgYXNz
aXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBzb21lIGJp
dHMgaW4gaXQKPiBmb3IgZWZmaWNpZW50IG5lc3RlZCB2aXJ0dWFsaXNhdGlvbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KCj4gLS0tCj4gdjY6Cj4gMS4gVXNlIGh2
X3ZwX2Fzc2lzdF9wYWdlX21zcgo+IDIuIE1ha2UgY29kZSBzaG9ydGVyCj4gMy4gUHJlc2VydmUg
cnN2ZFAgZmllbGRzCj4gCj4gdjU6Cj4gMS4gRGVhbCB3aXRoIGVycm9yIHByb3Blcmx5IGluc3Rl
YWQgb2YgYWx3YXlzIHBhbmlja2luZwo+IDIuIFN3YXAgcGVyY3B1IHZhcmlhYmxlcyBkZWNsYXJh
dGlvbnMnIGxvY2F0aW9uCj4gCj4gdjQ6Cj4gMS4gVXNlIHByaXZhdGUuaAo+IDIuIFByZXZlbnQg
bGVhawo+IAo+IHYzOgo+IDEuIFVzZSB4ZW5oZWFwIHBhZ2UKPiAyLiBEcm9wIHNldF92cF9hc3Np
c3QKPiAKPiB2MjoKPiAxLiBVc2UgSFZfSFlQX1BBR0VfU0hJRlQgaW5zdGVhZAo+IC0tLQo+ICB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICB8IDM3ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgIDEg
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGluZGV4IDZkYWMzYmZjZWIuLjc1ZmIz
MjlkNGQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMzEsNiArMzEs
NyBAQAo+IAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFkX21vc3RseSBtc19oeXBlcnY7
Cj4gIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfaW5wdXRfcGFnZSk7Cj4g
K0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKPiAgREVG
SU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gCj4g
IHN0YXRpYyB1aW50NjRfdCBnZW5lcmF0ZV9ndWVzdF9pZCh2b2lkKQo+IEBAIC0xNTUsMTcgKzE1
Niw1MSBAQCBzdGF0aWMgaW50IHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQo+ICAgICAg
cmV0dXJuIDA7Cj4gIH0KPiAKPiArc3RhdGljIGludCBzZXR1cF92cF9hc3Npc3Qodm9pZCkKPiAr
ewo+ICsgICAgdW5pb24gaHZfdnBfYXNzaXN0X3BhZ2VfbXNyIG1zcjsKPiArCj4gKyAgICBpZiAo
ICF0aGlzX2NwdShodl92cF9hc3Npc3QpICkKPiArICAgIHsKPiArICAgICAgICB0aGlzX2NwdSho
dl92cF9hc3Npc3QpID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4gKyAgICAgICAgaWYgKCAhdGhp
c19jcHUoaHZfdnBfYXNzaXN0KSApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwcmludGso
IkNQVSV1OiBGYWlsZWQgdG8gYWxsb2NhdGUgdnBfYXNzaXN0IHBhZ2VcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+ICsgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGNsZWFyX3BhZ2UodGhpc19jcHUoaHZf
dnBfYXNzaXN0KSk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfVlBfQVNT
SVNUX1BBR0UsIG1zci5yYXcpOwo+ICsgICAgbXNyLnBmbiA9IHZpcnRfdG9fbWZuKHRoaXNfY3B1
KGh2X3ZwX2Fzc2lzdCkpOwo+ICsgICAgbXNyLmVuYWJsZWQgPSAxOwo+ICsgICAgd3Jtc3JsKEhW
X1g2NF9NU1JfVlBfQVNTSVNUX1BBR0UsIG1zci5yYXcpOwo+ICsKPiArICAgIHJldHVybiAwOwo+
ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAgewo+ICAgICAgc2V0
dXBfaHlwZXJjYWxsX3BhZ2UoKTsKPiAKPiAgICAgIGlmICggc2V0dXBfaHlwZXJjYWxsX3BjcHVf
YXJnKCkgKQo+ICAgICAgICAgIHBhbmljKCJIeXBlci1WIGh5cGVyY2FsbCBwZXJjcHUgYXJnIHNl
dHVwIGZhaWxlZFxuIik7Cj4gKwo+ICsgICAgaWYgKCBzZXR1cF92cF9hc3Npc3QoKSApCj4gKyAg
ICAgICAgcGFuaWMoIlZQIGFzc2lzdCBwYWdlIHNldHVwIGZhaWxlZFxuIik7Cj4gIH0KPiAKPiAg
c3RhdGljIGludCBhcF9zZXR1cCh2b2lkKQo+ICB7Cj4gLSAgICByZXR1cm4gc2V0dXBfaHlwZXJj
YWxsX3BjcHVfYXJnKCk7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICsgICAgcmMgPSBzZXR1cF9oeXBl
cmNhbGxfcGNwdV9hcmcoKTsKPiArICAgIGlmICggcmMgKQo+ICsgICAgICAgIHJldHVybiByYzsK
PiArCj4gKyAgICByZXR1cm4gc2V0dXBfdnBfYXNzaXN0KCk7Cj4gIH0KPiAKPiAgc3RhdGljIHZv
aWQgX19pbml0IGU4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCj4gYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L3ByaXZhdGUuaAo+IGluZGV4IGQxNzY1ZDRmMjMuLjk1NmVmZjgzMWYgMTAwNjQ0
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKPiArKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+IEBAIC0yNSw2ICsyNSw3IEBACj4gICNp
bmNsdWRlIDx4ZW4vcGVyY3B1Lmg+Cj4gCj4gIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lu
cHV0X3BhZ2UpOwo+ICtERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ICBE
RUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gCj4gICNlbmRpZiAv
KiBfX1hFTl9IWVBFUlZfUFJJVklBVEVfSF9fICAqLwo+IC0tCj4gMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
