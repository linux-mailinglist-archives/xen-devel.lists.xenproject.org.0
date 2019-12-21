Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9AC128911
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 13:31:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iidrN-0000LL-5T; Sat, 21 Dec 2019 12:27:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hm2O=2L=amazon.com=prvs=251716dec=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iidrM-0000LG-GN
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 12:27:52 +0000
X-Inumbo-ID: 4d5fe61a-23ed-11ea-94a1-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d5fe61a-23ed-11ea-94a1-12813bfff9fa;
 Sat, 21 Dec 2019 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576931271; x=1608467271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w3YUNwcEiRjVUv/g14Nc53LFQH+Fv97x8dABFtyyz8k=;
 b=TlvDk3cmxvnhYS+jl0o81dVMvFNK504+rsQARqi/LPRenlwxPbhI/1mH
 BT3jReJjbEsGdZblgBeb34PcDjP+Cj4rzaMg01E8t7h8b0EMkr+ARfoJI
 0TLicgRtcZt3EnQnJe/rz0JQ/CcjVUZGs03ho24JKV/Sn6jqzft6XZsF7 w=;
IronPort-SDR: sE39ic70onIulN5JjUas4TX2tUAKgwWmUOmM7eV7D3n+U7owLf9ffGX94+8v0CWiLkcn1poSbZ
 fhc7irgEUebA==
X-IronPort-AV: E=Sophos;i="5.69,338,1571702400"; d="scan'208";a="16315155"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Dec 2019 12:27:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 37D2CA2176; Sat, 21 Dec 2019 12:27:36 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:27:36 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:27:35 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Sat, 21 Dec 2019 12:27:35 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/4] x86: provide and use hv_tsc_scale
Thread-Index: AQHVt2786e7/LV0xL0a4xonWDPi2RafEhRBQ
Date: Sat, 21 Dec 2019 12:27:34 +0000
Message-ID: <3880e5e68e1d449a94672f1961a6a4bb@EX13D32EUC003.ant.amazon.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
 <20191220195135.20130-4-liuwe@microsoft.com>
