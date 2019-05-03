Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDA1345A
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 22:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMec0-0002m3-6W; Fri, 03 May 2019 20:16:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMeby-0002ly-Gh
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:16:50 +0000
X-Inumbo-ID: 615f4b5b-6de0-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 615f4b5b-6de0-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 20:16:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF1102075E;
 Fri,  3 May 2019 20:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556914608;
 bh=2BX9NPGJnBRwfZTqh9Uqfyvylwm2IqKA7OShe4UWSFE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=I/S5+vSRdeIWYvg6k5NDAjdnFyXP69XJK29h5IZmy+f3fV2v+SRLsVuYaGyCJ7BfG
 e2Ke56fxZNBrzsBVfxDT2wot5zyGbdPMMjKtKiIxJACEj27YfZxfOwoWTs1jcPGufS
 aA1xA5MFXOOwt+fjD7tR7BqI+he/YQ2K5iEj1FKk=
Date: Fri, 3 May 2019 13:16:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CCBED14020000780022B7FE@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1905031147490.3722@sstabellini-ThinkPad-X260>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
 <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
 <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
 <5CC72125020000780022A20F@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1904291008070.27577@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1905011536510.23881@sstabellini-ThinkPad-X260>
 <5CCA9CAC020000780022B058@prv1-mh.provo.novell.com>
 <1f9effdd-e920-bf07-d9e1-1b126a409fc0@arm.com>
 <5CCAB676020000780022B199@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1905021517420.4309@sstabellini-ThinkPad-X260>
 <5CCBED14020000780022B7FE@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAzIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDMuMDUuMTkg
