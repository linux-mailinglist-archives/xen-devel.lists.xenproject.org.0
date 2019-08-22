Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9708994E4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0n1p-0002Fk-RV; Thu, 22 Aug 2019 13:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0n1o-0002Ff-B6
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 13:21:24 +0000
X-Inumbo-ID: bc7fed32-c4df-11e9-add7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc7fed32-c4df-11e9-add7-12813bfff9fa;
 Thu, 22 Aug 2019 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566480083;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7K4Bi8IZecLxz5kMb9fXePoOfD9lbRjKjU2owyytZfs=;
 b=NXO2NEWXAO7VDLLC9rQVquTgcEc7fqzwrfd/k9jPYpT30xG99zM3rXNJ
 p7ggUMIX2K5hcuo4punnmzYSZOsdXj5rPsh/IERXZmqzOe3evjLiLWkaS
 eR50vkYGx9ZEsAIqO7XYJ+OQ+VGgmeknDUpgJyZatL/XUj110orsfZSKS w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nJLsP6W0K+x6ecjhl/u2O77kFol+Lw0OrMHQFs5Fhpy/+uiQ7lGit6nxQXdsV5YikoPXm5Q3WG
 yOe0rSXZrQpSwEmHY3Wxbp+u9ZNKilpwhGFkJ0Hj8Q3z94f0LUr7D9tvjD1kgGqOLzc8HFm8NW
 Vj0qRYrNu/PWYLsV3GhIGuEvymh+3+p5RLeClW8oWOVmQzilFpvrjElfEpOsHUoZjEJrq3+CZv
 J1Yu/UCcBOj2UcrUiCLjOVTk5qZrT/46WL8ZUvP64FmE3WT8RTh7hREtRvcrfxsK13p7uqTpyP
 MyQ=
X-SBRS: 2.7
X-MesageID: 4800291
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4800291"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 2/2] xen-bus: Avoid rewriting identical values to xenstore
Thread-Index: AQHVWAGpK6THQS4Lrk6EcsKhvd7AqqcFuu6QgAEaRACAACIz8P//7XAAgAAh8kD///+7AIAAIl6Q
Date: Thu, 22 Aug 2019 13:21:20 +0000
Message-ID: <8e3dd40d4d3d4ff4af42a0feacae5ede@AMSPEX02CL03.citrite.net>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-3-anthony.perard@citrix.com>
 <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
 <20190822102132.GJ1289@perard.uk.xensource.com>
 <b63f378211d8451d8267f83f0922138e@AMSPEX02CL03.citrite.net>
 <20190822111730.GK1289@perard.uk.xensource.com>
 <40872481b00f4dbeb82ab540e99121a6@AMSPEX02CL03.citrite.net>
 <20190822124427.GL1289@perard.uk.xensource.com>
