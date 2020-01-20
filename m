Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C621430BD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 18:22:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itahO-000337-S2; Mon, 20 Jan 2020 17:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itahM-000332-Uq
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 17:18:48 +0000
X-Inumbo-ID: eaf063c0-3ba8-11ea-b9ac-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaf063c0-3ba8-11ea-b9ac-12813bfff9fa;
 Mon, 20 Jan 2020 17:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579540727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uxSF9aThV3MCBh553mBQzlVt5KqJPlycYaMUasojh2o=;
 b=DAEEfMuXdU/eu50ZAvxJLhC2FfcTRrf1Ap6lB5be8dPGloRdbjhyBbDN
 V1yrtfAsCLI4BDR1JYxrxtfumuKb1j7o3Kyp3OcIMiYT63WQoUiMXjwPd
 X7olI9zViGKnOrrrSNXG8oKVZWHvyWK3w89ac/o2ClhvKSsFay8gcg4As c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QEGMjXlNyLhRs8xBeTwwp507fm7Tbr4lZ4qO8lHBPrVh/Y01bHBqMvpxCeCFvIIsHO9PWH09ak
 VQ8CCyUnG1Scb/VO+bd/21WAhsJXAge3H4vhhhuI7qcG6lDuDM3Mj42ksQhb75QJ840FW58EeZ
 hzYC/YY/yyV8Dt5g+o77s+WKFZxie6bPQR3OoFmVLzmdOMYJ91r8jKa4Byd6rrQ+Uy46Csgc0q
 Rvxk4tFkCsFHNMnq2J7H9JlgialZ0WW7yPG/dbpsBJkEhz6BgIhIOz6D8ueD9bGNlDPCKU+XSH
 FYs=
X-SBRS: 2.7
X-MesageID: 11763696
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11763696"
Date: Mon, 20 Jan 2020 17:18:40 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200120171840.GF11756@Air-de-Roger>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDU6MTA6MzNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxMjowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gV2hl
biBwbGFjaW5nIG1lbW9yeSBCQVJzIHdpdGggc2l6ZXMgc21hbGxlciB0aGFuIDRLIG11bHRpcGxl
IG1lbW9yeQo+ID4gQkFScyBjYW4gZW5kIHVwIG1hcHBlZCB0byB0aGUgc2FtZSBndWVzdCBwaHlz
aWNhbCBhZGRyZXNzLCBhbmQgdGh1cwo+ID4gd29uJ3Qgd29yayBjb3JyZWN0bHkuCj4gCj4gVGhp
bmtpbmcgYWJvdXQgaXQgYWdhaW4sIGFyZW4ndCB5b3UgZml4aW5nIG9uZSBwb3NzaWJsZSBjYXNl
IGJ5Cj4gYnJlYWtpbmcgdGhlIG9wcG9zaXRlIG9uZTogV2hhdCB5b3UgZml4IGlzIHdoZW4gdGhl
IHR3byBkaXN0aW5jdAo+IEJBUnMgKG9mIHRoZSBzYW1lIG9yIGRpZmZlcmVudCBkZXZpY2VzKSBt
YXAgdG8gZGlzdGluY3QgTUZOcwo+ICh3aGljaCB3b3VsZCBoYXZlIHJlcXVpcmVkIGEgc2luZ2xl
IEdGTiB0byBtYXAgdG8gYm90aCBvZiB0aGVzZQo+IE1GTnMpLiBCdXQgZG9uJ3QgeW91LCBhdCB0
aGUgc2FtZSB0aW1lLCBicmVhayB0aGUgY2FzZSBvZiB0d28KPiBCQVJzIChwZXJoYXBzLCBidXQg
bm90IG5lY2Vzc2FyaWx5LCBvZiB0aGUgc2FtZSBwaHlzaWNhbCBkZXZpY2UpCj4gbWFwcGluZyBi
b3RoIHRvIHRoZSBzYW1lIE1GTiwgaS5lLiByZXF1aXJpbmcgdG8gaGF2ZSB0d28gZGlzdGluY3QK
PiBHRk5zIG1hcCB0byBvbmUgTUZOPyAoQXQgbGVhc3QgZm9yIHRoZSBtb21lbnQgSSBjYW4ndCBz
ZWUgYSB3YXkKPiBmb3IgaHZtbG9hZGVyIHRvIGRpc3Rpbmd1aXNoIHRoZSB0d28gY2FzZXMuKQoK
SU1PIHdlIHNob3VsZCBmb3JjZSBhbGwgQkFScyB0byBiZSBwYWdlLWlzb2xhdGVkIGJ5IGRvbTAg
KHNpbmNlIFhlbgpkb2Vzbid0IGhhdmUgdGhlIGtub3dsZWRnZSBvZiBkb2luZyBzbyksIGJ1dCBJ
IGRvbid0IHNlZSB0aGUgaXNzdWUKd2l0aCBoYXZpbmcgZGlmZmVyZW50IGdmbnMgcG9pbnRpbmcg
dG8gdGhlIHNhbWUgbWZuLiBJcyB0aGF0IGEKbGltaXRhdGlvbiBvZiBwYWdpbmc/IEkgdGhpbmsg
eW91IGNhbiBtYXAgYSBncmFudCBtdWx0aXBsZSB0aW1lcyBpbnRvCmRpZmZlcmVudCBnZm5zLCB3
aGljaCBhY2hpZXZlcyB0aGUgc2FtZSBBRkFJQ1QuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
