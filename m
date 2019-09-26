Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB9BF45D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDU6j-0001nA-42; Thu, 26 Sep 2019 13:46:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1cs6=XV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDU6h-0001n5-HW
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:46:55 +0000
X-Inumbo-ID: 199b49d6-e064-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 199b49d6-e064-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569505614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cLCuO+kU7OKKJe3UK/DrxQKI5cglhocqyq1ZTex06r8=;
 b=LapcN+AdEuNjCJ9zBVj9pQe/3E5xsXujnnOR4MiVM797tqHHi5hjNBlc
 f7y/NhFaa3BiMIFXCUOfFY+FrquMrGOllRMd7KaOJv+SzXPAso+UoS+bj
 KA0OsvDpY+E5HmuXSaAe4e+Wzo8V+mfwKBubi7MZFAv0WCs8j55TuJMb6 4=;
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
IronPort-SDR: pSUnh6VpDA7QS54+/vji9GYKO67ShbzQs+ytB2g7y7xHnpFSRvbIBcR6vFnuB0hgQpLSSlhZNa
 WmoPIfo/LXfP4OHyFe5T3DEJvBPIqblq2xtIykcxMDh1LL0C/FTdC72KJbTU4xR1B7RE55C7D9
 LvX1CJQwpVcLGS0N5F/PtzgyZH4aTCDxerYwbvt8Ae9YJpFDQpSjq6ITshPXH5uIrldmRwsvED
 GEz0Ep20E3BzAyjhbEznYmGTxpihSSSSzwEuD4CFNafqYMnoyUHaFUJ+89YJjVjm6UGNBPaT1k
 ztE=
X-SBRS: 2.7
X-MesageID: 6394934
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,552,1559534400"; 
   d="scan'208";a="6394934"
Date: Thu, 26 Sep 2019 15:46:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190926134644.tcp7pyalzk42hesg@Air-de-Roger>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
 <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
 <0c261f5e-735a-cf05-5d1a-9f3b0b2c83ed@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c261f5e-735a-cf05-5d1a-9f3b0b2c83ed@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDM6MTc6MTVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDkuMjAxOSAxMzoxNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBGcmksIFNlcCAyMCwgMjAxOSBhdCAwMTozNToxM1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBIYXZpbmcgc2FpZCB0aGlzLCBhcyBhIHJlc3VsdCBvZiBoYXZpbmcgbG9va2VkIGF0
