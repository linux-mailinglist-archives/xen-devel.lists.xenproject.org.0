Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC7B47B0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA7HS-0005Mo-4U; Tue, 17 Sep 2019 06:48:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA7HP-0005MO-Sy
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 06:48:03 +0000
X-Inumbo-ID: 17a1854a-d917-11e9-9602-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17a1854a-d917-11e9-9602-12813bfff9fa;
 Tue, 17 Sep 2019 06:48:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2BDB6AE96;
 Tue, 17 Sep 2019 06:48:01 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
Date: Tue, 17 Sep 2019 08:48:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAwMDoyMCwgSm9lIEppbiB3cm90ZToKPiBPbiA5LzE2LzE5IDE6MDEgQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMy4wOS4yMDE5IDE4OjM4LCBKb2UgSmluIHdyb3Rl
Ogo+Pj4gT24gOS8xMy8xOSAxMjoxNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIu
MDkuMjAxOSAyMDowMywgSm9lIEppbiB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW8uYwo+Pj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCj4+
Pj4+IEBAIC00MTIsNiArNDEyLDkgQEAgaW50IHB0X2lycV9jcmVhdGVfYmluZCgKPj4+Pj4gICAg
ICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ3ZlYyA9IHB0X2lycV9iaW5kLT51Lm1zaS5n
dmVjOwo+Pj4+PiAgICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5nZmxhZ3MgPSBnZmxh
Z3M7Cj4+Pj4+ICAgICAgICAgICAgICB9Cj4+Pj4+ICsKPj4+Pj4gKyAgICAgICAgICAgIGlmICgg
aHZtX2Z1bmNzLnN5bmNfcGlyX3RvX2lyciApCj4+Pj4+ICsgICAgICAgICAgICAgICAgaHZtX2Z1
bmNzLnN5bmNfcGlyX3RvX2lycihkLT52Y3B1W3BpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWRd
KTsKPj4+Pgo+Pj4+IElmIHRoZSBuZWVkIGZvciB0aGlzIGNoYW5nZSBjYW4gYmUgcHJvcGVybHkg
ZXhwbGFpbmVkLCB0aGVuIGl0Cj4+Pj4gc3RpbGwgd2FudHMgY29udmVydGluZyB0byBhbHRlcm5h
dGl2ZV92Y2FsbCgpIC0gdGhlIHRoZSBvdGhlcgo+Pj4+IGNhbGxlciBvZiB0aGlzIGhvb2suIE9y
IHBlcmhhcHMgZXZlbiBiZXR0ZXIgbW92ZSB2bGFwaWMuYydzCj4+Pj4gd3JhcHBlciAoc3VpdGFi
bHkgcmVuYW1lZCkgaW50byBodm0uaCwgYW5kIHVzZSBpdCBoZXJlLgo+Pj4KPj4+IFllcyBJIGFn
cmVlLCBJJ20gbm90IDEwMCUgc3VyZSwgc28gSSBzZXQgaXQgdG8gUkZDLgo+Pgo+PiBBbmQgYnR3
LCBwbGVhc2UgYWxzbyBhdHRhY2ggYSBicmllZiBjb21tZW50IGhlcmUsIHRvIGNsYXJpZnkKPj4g
d2h5IHRoZSBzeW5jaW5nIGlzIG5lZWRlZCBwcmVjaXNlbHkgYXQgdGhpcyBwb2ludC4KPj4KPj4+
PiBBZGRpdGlvbmFsbHksIHRoZSBjb2RlIHNldHRpbmcgcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNw
dV9pZAo+Pj4+IChyaWdodCBhZnRlciB5b3VyIGNvZGUgaW5zZXJ0aW9uKSBhbGxvd3MgZm9yIHRo
ZSBmaWVsZCB0byBiZQo+Pj4+IGludmFsaWQsIHdoaWNoIEkgdGhpbmsgeW91IG5lZWQgdG8gZ3Vh
cmQgYWdhaW5zdC4KPj4+Cj4+PiBJIHRoaW5rIHlvdSBtZWFucyBtdWx0aXBsZSBkZXN0aW5hdGlv
biwgdGhlbiBpdCdzIC0xPwo+Pgo+PiBUaGUgcmVhc29uIGZvciB3aHkgaXQgbWlnaHQgYmUgLTEg
YXJlIGlycmVsZXZhbnQgaGVyZSwgSSB0aGluay4KPj4gWW91IG5lZWQgdG8gaGFuZGxlIHRoZSBj
YXNlIGJvdGggdG8gYXZvaWQgYW4gb3V0LW9mLWJvdW5kcwo+PiBhcnJheSBhY2Nlc3MgYW5kIHRv
IG1ha2Ugc3VyZSBhbiBJUlIgYml0IHdvdWxkbid0IHN0aWxsIGdldAo+PiBwcm9wYWdhdGVkIHRv
byBsYXRlIGluIHNvbWUgc3BlY2lhbCBjYXNlLgo+IAo+IEFkZCBmb2xsb3dpbmcgY2hlY2tzPwo+
ICAgICAgICAgICAgIGlmICggZGVzdF92Y3B1X2lkID49IDAgJiYgZGVzdF92Y3B1X2lkIDwgZC0+
bWF4X3ZjcHVzICYmCj4gICAgICAgICAgICAgICAgICBkLT52Y3B1W2Rlc3RfdmNwdV9pZF0tPnJ1
bnN0YXRlLnN0YXRlIDw9IFJVTlNUQVRFX2Jsb2NrZWQgKQoKSnVzdCB0aGUgPj0gcGFydCBzaG91
bGQgc3VmZmljZTsgd2l0aG91dCBhbiBleHBsYW5hdGlvbiBJIGRvbid0CnNlZSB3aHkgeW91IHdh
bnQgdGhlIHJ1bnN0YXRlIGNoZWNrICh3aGljaCBhZnRlciBhbGwgaXMgcmFjeQphbnl3YXkgYWZh
aWN0KS4KCj4+IEFsc28gLSB3aGF0IGFib3V0IHRoZSByZXNwZWN0aXZlIG90aGVyIHBhdGggaW4g
dGhlIGZ1bmN0aW9uLAo+PiBkZWFsaW5nIHdpdGggUFRfSVJRX1RZUEVfUENJIGFuZCBQVF9JUlFf
VFlQRV9NU0lfVFJBTlNMQVRFPyBJdAo+PiBzZWVtcyB0byBtZSB0aGF0IHRoZXJlJ3MgdGhlIHNh
bWUgY2hhbmNlIG9mIGRlZmVycmluZyBJUlIKPj4gcHJvcGFnYXRpb24gZm9yIHRvbyBsb25nPwo+
IAo+IFRoaXMgaXMgcG9zc2libGUsIGNhbiB5b3UgcGxlYXNlIGhlbHAgb24gaG93IHRvIGdldCB3
aGljaCB2Y3B1IGFzc29jaWF0ZSB0aGUgSVJRPwo+IEkgZGlkIG5vdCBmb3VuZCBhbnkgaGVscGVy
IG9uIGN1cnJlbnQgWGVuLgoKVGhlcmUncyBubyBzdWNoIGhlbHBlciwgSSdtIGFmcmFpZC4gTG9v
a2luZyBhdCBodm1fbWlncmF0ZV9waXJxKCkKYW5kIGh2bV9naXJxX2Rlc3RfMl92Y3B1X2lkKCkg
SSBub3RpY2UgdGhhdCB0aGUgZm9ybWVyIGRvZXMgbm90aGluZwppZiBwaXJxX2RwY2ktPmdtc2ku
cG9zdGVkIGlzIHNldC4gSGVuY2UgcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZAppc24ndCBy
ZWFsbHkgdXNlZCBpbiB0aGlzIGNhc2UgKHBsZWFzZSBkb3VibGUgY2hlY2spLCBhbmQgc28geW91
IG1heQp3YW50IHRvIHVwZGF0ZSB0aGUgZmllbGQgYWxvbmdzaWRlIHNldHRpbmcgcGlycV9kcGNp
LT5nbXNpLnBvc3RlZCBpbgpwdF9pcnFfY3JlYXRlX2JpbmQoKSwgY292ZXJpbmcgdGhlIG11bHRp
IGRlc3RpbmF0aW9uIGNhc2UuCgpZb3VyIGNvZGUgYWRkaXRpb24gc3RpbGwgdmlzaWJsZSBpbiBj
b250ZXh0IGFib3ZlIG1heSB0aGVuIHdhbnQgdG8KYmUgZnVydGhlciBjb25kaXRpb25hbGl6ZWQg
dXBvbiBpb21tdV9pbnRwb3N0IG9yIChwZXJoYXBzIGJldHRlcikKcGlycV9kcGNpLT5nbXNpLnBv
c3RlZCBiZWluZyBzZXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
