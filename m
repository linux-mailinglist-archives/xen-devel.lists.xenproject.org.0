Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A8C389B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJkb-0005l8-B8; Tue, 01 Oct 2019 15:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hWiX=X2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFJkZ-0005l2-Cd
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:07:39 +0000
X-Inumbo-ID: 34ec40ee-e45d-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 34ec40ee-e45d-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569942458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SUVBYJ4W+kBFHTrIoID0Uai0BqHKHUgUITDYo8LS/kE=;
 b=ONL6aONI5u+XHJe4VT5QYAJMQnQuKWdWO0kGyIwExPukYg/PG5PEF5x3
 DYNjS7IJN7kAoHTotYpb1Uh6ccyVuQgrO8k9bC+V/3n2VKL2mEmo14IdC
 +ygphEtzJCfz1EPOme34xde0JIHATkYKZXhM91LhsRNT5ZobA0Gzkf8VB g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iexSi31JsK4IWfFOkSMnrcYSkMPeDIBbEyVNrjjldPfaamBi9Ka+6VIzCgmTgl1sQiq86SBujI
 2+b6abv1j6QjvvhykEBFQ3MAPwBJhWr9kSr20pT03SaiY0kwo5m32uw9y2ErDeEWAFa8KsU06L
 pjSR7huzqCQ7q5d3wRH+knrOlIWCa+FvdLgRcnJItphYs08kDFDaILOFL+RTEKQZjFJ9qPH242
 37kChZJmn3U7uvVoH+cF13l8rqclAhyyHGKwir7Of1R8x11Ep+Rbzf5WMOmrUGtgp1a4qTOiPJ
 uMs=
X-SBRS: 2.7
X-MesageID: 6670575
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6670575"
Date: Tue, 1 Oct 2019 17:07:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20191001150726.gk6co3cxbxnszv3v@Air-de-Roger>
References: <20191001101259.53162-1-roger.pau@citrix.com>
 <20191001114438.GH1163@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001114438.GH1163@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] libxl: wait for the ack when issuing power
 control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTI6NDQ6MzhQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMTI6MTI6NTlQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm5lIHdyb3RlOgo+ID4gLSAgICByZXR1cm4gbGlieGxfX3hzX3ByaW50ZihnYywgdCwg
c2h1dGRvd25fcGF0aCwgIiVzIiwgY21kKTsKPiA+ICsgICAgcmMgPSBsaWJ4bF9feHNfcHJpbnRm
KGdjLCBYQlRfTlVMTCwgc2h1dGRvd25fcGF0aCwgIiVzIiwgY21kKTsKPiA+ICsgICAgaWYgKHJj
KQo+ID4gKyAgICAgICAgcmV0dXJuIHJjOwo+ID4gKwo+ID4gKyAgICBwdmNvbnRyb2wtPnBhdGgg
PSBzaHV0ZG93bl9wYXRoOwo+ID4gKyAgICBwdmNvbnRyb2wtPndoYXQgPSBHQ1NQUklOVEYoImd1
ZXN0IGFja25vd2xlZGdlbWVudCBvZiAlcyByZXF1ZXN0IiwgY21kKTsKPiA+ICsgICAgcHZjb250
cm9sLT50aW1lb3V0X21zID0gNjAgKiAxMDAwOwo+ID4gKyAgICBsaWJ4bF9feHN3YWl0X3N0YXJ0
KGdjLCBwdmNvbnRyb2wpOwo+IAo+IFNob3VsZG4ndCB3ZSB3YXRjaCBzaHV0ZG93bl9wYXRoIGJl
Zm9yZSB3ZSB3cml0ZSB0byBpdD8gT3RoZXJ3aXNlLCB3ZQo+IG1pZ2h0IG5ldmVyIHNlZSB0aGUg
YWNrbm93bGVkZ2VtZW50IGJ5IHRoZSBndWVzdC4KPiBCdXQgSSBkb24ndCBrbm93IGlmIHhzd2Fp
dCB0byBhIHJlYWQgdGhlIGZpcnN0IHRpbWUgaXQgaXMgc2V0dXAuCgpBRkFJSyB5b3UgYWx3YXlz
IGdldCBhbiBldmVudCBhZnRlciB0aGUgd2F0Y2ggaXMgcmVnaXN0ZXJlZC4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
