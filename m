Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010DDBDEC8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:18:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD79q-0000dF-GR; Wed, 25 Sep 2019 13:16:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD79o-0000d7-OX
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:16:36 +0000
X-Inumbo-ID: b3193a56-df96-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b3193a56-df96-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 13:16:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2DDEBAF77;
 Wed, 25 Sep 2019 13:16:35 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-37-jgross@suse.com>
 <c0f32c90-843a-c5c0-66ff-fe3d5ff879ae@suse.com>
 <a790d1ec-c2f4-f964-d18f-50dfe9acde69@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d23fd6a3-9d37-90eb-3837-6fed5a1189ad@suse.com>
Date: Wed, 25 Sep 2019 15:16:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a790d1ec-c2f4-f964-d18f-50dfe9acde69@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 36/47] xen/sched: carve out freeing
 sched_unit memory into dedicated function
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNTowOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNC4wOS4xOSAx
NDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gQEAgLTM1MSwyNiArMzUxLDEwIEBAIHN0YXRpYyB2b2lk
IHNjaGVkX3NwaW5fdW5sb2NrX2RvdWJsZShzcGlubG9ja190ICpsb2NrMSwgc3BpbmxvY2tfdCAq
bG9jazIsCj4+PiAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKGxvY2sxLCBmbGFncyk7Cj4+
PiAgIH0KPj4+ICAgCj4+PiAtc3RhdGljIHZvaWQgc2NoZWRfZnJlZV91bml0KHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0LCBzdHJ1Y3QgdmNwdSAqdikKPj4+ICtzdGF0aWMgdm9pZCBzY2hlZF9mcmVl
X3VuaXRfbWVtKHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+Pj4gICB7Cj4+PiAgICAgICBzdHJ1
Y3Qgc2NoZWRfdW5pdCAqcHJldl91bml0Owo+Pj4gICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHVu
aXQtPmRvbWFpbjsKPj4+IC0gICAgc3RydWN0IHZjcHUgKnZ1bml0Owo+Pj4gLSAgICB1bnNpZ25l
ZCBpbnQgY250ID0gMDsKPj4+IC0KPj4+IC0gICAgLyogRG9uJ3QgY291bnQgdG8gYmUgcmVsZWFz
ZWQgdmNwdSwgbWlnaHQgYmUgbm90IGluIHZjcHUgbGlzdCB5ZXQuICovCj4+PiAtICAgIGZvcl9l
YWNoX3NjaGVkX3VuaXRfdmNwdSAoIHVuaXQsIHZ1bml0ICkKPj4+IC0gICAgICAgIGlmICggdnVu
aXQgIT0gdiApCj4+PiAtICAgICAgICAgICAgY250Kys7Cj4+PiAtCj4+PiAtICAgIHYtPnNjaGVk
X3VuaXQgPSBOVUxMOwo+Pj4gLSAgICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3Rh
dGVdLS07Cj4+PiAtCj4+PiAtICAgIGlmICggY250ICkKPj4+IC0gICAgICAgIHJldHVybjsKPj4+
IC0KPj4+IC0gICAgaWYgKCB1bml0LT52Y3B1X2xpc3QgPT0gdiApCj4+PiAtICAgICAgICB1bml0
LT52Y3B1X2xpc3QgPSB2LT5uZXh0X2luX2xpc3Q7Cj4+PiAgIAo+Pj4gICAgICAgaWYgKCBkLT5z
Y2hlZF91bml0X2xpc3QgPT0gdW5pdCApCj4+PiAgICAgICAgICAgZC0+c2NoZWRfdW5pdF9saXN0
ID0gdW5pdC0+bmV4dF9pbl9saXN0Owo+Pj4gQEAgLTM5Myw2ICszNzcsMjYgQEAgc3RhdGljIHZv
aWQgc2NoZWRfZnJlZV91bml0KHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCBzdHJ1Y3QgdmNwdSAq
dikKPj4+ICAgICAgIHhmcmVlKHVuaXQpOwo+Pj4gICB9Cj4+PiAgIAo+Pj4gK3N0YXRpYyB2b2lk
IHNjaGVkX2ZyZWVfdW5pdChzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgc3RydWN0IHZjcHUgKnYp
Cj4+PiArewo+Pj4gKyAgICBzdHJ1Y3QgdmNwdSAqdnVuaXQ7Cj4+PiArICAgIHVuc2lnbmVkIGlu
dCBjbnQgPSAwOwo+Pj4gKwo+Pj4gKyAgICAvKiBEb24ndCBjb3VudCB0byBiZSByZWxlYXNlZCB2
Y3B1LCBtaWdodCBiZSBub3QgaW4gdmNwdSBsaXN0IHlldC4gKi8KPj4+ICsgICAgZm9yX2VhY2hf
c2NoZWRfdW5pdF92Y3B1ICggdW5pdCwgdnVuaXQgKQo+Pj4gKyAgICAgICAgaWYgKCB2dW5pdCAh
PSB2ICkKPj4+ICsgICAgICAgICAgICBjbnQrKzsKPj4+ICsKPj4+ICsgICAgdi0+c2NoZWRfdW5p
dCA9IE5VTEw7Cj4+PiArICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0t
LTsKPj4+ICsKPj4+ICsgICAgaWYgKCB1bml0LT52Y3B1X2xpc3QgPT0gdiApCj4+PiArICAgICAg
ICB1bml0LT52Y3B1X2xpc3QgPSB2LT5uZXh0X2luX2xpc3Q7Cj4+PiArCj4+PiArICAgIGlmICgg
IWNudCApCj4+PiArICAgICAgICBzY2hlZF9mcmVlX3VuaXRfbWVtKHVuaXQpOwo+Pj4gK30KPj4K
Pj4gVGhlIGVudGlyZSBzY2hlZF9mcmVlX3VuaXQoKSBpcyBuZXcgY29kZSAoc3RhcnRpbmcgZnJv
bSBwYXRjaCAzKSAtIHdoeQo+PiBkb24ndCB5b3UgYXJyYW5nZSBmb3IgdGhlIHNwbGl0IHJpZ2h0
IGF3YXksIGluc3RlYWQgb2YgbW92aW5nIGNvZGUKPj4gYXJvdW5kIGhlcmU/Cj4gCj4gSSB3YW50
ZWQgdG8gaW50cm9kdWNlIG5ldyBzdWJmdW5jdGlvbnMgb25seSB3aGVuIHRoZXkgYXJlIHJlYWxs
eSBuZWVkZWQuCgpUaGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhpcyBpcyBpbmRlZWQgdGhlIGJldHRl
ciBhcHByb2FjaDsgcGVyaGFwcwp0aGF0IGV2ZW4gdGhlIHR5cGljYWwgY2FzZS4gQnV0IGhlcmUg
eW91IHNwZW5kIGFuIGVudGlyZSBwYXRjaCBvbgpyZS1kb2luZyB3aGF0IHlvdSd2ZSBkb25lIGJl
Zm9yZS4gU28gLi4uCgo+IEkgY2FuIG1lcmdlIHRoaXMgcGF0Y2ggaW50byBwYXRjaCAzIGlmIHlv
dSBsaWtlIHRoYXQgYmV0dGVyLgoKLi4uIHllcywgcGVyc29uYWxseSBJJ2QgcHJlZmVyIHRoaXMs
IGJ1dCBpbiB0aGUgZW5kIGl0J3MgdGhlIGNhbGwKb2YgdGhlIHNjaGVkdWxlciBtYWludGFpbmVy
cy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
