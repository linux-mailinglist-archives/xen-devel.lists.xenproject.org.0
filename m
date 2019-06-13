Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25C438C9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 17:08:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbRHh-0002ZM-Vn; Thu, 13 Jun 2019 15:05:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LEkp=UM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbRHg-0002ZH-45
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 15:05:00 +0000
X-Inumbo-ID: 9bf06bf8-8dec-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9bf06bf8-8dec-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 15:04:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57AD3AF25;
 Thu, 13 Jun 2019 15:04:57 +0000 (UTC)
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <alpine.DEB.2.21.1905281546410.16734@sstabellini-ThinkPad-T480s>
 <4cfc2555-8933-b036-7068-470c388a665f@oracle.com>
 <alpine.DEB.2.21.1906031124300.14041@sstabellini-ThinkPad-T480s>
 <25ba38d9-3b9a-a748-714a-25ed207ce090@oracle.com>
 <alpine.DEB.2.21.1906040949090.14041@sstabellini-ThinkPad-T480s>
 <4e4bef15-3e0a-c4a3-7b82-ddadb687e684@oracle.com>
 <20190605141354.GA16635@char.us.oracle.com>
 <9d5a5e02-842f-fd2e-1b85-dd8a68600704@suse.com>
 <20190613142345.GC456@char.us.oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e03d1101-3909-3109-c96c-77ab1bb047b9@suse.com>
