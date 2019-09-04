Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4E4A84C0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:59:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Vlg-0005b8-9U; Wed, 04 Sep 2019 13:56:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hQbx=W7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i5Vle-0005b3-Pm
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:56:14 +0000
X-Inumbo-ID: c1f1ebee-cf1b-11e9-b299-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1f1ebee-cf1b-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567605374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=moaxuBCWtXVDT1qwzm1qHoA6Ent4YOP9KiYd7eX96aA=;
 b=cSNaGgwnCDakR5i1lAiKH+qXloLil3dUjOhEXqNcvQDxZ1YDtmAhNVTG
 RETMHBdsOqm8LbO2KaW+ii6RinW5BH8dNmOsAQVl6hRrQMrKz/uWjPmoV
 vmTLFCfPWOFoM4DQwLpBPE/hJKceXDYIwB9CrE2VLt7WJYL3sMu/eGfmo M=;
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
IronPort-SDR: nPoAyrWdc/bGtavIhGj9tSLls77FosNz1TQr0/33V1xihPA+4eX4X9OtoV3PCK10ZAUoKm3D7D
 zGTihqOqqZqF255shbf2itOIsAFd1kfbRBbO9wtPWhwMIWdtYQm6ljb/ZcwLLDsDn71aOFw+Xn
 9xzC5bRI6GMQlJvYPANqwD6ETvM8LiKVx8gMFrVv/68sxhfDOLOvPHfRjNsZ1TCJAFAjjbr/zM
 wh0JXik7SE4wjFmMDN7YLpvhcDviddjZMVYk2yBvfOoO7B41hV0KWTzq2RKi7lSApgrU/V2BEj
 dyw=
X-SBRS: 2.7
X-MesageID: 5340346
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5340346"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 02/11] ioreq: terminate cf8 handling at hypervisor
 level
Thread-Index: AQHVYnKx5qeoEGPma0OmaOPJSQUZyqcaD4aAgAD0loCAAED5sIAAIPmAgAAlwBA=
Date: Wed, 4 Sep 2019 13:56:10 +0000
Message-ID: <92821b5ab3b04714a83617eff89b753d@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-3-roger.pau@citrix.com>
 <c626a063-f657-d614-eea5-dcfca3df46f0@citrix.com>
 <20190904074923.ji76uhn2kr7rff4b@Air-de-Roger>
 <a0d458949642478786ce606761bf2726@AMSPEX02CL03.citrite.net>
 <20190904133957.2g2sxfvhfbf7n3x3@Air-de-Roger>
