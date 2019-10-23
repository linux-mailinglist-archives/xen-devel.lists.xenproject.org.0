Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27695E1E15
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:26:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHXo-0000Ex-Nw; Wed, 23 Oct 2019 14:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNHXn-0000En-CK
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:23:23 +0000
X-Inumbo-ID: aa646a6e-f5a0-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa646a6e-f5a0-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 14:23:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCE0EAFE1;
 Wed, 23 Oct 2019 14:23:20 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
References: <20191023135644.46847-1-roger.pau@citrix.com>
 <46488d97-7416-624c-1af4-6a0201bd6711@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <db66881c-9e71-651b-ea51-72460392a583@suse.com>
Date: Wed, 23 Oct 2019 16:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <46488d97-7416-624c-1af4-6a0201bd6711@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/tsc: limit the usage of synchronization
 rendezvous
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTY6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjEwLjIwMTkgMTU6
NTYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4gSWYgWGVuIGRldGVjdHMgdGhlIFRTQyBpcyB1
bnJlbGlhYmxlIGl0IHdpbGwgc2V0IGEgcmVuZGV6dm91cyBoZWxwZXIKPj4gdGhhdCB0cmllcyB0
byBzeW5jaHJvbml6ZSB0aGUgZGlmZmVyZW50IENQVXMgVFNDIHZhbHVlIGJ5IHByb3BhZ2F0aW5n
Cj4+IHRoZSBvbmUgZnJvbSBDUFUjMCBhbmQgd3JpdGluZyBpdCBpbnRvIHRoZSBJQTMyX1RTQyBN
U1Igb24gZWFjaCBDUFUuCj4+Cj4+IFdoZW4gdGhlIHN5c3RlbSBoYXMgYSBzaW5nbGUgdGhyZWFk
IGFuZCB0aGVyZSBhcmUgbm8gaG90cGx1Z2FibGUgQ1BVcwo+PiBkb2luZyB0aGUgYWJvdmUganVz
dCByZXN1bHRzIGluIHJlYWRpbmcgdGhlIFRTQyBmcm9tIENQVSMwIGFuZCB3cml0aW5nCj4+IGl0
IGludG8gdGhlIElBMzJfVFNDIE1TUiBvZiBDUFUjMCwgd2hpY2ggaXMgcG9pbnRsZXNzLCBzbyBs
aW1pdCB0aGUKPj4gdXNhZ2Ugb2YgdGhlIHN5bmNocm9uaXphdGlvbiByZW5kZXp2b3VzIHRvIHN5
c3RlbXMgdGhhdCBoYXZlIG1vcmUgdGhhbgo+PiBvbmUgQ1BVLCBldmVuIGlmIHRob3NlIENQVXMg
YXJlIHlldCB0byBiZSBob3RwbHVnZ2VkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gLS0tCj4+IEknbSBub3Qgc3VyZSB3aGV0
aGVyIHRoaXMgaXMgc3VpdGFibGUgZm9yIDQuMTMsIGJlaW5nIGEgcGVyZm9ybWFuY2UKPj4gaW1w
cm92ZW1lbnQgYnV0IG5vdCBmaXhpbmcgYSBmdW5jdGlvbmFsIGJ1Zy4KPiAKPiBVbmxlc3Mgd2Ug
a25vdyB0aGVyZSdzIGEgbG90IG9mIHVzZSBvZiBYZW4gaW4gVVAgbW9kZSwgSSdkIHNheQo+IHJh
dGhlciBub3QuIF9JZl8gdGhlcmUgd2FzIGEgbG90IG9mIHN1Y2ggdXNlLCB0aGVuIEkgdGhpbmsg
d2UKPiBvdWdodCB0byBkbyBtb3JlIHdvcmsgdG93YXJkcyBwZXJmb3JtYW5jZSB0aGVyZSAobGlr
ZSByZS0KPiBpbnRyb2R1Y2luZyBTTVAgYWx0ZXJuYXRpdmVzIHBhdGNoaW5nKS4KCkkgYmVsaWV2
ZSB0aGUgbWFpbiB1c2UgY2FzZSBpcyBwdi1zaGltLgoKPiBPZiBjb3Vyc2UgaW4gdGhlIGVuZCB0
aGUgZGVjaXNpb24gaXMgdG8gYmUgdGFrZW4gYnkgSsO8cmdlbiwKPiB3aG9tIHlvdSBkaWRuJ3Qg
ZXZlbiBDYy4KCkknbSBpbmNsaW5lZCBub3QgdG8gUmVsZWFzZS1hY2sgaXQuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
