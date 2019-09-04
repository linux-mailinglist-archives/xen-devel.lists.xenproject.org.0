Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D57A85EB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 17:06:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WoL-0004as-0y; Wed, 04 Sep 2019 15:03:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5WoJ-0004an-4n
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 15:03:03 +0000
X-Inumbo-ID: 16dba916-cf25-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16dba916-cf25-11e9-b76c-bc764e2007e4;
 Wed, 04 Sep 2019 15:03:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 109E3AE92;
 Wed,  4 Sep 2019 15:03:01 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-9-jgross@suse.com>
 <22dc77b0-7ffa-a7ba-c3e5-14833f0b0b72@suse.com>
 <dfec18bc-e323-bb28-7333-2e5a459d0ec7@suse.com>
 <9a48c9ac-1aba-2102-d444-a135a588b30f@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d8be4beb-642c-4ab3-3940-10e67d1c69ed@suse.com>
Date: Wed, 4 Sep 2019 17:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9a48c9ac-1aba-2102-d444-a135a588b30f@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 08/48] xen/sched: switch
 vcpu_schedule_lock to unit_schedule_lock
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTY6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjA5LjIwMTkgMTY6
NDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA0LjA5LjE5IDE2OjAyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4+Pj4gQEAgLTI1MCw3ICsyNTAsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV9y
dW5zdGF0ZV9jaGFuZ2UoCj4+Pj4gICAgCj4+Pj4gICAgdm9pZCB2Y3B1X3J1bnN0YXRlX2dldChz
dHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3RhdGUpCj4+Pj4g
ICAgewo+Pj4+IC0gICAgc3BpbmxvY2tfdCAqbG9jayA9IGxpa2VseSh2ID09IGN1cnJlbnQpID8g
TlVMTCA6IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7Cj4+Pj4gKyAgICBzcGlubG9ja190ICps
b2NrID0gbGlrZWx5KHYgPT0gY3VycmVudCkKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICA/
IE5VTEwgOiB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOwo+Pj4+ICAgICAg
ICBzX3RpbWVfdCBkZWx0YTsKPj4+PiAgICAKPj4+PiAgICAgICAgbWVtY3B5KHJ1bnN0YXRlLCAm
di0+cnVuc3RhdGUsIHNpemVvZigqcnVuc3RhdGUpKTsKPj4+PiBAQCAtMjU5LDcgKzI2MCw3IEBA
IHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2Y3B1X3J1bnN0
YXRlX2luZm8gKnJ1bnN0YXRlKQo+Pj4+ICAgICAgICAgICAgcnVuc3RhdGUtPnRpbWVbcnVuc3Rh
dGUtPnN0YXRlXSArPSBkZWx0YTsKPj4+PiAgICAKPj4+PiAgICAgICAgaWYgKCB1bmxpa2VseShs
b2NrICE9IE5VTEwpICkKPj4+PiAtICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9j
aywgdik7Cj4+Pj4gKyAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNj
aGVkX3VuaXQpOwo+Pj4+ICAgIH0KPj4+Cj4+PiBBdCB0aGUgZXhhbXBsZSBvZiB0aGlzOiBUaGUg
bW9yZSBjb2Fyc2UgZ3JhbnVsYXJpdHkgb2YgdGhlIGxvY2sKPj4+IG1lYW5zIHRoYXQgbm8gdHdv
IHZDUFUtcyB3aXRoaW4gYSB1bml0IGNhbiBvYnRhaW4gdGhlaXIgcnVuc3RhdGUKPj4+IGluIHBh
cmFsbGVsLiBXaGlsZSB0aGlzIG1heSBiZSBhY2NlcHRhYmxlIGZvciBjb3JlIHNjaGVkdWxpbmcs
Cj4+PiBJJ20gYWZyYWlkIGl0J3MgdG9vIHJlc3RyaWN0aXZlIGZvciBzb2NrZXRzIG9yIG5vZGVz
IGFzIHVuaXRzLgo+Pj4gVGhlcmVmb3JlIEkgdGhpbmsgdGhpcyBsb2NrIG5lZWRzIHRvIGVpdGhl
ciBiZSBzcGxpdCAoSSdtIG5vdAo+Pj4gc3VyZSB0aGF0J3MgZmVhc2libGUpIG9yIGJlY29tZSBh
biByL3cgbG9jay4KPj4KPj4gWW91IGFyZSBhd2FyZSB0aGF0IGV2ZW4gdG9kYXkgd2l0aCBjcmVk
aXQyIGFsbCBjcHVzIG9mIGEgc29ja2V0IHNoYXJlCj4+IHRoZSBzYW1lIGxvY2sgKGlmIG5vdCBt
b2RpZmllZCB2aWEgYm9vdCBwYXJhbWV0ZXIpPwo+IAo+IE5vLCBJIHdhc24ndCAoZXhwbGljaXRs
eTsgSSBjb3VsZCBoYXZlIGRlZHVjZWQgaXQpLiBOb3QgdmVyeSBoZWxwZnVsLAo+IEknbSBhZnJh
aWQsIGJ1dCB1bmxpa2VseSB0byBiZSBiYWQgZW5vdWdoIHRvIGdvIGJhY2sgdG8gY3JlZGl0MSAo
YnV0Cj4gcGVvcGxlIGhhdmluZyBhbiBpc3N1ZSB3aXRoIHRoaXMgY291bGQgYmUgdG9sZCB0byBz
d2l0Y2ggYmFjaykuCgpXZWxsLCBwZXJmb3JtYW5jZSB0ZXN0cyBoYXZlIHNob3duIHRoYXQgdGhp
cyBpcyB0aGUgbW9zdCBwZXJmb3JtYW50CnNldHRpbmcuIEFuZCBiZWZvcmUgZ29pbmcgYmFjayB0
byBjcmVkaXQxIHRoZXkgc3RpbGwgY2FuIHVzZSBhbm90aGVyCmxvY2sgc2V0dGluZyAoY29yZSBv
ciBjcHUpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