In-Reply-To: <20190904133957.2g2sxfvhfbf7n3x3@Air-de-Roger>
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMDQgU2VwdGVtYmVyIDIwMTkgMTQ6NDAKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3Bl
ciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgSmFuIEJldWxpY2gKPiA8amJldWxpY2hAc3VzZS5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDIvMTFdIGlvcmVxOiB0ZXJtaW5hdGUgY2Y4
IGhhbmRsaW5nIGF0IGh5cGVydmlzb3IgbGV2ZWwKPiAKPiBPbiBXZWQsIFNlcCAwNCwgMjAxOSBh
dCAxMTo0NjoyNEFNICswMjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gPiA+IFNlbnQ6IDA0IFNlcHRlbWJlciAyMDE5IDA4OjQ5Cj4gPiA+IFRvOiBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPgo+ID4gPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPjsgSmFuIEJldWxpY2gKPiA+ID4gPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz4KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMi8xMV0gaW9yZXE6IHRl
cm1pbmF0ZSBjZjggaGFuZGxpbmcgYXQgaHlwZXJ2aXNvciBsZXZlbAo+ID4gPgo+ID4gPiBPbiBU
dWUsIFNlcCAwMywgMjAxOSBhdCAwNjoxMzo1OVBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+ID4gPiA+IE9uIDAzLzA5LzIwMTkgMTc6MTQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+
ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMKPiA+ID4gPiA+IGluZGV4IDY5MmI3MTBiMDIuLjY5NjUyZTEwODAgMTAw
NjQ0Cj4gPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKPiA+ID4gPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+ID4gPiA+ID4gQEAgLTEwMTUsNiArMTAxNSwx
MiBAQCBpbnQgaHZtX21hcF9pb19yYW5nZV90b19pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAq
ZCwgaW9zZXJ2aWRfdCBpZCwKPiA+ID4gPiA+ICAgICAgc3dpdGNoICggdHlwZSApCj4gPiA+ID4g
PiAgICAgIHsKPiA+ID4gPiA+ICAgICAgY2FzZSBYRU5fRE1PUF9JT19SQU5HRV9QT1JUOgo+ID4g
PiA+ID4gKyAgICAgICAgcmMgPSAtRUlOVkFMOwo+ID4gPiA+ID4gKyAgICAgICAgLyogUENJIGNv
bmZpZyBzcGFjZSBhY2Nlc3NlcyBhcmUgaGFuZGxlZCBpbnRlcm5hbGx5LiAqLwo+ID4gPiA+ID4g
KyAgICAgICAgaWYgKCBzdGFydCA8PSAweGNmOCArIDggJiYgMHhjZjggPD0gZW5kICkKPiA+ID4g
PiA+ICsgICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gPiA+ICsgICAgICAgIGVsc2UKPiA+ID4g
PiA+ICsgICAgICAgICAgICAvKiBmYWxsdGhyb3VnaC4gKi8KPiA+ID4gPgo+ID4gPiA+IFlvdSBu
ZWVkIHRvIGRyb3AgdGhlIGVsc2UsIG9yIGl0IG1heSBzdGlsbCB0cmlnZ2VyIHdhcm5pbmdzLgo+
ID4gPgo+ID4gPiBZZXMsIG15IG1pc3Rha2UuIFRoZSBlbHNlIGJyYW5jaCBpcyBub3QgbmVlZGVk
Lgo+ID4gPgo+ID4gPiA+IEZ1cnRoZXJtb3JlLCBxZW11IHJlZ2lzdGVycyBjZjgtY2ZmIHNvIEkg
dGhpbmsgeW91IG5lZWQgc29tZSBmaXgtdXBzCj4gPiA+ID4gdGhlcmUgZmlyc3QgYmVmb3JlIHRo
cm93aW5nIGVycm9ycyBiYWNrIGhlcmUuCj4gPiA+Cj4gPiA+IFRoZSB2ZXJzaW9uIG9mIFFFTVUg
SSBoYXZlIGRvZXNuJ3Qgc2VlbSB0byByZWdpc3RlciAweGNmOCBvciAweGNmYywKPiA+ID4gdGhl
cmUgYXJlIG5vIGVycm9ycyBvbiB0aGUgbG9nIGFuZCBRRU1VIHNlZW1zIHRvIHdvcmsganVzdCBm
aW5lLgo+ID4gPgo+ID4gPiBJIGFsd2F5cyBhc3N1bWVkIFFFTVUgd2FzIGdldHRpbmcgYWNjZXNz
ZXMgdG8gY2Y4L2NmYyBmb3J3YXJkZWQKPiA+ID4gYmVjYXVzZSBpdCB3YXMgdGhlIGRlZmF1bHQg
ZGV2aWNlIG1vZGVsLCBhbmQgZXZlcnl0aGluZyBub3QgdHJhcHBlZCBieQo+ID4gPiBYZW4gd291
bGQgYmUgZm9yd2FyZGVkIHRvIGl0LiBUaGlzIGRlZmF1bHQgZGV2aWNlIG1vZGVsIGJlaGF2aW91
ciB3YXMKPiA+ID4gcmVtb3ZlZCBieSBQYXVsIHNvbWUgdGltZSBhZ28sIGFuZCBub3cgUUVNVSBy
ZWdpc3RlcnMgZXhwbGljaXRseSB3aGljaAo+ID4gPiBJTyBhY2Nlc3NlcyBpdCB3YW50cyB0byB0
cmFwLgo+ID4KPiA+IFllcywgaXQgdXNlZCB0byBuZWVkIHRoZW0gdG8gd29yayBjb3JyZWN0bHkg
YXMgYSBkZWZhdWx0IGVtdWxhdG9yLiBIb3dldmVyLCB3ZSBkb24ndCBnZW5lcmFsbHkgc3RvcAo+
IGFuIGV4dGVybmFsIGVtdWxhdG9yIGZyb20gcmVnaXN0ZXJpbmcgcmFuZ2VzIHRoYXQgYXJlIGhh
bmRsZWQgYnkgZW11bGF0aW9uIGRpcmVjdGx5IGluIFhlbiAoZS5nLgo+IHBtdGltZXIpIHNvIEkg
ZG9uJ3QgdGhpbmsgeW91IG5lZWQgc3BlY2lhbC1jYXNlIHRoZXNlIHBvcnRzLgo+IAo+IFRoYXQn
cyByaWdodCwgc28gSSBndWVzcyBJIHdvdWxkIGp1c3QgcmVtb3ZlIHRoYXQgY2hlY2sgKGFuZCB0
aGUgb25lCj4gaW50cm9kdWNlZCBmb3IgTUNGRyByZWdpb25zKS4gV2UgYWxzbyBkb24ndCBjaGVj
ayB3aGV0aGVyIGFueSBvdGhlcgo+IGlvcmVxIHNlcnZlciBoYXMgYWxyZWFkeSByZWdpc3RlcmVk
IGEgcmFuZ2UuCgpUaGF0J3MgcmlnaHQuLi4gaXQncyBhIGxhc3Qtb25lLXdpbnMgZ2FtZS4gV2Ug
Y291bGQgZGVjaWRlIHRvIGNoYW5nZSB0aGlzIGluIGZ1dHVyZSwgYnV0IGl0IGlzIHF1aXRlIGNv
bnZlbmllbnQgZm9yIHRlc3RpbmcgcHVycG9zZXMuCgogIFBhdWwKCj4gCj4gVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
