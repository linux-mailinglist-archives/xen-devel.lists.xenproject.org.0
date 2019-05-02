Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64FB115EF
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 11:04:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7bg-0004GA-Kp; Thu, 02 May 2019 09:02:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JzUk=TC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hM7bf-0004G5-4O
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 09:02:19 +0000
X-Inumbo-ID: fc5c61bf-6cb8-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id fc5c61bf-6cb8-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 09:02:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36694374;
 Thu,  2 May 2019 02:02:17 -0700 (PDT)
Received: from [10.37.8.26] (unknown [10.37.8.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C427E3F5AF;
 Thu,  2 May 2019 02:02:14 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1f9effdd-e920-bf07-d9e1-1b126a409fc0@arm.com>
Date: Thu, 2 May 2019 10:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCA9CAC020000780022B058@prv1-mh.provo.novell.com>
Content-Language: en-US
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefanos@xilinx.com>, nd@arm.com,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNS8yLzE5IDg6MzAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAy
LjA1LjE5IGF0IDAwOjQ0LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IEhpIEph
biwgSSBoYXZlIGEgcXVlc3Rpb24gb24gdGhlIFBEWCBjb2RlLgo+Pgo+PiBUaGUgUERYIGluaXRp
YWxpemF0aW9uIGlzIGEgYml0IGRpZmZlcmVudCBiZXR3ZWVuIHg4NiBhbmQgQVJNLCBidXQgaXQK
Pj4gZm9sbG93cyByb3VnaGx5IHRoZSBzYW1lIHBhdHRlcm4sIGxvb2sgYXQKPj4geGVuL2FyY2gv
eDg2L3NyYXQuYzpzcmF0X3BhcnNlX3JlZ2lvbnMgKEkgdGFrZSB0aGF0IGlzIHdoZXJlIHRoaW5n
cwo+PiBoYXBwZW4gb24geDg2KSBhbmQgeGVuL2FyY2gvYXJtL3NldHVwLmM6aW5pdF9wZHguCj4+
Cj4+IE1hc2sgaXMgaW5pdGlhbGl6ZWQgY2FsbGluZyBwZHhfaW5pdF9tYXNrIG9uIGEgc3RhcnQg
YWRkcmVzcywgdGhlbiBhCj4+IGxvb3AgZmlsbHMgaW4gdGhlIHJlc3Qgb2YgdGhlIG1hc2sgY2Fs
bGluZyBwZHhfcmVnaW9uX21hc2ssIGJhc2VkIG9uIHRoZQo+PiBtZW1vcnkgcmVnaW9ucyBwcmVz
ZW50Lgo+Pgo+PiBJIHdyb3RlIGEgc21hbGwgdW5pdCB0ZXN0IG9mIHRoZSBBUk0gUERYIGluaXRp
YWxpemF0aW9uIGFuZCB3aGlsZSBJIHdhcwo+PiBwbGF5aW5nIHdpdGggYWRkcmVzc2VzIGFuZCB2
YWx1ZXMgSSBub3RpY2VkIHRoYXQgYWN0dWFsbHkgaWYgSSBzaW1wbHkKPj4gc2tpcCBwZHhfaW5p
dF9tYXNrIGFuZCBqdXN0IGluaXRpYWxpemUgdGhlIG1hc2sgdG8gMCAobWFzayA9IDApIGluCj4+
IGluaXRfcGR4LCB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24gYWx3YXlzIGNhbGN1bGF0ZXMgdGhl
IHJpZ2h0IG1hc2suCj4+Cj4+IEluIGZhY3QsIHRoZXJlIGFyZSBjYXNlcyB3aGVyZSBpbml0aWFs
aXppbmcgdGhlIG1hc2sgdG8gYSB2YWx1ZSBjYXVzZXMKPj4gdGhlIHJlc3Qgb2YgdGhlIGNvZGUg
dG8gbWlzcyBzb21lIHBvdGVudGlhbCBjb21wcmVzc2lvbnMuIFdoaWxlCj4+IGluaXRpYWxpemlu
ZyB0aGUgbWFzayB0byAwIGxlYWRzIHRvIG1vcmUgb3B0aW1pemF0aW9ucy4gSSBjYW4gcHJvdmlk
ZQo+PiBzcGVjaWZpYyBleGFtcGxlcyBpZiB5b3UgYXJlIGN1cmlvdXMuCj4+Cj4+IEJlZm9yZSBJ
IG1ha2UgYW55IGNoYW5nZXMgdG8gdGhhdCBjb2RlLCBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFu
ZCBhIGJpdAo+PiBiZXR0ZXIgd2h5IHRoaW5ncyBhcmUgZG9uZSB0aGF0IHdheSB0b2RheS4gRG8g
eW91IGtub3cgd2h5IHRoZSBtYXNrIGlzCj4+IGluaXRpYWxpemVkIHRvIHBkeF9pbml0X21hc2so
c3RhcnQtb2YtcmFtKT8KCldlbGwsIGl0IGlzIG5vdCB0aGUgc3RhcnQtb2YtcmFtIG9uIEFybS4g
SXQgaXMgd2hhdGV2ZXIgaXMgdGhlIHN0YXJ0IG9mIApiYW5rIDAuIFRoaXMgaXMgYmVjYXVzZSB0
aGUgZmlybXdhcmUgdGFibGUgKHN1Y2ggYXMgRFQpIG1heSBub3QgcmVxdWlyZSAKb3JkZXJpbmcg
YW5kIHdlIGRvbid0IG9yZGVyIGJhbmtzIGluIFhlbi4KClNvIGl0IG1heSBiZSBwb3NzaWJsZSB0
aGUgUERYIHdpbGwgbm90IGNvbXByZXNzIGlmIHRoZSBiYW5rcyBhcmUgbm90IApvcmRlcmVkIGlu
IHRoZSBmaXJtd2FyZSB0YWJsZXMuCgo+IAo+IEknbSBjb25mdXNlZCwgYW5kIGhlbmNlIEknbSBw
ZXJoYXBzIG1pc3VuZGVyc3RhbmRpbmcgeW91cgo+IHF1ZXN0aW9uLiBUbyBtZSBpdCBsb29rcyBs
aWtlIHlvdSdyZSByZS1hc2tpbmcgYSBxdWVzdGlvbiBhbHJlYWR5Cj4gYW5zd2VyZWQuIE9uIHg4
NiB3ZSBkb24ndCB3YW50IHRvIHNxdWFzaCBvdXQgYW55IG9mIHRoZSBsb3cKPiAzMiBiaXRzLCBi
ZWNhdXNlIG9mIHRoZSBzcGVjaWFsIGFkZHJlc3MgcmFuZ2VzIHRoYXQgbGl2ZSBiZWxvdwo+IDRH
Yi4gSGVuY2Ugd2UgaW52b2tlIHBkeF9pbml0X21hc2soZmlyc3QtYmxvY2stYXQtb3ItYWJvdmUt
NEdiKS4KPiBOb3RlIGl0J3Mgbm90IHN0YXJ0LW9mLXJhbSwgYXMgeW91J3ZlIHNhaWQuCgpJIHRo
aW5rIHdoYXQgU3RlZmFubyBpcyBhc2tpbmcgaXMgd2h5IHBkeF9pbml0X21hc2soLi4uKSBpcyBp
bnZva2VkIHdpdGggCnRoZSBmaXJzdCBibG9jayBhZGRyZXNzIHJhdGhlciB0aGFuIDRHQiAob3Ig
ZXZlbiAwIHRob3VnaHQgSSBkb24ndCB0aGluayAKdGhpcyBpcyByaWdodCkuCgpCeSB1c2luZyB0
aGUgZmlyc3QgYmxvY2sgYWRkcmVzcywgdGhlIFBEWCB3aWxsIG5vdCBiZSBhYmxlIHRvIGNvbXBy
ZXNzIAphbnkgYml0cyBiZXR3ZWVuIDAgYW5kIHRoZSBNU0IgMScgaW4gdGhlIGZpcnN0IGJsb2Nr
IGFkZHJlc3MuIEluIG90aGVyIAp3b3JkLCBmb3IgYSBiYXNlIGFkZHJlc3MgMHgyMDAwMDAwMDAg
KDhHQiksIHRoZSBpbml0aWFsIG1hc2sgd2lsbCBiZSAKMHgxZmZmZmZmZmYuCgpTdGVmYW5vIGFu
ZCBJIHdlcmUgd29uZGVyaW5nIHdoZXRoZXIgaXQgd291bGQgaW5zdGVhZCBiZSBwb3NzaWJsZSB0
byAKY3JlYXRlIHRoZSBpbml0aWFsIG1hc2sgd2l0aCBwZHhfaW5pdF9tYXNrKDRHQikgb3IgcGR4
X2luaXRfbWFzaygxR0IpIAooSS5lIHRoZSBtYXhpbXVtIGNvbnRpZ3VvdXMgcmFuZ2UgdGhlIGJ1
ZGR5IGFsbG9jYXRvciBjYW4gYWxsb2NhdGUpLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
