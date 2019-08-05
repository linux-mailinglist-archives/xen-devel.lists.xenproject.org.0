Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DD381F3A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:39:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hue5q-0001lH-4c; Mon, 05 Aug 2019 14:36:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9yWk=WB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hue5o-0001lC-9l
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:36:08 +0000
X-Inumbo-ID: 5a0ce0b4-b78e-11e9-bebc-f3427aee6573
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a0ce0b4-b78e-11e9-bebc-f3427aee6573;
 Mon, 05 Aug 2019 14:36:04 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nSSwta8WsscHyDC7LDyQBtUvFeVC3SReHAjAUkzCiNoYyis6NLxeakGyYHoZRzlUidJtSa3Y2b
 ocN9mTAOlthLs8DGCxniyvJN0bcskH2+tiDRH2uMvpxkefg77YeKvegCyZTY+Anf0XpCPs3w4g
 kZ66OoviLbSn0niSP/G3M9nDNFmTyIntDZENfBoEjzkeHMko1XtpQGvjdeYX+ZaqismMjzgOx4
 Rg9QOnvn4rmBp7s/oPHo3HY8SbZbEr1+8bWYz3kWNIKYB7q6gzmHp8zawsmvyVZ9C/5llF8Iyk
 /H8=
X-SBRS: 2.7
X-MesageID: 3993575
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3993575"
To: Jan Beulich <JBeulich@suse.com>
References: <5BFBBD7902000078001FFC9D@prv1-mh.provo.novell.com>
 <1b9eb9f8-1251-1c51-0a7b-4ba4811af205@citrix.com>
 <19e1f42b-04bb-bcf6-86ef-42685e5de263@suse.com>
 <f3ce014d-73c2-a86d-80d2-10f9d8aa34c0@citrix.com>
 <72580391-d34e-aaf9-2e41-ab1df5967408@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <0a8031c0-b668-eeb1-a9a2-659b52aaf98d@citrix.com>
