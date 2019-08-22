Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1298DCC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 10:35:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0iXC-0004mz-5F; Thu, 22 Aug 2019 08:33:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0iXA-0004mr-5t
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 08:33:28 +0000
X-Inumbo-ID: 8310f2a8-c4b7-11e9-add2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8310f2a8-c4b7-11e9-add2-12813bfff9fa;
 Thu, 22 Aug 2019 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566462808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTqK/Y17+m2CVOhi1BSEkbaSrE7Sr2aJl3cSVyND94o=;
 b=YHxXohEllx4AzGnGfXxY8phZ8hOvgQYHBz2u5YEq/giFlX5Dc5bvbxN8
 1ADkL8tzG25RrYduLjpYr6O7JB5/GgfjKHR33qd1lY72V77ESppNhUjHP
 PGfg9KgMT6VJn0qKyamHqGQRO76hBMqWryx1a2axH6UA9KWHjKRIe9e5N o=;
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
IronPort-SDR: EdvrzaPFOV67dwlMH7y/Z8h8ejfCMQZ3a9WGP4a3WDrAWDH4RdG12aO2wKW2RAdrewnxlDDjlx
 fPhBGgz539J/6E8BT6PjwAn0Q+JhOkveCN0vcWyaPQQCaSYkuKn33p5du5te3dfuZgPLYYMpSQ
 Mv9zOKzwlE3R5vHomKFZwd8B3v4PGQ9WcILi6eHgx1Fxh5MMpQ209jS7d1Y74aCTCllGAQJdTm
 L+QrqtYuOnJP2gaNJQFh48Z9Ae66Mt1zq33pQFaStLVTwKc+fa8USwBdIv4mqYlyM8LP6t5VII
 z/U=
X-SBRS: 2.7
X-MesageID: 4572045
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4572045"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 3/7] ioreq: allow dispatching ioreqs to internal servers
Thread-Index: AQHVWDENzumIAV6ZWEmsnxjuoJWjIacFylMQgADdmgCAAC+awA==
Date: Thu, 22 Aug 2019 08:33:23 +0000
Message-ID: <9db1046870d14227819af9f5ceaabd7e@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-4-roger.pau@citrix.com>
 <9428742b49454a0782a618dc246b9a56@AMSPEX02CL03.citrite.net>
 <20190822074050.vg2pmxl662d34nat@Air-de-Roger>
