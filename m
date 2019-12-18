Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDCF1248B3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:45:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZax-0006br-4u; Wed, 18 Dec 2019 13:42:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihZav-0006bi-OA
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:42:29 +0000
X-Inumbo-ID: 367f12ca-219c-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 367f12ca-219c-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 13:42:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DFC9ADAD;
 Wed, 18 Dec 2019 13:42:19 +0000 (UTC)
To: Varad Gautam <vrd@amazon.de>
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
 <1576666417-20989-1-git-send-email-vrd@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00a6a319-0c7e-9fef-4a97-e5ca064c103c@suse.com>
Date: Wed, 18 Dec 2019 14:42:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576666417-20989-1-git-send-email-vrd@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxMTo1MywgVmFyYWQgR2F1dGFtIHdyb3RlOgo+IFhFTl9ET01DVExfZGVz
dHJveWRvbWFpbiBjcmVhdGVzIGEgY29udGludWF0aW9uIGlmIGRvbWFpbl9raWxsIC1FUkVTVEFS
VFMuCj4gSW4gdGhhdCBzY2VuYXJpbywgaXQgaXMgcG9zc2libGUgdG8gcmVjZWl2ZSBtdWx0aXBs
ZSBfcGlycV9ndWVzdF91bmJpbmQKPiBjYWxscyBmb3IgdGhlIHNhbWUgcGlycSBmcm9tIGRvbWFp
bl9raWxsLCBpZiB0aGUgcGlycSBoYXMgbm90IHlldCBiZWVuCj4gcmVtb3ZlZCBmcm9tIHRoZSBk
b21haW4ncyBwaXJxX3RyZWUsIGFzOgo+ICAgZG9tYWluX2tpbGwoKQo+ICAgICAtPiBkb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoKQo+ICAgICAgIC0+IHBjaV9yZWxlYXNlX2RldmljZXMoKQo+
ICAgICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKPiAgICAgICAgICAgLT4gcGlycV9ndWVz
dF91bmJpbmQoKQo+ICAgICAgICAgICAgIC0+IF9fcGlycV9ndWVzdF91bmJpbmQoKQo+IAo+IEZv
ciBhIHNoYXJlZCBwaXJxIChucl9ndWVzdHMgPiAxKSwgdGhlIGZpcnN0IGNhbGwgd291bGQgemFw
IHRoZSBjdXJyZW50Cj4gZG9tYWluIGZyb20gdGhlIHBpcnEncyBndWVzdHNbXSBsaXN0LCBidXQg
dGhlIGFjdGlvbiBoYW5kbGVyIGlzIG5ldmVyIGZyZWVkCj4gYXMgdGhlcmUgYXJlIG90aGVyIGd1
ZXN0cyB1c2luZyB0aGlzIHBpcnEuIEFzIGEgcmVzdWx0LCBvbiB0aGUgc2Vjb25kIGNhbGwsCj4g
X19waXJxX2d1ZXN0X3VuYmluZCBzZWFyY2hlcyBmb3IgdGhlIGN1cnJlbnQgZG9tYWluIHdoaWNo
IGhhcyBiZWVuIHJlbW92ZWQKPiBmcm9tIHRoZSBndWVzdHNbXSBsaXN0LCBhbmQgaGl0cyBhIEJV
R19PTi4KClRoZXJlIG11c3QgYmUgbW9yZSB0byB0aGlzLCBzZWVpbmcgdGhlIGNsZWFudXBfZG9t
YWluX2lycV9waXJxKCkKaW52b2NhdGlvbiBhdCB0aGUgZW5kIG9mIHBpcnFfZ3Vlc3RfdW5iaW5k
KCksIHdoaWNoIG91Z2h0IHRvIGJlCnJlYWNoZWQgaW4gdGhlIGNhc2UgeW91IGRlc2NyaWJlLgoK
PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKPiBA
QCAtMTg2Myw3ICsxODYzLDE2IEBAIHN0YXRpYyBpcnFfZ3Vlc3RfYWN0aW9uX3QgKl9fcGlycV9n
dWVzdF91bmJpbmQoCj4gIAo+ICAgICAgZm9yICggaSA9IDA7IChpIDwgYWN0aW9uLT5ucl9ndWVz
dHMpICYmIChhY3Rpb24tPmd1ZXN0W2ldICE9IGQpOyBpKysgKQo+ICAgICAgICAgIGNvbnRpbnVl
Owo+IC0gICAgQlVHX09OKGkgPT0gYWN0aW9uLT5ucl9ndWVzdHMpOwo+ICsgICAgaWYgKCBpID09
IGFjdGlvbi0+bnJfZ3Vlc3RzICkgewoKQnJhY2Ugb24gaXRzIG93biBsaW5lIHBsZWFzZS4KCj4g
KyAgICAgICAgQVNTRVJUKGFjdGlvbi0+bnJfZ3Vlc3RzID4gMCkgOwoKU3RyYXkgYmxhbmsuCgo+
ICsgICAgICAgIC8qIEluIGNhc2UgdGhlIHBpcnEgd2FzIHNoYXJlZCwgdW5ib3VuZCBmb3IgdGhp
cyBkb21haW4gaW4gYW4gZWFybGllciBjYWxsLCBidXQgc3RpbGwKPiArICAgICAgICAgKiBleGlz
dGVkIG9uIHRoZSBkb21haW4ncyBwaXJxX3RyZWUsIHdlIHN0aWxsIHJlYWNoIGhlcmUgaWYgdGhl
cmUgYXJlIGFueSBsYXRlcgo+ICsgICAgICAgICAqIHVuYmluZCBjYWxscyBvbiB0aGUgc2FtZSBw
aXJxLiBSZXR1cm4gaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVucy4gKi8KPiArICAgICAgICBpZiAo
IGFjdGlvbi0+c2hhcmVhYmxlICkKCkxvbmcgbGluZXMgYW5kIG1hbGZvcm1lZCBjb21tZW50LgoK
RG8geW91IHBlcmhhcHMgYWxzbyB3YW50IHRvIGNoZWNrIHRoYXQgeW91IHRha2UgdGhpcyBwYXRo
IG9ubHkKZm9yIGR5aW5nIGd1ZXN0cz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
