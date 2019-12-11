Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F111ACAC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 15:00:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if2VB-0000q8-3X; Wed, 11 Dec 2019 13:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1if2V9-0000px-4y
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 13:58:03 +0000
X-Inumbo-ID: 3f2766bc-1c1e-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f2766bc-1c1e-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 13:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576072682; x=1607608682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W8TTi/2IIEXbPsGUA9DEIj5AQ0RHJuHWIGTOmHVUQus=;
 b=pLF6+ECJZtqBNaM3K4bnY13fxpzUOh5lElBDTq3fONH549VhWM+TCnnT
 bfZwXkHHtcF0/gkTHM5Vf3T9l72Pfpfj1PzVuslTpe+jnCAHj4B73wQSI
 8+MsXA0gQW++m9t1xTOtCDJYBuh9saAvI2sGrOE4ZdkQjyV+rp/ghZGvg o=;
IronPort-SDR: mkmquFRZdQ8fhag+H0SlzhM9qj48wmtmu0VhkeL9obp3+XTB70l/s1tnfYtMUyjId7XwSWkwiv
 Nb2KZPkVlIvA==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; 
   d="scan'208";a="4498934"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 11 Dec 2019 13:57:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 38FCAA2707; Wed, 11 Dec 2019 13:57:44 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 13:57:43 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 13:57:42 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 13:57:42 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
 <jgross@suse.com>
Thread-Topic: [PATCH] xen-blkback: prevent premature module unload
Thread-Index: AQHVr2mJT7izwmimDUiZW3emm6kz0qe0zXcAgAAhBkCAAAfzgIAAAGuQ
Date: Wed, 11 Dec 2019 13:57:42 +0000
Message-ID: <4c9a0d81d0634f27a41fe10c8d93a4ea@EX13D32EUC003.ant.amazon.com>
References: <20191210145305.6605-1-pdurrant@amazon.com>
 <20191211112754.GM980@Air-de-Roger>
 <14a01d62046c48ee9b2486917370b5f5@EX13D32EUC003.ant.amazon.com>
 <20191211135523.GP980@Air-de-Roger>
