Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D99699208
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 13:28:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0lDz-0006vJ-9M; Thu, 22 Aug 2019 11:25:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0lDx-0006vE-L7
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 11:25:49 +0000
X-Inumbo-ID: 96ee4ed4-c4cf-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ee4ed4-c4cf-11e9-b95f-bc764e2007e4;
 Thu, 22 Aug 2019 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566473149;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=J1Ko+RN2sMImHYNTmiMGPEJ/IFSVSNb5OxuZja+Ckvw=;
 b=SZgBKQVmguVgNWBPhp7xluZSHMwh+2w0obkzTe6xsQr4u6RqiMiDBwy4
 kb81/Jgs2xP5C7EDG5xYctamq1AbhnrXJDbRdUxeyQA5vHb9zEYebVIfm
 tM2dhxya5mQPMEArRZecLBHflPB3oHru7cZ6o/EqDxw3xPmzn1y6gLhUl A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9vjBn/IrX9lH9hMf1RkJralyc8sQAPAFl2x8yMVPcwOH/mnTMurWcXTwmJyi1QwBS2fes97u2i
 OeTzRd0OG6t/uUu0SD1vS16hvgZGwbZKgPjUTpRbSYzTEhoMukHuTMe1sZlBhPTn1UQXGr+f/q
 Xk46YpoJuDfupSS+xRyKybSzMSPesyFpA2Zk1tfe79N7PpoVrju/DdcCtFpiBXDZN0j25S47Ed
 06bxOWTd2pUFZnYunE7qoVBNFtEjF1UAg6I7qB9awFJqkBx/WSzrSYnhAtI8IAb5s5En38VLRc
 xPE=
X-SBRS: 2.7
X-MesageID: 4578011
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4578011"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 2/2] xen-bus: Avoid rewriting identical values to xenstore
Thread-Index: AQHVWAGpK6THQS4Lrk6EcsKhvd7AqqcFuu6QgAEaRACAACIz8P//7XAAgAAh8kA=
Date: Thu, 22 Aug 2019 11:25:44 +0000
Message-ID: <40872481b00f4dbeb82ab540e99121a6@AMSPEX02CL03.citrite.net>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-3-anthony.perard@citrix.com>
 <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
 <20190822102132.GJ1289@perard.uk.xensource.com>
 <b63f378211d8451d8267f83f0922138e@AMSPEX02CL03.citrite.net>
 <20190822111730.GK1289@perard.uk.xensource.com>
