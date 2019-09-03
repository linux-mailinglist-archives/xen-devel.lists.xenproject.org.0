Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463FA6D62
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:57:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5B9r-0008CY-Lr; Tue, 03 Sep 2019 15:55:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4NVN=W6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i5B9p-0008CQ-V6
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 15:55:49 +0000
X-Inumbo-ID: 4c00cac6-ce63-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c00cac6-ce63-11e9-978d-bc764e2007e4;
 Tue, 03 Sep 2019 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567526149;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HWSjQzOMPk/SI5YKxZklELpc3P1jydhI8BDAm3JIoDA=;
 b=XfEKfp7omtVM3GnPv9af9XGvsvEDpwbKtp10JqWh3c6rlsnNS9y7MjsL
 EBSgL678yFkLfeQX2u9/OI/DjykCkmII8Na3k+qdSlAZV/mUrz3ftcBDy
 oWtHmbEG4aWd0LziaFw+Yyufhtfryb+G+0O+v8fcWyT6HGdYYNAwa+2bu Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bqX55YLm1Vrw62R1j4LkfBNcLW0nkgEKNmVyEOXqsyC0DzTQB3R95USHBlEEStKB2EoQ6WVl1c
 055ZPSPoZw4u51jWpcyL6ygvfr3sup9Uf3fj3usGylpoJeIueV/K+XISq4WwEhnyh2s6e7yhNE
 dKKs3fYCw0hzH/0UuP3uzTW5b2IioWDz8u0V/0+QvzgmYKTKST8Cxo0/+jGugRK+twAlMGyXKY
 HAjzNQoMh9SpnMyAxJQu6i7yM+hNzoKsJkPhxfo0gBpHcWuooYpZ6W87R1lVVN51NHE2LGrf+a
 wlE=
X-SBRS: 2.7
X-MesageID: 5117334
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5117334"
Date: Tue, 3 Sep 2019 17:55:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190903155540.a4oafrrunhmxjlf6@Air-de-Roger>
References: <88d6b97e-1f19-56ff-1a35-901ce3102e78@suse.com>
 <20190903141545.5n4uk2khgbtvewgz@Air-de-Roger>
 <10cc7a4e-2c3b-c672-313c-d6c11874eac0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10cc7a4e-2c3b-c672-313c-d6c11874eac0@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] ns16550: make PCI device hiding uniform
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
 KonradWilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, JulienGrall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDU6MTM6MzhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDMuMDkuMjAxOSAxNjoxNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIFNlcCAwMywgMjAxOSBhdCAwMzo1ODowOFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+ID4+ICsrKyBiL3hlbi9k
