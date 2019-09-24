Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C9FBC71B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjFb-0000Q0-1d; Tue, 24 Sep 2019 11:44:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCjFZ-0000Pv-RE
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:44:57 +0000
X-Inumbo-ID: ba7d7f90-dec0-11e9-8a4f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ba7d7f90-dec0-11e9-8a4f-bc764e2007e4;
 Tue, 24 Sep 2019 11:44:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CE2AAE9A;
 Tue, 24 Sep 2019 11:44:55 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-10-jgross@suse.com>
 <d41a9d22-da72-cb40-2ab5-91d74aa8535d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9ca640ec-d733-eec2-9b45-267746932ba7@suse.com>
Date: Tue, 24 Sep 2019 13:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d41a9d22-da72-cb40-2ab5-91d74aa8535d@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMTkgMTc6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFmZmluaXRpZXMgYXJlIHNjaGVkdWxlciBzcGVj
aWZpYyBhdHRyaWJ1dGVzLCB0aGV5IHNob3VsZCBiZSBwZXIKPj4gc2NoZWR1bGluZyB1bml0LiBT
byBtb3ZlIGFsbCBhZmZpbml0eSByZWxhdGVkIGZpZWxkcyBpbiBzdHJ1Y3QgdmNwdQo+PiB0byBz
dHJ1Y3Qgc2NoZWRfdW5pdC4gV2hpbGUgYXQgaXQgc3dpdGNoIGFmZmluaXR5IHJlbGF0ZWQgZnVu
Y3Rpb25zIGluCj4+IHNjaGVkLWlmLmggdG8gdXNlIGEgcG9pbnRlciB0byBzY2hlZF91bml0IGlu
c3RlYWQgdG8gdmNwdSBhcyBwYXJhbWV0ZXIuCj4+Cj4+IFRoZSBhZmZpbml0eV9icm9rZW4gZmxh
ZyBtdXN0IGJlIGtlcHQgcGVyIHZjcHUgYXMgaXQgaXMgcmVsYXRlZCB0bwo+PiBndWVzdCBhY3Rp
b25zIG9uIHNwZWNpZmljIHZjcHVzLiBXaGVuIHN1cHBvcnQgb2YgbXVsdGlwbGUgdmNwdXMgcGVy
Cj4+IHNjaGVkX3VuaXQgaXMgYmVpbmcgYWRkZWQsIGEgdW5pdCBpcyByZWdhcmRlZCBhcyBiZWlu
ZyBzdWJqZWN0IHRvCj4+ICJicm9rZW4gYWZmaW5pdHkiIHdoZW4gYW55IG9mIGl0cyB2Y3B1cyBo
YXMgdGhlIGFmZmluaXR5X2Jyb2tlbiBmbGFnCj4+IHNldC4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiAtLS0KPj4gVjI6Cj4+IC0gbW92ZSBh
ZmZpbml0eV9icm9rZW4gYmFjayB0byBzdHJ1Y3QgdmNwdSAoSmFuIEJldWxpY2gpCj4+IC0gcHJp
bnQgYWZmaW5pdGllcyBvbmx5IG9uY2UgcGVyIHVuaXQgKEphbiBCZXVsaWNoKQo+PiAtLS0KPj4g
ICB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICB8IDE1ICsrLS0tLS0tCj4+ICAgeGVuL2NvbW1v
bi9kb21jdGwuYyAgICAgICAgfCAxMyArKysrLS0tCj4+ICAgeGVuL2NvbW1vbi9rZXloYW5kbGVy
LmMgICAgfCA1OCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAKPiBBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggb25lIG1pbm9yIHJlbWFyazoK
PiAKPj4gLS0tIGEveGVuL2NvbW1vbi9rZXloYW5kbGVyLmMKPj4gKysrIGIveGVuL2NvbW1vbi9r
ZXloYW5kbGVyLmMKPj4gQEAgLTI1MSw2ICsyNTEsNyBAQCBzdGF0aWMgdm9pZCByZWJvb3RfbWFj
aGluZSh1bnNpZ25lZCBjaGFyIGtleSwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4+ICAg
c3RhdGljIHZvaWQgZHVtcF9kb21haW5zKHVuc2lnbmVkIGNoYXIga2V5KQo+PiAgIHsKPj4gICAg
ICAgc3RydWN0IGRvbWFpbiAqZDsKPj4gKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsKPj4g
ICAgICAgc3RydWN0IHZjcHUgICAqdjsKPj4gICAgICAgc190aW1lX3QgICAgICAgbm93ID0gTk9X
KCk7Cj4gCj4gSSBjYW4gc2VlIGhvdyBpdCB3b3VsZCBsb29rIGEgbGl0dGxlIG9kZCBoZXJlIGJl
Y2F1c2Ugb2YgdGhlCj4gbmVpZ2hib3JpbmcgdmFyaWFibGVzLCBidXQgZ2VuZXJhbGx5IHNwZWFr
aW5nIHRoZSBuZXcgb25lIHNob3VsZAo+IGJlIHBvaW50ZXIgdG8gY29uc3QgKGFuZCB0aGUgb2xk
IG9uZXMgc2hvdWxkIGhhdmUgYmVlbiwgdG9vLAo+IGFmYWljdCkuCgpZZXMuIFdpbGwgY2hhbmdl
IHVuaXQgZm9yIG5vdyBhbmQgdGhlIG90aGVycyBpbiAtIHlvdSBtaWdodCBoYXZlIGd1ZXNzZWQK
dGhhdCBhbHJlYWR5IC0gdGhlIGV2ZXIgZ3Jvd2luZyBzY2hlZHVsaW5nIGNsZWFudXAgc2VyaWVz
ICh5ZXMsIEknbQpub3RpbmcgdGhlIHRvcGljcyBmb3IgdGhhdCBzZXJpZXMpLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