In-Reply-To: <20190822074050.vg2pmxl662d34nat@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/7] ioreq: allow dispatching ioreqs to
 internal servers
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjIgQXVndXN0IDIwMTkgMDg6NDEKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcg
Q29vcGVyCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy83XSBpb3JlcTogYWxsb3cgZGlzcGF0Y2hpbmcgaW9y
ZXFzIHRvIGludGVybmFsIHNlcnZlcnMKPiAKPiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwNjoy
OTowNFBNICswMjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Cj4gPiA+IFNlbnQ6IDIxIEF1Z3VzdCAyMDE5IDE1OjU5Cj4gPiA+IFRvOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPiA+ID4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgSmFu
IEJldWxpY2gKPiA+ID4gPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+IFN1YmplY3Q6
IFtQQVRDSCAzLzddIGlvcmVxOiBhbGxvdyBkaXNwYXRjaGluZyBpb3JlcXMgdG8gaW50ZXJuYWwg
c2VydmVycwo+ID4gPgo+ID4gPiBJbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzIGFyZSBhbHdheXMgcHJv
Y2Vzc2VkIGZpcnN0LCBhbmQgaW9yZXFzIGFyZQo+ID4gPiBkaXNwYXRjaGVkIGJ5IGNhbGxpbmcg
dGhlIGhhbmRsZXIgZnVuY3Rpb24uIElmIG5vIGludGVybmFsIHNlcnZlcnMgaGF2ZQo+ID4gPiBy
ZWdpc3RlcmVkIGZvciBhbiBpb3JlcSBpdCdzIHRoZW4gZm9yd2FyZGVkIHRvIGV4dGVybmFsIGNh
bGxlcnMuCj4gPgo+ID4gRGlzdGluY3QgaWQgcmFuZ2VzIHdvdWxkIGhlbHAgaGVyZS4uLiBJbnRl
cm5hbCBpZHMgY291bGQgYmUgd2Fsa2VkIGZpcnN0LCB0aGVuIGV4dGVybmFsLiBJZiB0aGVyZSdz
Cj4gbm8gcG9zc2liaWxpdHkgb2YgaW50ZXJsZWF2aW5nIHRoZW4geW91IGRvbid0IG5lZWQgdGhl
IHJldHJ5Lgo+IAo+IFNvIGlmIGludGVybmFsIHZzIGV4dGVybmFsIGlzIGtleWVkIG9uIHRoZSBJ
RCB0aGVuIHdlIHdvdWxkIGVuZCB1cAo+IHdpdGggdHdvIGRpZmZlcmVudCBhcnJheXMgaW4gaHZt
X2RvbWFpbiwgb25lIGZvciBpbnRlcm5hbCBhbmQgb25lIGZvcgo+IGV4dGVybmFsIGlvcmVxIHNl
cnZlcnMuCj4gCj4gTWF5YmUgaW5zdGVhZCBvZiBteSBwcmV2aW91cyBzdWdnZXN0aW9uIGl0IHdv
dWxkIGJlIGJldHRlciB0byBqdXN0Cj4gZGVmaW5lIGNvbnNlY3V0aXZlIHJhbmdlcyBmb3IgZXh0
ZXJuYWwgYW5kIGludGVybmFsIHNlcnZlcnMsIGxpa2U6Cj4gCj4gI2RlZmluZSBNQVhfTlJfRVhU
RVJOQUxfSU9SRVFfU0VSVkVSUyA4Cj4gI2RlZmluZSBNQVhfTlJfSU5URVJOQUxfSU9SRVFfU0VS
VkVSUyAxCj4gI2RlZmluZSBNQVhfTlJfSU9SRVFfU0VSVkVSUyBcCj4gICAgIChNQVhfTlJfRVhU
RVJOQUxfSU9SRVFfU0VSVkVSUyArIE1BWF9OUl9JTlRFUk5BTF9JT1JFUV9TRVJWRVJTKQo+IAo+
ICNkZWZpbmUgRk9SX0VBQ0hfSU9SRVFfU0VSVkVSKGQsIGlkLCBzKSBcCj4gICAgIGZvciAoIChp
ZCkgPSBNQVhfTlJfSU9SRVFfU0VSVkVSUyAqIDI7IChpZCkgIT0gMDsgKSBcCj4gICAgICAgICBp
ZiAoICEocyA9IEdFVF9JT1JFUV9TRVJWRVIoZCwgLS0oaWQpKSkgKSBcCj4gICAgICAgICAgICAg
Y29udGludWU7IFwKPiAgICAgICAgIGVsc2UKPiAKPiAjZGVmaW5lIEZPUl9FQUNIX0lOVEVSTkFM
X0lPUkVRX1NFUlZFUihkLCBpZCwgcykgXAo+ICAgICBmb3IgKCAoaWQpID0gTUFYX05SX0lPUkVR
X1NFUlZFUlM7IChpZCkgPiBNQVhfTlJfSU5URVJOQUxfSU9SRVFfU0VSVkVSUyAmJiAoaWQpICE9
IDA7ICkgXAo+ICAgICAgICAgaWYgKCAhKHMgPSBHRVRfSU9SRVFfU0VSVkVSKGQsIC0tKGlkKSkp
ICkgXAo+ICAgICAgICAgICAgIGNvbnRpbnVlOyBcCj4gICAgICAgICBlbHNlCj4gCj4gI2RlZmlu
ZSBGT1JfRUFDSF9FWFRFUk5BTF9JT1JFUV9TRVJWRVIoZCwgaWQsIHMpIFwKPiAgICAgZm9yICgg
KGlkKSA9IE1BWF9OUl9JTlRFUk5BTF9JT1JFUV9TRVJWRVJTOyAoaWQpICE9IDA7ICkgXAo+ICAg
ICAgICAgaWYgKCAhKHMgPSBHRVRfSU9SRVFfU0VSVkVSKGQsIC0tKGlkKSkpICkgXAo+ICAgICAg
ICAgICAgIGNvbnRpbnVlOyBcCj4gICAgICAgICBlbHNlCj4gCj4gVGhhdCB3b3VsZCBhbHNvIGZv
cmNlIEZPUl9FQUNIX0lPUkVRX1NFUlZFUiB0byBhbHdheXMgcHJvY2VzcyBpbnRlcm5hbAo+IGlv
cmVxIHNlcnZlcnMgZmlyc3QuCgpFeGFjdGx5IHdoYXQgSSB3YXMgdGhpbmtpbmcuCgo+IAo+IFdl
IGNvdWxkIGV2ZW4gaGF2ZSBzb21ldGhpbmcgbGlrZToKPiAKPiB1bmlvbiB7Cj4gICAgIHN0cnVj
dCB7Cj4gICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqZXh0ZXJuYWxfc2VydmVyW01B
WF9OUl9FWFRFUk5BTF9JT1JFUV9TRVJWRVJTXTsKPiAgICAgICAgIHN0cnVjdCBodm1faW9yZXFf
c2VydmVyICppbnRlcm5hbF9zZXJ2ZXJbTUFYX05SX0lOVEVSTkFMX0lPUkVRX1NFUlZFUlNdOwo+
ICAgICB9Cj4gICAgIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzZXJ2ZXJbTUFYX05SX0lPUkVR
X1NFUlZFUlNdOwo+IH0KPiAKPiBJbiBvcmRlciB0byBzcGxpdCB0aGUgYXJyYXlzIGlmIHJlcXVp
cmVkLgo+IAoKSSdkIG5vdCBjb25zaWRlcmVkIGEgdW5pb24sIGJ1dCBpdCBtYWtlcyBzZW5zZSA6
LSkKCiAgUGF1bAoKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
