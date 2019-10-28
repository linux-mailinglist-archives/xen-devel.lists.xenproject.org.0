Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDF4E7161
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 13:32:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP49p-0002Lc-LN; Mon, 28 Oct 2019 12:30:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=es4G=YV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iP49o-0002LX-52
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 12:30:00 +0000
X-Inumbo-ID: a7ad2edc-f97e-11e9-a531-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7ad2edc-f97e-11e9-a531-bc764e2007e4;
 Mon, 28 Oct 2019 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572265798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1RJVmAE300BTchGRYzZkZjLr54Vq9g0arb99H9dUI7Q=;
 b=doKUiFeRaHHH/cWaqy7viTwl9Mm95Na5WrIPoRDaCKmTOGH+UC2BErYC
 jL03R2YPEhG29any2mO5sHsC8fMrYswd6c4ICZh6ugCFSZpL1CUgIxKDm
 gv0FFIqeltTzrkzzuBwqFbbVNRBVmWPHfWfjN08kAkA/r0SxQYrjz4ft9 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SE+gUs4dxgjvBEe2hfI7UB3ty6MxtzchFWxRMrIb8xacrCGKkyOKIv5pSqYHexXryEkHyTAWNI
 LryRXhix270IHRv5QPD2JRsSZFT6nvyQWLx+VPi/XVonqjaABrMp73mLI9MDwWVcGg43AJVtvr
 OC+LW4Xj85ZAZrd1udJhYM+iqunwu/NkzMSwhe8ZwdDV1WmjAucwy1o2N8DA54IgtOeWdKU646
 oZVRvicX/rK5cJQb0Kpy96UDs9gYx2TqAhHxHkfrAxHnilQQRbQ9MDHrgDk7pdX0+C463Uq0d+
 mlI=
X-SBRS: 2.7
X-MesageID: 7958549
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7958549"
Date: Mon, 28 Oct 2019 12:29:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <paul@xen.org>
Message-ID: <20191028122956.GA2381@perard.uk.xensource.com>
References: <20191024142103.962-1-paul@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024142103.962-1-paul@xen.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
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
Cc: xen-devel@lists.xenproject.org, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDM6MjE6MDNQTSArMDEwMCwgcGF1bEB4ZW4ub3JnIHdy
b3RlOgo+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBUaGUg
dmlmLXJvdXRlIHNjcmlwdCBzaG91bGQgb25seSBjYWxsICdpcCByb3V0ZScgd2hlbiAnaXBjbWQn
IGhhcyBiZWVuCj4gc2V0LCBvdGhlcndpc2UgaXQgd2lsbCBmYWlsIGR1ZSB0byBhbiBpbmNvcnJl
Y3QgY29tbWFuZCBzdHJpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgo+IC0tLQo+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBUaGlz
IGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGJyb2tlbiBmb3JldmVyLgoKT3IgcHJvYmFibHkgc2luY2Ug
YzBlZmI4ZGM4NTI4MDVmZDRkM2MyNjkxYWNhMWY2YzUyZjZiNmFjNywgMTMgeWVhcnMKYWdvLgoK
PiAtLS0KPiAgdG9vbHMvaG90cGx1Zy9MaW51eC92aWYtcm91dGUgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90
b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZSBiL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJv
dXRlCj4gaW5kZXggYzE0OWZmY2E3My4uOTg4OTNkOTBiNiAxMDA2NDQKPiAtLS0gYS90b29scy9o
b3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZQo+ICsrKyBiL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJv
dXRlCj4gQEAgLTM1LDcgKzM1LDcgQEAgY2FzZSAiJHtjb21tYW5kfSIgaW4KPiAgICAgICAgICA7
Owo+ICBlc2FjCj4gIAo+IC1pZiBbICIke2lwfSIgXSA7IHRoZW4KPiAraWYgWyAiJHtpcGNtZH0i
IF0gOyB0aGVuCgpUaGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRoaXMgbmV3IGNvbmRpdGlvbiBkb2Vz
bid0IHJlYWxseSBleHBsYWluIHdoYXQgaXMKaGFwcGVuaW5nLgpEb2VzIHRoYXQgbWVhbnMgd2Ug
b25seSBuZWVkIHRvIHJ1biBgaXAgcm91dGVgIHdoZW4gY29tbWFuZCBpcyAnb25saW5lJwpvciAn
b2ZmbGluZSc/IElzIHRoZXJlIHNvbWV0aGluZyBlbHNlIHRvIGRvICdhZGQnIGFuZCAncmVtb3Zl
Jz8KCkNvdWxkIHlvdSBhZGQgc29tZXRoaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZSwgYW5kIG1h
eWJlIGEgY29tbWVudD8KClRoYW5rcywKCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
