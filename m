Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF08BC78B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:07:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjYr-0002aP-V3; Tue, 24 Sep 2019 12:04:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCjYr-0002aK-0E
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:04:53 +0000
X-Inumbo-ID: 836769b4-dec3-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 836769b4-dec3-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 12:04:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AB99AECB;
 Tue, 24 Sep 2019 12:04:51 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-37-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0f32c90-843a-c5c0-66ff-fe3d5ff879ae@suse.com>
Date: Tue, 24 Sep 2019 14:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-37-jgross@suse.com>
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

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtMzUxLDI2
ICszNTEsMTAgQEAgc3RhdGljIHZvaWQgc2NoZWRfc3Bpbl91bmxvY2tfZG91YmxlKHNwaW5sb2Nr
X3QgKmxvY2sxLCBzcGlubG9ja190ICpsb2NrMiwKPiAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUobG9jazEsIGZsYWdzKTsKPiAgfQo+ICAKPiAtc3RhdGljIHZvaWQgc2NoZWRfZnJlZV91bml0
KHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCBzdHJ1Y3QgdmNwdSAqdikKPiArc3RhdGljIHZvaWQg
c2NoZWRfZnJlZV91bml0X21lbShzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPiAgewo+ICAgICAg
c3RydWN0IHNjaGVkX3VuaXQgKnByZXZfdW5pdDsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB1
bml0LT5kb21haW47Cj4gLSAgICBzdHJ1Y3QgdmNwdSAqdnVuaXQ7Cj4gLSAgICB1bnNpZ25lZCBp
bnQgY250ID0gMDsKPiAtCj4gLSAgICAvKiBEb24ndCBjb3VudCB0byBiZSByZWxlYXNlZCB2Y3B1
LCBtaWdodCBiZSBub3QgaW4gdmNwdSBsaXN0IHlldC4gKi8KPiAtICAgIGZvcl9lYWNoX3NjaGVk
X3VuaXRfdmNwdSAoIHVuaXQsIHZ1bml0ICkKPiAtICAgICAgICBpZiAoIHZ1bml0ICE9IHYgKQo+
IC0gICAgICAgICAgICBjbnQrKzsKPiAtCj4gLSAgICB2LT5zY2hlZF91bml0ID0gTlVMTDsKPiAt
ICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0tLTsKPiAtCj4gLSAgICBp
ZiAoIGNudCApCj4gLSAgICAgICAgcmV0dXJuOwo+IC0KPiAtICAgIGlmICggdW5pdC0+dmNwdV9s
aXN0ID09IHYgKQo+IC0gICAgICAgIHVuaXQtPnZjcHVfbGlzdCA9IHYtPm5leHRfaW5fbGlzdDsK
PiAgCj4gICAgICBpZiAoIGQtPnNjaGVkX3VuaXRfbGlzdCA9PSB1bml0ICkKPiAgICAgICAgICBk
LT5zY2hlZF91bml0X2xpc3QgPSB1bml0LT5uZXh0X2luX2xpc3Q7Cj4gQEAgLTM5Myw2ICszNzcs
MjYgQEAgc3RhdGljIHZvaWQgc2NoZWRfZnJlZV91bml0KHN0cnVjdCBzY2hlZF91bml0ICp1bml0
LCBzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIHhmcmVlKHVuaXQpOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
dm9pZCBzY2hlZF9mcmVlX3VuaXQoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1
ICp2KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdmNwdSAqdnVuaXQ7Cj4gKyAgICB1bnNpZ25lZCBpbnQg
Y250ID0gMDsKPiArCj4gKyAgICAvKiBEb24ndCBjb3VudCB0byBiZSByZWxlYXNlZCB2Y3B1LCBt
aWdodCBiZSBub3QgaW4gdmNwdSBsaXN0IHlldC4gKi8KPiArICAgIGZvcl9lYWNoX3NjaGVkX3Vu
aXRfdmNwdSAoIHVuaXQsIHZ1bml0ICkKPiArICAgICAgICBpZiAoIHZ1bml0ICE9IHYgKQo+ICsg
ICAgICAgICAgICBjbnQrKzsKPiArCj4gKyAgICB2LT5zY2hlZF91bml0ID0gTlVMTDsKPiArICAg
IHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0tLTsKPiArCj4gKyAgICBpZiAo
IHVuaXQtPnZjcHVfbGlzdCA9PSB2ICkKPiArICAgICAgICB1bml0LT52Y3B1X2xpc3QgPSB2LT5u
ZXh0X2luX2xpc3Q7Cj4gKwo+ICsgICAgaWYgKCAhY250ICkKPiArICAgICAgICBzY2hlZF9mcmVl
X3VuaXRfbWVtKHVuaXQpOwo+ICt9CgpUaGUgZW50aXJlIHNjaGVkX2ZyZWVfdW5pdCgpIGlzIG5l
dyBjb2RlIChzdGFydGluZyBmcm9tIHBhdGNoIDMpIC0gd2h5CmRvbid0IHlvdSBhcnJhbmdlIGZv
ciB0aGUgc3BsaXQgcmlnaHQgYXdheSwgaW5zdGVhZCBvZiBtb3ZpbmcgY29kZQphcm91bmQgaGVy
ZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
