Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A0BCAA2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm7F-0002Yz-1X; Tue, 24 Sep 2019 14:48:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCm7E-0002Yt-7E
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:48:32 +0000
X-Inumbo-ID: 60321702-deda-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 60321702-deda-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:48:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96FE1ADF7;
 Tue, 24 Sep 2019 14:48:30 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-30-jgross@suse.com>
 <c82b5b04-ff81-8600-d959-b3dcc90575a2@suse.com>
 <184451ad-4314-8887-651a-028b4b5844e5@suse.com>
 <d4325236-9381-9d33-e461-709fd80bf2dd@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a548086e-5bbb-5138-a1df-dd5f981a3ed9@suse.com>
Date: Tue, 24 Sep 2019 16:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d4325236-9381-9d33-e461-709fd80bf2dd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 29/47] xen/sched: introduce
 unit_runnable_state()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTY6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTY6
MjUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIzLjA5LjE5IDE3OjI0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gVG9kYXkgdGhlIHZjcHUgcnVuc3RhdGUgb2YgYSBuZXcgc2NoZWR1bGVkIHZjcHUgaXMgYWx3
YXlzIHNldCB0bwo+Pj4+ICJydW5uaW5nIiBldmVuIGlmIGF0IHRoYXQgdGltZSB2Y3B1X3J1bm5h
YmxlKCkgaXMgYWxyZWFkeSByZXR1cm5pbmcKPj4+PiBmYWxzZSBkdWUgdG8gYSByYWNlIChlLmcu
IHdpdGggcGF1c2luZyB0aGUgdmNwdSkuCj4+Pgo+Pj4gSSBjYW4gc2VlIHRoaXMgcGFydCwgLi4u
Cj4+Pgo+Pj4+IFdpdGggY29yZSBzY2hlZHVsaW5nIHRoaXMgY2FuIG5vIGxvbmdlciB3b3JrIGFz
IG5vdCBhbGwgdmNwdXMgb2YgYQo+Pj4+IHNjaGVkdWxlIHVuaXQgaGF2ZSB0byBiZSAicnVubmlu
ZyIgd2hlbiBiZWluZyBzY2hlZHVsZWQuIFNvIHRoZSB2Y3B1J3MKPj4+PiBuZXcgcnVuc3RhdGUg
aGFzIHRvIGJlIHNlbGVjdGVkIGF0IHRoZSBzYW1lIHRpbWUgYXMgdGhlIHJ1bm5hYmlsaXR5IG9m
Cj4+Pj4gdGhlIHJlbGF0ZWQgc2NoZWR1bGUgdW5pdCBpcyBwcm9iZWQuCj4+Pgo+Pj4gLi4uIGJ1
dCBJIGNvbnRpbnVlIGhhdmluZyB0cm91YmxlIGhlcmUuIElmIGl0IGhhcyBiZWVuIG9rYXkgdG8g
c2V0Cj4+PiBhIHZDUFUgbm8gbG9uZ2VyIHJ1bm5hYmxlIHRvICJydW5uaW5nIiBuZXZlcnRoZWxl
c3MsIHdoeSB3b3VsZCB0aGUKPj4+IHNhbWUgbm90IGJlIHRydWUgZm9yIHNjaGVkdWxlIHVuaXRz
PyBQYXJ0IG9mIHRoZSBwcm9ibGVtIG1heSBiZQo+Pj4gdGhhdCAuLi4KPj4KPj4gVGhlIGRpZmZl
cmVuY2UgaXMgdGhlIG5lZWQgdG8gZHJvcCB0aGUgc2NoZWR1bGluZyBsb2NrIGZvciBkb2luZyB0
aGUKPj4gcmVuZGV6dm91cy4gdmNwdV9zbGVlcCgpIG9yIHZjcHVfd2FrZSgpIGNvdWxkIG5vdyBp
bnRlcmZlcmUgd2l0aAo+PiBzY2hlZHVsaW5nIGluIGEgd2F5IHdoaWNoIHdhcyBub3QgcG9zc2li
bGUgYmVmb3JlLgo+IAo+IEFoLCByaWdodC4gQnV0IHRoaXMgd291bGQgYmUgd29ydGggbWVudGlv
bmluZyBleHBsaWNpdGx5IGhlcmUgdG8KPiBoZWxwIHJlYWRlcnMsIHdvdWxkbid0IGl0PyBEb2Vz
bid0IG5lZWQgdG8gYmUgbW9yZSB0aGFuIGhhbGYgYQo+IHNlbnRlbmNlIC4uLgoKT2theS4KCgpK
dWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
