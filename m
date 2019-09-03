Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1087DA6535
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 11:31:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i556j-0004gZ-LY; Tue, 03 Sep 2019 09:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i556i-0004gS-Cn
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 09:28:12 +0000
X-Inumbo-ID: 25948a0c-ce2d-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25948a0c-ce2d-11e9-b95f-bc764e2007e4;
 Tue, 03 Sep 2019 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567502892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aS1GRqg40j90QYbjQbZmJjcPGlFxkHh2qB98fEsMEUo=;
 b=Nbz48DSxXTAMjNdQP/y9aVbr+jJbYcGUMzyuPnI79o4uOIVu58d+3NVq
 /jllgYOX+q8CdDFdUtKxX4OdSF0Q9qzcnSlZyLMaDVHTSB0tKYF8EqeXb
 ZCVyvTziTCv+c/2GfZ3sxRoNCG2bOFeBLUF2efBEhXzIVn4Vn6vipT7X1 Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: y67FcvZehyz4Ol2nzM6wQOh9XMFfoivdxa3NU3kk5QQOdgqQV5COgxMtCr8LO9wf5p2u32K/R6
 r9vNB7334QN5Hs6uTsi6zP0w5Jr11q1DQSJppdKTE5PRbCUvWDpVdKo1LQdjpk0pMQRJDzGomp
 VPLDvY9x3K+f85KbKWKA3lc9mKWbaoeRfPg0iR9Yze6exG5Mzv1D3XSq+VNGj/sThZP1/g8VMw
 muOAe8zD01/YfPApE+oppZav2OMqUX/c2z5hkW0d1vBZaZ6e5RbCM5URatDUDpoZDnfSbuWfLr
 d7E=
X-SBRS: 2.7
X-MesageID: 5046410
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,462,1559534400"; 
   d="scan'208";a="5046410"
