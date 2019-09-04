Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C74A7FB8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Rrz-0005Si-Dh; Wed, 04 Sep 2019 09:46:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hQbx=W7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i5Rrx-0005SR-SE
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:46:29 +0000
X-Inumbo-ID: ddbc4c2a-cef8-11e9-abae-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddbc4c2a-cef8-11e9-abae-12813bfff9fa;
 Wed, 04 Sep 2019 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567590389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jh8Fh+YI5X+YAwGCgRXu6jFabUGE/jDzpZEcWpH73UM=;
 b=L6+6QemGzfnkZQJg7r3dVFYg8dH3ZfS6emLHvtvct0gNbhWWFviFNTHF
 pMXVI04uI/3eiw7bpV8+KJXq2DPvLWhqTQ/OaiPMchrfTCsheyzCI6pJJ
 FkDwHoV427feZntzmEOTBAEVZ2jpxlFd26RlzHyj+Oq3vHQmQBbFw0GjE M=;
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
IronPort-SDR: DIjAdAtVU8V4bpvV9Jwe5jR6ce/zeKqqC7ZsI/fbhkWazuvS4OLDzTurvJNUwJX7Spe5VPArWV
 PnsUyLlcWr/X/JQz5oYROivz89i1dOcZC5g2PCdWSGVCWzNiwNFw5X2bbF7JftWBOFROVVgiss
 cyFuuPPVMnz1c8elEMW79eq9JPQ2ihsNjo8WBJqWaaCZ49BF0JsenxroLqQcUPt8FkAQveYPhu
 blRhHmhOjX5S9PnfG0Pi0TnyaEEzjvtGLjZ0TiaJGpytHmjZwjErWrnjNCWxh435xHHzEChWhl
 4FE=
X-SBRS: 2.7
X-MesageID: 5114877
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,465,1559534400"; 
   d="scan'208";a="5114877"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH v2 02/11] ioreq: terminate cf8 handling at hypervisor
 level
Thread-Index: AQHVYnKx5qeoEGPma0OmaOPJSQUZyqcaD4aAgAD0loCAAED5sA==
Date: Wed, 4 Sep 2019 09:46:24 +0000
Message-ID: <a0d458949642478786ce606761bf2726@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-3-roger.pau@citrix.com>
 <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
 <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
