Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80C1142B
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 09:32:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM6BJ-0003o3-Aj; Thu, 02 May 2019 07:31:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM6BH-0003nx-IG
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 07:30:59 +0000
X-Inumbo-ID: 386fddb2-6cac-11e9-8192-3f9d3422112b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 386fddb2-6cac-11e9-8192-3f9d3422112b;
 Thu, 02 May 2019 07:30:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 01:30:54 -0600
Message-Id: <5CCA9CAC020000780022B058@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 01:30:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
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
In-Reply-To: <alpine.DEB.2.10.1905011536510.23881@sstabellini-ThinkPad-X260>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>,
 nd@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDAwOjQ0LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gSGkgSmFuLCBJIGhhdmUgYSBxdWVzdGlvbiBvbiB0aGUgUERYIGNvZGUuCj4gCj4gVGhlIFBE
WCBpbml0aWFsaXphdGlvbiBpcyBhIGJpdCBkaWZmZXJlbnQgYmV0d2VlbiB4ODYgYW5kIEFSTSwg
YnV0IGl0Cj4gZm9sbG93cyByb3VnaGx5IHRoZSBzYW1lIHBhdHRlcm4sIGxvb2sgYXQKPiB4ZW4v
YXJjaC94ODYvc3JhdC5jOnNyYXRfcGFyc2VfcmVnaW9ucyAoSSB0YWtlIHRoYXQgaXMgd2hlcmUg
dGhpbmdzCj4gaGFwcGVuIG9uIHg4NikgYW5kIHhlbi9hcmNoL2FybS9zZXR1cC5jOmluaXRfcGR4
Lgo+IAo+IE1hc2sgaXMgaW5pdGlhbGl6ZWQgY2FsbGluZyBwZHhfaW5pdF9tYXNrIG9uIGEgc3Rh
cnQgYWRkcmVzcywgdGhlbiBhCj4gbG9vcCBmaWxscyBpbiB0aGUgcmVzdCBvZiB0aGUgbWFzayBj
YWxsaW5nIHBkeF9yZWdpb25fbWFzaywgYmFzZWQgb24gdGhlCj4gbWVtb3J5IHJlZ2lvbnMgcHJl
c2VudC4KPiAKPiBJIHdyb3RlIGEgc21hbGwgdW5pdCB0ZXN0IG9mIHRoZSBBUk0gUERYIGluaXRp
YWxpemF0aW9uIGFuZCB3aGlsZSBJIHdhcwo+IHBsYXlpbmcgd2l0aCBhZGRyZXNzZXMgYW5kIHZh
bHVlcyBJIG5vdGljZWQgdGhhdCBhY3R1YWxseSBpZiBJIHNpbXBseQo+IHNraXAgcGR4X2luaXRf
bWFzayBhbmQganVzdCBpbml0aWFsaXplIHRoZSBtYXNrIHRvIDAgKG1hc2sgPSAwKSBpbgo+IGlu
aXRfcGR4LCB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24gYWx3YXlzIGNhbGN1bGF0ZXMgdGhlIHJp
Z2h0IG1hc2suCj4gCj4gSW4gZmFjdCwgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIGluaXRpYWxpemlu
ZyB0aGUgbWFzayB0byBhIHZhbHVlIGNhdXNlcwo+IHRoZSByZXN0IG9mIHRoZSBjb2RlIHRvIG1p
c3Mgc29tZSBwb3RlbnRpYWwgY29tcHJlc3Npb25zLiBXaGlsZQo+IGluaXRpYWxpemluZyB0aGUg
bWFzayB0byAwIGxlYWRzIHRvIG1vcmUgb3B0aW1pemF0aW9ucy4gSSBjYW4gcHJvdmlkZQo+IHNw
ZWNpZmljIGV4YW1wbGVzIGlmIHlvdSBhcmUgY3VyaW91cy4KPiAKPiBCZWZvcmUgSSBtYWtlIGFu
eSBjaGFuZ2VzIHRvIHRoYXQgY29kZSwgSSB3b3VsZCBsaWtlIHRvIHVuZGVyc3RhbmQgYSBiaXQK
PiBiZXR0ZXIgd2h5IHRoaW5ncyBhcmUgZG9uZSB0aGF0IHdheSB0b2RheS4gRG8geW91IGtub3cg
d2h5IHRoZSBtYXNrIGlzCj4gaW5pdGlhbGl6ZWQgdG8gcGR4X2luaXRfbWFzayhzdGFydC1vZi1y
YW0pPwoKSSdtIGNvbmZ1c2VkLCBhbmQgaGVuY2UgSSdtIHBlcmhhcHMgbWlzdW5kZXJzdGFuZGlu
ZyB5b3VyCnF1ZXN0aW9uLiBUbyBtZSBpdCBsb29rcyBsaWtlIHlvdSdyZSByZS1hc2tpbmcgYSBx
dWVzdGlvbiBhbHJlYWR5CmFuc3dlcmVkLiBPbiB4ODYgd2UgZG9uJ3Qgd2FudCB0byBzcXVhc2gg
b3V0IGFueSBvZiB0aGUgbG93CjMyIGJpdHMsIGJlY2F1c2Ugb2YgdGhlIHNwZWNpYWwgYWRkcmVz
cyByYW5nZXMgdGhhdCBsaXZlIGJlbG93CjRHYi4gSGVuY2Ugd2UgaW52b2tlIHBkeF9pbml0X21h
c2soZmlyc3QtYmxvY2stYXQtb3ItYWJvdmUtNEdiKS4KTm90ZSBpdCdzIG5vdCBzdGFydC1vZi1y
YW0sIGFzIHlvdSd2ZSBzYWlkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
