Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B31128910
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 13:31:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iidsV-0000R8-KG; Sat, 21 Dec 2019 12:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hm2O=2L=amazon.com=prvs=251716dec=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iidsU-0000R1-LI
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 12:29:02 +0000
X-Inumbo-ID: 780b5656-23ed-11ea-a914-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 780b5656-23ed-11ea-a914-bc764e2007e4;
 Sat, 21 Dec 2019 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576931343; x=1608467343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7k5Zj7iiZFm0G3K9OT8uTTOEvLm6FGD2HQM4xqXp61c=;
 b=p0xxc9BDoKiJlhEYAA3iZjIu1JUDUmSh0P3Hz2vH+OxI+NOWGyOUCsjm
 lYhblxpQS9kOW7RrtbZwlT+8Iu1GEZ/uMeRNzgqfUYgafZ76w5R67vIJW
 xGqVGmgdjNQIVdYL0w6YaeftsXhqSjrETzL4Xx+FiB8T6u+AfAtNgfCl4 c=;
IronPort-SDR: JzTyXjksyBZWSniS25D62W9JNqjVH84Rzbwa+L+c7PE1Yun01SktzpDaZXuBD8xgtiBxpafa4v
 JvU4DXtqy59Q==
X-IronPort-AV: E=Sophos;i="5.69,338,1571702400"; 
   d="scan'208";a="6537283"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Dec 2019 12:28:50 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 06F70C13C7; Sat, 21 Dec 2019 12:28:47 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:28:47 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:28:46 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Sat, 21 Dec 2019 12:28:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 4/4] x86: move viridian_guest_os_id_msr to hyperv-tlfs.h
Thread-Index: AQHVt28DnOzUBqBlPkagYtKYPKgPcafEhV7w
Date: Sat, 21 Dec 2019 12:28:45 +0000
Message-ID: <8f0b675908da4480b2b6ce674ef30591@EX13D32EUC003.ant.amazon.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
 <20191220195135.20130-5-liuwe@microsoft.com>