Date: Mon, 5 Aug 2019 15:35:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <72580391-d34e-aaf9-2e41-ab1df5967408@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] CODING_STYLE: document intended usage of
 types
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC81LzE5IDI6MTkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA4LjIwMTkgMTU6
MDEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDgvNS8xOSAxMjo1NSBQTSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAwNS4wOC4yMDE5IDEyOjU4LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+
Pj4+IE9uIDExLzI2LzE4IDk6MzEgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiArRml4ZWQg
d2lkdGggdHlwZXMgc2hvdWxkIG9ubHkgYmUgdXNlZCB3aGVuIGEgZml4ZWQgd2lkdGggcXVhbnRp
dHkgaXMKPj4+Pj4gK21lYW50ICh3aGljaCBmb3IgZXhhbXBsZSBtYXkgYmUgYSB2YWx1ZSByZWFk
IGZyb20gb3IgdG8gYmUgd3JpdHRlbiB0byBhCj4+Pj4+ICtyZWdpc3RlcikuCj4+Pj4KPj4+PiBJ
J20gaGF2aW5nIHRyb3VibGUgdW5kZXJzdGFuZGluZyB0aGUgaW50ZW50IC8gaW1wbGljYXRpb25z
IG9mIHRoaXMgb25lLgo+Pj4+ICAgIENhbiB5b3UgZ2l2ZSBtZSBhbiBleGFtcGxlIG9mIHdoZXJl
IHlvdSd2ZSBzZWVuIGEgZml4ZWQgd2lkdGggdHlwZSB1c2VkCj4+Pj4gaW5hcHByb3ByaWF0ZWx5
Pwo+Pj4KPj4+IEdyZXAgdGhlIGNvZGUgYmFzZSBmb3IgInVpbnQzMl90IHNpemUiIGZvciBleGFt
cGxlLiBUaGVzZSBzaG91bGQKPj4+IChhbG1vc3Q/KSBhbGwgYmUgdW5zaWduZWQgaW50IChvciwg
d2hlcmUgbmVjZXNzYXJ5LCBzaXplX3QpLgo+Pgo+PiBJbnNpZGUgdGhlIGh5cGVydmlzb3IgY29k
ZWJhc2UgYW55d2F5LCBJIHNlZSB0aGVzZSBwYXR0ZXJucyBmb3IKPj4gYHVpbnQzMl90IHNpemVg
Ogo+Pgo+PiAxLiBJbnNpZGUgdHJhY2luZyBzdHJ1Y3R1cmVzLCB3aGVyZSB0aGUgY29kZSBtYXkg
YmUgdXNlZCBlaXRoZXIgYnkKPj4gMzItYml0IG9yIDY0LWJpdCB1c2Vyc3BhY2UgdG9vbHMKPiAK
PiBJIHNpbXBseSBhc3N1bWUgaW4gdGhlc2UgY2FzZXMgdXNlIG9mIGZpeGVkIHdpZHRoIHR5cGVz
IGlzCj4gaW50ZW5kZWQuCj4gCj4+IDIuIEluc2lkZSBoZWFkZXJzIGZvciBwdWJsaWMgaW50ZXJm
YWNlcyAoc2FtZSByZWFzb24pLgo+IAo+IEhlcmUgZml4ZWQgd2lkdGggdHlwZXMgYXJlIGRlZmlu
aXRlbHkgdGhlIHJpZ2h0IGNob2ljZS4KPiAKPj4gMy4gSW4gZnVuY3Rpb24gc2lnbmF0dXJlcyBm
b3IgZW11bGF0aW9uIGNvZGUuICBJIGFzc3VtZSB0aGlzIGlzIGJlY2F1c2UKPj4gc2l6ZXMgYXJl
IGFyY2hpdGVjdHVyYWxseSBkZWZpbmVkLgo+IAo+IFRha2luZyBudWxsX3JlYWQoKSBhcyBhbiBl
eGFtcGxlIC0gbm8sIHRoZXJlJ3Mgbm8gbmVlZCBmb3IgYSBmaXhlZAo+IHdpZHRoIHR5cGUgaGVy
ZS4gRXZlbiBpZiB0aGUgdmFsdWUgd2FzIHJlYWQgZnJvbSBhIHJlZ2lzdGVyLAo+IHByb3BhZ2F0
aW5nIHRoZSB2YWx1ZSBzdGlsbCBvbmx5IG5lZWRzIHRvIGd1YXJhbnRlZSBubyB0cnVuY2F0aW9u
Lgo+IEJ1dCB0aGUgdmFsdWUgY2FuJ3QgY29tZSBmcm9tIGEgcmVnaXN0ZXIgZGlyZWN0bHkgYW55
d2F5LCBvciBlbHNlCj4gdGhlIHR5cGUgd291bGQgbmVlZCB0byBiZSB1aW50NjRfdC4gVGhlIHR5
cGUgImFkZHIiIGlzIHdyb25nbHkKPiB1c2luZyB1aW50NjRfdCBoZXJlLCB0b28sIGluIG15IG9w
aW5pb246IEl0IHNob3VsZCBiZSB1bnNpZ25lZCBsb25nCj4gb3IgcGFkZHJfdCwgZGVwZW5kaW5n
IG9uIHdoZXRoZXIgd2UncmUgdGFsa2luZyBvZiBsaW5lYXIgb3IgcGh5c2ljYWwKPiBhZGRyZXNz
ZXMgKEkgdGhpbmsgaXQncyB0aGUgbGF0dGVyIGhlcmUpLgo+IAo+PiA0LiBJbnNpZGUgZGVjb21w
cmVzc2lvbiBjb2RlLCB0byBpbnRlcmZhY2Ugd2l0aCBwdWJsaWMgc2l6ZXMuCj4gCj4gSSBkb24n
dCB0aGluayB0aGVyZSdzIGFueSBpbnRlcmZhY2luZyB3aXRoICJwdWJsaWMiIHN0cnVjdHVyZXMK
PiB0aGVyZS4KPiAKPiA1LiBzeXNjdGxfY292X29wKCkgc2hvdWxkIGFnYWluIHVzZSB1bnNpZ25l
ZCBpbnQKPiA2LiBzdHJ1Y3QgZWxmX3N5bV9oZWFkZXIgdG9vIHNob3VsZCB1c2UgdW5zaWduZWQg
aW50Cj4gNy4gc3RydWN0IGh2bV9kb21haW5fY29udGV4dCBtYXkgd2FudCB0byBjb250aW51ZSB0
byB1c2UgdWludDhfdAo+ICAgICAoYWxiZWl0IHVuc2lnbmVkIGNoYXIgd291bGQgYmUgcXVpdGUg
ZmluZSBhcyB3ZWxsKSwgYnV0IGl0cwo+ICAgICB0d28gdWludDMyX3QgdXNlcyBjb3VsZCBvbmNl
IGFnYWluIGJlIHVuc2lnbmVkIGludAo+IGV0YwoKT0ssIHdlbGwgdGhpcyBnaXZlcyBtZSBhbiBp
ZGVhIHdoYXQgeW91IG1lYW4uICBJJ20gT0sgd2l0aCB0aGlzOyBidXQgaXQKd291bGQgcHJvYmFi
bHkgYmUgZ29vZCBpZiBvbmUgb2YgdGhlIEFSTSBndXlzIEFja2VkIGl0IGFzIHdlbGwuCgpBY2tl
ZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
