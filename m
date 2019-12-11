Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AE11AC14
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 14:31:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if221-0006cl-IP; Wed, 11 Dec 2019 13:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1if220-0006cg-AB
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 13:27:56 +0000
X-Inumbo-ID: 0a1c7c40-1c1a-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a1c7c40-1c1a-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576070876; x=1607606876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h+I/y/hh9mwvZsFHkPrp9BUaspgjanOcRaLt/gZS7Bg=;
 b=FYEWyoM+f3uhNPNW0h1Uj61QAcWu0cBqthRfUgpY0lqgI1kqyyV4QMkv
 K/Phks2RyanpfQCnHjO988gDs6po6G52Ugjgc5siw2imiMTl3CGUZWZF/
 bhfuR8wMBx/ql870qjXY0uouiDFYD8ArP2rfrUZvOTxR/0lpEudVq2j2f w=;
IronPort-SDR: +VTCyzX9vkW91tHUamk0YAMMjD2t7eWWg8g93kHcyiUGd7wEHyZe4WkwqcWTOLYkmnEP3EOxaa
 QvHqB+wJne2Q==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="4494221"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-e7be2041.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 11 Dec 2019 13:27:45 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-e7be2041.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3270DA2473; Wed, 11 Dec 2019 13:27:44 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 13:27:43 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 13:27:43 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 13:27:42 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [PATCH] xen-blkback: prevent premature module unload
Thread-Index: AQHVr2mJT7izwmimDUiZW3emm6kz0qe0zXcAgAAhBkA=
Date: Wed, 11 Dec 2019 13:27:42 +0000
Message-ID: <14a01d62046c48ee9b2486917370b5f5@EX13D32EUC003.ant.amazon.com>
References: <20191210145305.6605-1-pdurrant@amazon.com>
 <20191211112754.GM980@Air-de-Roger>
