Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C88C183822
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 19:02:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCS7K-0003ki-CD; Thu, 12 Mar 2020 17:59:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCS7I-0003kd-Po
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 17:59:32 +0000
X-Inumbo-ID: 39717e3c-648b-11ea-92cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39717e3c-648b-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584035971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DJOPjKEXvoWxaXWF4BN3vnQMlRY/Y7RzMpZbnYG8NKg=;
 b=UIddwpEQ+n12VVlrBpvxtYq5/MAVYCOfD0UP8IGa9fTn1mvrQbVq/XKI
 0CL8KijdOmIL8738zxSEdWUcIKMr0jE0iTFGxRLEkBIEPQwh09wNRoTnn
 6GHj7H7e/sRiMejnzhCrW2Iy0KUv8JVvJAQHy2X5B4lqJ6LMVgMrEFT3y w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P3Wko6tNGE1aaYz+KWHg8kVjDprC7iOXVzs8LwZo7sg7YjXuZHyLmFs4I+zAUC4y9zCtAmktne
 WOl2TlNO5K04bx0IoYvqejLMe/vtUrBemw5JsLot9sXwu0cWmjNHZz44C40bDoUXCURHiQjUj9
 d7yYCzHYmSaYOuu/UzeMQsXRYD0H53KlzirKfDxmYeMgQzCKcOaA5zrJ/1oxp19llKbedfAZfO
 gc8cpXDV6ig01H5HcM1sZp058MDywYbjwwLxJYqPAHotdp+y9dllF5WQpKYcXVqs/K0OeKEuyz
 B7A=