In-Reply-To: <20191211135523.GP980@Air-de-Roger>
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
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTM6NTUKPiBUbzog
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvbT47IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBsaW51eC1i
bG9ja0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47Cj4gSmVucyBBeGJv
ZSA8YXhib2VAa2VybmVsLmRrPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi1ibGtiYWNrOiBw
cmV2ZW50IHByZW1hdHVyZSBtb2R1bGUgdW5sb2FkCj4gCj4gT24gV2VkLCBEZWMgMTEsIDIwMTkg
YXQgMDE6Mjc6NDJQTSArMDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gPiA+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTE6MjkKPiA+ID4gVG86
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gPiA+IENjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZzsKPiBsaW51
eC0KPiA+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCj4g
PGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Owo+ID4gPiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhlbi1ibGtiYWNrOiBwcmV2ZW50IHByZW1h
dHVyZSBtb2R1bGUgdW5sb2FkCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0IDAy
OjUzOjA1UE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiBPYmplY3RzIGFsbG9j
YXRlZCBieSB4ZW5fYmxraWZfYWxsb2MgY29tZSBmcm9tIHRoZSAnYmxraWZfY2FjaGUnCj4ga21l
bQo+ID4gPiA+IGNhY2hlLiBUaGlzIGNhY2hlIGlzIGRlc3RveWVkIHdoZW4geGVuLWJsa2lmIGlz
IHVubG9hZGVkIHNvIGl0IGlzCj4gPiA+ID4gbmVjZXNzYXJ5IHRvIHdhaXQgZm9yIHRoZSBkZWZl
cnJlZCBmcmVlIHJvdXRpbmUgdXNlZCBmb3Igc3VjaAo+IG9iamVjdHMgdG8KPiA+ID4gPiBjb21w
bGV0ZS4gVGhpcyBuZWNlc3NpdHkgd2FzIG1pc3NlZCBpbiBjb21taXQgMTQ4NTU5NTRmNjM2ICJ4
ZW4tCj4gYmxrYmFjazoKPiA+ID4gPiBhbGxvdyBtb2R1bGUgdG8gYmUgY2xlYW5seSB1bmxvYWRl
ZCIuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0KPiBieQo+ID4gPiA+IHRha2luZy9yZWxl
YXNpbmcgZXh0cmEgbW9kdWxlIHJlZmVyZW5jZXMgaW4geGVuX2Jsa2lmX2FsbG9jL2ZyZWUoKQo+
ID4gPiA+IHJlc3BlY3RpdmVseS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPgo+ID4gPiBPbmUgbml0
IGJlbG93Lgo+ID4gPgo+ID4gPiA+IC0tLQo+ID4gPiA+IENjOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gPiA+ID4gQ2M6ICJSb2dlciBQYXUgTW9ubsOp
IiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtl
cm5lbC5kaz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94
ZW5idXMuYyB8IDEwICsrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9jay94ZW4tCj4gPiA+IGJsa2JhY2sveGVuYnVz
LmMKPiA+ID4gPiBpbmRleCBlOGM1YzU0ZTFkMjYuLjU5ZDU3NmQyN2NhNyAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCj4gPiA+ID4gKysrIGIv
ZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+ID4gPiA+IEBAIC0xNzEsNiArMTcx
LDE1IEBAIHN0YXRpYyBzdHJ1Y3QgeGVuX2Jsa2lmCj4gKnhlbl9ibGtpZl9hbGxvYyhkb21pZF90
Cj4gPiA+IGRvbWlkKQo+ID4gPiA+ICAJYmxraWYtPmRvbWlkID0gZG9taWQ7Cj4gPiA+ID4gIAlh
dG9taWNfc2V0KCZibGtpZi0+cmVmY250LCAxKTsKPiA+ID4gPiAgCWluaXRfY29tcGxldGlvbigm
YmxraWYtPmRyYWluX2NvbXBsZXRlKTsKPiA+ID4gPiArCj4gPiA+ID4gKwkvKgo+ID4gPiA+ICsJ
ICogQmVjYXVzZSBmcmVlaW5nIGJhY2sgdG8gdGhlIGNhY2hlIG1heSBiZSBkZWZlcnJlZCwgaXQg
aXMKPiBub3QKPiA+ID4gPiArCSAqIHNhZmUgdG8gdW5sb2FkIHRoZSBtb2R1bGUgKGFuZCBoZW5j
ZSBkZXN0cm95IHRoZSBjYWNoZSkKPiB1bnRpbAo+ID4gPiA+ICsJICogdGhpcyBoYXMgY29tcGxl
dGVkLiBUbyBwcmV2ZW50IHByZW1hdHVyZSB1bmxvYWRpbmcsIHRha2UgYW4KPiA+ID4gPiArCSAq
IGV4dHJhIG1vZHVsZSByZWZlcmVuY2UgaGVyZSBhbmQgcmVsZWFzZSBvbmx5IHdoZW4gdGhlCj4g
b2JqZWN0Cj4gPiA+ID4gKwkgKiBoYXMgYmVlbiBmcmVlIGJhY2sgdG8gdGhlIGNhY2hlLgo+ID4g
PiAgICAgICAgICAgICAgICAgICAgIF4gZnJlZWQKPiA+Cj4gPiBPaCB5ZXMuIENhbiB0aGlzIGJl
IGRvbmUgb24gY29tbWl0LCBvciB3b3VsZCB5b3UgbGlrZSBtZSB0byBzZW5kIGEgdjI/Cj4gCj4g
QWRqdXN0aW5nIG9uIGNvbW1pdCB3b3VsZCBiZSBmaW5lIGZvciBtZSwgYnV0IGl0J3MgdXAgdG8g
SnVlcmdlbiBzaW5jZQo+IGhlIGlzIHRoZSBvbmUgdGhhdCB3aWxsIHBpY2sgdGhpcyB1cC4gSUlS
QyB0aGUgbW9kdWxlIHVubG9hZCBwYXRjaGVzCj4gZGlkbid0IGdvIHRocm91Z2ggdGhlIGJsb2Nr
IHN1YnN5c3RlbS4KClRydWUuIEkgZm9yZ290IG1hbnVhbGx5IGFkZCBKdWVyZ2VuIGNjIGxpc3Qu
CgogIFBhdWwKCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