YXQgMDA6MjUsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEFsbCByaWdodC4g
TG9va2luZyBhdCB0aGUgY29tbWVudCBpbiBwZm5fcGR4X2hvbGVfc2V0dXAsIGl0IHNlZW1zIHRo
YXQKPiA+IGl0IGlzIGludGVuZGluZyB0byBza2lwIHRoZSBmaXJzdCBNQVhfT1JERVIgYml0cywg
YnV0IGFjdHVhbGx5IGl0IGlzCj4gPiBza2lwcGluZyB0aGUgZmlyc3QgTUFYX09SREVSLTEgYml0
cywgaWYgbXkgY2FsY3VsYXRpb25zIGFyZSBjb3JyZWN0Lgo+ID4gCj4gPiBNQVhfT1JERVIgaXMg
MTggb24gQVJNIHdoaWNoIGNvcnJlc3BvbmQgdG8gMUdCLiBXaXRoIHRoZSBjdXJyZW50Cj4gPiBp
bXBsZW1lbnRhdGlvbiBvZiBwZm5fcGR4X2hvbGVfc2V0dXAsIGlmIEkgcGFzcyBhIG1hc2sgY29y
cmVzcG9uZGluZyB0bwo+ID4gNTEyTUIsIEkgY2FuIHNlZSAiUEZOIGNvbXByZXNzaW9uIG9uIGJp
dHMgMTcuLi4xOSIuIFNvIHRoZSByYW5nZQo+ID4gNTEyTUItMUdCIGdldHMgY29tcHJlc3NlZC4K
PiA+IAo+ID4gU2hvdWxkbid0IGl0IGJlOgo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9wZHguYyBiL3hlbi9jb21tb24vcGR4LmMKPiA+IGluZGV4IDUwYzIxYjYuLmIzMzRlYjkgMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vY29tbW9uL3BkeC5jCj4gPiArKysgYi94ZW4vY29tbW9uL3BkeC5j
Cj4gPiBAQCAtODEsNyArODEsNyBAQCB2b2lkIF9faW5pdCBwZm5fcGR4X2hvbGVfc2V0dXAodW5z
aWduZWQgbG9uZyBtYXNrKQo+ID4gICAgICAgKiBjb250aWd1b3VzIGFsaWduZWQgcmFuZ2VzIG9m
IDJeTUFYX09SREVSIHBhZ2VzLiBBbW9uZyBvdGhlcnMsIG91cgo+ID4gICAgICAgKiBidWRkeSBh
bGxvY2F0b3IgcmVsaWVzIG9uIHRoaXMgYXNzdW1wdGlvbi4KPiA+ICAgICAgICovCj4gPiAtICAg
IGZvciAoIGogPSBNQVhfT1JERVItMTsgOyApCj4gPiArICAgIGZvciAoIGogPSBNQVhfT1JERVI7
IDsgKQo+ID4gICAgICB7Cj4gPiAgICAgICAgICBpID0gZmluZF9uZXh0X3plcm9fYml0KCZtYXNr
LCBCSVRTX1BFUl9MT05HLCBqKTsKPiA+ICAgICAgICAgIGogPSBmaW5kX25leHRfYml0KCZtYXNr
LCBCSVRTX1BFUl9MT05HLCBpKTsgCj4gCj4gWWVzLCBidXQuIE9yaWdpbmFsbHkgd2Ugc3RhcnRl
ZCBmcm9tIHplcm8gaGVyZS4gQXMgYSB3aWxkIGd1ZXNzLAo+IEkgdGhpbmsgS2VpciBtYXkgaGF2
ZSB0aG91Z2h0IHRoZSBjcHVtYXNrX25leHQoKSB3YXkgd2hlbgo+IHB1dHRpbmcgdG9nZXRoZXIg
YmRiNTQzOWMzZiwgd2hlcmUgYW4gYWRqdXN0bWVudCBieSAxIGlzCj4gbmVlZGVkIGluIHRoZSBj
YWxsIHRvIGZpbmRfbmV4dF9iaXQoKS4gSGVuY2UgaXQgcHJvYmFibHkgd2FzCj4gaW50dWl0aXZl
IGZvciBoaW0gdG8gaGF2ZSB0aGUgaW5kZXggc3RhcnQgYXQgb25lIGxlc3MuIEkgZG8gdGhpbmss
Cj4gaG93ZXZlciwgdGhhdCB3aXRoIHRoZSBzd2l0Y2ggYXdheSBmcm9tIHplcm8sIHRoaW5ncyB3
b3VsZAo+IGJldHRlciBoYXZlIGJlY29tZQo+IAo+ICAgICBmb3IgKCBqID0gTUFYX09SREVSIC0g
MTsgOyApCj4gICAgIHsKPiAgICAgICAgIGkgPSBmaW5kX25leHRfemVyb19iaXQoJm1hc2ssIEJJ
VFNfUEVSX0xPTkcsIGogKyAxKTsKPiAgICAgICAgIGogPSBmaW5kX25leHRfYml0KCZtYXNrLCBC
SVRTX1BFUl9MT05HLCBpICsgMSk7Cj4gCj4gQXMgeW91IGNhbiBzZWUsIHVzaW5nIGogKyAxIHdo
ZW4gc3RhcnRpbmcgZnJvbSB6ZXJvIHdvdWxkbid0Cj4gcmVhbGx5IGhhdmUgYmVlbiBjb3JyZWN0
IChhbGJlaXQgd2Ugc3VyZWx5IGRpZG4ndCBleHBlY3QgdG8KPiBjb21wcmVzcyBvbiBiaXQgemVy
bywgc28gdGhpcyBpcyBtZXJlbHkgYSBtb290IGNvbnNpZGVyYXRpb24pLgo+IAo+IE5vdyB0aGVy
ZSdzIGEgcG9zc2libGUgY2F2ZWF0IGhlcmU6IFdoaWxlIGZvciBzeW1tZXRyeSBhbHNvCj4gdXNp
bmcgaSArIDEgaW4gdGhlIHNlY29uZCBjYWxsIHdvdWxkIHNlZW0gZGVzaXJhYmxlLCBJJ20gYWZy
YWlkCj4gaXQgY2FuJ3QgYmUgdXNlZCBkaXJlY3RseSB0aGF0IHdheSwgYXMgZmluZF97LG5leHRf
fXplcm9fYml0KCksCj4gb24geDg2IGF0IGxlYXN0LCBhc3N1bWUgdGhlaXIgbGFzdCBhcmd1bWVu
dCB0byBiZSBsZXNzIHRoYW4KPiB0aGVpciBtaWRkbGUgb25lLiBUaGlzLCBpbiB0dXJuLCBtYXkg
YWxyZWFkeSBiZSB2aW9sYXRlZCBpbgo+IHRoZSBnZW5lcmFsIGNhc2UgKG5vdyB0aGF0IHRoZSBm
dW5jdGlvbiBsaXZlcyBpbiBjb21tb24gY29kZSk6Cj4gQW4gYXJjaGl0ZWN0dXJlIHdpdGggYWxs
IEJJVFNfUEVSX0xPTkcrUEFHRV9TSVpFIGJpdHMgdXNhYmxlCj4gYXMgcGh5c2ljYWwgYWRkcmVz
cyAoeDg2LTY0IGNhbiB1c2Ugb25seSB1cCB0byA1MiwgYnV0IHg4Ni0zMgo+IGNhbiBpbiBwcmlu
Y2lwbGUgLSBwb3NzaWJseSB3aXRoIHNvbWUgZXh0cmEgY29uZGl0aW9ucyBsaWtlIHJ1bm5pbmcK
PiBvbiB0b3Agb2YgYSA2NC1iaXQgaHlwZXJ2aXNvciAtIHVzZSBhbGwgNDQgYml0cykgdGhlIGZp
cnN0IGNhbGwgbWF5Cj4gYWxyZWFkeSByZXR1cm4gQklUU19QRVJfTE9ORywgYW5kIGhlbmNlIHRo
ZSBzZWNvbmQgY2FsbAo+IG1pZ2h0IGFscmVhZHkgcHJvZHVjZSBVQi4gQXMgYSByZXN1bHQsIHRv
IGZpeCB0aGlzIG90aGVyIChsYXRlbnQKPiBvbmx5IGFmYWljdCkgaXNzdWUgYXQgdGhlIHNhbWUg
dGltZSwgdGhlIGNvZGUgaW1vIG91Z2h0IHRvCj4gYmVjb21lCj4gCj4gICAgIGZvciAoIGogPSBN
QVhfT1JERVIgLSAxOyA7ICkKPiAgICAgewo+ICAgICAgICAgaSA9IGZpbmRfbmV4dF96ZXJvX2Jp
dCgmbWFzaywgQklUU19QRVJfTE9ORywgaiArIDEpOwo+ICAgICAgICAgaWYgKCBpID49IEJJVFNf
UEVSX0xPTkcgKQo+ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgaiA9IGZpbmRfbmV4dF9i
aXQoJm1hc2ssIEJJVFNfUEVSX0xPTkcsIGkgKyAxKTsKPiAgICAgICAgIGlmICggaiA+PSBCSVRT
X1BFUl9MT05HICkKPiAgICAgICAgICAgICBicmVhazsKPiAKCk1ha2VzIHNlbnNlLiBJIHRyaWVk
IGl0IGluIG15IHNldHVwIGFuZCBpdCBmaXhlcyB0aGUgbWlzYmVoYXZpb3IgSSB3YXMKc2VlaW5n
LiBJIGFtIGFkZGluZyB0aGlzIHBhdGNoIHRvIG15IHNob3J0IHNlcmllcyBvZiBQRFggZml4ZXMu
IEkgYW0KYWRkaW5nIHlvdXIgc2lnbmVkLW9mZi1ieSB0byB0aGUgcGF0Y2gsIGxldCBtZSBrbm93
IGlmIGl0IGlzIGEgcHJvYmxlbS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
