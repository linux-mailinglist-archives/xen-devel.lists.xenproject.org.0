Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F4B7768
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 12:26:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAtbq-0003QI-Ty; Thu, 19 Sep 2019 10:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAtbo-0003QD-MV
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 10:24:20 +0000
X-Inumbo-ID: a3bb52d4-dac7-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3bb52d4-dac7-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 10:24:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2ABCAD63;
 Thu, 19 Sep 2019 10:24:18 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e75f5253-df1d-2d47-6724-df06d1a33448@suse.com>
Date: Thu, 19 Sep 2019 12:24:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
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

T24gMTguMDkuMjAxOSAyMzoxNiwgSm9lIEppbiB3cm90ZToKPiBPbiA5LzE2LzE5IDExOjQ4IFBN
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTcuMDkuMjAxOSAwMDoyMCwgSm9lIEppbiB3cm90
ZToKPj4+IE9uIDkvMTYvMTkgMTowMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTMu
MDkuMjAxOSAxODozOCwgSm9lIEppbiB3cm90ZToKPj4+Pj4gT24gOS8xMy8xOSAxMjoxNCBBTSwg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxMi4wOS4yMDE5IDIwOjAzLCBKb2UgSmluIHdy
b3RlOgo+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKPj4+Pj4+PiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCj4+Pj4+Pj4gQEAgLTQxMiw2ICs0MTIs
OSBAQCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcGly
cV9kcGNpLT5nbXNpLmd2ZWMgPSBwdF9pcnFfYmluZC0+dS5tc2kuZ3ZlYzsKPj4+Pj4+PiAgICAg
ICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5nZmxhZ3MgPSBnZmxhZ3M7Cj4+Pj4+Pj4gICAg
ICAgICAgICAgIH0KPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICAgICAgICAgIGlmICggaHZtX2Z1bmNz
LnN5bmNfcGlyX3RvX2lyciApCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICBodm1fZnVuY3Muc3lu
Y19waXJfdG9faXJyKGQtPnZjcHVbcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZF0pOwo+Pj4+
Pj4KPj4+Pj4+IElmIHRoZSBuZWVkIGZvciB0aGlzIGNoYW5nZSBjYW4gYmUgcHJvcGVybHkgZXhw
bGFpbmVkLCB0aGVuIGl0Cj4+Pj4+PiBzdGlsbCB3YW50cyBjb252ZXJ0aW5nIHRvIGFsdGVybmF0
aXZlX3ZjYWxsKCkgLSB0aGUgdGhlIG90aGVyCj4+Pj4+PiBjYWxsZXIgb2YgdGhpcyBob29rLiBP
ciBwZXJoYXBzIGV2ZW4gYmV0dGVyIG1vdmUgdmxhcGljLmMncwo+Pj4+Pj4gd3JhcHBlciAoc3Vp
dGFibHkgcmVuYW1lZCkgaW50byBodm0uaCwgYW5kIHVzZSBpdCBoZXJlLgo+Pj4+Pgo+Pj4+PiBZ
ZXMgSSBhZ3JlZSwgSSdtIG5vdCAxMDAlIHN1cmUsIHNvIEkgc2V0IGl0IHRvIFJGQy4KPj4+Pgo+
Pj4+IEFuZCBidHcsIHBsZWFzZSBhbHNvIGF0dGFjaCBhIGJyaWVmIGNvbW1lbnQgaGVyZSwgdG8g
Y2xhcmlmeQo+Pj4+IHdoeSB0aGUgc3luY2luZyBpcyBuZWVkZWQgcHJlY2lzZWx5IGF0IHRoaXMg
cG9pbnQuCj4+Pj4KPj4+Pj4+IEFkZGl0aW9uYWxseSwgdGhlIGNvZGUgc2V0dGluZyBwaXJxX2Rw
Y2ktPmdtc2kuZGVzdF92Y3B1X2lkCj4+Pj4+PiAocmlnaHQgYWZ0ZXIgeW91ciBjb2RlIGluc2Vy
dGlvbikgYWxsb3dzIGZvciB0aGUgZmllbGQgdG8gYmUKPj4+Pj4+IGludmFsaWQsIHdoaWNoIEkg
dGhpbmsgeW91IG5lZWQgdG8gZ3VhcmQgYWdhaW5zdC4KPj4+Pj4KPj4+Pj4gSSB0aGluayB5b3Ug
bWVhbnMgbXVsdGlwbGUgZGVzdGluYXRpb24sIHRoZW4gaXQncyAtMT8KPj4+Pgo+Pj4+IFRoZSBy
ZWFzb24gZm9yIHdoeSBpdCBtaWdodCBiZSAtMSBhcmUgaXJyZWxldmFudCBoZXJlLCBJIHRoaW5r
Lgo+Pj4+IFlvdSBuZWVkIHRvIGhhbmRsZSB0aGUgY2FzZSBib3RoIHRvIGF2b2lkIGFuIG91dC1v
Zi1ib3VuZHMKPj4+PiBhcnJheSBhY2Nlc3MgYW5kIHRvIG1ha2Ugc3VyZSBhbiBJUlIgYml0IHdv
dWxkbid0IHN0aWxsIGdldAo+Pj4+IHByb3BhZ2F0ZWQgdG9vIGxhdGUgaW4gc29tZSBzcGVjaWFs
IGNhc2UuCj4+Pgo+Pj4gQWRkIGZvbGxvd2luZyBjaGVja3M/Cj4+PiAgICAgICAgICAgICBpZiAo
IGRlc3RfdmNwdV9pZCA+PSAwICYmIGRlc3RfdmNwdV9pZCA8IGQtPm1heF92Y3B1cyAmJgo+Pj4g
ICAgICAgICAgICAgICAgICBkLT52Y3B1W2Rlc3RfdmNwdV9pZF0tPnJ1bnN0YXRlLnN0YXRlIDw9
IFJVTlNUQVRFX2Jsb2NrZWQgKQo+Pgo+PiBKdXN0IHRoZSA+PSBwYXJ0IHNob3VsZCBzdWZmaWNl
OyB3aXRob3V0IGFuIGV4cGxhbmF0aW9uIEkgZG9uJ3QKPj4gc2VlIHdoeSB5b3Ugd2FudCB0aGUg
cnVuc3RhdGUgY2hlY2sgKHdoaWNoIGFmdGVyIGFsbCBpcyByYWN5Cj4+IGFueXdheSBhZmFpY3Qp
Lgo+Pgo+Pj4+IEFsc28gLSB3aGF0IGFib3V0IHRoZSByZXNwZWN0aXZlIG90aGVyIHBhdGggaW4g
dGhlIGZ1bmN0aW9uLAo+Pj4+IGRlYWxpbmcgd2l0aCBQVF9JUlFfVFlQRV9QQ0kgYW5kIFBUX0lS
UV9UWVBFX01TSV9UUkFOU0xBVEU/IEl0Cj4+Pj4gc2VlbXMgdG8gbWUgdGhhdCB0aGVyZSdzIHRo
ZSBzYW1lIGNoYW5jZSBvZiBkZWZlcnJpbmcgSVJSCj4+Pj4gcHJvcGFnYXRpb24gZm9yIHRvbyBs
b25nPwo+Pj4KPj4+IFRoaXMgaXMgcG9zc2libGUsIGNhbiB5b3UgcGxlYXNlIGhlbHAgb24gaG93
IHRvIGdldCB3aGljaCB2Y3B1IGFzc29jaWF0ZSB0aGUgSVJRPwo+Pj4gSSBkaWQgbm90IGZvdW5k
IGFueSBoZWxwZXIgb24gY3VycmVudCBYZW4uCj4+Cj4+IFRoZXJlJ3Mgbm8gc3VjaCBoZWxwZXIs
IEknbSBhZnJhaWQuIExvb2tpbmcgYXQgaHZtX21pZ3JhdGVfcGlycSgpCj4+IGFuZCBodm1fZ2ly
cV9kZXN0XzJfdmNwdV9pZCgpIEkgbm90aWNlIHRoYXQgdGhlIGZvcm1lciBkb2VzIG5vdGhpbmcK
Pj4gaWYgcGlycV9kcGNpLT5nbXNpLnBvc3RlZCBpcyBzZXQuIEhlbmNlIHBpcnFfZHBjaS0+Z21z
aS5kZXN0X3ZjcHVfaWQKPj4gaXNuJ3QgcmVhbGx5IHVzZWQgaW4gdGhpcyBjYXNlIChwbGVhc2Ug
ZG91YmxlIGNoZWNrKSwgYW5kIHNvIHlvdSBtYXkKPj4gd2FudCB0byB1cGRhdGUgdGhlIGZpZWxk
IGFsb25nc2lkZSBzZXR0aW5nIHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgaW4KPj4gcHRfaXJxX2Ny
ZWF0ZV9iaW5kKCksIGNvdmVyaW5nIHRoZSBtdWx0aSBkZXN0aW5hdGlvbiBjYXNlLgo+Pgo+PiBZ
b3VyIGNvZGUgYWRkaXRpb24gc3RpbGwgdmlzaWJsZSBpbiBjb250ZXh0IGFib3ZlIG1heSB0aGVu
IHdhbnQgdG8KPj4gYmUgZnVydGhlciBjb25kaXRpb25hbGl6ZWQgdXBvbiBpb21tdV9pbnRwb3N0
IG9yIChwZXJoYXBzIGJldHRlcikKPj4gcGlycV9kcGNpLT5nbXNpLnBvc3RlZCBiZWluZyBzZXQu
Cj4+Cj4gCj4gU29ycnkgdGhpcyBpcyBuZXcgdG8gbWUsIGFuZCBJIGhhdmUgdG8gc3R1ZHkgZnJv
bSBjb2RlLgo+IERvIHlvdSB0aGluayBiZWxvdyBjaGVjayBjb3ZlciBhbGwgY29uZGl0aW9ucz8K
CkkgZG9lcyBhZmFpY3Q7IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gY2hlY2sgYm90aCBpb21t
dV9pbnRwb3N0IGFuZApwaXJxX2RwY2ktPmdtc2kucG9zdGVkIC0ganVzdCB0aGUgbGF0dGVyIG91
Z2h0IHRvIGJlIGVub3VnaC4gV2hhdCdzCnN0aWxsIG1pc3NpbmcgaXMgdGhlIGZ1cnRoZXIgdXBk
YXRpbmcgb2YgcGlycV9kcGNpLT5nbXNpLmRlc3RfdmNwdV9pZAooYXMgZXhwbGFpbmVkIGJlZm9y
ZSwgc3RpbGwgdmlzaWJsZSBpbiBjb250ZXh0IGFib3ZlKS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
