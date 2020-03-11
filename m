Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA3918148F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 10:19:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBxTz-0003uU-97; Wed, 11 Mar 2020 09:16:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBxTy-0003uP-Gr
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 09:16:54 +0000
X-Inumbo-ID: 0beb340c-6379-11ea-af44-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0beb340c-6379-11ea-af44-12813bfff9fa;
 Wed, 11 Mar 2020 09:16:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 566CEAC1E;
 Wed, 11 Mar 2020 09:16:52 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-7-paul@xen.org>
 <54fbff7c-118f-bfa7-3d2c-c1d6a2305a1f@suse.com>
 <004201d5f702$0905fbc0$1b11f340$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc440f97-59b8-5018-8d69-fa5e10b70e97@suse.com>
Date: Wed, 11 Mar 2020 10:16:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <004201d5f702$0905fbc0$1b11f340$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/6] domain: use PGC_extra domheap page
 for shared_info
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxODozMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMTU6NTYKPj4KPj4gT24gMDkuMDMuMjAyMCAxMToyMywgcGF1
bEB4ZW4ub3JnIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2NvbW1vbi90aW1lLmMKPj4+ICsrKyBiL3hl
bi9jb21tb24vdGltZS5jCj4+PiBAQCAtOTksNiArOTksMTggQEAgdm9pZCB1cGRhdGVfZG9tYWlu
X3dhbGxjbG9ja190aW1lKHN0cnVjdCBkb21haW4gKmQpCj4+PiAgICAgIHVpbnQzMl90ICp3Y192
ZXJzaW9uOwo+Pj4gICAgICB1aW50NjRfdCBzZWM7Cj4+Pgo+Pj4gKyAgICBpZiAoIGQgIT0gY3Vy
cmVudC0+ZG9tYWluICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgLyoKPj4+ICsgICAgICAgICAq
IFdlIG5lZWQgdG8gY2hlY2sgaXNfZHlpbmcgaGVyZSBhcywgaWYgaXQgaXMgc2V0LCB0aGUKPj4+
ICsgICAgICAgICAqIHNoYXJlZF9pbmZvIG1heSBoYXZlIGJlZW4gZnJlZWQuIFRvIGRvIHRoaXMg
c2FmZWx5IHdlIG5lZWQKPj4+ICsgICAgICAgICAqIGhvbGQgdGhlIGRvbWFpbiBsb2NrLgo+Pj4g
KyAgICAgICAgICovCj4+PiArICAgICAgICBkb21haW5fbG9jayhkKTsKPj4+ICsgICAgICAgIGlm
ICggZC0+aXNfZHlpbmcgKQo+Pj4gKyAgICAgICAgICAgIGdvdG8gdW5sb2NrOwo+Pj4gKyAgICB9
Cj4+Cj4+IFRoaXMgc2hvdWxkbid0IGhhcHBlbiB2ZXJ5IG9mdGVuLCBidXQgaXQncyBwcmV0dHkg
aGVhdnkgYSBsb2NrLgo+PiBJdCdzIGEgZnVuZGFtZW50YWwgYXNwZWN0IG9mIHhlbmhlYXAgcGFn
ZXMgdGhhdCB0aGVpciBkaXNwb3NhbAo+PiBjYW4gYiBlIGRlbGF5IHVudGlsIGFsbW9zdCB0aGUg
bGFzdCBtb21lbnQgb2YgZ3Vlc3QgY2xlYW51cC4gSQo+PiBjb250aW51ZSB0byB0aGluayBpdCdz
IG5vdCByZWFsbHkgYSBnb29kIGlkZWFsIHRvIGhhdmUgc3BlY2lhbAo+PiBwdXJwb3NlIGFsbG9j
YXRpb24gKGFuZCBtYXBwaW5nKSBhY2NvbXBhbmllZCBieSB0aGVzZSBwYWdlcwo+PiBnZXR0aW5n
IHRha2VuIGNhcmUgb2YgYnkgdGhlIGdlbmVyaWMgcmVsaW5xdWlzaC1yZXNvdXJjZXMgbG9naWMK
Pj4gaGVyZSAoZnJvbSBhIG1vcmUgZ2VuZXJhbCBwb3Ygc3VjaCBpcyBvZiBjb3Vyc2Ugb2Z0ZW4g
bmljZSB0bwo+PiBoYXZlKS4gSW5zdGVhZCBvZiBmcmVlaW5nIHRoZXNlIHBhZ2VzIHRoZXJlLCBj
b3VsZG4ndCB0aGV5IGp1c3QKPj4gYmUgdGFrZW4gb2ZmIGQtPnBhZ2VfbGlzdCwgd2l0aCB0aGUg
dW5tYXBwaW5nIGFuZCBmcmVlaW5nIGxlZnQKPj4gYXMgaXQgd2FzPwo+IAo+IEkgZG9uJ3QgdGhp
bmsgdGhpcyBjYW4gYmUgYWNoaWV2ZWQgd2l0aG91dCBiZWluZyBhYmxlIGRlLWFzc2lnbgo+IHBh
Z2VzIGFuZCBJIGRvbid0IHJlYWxseSB3YW50IHRvIGhhdmUgdG8gaW52ZW50IG5ldyBsb2dpYyB0
byBkbwo+IHRoYXQgKGJhc2ljYWxseSByZS1pbXBsZW1lbnRpbmcgd2hhdCBoYXBwZW5zIHRvIHhl
bmhlYXAgcGFnZXMpLgoKV2hlcmUncyB0aGUgY29ubmVjdGlvbiB0byBiZWluZyBhYmxlIHRvIGRl
LWFzc2lnbiBwYWdlcyBoZXJlPwpUaGVyZSdsbCBiZSBvbmUgd2hlbiB0aGUgc2FtZSBjb252ZXJz
aW9uIGlzIHRvIGJlIGRvbmUgZm9yCmdudHRhYiBjb2RlLCBidXQgSSBkb24ndCBzZWUgaXQgaGVy
ZSAtIHRoZSBzaGFyZWQgaW5mbyBwYWdlIGlzCm5ldmVyIHRvIGJlIGRlLWFzc2lnbmVkLiBBcyB0
byBnbnR0YWIgY29kZSwgSSB0aGluayBpdCB3YXMKbm90ZWQgYmVmb3JlIHRoYXQgd2UgbWF5IGJl
IGJldHRlciBvZmYgbm90ICJ1bnBvcHVsYXRpbmciCnN0YXR1cyBwYWdlcyB3aGVuIHN3aXRjaGlu
ZyBiYWNrIGZyb20gdjIgdG8gdjEuIEF0IHdoaWNoIHBvaW50CnRoZSBkZS1hc3NpZ25tZW50IG5l
ZWQgd291bGQgZ28gYXdheSB0aGVyZSwgdG9vLgoKPiBJIHJlYWxseSBkb24ndCB0aGluayBpdCBp
cyB0aGF0IGJhZCB0byBkZWFsIHdpdGggc2hhcmVkIGluZm8KPiBhbmQgZ3JhbnQgdGFibGUgcGFn
ZXMgYXMgZG9taGVhcCBwYWdlcy4gWWVzLCB3ZSBoYXZlIHRvIGJlCj4gY2FyZWZ1bCwgYnV0IGlu
IHRoaXMgY2FzZSB0aGUgbG9jayBpcyBvbmx5IHRha2VuIGluIGEKPiB0b29sc3RhY2sgdXBkYXRl
IG9mIHRoZSB3YWxsY2xvY2sgYW5kLCBhcGFydCBmcm9tIHN0YXJ0IG9mCj4gZGF5IGFjY2Vzcywg
SSB0aGluayB0aGlzIGlzIGxpbWl0ZWQgdG8gWEVOX0RPTUNUTF9zZXR0aW1lb2Zmc2V0Cj4gYW5k
IFhFTl9ET01DVExfc2V0dmNwdWNvbnRleHQgbmVpdGhlciBvZiB3aGljaCBJIGJlbGlldmUgaXMK
PiBwYXJ0aWN1bGFybHkgcGVyZm9ybWFuY2UtY3JpdGljYWwuCgpJdCdzIG5vdCwgSSBhZ3JlZSAo
YW5kIGhlbmNlIEkgaGFkIHN0YXJ0ZWQgbXkgcHJldmlvdXMgcmVwbHkKYWxzbyB3aXRoICJUaGlz
IHNob3VsZG4ndCBoYXBwZW4gdmVyeSBvZnRlbiIpLiBIb3cgYWxsIG9mIHRoaXMKaXMgZ29pbmcg
dG8gbG9vayBsaWtlIHdpdGggdGhlIG5ldyBleHRyYV9wYWdlX2xpc3QgSSdsbCBoYXZlCnRvIHNl
ZSBhbnl3YXkuIEJ1dCBmb3Igbm93IEkgcmVtYWluIHVuY29udmluY2VkIG9mIHRoZSB3YW50IC8K
bmVlZCB0byBkZS1hbGxvY2F0ZSB0aGUgc2hhcmVkIGluZm8gcGFnZSBlYXJseS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