cml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4gPj4gQEAgLTc2MywyMyArNzYzLDE2IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBuczE2NTUwX2luaXRfcG9zdGlycSgKPiA+PiAgI2lmZGVmIENPTkZJR19IQVNf
UENJCj4gPj4gICAgICBpZiAoIHVhcnQtPmJhciB8fCB1YXJ0LT5wc19iZGZfZW5hYmxlICkKPiA+
PiAgICAgIHsKPiA+PiAtICAgICAgICBpZiAoICF1YXJ0LT5wYXJhbSApCj4gPj4gLSAgICAgICAg
ICAgIHBjaV9oaWRlX2RldmljZSgwLCB1YXJ0LT5wc19iZGZbMF0sIFBDSV9ERVZGTih1YXJ0LT5w
c19iZGZbMV0sCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICB1YXJ0LT5wc19iZGZb
Ml0pKTsKPiA+PiAtICAgICAgICBlbHNlCj4gPj4gLSAgICAgICAgewo+ID4+IC0gICAgICAgICAg
ICBpZiAoIHVhcnQtPnBhcmFtLT5tbWlvICYmCj4gPj4gLSAgICAgICAgICAgICAgICAgcmFuZ2Vz
ZXRfYWRkX3JhbmdlKG1taW9fcm9fcmFuZ2VzLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1YXJ0LT5pb19iYXNlLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1YXJ0LT5pb19iYXNlICsgdWFydC0+aW9fc2l6ZSAtIDEpICkKPiA+PiAt
ICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiRXJyb3Igd2hpbGUgYWRkaW5nIE1N
SU8gcmFuZ2Ugb2YgZGV2aWNlIHRvIG1taW9fcm9fcmFuZ2VzXG4iKTsKPiA+PiArICAgICAgICBp
ZiAoIHVhcnQtPnBhcmFtICYmIHVhcnQtPnBhcmFtLT5tbWlvICYmCj4gPj4gKyAgICAgICAgICAg
ICByYW5nZXNldF9hZGRfcmFuZ2UobW1pb19yb19yYW5nZXMsIHVhcnQtPmlvX2Jhc2UsCj4gPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFydC0+aW9fYmFzZSArIHVhcnQtPmlv
X3NpemUgLSAxKSApCj4gPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiRXJyb3Ig
d2hpbGUgYWRkaW5nIE1NSU8gcmFuZ2Ugb2YgZGV2aWNlIHRvIG1taW9fcm9fcmFuZ2VzXG4iKTsK
PiA+PiAgCj4gPj4gLSAgICAgICAgICAgIGlmICggcGNpX3JvX2RldmljZSgwLCB1YXJ0LT5wc19i
ZGZbMF0sCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfREVWRk4odWFy
dC0+cHNfYmRmWzFdLCB1YXJ0LT5wc19iZGZbMl0pKSApCj4gPj4gLSAgICAgICAgICAgICAgICBw
cmludGsoWEVOTE9HX0lORk8gIkNvdWxkIG5vdCBtYXJrIGNvbmZpZyBzcGFjZSBvZiAlMDJ4OiUw
MnguJXUgcmVhZC1vbmx5LlxuIiwKPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdWFydC0+cHNfYmRmWzBdLCB1YXJ0LT5wc19iZGZbMV0sCj4gPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHVhcnQtPnBzX2JkZlsyXSk7Cj4gPj4gLSAgICAgICAg
fQo+ID4+ICsgICAgICAgIGlmICggcGNpX3JvX2RldmljZSgwLCB1YXJ0LT5wc19iZGZbMF0sCj4g
PiAKPiA+IERvbid0IHlvdSBuZWVkIHRvIGdhdGUgdGhlIGNhbGwgdG8gcGNpX3JvX2RldmljZSB3
aXRoCj4gPiB1YXJ0LT5wc19iZGZfZW5hYmxlPwo+IAo+IE5vLCB3ZSB3YW50IHRoaXMgZm9yIGJv
dGggdGhlIHBhcnNlX3BjaSgpIGFuZCB0aGUgcGNpX3VhcnRfY29uZmlnKCkKPiBjYXNlLCB3aGlj
aCBpcyB3aGF0IHRoZSBzdXJyb3VuZGluZyBpZigpICh2aXNpYmxlIGluIGNvbnRleHQgYWJvdmUp
Cj4gY2hlY2tzLiAoTm90ZSBhbHNvIHRoYXQgcHJldmlvdXNseSB0aGVyZSB3YXMgbm8gc3VjaCBj
aGVjayBlaXRoZXIsCj4gc28gaWYgYW55dGhpbmcgaXQgd291bGQgYmUgYW4gb3J0aG9nb25hbCBj
aGFuZ2UgYW55d2F5LikKCkFjaywgSSBmaW5kIGl0IHdyb25nIHRoYXQgcGNpX3VhcnRfY29uZmln
IHNldHMgdGhlIHBzX2JkZiBidXQgbm90CnBzX2JkZl9lbmFibGUuIEZyb20gdGhlIGRlc2NyaXB0
aW9uIG9mIHRoZSBwc19iZGZfZW5hYmxlIGZpZWxkIGl0CnNlZW1zIGxpa2UgcHNfYmRmIGlzIG9u
bHkgdmFsaWQgaWYgcHNfYmRmX2VuYWJsZSBpcyB0cnVlLCBidXQgdGhhdApkb2Vzbid0IHNlZW0g
dG8gbWF0Y2ggcGNpX3VhcnRfY29uZmlnLgoKVGhlIGNoYW5nZSBsb29rcyBmaW5lIHRvIG1lIGJh
c2VkIG9uIHdoYXQgd2FzIGRvbmUgYmVmb3JlLCBoZW5jZToKClJldmlld2VkLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
