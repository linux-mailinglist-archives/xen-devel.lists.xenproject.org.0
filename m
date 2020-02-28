Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06BD173538
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 11:24:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7cn5-0005cv-2j; Fri, 28 Feb 2020 10:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7cn3-0005cn-C5
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 10:22:41 +0000
X-Inumbo-ID: 3f9a6c3c-5a14-11ea-83b0-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f9a6c3c-5a14-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582885361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W3+9ZaqOsXDwmNgOi7mGgpmw6VPABcL4Rck6GCXUUjo=;
 b=f6y2FnLHF57FbCLbJ6kcti/3ZppFsb/UudZOl33WX6qtCcm0KeUnvF2F
 J/nmVKxdrzfhuqWsWGZ3n+qL/A0HIQVr0NzQt7Whi9+Xc4HVrf69V637l
 dEjPWUa6be1nNY10uurx2kb9Z2FRdohvUHIXdaHm09rZTGDLi2nSRza0g U=;
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
IronPort-SDR: 38kpTY3SXrNtaPus5GLTeXEXKuB2nWpemWPEsRkRjwzoLcoTTXm39DhpMakEVfBpHA0YUj9uvx
 k7GSvrgvvd4/yIDnAOQ4I1QVGROlpvjoWMSSwccTve6xeFeEPdP+GoCguGS6k7+pjTmx+dkhAh
 2v2cK3DLwZKYim+5cwE03bZiU/IcIHqHCMJmxLVsE+U00nOYozNs89qAiO8Tv1cLKDrBzAwvsX
 MYzJJEl7QUY4LzBYwzF4Yo0Fg2opZB6cOMJbFR/IyUAwOIQZeGB09qPfllrOe+bB++Up6oTITi
 rdk=
X-SBRS: 2.7
X-MesageID: 13165250
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,495,1574139600"; d="scan'208";a="13165250"
Date: Fri, 28 Feb 2020 11:22:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228102217.GT24458@Air-de-Roger.citrite.net>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-2-roger.pau@citrix.com>
 <15481182-aa35-da08-c289-29ff74eba686@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15481182-aa35-da08-c289-29ff74eba686@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/smp: use a dedicated CPU mask in
 send_IPI_mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMTE6MDg6NDNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3NtcC5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvc21wLmMKPiA+IEBA
IC01OSw2ICs1OSw4IEBAIHN0YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGlu
dCBzaG9ydGN1dCwgaW50IHZlY3RvciwKPiA+ICAgICAgYXBpY193cml0ZShBUElDX0lDUiwgY2Zn
KTsKPiA+ICB9Cj4gPiAgCj4gPiArREVDTEFSRV9QRVJfQ1BVKGNwdW1hc2tfdmFyX3QsIHNlbmRf
aXBpX2NwdW1hc2spOwo+IAo+IFRoaXMgbmVlZHMgdG8gYmUgcHV0IGluIGEgaGVhZGVyLCBzbyB0
aGF0IC4uLgo+IAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gKysrIGIveGVu
L2FyY2gveDg2L3NtcGJvb3QuYwo+ID4gQEAgLTU3LDYgKzU3LDkgQEAgREVGSU5FX1BFUl9DUFVf
UkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgY3B1X2NvcmVfbWFzayk7Cj4gPiAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgc2NyYXRjaF9jcHVtYXNrKTsKPiA+ICBz
dGF0aWMgY3B1bWFza190IHNjcmF0Y2hfY3B1MG1hc2s7Cj4gPiAgCj4gPiArREVGSU5FX1BFUl9D
UFVfUkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgc2VuZF9pcGlfY3B1bWFzayk7Cj4gCj4gLi4u
IHRoaXMgZ2V0cyBjb21waWxlZCB3aXRoIGhhdmluZyBzZWVuIHRoZSBkZWNsYXJhdGlvbiwgc3Vj
aAo+IHRoYXQgaWYgb25lIGdldHMgY2hhbmdlZCB3aXRob3V0IGFsc28gY2hhbmdpbmcgdGhlIG90
aGVyLCB0aGUKPiBidWlsZCB3aWxsIGJyZWFrLgoKUmlnaHQsIHdhcyB0cnlpbmcgdG8gbGltaXQg
dGhlIHNjb3BlIG9mIHRoZSBkZWNsYXJhdGlvbiwgYnV0IHlvdXIKc3VnZ2VzdGlvbiBtYWtlcyBz
ZW5zZS4KCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGZpbmUgdG8gbWUuCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
