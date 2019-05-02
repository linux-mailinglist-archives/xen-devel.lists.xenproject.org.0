Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D611684
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 11:24:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7tu-0005w6-JR; Thu, 02 May 2019 09:21:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM7tt-0005w1-8I
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 09:21:09 +0000
X-Inumbo-ID: 9712b3b2-6cbb-11e9-948a-63a95870e18a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9712b3b2-6cbb-11e9-948a-63a95870e18a;
 Thu, 02 May 2019 09:20:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 03:20:55 -0600
Message-Id: <5CCAB676020000780022B199@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 03:20:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
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
In-Reply-To: <1f9effdd-e920-bf07-d9e1-1b126a409fc0@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
 Andrew Cooper <andrew.cooper3@citrix.com>, 206497@studenti.unimore.it,
 xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDExOjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMi8xOSA4OjMwIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDIuMDUuMTkg
YXQgMDA6NDQsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPj4+IEhpIEphbiwgSSBo
YXZlIGEgcXVlc3Rpb24gb24gdGhlIFBEWCBjb2RlLgo+Pj4KPj4+IFRoZSBQRFggaW5pdGlhbGl6
YXRpb24gaXMgYSBiaXQgZGlmZmVyZW50IGJldHdlZW4geDg2IGFuZCBBUk0sIGJ1dCBpdAo+Pj4g
Zm9sbG93cyByb3VnaGx5IHRoZSBzYW1lIHBhdHRlcm4sIGxvb2sgYXQKPj4+IHhlbi9hcmNoL3g4
Ni9zcmF0LmM6c3JhdF9wYXJzZV9yZWdpb25zIChJIHRha2UgdGhhdCBpcyB3aGVyZSB0aGluZ3MK
Pj4+IGhhcHBlbiBvbiB4ODYpIGFuZCB4ZW4vYXJjaC9hcm0vc2V0dXAuYzppbml0X3BkeC4KPj4+
Cj4+PiBNYXNrIGlzIGluaXRpYWxpemVkIGNhbGxpbmcgcGR4X2luaXRfbWFzayBvbiBhIHN0YXJ0
IGFkZHJlc3MsIHRoZW4gYQo+Pj4gbG9vcCBmaWxscyBpbiB0aGUgcmVzdCBvZiB0aGUgbWFzayBj
YWxsaW5nIHBkeF9yZWdpb25fbWFzaywgYmFzZWQgb24gdGhlCj4+PiBtZW1vcnkgcmVnaW9ucyBw
cmVzZW50Lgo+Pj4KPj4+IEkgd3JvdGUgYSBzbWFsbCB1bml0IHRlc3Qgb2YgdGhlIEFSTSBQRFgg
aW5pdGlhbGl6YXRpb24gYW5kIHdoaWxlIEkgd2FzCj4+PiBwbGF5aW5nIHdpdGggYWRkcmVzc2Vz
IGFuZCB2YWx1ZXMgSSBub3RpY2VkIHRoYXQgYWN0dWFsbHkgaWYgSSBzaW1wbHkKPj4+IHNraXAg
cGR4X2luaXRfbWFzayBhbmQganVzdCBpbml0aWFsaXplIHRoZSBtYXNrIHRvIDAgKG1hc2sgPSAw
KSBpbgo+Pj4gaW5pdF9wZHgsIHRoZSByZXN0IG9mIHRoZSBmdW5jdGlvbiBhbHdheXMgY2FsY3Vs
YXRlcyB0aGUgcmlnaHQgbWFzay4KPj4+Cj4+PiBJbiBmYWN0LCB0aGVyZSBhcmUgY2FzZXMgd2hl
cmUgaW5pdGlhbGl6aW5nIHRoZSBtYXNrIHRvIGEgdmFsdWUgY2F1c2VzCj4+PiB0aGUgcmVzdCBv
ZiB0aGUgY29kZSB0byBtaXNzIHNvbWUgcG90ZW50aWFsIGNvbXByZXNzaW9ucy4gV2hpbGUKPj4+
IGluaXRpYWxpemluZyB0aGUgbWFzayB0byAwIGxlYWRzIHRvIG1vcmUgb3B0aW1pemF0aW9ucy4g
SSBjYW4gcHJvdmlkZQo+Pj4gc3BlY2lmaWMgZXhhbXBsZXMgaWYgeW91IGFyZSBjdXJpb3VzLgo+
Pj4KPj4+IEJlZm9yZSBJIG1ha2UgYW55IGNoYW5nZXMgdG8gdGhhdCBjb2RlLCBJIHdvdWxkIGxp
a2UgdG8gdW5kZXJzdGFuZCBhIGJpdAo+Pj4gYmV0dGVyIHdoeSB0aGluZ3MgYXJlIGRvbmUgdGhh
dCB3YXkgdG9kYXkuIERvIHlvdSBrbm93IHdoeSB0aGUgbWFzayBpcwo+Pj4gaW5pdGlhbGl6ZWQg
dG8gcGR4X2luaXRfbWFzayhzdGFydC1vZi1yYW0pPwo+IAo+IFdlbGwsIGl0IGlzIG5vdCB0aGUg
c3RhcnQtb2YtcmFtIG9uIEFybS4gSXQgaXMgd2hhdGV2ZXIgaXMgdGhlIHN0YXJ0IG9mIAo+IGJh
bmsgMC4gVGhpcyBpcyBiZWNhdXNlIHRoZSBmaXJtd2FyZSB0YWJsZSAoc3VjaCBhcyBEVCkgbWF5
IG5vdCByZXF1aXJlIAo+IG9yZGVyaW5nIGFuZCB3ZSBkb24ndCBvcmRlciBiYW5rcyBpbiBYZW4u
Cj4gCj4gU28gaXQgbWF5IGJlIHBvc3NpYmxlIHRoZSBQRFggd2lsbCBub3QgY29tcHJlc3MgaWYg
dGhlIGJhbmtzIGFyZSBub3QgCj4gb3JkZXJlZCBpbiB0aGUgZmlybXdhcmUgdGFibGVzLgoKRXZl
biBtb3JlIHNvIGEgcmVhc29uIG5vdCB0byB1c2UgYmFuayAwJ3Mgc3RhcnQgYWRkcmVzcy4KCj4+
IEknbSBjb25mdXNlZCwgYW5kIGhlbmNlIEknbSBwZXJoYXBzIG1pc3VuZGVyc3RhbmRpbmcgeW91
cgo+PiBxdWVzdGlvbi4gVG8gbWUgaXQgbG9va3MgbGlrZSB5b3UncmUgcmUtYXNraW5nIGEgcXVl
c3Rpb24gYWxyZWFkeQo+PiBhbnN3ZXJlZC4gT24geDg2IHdlIGRvbid0IHdhbnQgdG8gc3F1YXNo
IG91dCBhbnkgb2YgdGhlIGxvdwo+PiAzMiBiaXRzLCBiZWNhdXNlIG9mIHRoZSBzcGVjaWFsIGFk
ZHJlc3MgcmFuZ2VzIHRoYXQgbGl2ZSBiZWxvdwo+PiA0R2IuIEhlbmNlIHdlIGludm9rZSBwZHhf
aW5pdF9tYXNrKGZpcnN0LWJsb2NrLWF0LW9yLWFib3ZlLTRHYikuCj4+IE5vdGUgaXQncyBub3Qg
c3RhcnQtb2YtcmFtLCBhcyB5b3UndmUgc2FpZC4KPiAKPiBJIHRoaW5rIHdoYXQgU3RlZmFubyBp
cyBhc2tpbmcgaXMgd2h5IHBkeF9pbml0X21hc2soLi4uKSBpcyBpbnZva2VkIHdpdGggCj4gdGhl
IGZpcnN0IGJsb2NrIGFkZHJlc3MgcmF0aGVyIHRoYW4gNEdCIChvciBldmVuIDAgdGhvdWdodCBJ
IGRvbid0IHRoaW5rIAo+IHRoaXMgaXMgcmlnaHQpLgo+IAo+IEJ5IHVzaW5nIHRoZSBmaXJzdCBi
bG9jayBhZGRyZXNzLCB0aGUgUERYIHdpbGwgbm90IGJlIGFibGUgdG8gY29tcHJlc3MgCj4gYW55
IGJpdHMgYmV0d2VlbiAwIGFuZCB0aGUgTVNCIDEnIGluIHRoZSBmaXJzdCBibG9jayBhZGRyZXNz
LiBJbiBvdGhlciAKPiB3b3JkLCBmb3IgYSBiYXNlIGFkZHJlc3MgMHgyMDAwMDAwMDAgKDhHQiks
IHRoZSBpbml0aWFsIG1hc2sgd2lsbCBiZSAKPiAweDFmZmZmZmZmZi4KPiAKPiBTdGVmYW5vIGFu
ZCBJIHdlcmUgd29uZGVyaW5nIHdoZXRoZXIgaXQgd291bGQgaW5zdGVhZCBiZSBwb3NzaWJsZSB0
byAKPiBjcmVhdGUgdGhlIGluaXRpYWwgbWFzayB3aXRoIHBkeF9pbml0X21hc2soNEdCKSBvciBw
ZHhfaW5pdF9tYXNrKDFHQikgCj4gKEkuZSB0aGUgbWF4aW11bSBjb250aWd1b3VzIHJhbmdlIHRo
ZSBidWRkeSBhbGxvY2F0b3IgY2FuIGFsbG9jYXRlKS4KClRoYXQncyBpbmRlZWQgYW4gb3B0aW9u
IC0gaXQncyBqdXN0IHRoYXQgSSd2ZSB5ZXQgdG8gc2VlIGFuIHg4NgpzeXN0ZW0gd2hlcmUgdGhl
cmUncyBhIGhvbGUgc3RhcnRpbmcgYXQgNEdiLiBXaGF0J3MgYmV0dGVyIGluIHRoYXQKY2FzZSBj
YW4gcHJvYmFibHkgYmUganVkZ2VkIG9ubHkgb25jZSBydW4gaW50byBzdWNoIGEgY2FzZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
