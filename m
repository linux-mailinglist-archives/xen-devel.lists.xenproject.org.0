Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E9BDE9A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD71D-0007kq-3h; Wed, 25 Sep 2019 13:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD71B-0007kj-Mu
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:07:41 +0000
X-Inumbo-ID: 743977e8-df95-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 743977e8-df95-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 13:07:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E503B7E3;
 Wed, 25 Sep 2019 13:07:40 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
 <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
 <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7962de1d-8ad5-13ef-3377-3b16c07b9afd@suse.com>
Date: Wed, 25 Sep 2019 15:07:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNDo0MCwgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4gT24gMjQuMDkuMTkg
MTc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyNC4wOS4yMDE5IDE3OjA5LCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4gT24gMjQuMDkuMTkgMTc6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
Pj4+IE9uIDI0LjA5LjIwMTkgMTY6NDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+IGZvcl9l
YWNoX3NjaGVkX3VuaXRfdmNwdSgpIGZvciBhbiBpZGxlCj4+Pj4+IHVuaXQgbWlnaHQgZW5kIHBy
ZW1hdHVyZSB3aGVuIG9uZSBvZiB0aGUgdmNwdXMgaXMgcnVubmluZyBpbiBhbm90aGVyCj4+Pj4+
IHVuaXQgKGlkbGVfdmNwdS0+c2NoZWRfdW5pdCAhPSBpZGxlX3VuaXQpLgo+Pj4+Cj4+Pj4gT2gs
IHRoYXQgKHYpLT5zY2hlZF91bml0ID09IChpKSBpbiB0aGUgY29uc3RydWN0IGlzIGNsZWFybHkg
dW5leHBlY3RlZC4KPj4+PiBJcyB0aGlzIHJlYWxseSBzdGlsbCBuZWVkZWQgYnkgdGhlIGVuZCBv
ZiB0aGUgc2VyaWVzPyBJIHJlYWxpemUgdGhhdAo+Pj4+IF9zb21lXyBjaGVjayBpcyBuZWVkZWQs
IGJ1dCBjb3VsZCB0aGlzIHBlcmhhcHMgYmUgYXJyYW5nZWQgaW4gYSB3YXkKPj4+PiB0aGF0IHlv
dSdkIHN0aWxsIGhpdCBhbGwgdkNQVS1zIHdoZW4gdXNpbmcgaXQgb24gYW4gaWRsZSB1bml0LCBu
bwo+Pj4+IG1hdHRlciB3aGV0aGVyIHRoZXkncmUgaW4gdXNlIGFzIGEgc3Vic3RpdHV0ZSBpbiBh
ICJyZWFsIiB1bml0Pwo+Pj4KPj4+IEkgY291bGQgZG8gdGhhdCBieSBoYXZpbmcgYW5vdGhlciBs
aW5rZWQgbGlzdCBpbiBzdHJ1Y3QgdmNwdS4gVGhpcyB3YXkKPj4+IEkgY2FuIGF2b2lkIGl0Lgo+
Pgo+PiBPaCwgbm8sIG5vdCBhbm90aGVyIGxpc3QganVzdCBmb3IgdGhpcyBwdXJwb3NlLiBJIHdh
cyByYXRoZXIgdGhpbmtpbmcKPj4gb2YgZS5nLiBhIGNvbXBhcmlzb24gb2YgSURzLgo+IAo+IFRo
YXQgd291bGQgcmVzdWx0IGVpdGhlciBpbiBzb21ldGhpbmcgbGlrZToKPiAKPiAodiktPnZjcHVf
aWQgPCAodSktPnVuaXRfaWQgKyAodSktPnJlcy0+Y3B1cG9vbC0+Z3JhbnVsYXJpdHkKPiAKPiBy
ZXF1aXJpbmcgdG8gbWFrZSBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgcHVibGljIGFzIGtleWhhbmRs
ZXIuYyBuZWVkcwo+IGZvcl9lYWNoX3NjaGVkX3VuaXRfdmNwdSgpIHBsdXMgYmVpbmcgcXVpdGUg
ZXhwZW5zaXZlLAoKSSBhZ3JlZSB0aGlzIGlzIG5vdCBhIGdvb2Qgb3B0aW9uLgoKPiBvcjoKPiAK
PiAhKHUpLT5uZXh0X2luX2xpc3QgfHwgKHYpLT52Y3B1X2lkIDwgKHUpLT5uZXh0X2luX2xpc3Qt
PnVuaXRfaWQKPiAKPiB3aGljaCBzZWVtcyB0byBiZSBtb3JlIGV4cGVuc2l2ZSBhcyB0aGUgY3Vy
cmVudCB2YXJpYW50LCB0b28uCgpJdCdzIG5vdCB0aGlzIG11Y2ggbW9yZSBleHBlbnNpdmUsIGFu
ZCBpdCBlbGltaW5hdGVzIHVuZXhwZWN0ZWQKKGFzIEkgd291bGQgY2FsbCBpdCkgYmVoYXZpb3Is
IHNvIEkgdGhpbmsgSSdkIGdvIHRoaXMgcm91dGUuIExldCdzCnNlZSBpZiBvdGhlcnMsIGluIHBh
cnRpY3VsYXIgRGFyaW8gb3IgR2VvcmdlLCBoYXZlIGFuIG9waW5pb24KZWl0aGVyIHdheS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
