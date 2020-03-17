Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB0188B7E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 18:03:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEFa7-0004GM-Fl; Tue, 17 Mar 2020 17:00:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+aMz=5C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jEFa5-0004GB-QM
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 17:00:41 +0000
X-Inumbo-ID: d363a00e-6870-11ea-92cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d363a00e-6870-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584464438;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=F5CR6K+J2biiGMlE54DUA9pBsEaUUPWGdYaPis60Yhw=;
 b=H3iv+kYSDrAZvZtL37QOOnCXlOVwp/dJyoThRUy/mjV4OMNuJiJFgNQ5
 +8sQcsuKs2CQW4GD2Yi+7rdqWd8hhh0xW0ThZip9v8RPpbtS4PbiCiRP1
 e4PpO9cmrgaHOSrbArF91I88QRmWh/x3UyZlDkDZeV4L+k6XcbvcHh6KP 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U9KPTaf8fhjilZ6W3NGaZXao/QNfjPUNKokVdmtwUKcd1JwSrBDiyezASUFj1QI0RCrE8Kuaxn
 uL+zKFBL4Q2oWjfSX3tghlJYy56qq0TkuKvDhL+JSQQ9x4vF77jhY5JjsJUQ3HHXQfwgS82QKD
 dXvAUG4QohvebK65s2wsuMSbMr5wkI0aWIwUbeNPYPbSFc2dpJQpLEytDCu+xTnNTQxuCRgUx6
 YgNMm0dFem345r2OZATVuVCQwu5vZpSxJP8Qa3YfEg9DbTbgZPKOak1Xqvp1ICnTZad1RzxCxP
 FZw=
X-SBRS: 2.7
X-MesageID: 14554508
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,565,1574139600"; d="scan'208";a="14554508"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24177.500.399884.150514@mariner.uk.xensource.com>
Date: Tue, 17 Mar 2020 16:59:32 +0000
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0fc1481c9f90fd91b3e1c41bc3e26da104770cb7.camel@infradead.org>
References: <5fa9d44f9e396a07b87ef9bd63094237b1efecc2.camel@infradead.org>
 <c8f6989f-5b9d-ffec-8e21-971d18a698a4@suse.com>
 <0fc1481c9f90fd91b3e1c41bc3e26da104770cb7.camel@infradead.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] Add -MP to CFLAGS along with -MMD.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGF2aWQgV29vZGhvdXNlIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIEFkZCAtTVAgdG8gQ0ZMQUdTIGFs
b25nIHdpdGggLU1NRC4iKToKPiBPbiBUdWUsIDIwMjAtMDMtMTcgYXQgMTU6NTIgKzAxMDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+ID4gT24gMTcuMDMuMjAyMCAxNTozNCwgRGF2aWQgV29vZGhvdXNl
IHdyb3RlOgo+ID4gPiBGcm9tOiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgo+
ID4gPiAKPiA+ID4gVGhpcyBjYXVzZXMgZ2NjICh5ZXMsIGFuZCBjbGFuZykgdG8gZW1pdCBwaG9u
eSB0YXJnZXRzIGZvciBlYWNoIGRlcGVuZGVuY3kuCj4gPiA+IAo+ID4gPiBUaGlzIG1lYW5zIHRo
YXQgd2hlbiBhIGhlYWRlciBmaWxlIGlzIGRlbGV0ZWQsIHRoZSBDIGZpbGVzIHdoaWNoICp1c2Vk
Kgo+ID4gPiB0byBpbmNsdWRlIGl0IHdpbGwgbm8gbG9uZ2VyIHN0b3AgYnVpbGRpbmcgd2l0aCBi
b2d1cyBvdXQtb2YtZGF0ZQo+ID4gPiBkZXBlbmRlbmNpZXMgbGlrZSB0aGlzOgo+ID4gPiAKPiA+
ID4gICAgbWFrZVs1XTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQKPiA+ID4gICAgJy9ob21l
L2R3bXcyL2dpdC94ZW4veGVuL2luY2x1ZGUvYXNtL2h2bS9zdm0vYW1kLWlvbW11LXByb3RvLmgn
LAo+ID4gPiAgICBuZWVkZWQgYnkgJ3AybS5vJy4gU3RvcC4KPiA+IAo+ID4gSW4gcHJpbmNpcGxl
IHRoaXMgd291bGQgYmUgbmljZSwgYnV0IHRoZXJlIG11c3QgYmUgYSByZWFzb24gdGhpcyBpc24n
dAo+ID4gdGhlIGRlZmF1bHQgYmVoYXZpb3IuIEFzIHRoZSB3b3JrYXJvdW5kIGZvciB0aGUgaXNz
dWUgYXQgaGFuZCBpcyBxdWl0ZQo+ID4gc2ltcGxlLCBJIHdvdWxkbid0IGxpa2UgdG8gdHJlYXQg
YWRkcmVzc2luZyB0aGlzIG9uZSBieSBzb21lIG90aGVyCj4gPiBhbm9tYWx5L3F1aXJrLiBEbyB5
b3UgKG9yIGRvZXMgYW55b25lIGVsc2UpIGhhdmUgaW5zaWdodCBpbnRvIHdoeSB0aGlzCj4gPiBp
c24ndCBkZWZhdWx0IGJlaGF2aW9yPwo+IAo+IE5vLgoKSSB0aGluayB0aGlzIGFuc3dlciBpczoK
CkkgdGhpbmsgaXQgY291bGQgaW50ZXJmZXJlIHdpdGggb3RoZXIgcnVsZXMgaW50ZW5kZWQgdG8g
YnVpbGQgKG9yCnJlYnVpbGQpIC5oIGZpbGVzLiAgVGhpcyBpcyBwYXJ0aWN1bGFybHkgdHJ1ZSBm
b3IgcGF0dGVybiBvciBzdWZmaXgKcnVsZXMuICBJIHdvdWxkIGhhdmUgdG8gUlRGTSBwcm9wZXJs
eSBhbmQgdGhpbmsgYWJvdXQgaXQgdG8gdW5kZXJzdGFuZAphbGwgdGhlIGltcGxpY2F0aW9ucywg
dG8ga25vdyB3aGF0IGtpbmQgb2Ygbm9udHJpdmlhbCAuaC1yZWJ1aWxkaW5nCnJ1bGVzIG1pZ2h0
IGJlIGFmZmVjdGVkIChhbmQgdGhlcmVmb3JlLCB0byBrbm93IHdoZXRoZXIgd2UgaGF2ZSBhbnkK
c3VjaCBydWxlcykuCgpTb3JyeS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
