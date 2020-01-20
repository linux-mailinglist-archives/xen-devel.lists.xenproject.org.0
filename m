Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81314301B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:41:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ita3e-0007Pv-TW; Mon, 20 Jan 2020 16:37:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ita3e-0007Pq-6S
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:37:46 +0000
X-Inumbo-ID: 2abeb604-3ba3-11ea-aecd-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2abeb604-3ba3-11ea-aecd-bc764e2007e4;
 Mon, 20 Jan 2020 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579538257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MdpsBBI40KK3Dui6IArBCgx28Jf/B9fvwlmGKmm9uZA=;
 b=LtJ/5DNO1wEctDaXxTpVgFGzkhq+bDQyGaL7uSaZIaBbadbd3/dP5bjN
 uRJF1pFDWOBT7Q6XAQaW5mJ7gzxTJH4vovT+u5A+bqR9ABmDkNbRSn3aR
 zZAI43YfpZHeUGwtRBSv6BE9n5SG2mYSQLzF7W/Zc5C4sn4KDVunrVIqK k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OMiruLFaZoh57Jfi8Om3tFPXIlSHrTm1ZSzcDCwq25dwLnxlTOD9rz9iOqkZ6dgmpvqln0gMCJ
 V5xKO1hhRc/XlhHo3MuhZ+zePtqLDwm555DNmL2DQXkLTUUgxaKzFmxP5h3MFGPAlFzbnHlu65
 DyoKFzJksqYNCNo74SOIGyIBthyLFVT6EM8BAXC/CzX5bRYzQBHvaSnBOXO0OZgGxyYR/5Y/9d
 xeRBTNiaGtRqApnM7zqznBEig843hCZALIvWRf6NL27ASXbGd/CBE4TptkLi/9VFzOihvNnAv4
 Ytg=
X-SBRS: 2.7
X-MesageID: 11599328
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11599328"
Date: Mon, 20 Jan 2020 16:37:27 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120163727.GD11756@Air-de-Roger>
References: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
 <20200120160732.GC11756@Air-de-Roger>
 <a3b70e5b-d017-c934-ea84-46e3d653905f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3b70e5b-d017-c934-ea84-46e3d653905f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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
 KevinTian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDU6MTU6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDEuMjAyMCAxNzowNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIEphbiAyMCwgMjAyMCBhdCAwNDo0MjoyMlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ID4+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gPj4gQEAgLTE0OTMsMTgg
