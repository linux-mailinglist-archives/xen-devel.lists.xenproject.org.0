Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3756412467A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:08:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihY5G-0005BS-3E; Wed, 18 Dec 2019 12:05:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihY5E-0005BJ-GD
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:05:40 +0000
X-Inumbo-ID: b4c8938a-218e-11ea-9066-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4c8938a-218e-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 12:05:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3572AFCD;
 Wed, 18 Dec 2019 12:05:38 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-8-jgross@suse.com>
 <acaca6d590dd4fb9a50b2c84f132605639e1f273.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <defc7ee4-39d2-4f3b-b20d-62889d44e2b0@suse.com>
Date: Wed, 18 Dec 2019 13:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <acaca6d590dd4fb9a50b2c84f132605639e1f273.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/9] xen/sched: switch scheduling to bool
 where appropriate
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTI6NTQsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0x
Mi0xOCBhdCAwODo0OCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gU2NoZWR1bGluZyBj
b2RlIGhhcyBzZXZlcmFsIHBsYWNlcyB1c2luZyBpbnQgb3IgYm9vbF90IGluc3RlYWQgb2YKPj4g
Ym9vbC4KPj4gU3dpdGNoIHRob3NlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Cj4gSSdtIGZpbmUgd2l0aCBwcmV0dHkgbXVjaCBldmVyeXRo
aW5nIGluIHRoaXMgcGF0Y2guIEp1c3QgdHdvIGNvbW1lbnRzOgo+IAo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zY2hlZC9zY2hlZF9ydC5jCj4+IGIveGVuL2NvbW1vbi9zY2hlZC9zY2hlZF9y
dC5jCj4+IGluZGV4IDI2NGE3NTMxMTYuLjg2NDZkNzczNDMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9j
b21tb24vc2NoZWQvc2NoZWRfcnQuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL3NjaGVkX3J0
LmMKPj4gQEAgLTQ5MCwxMCArNDkwLDEwIEBAIHJ0X3VwZGF0ZV9kZWFkbGluZShzX3RpbWVfdCBu
b3csIHN0cnVjdCBydF91bml0Cj4+ICpzdmMpCj4+ICAgc3RhdGljIGlubGluZSBib29sCj4+ICAg
ZGVhZGxpbmVfcXVldWVfcmVtb3ZlKHN0cnVjdCBsaXN0X2hlYWQgKnF1ZXVlLCBzdHJ1Y3QgbGlz
dF9oZWFkCj4+ICplbGVtKQo+PiAgIHsKPj4gLSAgICBpbnQgcG9zID0gMDsKPj4gKyAgICBib29s
IHBvcyA9IGZhbHNlOwo+PiAgIAo+PiAgICAgICBpZiAoIHF1ZXVlLT5uZXh0ICE9IGVsZW0gKQo+
PiAtICAgICAgICBwb3MgPSAxOwo+PiArICAgICAgICBwb3MgPSB0cnVlOwo+PiAgIAo+PiAgICAg
ICBsaXN0X2RlbF9pbml0KGVsZW0pOwo+PiAgICAgICByZXR1cm4gIXBvczsKPj4KPiBJSVJDLCB0
aGlzIGNvZGUgd2FzICJpbnNwaXJlZCIgYnkgc2ltaWxhciBmdW5jdGlvbnMgaW4gQ3JlZGl0Miwg
d2hlcmUKPiB3ZSBzdG9yZSBpbiAncG9zJyB0aGUgYWN0dWFsIHBvc2l0aW9uIG9mIHRoZSBlbnRp
dHkgaW4gdGhlIHJ1bnEgKG9ubHkKPiBmb3IgdHJhY2luZyBwdXJwb3NlcywgdGhlc2UgZGF5cywg
YnV0IHRoYXQncyBhbm90aGVyIHN0b3J5KS4KPiAKPiBJbiBoZXJlLCBpdCBpcyBpbmRlZWQgdXNl
ZCBvbmx5IGFzIGEgZmxhZyBzbyBpdCBtdXN0IGJlIGJvb2wsIGFuZCBpdAo+IGNhbiBhbHNvIGhh
dmUgYSBiZXR0ZXIgbmFtZSBsaWtlLCBmb3IgaW5zdGFuY2UsICdmaXJzdCcgb3IgJ2hlYWQnIChJ
Cj4gcHJvYmFibHkgbGlrZSAnZmlyc3QnIGJldHRlcikuCgpJJ20gZmluZSB3aXRoIHRoYXQuCgo+
IAo+PiBAQCAtNTA1LDE0ICs1MDUsMTQgQEAgZGVhZGxpbmVfcXVldWVfaW5zZXJ0KHN0cnVjdCBy
dF91bml0ICoKPj4gKCpxZWxlbSkoc3RydWN0IGxpc3RfaGVhZCAqKSwKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGxpc3RfaGVhZCAqcXVldWUpCj4+ICAgewo+PiAgICAgICBzdHJ1
Y3QgbGlzdF9oZWFkICppdGVyOwo+PiAtICAgIGludCBwb3MgPSAwOwo+PiArICAgIGJvb2wgcG9z
ID0gZmFsc2U7Cj4+ICAgCj4+ICAgICAgIGxpc3RfZm9yX2VhY2ggKCBpdGVyLCBxdWV1ZSApCj4+
ICAgICAgIHsKPj4gICAgICAgICAgIHN0cnVjdCBydF91bml0ICogaXRlcl9zdmMgPSAoKnFlbGVt
KShpdGVyKTsKPj4gICAgICAgICAgIGlmICggY29tcGFyZV91bml0X3ByaW9yaXR5KHN2YywgaXRl
cl9zdmMpID4gMCApCj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4+IC0gICAgICAgIHBvcysrOwo+
PiArICAgICAgICBwb3MgPSB0cnVlOwo+PiAgICAgICB9Cj4+ICAgICAgIGxpc3RfYWRkX3RhaWwo
ZWxlbSwgaXRlcik7Cj4+ICAgICAgIHJldHVybiAhcG9zOwo+Pgo+IEFuZCB0aGlzIGlzIHNpbWls
YXIsIGJ1dCB0aGUgbG9naWMgaXMgaW52ZXJ0ZWQuCj4gCj4gSSB0aGluayB0aGUgYmVzdCBzb2x1
dGlvbiBmb3IgdGhpcyBodW5rLCB3aXRob3V0IHN1YnZlcnRpbmcgdGhlIGNvZGUKPiB0b28gbXVj
aCwgd291bGQgYmUgdG8gYWxzbyByZW5hbWUgJ3BvcycgaW50byAnZmlzdCcgYW5kIGluaXRpYWxp
emUgaXQKPiB0byB0cnVlLgo+IAo+IFRoZW4sIGluIHRoZSBsb29wLCB3ZSBzZXQgaXQgdG8gZmFs
c2UuIFNvIHRoYXQgaXQgd2lsbCBzdGlsbCBiZSB0cnVlLAo+IGlmIHdlIGV4aXQgaW1tZWRpYXRl
bHksIGZhbHNlIGlmIHdlIGRvIGF0IGxlYXN0IG9uZSBzdGVwLgo+IAo+IEFuZCBmaW5hbGx5IHdl
IHJldHVybiAnZmlyc3QnIGFuZCBub3QgaXRzIG5lZ2F0aW9uLgo+IAo+IFRob3VnaHRzPwoKWWVz
LCB3aWxsIGRvIHRoYXQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