In-Reply-To: <20190822124427.GL1289@perard.uk.xensource.com>
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
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIyIEF1Z3VzdCAyMDE5IDE0OjE4Cj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJd
IHhlbi1idXM6IEF2b2lkIHJld3JpdGluZyBpZGVudGljYWwgdmFsdWVzIHRvIHhlbnN0b3JlCj4g
Cj4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTI6MjU6NDRQTSArMDEwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4gPiBGcm9tOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KPiA+ID4gU2VudDogMjIgQXVndXN0IDIwMTkgMTI6MTgKPiA+ID4KPiA+ID4gT24gVGh1
LCBBdWcgMjIsIDIwMTkgYXQgMTE6MzY6MzJBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+
ID4gPiA+IEJ1dCwgbm93IEkgbG9vayBhdCB0aGUgY29kZSBhZ2FpbiB3aXRob3V0IHlvdXIgcGF0
Y2ggYXBwbGllZCBJIGRvbid0IGFjdHVhbGx5IHNlZSB0aGUgcHJvYmxlbSBpdAo+IGlzCj4gPiA+
IHRyeWluZyB0byBmaXguIFRoZSBmdW5jdGlvbnMgeGVuX2RldmljZV9bYmFja3xmcm9udF1lbmRf
c2V0X3N0YXRlIHJldHVybiBlYXJseSBpZiB0aGUgc3RhdGUgYmVpbmcKPiBzZXQKPiA+ID4gbWF0
Y2hlcyB0aGUgZXhpc3Rpbmcgc3RhdGUgYW5kIGhlbmNlIG5ldmVyIGdldCB0byB0aGUgbGluZSB3
aGVyZSB0aGUgc3RhdGUgaXMgd3JpdHRlbiB0byB4ZW5zdG9yZS4KPiA+ID4KPiA+ID4gTGV0J3Mg
c2VlOgo+ID4gPiAgICAgKiBzdGVwIDEgKGluaXRpYWwgc3RhdGVzIGluIHhlbnN0b3JlIGFuZCBR
RU1VKQo+ID4gPiAgICAgICAgIHhlbnN0b3JlL2Zyb250ZW5kL3N0YXRlID0gNAo+ID4gPiAgICAg
ICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgPSA0Cj4gPiA+ICAgICAqIHN0ZXAgMiAoZnJvbnRl
bmQgY2hhbmdlcyBzdGF0ZSBpbiB4ZW5zdG9yZSkKPiA+ID4gICAgICAgICB4ZW5zdG9yZS9mcm9u
dGVuZC9zdGF0ZSA9IDUKPiA+ID4gICAgICogc3RlcCAzICh3YXRjaCBldmVudCByZWNlaXZlZCBi
eSBRRU1VKQo+ID4gPiAgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCgpCj4gPiA+
ICAgICAgICAgICAgIHN0YXRlID0gcmVhZCh4ZW5zdG9yZS9mcm9udGVuZC9zdGF0ZSkgKHN0YXRl
PTUpCj4gPiA+ICAgICAgICAgICAgIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKHN0YXRl
KQo+ID4gPiAgICAgICAgICAgICAgICAgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZSAhPSBzdGF0ZSAg
KDQhPTUpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZSA9
IHN0YXRlCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgeGVuc3RvcmUvZnJvbnRlbmQvc3RhdGUg
PSBzdGF0ZQo+ID4gPiAgICAgKiBzdGVwIDQKPiA+ID4gICAgICAgICAjIHdhdGNoIGV2ZW50IHRy
aWdnZXJzIHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCgpIGFnYWluIGJ1dAo+ID4gPiAgICAg
ICAgICMgdGhpcyB0aW1lIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgPT0geGVuc3RvcmUvZnJvbnRl
bmRfc3RhdGUKPiA+ID4KPiA+ID4gVGhpcyBpcyBob3cgUUVNVSB3cml0ZXMgdG8geGVuc3RvcmUg
YW4gaWRlbnRpY2FsIHZhbHVlLgo+ID4gPgo+ID4gPiBUaGF0IGJlaGF2aW9yIG1pZ2h0IGJlIGFu
IGlzc3VlIGlmIHRoZSBmcm9udGVuZCBjaGFuZ2VzIHRoZSB2YWx1ZSBhZnRlcgo+ID4gPiBRRU1V
IGhhdmUgcmVhZCBpdCBidXQgYmVmb3JlIFFFTVUgd3JpdGVzIGl0IGFnYWluLgo+ID4KPiA+IEFo
LCBvaywgc28gdGhlIHByb2JsZW0gaXMgYWN0dWFsbHkgbGltaXRlZCB0byBmcm9udGVuZCBzdGF0
ZSBiZWNhdXNlIHRoYXQgaXMgd3JpdHRlbiBieSBib3RoCj4gZnJvbnRlbmQgYW5kIGJhY2tlbmQs
IHNvIHdoZXRoZXIgUUVNVSB3cml0ZXMgYW4gdXBkYXRlZCBmcm9udGVuZCBzdGF0ZSB0byB4ZW5z
dG9yZSBuZWVkcyB0byBiZQo+IGNvbnRyb2xsZWQuIEl0J3Mgb25seSBjYWxsZWQgaW4gdHdvIHBs
YWNlcyB4ZW5fZGV2aWNlX2Zyb250ZW5kX2NoYW5nZWQoKSBhbmQgeGVuX2RldmljZV9yZWFsaXpl
KCkuIFRoZQo+IHdyaXRlIHRvIHhlbnN0b3JlIHNob3VsZCBiZSBhdm9pZGVkIGluIHRoZSBmb3Jt
ZXIgY2FzZSwgYnV0IG5vdCB0aGUgbGF0dGVyLiBTbyBhZGRpbmcgYSAncHVibGlzaCcKPiBib29s
ZWFuIGFuZCB1c2luZyB0aGF0IHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSB3cml0ZSB0byB4ZW5z
dG9yZSBpcyBkb25lIHNlZW1zIGxpa2UgdGhlIHJpZ2h0Cj4gYXBwcm9hY2guIEJ1dCBJIGRvbid0
IHRoaW5rIGFueSBjaGFuZ2UgaXMgbmVlZGVkIHRvIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRfb25s
aW5lKCkgb3IKPiB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0YXRlKCksIGlzIGl0Pwo+IAo+IEkg
Z3Vlc3MgaXQncyBub3QgdGhhdCBtdWNoIG9mIGEgaXNzdWUgZm9yIGJhY2tlbmRfc2V0XyooKSwg
dGhlIGRvdWJsZQo+IHdyaXRlIHdvdWxkIG9ubHkgaGFwcGVuIHdoZW4gdGhlIHRvb2xzdGFjayB0
cnkgdG8gdGVhciBkb3duIHRoZSBiYWNrZW5kLAo+IHNvIGl0IHdvdWxkIGhhcHBlbiBvbmx5IG9u
Y2UuCj4gCj4gQWxyaWdodCwgSSdsbCBvbmx5IGNoYW5nZSBmcm9udGVuZF9zZXRfc3RhdGUoKSBh
bmQgdXNlICdwdWJsaXNoJy4KClRoYW5rcyA6LSkKCiAgUGF1bAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
