Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E377012490
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 00:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMK9B-0007xW-62; Thu, 02 May 2019 22:25:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6X+8=TC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMK99-0007xR-Uf
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 22:25:44 +0000
X-Inumbo-ID: 34fd6924-6d29-11e9-82bc-afc429621926
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34fd6924-6d29-11e9-82bc-afc429621926;
 Thu, 02 May 2019 22:25:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6CC0320644;
 Thu,  2 May 2019 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556835935;
 bh=Onae44FX1fIYDwhLQqb8AU+FgFxwrC0vR3+PoXb1MbA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oy+Kel+mFm1IUtJs2BB3udcKFeTNHl3QXtsFFel2Q1xgefnnOOPTaJ+5nSsG3W2z1
 qIqq4+h3u18DqniYoJ7bp6PMKVLIY33KPIedLbv1R4yLBCaJeFB1skml6FJEcU37aN
 idNUy30mmc8hfIf+Q+eUa9sGr5rbfFsz8vf6Ea5Q=
Date: Thu, 2 May 2019 15:25:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CCAB676020000780022B199@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.10.1905021517420.4309@sstabellini-ThinkPad-X260>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
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

T24gVGh1LCAyIE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDIuMDUuMTkg
YXQgMTE6MDIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gPiBPbiA1LzIvMTkgODoz
MCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+Pj4gT24gMDIuMDUuMTkgYXQgMDA6NDQsIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pj4gSGkgSmFuLCBJIGhhdmUgYSBxdWVz
dGlvbiBvbiB0aGUgUERYIGNvZGUuCj4gPj4+Cj4gPj4+IFRoZSBQRFggaW5pdGlhbGl6YXRpb24g
aXMgYSBiaXQgZGlmZmVyZW50IGJldHdlZW4geDg2IGFuZCBBUk0sIGJ1dCBpdAo+ID4+PiBmb2xs
b3dzIHJvdWdobHkgdGhlIHNhbWUgcGF0dGVybiwgbG9vayBhdAo+ID4+PiB4ZW4vYXJjaC94ODYv
c3JhdC5jOnNyYXRfcGFyc2VfcmVnaW9ucyAoSSB0YWtlIHRoYXQgaXMgd2hlcmUgdGhpbmdzCj4g
Pj4+IGhhcHBlbiBvbiB4ODYpIGFuZCB4ZW4vYXJjaC9hcm0vc2V0dXAuYzppbml0X3BkeC4KPiA+
Pj4KPiA+Pj4gTWFzayBpcyBpbml0aWFsaXplZCBjYWxsaW5nIHBkeF9pbml0X21hc2sgb24gYSBz
dGFydCBhZGRyZXNzLCB0aGVuIGEKPiA+Pj4gbG9vcCBmaWxscyBpbiB0aGUgcmVzdCBvZiB0aGUg
bWFzayBjYWxsaW5nIHBkeF9yZWdpb25fbWFzaywgYmFzZWQgb24gdGhlCj4gPj4+IG1lbW9yeSBy
ZWdpb25zIHByZXNlbnQuCj4gPj4+Cj4gPj4+IEkgd3JvdGUgYSBzbWFsbCB1bml0IHRlc3Qgb2Yg
dGhlIEFSTSBQRFggaW5pdGlhbGl6YXRpb24gYW5kIHdoaWxlIEkgd2FzCj4gPj4+IHBsYXlpbmcg
d2l0aCBhZGRyZXNzZXMgYW5kIHZhbHVlcyBJIG5vdGljZWQgdGhhdCBhY3R1YWxseSBpZiBJIHNp
bXBseQo+ID4+PiBza2lwIHBkeF9pbml0X21hc2sgYW5kIGp1c3QgaW5pdGlhbGl6ZSB0aGUgbWFz
ayB0byAwIChtYXNrID0gMCkgaW4KPiA+Pj4gaW5pdF9wZHgsIHRoZSByZXN0IG9mIHRoZSBmdW5j
dGlvbiBhbHdheXMgY2FsY3VsYXRlcyB0aGUgcmlnaHQgbWFzay4KPiA+Pj4KPiA+Pj4gSW4gZmFj
dCwgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGluaXRpYWxpemluZyB0aGUgbWFzayB0byBhIHZhbHVl
IGNhdXNlcwo+ID4+PiB0aGUgcmVzdCBvZiB0aGUgY29kZSB0byBtaXNzIHNvbWUgcG90ZW50aWFs
IGNvbXByZXNzaW9ucy4gV2hpbGUKPiA+Pj4gaW5pdGlhbGl6aW5nIHRoZSBtYXNrIHRvIDAgbGVh
ZHMgdG8gbW9yZSBvcHRpbWl6YXRpb25zLiBJIGNhbiBwcm92aWRlCj4gPj4+IHNwZWNpZmljIGV4
YW1wbGVzIGlmIHlvdSBhcmUgY3VyaW91cy4KPiA+Pj4KPiA+Pj4gQmVmb3JlIEkgbWFrZSBhbnkg
Y2hhbmdlcyB0byB0aGF0IGNvZGUsIEkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIGEgYml0Cj4g
Pj4+IGJldHRlciB3aHkgdGhpbmdzIGFyZSBkb25lIHRoYXQgd2F5IHRvZGF5LiBEbyB5b3Uga25v
dyB3aHkgdGhlIG1hc2sgaXMKPiA+Pj4gaW5pdGlhbGl6ZWQgdG8gcGR4X2luaXRfbWFzayhzdGFy
dC1vZi1yYW0pPwo+ID4gCj4gPiBXZWxsLCBpdCBpcyBub3QgdGhlIHN0YXJ0LW9mLXJhbSBvbiBB
cm0uIEl0IGlzIHdoYXRldmVyIGlzIHRoZSBzdGFydCBvZiAKPiA+IGJhbmsgMC4gVGhpcyBpcyBi
ZWNhdXNlIHRoZSBmaXJtd2FyZSB0YWJsZSAoc3VjaCBhcyBEVCkgbWF5IG5vdCByZXF1aXJlIAo+
ID4gb3JkZXJpbmcgYW5kIHdlIGRvbid0IG9yZGVyIGJhbmtzIGluIFhlbi4KPiA+IAo+ID4gU28g
aXQgbWF5IGJlIHBvc3NpYmxlIHRoZSBQRFggd2lsbCBub3QgY29tcHJlc3MgaWYgdGhlIGJhbmtz
IGFyZSBub3QgCj4gPiBvcmRlcmVkIGluIHRoZSBmaXJtd2FyZSB0YWJsZXMuCj4gCj4gRXZlbiBt
b3JlIHNvIGEgcmVhc29uIG5vdCB0byB1c2UgYmFuayAwJ3Mgc3RhcnQgYWRkcmVzcy4KPiAKPiA+
PiBJJ20gY29uZnVzZWQsIGFuZCBoZW5jZSBJJ20gcGVyaGFwcyBtaXN1bmRlcnN0YW5kaW5nIHlv
dXIKPiA+PiBxdWVzdGlvbi4gVG8gbWUgaXQgbG9va3MgbGlrZSB5b3UncmUgcmUtYXNraW5nIGEg
cXVlc3Rpb24gYWxyZWFkeQo+ID4+IGFuc3dlcmVkLiBPbiB4ODYgd2UgZG9uJ3Qgd2FudCB0byBz
cXVhc2ggb3V0IGFueSBvZiB0aGUgbG93Cj4gPj4gMzIgYml0cywgYmVjYXVzZSBvZiB0aGUgc3Bl
Y2lhbCBhZGRyZXNzIHJhbmdlcyB0aGF0IGxpdmUgYmVsb3cKPiA+PiA0R2IuIEhlbmNlIHdlIGlu
dm9rZSBwZHhfaW5pdF9tYXNrKGZpcnN0LWJsb2NrLWF0LW9yLWFib3ZlLTRHYikuCj4gPj4gTm90
ZSBpdCdzIG5vdCBzdGFydC1vZi1yYW0sIGFzIHlvdSd2ZSBzYWlkLgo+ID4gCj4gPiBJIHRoaW5r
IHdoYXQgU3RlZmFubyBpcyBhc2tpbmcgaXMgd2h5IHBkeF9pbml0X21hc2soLi4uKSBpcyBpbnZv
a2VkIHdpdGggCj4gPiB0aGUgZmlyc3QgYmxvY2sgYWRkcmVzcyByYXRoZXIgdGhhbiA0R0IgKG9y
IGV2ZW4gMCB0aG91Z2h0IEkgZG9uJ3QgdGhpbmsgCj4gPiB0aGlzIGlzIHJpZ2h0KS4KPiA+IAo+
ID4gQnkgdXNpbmcgdGhlIGZpcnN0IGJsb2NrIGFkZHJlc3MsIHRoZSBQRFggd2lsbCBub3QgYmUg
YWJsZSB0byBjb21wcmVzcyAKPiA+IGFueSBiaXRzIGJldHdlZW4gMCBhbmQgdGhlIE1TQiAxJyBp
biB0aGUgZmlyc3QgYmxvY2sgYWRkcmVzcy4gSW4gb3RoZXIgCj4gPiB3b3JkLCBmb3IgYSBiYXNl
IGFkZHJlc3MgMHgyMDAwMDAwMDAgKDhHQiksIHRoZSBpbml0aWFsIG1hc2sgd2lsbCBiZSAKPiA+
IDB4MWZmZmZmZmZmLgo+ID4gCj4gPiBTdGVmYW5vIGFuZCBJIHdlcmUgd29uZGVyaW5nIHdoZXRo
ZXIgaXQgd291bGQgaW5zdGVhZCBiZSBwb3NzaWJsZSB0byAKPiA+IGNyZWF0ZSB0aGUgaW5pdGlh
bCBtYXNrIHdpdGggcGR4X2luaXRfbWFzayg0R0IpIG9yIHBkeF9pbml0X21hc2soMUdCKSAKPiA+
IChJLmUgdGhlIG1heGltdW0gY29udGlndW91cyByYW5nZSB0aGUgYnVkZHkgYWxsb2NhdG9yIGNh
biBhbGxvY2F0ZSkuCj4gCj4gVGhhdCdzIGluZGVlZCBhbiBvcHRpb24gLSBpdCdzIGp1c3QgdGhh
dCBJJ3ZlIHlldCB0byBzZWUgYW4geDg2Cj4gc3lzdGVtIHdoZXJlIHRoZXJlJ3MgYSBob2xlIHN0
YXJ0aW5nIGF0IDRHYi4gV2hhdCdzIGJldHRlciBpbiB0aGF0Cj4gY2FzZSBjYW4gcHJvYmFibHkg
YmUganVkZ2VkIG9ubHkgb25jZSBydW4gaW50byBzdWNoIGEgY2FzZS4KCkFsbCByaWdodC4gTG9v
a2luZyBhdCB0aGUgY29tbWVudCBpbiBwZm5fcGR4X2hvbGVfc2V0dXAsIGl0IHNlZW1zIHRoYXQK
aXQgaXMgaW50ZW5kaW5nIHRvIHNraXAgdGhlIGZpcnN0IE1BWF9PUkRFUiBiaXRzLCBidXQgYWN0
dWFsbHkgaXQgaXMKc2tpcHBpbmcgdGhlIGZpcnN0IE1BWF9PUkRFUi0xIGJpdHMsIGlmIG15IGNh
bGN1bGF0aW9ucyBhcmUgY29ycmVjdC4KCk1BWF9PUkRFUiBpcyAxOCBvbiBBUk0gd2hpY2ggY29y
cmVzcG9uZCB0byAxR0IuIFdpdGggdGhlIGN1cnJlbnQKaW1wbGVtZW50YXRpb24gb2YgcGZuX3Bk
eF9ob2xlX3NldHVwLCBpZiBJIHBhc3MgYSBtYXNrIGNvcnJlc3BvbmRpbmcgdG8KNTEyTUIsIEkg
Y2FuIHNlZSAiUEZOIGNvbXByZXNzaW9uIG9uIGJpdHMgMTcuLi4xOSIuIFNvIHRoZSByYW5nZQo1
MTJNQi0xR0IgZ2V0cyBjb21wcmVzc2VkLgoKU2hvdWxkbid0IGl0IGJlOgoKZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vcGR4LmMgYi94ZW4vY29tbW9uL3BkeC5jCmluZGV4IDUwYzIxYjYuLmIzMzRl
YjkgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGR4LmMKKysrIGIveGVuL2NvbW1vbi9wZHguYwpA
QCAtODEsNyArODEsNyBAQCB2b2lkIF9faW5pdCBwZm5fcGR4X2hvbGVfc2V0dXAodW5zaWduZWQg
bG9uZyBtYXNrKQogICAgICAqIGNvbnRpZ3VvdXMgYWxpZ25lZCByYW5nZXMgb2YgMl5NQVhfT1JE
RVIgcGFnZXMuIEFtb25nIG90aGVycywgb3VyCiAgICAgICogYnVkZHkgYWxsb2NhdG9yIHJlbGll
cyBvbiB0aGlzIGFzc3VtcHRpb24uCiAgICAgICovCi0gICAgZm9yICggaiA9IE1BWF9PUkRFUi0x
OyA7ICkKKyAgICBmb3IgKCBqID0gTUFYX09SREVSOyA7ICkKICAgICB7CiAgICAgICAgIGkgPSBm
aW5kX25leHRfemVyb19iaXQoJm1hc2ssIEJJVFNfUEVSX0xPTkcsIGopOwogICAgICAgICBqID0g
ZmluZF9uZXh0X2JpdCgmbWFzaywgQklUU19QRVJfTE9ORywgaSk7IAoKCldpdGggdGhpcyBjaGFu
Z2UsIEkgZG9uJ3Qgc2VlIHBmbl9wZHhfaG9sZV9zZXR1cCB0cnlpbmcgdG8gY29tcHJlc3MgYml0
CjE3IGFueW1vcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