KzE0OTMsMjggQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5nKHN0cnVjdAo+ID4+
ICAgICAgICAgIGlmICggZmluZF91cHN0cmVhbV9icmlkZ2Uoc2VnLCAmYnVzLCAmZGV2Zm4sICZz
ZWNidXMpIDwgMSApCj4gPj4gICAgICAgICAgICAgIGJyZWFrOwo+ID4+ICAKPiA+PiArICAgICAg
ICAvKgo+ID4+ICsgICAgICAgICAqIE1hcHBpbmcgYSBicmlkZ2Ugc2hvdWxkLCBpZiBhbnl0aGlu
ZywgcGFzcyB0aGUgc3RydWN0IHBjaV9kZXYgb2YKPiA+PiArICAgICAgICAgKiB0aGF0IGJyaWRn
ZS4gU2luY2UgYnJpZGdlcyBkb24ndCBub3JtYWxseSBnZXQgYXNzaWduZWQgdG8gZ3Vlc3RzLAo+
ID4+ICsgICAgICAgICAqIHRoZWlyIG93bmVyIHdvdWxkIGJlIHRoZSB3cm9uZyBvbmUuIFBhc3Mg
TlVMTCBpbnN0ZWFkLgo+ID4+ICsgICAgICAgICAqLwo+ID4+ICAgICAgICAgIHJldCA9IGRvbWFp
bl9jb250ZXh0X21hcHBpbmdfb25lKGRvbWFpbiwgZHJoZC0+aW9tbXUsIGJ1cywgZGV2Zm4sCj4g
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2dldF9wZGV2
KHNlZywgYnVzLCBkZXZmbikpOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwpOwo+ID4+ICAKPiA+PiAgICAgICAgICAvKgo+ID4+ICAgICAgICAgICAq
IERldmljZXMgYmVoaW5kIFBDSWUtdG8tUENJL1BDSXggYnJpZGdlIG1heSBnZW5lcmF0ZSBkaWZm
ZXJlbnQKPiA+PiAgICAgICAgICAgKiByZXF1ZXN0ZXItaWQuIEl0IG1heSBvcmlnaW5hdGUgZnJv
bSBkZXZmbj0wIG9uIHRoZSBzZWNvbmRhcnkgYnVzCj4gPj4gICAgICAgICAgICogYmVoaW5kIHRo
ZSBicmlkZ2UuIE1hcCB0aGF0IGlkIGFzIHdlbGwgaWYgd2UgZGlkbid0IGFscmVhZHkuCj4gPj4g
KyAgICAgICAgICoKPiA+PiArICAgICAgICAgKiBTb21ld2hhdCBzaW1pbGFyIGFzIGZvciBicmlk
Z2VzLCB3ZSBkb24ndCB3YW50IHRvIHBhc3MgYSBzdHJ1Y3QKPiA+PiArICAgICAgICAgKiBwY2lf
ZGV2IGhlcmUgLSB0aGVyZSBtYXkgbm90IGV2ZW4gZXhpc3Qgb25lIGZvciB0aGlzIChzZWNidXMs
MCwwKQo+ID4+ICsgICAgICAgICAqIHR1cGxlLiBJZiB0aGVyZSBpcyBvbmUsIHdpdGhvdXQgcHJv
cGVybHkgd29ya2luZyBkZXZpY2UgZ3JvdXBzIGl0Cj4gPj4gKyAgICAgICAgICogbWF5IGFnYWlu
IG5vdCBoYXZlIHRoZSBjb3JyZWN0IG93bmVyLgo+ID4+ICAgICAgICAgICAqLwo+ID4+ICAgICAg
ICAgIGlmICggIXJldCAmJiBwZGV2X3R5cGUoc2VnLCBidXMsIGRldmZuKSA9PSBERVZfVFlQRV9Q
Q0llMlBDSV9CUklER0UgJiYKPiA+PiAgICAgICAgICAgICAgIChzZWNidXMgIT0gcGRldi0+YnVz
IHx8IHBkZXYtPmRldmZuICE9IDApICkKPiA+PiAgICAgICAgICAgICAgcmV0ID0gZG9tYWluX2Nv
bnRleHRfbWFwcGluZ19vbmUoZG9tYWluLCBkcmhkLT5pb21tdSwgc2VjYnVzLCAwLAo+ID4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZ2V0X3BkZXYo
c2VnLCBzZWNidXMsIDApKTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCk7Cj4gPiAKPiA+IElzbid0IGl0IGRhbmdlcm91cyB0byBtYXAgdGhp
cyBkZXZpY2UgdG8gdGhlIGd1ZXN0LCBhbmQgdGhhdCBtdWx0aXBsZQo+ID4gZ3Vlc3RzIG1pZ2h0
IGVuZCB1cCB3aXRoIHRoZSBzYW1lIGRldmljZSBtYXBwZWQ/Cj4gCj4gVGhleSB3b24ndCAoYWZh
aWN0KSAtIHNlZSB0aGUgY2hlY2tpbmcgZG9uZSBieSBkb21haW5fY29udGV4dF9tYXBwaW5nX29u
ZSgpCj4gd2hlbiBpdCBmaW5kcyBhbiBhbHJlYWR5IHByZXNlbnQgY29udGV4dCBlbnRyeS4gVGhl
IGZpcnN0IG9uZSB0byBtYWtlIHN1Y2gKPiBhIG1hcHBpbmcgd2lsbCB3aW4uCgpSaWdodCwgdGhh
bmtzLCBJIGZpbmQgYWxsIHRoaXMgY29kZSBxdWl0ZSBjb25mdXNpbmcuIElmIHRoZSBpb21tdQpj
b250ZXh0IGlzIGFzc2lnbmVkIHRvIGEgZG9tYWluLCB3b24ndCBpdCBtYWtlIHNlbnNlIHRvIGtl
ZXAgdGhlCmRldmljZSBpbiBzeW5jIGFuZCBhbHNvIGFzc2lnbiBpdCB0byB0aGF0IGRvbWFpbj8K
ClNvIHRoYXQgdGhlIG93bmVyIGluIHRoZSBpb21tdSBjb250ZXh0IG1hdGNoZXMgdGhlIG93bmVy
IG9uIHRoZQpwY2lfZGV2IHN0cnVjdC4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