In-Reply-To: <20191220195135.20130-5-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.67]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 4/4] x86: move viridian_guest_os_id_msr to
 hyperv-tlfs.h
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
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggNC80XSB4ODY6IG1vdmUgdmlyaWRpYW5f
Z3Vlc3Rfb3NfaWRfbXNyIHRvIGh5cGVydi10bGZzLmgKPiAKPiBTdWdnZXN0ZWQtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxs
aXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4u
b3JnPgoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJpZGlhbi5jICAgIHwg
IDIgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtdGxmcy5oIHwgMTMgKysr
KysrKysrKysrKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oICAgICAgfCAx
OCArKystLS0tLS0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJp
ZGlhbi92aXJpZGlhbi5jCj4gYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMK
PiBpbmRleCAzNDE1OTJmMDU0Li40NGM4ZTZjYWM2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRp
YW4vdmlyaWRpYW4uYwo+IEBAIC0yMTgsNyArMjE4LDcgQEAgdm9pZCBjcHVpZF92aXJpZGlhbl9s
ZWF2ZXMoY29uc3Qgc3RydWN0IHZjcHUgKnYsCj4gdWludDMyX3QgbGVhZiwKPiAKPiAgc3RhdGlj
IHZvaWQgZHVtcF9ndWVzdF9vc19pZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICB7Cj4gLSAg
ICBjb25zdCB1bmlvbiB2aXJpZGlhbl9ndWVzdF9vc19pZF9tc3IgKmdvaTsKPiArICAgIGNvbnN0
IHVuaW9uIGh2X2d1ZXN0X29zX2lkICpnb2k7Cj4gCj4gICAgICBnb2kgPSAmZC0+YXJjaC5odm0u
dmlyaWRpYW4tPmd1ZXN0X29zX2lkOwo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi10bGZzLmggYi94ZW4vaW5jbHVkZS9hc20tCj4geDg2L2d1ZXN0L2h5
cGVydi10bGZzLmgKPiBpbmRleCBiMTI4ODA3YjJjLi40NDAyODU0YzgwIDEwMDY0NAo+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+IEBAIC0zMjcsNiArMzI3LDE5IEBAIHN0
cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2Ugewo+ICAgKi8KPiAKPiAgI2RlZmluZSBIVl9MSU5VWF9W
RU5ET1JfSUQgICAgICAgICAgICAgIDB4ODEwMAo+ICt1bmlvbiBodl9ndWVzdF9vc19pZAo+ICt7
Cj4gKyAgICB1aW50NjRfdCByYXc7Cj4gKyAgICBzdHJ1Y3QKPiArICAgIHsKPiArICAgICAgICB1
aW50NjRfdCBidWlsZF9udW1iZXI6MTY7Cj4gKyAgICAgICAgdWludDY0X3Qgc2VydmljZV9wYWNr
Ojg7Cj4gKyAgICAgICAgdWludDY0X3QgbWlub3I6ODsKPiArICAgICAgICB1aW50NjRfdCBtYWpv
cjo4Owo+ICsgICAgICAgIHVpbnQ2NF90IG9zOjg7Cj4gKyAgICAgICAgdWludDY0X3QgdmVuZG9y
OjE2Owo+ICsgICAgfTsKPiArfTsKPiAKPiAgc3RydWN0IGh2X3JlZW5saWdodGVubWVudF9jb250
cm9sIHsKPiAgCV9fdTY0IHZlY3Rvcjo4Owo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92aXJpZGlhbi5oIGIveGVuL2luY2x1ZGUvYXNtLQo+IHg4Ni9odm0vdmlyaWRpYW4u
aAo+IGluZGV4IDAxMGM4YjU4ZDQuLmNmYmFlZGUxNTggMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L3ZpcmlkaWFuLmgKPiBAQCAtOSw2ICs5LDggQEAKPiAgI2lmbmRlZiBfX0FTTV9YODZfSFZNX1ZJ
UklESUFOX0hfXwo+ICAjZGVmaW5lIF9fQVNNX1g4Nl9IVk1fVklSSURJQU5fSF9fCj4gCj4gKyNp
bmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KPiArCj4gIHVuaW9uIHZpcmlkaWFuX3Bh
Z2VfbXNyCj4gIHsKPiAgICAgIHVpbnQ2NF90IHJhdzsKPiBAQCAtODMsMjAgKzg1LDYgQEAgc3Ry
dWN0IHZpcmlkaWFuX3ZjcHUKPiAgICAgIHVpbnQ2NF90IGNyYXNoX3BhcmFtWzVdOwo+ICB9Owo+
IAo+IC11bmlvbiB2aXJpZGlhbl9ndWVzdF9vc19pZF9tc3IKPiAtewo+IC0gICAgdWludDY0X3Qg
cmF3Owo+IC0gICAgc3RydWN0Cj4gLSAgICB7Cj4gLSAgICAgICAgdWludDY0X3QgYnVpbGRfbnVt
YmVyOjE2Owo+IC0gICAgICAgIHVpbnQ2NF90IHNlcnZpY2VfcGFjazo4Owo+IC0gICAgICAgIHVp
bnQ2NF90IG1pbm9yOjg7Cj4gLSAgICAgICAgdWludDY0X3QgbWFqb3I6ODsKPiAtICAgICAgICB1
aW50NjRfdCBvczo4Owo+IC0gICAgICAgIHVpbnQ2NF90IHZlbmRvcjoxNjsKPiAtICAgIH07Cj4g
LX07Cj4gLQo+ICBzdHJ1Y3QgdmlyaWRpYW5fdGltZV9yZWZfY291bnQKPiAgewo+ICAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsKPiBAQCAtMTEyLDcgKzEwMCw3IEBAIHN0cnVjdCB2aXJpZGlhbl90
aW1lX3JlZl9jb3VudAo+IAo+ICBzdHJ1Y3QgdmlyaWRpYW5fZG9tYWluCj4gIHsKPiAtICAgIHVu
aW9uIHZpcmlkaWFuX2d1ZXN0X29zX2lkX21zciBndWVzdF9vc19pZDsKPiArICAgIHVuaW9uIGh2
X2d1ZXN0X29zX2lkIGd1ZXN0X29zX2lkOwo+ICAgICAgdW5pb24gdmlyaWRpYW5fcGFnZV9tc3Ig
aHlwZXJjYWxsX2dwYTsKPiAgICAgIHN0cnVjdCB2aXJpZGlhbl90aW1lX3JlZl9jb3VudCB0aW1l
X3JlZl9jb3VudDsKPiAgICAgIHN0cnVjdCB2aXJpZGlhbl9wYWdlIHJlZmVyZW5jZV90c2M7Cj4g
LS0KPiAyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
