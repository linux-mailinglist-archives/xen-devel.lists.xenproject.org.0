Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C331134AD9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 19:47:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipGJs-0003H4-Ht; Wed, 08 Jan 2020 18:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/T5=25=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ipGJr-0003Gz-6S
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 18:44:39 +0000
X-Inumbo-ID: e76c3a62-3246-11ea-a38f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e76c3a62-3246-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578509070;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cjgYEy+rn5/dz3g4MLvPjpa+lfOS50rAEqtspPv7qF4=;
 b=agt/+D5vZP9/SDswuwFcKwWPBl1oh+IGPEDybWgoIWkwB9O6afOo+bnT
 mpHmgN2Dl9orGqrXBGarGChjQ7AQePY1QR7kTmZAIDGGFzyLBtv1tXK1Z
 QAiQln8CmmK81/RYF2kLg7+1rsffgftn6uocmJA9XWiqnYNWNL5lO5it5 c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Fh6qaEl+rgkEX4yENiX1bh8E1mIOvx7OKqRKyDuFaxmSlR/IkYqHPEWbNhhdBT38EMMt5re9/I
 klfQ6tcWS4u7/xbVTp2au9zkPILlDMP/cVcvRfbOoPFAx5m3dACqTP62spSLilXMzft71Iqwj5
 oQZX0SpZXiUxvadiycLzwS5lgYVHeVv1++OaBrTW5+QoTvMXOx+Z0xrG373n+wFYyVQ7yUyh2Y
 1Uh1KdKzDQVEvUkn+GIa8V0JMgx27b+EWE9uCQ1SaMFTR9+TPQ8BsARx6QtrGwLvPJ8MnhYnyQ
 jRM=
X-SBRS: 2.7
X-MesageID: 10802378
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,411,1571716800"; d="scan'208";a="10802378"
Date: Wed, 8 Jan 2020 19:44:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Message-ID: <20200108184422.GX11756@Air-de-Roger>
References: <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
 <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
 <20200108150841.GR11756@Air-de-Roger>
 <CABfawhnWYn_MwaQzdAQ4QezA0vgQ7ByK44eUEerGRP7AU9si+A@mail.gmail.com>
 <20200108180042.GT11756@Air-de-Roger>
 <CABfawhm==Gpca8+E=PihvW3x7Y79kAKD48rk5PHHbbhdATh4-w@mail.gmail.com>
 <CABfawh=StW-4_VF+OUywP+t2SVE_o=gX8H9UGZcFH+e8FFbEQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABfawh=StW-4_VF+OUywP+t2SVE_o=gX8H9UGZcFH+e8FFbEQw@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru
 Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTE6MjM6MjlBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+ID4gPiA+ID4gV2h5IGRvIHlvdSBuZWVkIGEgY29uZmlnIGZpbGUgZm9yIGxhdW5j