In-Reply-To: <20191220195135.20130-4-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.67]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 3/4] x86: provide and use hv_tsc_scale
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAyMCBEZWNlbWJlciAyMDE5
IDE5OjUyCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMy80XSB4ODY6IHByb3ZpZGUgYW5kIHVz
ZSBodl90c2Nfc2NhbGUKPiAKPiBUaGUgSHlwZXItViBjbG9jayBzb3VyY2UgYW5kIFhlbidzIG93
biB2aXJpZGlhbiBjb2RlIG5lZWQgdGhlIHNhbWUKPiBmdW5jdGlvbmFsaXR5Lgo+IAo+IE1vdmUg
dGhlIGZ1bmN0aW9uIGluIHZpcmlkaWFuL3RpbWUuYyB0byBoeXBlcnYuaCBhbmQgdXNlIGl0IGlu
IGJvdGgKPiBwbGFjZXMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4KCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4v
dGltZS5jICAgfCAzMCArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9hcmNoL3g4
Ni90aW1lLmMgICAgICAgICAgICAgICAgfCAgNyArLS0tLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LmggfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKPiBiL3hlbi9hcmNo
L3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCj4gaW5kZXggMzJlNzliYmNjNC4uNmIyZDc0NWYzYSAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCj4gQEAgLTEzLDYgKzEzLDcgQEAKPiAKPiAg
I2luY2x1ZGUgPGFzbS9hcGljLmg+Cj4gICNpbmNsdWRlIDxhc20vZXZlbnQuaD4KPiArI2luY2x1
ZGUgPGFzbS9ndWVzdC9oeXBlcnYuaD4KPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxm
cy5oPgo+ICAjaW5jbHVkZSA8YXNtL2h2bS9zdXBwb3J0Lmg+Cj4gCj4gQEAgLTgyLDMzICs4Myw2
IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2VfdHNjKGNvbnN0IHN0cnVjdCBkb21haW4K
PiAqZCwgYm9vbCBpbml0aWFsaXplKQo+ICAgICAgcC0+dHNjX3NlcXVlbmNlID0gc2VxOwo+ICB9
Cj4gCj4gLS8qCj4gLSAqIFRoZSBzcGVjaWZpY2F0aW9uIHNheXM6ICJUaGUgcGFydGl0aW9uIHJl
ZmVyZW5jZSB0aW1lIGlzIGNvbXB1dGVkCj4gLSAqIGJ5IHRoZSBmb2xsb3dpbmcgZm9ybXVsYToK
PiAtICoKPiAtICogUmVmZXJlbmNlVGltZSA9ICgoVmlydHVhbFRzYyAqIFRzY1NjYWxlKSA+PiA2
NCkgKyBUc2NPZmZzZXQKPiAtICoKPiAtICogVGhlIG11bHRpcGxpY2F0aW9uIGlzIGEgNjQgYml0
IG11bHRpcGxpY2F0aW9uLCB3aGljaCByZXN1bHRzIGluIGEKPiAtICogMTI4IGJpdCBudW1iZXIg
d2hpY2ggaXMgdGhlbiBzaGlmdGVkIDY0IHRpbWVzIHRvIHRoZSByaWdodCB0byBvYnRhaW4KPiAt
ICogdGhlIGhpZ2ggNjQgYml0cy4iCj4gLSAqLwo+IC1zdGF0aWMgdWludDY0X3Qgc2NhbGVfdHNj
KHVpbnQ2NF90IHRzYywgdWludDY0X3Qgc2NhbGUsIGludDY0X3Qgb2Zmc2V0KQo+IC17Cj4gLSAg
ICB1aW50NjRfdCByZXN1bHQ7Cj4gLQo+IC0gICAgLyoKPiAtICAgICAqIFF1YWR3b3JkIE1VTCB0
YWtlcyBhbiBpbXBsaWNpdCBvcGVyYW5kIGluIFJBWCwgYW5kIHB1dHMgdGhlIHJlc3VsdAo+IC0g
ICAgICogaW4gUkRYOlJBWC4gQmVjYXVzZSB3ZSBvbmx5IHdhbnQgdGhlIHJlc3VsdCBvZiB0aGUg
bXVsdGlwbGljYXRpb24KPiAtICAgICAqIGFmdGVyIHNoaWZ0aW5nIHJpZ2h0IGJ5IDY0IGJpdHMs
IHdlIHRoZXJlZm9yZSBvbmx5IG5lZWQgdGhlCj4gY29udGVudAo+IC0gICAgICogb2YgUkRYLgo+
IC0gICAgICovCj4gLSAgICBhc20gKCAibXVscSAlW3NjYWxlXSIKPiAtICAgICAgICAgIDogIith
IiAodHNjKSwgIj1kIiAocmVzdWx0KQo+IC0gICAgICAgICAgOiBbc2NhbGVdICJybSIgKHNjYWxl
KSApOwo+IC0KPiAtICAgIHJldHVybiByZXN1bHQgKyBvZmZzZXQ7Cj4gLX0KPiAtCj4gIHN0YXRp
YyB1aW50NjRfdCB0cmNfdmFsKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGludDY0X3Qgb2Zmc2V0
KQo+ICB7Cj4gICAgICB1aW50NjRfdCB0c2MsIHNjYWxlOwo+IEBAIC0xMTYsNyArOTAsNyBAQCBz
dGF0aWMgdWludDY0X3QgdHJjX3ZhbChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBpbnQ2NF90Cj4g
b2Zmc2V0KQo+ICAgICAgdHNjID0gaHZtX2dldF9ndWVzdF90c2MocHRfZ2xvYmFsX3ZjcHVfdGFy
Z2V0KGQpKTsKPiAgICAgIHNjYWxlID0gKCgxMDAwMHVsIDw8IDMyKSAvIGQtPmFyY2gudHNjX2to
eikgPDwgMzI7Cj4gCj4gLSAgICByZXR1cm4gc2NhbGVfdHNjKHRzYywgc2NhbGUsIG9mZnNldCk7
Cj4gKyAgICByZXR1cm4gaHZfc2NhbGVfdHNjKHRzYywgc2NhbGUsIG9mZnNldCk7Cj4gIH0KPiAK
PiAgc3RhdGljIHZvaWQgdGltZV9yZWZfY291bnRfZnJlZXplKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQpCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGlt
ZS5jCj4gaW5kZXggYmJjYzliMTBiOC4uZDIxODc1ZGU5ZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC94ODYvdGltZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+IEBAIC03MjUsMTIgKzcy
NSw3IEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgcmVhZF9oeXBlcnZfdGltZXIodm9pZCkKPiAK
PiAgICAgIH0gd2hpbGUgKCB0c2NfcGFnZS0+dHNjX3NlcXVlbmNlICE9IHNlcSApOwo+IAo+IC0g
ICAgLyogcmV0ID0gKCh0c2MgKiBzY2FsZSkgPj4gNjQpICsgb2Zmc2V0OyAqLwo+IC0gICAgYXNt
ICggIm11bCAlW3NjYWxlXTsgYWRkICVbb2Zmc2V0XSwgJVtyZXRdIgo+IC0gICAgICAgICAgOiAi
K2EiICh0c2MpLCBbcmV0XSAiPSZkIiAocmV0KQo+IC0gICAgICAgICAgOiBbc2NhbGVdICJybSIg
KHNjYWxlKSwgW29mZnNldF0gInJtIiAob2Zmc2V0KSApOwo+IC0KPiAtICAgIHJldHVybiByZXQ7
Cj4gKyAgICByZXR1cm4gaHZfc2NhbGVfdHNjKHRzYywgc2NhbGUsIG9mZnNldCk7Cj4gIH0KPiAK
PiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV90aW1lc291cmNlIF9faW5pdGRhdGEgcGx0X2h5cGVy
dl90aW1lciA9Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2
LmggYi94ZW4vaW5jbHVkZS9hc20tCj4geDg2L2d1ZXN0L2h5cGVydi5oCj4gaW5kZXggY2MyMWI5
YWJmYy4uYzdhN2YzMmJkNSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAo+IEBA
IC0xOSwxMCArMTksMzggQEAKPiAgI2lmbmRlZiBfX1g4Nl9HVUVTVF9IWVBFUlZfSF9fCj4gICNk
ZWZpbmUgX19YODZfR1VFU1RfSFlQRVJWX0hfXwo+IAo+IC0jaWZkZWYgQ09ORklHX0hZUEVSVl9H
VUVTVAo+IC0KPiAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+IAo+ICsvKgo+ICsgKiBUaGUgc3Bl
Y2lmaWNhdGlvbiBzYXlzOiAiVGhlIHBhcnRpdGlvbiByZWZlcmVuY2UgdGltZSBpcyBjb21wdXRl
ZAo+ICsgKiBieSB0aGUgZm9sbG93aW5nIGZvcm11bGE6Cj4gKyAqCj4gKyAqIFJlZmVyZW5jZVRp
bWUgPSAoKFZpcnR1YWxUc2MgKiBUc2NTY2FsZSkgPj4gNjQpICsgVHNjT2Zmc2V0Cj4gKyAqCj4g
KyAqIFRoZSBtdWx0aXBsaWNhdGlvbiBpcyBhIDY0IGJpdCBtdWx0aXBsaWNhdGlvbiwgd2hpY2gg
cmVzdWx0cyBpbiBhCj4gKyAqIDEyOCBiaXQgbnVtYmVyIHdoaWNoIGlzIHRoZW4gc2hpZnRlZCA2
NCB0aW1lcyB0byB0aGUgcmlnaHQgdG8gb2J0YWluCj4gKyAqIHRoZSBoaWdoIDY0IGJpdHMuIgo+
ICsgKi8KPiArc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9zY2FsZV90c2ModWludDY0X3QgdHNj
LCB1aW50NjRfdCBzY2FsZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50NjRfdCBvZmZzZXQpCj4gK3sKPiArICAgIHVpbnQ2NF90IHJlc3VsdDsKPiArCj4gKyAgICAv
Kgo+ICsgICAgICogUXVhZHdvcmQgTVVMIHRha2VzIGFuIGltcGxpY2l0IG9wZXJhbmQgaW4gUkFY
LCBhbmQgcHV0cyB0aGUgcmVzdWx0Cj4gKyAgICAgKiBpbiBSRFg6UkFYLiBCZWNhdXNlIHdlIG9u
bHkgd2FudCB0aGUgcmVzdWx0IG9mIHRoZSBtdWx0aXBsaWNhdGlvbgo+ICsgICAgICogYWZ0ZXIg
c2hpZnRpbmcgcmlnaHQgYnkgNjQgYml0cywgd2UgdGhlcmVmb3JlIG9ubHkgbmVlZCB0aGUKPiBj
b250ZW50Cj4gKyAgICAgKiBvZiBSRFguCj4gKyAgICAgKi8KPiArICAgIGFzbSAoICJtdWxxICVb
c2NhbGVdIgo+ICsgICAgICAgICAgOiAiK2EiICh0c2MpLCAiPWQiIChyZXN1bHQpCj4gKyAgICAg
ICAgICA6IFtzY2FsZV0gInJtIiAoc2NhbGUpICk7Cj4gKwo+ICsgICAgcmV0dXJuIHJlc3VsdCAr
IG9mZnNldDsKPiArfQo+ICsKPiArI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiArCj4gICNp
bmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2aXNvci5oPgo+IAo+ICBzdHJ1Y3QgbXNfaHlwZXJ2X2lu
Zm8gewo+IC0tCj4gMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
