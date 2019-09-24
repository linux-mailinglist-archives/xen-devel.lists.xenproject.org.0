Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B864BBCACF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:03:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmIl-0004Fg-WE; Tue, 24 Sep 2019 15:00:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCmIl-0004Fa-6b
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:00:27 +0000
X-Inumbo-ID: 0a51c006-dedc-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0a51c006-dedc-11e9-bf31-bc764e2007e4;
 Tue, 24 Sep 2019 15:00:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5DCA7AF89;
 Tue, 24 Sep 2019 15:00:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-25-jgross@suse.com>
 <73c41851-cba3-c8aa-b031-dcfb3dcff6a4@suse.com>
 <f91d4df5-5b35-1030-ea13-c99d3ec16157@suse.com>
 <b0ae0c50-a8cb-ffc6-06df-e4c20261aa36@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6db4ef58-6756-ba8f-7500-acc19ce7c29c@suse.com>
Date: Tue, 24 Sep 2019 17:00:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b0ae0c50-a8cb-ffc6-06df-e4c20261aa36@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 24/47] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <Robert.VanVossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Joshua Whitehead <josh.whitehead@dornerworks.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTQ6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTQ6
MTMsIErDvHJnZW4gR3Jvw58gIHdyb3RlOgo+PiBPbiAyMC4wOS4xOSAxNzowNSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAxNC4wOS4yMDE5IDEwOjUyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4+IEBAIC04OTYsMTggKzkyOSwyMiBAQCB2b2lkIHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1
Y3QgZG9tYWluICpkKQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5f
Y3B1bWFzayhkKSk7Cj4+Pj4gICAgICAgICAgICBpZiAoIGNwdW1hc2tfZW1wdHkoY3B1bWFza19z
Y3JhdGNoX2NwdShjcHUpKSApCj4+Pj4gICAgICAgICAgICB7Cj4+Pj4gLSAgICAgICAgICAgIGlm
ICggdi0+YWZmaW5pdHlfYnJva2VuICkKPj4+PiArICAgICAgICAgICAgaWYgKCBzY2hlZF9jaGVj
a19hZmZpbml0eV9icm9rZW4odW5pdCkgKQo+Pj4+ICAgICAgICAgICAgICAgIHsKPj4+PiAtICAg
ICAgICAgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh2LCB1bml0LT5jcHVfaGFyZF9hZmZpbml0
eV9zYXZlZCwgTlVMTCk7Cj4+Pj4gLSAgICAgICAgICAgICAgICB2LT5hZmZpbml0eV9icm9rZW4g
PSAwOwo+Pj4+ICsgICAgICAgICAgICAgICAgLyogQWZmaW5pdHkgc2V0dGluZ3Mgb2Ygb25lIHZj
cHUgYXJlIGZvciB0aGUgY29tcGxldGUgdW5pdC4gKi8KPj4+PiArICAgICAgICAgICAgICAgIHNj
aGVkX3NldF9hZmZpbml0eSh1bml0LT52Y3B1X2xpc3QsCj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5pdC0+Y3B1X2hhcmRfYWZmaW5pdHlfc2F2ZWQsIE5VTEwpOwo+
Pj4KPj4+IFlldCBkZXNwaXRlIHRoZSBjb21tZW50IHRoZSBmdW5jdGlvbiBnZXRzIHBhc3NlZCBh
IHN0cnVjdCB2Y3B1ICosCj4+PiBhbmQgdGhpcyBkb2Vzbid0IGxvb2sgdG8gY2hhbmdlIGJ5IHRo
ZSBlbmQgb2YgdGhlIHNlcmllcy4gSXMgdGhlcmUKPj4+IGEgcmVhc29uIGZvciB0aGlzPwo+Pgo+
PiBZZXMuIHNjaGVkX3NldF9hZmZpbml0eSgpIGlzIHVzZWQgZnJvbSBvdXRzaWRlIG9mIHNjaGVk
dWxlLmMgKGJ5Cj4+IGRvbTBfYnVpbGQuYykuCj4gCj4gSG93IGFib3V0IGNoYW5naW5nIHRoZSBj
YWxsIHRoZXJlIHRoZW4sIHJhdGhlciB0aGFuIGhhdmluZyBjb25mdXNpbmcKPiBjb2RlIGhlcmU/
CgpJJ20gbm90IHN1cmUgdGhhdCB3b3VsZCBiZSBiZXR0ZXIuCgpXaGF0IGFib3V0IGRyb3BwaW5n
IGRvbTBfc2V0dXBfdmNwdSgpIGJ5IGNhbGxpbmcgdmNwdV9jcmVhdGUoKSBpbnN0ZWFkCmFuZCBk
b2luZyB0aGUgcGlubmluZyB2aWEgYSBjYWxsIHRvIGEgbmV3IGZ1bmN0aW9uIGluIHNjaGVkdWxl
LmMgYWZ0ZXIKaGF2aW5nIGNyZWF0ZWQgYWxsIHZjcHVzPyBJbiBmYWN0IHdlIGNvdWxkIGV2ZW4g
ZG8gYSBjb21tb24gZnVuY3Rpb24KY3JlYXRpbmcgYWxsIGJ1dCB2Y3B1WzBdLCBkb2luZyB0aGUg
cGlubmluZyBhbmQgdGhlIHVwZGF0aW5nIHRoZSBub2RlCmFmZmluaXR5LiBQcm9iYWJseSB0aGlz
IHdvdWxkIHdhbnQgdG8gYmUgcGFydCBvZiBwYXRjaCAyMC4KCgpKdWVyZ2VuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
