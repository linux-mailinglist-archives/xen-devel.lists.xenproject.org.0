Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DDDBF0BE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRTS-0004iy-PO; Thu, 26 Sep 2019 10:58:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8zHT=XV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDRTQ-0004it-CZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:58:12 +0000
X-Inumbo-ID: 87c9f03c-e04c-11e9-964f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 87c9f03c-e04c-11e9-964f-12813bfff9fa;
 Thu, 26 Sep 2019 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569495491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AZg3FH7RUXw5f4U2zZbAAPIx99G/8m6jxfl/IN0V8BY=;
 b=Q9wR3uEUGdzd92cUNut7HhY4A2ngi1sjfpETc+LNddif2WEMDONdpsJZ
 FzDCqj0awPocVBnFdX6jUxi3mCcFiUWvZPPZaiH4M1fLVX1eTAt6pfb/J
 Tmw96xoajZNgxe0yn0TYO6ne+VtGGX559pzxKuvsRaUnxbNhQ4d4LcJ7V Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KLX8+v/ROk5VV++c3pgJb+/d9BZFeoEQ6AnkWdv2pF5cloaGrvCdS15FBSQEoPP3N7qx1ctjpY
 8cXFGU7MI004FuNGI3rknjiC2NswjHjmLYoF9xCYz+7HUNZKBuaqp2y/2vD2oFwrsBSfUFBuvq
 A1L5VxU9nJ1JlXaKA5HscggrmmPDQm8waVAWMmjHSdgeaC+xzzy5UDjIejIpdQTUXrjHGGnlZR
 YFJ/v4fyNxrYKaheXHdHU0V/TdtATGXF3ITXaCRycPGepUx31Tld+mbxesg1uCaYqQtis8eXJD
 TwY=
X-SBRS: 2.7
X-MesageID: 6113016
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6113016"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 05/11] ioreq: add internal ioreq initialization support
Thread-Index: AQHVYnK2oKxcpVD8uUiJJhtdNoUtKqck5f9wgBjjqQCAACLP4A==
Date: Thu, 26 Sep 2019 10:58:07 +0000
Message-ID: <3e1e86253e5e4c219bee16faf103025d@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-6-roger.pau@citrix.com>
 <133e6d6e83f846638ebdd9f66cef279b@AMSPEX02CL03.citrite.net>
 <20190926104916.7pho64cfjmfakjsu@Air-de-Roger>
In-Reply-To: <20190926104916.7pho64cfjmfakjsu@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 05/11] ioreq: add internal ioreq
 initialization support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+ID4KPiA+ID4gICAgICByZXR1