IHNvbWUgb2YgdGhlCj4gPj4gaW52b2x2ZWQgY29kZSwgYW5kIHdpdGggdGhlIGNvdmVyIGxldHRl
ciBub3QgY2xhcmlmeWluZyB0aGlzLAo+ID4+IHdoYXQncyB0aGUgcmVhc29uIGZvciBnb2luZyB0
aGlzIHNlZW1pbmdseSBtb3JlIGNvbXBsaWNhdGVkCj4gPj4gcm91dGUsIHJhdGhlciB0aGFuIHB1
dHRpbmcgdlBDSSBiZWhpbmQgdGhlIGh2bV9pb19pbnRlcmNlcHQoKQo+ID4+IG1hY2hpbmVyeSwg
anVzdCBsaWtlIGlzIHRoZSBjYXNlIGZvciBvdGhlciBpbnRlcm5hbCBoYW5kbGluZz8KPiA+IAo+
ID4gSWYgdlBDSSBpcyBoYW5kbGVkIGF0IHRoZSBodm1faW9faW50ZXJjZXB0IGxldmVsIChsaWtl
IGl0cyBkb25lIEFUTSkKPiA+IHRoZW4gaXQncyBub3QgcG9zc2libGUgdG8gaGF2ZSBib3RoIChl
eHRlcm5hbCkgaW9yZXEgc2VydmVycyBhbmQgdlBDSQo+ID4gaGFuZGxpbmcgYWNjZXNzZXMgdG8g
ZGlmZmVyZW50IGRldmljZXMgaW4gdGhlIFBDSSBjb25maWcgc3BhY2UsIHNpbmNlCj4gPiB2UENJ
IHdvdWxkIHRyYXAgYWxsIGFjY2Vzc2VzIHRvIHRoZSBQQ0kgSU8gcG9ydHMgYW5kIHRoZSBNQ0ZH
IHJlZ2lvbnMKPiA+IGFuZCB0aG9zZSB3b3VsZCBuZXZlciByZWFjaCB0aGUgaW9yZXEgcHJvY2Vz
c2luZy4KPiAKPiBXaHkgd291bGQgdlBDSSAod2FudCB0bykgZG8gdGhhdD8gVGhlIGFjY2VwdCgp
IGhhbmRsZXIgc2hvdWxkCj4gc3ViLWNsYXNzIHRoZSBDRjgtQ0ZGIHBvcnQgcmFuZ2U7IHRoZXJl
IHdvdWxkIGxpa2VseSB3YW50IHRvCj4gYmUgYW5vdGhlciBzdHJ1Y3QgaHZtX2lvX29wcyBpbnN0
YW5jZSBkZWFsaW5nIHdpdGggY29uZmlnCj4gc3BhY2UgYWNjZXNzZXMgKGFuZCBwZXJoYXBzIHdp
dGggb25lcyB0aHJvdWdoIHBvcnQgSS9PIGFuZAo+IHRocm91Z2ggTUNGRyBhdCB0aGUgc2FtZSB0
aW1lKS4KCkRvIHlvdSBtZWFuIHRvIGV4cGFuZCBodm1faW9faGFuZGxlciB0byBhZGQgc29tZXRo
aW5nIGxpa2UgYSBwY2ljb25mCnN1Yi1zdHJ1Y3R1cmUgdG8gdGhlIGV4aXN0aW5nIHVuaW9uIG9m
IHBvcnRpbyBhbmQgbW1pbz8KClRoYXQncyBpbmRlZWQgZmVhc2libGUsIGJ1dCBJJ20gbm90IHN1
cmUgd2h5IGl0J3MgYmV0dGVyIHRoYXQgdGhlCmFwcHJvYWNoIHByb3Bvc2VkIG9uIHRoaXMgc2Vy
aWVzLiBMb25nIHRlcm0gSSB0aGluayB3ZSB3b3VsZCBsaWtlIGFsbAppbnRlcmNlcHQgaGFuZGxl
cnMgdG8gdXNlIHRoZSBpb3JlcSBpbmZyYXN0cnVjdHVyZSBhbmQgcmVtb3ZlIHRoZQp1c2FnZSBv
ZiBodm1faW9faW50ZXJjZXB0LgoKPiBJbiB0aGUgZW5kIHRoaXMgd291bGQgbGlrZWx5Cj4gbW9y
ZSBzaW1pbGFyIHRvIGhvdyBjaGlwc2V0cyBoYW5kbGUgdGhpcyBvbiByZWFsIGhhcmR3YXJlCj4g
dGhhbiB5b3VyICJpbnRlcm5hbCBzZXJ2ZXIiIHNvbHV0aW9uIChhbGJlaXQgSSBhZ3JlZSB0byBh
Cj4gZGVncmVlIGl0J3MgaW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIGFueXdheSkuCgpJIHRoaW5r
IHRoZSBlbmQgZ29hbCBzaG91bGQgYmUgdG8gdW5pZnkgdGhlIGludGVybmFsIGFuZCBleHRlcm5h
bAppbnRlcmNlcHRzIGludG8gYSBzaW5nbGUgcG9pbnQsIGFuZCB0aGUgb25seSBmZWFzaWJsZSB3
YXkgdG8gZG8gdGhpcwppcyB0byBzd2l0Y2ggdGhlIGludGVybmFsIGludGVyY2VwdHMgdG8gdXNl
IHRoZSBpb3JlcSBpbmZyYXN0cnVjdHVyZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