X-SBRS: 2.7
X-MesageID: 14494164
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14494164"
Date: Thu, 12 Mar 2020 18:59:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20200312175924.GM24458@Air-de-Roger.citrite.net>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <20200312150852.GK24458@Air-de-Roger.citrite.net>
 <be999c842f3a47cffd14fe0709568fdd4580316a.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be999c842f3a47cffd14fe0709568fdd4580316a.camel@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/2] xen: credit2: fix vcpu starvation due
 to too few credits
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Glen <glenbarney@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Sarah Newman <srn@prgmr.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDY6MDI6MDNQTSArMDEwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gT24gVGh1LCAyMDIwLTAzLTEyIGF0IDE2OjA4ICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gVGhhbmtzIGZvciBsb29raW5nIGludG8gdGhpcywgc2VlbXMgbGlrZSBh
IHNwZWNpYWxseSB0cmlja3kgaXNzdWUgdG8KPiA+IHRhY2tsZSEKPiA+IAo+IEl0IHdhcyB0cmlj
a3kgaW5kZWVkISA6LSkKPiAKPiA+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDAyOjQ0OjA3UE0g
KzAxMDAsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+ID4gWy4uLl0KPiA+ID4gRm9yIGV4YW1wbGUs
IEkgaGF2ZSBhIHRyYWNlIHNob3dpbmcgdGhhdCBjc2NoZWQyX3NjaGVkdWxlKCkgaXMKPiA+ID4g
aW52b2tlZCBhdAo+ID4gPiB0PTU3OTcwNzQ2MTU1bnMuIEF0IHQ9NTc5NzA3NDc2NThucyAoKzE1
MDNucykgdGhlIHNfdGltZXIgaXMgc2V0IHRvCj4gPiA+IGZpcmUgYXQgdD01Nzk3OTQ4NTA4M25z
LCBpLmUuLCA4NzM4OTI4bnMgaW4gZnV0dXJlLiBUaGF0J3MgYmVjYXVzZQo+ID4gPiBjcmVkaXQK
PiA+ID4gb2Ygc25leHQgaXMgZXhhY3RseSB0aGF0IDg3Mzg5Mjhucy4gVGhlbiwgd2hhdCBJIHNl
ZSBpcyB0aGF0IHRoZQo+ID4gPiBuZXh0Cj4gPiA+IGNhbGwgdG8gYnVybl9jcmVkaXRzKCksIGNv
bWluZyBmcm9tIGNzY2hlZDJfc2NoZWR1bGUoKSBmb3IgdGhlIHNhbWUKPiA+ID4gdkNQVQo+ID4g
PiBoYXBwZW5zIGF0IHQ9NjAwODMyODM2MTducy4gVGhhdCBpcyAqYSBsb3QqICgyMTAzNzk4NTM0
bnMpIGxhdGVyCj4gPiA+IHRoYW4KPiA+ID4gd2hlbiB3ZSBleHBlY3RlZCBhbmQgYXNrZWQuIE9m
IGNvdXJzZSwgdGhhdCBhbHNvIG1lYW5zIHRoYXQgZGVsdGEKPiA+ID4gaXMKPiA+ID4gMjExMjUz
NzQ2Mm5zLCBhbmQgdGhlcmVmb3JlIGNyZWRpdHMgd2lsbCBzaW5rIHRvIC0yMTAzNzk4NTM0IQo+
ID4gCj4gPiBXaGljaCB0aW1lciBkb2VzIHRoaXMgaGFyZHdhcmUgdXNlPyBEWUsgaWYgdGhlcmUn
cyBzb21lIHJlbGF0aW9uCj4gPiBiZXR3ZWVuIHRoZSB0aW1lciBoYXJkd2FyZSB1c2VkIGFuZCB0
aGUgaXNzdWU/Cj4gPiAKPiBUaW1lcnMgY2FtZSB0byBtaW5kIGJ1dCBJIGhhdmVuJ3QgY2hlY2tl
ZCB5ZXQuCj4gCj4gRldJVywgb25lIHRoaW5nIEkgc2F3IGlzIHRoYXQsIHdpdGhvdXQgcGF0Y2hl
cywgbXkgbWFjaGluZSB0aW1lcyBvdXQKPiBhcm91bmQuLi4KPiAKPiBbICAgIDIuMzY0ODE5XSBO
RVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2Cj4gWyAgICAyLjM2ODAxOF0geGVuOmdy
YW50X3RhYmxlOiBHcmFudCB0YWJsZXMgdXNpbmcgdmVyc2lvbiAxIGxheW91dAo+IFsgICAgMi4z
NzIwMzNdIEdyYW50IHRhYmxlIGluaXRpYWxpemVkCj4gWyAgICAyLjM3NzExNV0gQUNQSTogYnVz
IHR5cGUgUENJIHJlZ2lzdGVyZWQKPiBbICAgIDIuMzgwMDExXSBhY3BpcGhwOiBBQ1BJIEhvdCBQ
bHVnIFBDSSBDb250cm9sbGVyIERyaXZlciB2ZXJzaW9uOiAwLjUKPiBbICAgIDIuMzg0NjYwXSBQ
Q0k6IE1NQ09ORklHIGZvciBkb21haW4gMDAwMCBbYnVzIDAwLWZmXSBhdCBbbWVtIDB4ODAwMDAw
MDAtMHg4ZmZmZmZmZl0gKGJhc2UgMHg4MDAwMDAwMCkKPiBbICAgIDIuMzg4MDMzXSBQQ0k6IE1N
Q09ORklHIGF0IFttZW0gMHg4MDAwMDAwMC0weDhmZmZmZmZmXSByZXNlcnZlZCBpbiBFODIwCj4g
WyAgICAyLjQ5OTA4MF0gUENJOiBVc2luZyBjb25maWd1cmF0aW9uIHR5cGUgMSBmb3IgYmFzZSBh
Y2Nlc3MKPiBbICAgIDIuNTE2NzY4XSBBQ1BJOiBBZGRlZCBfT1NJKE1vZHVsZSBEZXZpY2UpCj4g
WyAgICAyLjUyNDAwNl0gQUNQSTogQWRkZWQgX09TSShQcm9jZXNzb3IgRGV2aWNlKQo+IFsgICAg
Mi41MzYwMDRdIEFDUEk6IEFkZGVkIF9PU0koMy4wIF9TQ1AgRXh0ZW5zaW9ucykKPiBbICAgIDIu
NTQ0MDAzXSBBQ1BJOiBBZGRlZCBfT1NJKFByb2Nlc3NvciBBZ2dyZWdhdG9yIERldmljZSkKPiBb
ICAgIDIuODE2MDIyXSBBQ1BJOiA0IEFDUEkgQU1MIHRhYmxlcyBzdWNjZXNzZnVsbHkgYWNxdWly
ZWQgYW5kIGxvYWRlZAo+IFsgICAgMi44NTIwMTFdIHhlbjogcmVnaXN0ZXJpbmcgZ3NpIDkgdHJp
Z2dlcmluZyAwIHBvbGFyaXR5IDAKPiBbICAgIDIuODU2MDIxXSBBQ1BJOiBbRmlybXdhcmUgQnVn
XTogQklPUyBfT1NJKExpbnV4KSBxdWVyeSBpZ25vcmVkCj4gCj4gLi4uIGhlcmUsIGR1cmluZyBk
b20wIGJvb3QuCj4gCj4gWyAgICAyLjg3MTYxNV0gQUNQSTogRHluYW1pYyBPRU0gVGFibGUgTG9h
ZDoKPiBbICAgIDIuOTQxOTQ1XSBBQ1BJOiBJbnRlcnByZXRlciBlbmFibGVkCj4gWyAgICAyLjk1
MjAyMV0gQUNQSTogKHN1cHBvcnRzIFMwIFMzIFM0IFM1KQo+IFsgICAgMi45NjAwMDRdIEFDUEk6
IFVzaW5nIElPQVBJQyBmb3IgaW50ZXJydXB0IHJvdXRpbmcKPiBbICAgIDIuOTcyMDMxXSBQQ0k6
IFVzaW5nIGhvc3QgYnJpZGdlIHdpbmRvd3MgZnJvbSBBQ1BJOyBpZiBuZWNlc3NhcnksIHVzZSAi
cGNpPW5vY3JzIiBhbmQgcmVwb3J0IGEgYnVnCj4gWyAgICAyLjk5MzAzMl0gQUNQSTogRW5hYmxl
ZCA2IEdQRXMgaW4gYmxvY2sgMDAgdG8gM0YKPiBbICAgIDMuMDQyNDc4XSBBQ1BJOiBQQ0kgUm9v
dCBCcmlkZ2UgW1VOQzFdIChkb21haW4gMDAwMCBbYnVzIGZmXSkKPiBbICAgIDMuMDU2MDEwXSBh
Y3BpIFBOUDBBMDM6MDI6IF9PU0M6IE9TIHN1cHBvcnRzIFtFeHRlbmRlZENvbmZpZyBBU1BNIENs
b2NrUE0gU2VnbWVudHMgTVNJXQo+IFsgICAgMy4wNzk3MDddIGFjcGkgUE5QMEEwMzowMjogX09T
QzogcGxhdGZvcm0gZG9lcyBub3Qgc3VwcG9ydCBbU0hQQ0hvdHBsdWcgTFRSXQo+IFsgICAgMy4w
OTg5OTldIGFjcGkgUE5QMEEwMzowMjogX09TQzogT1Mgbm93IGNvbnRyb2xzIFtQQ0llSG90cGx1
ZyBQTUUgQUVSIFBDSWVDYXBhYmlsaXR5XQo+IAo+IFdoYXQgZG8geW91IG1lYW4gd2l0aCAiV2hp
Y2ggdGltZXIgZG9lcyB0aGlzIGhhcmR3YXJlIHVzZSIgPwoKWGVuIHVzZXMgYSBoYXJkd2FyZSB0
aW1lciAoSFBFVCwgUE1USU1FUiBvciBQSVQgSUlSQykgaW4gb3JkZXIgdG8gZ2V0CmludGVycnVw
dHMgYXQgc3BlY2lmaWVkIHRpbWVzLCBvbiBteSBib3ggSSBzZWUgZm9yIGV4YW1wbGU6CgooWEVO
KSBQbGF0Zm9ybSB0aW1lciBpcyAyMy45OTlNSHogSFBFVAoKWW91IHNob3VsZCBhbHNvIHNlZSBz
b21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuIEkgd2FzIHdvbmRlcmluZyBpZgp0aGVyZSB3YXMg
c29tZSByZWxhdGlvbiBiZXR3ZWVuIHRoZSB0aW1lciBpbiB1c2UgYW5kIHRoZSBkZWxheSBpbgp0
aW1lciBpbnRlcnJ1cHRzIHRoYXQgeW91IGFyZSBzZWVpbmcuCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
