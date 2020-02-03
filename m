Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A016150536
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:26:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZpx-0002QP-Cq; Mon, 03 Feb 2020 11:24:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZpv-0002QK-UR
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:24:15 +0000
X-Inumbo-ID: b55d749c-4677-11ea-ad98-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b55d749c-4677-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580729055; x=1612265055;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y0cOIpSvchh5T1uKxXTa2R37bOltB27sDDp/Np59MI4=;
 b=esnpHEL04WObtPfcIlxQnCtQSAgGWuy2y5xtGVP+y7xu8iWVWKfxdP3b
 D4rc2I7L3ZLalL/qGnwy91KAY2iJw0ImgHlXekoJe1XdhTqyNrTW9H8qk
 FwqtOyTjZO/FxwHpT3ekfQz0W6w6og23boKkmLcLjVS4LY2JImy9zNq7o E=;
IronPort-SDR: Py/co+GtxAuEYD2R/p63ZSWW4+KjTS5L3Xla2Rm22MmYO7hoAh3k10UeYhbZxn51U6iOoiqC7b
 tz++27KL05aA==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="24022059"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Feb 2020 11:24:14 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1EB12A1D9D; Mon,  3 Feb 2020 11:24:10 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 11:24:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 11:24:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 11:24:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v6 10/11] x86: move viridian_page_msr to hyperv-tlfs.h
