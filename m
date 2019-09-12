Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67453B11CD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Qdz-0007dF-Ma; Thu, 12 Sep 2019 15:04:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKPp=XH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8Qdy-0007dA-1W
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:04:22 +0000
X-Inumbo-ID: 990a4790-d56e-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 990a4790-d56e-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568300661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P9y4mGUz2FPs+zxXFkR0R4j+FyHZFChLpe8rygzqyCk=;
 b=XsIja6eORHt+FvvIv8xqkwdiqrjpXsG0UqMPsQaNczZTsJXfo+m5tftS
 CLYGQHDYCuvpcwVKlP+eQpKiM6QUduRL+8b1k6Dm/i8Q2CWe5uBmkeAm/
 NjJ4vMyYqxr+wFUnfwbL3VxIwdwW+jLEgVZIncm7APHSKzh8nkh7S4Upm 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n121mXLNCa+nBuytD9t0P9BVakJ6xOXNJQfKeUBouMQFV+IUljhRp1Df6igfBRQzqZMooT2RfN
 LKA1hSx8cjgZRJEeRD6c252zDntxocuQscGfEkUrT2r4OkGhgD78oLH9VYdoIKCi1MjhpRZYHc
 Nb5/vrsy1qc8q0s/WDVeiPgbWT33hf3MeZ7kiKA7RZ7OLsIJpkCUZx5/mQ0cdN7e9GP6gcLYuZ
 J6oUvSDrlGnKcoRb9TcmmjYBfEQY5pdWJVwKChHMiINzoHhCZgmZWwW73hPQ/ADXHEEuEsnA7q
 /fY=
X-SBRS: 2.7
X-MesageID: 5543206
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,497,1559534400"; 
   d="scan'208";a="5543206"