Date: Tue, 3 Sep 2019 11:28:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190903092803.p5o33gl5ctnmue64@Air-de-Roger>
References: <20190902153037.99845-1-roger.pau@citrix.com>
 <773670ce-53bb-0677-8e07-69c84531847a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <773670ce-53bb-0677-8e07-69c84531847a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] vpci: honor read-only devices
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMTE6MDk6MDlBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMDkuMjAxOSAxNzozMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jCj4gPiBAQCAtNDE4LDEzICs0MTgsMjEgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qg
c2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNpemUsCj4gPiAgICAgICAgICBy
ZXR1cm47Cj4gPiAgICAgIH0KPiA+ICAKPiA+IC0gICAgLyoKPiA+IC0gICAgICogRmluZCB0aGUg
UENJIGRldiBtYXRjaGluZyB0aGUgYWRkcmVzcy4KPiA+IC0gICAgICogUGFzc3Rocm91Z2ggZXZl
cnl0aGluZyB0aGF0J3Mgbm90IHRyYXBwZWQuCj4gPiAtICAgICAqLwo+ID4gKyAgICAvKiBGaW5k
IHRoZSBQQ0kgZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLiAqLwo+ID4gICAgICBwZGV2ID0gcGNp
X2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pOwo+
ID4gICAgICBpZiAoICFwZGV2ICkKPiA+ICAgICAgewo+ID4gKyAgICAgICAgY29uc3QgdW5zaWdu
ZWQgbG9uZyAqcm9fbWFwID0gcGNpX2dldF9yb19tYXAoc2JkZi5zZWcpOwo+ID4gKwo+ID4gKyAg
ICAgICAgaWYgKCByb19tYXAgJiYgdGVzdF9iaXQoc2JkZi5iZGYsIHJvX21hcCkgKQo+ID4gKyAg
ICAgICAgICAgIC8qIElnbm9yZSB3cml0ZXMgdG8gcmVhZC1vbmx5IGRldmljZXMuICovCj4gPiAr
ICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgICAgLyoKPiA+ICsgICAgICAgICAq
IExldCB0aGUgaGFyZHdhcmUgZG9tYWluIGFjY2VzcyBjb25maWcgc3BhY2UgcmVnaW9ucyBmb3Ig
bm9uLWV4aXN0ZW50Cj4gPiArICAgICAgICAgKiBkZXZpY2VzLgo+ID4gKyAgICAgICAgICogVE9E
TzogcmV2aXNpdCBmb3IgZG9tVSBzdXBwb3J0Lgo+ID4gKyAgICAgICAgICovCj4gPiAgICAgICAg
ICB2cGNpX3dyaXRlX2h3KHNiZGYsIHJlZywgc2l6ZSwgZGF0YSk7Cj4gPiAgICAgICAgICByZXR1
cm47Cj4gPiAgICAgIH0KPiA+IAo+IAo+IEluIHByaW5jaXBsZSBJJ20gb2theSB3aXRoIHRoZSBj
aGFuZ2UsIGJ1dCBJIGhhdmUgdHdvIG1vcmUgdGhpbmdzCj4gdG8gYmUgY29uc2lkZXJlZDoKPiAK
PiAxKSBJJ2QgcHJlZmVyIGlmIHRoZSBjaGVjayB3YXMgaW5kZXBlbmRlbnQgb2YgdGhlIHJldHVy
biB2YWx1ZSBvZgo+IHBjaV9nZXRfcGRldl9ieV9kb21haW4oKSwgdG8gYmUgbW9yZSByb2J1c3Qg
YWdhaW5zdCB0aGUgci9vIG1hcAo+IGhhdmluZyBnb3QgdXBkYXRlZCBidXQgdGhlIG93bmVyIHN0
aWxsIGJlaW5nIGh3ZG9tLgoKU28gdGhlIFJPIGNoZWNrIHdvdWxkIGJlIGRvbmUgYWhlYWQgb2Yg
dGhlIG93bmVyIGNoZWNrPwoKSSBjYW4gZG8gdGhhdCwgYnV0IGl0IHNlZW1zIGxpa2UgYSBib2Rn
ZSBmb3IgdGhlIGxvY2tpbmcgaXNzdWVzIChvcgpsYWNrIG9mIGl0KSB3ZSBoYXZlIGluIHRoZSBo
YW5kbGluZyBvZiBQQ0kgZGV2aWNlcy4gSSBhc3N1bWUgaGF2aW5nIGEKUk8gZGV2aWNlIGFzc2ln
bmVkIHRvIGEgZG9tYWluIGRpZmZlcmVudCB0aGFuIGRvbV94ZW4gaXMgbm90IHBvc3NpYmxlLgoK
PiAyKSBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gbW92ZSB0aGUgY2hlY2sgaW50byB0aGUgY2Fs
bGVycyBvZgo+IHZwY2lfd3JpdGUoKSwgdG8gYXZvaWQgdGhlIGR1cGxpY2F0ZSBsb29rdXAgaW4g
dGhlIHF3b3JkLU1DRkctCj4gd3JpdGUgY2FzZT8gVGhlIG1haW4gcXVlc3Rpb25hYmxlIHBvaW50
IGhlcmUgaXMgd2hlcmUsIGZvciBEb21VCj4gc3VwcG9ydCwgdGhlIFNCREYgdHJhbnNsYXRpb24g
aXMgZ29pbmcgdG8gbGl2ZS4KClNvIEkgaGF2ZSBhIHNlcmllcyBJJ20gZ29pbmcgdG8gc2VuZCBx
dWl0ZSBzb29uIGluIG9yZGVyIHRvIGludGVncmF0ZQp2UENJIHdpdGggaW9yZXEsIGFzIGEgZmly
c3Qgc3RlcCBpbiBvcmRlciB0byBtYWtlIGl0IGF2YWlsYWJsZSB0bwpkb21Vcy4KClRoZSBTQkRG
IHRyYW5zbGF0aW9uIHRoZXJlIGlzIGdvaW5nIHRvIGJlIHBlcmZvcm1lZCBieSB0aGUgaW9yZXEg
Y29kZQooaWU6IGh2bV9zZWxlY3RfaW9yZXFfc2VydmVyKSwgYnV0IGNoZWNraW5nIGFnYWluc3Qg
dGhlIFJPIG1hcCB0aGVyZQp3b3VsZCBiZSB3cm9uZywgYXMgaW9yZXEgZG9lc24ndCBrbm93IHdo
ZXRoZXIgdGhlIHVuZGVybHlpbmcgaGFuZGxlcgppcyBmb3IgYW4gZW11bGF0ZWQgZGV2aWNlIG9y
IGZvciBhIHBhc3N0aHJvdWdoIG9uZS4gSSB0aGluayB0aGUgUk8KY2hlY2sgbmVlZHMgdG8gYmUg
aW4gdGhlIHZQQ0kgY29kZSBpdHNlbGYuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
