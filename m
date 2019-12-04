Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A92112FC2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:14:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icXFV-0005em-Hn; Wed, 04 Dec 2019 16:11:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icXFT-0005eY-Gc
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:11:31 +0000
X-Inumbo-ID: baa388f2-16b0-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id baa388f2-16b0-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 16:11:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9CF15B031;
 Wed,  4 Dec 2019 16:11:28 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191204151208.37076-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
Date: Wed, 4 Dec 2019 17:11:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204151208.37076-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
 virtualized on AMD hardware
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9wdi9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwo+IEBA
IC0xMTgsNiArMTE4LDE5IEBAIHVuc2lnbmVkIGxvbmcgcHZfZml4dXBfZ3Vlc3RfY3I0KGNvbnN0
IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIGNyNCkKPiAgICAgICAgICAgICAgKG1tdV9j
cjRfZmVhdHVyZXMgJiBQVl9DUjRfR1VFU1RfVklTSUJMRV9NQVNLKSk7Cj4gIH0KPiAgCj4gK3N0
YXRpYyBpbnQ4X3QgX19yZWFkX21vc3RseSBvcHRfZ2xvYmFsX3BhZ2VzID0gLTE7Cj4gK2Jvb2xl
YW5fcnVudGltZV9wYXJhbSgiZ2xvYmFsLXBhZ2VzIiwgb3B0X2dsb2JhbF9wYWdlcyk7Cj4gKwo+
ICtzdGF0aWMgaW50IF9faW5pdCBwZ2VfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICBpZiAoIG9wdF9n
bG9iYWxfcGFnZXMgPT0gLTEgKQo+ICsgICAgICAgIG9wdF9nbG9iYWxfcGFnZXMgPSAhY3B1X2hh
c19oeXBlcnZpc29yIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RfY3B1X2Rh
dGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRDsKPiArCj4gKyAgICByZXR1cm4gMDsKPiAr
fQo+ICtfX2luaXRjYWxsKHBnZV9pbml0KTsKPiArCj4gIHVuc2lnbmVkIGxvbmcgcHZfbWFrZV9j
cjQoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4gIHsKPiAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4g
KmQgPSB2LT5kb21haW47Cj4gQEAgLTEzMCw3ICsxNDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21h
a2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgICovCj4gICAgICBpZiAoIGQtPmFy
Y2gucHYucGNpZCApCj4gICAgICAgICAgY3I0IHw9IFg4Nl9DUjRfUENJREU7Cj4gLSAgICBlbHNl
IGlmICggIWQtPmFyY2gucHYueHB0aSApCj4gKyAgICBlbHNlIGlmICggIWQtPmFyY2gucHYueHB0
aSAmJiBvcHRfZ2xvYmFsX3BhZ2VzICkKPiAgICAgICAgICBjcjQgfD0gWDg2X0NSNF9QR0U7CgpJ
J20gc29ycnkgZm9yIG5vdGljaW5nIHRoaXMgb25seSBub3csIGJ1dCB3aGF0IGFib3V0IFhFTl9N
SU5JTUFMX0NSNCwKd2hpY2ggaW5jbHVkZXMgWDg2X0NSNF9QR0U/CgpJIGFsc28gaGF2ZSB0byBh
ZG1pdCBJJ20gc3RpbGwgZmVlbGluZyB1bmVhc3kgYWJvdXQgdGhlIHJ1bnRpbWUKYWRqdXN0bWVu
dCB5b3UgcGVybWl0LiBJIGNhbid0IHBvaW50IGF0IGFueXRoaW5nIHRoYXQncyB3cm9uZyBpbiB0
aGlzCnJlZ2FyZCwgYnV0IGFueXdheS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