aGluZyB0aGUgUWVtdSBkZXZpY2UgbW9kZWw/Cj4gPiA+ID4gPiBEb2Vzbid0IHRoZSBzYXZlLWZp
bGUgY29udGFpbiBhbGwgdGhlIGluZm9ybWF0aW9uPwo+ID4gPiA+Cj4gPiA+ID4gVGhlIGNvbmZp
ZyBpcyB1c2VkIHRvIHBvcHVsYXRlIHhlbnN0b3JlLCBub3QganVzdCBmb3IgUUVNVS4gVGhlIFFF
TVUKPiA+ID4gPiBzYXZlIGZpbGUgZG9lc24ndCBjb250YWluIHRoZSB4bCBjb25maWcuIFRoaXMg
aXMgbm90IGEgZnVsbCBWTSBzYXZlCj4gPiA+ID4gZmlsZSwgaXQgaXMgb25seSB0aGUgUUVNVSBz
dGF0ZSB0aGF0IGdldHMgZHVtcGVkIHdpdGgKPiA+ID4gPiB4ZW4tc2F2ZS1kZXZpY2VzLXN0YXRl
Lgo+ID4gPgo+ID4gPiBUQkggSSB0aGluayBpdCB3b3VsZCBiZSBlYXNpZXIgdG8gaGF2ZSBzb21l
dGhpbmcgbGlrZSBteSBwcm9wb3NhbAo+ID4gPiBiZWxvdywgd2hlcmUgeW91IHRlbGwgeGwgdGhl
IHBhcmVudCBhbmQgdGhlIGZvcmtlZCBWTSBuYW1lcyBhbmQgeGwKPiA+ID4gZG9lcyB0aGUgcmVz
dC4gRXZlbiBiZXR0ZXIgd291bGQgYmUgdG8gbm90IGhhdmUgdG8gdGVsbCB4bCB0aGUgcGFyZW50
Cj4gPiA+IFZNIG5hbWUgKHNpbmNlIEkgZ3Vlc3MgdGhpcyBpcyBhbHJlYWR5IHRyYWNrZWQgaW50
ZXJuYWxseSBzb21ld2hlcmU/KS4KPiA+Cj4gPiBUaGUgZm9ya2VkIFZNIGhhcyBubyAibmFtZSIg
d2hlbiBpdCdzIGNyZWF0ZWQuIEZvciBwZXJmb3JtYW5jZSByZWFzb25zCj4gPiB3aGVuIHRoZSBW
TSBmb3JrIGlzIGNyZWF0ZWQgd2l0aCAiLS1sYXVuY2gtZG0gbm8iIHdlIGV4cGxpY2l0bHkgd2Fu
dAo+ID4gdG8gYXZvaWQgdG91Y2hpbmcgWGVuc3RvcmUuIEV2ZW4gcGFyc2luZyB0aGUgY29uZmln
IGZpbGUgd291bGQgYmUKPiA+IHVubmVlZGVkIG92ZXJoZWFkIGF0IHRoYXQgc3RhZ2UuCj4gCj4g
QW5kIHRvIGFuc3dlciB5b3VyIHF1ZXN0aW9uLCBubywgdGhlIHBhcmVudCBWTSdzIG5hbWUgaXMg
bm90IHJlY29yZGVkCj4gYW55d2hlcmUgZm9yIHRoZSBmb3JrLiBUZWNobmljYWxseSBub3QgZXZl
biB0aGUgcGFyZW50J3MgZG9tYWluIGlkIGlzCj4ga2VwdCBieSBYZW4uIFRoZSBmb3JrIG9ubHkg
a2VlcHMgYSBwb2ludGVyIHRvIHRoZSBwYXJlbnQncyAic3RydWN0Cj4gZG9tYWluIgoKVGhlcmUn
cyB0aGUgZG9tYWluX2lkIGZpZWxkIGluc2lkZSBvZiBzdHJ1Y3QgZG9tYWluLCBzbyBpdCBzZWVt
cyBxdWl0ZQplYXN5IHRvIGdldCB0aGUgcGFyZW50IGRvbWlkIGZyb20gdGhlIGZvcmsgaWYgdGhl
cmUncyBhIHBvaW50ZXIgdG8gdGhlCnBhcmVudCdzIHN0cnVjdCBkb21haW4uCgo+IFNvIHJpZ2h0
IG5vdyB0aGVyZSBpcyBubyBoeXBlcmNhbGwgaW50ZXJmYWNlIHRvIHJldHJpZXZlIGEKPiBmb3Jr
J3MgcGFyZW50J3MgSUQgLSBpdCBpcyBhc3N1bWVkIHRoZSB0b29scyB1c2luZyB0aGUgaW50ZXJm
YWNlIGFyZQo+IGtlZXBpbmcgdHJhY2sgb2YgdGhhdC4gQ291bGQgdGhpcyBpbmZvcm1hdGlvbiBi
ZSBkdW1wZWQgaW50byBYZW5zdG9yZQo+IGFzIHdlbGw/IFllcy4gQnV0IHdlIHNwZWNpZmljYWxs
eSB3YW50IGJlIGFibGUgdG8gY3JlYXRlIHRoZSBmb3JrIGFzCj4gZmFzdCBwb3NzaWJsZSB3aXRo
b3V0IGFueSB1bm5lY2Vzc2FyeSBvdmVyaGVhZC4KCkkgdGhpbmsgaXQgd291bGQgYmUgbmljZSB0
byBpZGVudGlmeSBmb3JrZWQgZG9tYWlucyB1c2luZwpYRU5fRE9NQ1RMX2dldGRvbWFpbmluZm86
IHlvdSBjb3VsZCBhZGQgYSBwYXJlbnRfZG9taWQgZmllbGQgdG8KeGVuX2RvbWN0bF9nZXRkb21h
aW5pbmZvIGFuZCBpZiBpdCdzIHNldCB0byBzb21ldGhpbmcgZGlmZmVyZW50IHRoYW4KRE9NSURf
SU5WQUxJRCB0aGVuIHRoZSBkb21haW4gaXMgYSBmb3JrIG9mIHRoZSBnaXZlbiBkb21pZC4KCk5v
dCBzYXlpbmcgaXQgc2hvdWxkIGJlIGRvbmUgbm93LCBidXQgQUZBSUNUIGdldHRpbmcgdGhlIHBh
cmVudCdzCmRvbWlkIGlzIGZlYXNpYmxlIGFuZCBkb2Vzbid0IHJlcXVpcmUgeGVuc3RvcmUuCgpS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
