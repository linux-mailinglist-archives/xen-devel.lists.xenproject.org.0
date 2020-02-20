Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96919166393
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:57:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4p6a-0003PQ-AA; Thu, 20 Feb 2020 16:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1oA1=4I=amazon.co.uk=prvs=31285a090=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4p6Y-0003PC-3V
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:55:14 +0000
X-Inumbo-ID: c3673f4a-5401-11ea-ade5-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3673f4a-5401-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582217714; x=1613753714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4H0r+y8kzRmHxi6F2BqVsXT1sAt/OmFJjrOftYKtGk0=;
 b=UyMRfA0CJB2amzNPGOl6o+xXsL2R4gUUE/msR8vkeuZhCBcDW8plv6CV
 FHaN8PZxbnKk6W+M+qVLRKvPDJeO0TvW1NqSFFCEa/U3Ab8zrJusBym9i
 B07TR9QolYeJ9FjWw6C8Rlv+Z0Wwz2gLwrtqulxSedrd4nYhQMow4eJCk 0=;
IronPort-SDR: 9ZCvdAX3HpF8WShyfvXXKR4pSOS2+tikesUIBsVjlQqxHtJRmv1CojPRvm109LzSi5bwUMNZ7Z
 INpdj03KhFrg==
X-IronPort-AV: E=Sophos;i="5.70,465,1574121600"; d="scan'208";a="18128383"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 20 Feb 2020 16:54:56 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id A5BCCA1D71; Thu, 20 Feb 2020 16:54:55 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 20 Feb 2020 16:54:55 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 20 Feb 2020 16:54:54 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 20 Feb 2020 16:54:54 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v6 1/6] libxl: add infrastructure to track and query
 'recent' domids
Thread-Index: AQHV5whH/A5OKxVwJ0SYawsGv+DygagkRQuAgAABHeCAAAYmgIAAASZw
Date: Thu, 20 Feb 2020 16:54:54 +0000
Message-ID: <5dfcf708db764fd1bb970cae54321c9a@EX13D32EUC003.ant.amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-2-pdurrant@amazon.com>
 <24142.45469.349140.521462@mariner.uk.xensource.com>
 <46a3c93352de4e07b33263c9fb7f37bf@EX13D32EUC003.ant.amazon.com>
 <24142.47029.435605.456811@mariner.uk.xensource.com>