Date: Thu, 12 Sep 2019 16:04:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190912150417.GD1308@perard.uk.xensource.com>
References: <20190912121646.29148-1-paul.durrant@citrix.com>
 <20190912121646.29148-4-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912121646.29148-4-paul.durrant@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen: perform XenDevice clean-up in
 XenBus watch handler
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDE6MTY6NDZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IENsZWFuaW5nIHVwIG9mZmluZSBYZW5EZXZpY2Ugb2JqZWN0cyBkaXJlY3RseSBpbgog
ICAgICAgICAgICAgIF4gb2ZmbGluZQoKPiB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCgpIGlz
IGRhbmdlcm91cyBhcyB4ZW5fZGV2aWNlX3VucmVhbGl6ZSgpIHdpbGwKPiBtb2RpZnkgdGhlIHdh
dGNoIGxpc3QgdGhhdCBpcyBiZWluZyB3YWxrZWQuIEV2ZW4gdGhlIFFMSVNUX0ZPUkVBQ0hfU0FG
RSgpCj4gdXNlZCBpbiBub3RpZmllcl9saXN0X25vdGlmeSgpIGlzIGluc3VmZmljaWVudCBhcyAq
dHdvKiBub3RpZmllcnMgKGZvcgo+IHRoZSBmcm9udGVuZCBhbmQgYmFja2VuZCB3YXRjaGVzKSBh
cmUgcmVtb3ZlZCwgdGh1cyBwb3RlbnRpYWxseSByZW5kZXJpbmcKPiB0aGUgJ25leHQnIHBvaW50
ZXIgdW5zYWZlLgo+IAo+IFRoZSBzb2x1dGlvbiBpcyB0byB1c2UgdGhlIFhlbkJ1cyBiYWNrZW5k
X3dhdGNoIGhhbmRsZXIgdG8gZG8gdGhlIGNsZWFuLXVwCj4gaW5zdGVhZCwgYXMgaXQgaXMgaW52
b2tlZCB3aGlsc3Qgd2Fsa2luZyBhIHNlcGFyYXRlIHdhdGNoIGxpc3QuCj4gCj4gVGhpcyBwYXRj
aCB0aGVyZWZvcmUgYWRkcyBhIG5ldyAnb2ZmbGluZV9kZXZpY2VzJyBsaXN0IHRvIFhlbkJ1cywg
dG8gd2hpY2gKPiBvZmZsaW5lIGRldmljZXMgYXJlIGFkZGVkIGJ5IHhlbl9kZXZpY2VfYmFja2Vu
ZF9jaGFuZ2VkKCkuIFRoZSBYZW5CdXMKPiBiYWNrZW5kX3dhdGNoIHJlZ2lzdHJhdGlvbiBpcyBh
bHNvIGNoYW5nZWQgdG8gbm90IG9ubHkgaW52b2tlCj4geGVuX2J1c19lbnVtZXJhdGUoKSBidXQg
YWxzbyBhIG5ldyB4ZW5fYnVzX2NsZWFudXAoKSBmdW5jdGlvbiwgd2hpY2ggd2lsbAo+IHdhbGsg
J29mZmxpbmVfZGV2aWNlcycgYW5kIHBlcmZvcm0gdGhlIG5lY2Vzc2FyeSBhY3Rpb25zLgo+IEZv
ciBzYWZldHkgYSBhbiBleHRyYSAnb25saW5lJyBjaGVjayBpcyBhbHNvIGFkZGVkIHRvCiAgICAg
ICAgICAgICBeIG9uZSAnYScgdG9vIG1hbnk/Cgo+IHhlbl9idXNfdHlwZV9lbnVtZXJhdGUoKSB0
byBtYWtlIHN1cmUgdGhhdCBubyBhdHRlbXB0IGlzIG1hZGUgdG8gY3JlYXRlIGEKPiBuZXcgWGVu
RGV2aWNlIG9iamVjdCBmb3IgYSBiYWNrZW5kIHRoYXQgaXMgb2ZmbGluZS4KPiAKPiBOT1RFOiBU
aGlzIHBhdGNoIGFsc28gaW5jbHVkZSBzb21lIGNvc21ldGljIGNoYW5nZXM6Cj4gICAgICAgLSBz
dWJzdGl0dXRlIHRoZSBsb2NhbCB2YXJpYWJsZSBuYW1lICdiYWNrZW5kX3N0YXRlJwo+ICAgICAg
ICAgaW4geGVuX2J1c190eXBlX2VudW1lcmF0ZSgpIHdpdGggJ3N0YXRlJywgc2luY2UgdGhlcmUK
PiAgICAgICAgIGlzIG5vIGFtYmlndWl0eSB3aXRoIGFueSBvdGhlciBzdGF0ZSBpbiB0aGF0IGNv
bnRleHQuCj4gICAgICAgLSBjaGFuZ2UgeGVuX2RldmljZV9zdGF0ZV9pc19hY3RpdmUoKSB0bwo+
ICAgICAgICAgeGVuX2RldmljZV9mcm9udGVuZF9pc19hY3RpdmUoKSAoYW5kIHBhc3MgYSBYZW5E
ZXZpY2UgZGlyZWN0bHkpCj4gICAgICAgICBzaW5jZSB0aGUgc3RhdGUgdGVzdHMgY29udGFpbmVk
IHRoZXJlaW4gb25seSBhcHBseSB0byBhIGZyb250ZW5kLgo+ICAgICAgIC0gdXNlICdzdGF0ZScg
cmF0aGVyIHRoZW4gJ3hlbmRldi0+YmFja2VuZF9zdGF0ZScgaW4KPiAgICAgICAgIHhlbl9kZXZp
Y2VfYmFja2VuZF9jaGFuZ2VkKCkgdG8gc2hvcnRlbiB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IC0tLQo+IAo+IHYy
Ogo+ICAtIE1ha2Ugc3VyZSB3ZSBkb24ndCB0cnkgdG8gYWRkIGEgWGVuRGV2aWNlIHRvICdvZmZs
aW5lX2RldmljZXMnIG1vcmUgdGhhbgo+ICAgIG9uY2UKPiAtLS0KPiAgCj4gICAgICAvKgo+ICAg
ICAgICogSWYgYSBiYWNrZW5kIGlzIHN0aWxsICdvbmxpbmUnIHRoZW4gd2Ugc2hvdWxkIGxlYXZl
IGl0IGFsb25lIGJ1dCwKPiAtICAgICAqIGlmIGEgYmFja2VuZCBpcyBub3QgJ29ubGluZScsIHRo
ZW4gdGhlIGRldmljZSBzaG91bGQgYmUgZGVzdHJveWVkCj4gLSAgICAgKiBvbmNlIHRoZSBzdGF0
ZSBpcyBDbG9zZWQuCj4gKyAgICAgKiBpZiBhIGJhY2tlbmQgaXMgbm90ICdvbmxpbmUnLCB0aGVu
IHRoZSBkZXZpY2UgaXMgYSBjYW5kaWRhdGUKPiArICAgICAqIGZvciBkZXN0cnVjdGlvbi4gSGVu
Y2UgYWRkIGl0IHRvIHRoZSAnb2ZmbGluZScgbGlzdCB0byBiZSBjbGVhbmVkCj4gKyAgICAgKiBi
eSB4ZW5fYnVzX2NsZWFudXAoKS4KPiAgICAgICAqLwo+IC0gICAgaWYgKCF4ZW5kZXYtPmJhY2tl
bmRfb25saW5lICYmCj4gLSAgICAgICAgKHhlbmRldi0+YmFja2VuZF9zdGF0ZSA9PSBYZW5idXNT
dGF0ZUNsb3NlZCB8fAo+IC0gICAgICAgICB4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0gWGVuYnVz
U3RhdGVJbml0aWFsaXNpbmcgfHwKPiAtICAgICAgICAgeGVuZGV2LT5iYWNrZW5kX3N0YXRlID09
IFhlbmJ1c1N0YXRlSW5pdFdhaXQgfHwKPiAtICAgICAgICAgeGVuZGV2LT5iYWNrZW5kX3N0YXRl
ID09IFhlbmJ1c1N0YXRlVW5rbm93bikpIHsKPiAtICAgICAgICBFcnJvciAqbG9jYWxfZXJyID0g
TlVMTDsKPiArICAgIGlmICghb25saW5lICYmCj4gKyAgICAgICAgKHN0YXRlID09IFhlbmJ1c1N0
YXRlQ2xvc2VkIHx8ICBzdGF0ZSA9PSBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyB8fAo+ICsgICAg
ICAgICBzdGF0ZSA9PSBYZW5idXNTdGF0ZUluaXRXYWl0IHx8IHN0YXRlID09IFhlbmJ1c1N0YXRl
VW5rbm93bikgJiYKPiArICAgICAgICAhUUxJU1RfTkVYVCh4ZW5kZXYsIGxpc3QpKSB7CgpDb3Vs
ZCB5b3UgYWRkIGEgbm90ZSBhYm91dCB0aGlzIFFMSVNUX05FWFQ/IEkgZG9uJ3QgdGhpbmsgaXQn
cyBnb2luZyB0bwpiZSBvYnZpb3VzIGVub3VnaCB3aHkgd2UgY2hlY2sgdGhhdCB0aGVyZSBhcmUg
bm8gbmV4dCBpdGVtLiBJIG1pZ2h0IG9ubHkKdW5kZXJzdGFuZCBpdCBqdXN0IGJlY2F1c2Ugb2Yg
eW91ciByZXBseSB0byB0aGUgdjEgb2YgdGhlIHBhdGNoLgooV2VsbCB0aGUgY2hhbmdlbG9nIG9m
IHRoZSBwYXRjaCBhbHNvIHBvaW50IG91dCB3aGF0IGl0J3MgZm9yLikKCj4gKyAgICAgICAgWGVu
QnVzICp4ZW5idXMgPSBYRU5fQlVTKHFkZXZfZ2V0X3BhcmVudF9idXMoREVWSUNFKHhlbmRldikp
KTsKPiAgCj4gLSAgICAgICAgaWYgKCF4ZW5fYmFja2VuZF90cnlfZGV2aWNlX2Rlc3Ryb3koeGVu
ZGV2LCAmbG9jYWxfZXJyKSkgewo+IC0gICAgICAgICAgICBvYmplY3RfdW5wYXJlbnQoT0JKRUNU
KHhlbmRldikpOwo+IC0gICAgICAgIH0KPiArICAgICAgICBRTElTVF9JTlNFUlRfSEVBRCgmeGVu
YnVzLT5vZmZsaW5lX2RldmljZXMsIHhlbmRldiwgbGlzdCk7Cj4gIAo+IC0gICAgICAgIGlmIChs
b2NhbF9lcnIpIHsKPiAtICAgICAgICAgICAgZXJyb3JfcmVwb3J0X2Vycihsb2NhbF9lcnIpOwo+
IC0gICAgICAgIH0KPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFJlLXdyaXRlIHRoZSBzdGF0
ZSB0byBjYXVzZSBhIFhlbkJ1cyBiYWNrZW5kX3dhdGNoIG5vdGlmaWNhdGlvbiwKPiArICAgICAg
ICAgKiByZXN1bHRpbmcgaW4gYSBjYWxsIHRvIHhlbl9idXNfY2xlYW51cCgpLgo+ICsgICAgICAg
ICAqLwo+ICsgICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAic3RhdGUi
LCAiJXUiLCBzdGF0ZSk7CgpJdCBraW5kIG9mIGZlZWxzIHdyb25nIHRvIHJlbHkgb24geGVuc3Rv
cmUgdG8gbm90aWZ5IFFFTVUncyB4ZW5idXMKZHJpdmVyIHRoYXQgYSBkZXZpY2UgbmVlZHMgY2xl
YW51cC4gQnV0IHRoYXQgZG9lcyB0aGUgam9iLgoKV2l0aCBhIG5vdGUgYWJvdXQgdGhlIHVzZSBv
ZiBRTElTVF9ORVhUIGFuZCB0aGUgZmV3IHR5cG8gZml4ZWQsIHRoZQpwYXRjaCB3aWxsIGJlIGdv
b2QgdG8gZ28uCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
