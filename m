Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2454AEBDB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:44:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gPb-0001mC-1j; Tue, 10 Sep 2019 13:42:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7gPZ-0001m7-Fi
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:42:25 +0000
X-Inumbo-ID: d1fd5adc-d3d0-11e9-ac1f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1fd5adc-d3d0-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568122944;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jYRUNgC/islUSwW8g+lQgh2fIv3kaKJBRc1d+GBRRes=;
 b=XBIhYQoRlTfvRkaHaV+y8GoQv7FZxIM57CYieE60sb98Ks6b23nNFugw
 3LfowrcBqlOmwGYQ9ot+rOITR/QqUjN6Qld0x2OEVyDStXqL7O0kwKqJC
 vtSKSHuy7wDdqpJ3gwEsN4+NH1U6ZNiSs6GG6sCv+YkJXkX9S03DchgJC M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ghzgLq6Qwst+FN1zonyeqUtQbHRJ4AzVdvVwKIs4uES7iLnmMdcptd4ySMFucvnxI5zJCxqJpD
 /3PCki56PLqJJ6wbTbnjtgU7+wlGg/Lmb+SbDOlYe52zlAHwcnQtFWTKpezPt1SWRptyNjp/ZQ
 3cOxxiULfNrdgUaIbEaRmmnO7myg/YYPuV3vZ5lx3vfsayf5/7xc0u5JEAyxAhF5rif38UoBXk
 Gn2FMNUcJ/B/TFK+8eIwQgTnPq8niCMGyL9p9bcpMWHO6m0Zh+S2EPt+33wwO8I3R7tgbuixFQ
 vlU=
X-SBRS: 2.7
X-MesageID: 5562921
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5562921"
Date: Tue, 10 Sep 2019 15:42:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190910134213.3fj3q5vcv6oqowfc@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-2-roger.pau@citrix.com>
 <7a37466e-4bb8-2358-f940-42aa5426bdcb@suse.com>
 <20190910133315.i35z5jfmbxwl4kyi@Air-de-Roger>
 <d26f3f92-7b4d-82a5-121d-d3caec79b56a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d26f3f92-7b4d-82a5-121d-d3caec79b56a@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDM6MzU6MDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMDkuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIFNlcCAxMCwgMjAxOSBhdCAwMzoyODo1N1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwMy4wOS4yMDE5IDE4OjE0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL2lvcmVxLmMKPiA+Pj4gQEAgLTExOTUsNyArMTE5NSw3IEBAIGludCBodm1fYWxsX2lvcmVx
X3NlcnZlcnNfYWRkX3ZjcHUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHZjcHUgKnYpCj4gPj4+
ICAgICAgcmV0dXJuIDA7Cj4gPj4+ICAKPiA+Pj4gICBmYWlsOgo+ID4+PiAtICAgIHdoaWxlICgg
aWQtLSAhPSAwICkKPiA+Pj4gKyAgICB3aGlsZSAoIGlkKysgIT0gTUFYX05SX0lPUkVRX1NFUlZF
UlMgKQo+ID4+PiAgICAgIHsKPiA+Pj4gICAgICAgICAgcyA9IEdFVF9JT1JFUV9TRVJWRVIoZCwg
aWQpOwo+ID4+Cj4gPj4gV2l0aCBQYXVsJ3MgUi1iIEkgd2FzIGFib3V0IHRvIGNvbW1pdCB0aGlz
LCBidXQgZG9lc24ndCB0aGlzCj4gPj4gbmVlZCB0byBiZSArK2lkPyAoSWYgc28sIEknbGwgYmUg
aGFwcHkgdG8gZml4IHdoaWxlIGNvbW1pdHRpbmcuKQo+ID4gCj4gPiBUaGUgaW5jcmVtZW50IGlz
IGFscmVhZHkgZG9uZSBpbiB0aGUgbG9vcCBjb25kaXRpb24uCj4gCj4gVGhhdCdzIHRoZSBpbmNy
ZW1lbnQgSSBtZWFuLiBJJ20gc29ycnkgZm9yIHRoZSBhbWJpZ3VpdHk7IEkKPiBkaWRuJ3Qgd2Fu
dCB0byBjdXQgdG9vIG11Y2ggb2YgdGhlIGNvbnRleHQuCgpPaCBzb3JyeSwgeWVzIEkgdGhpbmsg
eW91IGFyZSBjb3JyZWN0LCBvciBlbHNlIHdlIHdvdWxkIG92ZXJydW4gdGhlCmFycmF5IGJ5IG9u
ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
