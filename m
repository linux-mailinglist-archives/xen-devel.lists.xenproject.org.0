Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B12BDEA0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD72t-0007ww-I8; Wed, 25 Sep 2019 13:09:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD72s-0007wq-Gt
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:09:26 +0000
X-Inumbo-ID: b2a04354-df95-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b2a04354-df95-11e9-b588-bc764e2007e4;
 Wed, 25 Sep 2019 13:09:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCE40ABC6;
 Wed, 25 Sep 2019 13:09:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-37-jgross@suse.com>
 <c0f32c90-843a-c5c0-66ff-fe3d5ff879ae@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a790d1ec-c2f4-f964-d18f-50dfe9acde69@suse.com>
Date: Wed, 25 Sep 2019 15:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c0f32c90-843a-c5c0-66ff-fe3d5ff879ae@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTQ6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTM1MSwyNiArMzUxLDEwIEBAIHN0
YXRpYyB2b2lkIHNjaGVkX3NwaW5fdW5sb2NrX2RvdWJsZShzcGlubG9ja190ICpsb2NrMSwgc3Bp
bmxvY2tfdCAqbG9jazIsCj4+ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUobG9jazEsIGZs
YWdzKTsKPj4gICB9Cj4+ICAgCj4+IC1zdGF0aWMgdm9pZCBzY2hlZF9mcmVlX3VuaXQoc3RydWN0
IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQo+PiArc3RhdGljIHZvaWQgc2NoZWRf
ZnJlZV91bml0X21lbShzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPj4gICB7Cj4+ICAgICAgIHN0
cnVjdCBzY2hlZF91bml0ICpwcmV2X3VuaXQ7Cj4+ICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB1
bml0LT5kb21haW47Cj4+IC0gICAgc3RydWN0IHZjcHUgKnZ1bml0Owo+PiAtICAgIHVuc2lnbmVk
IGludCBjbnQgPSAwOwo+PiAtCj4+IC0gICAgLyogRG9uJ3QgY291bnQgdG8gYmUgcmVsZWFzZWQg
dmNwdSwgbWlnaHQgYmUgbm90IGluIHZjcHUgbGlzdCB5ZXQuICovCj4+IC0gICAgZm9yX2VhY2hf
c2NoZWRfdW5pdF92Y3B1ICggdW5pdCwgdnVuaXQgKQo+PiAtICAgICAgICBpZiAoIHZ1bml0ICE9
IHYgKQo+PiAtICAgICAgICAgICAgY250Kys7Cj4+IC0KPj4gLSAgICB2LT5zY2hlZF91bml0ID0g
TlVMTDsKPj4gLSAgICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3RhdGVdLS07Cj4+
IC0KPj4gLSAgICBpZiAoIGNudCApCj4+IC0gICAgICAgIHJldHVybjsKPj4gLQo+PiAtICAgIGlm
ICggdW5pdC0+dmNwdV9saXN0ID09IHYgKQo+PiAtICAgICAgICB1bml0LT52Y3B1X2xpc3QgPSB2
LT5uZXh0X2luX2xpc3Q7Cj4+ICAgCj4+ICAgICAgIGlmICggZC0+c2NoZWRfdW5pdF9saXN0ID09
IHVuaXQgKQo+PiAgICAgICAgICAgZC0+c2NoZWRfdW5pdF9saXN0ID0gdW5pdC0+bmV4dF9pbl9s
aXN0Owo+PiBAQCAtMzkzLDYgKzM3NywyNiBAQCBzdGF0aWMgdm9pZCBzY2hlZF9mcmVlX3VuaXQo
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQo+PiAgICAgICB4ZnJlZSh1
bml0KTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgdm9pZCBzY2hlZF9mcmVlX3VuaXQoc3RydWN0
IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQo+PiArewo+PiArICAgIHN0cnVjdCB2
Y3B1ICp2dW5pdDsKPj4gKyAgICB1bnNpZ25lZCBpbnQgY250ID0gMDsKPj4gKwo+PiArICAgIC8q
IERvbid0IGNvdW50IHRvIGJlIHJlbGVhc2VkIHZjcHUsIG1pZ2h0IGJlIG5vdCBpbiB2Y3B1IGxp
c3QgeWV0LiAqLwo+PiArICAgIGZvcl9lYWNoX3NjaGVkX3VuaXRfdmNwdSAoIHVuaXQsIHZ1bml0
ICkKPj4gKyAgICAgICAgaWYgKCB2dW5pdCAhPSB2ICkKPj4gKyAgICAgICAgICAgIGNudCsrOwo+
PiArCj4+ICsgICAgdi0+c2NoZWRfdW5pdCA9IE5VTEw7Cj4+ICsgICAgdW5pdC0+cnVuc3RhdGVf
Y250W3YtPnJ1bnN0YXRlLnN0YXRlXS0tOwo+PiArCj4+ICsgICAgaWYgKCB1bml0LT52Y3B1X2xp
c3QgPT0gdiApCj4+ICsgICAgICAgIHVuaXQtPnZjcHVfbGlzdCA9IHYtPm5leHRfaW5fbGlzdDsK
Pj4gKwo+PiArICAgIGlmICggIWNudCApCj4+ICsgICAgICAgIHNjaGVkX2ZyZWVfdW5pdF9tZW0o
dW5pdCk7Cj4+ICt9Cj4gCj4gVGhlIGVudGlyZSBzY2hlZF9mcmVlX3VuaXQoKSBpcyBuZXcgY29k
ZSAoc3RhcnRpbmcgZnJvbSBwYXRjaCAzKSAtIHdoeQo+IGRvbid0IHlvdSBhcnJhbmdlIGZvciB0
aGUgc3BsaXQgcmlnaHQgYXdheSwgaW5zdGVhZCBvZiBtb3ZpbmcgY29kZQo+IGFyb3VuZCBoZXJl
PwoKSSB3YW50ZWQgdG8gaW50cm9kdWNlIG5ldyBzdWJmdW5jdGlvbnMgb25seSB3aGVuIHRoZXkg
YXJlIHJlYWxseSBuZWVkZWQuCkkgY2FuIG1lcmdlIHRoaXMgcGF0Y2ggaW50byBwYXRjaCAzIGlm
IHlvdSBsaWtlIHRoYXQgYmV0dGVyLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