cm4gMDsKPiA+ID4KPiA+ID4gICBmYWlsX2FkZDoKPiA+ID4gKyAgICBBU1NFUlQoIWh2bV9pb3Jl
cV9pc19pbnRlcm5hbChpZCkpOwo+ID4gPiAgICAgIGh2bV9pb3JlcV9zZXJ2ZXJfcmVtb3ZlX2Fs
bF92Y3B1cyhzKTsKPiA+ID4gICAgICBodm1faW9yZXFfc2VydmVyX3VubWFwX3BhZ2VzKHMpOwo+
ID4gPgo+ID4KPiA+IEkgdGhpbmsgaXQgd291bGQgYmUgd29ydGh3aGlsZSBoYXZpbmcgdGhhdCBB
U1NFUlQgcmVwZWF0ZWQgaW4gdGhlIGNhbGxlZCBmdW5jdGlvbnMsIGFuZCBvdGhlcgo+IGZ1bmN0
aW9ucyB0aGF0IG9ubHkgb3BlcmF0ZSBvbiBleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzIGUuZy4gaHZt
X2lvcmVxX3NlcnZlcl9hZGRfdmNwdSgpLAo+IGh2bV9pb3JlcV9zZXJ2ZXJfbWFwX3BhZ2VzKCks
IGV0Yy4KPiAKPiBUaGF0J3MgZmluZSwgYnV0IHRoZW4gSSB3b3VsZCBhbHNvIG5lZWQgdG8gcGFz
cyB0aGUgaW9yZXEgc2VydmVyIGlkIHRvCj4gdGhvc2UgZnVuY3Rpb25zIGp1c3QgdG8gcGVyZm9y
bSB0aGUgQVNTRVJULiBJIHdpbGwgbGVhdmUgdGhvc2UgYXMtaXMKPiBiZWNhdXNlIEkgdGhpbmsg
cGFzc2luZyB0aGUgaWQganVzdCBmb3IgdGhhdCBBU1NFUlQgaXMga2luZCBvZgo+IHBvaW50bGVz
cy4KCk9oLCBJIHdhcyBtaXNyZW1lbWJlcmluZyB0aGUgaWQgYmVpbmcgcmVjb3JkZWQgaW4gdGhl
IHN0cnVjdC4gSSBndWVzcyB0aGF0IHdhcyB3aGVuIGlvcmVxIHNlcnZlcnMgd2VyZSBpbiBhIGxp
c3QgcmF0aGVyIHRoYW4gYW4gYXJyYXkuIEluZGVlZCB0aGVyZSdzIG5vIHBvaW50IGluIHBhc3Np
bmcgYW4gaWQganVzdCB0byBBU1NFUlQgb24gaXQuCgo+IAo+ID4gPiBAQCAtODY0LDIwICs4OTcs
MjEgQEAgaW50IGh2bV9kZXN0cm95X2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLCBpb3Nl
cnZpZF90IGlkKQo+ID4gPiAgICAgICAgICBnb3RvIG91dDsKPiA+ID4KPiA+ID4gICAgICByYyA9
IC1FUEVSTTsKPiA+ID4gLSAgICBpZiAoIHMtPmVtdWxhdG9yICE9IGN1cnJlbnQtPmRvbWFpbiAp
Cj4gPiA+ICsgICAgLyogTkI6IGludGVybmFsIHNlcnZlcnMgY2Fubm90IGJlIGRlc3Ryb3llZC4g
Ki8KPiA+ID4gKyAgICBpZiAoIGh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkgfHwgcy0+ZW11bGF0
b3IgIT0gY3VycmVudC0+ZG9tYWluICkKPiA+Cj4gPiBTaG91bGRuJ3QgdGhlIHRlc3Qgb2YgaHZt
X2lvcmVxX2lzX2ludGVybmFsKGlkKSBzaW1wbHkgYmUgYW4gQVNTRVJUPyBUaGlzIGZ1bmN0aW9u
IHNob3VsZCBvbmx5IGJlCj4gY2FsbGVkIGZyb20gYSBkbV9vcCgpLCByaWdodD8KPiAKPiBSaWdo
dCwgSSB0aGluayBJJ3ZlIHdyb25nbHkgYXNzdW1lZCB0aGlzIHdhcyBhbHNvIGNhbGxlZCB3aGVu
Cj4gZGVzdHJveWluZyBhIGRvbWFpbiwgYnV0IGRvbWFpbiBkZXN0cnVjdGlvbiB1c2VzCj4gaHZt
X2Rlc3Ryb3lfYWxsX2lvcmVxX3NlcnZlcnMgaW5zdGVhZC4KPiAKClRoYXQncyByaWdodC4KCj4g
PiA+ICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPgo+ID4gPiAgICAgIGRvbWFpbl9wYXVzZShkKTsK
PiA+ID4KPiA+ID4gICAgICBwMm1fc2V0X2lvcmVxX3NlcnZlcihkLCAwLCBpZCk7Cj4gPiA+Cj4g
PiA+IC0gICAgaHZtX2lvcmVxX3NlcnZlcl9kaXNhYmxlKHMpOwo+ID4gPiArICAgIGh2bV9pb3Jl
cV9zZXJ2ZXJfZGlzYWJsZShzLCBodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKTsKPiA+ID4KPiA+
ID4gICAgICAvKgo+ID4gPiAgICAgICAqIEl0IGlzIHNhZmUgdG8gY2FsbCBodm1faW9yZXFfc2Vy
dmVyX2RlaW5pdCgpIHByaW9yIHRvCj4gPiA+ICAgICAgICogc2V0X2lvcmVxX3NlcnZlcigpIHNp
bmNlIHRoZSB0YXJnZXQgZG9tYWluIGlzIHBhdXNlZC4KPiA+ID4gICAgICAgKi8KPiA+ID4gLSAg
ICBodm1faW9yZXFfc2VydmVyX2RlaW5pdChzKTsKPiA+ID4gKyAgICBodm1faW9yZXFfc2VydmVy
X2RlaW5pdChzLCBodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKTsKPiA+ID4gICAgICBzZXRfaW9y
ZXFfc2VydmVyKGQsIGlkLCBOVUxMKTsKPiA+ID4KPiA+ID4gICAgICBkb21haW5fdW5wYXVzZShk
KTsKPiA+ID4gQEAgLTkwOSw3ICs5NDMsOCBAQCBpbnQgaHZtX2dldF9pb3JlcV9zZXJ2ZXJfaW5m
byhzdHJ1Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLAo+ID4gPiAgICAgICAgICBnb3RvIG91
dDsKPiA+ID4KPiA+ID4gICAgICByYyA9IC1FUEVSTTsKPiA+ID4gLSAgICBpZiAoIHMtPmVtdWxh
dG9yICE9IGN1cnJlbnQtPmRvbWFpbiApCj4gPiA+ICsgICAgLyogTkI6IGRvbid0IGFsbG93IGZl
dGNoaW5nIGluZm9ybWF0aW9uIGZyb20gaW50ZXJuYWwgaW9yZXEgc2VydmVycy4gKi8KPiA+ID4g
KyAgICBpZiAoIGh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkgfHwgcy0+ZW11bGF0b3IgIT0gY3Vy
cmVudC0+ZG9tYWluICkKPiA+Cj4gPiBBZ2FpbiBoZXJlLCBhbmQgc2V2ZXJhbCBwbGFjZXMgYmVs
b3cuCj4gCj4gSSd2ZSBmaXhlZCB0aGUgY2FsbHMgdG8gaHZtX2dldF9pb3JlcV9zZXJ2ZXJfaW5m
bywKPiBodm1fZ2V0X2lvcmVxX3NlcnZlcl9mcmFtZSBhbmQgaHZtX21hcF9tZW1fdHlwZV90b19p
b3JlcV9zZXJ2ZXIgdG8KPiBpbmNsdWRlIGFuIEFTU0VSVCB0aGF0IHRoZSBwYXNzZWQgaW9yZXEg
aXMgbm90IGludGVybmFsLgo+IAoKQ29vbC4gVGhhbmtzLAoKICBQYXVsCgo+IFRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