In-Reply-To: <20191211112754.GM980@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.172]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] xen-blkback: prevent premature module unload
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTE6MjkKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47Cj4gSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIHhlbi1ibGtiYWNrOiBwcmV2ZW50IHByZW1hdHVyZSBtb2R1bGUgdW5sb2FkCj4g
Cj4gT24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDI6NTM6MDVQTSArMDAwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4gT2JqZWN0cyBhbGxvY2F0ZWQgYnkgeGVuX2Jsa2lmX2FsbG9jIGNvbWUgZnJv
bSB0aGUgJ2Jsa2lmX2NhY2hlJyBrbWVtCj4gPiBjYWNoZS4gVGhpcyBjYWNoZSBpcyBkZXN0b3ll
ZCB3aGVuIHhlbi1ibGtpZiBpcyB1bmxvYWRlZCBzbyBpdCBpcwo+ID4gbmVjZXNzYXJ5IHRvIHdh
aXQgZm9yIHRoZSBkZWZlcnJlZCBmcmVlIHJvdXRpbmUgdXNlZCBmb3Igc3VjaCBvYmplY3RzIHRv
Cj4gPiBjb21wbGV0ZS4gVGhpcyBuZWNlc3NpdHkgd2FzIG1pc3NlZCBpbiBjb21taXQgMTQ4NTU5
NTRmNjM2ICJ4ZW4tYmxrYmFjazoKPiA+IGFsbG93IG1vZHVsZSB0byBiZSBjbGVhbmx5IHVubG9h
ZGVkIi4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieQo+ID4gdGFraW5nL3JlbGVhc2lu
ZyBleHRyYSBtb2R1bGUgcmVmZXJlbmNlcyBpbiB4ZW5fYmxraWZfYWxsb2MvZnJlZSgpCj4gPiBy
ZXNwZWN0aXZlbHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFu
dEBhbWF6b24uY29tPgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiAKPiBPbmUgbml0IGJlbG93Lgo+IAo+ID4gLS0tCj4gPiBDYzogS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+ID4gQ2M6ICJSb2dl
ciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBDYzogSmVucyBBeGJvZSA8
YXhib2VAa2VybmVsLmRrPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94
ZW5idXMuYyB8IDEwICsrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1
cy5jIGIvZHJpdmVycy9ibG9jay94ZW4tCj4gYmxrYmFjay94ZW5idXMuYwo+ID4gaW5kZXggZThj
NWM1NGUxZDI2Li41OWQ1NzZkMjdjYTcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtiYWNrL3hlbmJ1cy5jCj4gPiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCj4gPiBAQCAtMTcxLDYgKzE3MSwxNSBAQCBzdGF0aWMgc3RydWN0IHhlbl9ibGtpZiAq
eGVuX2Jsa2lmX2FsbG9jKGRvbWlkX3QKPiBkb21pZCkKPiA+ICAJYmxraWYtPmRvbWlkID0gZG9t
aWQ7Cj4gPiAgCWF0b21pY19zZXQoJmJsa2lmLT5yZWZjbnQsIDEpOwo+ID4gIAlpbml0X2NvbXBs
ZXRpb24oJmJsa2lmLT5kcmFpbl9jb21wbGV0ZSk7Cj4gPiArCj4gPiArCS8qCj4gPiArCSAqIEJl
Y2F1c2UgZnJlZWluZyBiYWNrIHRvIHRoZSBjYWNoZSBtYXkgYmUgZGVmZXJyZWQsIGl0IGlzIG5v
dAo+ID4gKwkgKiBzYWZlIHRvIHVubG9hZCB0aGUgbW9kdWxlIChhbmQgaGVuY2UgZGVzdHJveSB0
aGUgY2FjaGUpIHVudGlsCj4gPiArCSAqIHRoaXMgaGFzIGNvbXBsZXRlZC4gVG8gcHJldmVudCBw
cmVtYXR1cmUgdW5sb2FkaW5nLCB0YWtlIGFuCj4gPiArCSAqIGV4dHJhIG1vZHVsZSByZWZlcmVu
Y2UgaGVyZSBhbmQgcmVsZWFzZSBvbmx5IHdoZW4gdGhlIG9iamVjdAo+ID4gKwkgKiBoYXMgYmVl
biBmcmVlIGJhY2sgdG8gdGhlIGNhY2hlLgo+ICAgICAgICAgICAgICAgICAgICAgXiBmcmVlZAoK
T2ggeWVzLiBDYW4gdGhpcyBiZSBkb25lIG9uIGNvbW1pdCwgb3Igd291bGQgeW91IGxpa2UgbWUg
dG8gc2VuZCBhIHYyPwoKICBQYXVsCgo+ID4gKwkgKi8KPiA+ICsJX19tb2R1bGVfZ2V0KFRISVNf
TU9EVUxFKTsKPiA+ICAJSU5JVF9XT1JLKCZibGtpZi0+ZnJlZV93b3JrLCB4ZW5fYmxraWZfZGVm
ZXJyZWRfZnJlZSk7Cj4gPgo+ID4gIAlyZXR1cm4gYmxraWY7Cj4gPiBAQCAtMzIwLDYgKzMyOSw3
IEBAIHN0YXRpYyB2b2lkIHhlbl9ibGtpZl9mcmVlKHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmKQo+
ID4KPiA+ICAJLyogTWFrZSBzdXJlIGV2ZXJ5dGhpbmcgaXMgZHJhaW5lZCBiZWZvcmUgc2h1dHRp
bmcgZG93biAqLwo+ID4gIAlrbWVtX2NhY2hlX2ZyZWUoeGVuX2Jsa2lmX2NhY2hlcCwgYmxraWYp
Owo+ID4gKwltb2R1bGVfcHV0KFRISVNfTU9EVUxFKTsKPiA+ICB9Cj4gPgo+ID4gIGludCBfX2lu
aXQgeGVuX2Jsa2lmX2ludGVyZmFjZV9pbml0KHZvaWQpCj4gPiAtLQo+ID4gMi4yMC4xCj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