In-Reply-To: <20190822111730.GK1289@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIyIEF1Z3VzdCAyMDE5IDEyOjE4Cj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJd
IHhlbi1idXM6IEF2b2lkIHJld3JpdGluZyBpZGVudGljYWwgdmFsdWVzIHRvIHhlbnN0b3JlCj4g
Cj4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTE6MzY6MzJBTSArMDEwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4gQnV0LCBub3cgSSBsb29rIGF0IHRoZSBjb2RlIGFnYWluIHdpdGhvdXQgeW91
ciBwYXRjaCBhcHBsaWVkIEkgZG9uJ3QgYWN0dWFsbHkgc2VlIHRoZSBwcm9ibGVtIGl0IGlzCj4g
dHJ5aW5nIHRvIGZpeC4gVGhlIGZ1bmN0aW9ucyB4ZW5fZGV2aWNlX1tiYWNrfGZyb250XWVuZF9z
ZXRfc3RhdGUgcmV0dXJuIGVhcmx5IGlmIHRoZSBzdGF0ZSBiZWluZyBzZXQKPiBtYXRjaGVzIHRo
ZSBleGlzdGluZyBzdGF0ZSBhbmQgaGVuY2UgbmV2ZXIgZ2V0IHRvIHRoZSBsaW5lIHdoZXJlIHRo
ZSBzdGF0ZSBpcyB3cml0dGVuIHRvIHhlbnN0b3JlLgo+IAo+IExldCdzIHNlZToKPiAgICAgKiBz
dGVwIDEgKGluaXRpYWwgc3RhdGVzIGluIHhlbnN0b3JlIGFuZCBRRU1VKQo+ICAgICAgICAgeGVu
c3RvcmUvZnJvbnRlbmQvc3RhdGUgPSA0Cj4gICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRl
ID0gNAo+ICAgICAqIHN0ZXAgMiAoZnJvbnRlbmQgY2hhbmdlcyBzdGF0ZSBpbiB4ZW5zdG9yZSkK
PiAgICAgICAgIHhlbnN0b3JlL2Zyb250ZW5kL3N0YXRlID0gNQo+ICAgICAqIHN0ZXAgMyAod2F0
Y2ggZXZlbnQgcmVjZWl2ZWQgYnkgUUVNVSkKPiAgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRf
Y2hhbmdlZCgpCj4gICAgICAgICAgICAgc3RhdGUgPSByZWFkKHhlbnN0b3JlL2Zyb250ZW5kL3N0
YXRlKSAoc3RhdGU9NSkKPiAgICAgICAgICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3NldF9zdGF0
ZShzdGF0ZSkKPiAgICAgICAgICAgICAgICAgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZSAhPSBzdGF0
ZSAgKDQhPTUpCj4gICAgICAgICAgICAgICAgICAgICB4ZW5kZXYtPmZyb250ZW5kX3N0YXRlID0g
c3RhdGUKPiAgICAgICAgICAgICAgICAgICAgIHhlbnN0b3JlL2Zyb250ZW5kL3N0YXRlID0gc3Rh
dGUKPiAgICAgKiBzdGVwIDQKPiAgICAgICAgICMgd2F0Y2ggZXZlbnQgdHJpZ2dlcnMgeGVuX2Rl
dmljZV9mcm9udGVuZF9jaGFuZ2VkKCkgYWdhaW4gYnV0Cj4gICAgICAgICAjIHRoaXMgdGltZSB4
ZW5kZXYtPmZyb250ZW5kX3N0YXRlID09IHhlbnN0b3JlL2Zyb250ZW5kX3N0YXRlCj4gCj4gVGhp
cyBpcyBob3cgUUVNVSB3cml0ZXMgdG8geGVuc3RvcmUgYW4gaWRlbnRpY2FsIHZhbHVlLgo+IAo+
IFRoYXQgYmVoYXZpb3IgbWlnaHQgYmUgYW4gaXNzdWUgaWYgdGhlIGZyb250ZW5kIGNoYW5nZXMg
dGhlIHZhbHVlIGFmdGVyCj4gUUVNVSBoYXZlIHJlYWQgaXQgYnV0IGJlZm9yZSBRRU1VIHdyaXRl
cyBpdCBhZ2Fpbi4KCkFoLCBvaywgc28gdGhlIHByb2JsZW0gaXMgYWN0dWFsbHkgbGltaXRlZCB0
byBmcm9udGVuZCBzdGF0ZSBiZWNhdXNlIHRoYXQgaXMgd3JpdHRlbiBieSBib3RoIGZyb250ZW5k
IGFuZCBiYWNrZW5kLCBzbyB3aGV0aGVyIFFFTVUgd3JpdGVzIGFuIHVwZGF0ZWQgZnJvbnRlbmQg
c3RhdGUgdG8geGVuc3RvcmUgbmVlZHMgdG8gYmUgY29udHJvbGxlZC4gSXQncyBvbmx5IGNhbGxl
ZCBpbiB0d28gcGxhY2VzIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCgpIGFuZCB4ZW5fZGV2
aWNlX3JlYWxpemUoKS4gVGhlIHdyaXRlIHRvIHhlbnN0b3JlIHNob3VsZCBiZSBhdm9pZGVkIGlu
IHRoZSBmb3JtZXIgY2FzZSwgYnV0IG5vdCB0aGUgbGF0dGVyLiBTbyBhZGRpbmcgYSAncHVibGlz
aCcgYm9vbGVhbiBhbmQgdXNpbmcgdGhhdCB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgd3JpdGUg
dG8geGVuc3RvcmUgaXMgZG9uZSBzZWVtcyBsaWtlIHRoZSByaWdodCBhcHByb2FjaC4gQnV0IEkg
ZG9uJ3QgdGhpbmsgYW55IGNoYW5nZSBpcyBuZWVkZWQgdG8geGVuX2RldmljZV9iYWNrZW5kX3Nl
dF9vbmxpbmUoKSBvciB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0YXRlKCksIGlzIGl0PwoKICBQ
YXVsCgo+IAo+IEFsc28sIGl0J3MgbmljZSB0byBhdm9pZCBleHRyYSB3b3JrLgo+IAo+IC0tCj4g
QW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
