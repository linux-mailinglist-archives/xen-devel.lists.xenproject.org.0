Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD3B0DF9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:38:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NOC-000358-4I; Thu, 12 Sep 2019 11:35:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k1F3=XH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i8NOA-000353-Ph
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:35:50 +0000
X-Inumbo-ID: 77f9f284-d551-11e9-b76c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77f9f284-d551-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 11:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568288149;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8FGxCJihSTX1ZUe1vCHejb4fe9BMv9m1UcFzxECgpxA=;
 b=N2URjuhjKmTAWAQ8DKOSfbVxrTHkm+R5Jtsbj3jStJhHYGhIuOrx982B
 i0p4ZoiEcZhX32zSI6a7bJqYNpCYVnDbmKbwvGYc49WVS2VBUtn/Ce4tF
 UzQkF2EtnmPt/FD6LqNpMQrWY/TqZSWtLslID+en9O3DhXUWTGOD80GlK k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: u9OE/3GvjPPl09dy13jHdExSB9oLxz6j53whWOGDZMyM0F/adVrRbett8g7nNdJP5NPcng09Mv
 WnxctbDU4k+UDli+o1/MbXGSP/7SA8KVikLSglPuangMo1AHxKSyZ/df+D63DyfseMqzEnfBXG
 CqDR/lw/hSokFWPYulETFHVrQUtgfPrWZgabmjPIypyRjDqSHtgFMnD93VLtR9J/ba61P9TLCR
 N479p3B6eQX0H8/8sDA6pC8BA8wgnLYtEbDsp7RxJnimqiTOcMSVwKaBHL8+2UK9MbSF4u2hkT
 7yw=
X-SBRS: 2.7
X-MesageID: 5720441
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5720441"
Date: Thu, 12 Sep 2019 13:35:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMDU6MjM6MjBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGJpdCBpcyBtZWFuaW5nZnVsIG9ubHkgZm9yIE1PVi10by1DUjMgaW5zbnMsIG5v
dCBhbnl3aGVyZSBlbHNlLCBpbgo+IHBhcnRpY3VsYXIgbm90IHdoZW4gbG9hZGluZyBuZXN0ZWQg
Z3Vlc3Qgc3RhdGUuCgpDYW4ndCB5b3UgdXNlIHRoZSBjdXJyZW50IHZjcHUgdG8gY2hlY2sgaWYg
dGhlIGd1ZXN0IGlzIGluIG5lc3RlZAptb2RlLCBhbmQgYXZvaWQgaGF2aW5nIHRvIGV4cGxpY2l0
bHkgcGFzcyB0aGUgbm9mbHVzaCBwYXJhbWV0ZXI/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2Vt
dWxhdGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gQEAgLTIwODAsNiAr
MjA4MCw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0ZV9jcigKPiAgICAgIEhWTVRSQUNFX0xP
TkdfMkQoQ1JfV1JJVEUsIHJlZywgVFJDX1BBUl9MT05HKHZhbCkpOwo+ICAgICAgc3dpdGNoICgg
cmVnICkKPiAgICAgIHsKPiArICAgICAgICBib29sIG5vZmx1c2g7Cj4gKwo+ICAgICAgY2FzZSAw
Ogo+ICAgICAgICAgIHJjID0gaHZtX3NldF9jcjAodmFsLCB0cnVlKTsKPiAgICAgICAgICBicmVh
azsKPiBAQCAtMjA5MCw3ICsyMDkyLDEwIEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0ZV9jcigK
PiAgICAgICAgICBicmVhazsKPiAgCj4gICAgICBjYXNlIDM6Cj4gLSAgICAgICAgcmMgPSBodm1f
c2V0X2NyMyh2YWwsIHRydWUpOwo+ICsgICAgICAgIG5vZmx1c2ggPSBodm1fcGNpZF9lbmFibGVk
KGN1cnJlbnQpICYmICh2YWwgJiBYODZfQ1IzX05PRkxVU0gpOwo+ICsgICAgICAgIGlmICggbm9m
bHVzaCApCj4gKyAgICAgICAgICAgIHZhbCAmPSB+WDg2X0NSM19OT0ZMVVNIOwo+ICsgICAgICAg
IHJjID0gaHZtX3NldF9jcjModmFsLCBub2ZsdXNoLCB0cnVlKTsKPiAgICAgICAgICBicmVhazsK
PiAgCj4gICAgICBjYXNlIDQ6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMjA1OSwxMiArMjA1OSwxNyBAQCBpbnQgaHZt
X21vdl90b19jcih1bnNpZ25lZCBpbnQgY3IsIHVuc2lnCj4gIAo+ICAgICAgc3dpdGNoICggY3Ig
KQo+ICAgICAgewo+ICsgICAgICAgIGJvb2wgbm9mbHVzaDsKPiArCj4gICAgICBjYXNlIDA6Cj4g
ICAgICAgICAgcmMgPSBodm1fc2V0X2NyMCh2YWwsIHRydWUpOwo+ICAgICAgICAgIGJyZWFrOwo+
ICAKPiAgICAgIGNhc2UgMzoKPiAtICAgICAgICByYyA9IGh2bV9zZXRfY3IzKHZhbCwgdHJ1ZSk7
Cj4gKyAgICAgICAgbm9mbHVzaCA9IGh2bV9wY2lkX2VuYWJsZWQoY3VycikgJiYgKHZhbCAmIFg4
Nl9DUjNfTk9GTFVTSCk7Cj4gKyAgICAgICAgaWYgKCBub2ZsdXNoICkKPiArICAgICAgICAgICAg
dmFsICY9IH5YODZfQ1IzX05PRkxVU0g7Cj4gKyAgICAgICAgcmMgPSBodm1fc2V0X2NyMyh2YWws
IG5vZmx1c2gsIHRydWUpOwo+ICAgICAgICAgIGJyZWFrOwo+ICAKPiAgICAgIGNhc2UgNDoKPiBA
QCAtMjI4MiwxMiArMjI4NywxMSBAQCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9uZyB2YWx1
ZSwgYm9vCj4gICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+ICB9Cj4gIAo+IC1pbnQgaHZtX3Nl
dF9jcjModW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vbCBtYXlfZGVmZXIpCj4gK2ludCBodm1fc2V0
X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG5vZmx1c2gsIGJvb2wgbWF5X2RlZmVyKQoK
SSB3b3VsZCByYXRoZXIgaW50cm9kdWNlIGEgZmx1c2ggcGFyYW1ldGVyIGluc3RlYWQsIEkgdGhp
bmsgbmVnYXRlZApib29sZWFucyBhcmUgaGFyZGVyIHRvIHBhcnNlIG1lbnRhbGx5LCBhbmQgZWFz
aWVyIHRvIGdldCB3cm9uZy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