In-Reply-To: <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 02/11] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMDQgU2VwdGVtYmVyIDIwMTkgMDg6NDkKPiBUbzog
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXgu
Y29tPjsgSmFuIEJldWxpY2gKPiA8amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDIvMTFdIGlvcmVxOiB0ZXJtaW5hdGUgY2Y4
IGhhbmRsaW5nIGF0IGh5cGVydmlzb3IgbGV2ZWwKPiAKPiBPbiBUdWUsIFNlcCAwMywgMjAxOSBh
dCAwNjoxMzo1OVBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4gT24gMDMvMDkvMjAx
OSAxNzoxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4gPiA+IGluZGV4
IDY5MmI3MTBiMDIuLjY5NjUyZTEwODAgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vaW9yZXEuYwo+ID4gPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiA+ID4gQEAg
LTEwMTUsNiArMTAxNSwxMiBAQCBpbnQgaHZtX21hcF9pb19yYW5nZV90b19pb3JlcV9zZXJ2ZXIo
c3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwKPiA+ID4gICAgICBzd2l0Y2ggKCB0eXBl
ICkKPiA+ID4gICAgICB7Cj4gPiA+ICAgICAgY2FzZSBYRU5fRE1PUF9JT19SQU5HRV9QT1JUOgo+
ID4gPiArICAgICAgICByYyA9IC1FSU5WQUw7Cj4gPiA+ICsgICAgICAgIC8qIFBDSSBjb25maWcg
c3BhY2UgYWNjZXNzZXMgYXJlIGhhbmRsZWQgaW50ZXJuYWxseS4gKi8KPiA+ID4gKyAgICAgICAg
aWYgKCBzdGFydCA8PSAweGNmOCArIDggJiYgMHhjZjggPD0gZW5kICkKPiA+ID4gKyAgICAgICAg
ICAgIGdvdG8gb3V0Owo+ID4gPiArICAgICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAvKiBm
YWxsdGhyb3VnaC4gKi8KPiA+Cj4gPiBZb3UgbmVlZCB0byBkcm9wIHRoZSBlbHNlLCBvciBpdCBt
YXkgc3RpbGwgdHJpZ2dlciB3YXJuaW5ncy4KPiAKPiBZZXMsIG15IG1pc3Rha2UuIFRoZSBlbHNl
IGJyYW5jaCBpcyBub3QgbmVlZGVkLgo+IAo+ID4gRnVydGhlcm1vcmUsIHFlbXUgcmVnaXN0ZXJz
IGNmOC1jZmYgc28gSSB0aGluayB5b3UgbmVlZCBzb21lIGZpeC11cHMKPiA+IHRoZXJlIGZpcnN0
IGJlZm9yZSB0aHJvd2luZyBlcnJvcnMgYmFjayBoZXJlLgo+IAo+IFRoZSB2ZXJzaW9uIG9mIFFF
TVUgSSBoYXZlIGRvZXNuJ3Qgc2VlbSB0byByZWdpc3RlciAweGNmOCBvciAweGNmYywKPiB0aGVy
ZSBhcmUgbm8gZXJyb3JzIG9uIHRoZSBsb2cgYW5kIFFFTVUgc2VlbXMgdG8gd29yayBqdXN0IGZp
bmUuCj4gCj4gSSBhbHdheXMgYXNzdW1lZCBRRU1VIHdhcyBnZXR0aW5nIGFjY2Vzc2VzIHRvIGNm
OC9jZmMgZm9yd2FyZGVkCj4gYmVjYXVzZSBpdCB3YXMgdGhlIGRlZmF1bHQgZGV2aWNlIG1vZGVs
LCBhbmQgZXZlcnl0aGluZyBub3QgdHJhcHBlZCBieQo+IFhlbiB3b3VsZCBiZSBmb3J3YXJkZWQg
dG8gaXQuIFRoaXMgZGVmYXVsdCBkZXZpY2UgbW9kZWwgYmVoYXZpb3VyIHdhcwo+IHJlbW92ZWQg
YnkgUGF1bCBzb21lIHRpbWUgYWdvLCBhbmQgbm93IFFFTVUgcmVnaXN0ZXJzIGV4cGxpY2l0bHkg
d2hpY2gKPiBJTyBhY2Nlc3NlcyBpdCB3YW50cyB0byB0cmFwLgoKWWVzLCBpdCB1c2VkIHRvIG5l
ZWQgdGhlbSB0byB3b3JrIGNvcnJlY3RseSBhcyBhIGRlZmF1bHQgZW11bGF0b3IuIEhvd2V2ZXIs
IHdlIGRvbid0IGdlbmVyYWxseSBzdG9wIGFuIGV4dGVybmFsIGVtdWxhdG9yIGZyb20gcmVnaXN0
ZXJpbmcgcmFuZ2VzIHRoYXQgYXJlIGhhbmRsZWQgYnkgZW11bGF0aW9uIGRpcmVjdGx5IGluIFhl
biAoZS5nLiBwbXRpbWVyKSBzbyBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHNwZWNpYWwtY2FzZSB0
aGVzZSBwb3J0cy4KCiAgUGF1bAoKPiAKPiA+IEZpbmFsbHksIHRoaXMgcHJvaGliaXRzIHJlZ2lz
dGVyaW5nIGNmOSB3aGljaCBtYXkgbGVnaXRpbWF0ZWx5IG5vdCBiZQo+ID4gdGVybWluYXRlZCBp
biBYZW4uCj4gCj4gWWVzLCB0aGF0IHNob3VsZCBiZSBjZjggLSA3IG5vdCA4LCB0aGFua3MgZm9y
IGNhdGNoaW5nIGl0ISBXaWxsIHVwZGF0ZQo+IG9uIHRoZSBuZXh0IHZlcnNpb24uCj4gCj4gUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
