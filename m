Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E9B7E6A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 17:41:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAyW3-0008Gk-PA; Thu, 19 Sep 2019 15:38:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAyW2-0008Gf-1Q
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 15:38:42 +0000
X-Inumbo-ID: 8e047ec6-daf3-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e047ec6-daf3-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 15:38:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C476BB7A;
 Thu, 19 Sep 2019 15:38:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-10-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d41a9d22-da72-cb40-2ab5-91d74aa8535d@suse.com>
Date: Thu, 19 Sep 2019 17:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-10-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 09/47] xen/sched: move some per-vcpu
 items to struct sched_unit
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZmZpbml0aWVzIGFy
ZSBzY2hlZHVsZXIgc3BlY2lmaWMgYXR0cmlidXRlcywgdGhleSBzaG91bGQgYmUgcGVyCj4gc2No
ZWR1bGluZyB1bml0LiBTbyBtb3ZlIGFsbCBhZmZpbml0eSByZWxhdGVkIGZpZWxkcyBpbiBzdHJ1
Y3QgdmNwdQo+IHRvIHN0cnVjdCBzY2hlZF91bml0LiBXaGlsZSBhdCBpdCBzd2l0Y2ggYWZmaW5p
dHkgcmVsYXRlZCBmdW5jdGlvbnMgaW4KPiBzY2hlZC1pZi5oIHRvIHVzZSBhIHBvaW50ZXIgdG8g
c2NoZWRfdW5pdCBpbnN0ZWFkIHRvIHZjcHUgYXMgcGFyYW1ldGVyLgo+IAo+IFRoZSBhZmZpbml0
eV9icm9rZW4gZmxhZyBtdXN0IGJlIGtlcHQgcGVyIHZjcHUgYXMgaXQgaXMgcmVsYXRlZCB0bwo+
IGd1ZXN0IGFjdGlvbnMgb24gc3BlY2lmaWMgdmNwdXMuIFdoZW4gc3VwcG9ydCBvZiBtdWx0aXBs
ZSB2Y3B1cyBwZXIKPiBzY2hlZF91bml0IGlzIGJlaW5nIGFkZGVkLCBhIHVuaXQgaXMgcmVnYXJk
ZWQgYXMgYmVpbmcgc3ViamVjdCB0bwo+ICJicm9rZW4gYWZmaW5pdHkiIHdoZW4gYW55IG9mIGl0
cyB2Y3B1cyBoYXMgdGhlIGFmZmluaXR5X2Jyb2tlbiBmbGFnCj4gc2V0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiBWMjoKPiAtIG1v
dmUgYWZmaW5pdHlfYnJva2VuIGJhY2sgdG8gc3RydWN0IHZjcHUgKEphbiBCZXVsaWNoKQo+IC0g
cHJpbnQgYWZmaW5pdGllcyBvbmx5IG9uY2UgcGVyIHVuaXQgKEphbiBCZXVsaWNoKQo+IC0tLQo+
ICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICB8IDE1ICsrLS0tLS0tCj4gIHhlbi9jb21tb24v
ZG9tY3RsLmMgICAgICAgIHwgMTMgKysrKy0tLQo+ICB4ZW4vY29tbW9uL2tleWhhbmRsZXIuYyAg
ICB8IDU4ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQoKQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbmUgbWlub3IgcmVtYXJrOgoKPiAtLS0gYS94
ZW4vY29tbW9uL2tleWhhbmRsZXIuYwo+ICsrKyBiL3hlbi9jb21tb24va2V5aGFuZGxlci5jCj4g
QEAgLTI1MSw2ICsyNTEsNyBAQCBzdGF0aWMgdm9pZCByZWJvb3RfbWFjaGluZSh1bnNpZ25lZCBj
aGFyIGtleSwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gIHN0YXRpYyB2b2lkIGR1bXBf
ZG9tYWlucyh1bnNpZ25lZCBjaGFyIGtleSkKPiAgewo+ICAgICAgc3RydWN0IGRvbWFpbiAqZDsK
PiArICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0Owo+ICAgICAgc3RydWN0IHZjcHUgICAqdjsK
PiAgICAgIHNfdGltZV90ICAgICAgIG5vdyA9IE5PVygpOwoKSSBjYW4gc2VlIGhvdyBpdCB3b3Vs
ZCBsb29rIGEgbGl0dGxlIG9kZCBoZXJlIGJlY2F1c2Ugb2YgdGhlCm5laWdoYm9yaW5nIHZhcmlh
YmxlcywgYnV0IGdlbmVyYWxseSBzcGVha2luZyB0aGUgbmV3IG9uZSBzaG91bGQKYmUgcG9pbnRl
ciB0byBjb25zdCAoYW5kIHRoZSBvbGQgb25lcyBzaG91bGQgaGF2ZSBiZWVuLCB0b28sCmFmYWlj
dCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
