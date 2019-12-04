Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47455112FE4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:23:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXMS-00064f-87; Wed, 04 Dec 2019 16:18:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WV3s=Z2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1icXMQ-00064W-Ir
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:18:42 +0000
X-Inumbo-ID: bc784518-16b1-11ea-8206-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc784518-16b1-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575476322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IFCJENlrhctN6g2834i6NeWmshqjG2lX2gWKdbFVfBo=;
 b=PxWCWJ7M9QhN4GkODOmGU6utaWXm0L7vLKRwc5FPyblH5rBiU/7ShT10
 75Mg3Vh+ffFcBau9aAn17jMUo00Fy1uVZuRbypPiHJrpyuL6PjK6/ciGk
 gTaUIid9MLtVChjJfphNJkaCvHnhs/M+bKc3pWeWnCIRy50qkDh3AT9n0 Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: H0o/zviS0Mt2413RfuanaJ6zaJzz3Yp+A+9AGK/AVFn3AQiZ/FwfaKE7NLUtJzfKjx1W88SFw3
 jnSgMCuA981ODTIMfjEK9MR8pRCyGLlBP3FvYPbxuKhhb0d9w/5DYUxMHPc//z5ZrmJN1AKrjS
 C2ZN+7c7eVyCatTE7IpDF+8Gy2srwX6/fVd8yJw01GX9m52a6X4GYk2FXm2FKmRbAWEpzdKC3Y
 Gp80j0LzhJLsP4rnW9E0gts1wdV4bJrO2We3Or2c2lDBHb8G9R5bFzuzQGYjwmUoAXqqAGAcLv
 ABI=
X-SBRS: 2.7
X-MesageID: 9200620
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,277,1571716800"; 
   d="scan'208";a="9200620"
Date: Wed, 4 Dec 2019 17:18:34 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191204161834.GM980@Air-de-Roger>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMDU6MTE6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9t
YWluLmMKPiA+IEBAIC0xMTgsNiArMTE4LDE5IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vl
c3RfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKPiA+ICAgICAg
ICAgICAgICAobW11X2NyNF9mZWF0dXJlcyAmIFBWX0NSNF9HVUVTVF9WSVNJQkxFX01BU0spKTsK
PiA+ICB9Cj4gPiAgCj4gPiArc3RhdGljIGludDhfdCBfX3JlYWRfbW9zdGx5IG9wdF9nbG9iYWxf
cGFnZXMgPSAtMTsKPiA+ICtib29sZWFuX3J1bnRpbWVfcGFyYW0oImdsb2JhbC1wYWdlcyIsIG9w
dF9nbG9iYWxfcGFnZXMpOwo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHBnZV9pbml0KHZv
aWQpCj4gPiArewo+ID4gKyAgICBpZiAoIG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgKQo+ID4gKyAg
ICAgICAgb3B0X2dsb2JhbF9wYWdlcyA9ICFjcHVfaGFzX2h5cGVydmlzb3IgfHwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgIT0gWDg2X1ZF
TkRPUl9BTUQ7Cj4gPiArCj4gPiArICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICtfX2luaXRjYWxs
KHBnZV9pbml0KTsKPiA+ICsKPiA+ICB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0
cnVjdCB2Y3B1ICp2KQo+ID4gIHsKPiA+ICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYt
PmRvbWFpbjsKPiA+IEBAIC0xMzAsNyArMTQzLDcgQEAgdW5zaWduZWQgbG9uZyBwdl9tYWtlX2Ny
NChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKPiA+ICAgICAgICovCj4gPiAgICAgIGlmICggZC0+YXJj
aC5wdi5wY2lkICkKPiA+ICAgICAgICAgIGNyNCB8PSBYODZfQ1I0X1BDSURFOwo+ID4gLSAgICBl
bHNlIGlmICggIWQtPmFyY2gucHYueHB0aSApCj4gPiArICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5w
di54cHRpICYmIG9wdF9nbG9iYWxfcGFnZXMgKQo+ID4gICAgICAgICAgY3I0IHw9IFg4Nl9DUjRf
UEdFOwo+IAo+IEknbSBzb3JyeSBmb3Igbm90aWNpbmcgdGhpcyBvbmx5IG5vdywgYnV0IHdoYXQg
YWJvdXQgWEVOX01JTklNQUxfQ1I0LAo+IHdoaWNoIGluY2x1ZGVzIFg4Nl9DUjRfUEdFPwoKSSd2
ZSB0cmllZCByZW1vdmluZyBQR0UgZnJvbSBYRU5fTUlOSU1BTF9DUjQgYnV0IGl0IG1hZGUgbm8g
bm90aWNlYWJsZQpwZXJmb3JtYW5jZSBkaWZmZXJlbmNlLCBzbyBJIGxlZnQgaXQgYXMtaXMuCgo+
IAo+IEkgYWxzbyBoYXZlIHRvIGFkbWl0IEknbSBzdGlsbCBmZWVsaW5nIHVuZWFzeSBhYm91dCB0
aGUgcnVudGltZQo+IGFkanVzdG1lbnQgeW91IHBlcm1pdC4gSSBjYW4ndCBwb2ludCBhdCBhbnl0
aGluZyB0aGF0J3Mgd3JvbmcgaW4gdGhpcwo+IHJlZ2FyZCwgYnV0IGFueXdheS4KCkZlZWwgZnJl
ZSB0byBjaGFuZ2UgYm9vbGVhbl9ydW50aW1lX3BhcmFtIGludG8gYm9vbGVhbl9wYXJhbS4gSSB0
aGluawphbGxvd2luZyBydW50aW1lIGNoYW5nZXMgaXMgZmluZSBiZWNhdXNlIHRoZSBmbHVzaCB0
YWtlcyBpbnRvIGFjY291bnQKdGhlIGN1cnJlbnQgQ1I0LCBidXQgbWF5YmUgdGhlcmUgYXJlIGNv
cm5lciBjYXNlcyBJJ20gbm90IGF3YXJlIG9mLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