Thread-Index: AQHV2F7jZHIa5RPnxUOT/e/+R8bnlqgJWBCA
Date: Mon, 3 Feb 2020 11:24:09 +0000
Message-ID: <ce4c1c2b8f1841128eb24a2b31ab71de@EX13D32EUC003.ant.amazon.com>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-11-liuwe@microsoft.com>
In-Reply-To: <20200131174930.31045-11-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 10/11] x86: move viridian_page_msr to
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAzMSBKYW51YXJ5IDIwMjAg
MTc6NDkKPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZz4KPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWlj
aGFlbCBLZWxsZXkKPiA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+OyBXZWkgTGl1Cj4gPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFU
Q0ggdjYgMTAvMTFdIHg4NjogbW92ZSB2aXJpZGlhbl9wYWdlX21zciB0byBoeXBlcnYtdGxmcy5o
Cj4gCj4gQW5kIHJlbmFtZSBpdCB0byBodl92cF9hc3Npc3RfcGFnZV9tc3IuCj4gCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+
Cgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMgICAgfCAgMiAr
LQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmggfCAxMSArKysrKysr
KysrKwo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oICAgICAgfCAxNSArKy0t
LS0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJp
ZGlhbi5jCj4gYi94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMKPiBpbmRleCA0
NGM4ZTZjYWM2Li45YTZjYWZjYjYyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmly
aWRpYW4vdmlyaWRpYW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRp
YW4uYwo+IEBAIC0yMzAsNyArMjMwLDcgQEAgc3RhdGljIHZvaWQgZHVtcF9ndWVzdF9vc19pZChj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+IAo+ICBzdGF0aWMgdm9pZCBkdW1wX2h5cGVyY2FsbChj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+ICB7Cj4gLSAgICBjb25zdCB1bmlvbiB2aXJpZGlhbl9w
YWdlX21zciAqaGc7Cj4gKyAgICBjb25zdCB1bmlvbiBodl92cF9hc3Npc3RfcGFnZV9tc3IgKmhn
Owo+IAo+ICAgICAgaGcgPSAmZC0+YXJjaC5odm0udmlyaWRpYW4tPmh5cGVyY2FsbF9ncGE7Cj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCBi
L3hlbi9pbmNsdWRlL2FzbS0KPiB4ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaAo+IGluZGV4IDA3ZGI1
N2I1NWYuLjBhMGYzMzk4YzEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVz
dC9oeXBlcnYtdGxmcy5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYt
dGxmcy5oCj4gQEAgLTU1OCw2ICs1NTgsMTcgQEAgc3RydWN0IGh2X25lc3RlZF9lbmxpZ2h0ZW5t
ZW50c19jb250cm9sIHsKPiAgCX0gaHlwZXJjYWxsQ29udHJvbHM7Cj4gIH07Cj4gCj4gK3VuaW9u
IGh2X3ZwX2Fzc2lzdF9wYWdlX21zcgo+ICt7Cj4gKyAgICB1aW50NjRfdCByYXc7Cj4gKyAgICBz
dHJ1Y3QKPiArICAgIHsKPiArICAgICAgICB1aW50NjRfdCBlbmFibGVkOjE7Cj4gKyAgICAgICAg
dWludDY0X3QgcmVzZXJ2ZWRfcHJlc2VydmVkOjExOwo+ICsgICAgICAgIHVpbnQ2NF90IHBmbjo0
ODsKPiArICAgIH07Cj4gK307Cj4gKwo+ICAvKiBEZWZpbmUgdmlydHVhbCBwcm9jZXNzb3IgYXNz
aXN0IHBhZ2Ugc3RydWN0dXJlLiAqLwo+ICBzdHJ1Y3QgaHZfdnBfYXNzaXN0X3BhZ2Ugewo+ICAJ
X191MzIgYXBpY19hc3Npc3Q7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L3ZpcmlkaWFuLmggYi94ZW4vaW5jbHVkZS9hc20tCj4geDg2L2h2bS92aXJpZGlhbi5oCj4gaW5k
ZXggZDkxMzg1NjJlNi4uODQ0ZTU2YjM4ZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS92aXJpZGlhbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRp
YW4uaAo+IEBAIC0xMSwyMCArMTEsOSBAQAo+IAo+ICAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVy
di10bGZzLmg+Cj4gCj4gLXVuaW9uIHZpcmlkaWFuX3BhZ2VfbXNyCj4gLXsKPiAtICAgIHVpbnQ2
NF90IHJhdzsKPiAtICAgIHN0cnVjdAo+IC0gICAgewo+IC0gICAgICAgIHVpbnQ2NF90IGVuYWJs
ZWQ6MTsKPiAtICAgICAgICB1aW50NjRfdCByZXNlcnZlZF9wcmVzZXJ2ZWQ6MTE7Cj4gLSAgICAg
ICAgdWludDY0X3QgcGZuOjQ4Owo+IC0gICAgfTsKPiAtfTsKPiAtCj4gIHN0cnVjdCB2aXJpZGlh
bl9wYWdlCj4gIHsKPiAtICAgIHVuaW9uIHZpcmlkaWFuX3BhZ2VfbXNyIG1zcjsKPiArICAgIHVu
aW9uIGh2X3ZwX2Fzc2lzdF9wYWdlX21zciBtc3I7Cj4gICAgICB2b2lkICpwdHI7Cj4gIH07Cj4g
Cj4gQEAgLTcwLDcgKzU5LDcgQEAgc3RydWN0IHZpcmlkaWFuX3RpbWVfcmVmX2NvdW50Cj4gIHN0
cnVjdCB2aXJpZGlhbl9kb21haW4KPiAgewo+ICAgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgZ3Vl
c3Rfb3NfaWQ7Cj4gLSAgICB1bmlvbiB2aXJpZGlhbl9wYWdlX21zciBoeXBlcmNhbGxfZ3BhOwo+
ICsgICAgdW5pb24gaHZfdnBfYXNzaXN0X3BhZ2VfbXNyIGh5cGVyY2FsbF9ncGE7Cj4gICAgICBz
dHJ1Y3QgdmlyaWRpYW5fdGltZV9yZWZfY291bnQgdGltZV9yZWZfY291bnQ7Cj4gICAgICBzdHJ1
Y3QgdmlyaWRpYW5fcGFnZSByZWZlcmVuY2VfdHNjOwo+ICB9Owo+IC0tCj4gMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