In-Reply-To: <24142.47029.435605.456811@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v6 1/6] libxl: add infrastructure to track
 and query 'recent' domids
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDIwIEZlYnJ1YXJ5IDIwMjAgMTY6NDYKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZAo+IDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjYgMS82XSBs
aWJ4bDogYWRkIGluZnJhc3RydWN0dXJlIHRvIHRyYWNrIGFuZCBxdWVyeQo+ICdyZWNlbnQnIGRv
bWlkcwo+IAo+IER1cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtQQVRDSCB2NiAxLzZdIGxpYnhs
OiBhZGQgaW5mcmFzdHJ1Y3R1cmUgdG8KPiB0cmFjayBhbmQgcXVlcnkgJ3JlY2VudCcgZG9taWRz
Iik6Cj4gPiBbSWFuOl0KPiA+ID4gSU1PIHRoZSByZXVzZSB0aW1lb3V0IGNhbGwgYW5kIHRoZSBj
bG9ja19nZXR0aW1lIGNhbGwgc2hvdWxkIGJlIHB1dCBpbgo+ID4gPiBsaWJ4bF9fb3Blbl9kb21p
ZF9oaXN0b3J5OyBhbmQgdGhlIHRpbWUgZmlsdGVyaW5nIGNoZWNrIHNob3VsZCBiZQo+ID4gPiBm
b2xkZWQgaW50byBsaWJ4bF9fcmVhZF9yZWNlbnQuCj4gPgo+ID4gT2suIEkgd2FzIGhhdmluZyBh
IGhhcmQgdGltZSBndWVzc2luZyBqdXN0IGV4YWN0bHkgd2hhdCB5b3UncmUgbG9va2luZwo+IGZv
ci4gSSB0aGluayB0aGF0IG1ha2VzIGl0IGEgbGl0dGxlIGNsZWFyZXIuCj4gLi4uCj4gPiA+IElu
IG15IHJldmlldyBvZiB2NCBJIHdyb3RlOgo+ID4gPgo+ID4gPiAgIERvIHlvdSB0aGluayB0aGlz
IGNhbiBiZSBjb21iaW5lZCBzb21laG93ID8gIFBvc3NpYmlsaXRpZXMgc2VlbSB0bwo+ID4gPiAg
IGluY2x1ZGU6IGV4cGxpY2l0IHJlYWRfcmVjZW50X3tpbml0LGVudHJ5LGZpbmlzaH0gZnVuY3Rp
b25zOyBhCj4gc2luZ2xlCj4gPiA+ICAgZnVuY3Rpb24gd2l0aCBhICJwZXItZW50cnkiIGNhbGxi
YWNrOyBzYW1lIGJ1dCB3aXRoIGEgbWFjcm8uICBJZiB5b3UKPiA+ID4gICBkbyB0aGF0IHlvdSBj
YW4gYWxzbyBoYXZlIGl0IGhhdmUgaGFuZGxlIHRoZSAiZmlsZSBkb2VzIG5vdCBleGlzdCIKPiA+
ID4gICBzcGVjaWFsIGNhc2UuCj4gPiA+Cj4gPiA+IFlvdSd2ZSBwcm92aWRlZCB0aGUgcmVhZF9y
ZWNlbnRfZW50cnkgZnVuY3Rpb24gYnV0IHRoZSAiaW5pdCIgZnVuY3Rpb24KPiA+ID4gbGlieGxf
X29wZW5fZG9taWRfaGlzdG9yeSBkb2VzIHRvbyBsaXR0bGUuICBUaGlzIHNlcmllcyBzZWVtcyB0
byBiZQo+ID4gPiBtb3ZpbmcgdG93YXJkcyB3aGF0IEkgY2FsbGVkIHJlYWRfcmVjZW50X3tpbml0
LGVudHJ5LGZpbmlzaH0gKHdoaWNoCj4gPiA+IHNob3VsZCBwcm9iYWJseSBoYXZlIHRoZSB0aW1l
c3RhbXAgYW5kIEZJTEUqIGluIGEgc3RydWN0IHRvZ2V0aGVyKSBidXQKPiA+ID4gaXQgc2VlbXMg
dG8gYmUgZG9pbmcgc28gcXVpdGUgc2xvd2x5Lgo+ID4KPiA+IE5vdyBhZ2FpbiBJJ20gbm90IHN1
cmUgKmV4YWN0bHkqIHdoYXQgeW91IHdhbnQgbWUgdG8gZG8sIGJ1dCBJJ2xsIGhhdmUKPiBhbm90
aGVyIGd1ZXNzLgo+IAo+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRlciBmb3IgdXMgdG8gdHJ5IHRv
IGNvbWUgdG8gYSBzaGFyZWQKPiB1bmRlcnN0YW5kaW5nIGJlZm9yZSB5b3UgZG8gYW5vdGhlciBy
ZXNwaW4uLi4KPiAKCk5vdCBiZWluZyBjby1sb2NhdGVkIG1ha2VzIHRoaXMgc29tZXdoYXQgdHJp
Y2t5OyBJIHRoaW5rIGl0IHdpbGwgYmFzaWNhbGx5IHN0aWxsIGNvbWUgZG93biB0byBtZSB3cml0
aW5nIHNvbWUgY29kZSBhbmQgdGhlbiB5b3Ugc2F5aW5nIHdoZXRoZXIgdGhhdCdzIHdoYXQgeW91
IG1lYW50Li4uIHVubGVzcyB5b3UgY2FuIHdyaXRlIHNvbWUgKHBzZXVkby0pY29kZSB0byBpbGx1
c3RyYXRlPyBJIHRoaW5rLCBmcm9tIHdoYXQgeW91IHNheSBiZWxvdywgSSBtaWdodCBub3cgaGF2
ZSBhIGJldHRlciBpZGVhIG9mIHdoYXQgeW91IHdhbnQgc28gbGV0J3MgaGF2ZSBvbmUgbW9yZSBn
by1hcm91bmQgb2YgbWUgd3JpdGluZyB0aGUgY29kZSBmaXJzdCA6LSkKCj4gPiA+ICAtIEl0IGVu
Y291cmFnZXMgdmFjdW91cyBsb2cgbWVzc2FnZXMgd2hvc2UgY29udGVudCBpcyBtYWlubHkgaW4g
dGhlCj4gPiA+ICAgIGZ1bmN0aW9uIGFuZCBsaW5lIG51bWJlciBmcmFtaW5nOgo+ID4gPiAgICAg
ICAgKyAgICBMT0dFKEVSUk9SLCAiZmFpbGVkIik7Cj4gPiA+ICAgICAgICArICAgIHJldHVybiBF
UlJPUl9GQUlMOwo+ID4gPiAgICAgICAgK30KPiA+ID4gICAgcmF0aGVyIHRoYW4KPiA+ID4gICAg
ICAgIGlmICghKmYpIHsKPiA+ID4gICAgICAgICAgICBMT0dFKEVSUk9SLCAiZmFpbGVkIHRvIG9w
ZW4gcmVjZW50IGRvbWlkIGZpbGUgYCVzJyIsIHBhdGgpOwo+ID4gPiAgICAgICAgICAgIHJjID0g
RVJST1JfRkFJTDsKPiA+ID4gICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gICAgICAgIH0KPiA+
ID4gICAgKGFuZCB0aGUgbGF0dGVyIGlzIHRvIGJlIHByZWZlcnJlZCkuCj4gPgo+ID4gQnV0IGJ5
IGFza2luZyBtZSB0byBwdXQgdGhlIGVycm9yIGhhbmRsaW5nIGluc2lkZSB0aGUgc3ViLWZ1bmN0
aW9ucyBJCj4gbG9zdCBjb250ZXh0IHN1Y2ggYXMgJ3BhdGgnIHdoaWNoIHdhcyBwcmVzZW50IGlu
IHRoZSBwcmV2aW91cyBzdHJ1Y3R1cmUuIEkKPiBjb3VsZCBwYXNzIGluIGFuIGFyZ3VtZW50IHB1
cmVseSBmb3IgdGhlIGJlbmVmaXQgb2YgYSBsb2cgZnVuY3Rpb24gYnV0Cj4gdGhhdCBzZWVtcyBl
eGNlc3NpdmUuIEkgZ3Vlc3MgSSB3aWxsIHB1bGwgdGhlIGVycm9yIGxvZ2dpbmcgb3V0IGFnYWlu
LCBidXQKPiB0aGF0IHNlZW1lZCB0byBiZSBhZ2FpbnN0IHlvdXIgcmVxdWlyZW1lbnQgdG8gZGUt
ZHVwbGljYXRlIGNvZGUuCj4gCj4gSSB0aGluayB0aGUgcGF0aCBuZWVkcyB0byBiZSBwYXNzZWQg
aW50byB0aGVzZSBmdW5jdGlvbnMuICBUaGlzIGlzIHdoeQo+IEkgdGhpbmsgdGhlIGZ1bmN0aW9u
cyBuZWVkIHRvIHRha2UgYSBzdHJ1Y3QqIGFzIGFuIGFyZ3VtZW50LCBmb3IgdGhlaXIKPiBzaGFy
ZWQgc3RhdGUgKGluY2x1ZGluZyB0aGUgcGF0aCBhbmQgdGhlIG90aGVyIHN0dWZmKS4KPiAKCk9r
LCBpZiB0aGF0J3MgdGhlIHN0eWxlIHlvdSBwcmVmZXIgSSdsbCByZS1zdHJ1Y3R1cmUgaXQgdGhh
dCB3YXkuCgogIFBhdWwKCj4gVGhhbmtzLAo+IElhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