Date: Thu, 13 Jun 2019 17:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613142345.GC456@char.us.oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/swiotlb: don't initialize swiotlb
 twice on arm64
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
Cc: Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien.Grall@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDYuMTkgMTY6MjMsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPiBPbiBXZWQs
IEp1biAwNSwgMjAxOSBhdCAwNDoyNDowNlBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
PiBPbiAwNS4wNi4xOSAxNjoxMywgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+Pj4gT24g
VHVlLCBKdW4gMDQsIDIwMTkgYXQgMDM6NDE6NDBQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdy
b3RlOgo+Pj4+IE9uIDYvNC8xOSAxMjo1MSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+
Pj4+PiBPbiBNb24sIDMgSnVuIDIwMTksIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4+Pj4+IE9u
IDYvMy8xOSAyOjI1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+Pj4gT24gVHVl
LCAyOCBNYXkgMjAxOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4+PiBPbiA1LzI4LzE5
IDY6NDggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4+Pj4+IEZyb206IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBP
biBhcm02NCBzd2lvdGxiIGlzIG9mdGVuIChub3QgYWx3YXlzKSBhbHJlYWR5IGluaXRpYWxpemVk
IGJ5IG1lbV9pbml0Lgo+Pj4+Pj4+Pj4gV2UgZG9uJ3Qgd2FudCB0byBpbml0aWFsaXplIGl0IHR3
aWNlLCB3aGljaCB3b3VsZCB0cmlnZ2VyIGEgc2Vjb25kCj4+Pj4+Pj4+PiBtZW1vcnkgYWxsb2Nh
dGlvbi4gTW9yZW92ZXIsIHRoZSBzZWNvbmQgbWVtb3J5IHBvb2wgaXMgdHlwaWNhbGx5IG1hZGUg
b2YKPj4+Pj4+Pj4+IGhpZ2ggcGFnZXMgYW5kIGVuZHMgdXAgcmVwbGFjaW5nIHRoZSBvcmlnaW5h
bCBtZW1vcnkgcG9vbCBvZiBsb3cgcGFnZXMuCj4+Pj4+Pj4+PiBBcyBhIHNpZGUgZWZmZWN0IG9m
IHRoaXMgY2hhbmdlLCBpdCBpcyBwb3NzaWJsZSB0byBoYXZlIGxvdyBwYWdlcyBpbgo+Pj4+Pj4+
Pj4gc3dpb3RsYi14ZW4gb24gYXJtNjQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+Pj4+Pj4+PiBIYXMg
dGhpcyBiZWVuIHRlc3RlZCBvbiB4ODY/Cj4+Pj4+Pj4gWWVzLCBJIG1hbmFnZWQgdG8gdGVzdCBp
dCB1c2luZyBRRU1VLiBUaGVyZSBhcmUgbm8gZWZmZWN0cyBvbiB4ODYsIGFzCj4+Pj4+Pj4gdGhl
IGNoZWNrIGlvX3RsYl9zdGFydCAhPSAwIHJldHVybnMgZmFsc2UuCj4+Pj4+PiBJIHdvbmRlciB0
aG91Z2ggd2hldGhlciB0aGlzIGlzIGFsd2F5cyB0aGUgY2FzZS7CoCBXaGVuIHdlIGFyZSBjYWxs
ZWQKPj4+Pj4+IGZyb20gcGNpX3hlbl9zd2lvdGxiX2luaXRfbGF0ZSgpIGZvciBleGFtcGxlLgo+
Pj4+PiBJbiB0aGF0IGNhc2UsIHBjaV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKSBpcyBjYWxsZWQg
YnkKPj4+Pj4gcGNpZnJvbnRfY29ubmVjdF9hbmRfaW5pdF9kbWEsIHdoaWNoIGRvZXM6Cj4+Pj4+
Cj4+Pj4+IAlpZiAoIWVyciAmJiAhc3dpb3RsYl9ucl90YmwoKSkgewo+Pj4+PiAJCWVyciA9IHBj
aV94ZW5fc3dpb3RsYl9pbml0X2xhdGUoKTsKPj4+Pj4gCQlpZiAoZXJyKQo+Pj4+PiAJCQlkZXZf
ZXJyKCZwZGV2LT54ZGV2LT5kZXYsICJDb3VsZCBub3Qgc2V0dXAgU1dJT1RMQiFcbiIpOwo+Pj4+
PiAJfQo+Pj4+Pgo+Pj4+PiBwY2lfeGVuX3N3aW90bGJfaW5pdF9sYXRlKCkgaXMgb25seSBjYWxs
ZWQgd2hlbiBzd2lvdGxiX25yX3RibCgpIHJldHVybnMKPj4+Pj4gMC4gSWYgc3dpb3RsYl9ucl90
YmwoKSByZXR1cm5zIDAsIGNlcnRhaW5seSB0aGUgc3dpb3RsYiBoYXMgbm90IGJlZW4KPj4+Pj4g
YWxsb2NhdGVkIHlldCwgYW5kIHRoZSBpb190bGJfc3RhcnQgIT0gMCBjaGVjayBhdCB0aGUgYmVn
aW5uaW5nIG9mCj4+Pj4+IHhlbl9zd2lvdGxiX2luaXQgd2lsbCBhbHNvIGZhaWwuIFRoZSBjb2Rl
IHdpbGwgdGFrZSB0aGUgbm9ybWFsCj4+Pj4+IHJvdXRlLCBzYW1lIGFzIHRvZGF5LiBJbiBzaG9y
dCwgdGhlcmUgc2hvdWxkIGJlIG5vIGVmZmVjdHMgb24geDg2Lgo+Pj4+Cj4+Pj4KPj4+PiBPSywg
dGhhbmtzLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0
cm92c2t5QG9yYWNsZS5jb20+Cj4+Pgo+Pj4gUHVzaGVkIGluIGRldmVsL2Zvci1saW51cy01LjIg
YW5kIHdpbGwgZXZlbnR1YWxseSBtb3ZlIGl0IHRvIHN0YWJsZSBhbmQgcHVzaCB0byBMaW51cyBu
ZXh0LXdlZWsuCj4+Pgo+Pj4gQXJlIHRoZXJlIGFueSBvdGhlciBwYXRjaGVzIEkgc2hvdWxkIHBp
Y2sgdXA/Cj4+Pgo+Pgo+PiBJIHRoaW5rIGF0IGxlYXN0IHRoZSBmaXJzdCB0d28gcGF0Y2hlcyBm
cm9tIG15IHNlcmllczoKPj4KPj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vMjAxOTA1MjkwOTA0
MDcuMTIyNS0xLWpncm9zc0BzdXNlLmNvbS8KPj4KPj4gYXJlIHJlYWR5IHRvIGdvIGluLgo+IAo+
ICMyIHBhdGNoIHNheXM6Cj4gCj4gCSI+IFRvIGJlIHN5bW1ldHJpYyB3aXRoIHNldHRpbmcgdGhl
IGZsYWcgb25seSBhZnRlciBoYXZpbmcgbWFkZSB0aGUgcmVnaW9uCj4gCT4gY29udGlndW91cywg
YW5kIHRvIGF2b2lkIChwZXJoYXBzIGp1c3QgdGhlb3JldGljYWwpIHJhY2VzLCB3b3VsZG4ndCBp
dCBiZQo+IAk+IGJldHRlciB0byBjbGVhciB0aGUgZmxhZyBiZWZvcmUgY2FsbGluZyB4ZW5fZGVz
dHJveV9jb250aWd1b3VzX3JlZ2lvbigpPwo+IAk+IEV2ZW4gYmV0dGVyIHdvdWxkIGJlIGEgVGVz
dEFuZENsZWFyLi4uKCkgb3BlcmF0aW9uLgo+IAo+IAlJIGxpa2UgdGhhdCBpZGVhLgo+ICIKPiA/
CgpJIHdhcyBob3BpbmcgZm9yIGEgY2xhcmlmaWNhdGlvbiByZWdhcmRpbmcgdGhlIFhlbiBzcGVj
aWZpYyBwYWdlIGZsYWcKbmFtZXMgYmVmb3JlIHBvc3RpbmcgVjMuCgpBcyBDaHJpc3RvcGggZGlk
bid0IHJlYWN0IHdoZW4gSSBwb3N0ZWQgcG9zc2libGUgc29sdXRpb25zIEkgdGhpbmsgSSdsbApq
dXN0IG1vZGlmeSBwYXRjaCAzIGFjY29yZGluZyB0byBKYW4ncyBjb21tZW50IGFuZCBwb3N0IFYz
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
