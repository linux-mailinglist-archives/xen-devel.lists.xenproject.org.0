Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4097BC88
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 11:04:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hskUk-0007es-4h; Wed, 31 Jul 2019 09:02:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QWEJ=V4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hskUj-0007en-3P
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 09:02:01 +0000
X-Inumbo-ID: d8dbb0b2-b371-11e9-b8c1-b74b8233c76a
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8dbb0b2-b371-11e9-b8c1-b74b8233c76a;
 Wed, 31 Jul 2019 09:01:56 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mQzaQl1KGXrQ0AWJY3MKkhrEL46tZCW2TIyw93knk2WA73JfGJmpgj9s4aVgx92xKjnnJPOVpR
 YX+vP2KTnkqwcdtAzrqg3jwRxaWygBkYhQdfjUGA4zUSbJIcM9oAbLKvX+1Tk+Yr81iYuaOaXX
 2TCJwg+QcBRu2Da7U00SXGekqBmIGzYE+txlx9U4V9Hm6pL4PMnnKdfrZFdnjz/ejUcQOI3O0i
 87Hy73Y6LVM/zZ5XvV/DwdYWSkl4XBl4T4V8tB4Ui5+33KAyftkWOVzXuDT0/y4B2ww1QtmGCh
 CiE=
X-SBRS: 2.7
X-MesageID: 3669214
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,329,1559534400"; 
   d="scan'208";a="3669214"
To: Jan Beulich <JBeulich@suse.com>
References: <20190729121204.13559-1-andrew.cooper3@citrix.com>
 <20190729121204.13559-2-andrew.cooper3@citrix.com>
 <d3179354-a1c3-6e67-8f4e-821878f80a14@suse.com>
 <05d466ab-1d28-a369-331e-350f09464f37@citrix.com>
 <bfc30841-2582-15e6-0e4f-96b47c514f3b@suse.com>
 <7675f6e9-fd42-6e81-bf35-3dd499270413@citrix.com>
 <ac27eae2-4de6-d81f-bf82-3ab519cfbc2b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <741b9632-b687-8cb8-deae-653ef1e82b15@citrix.com>
Date: Wed, 31 Jul 2019 10:01:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ac27eae2-4de6-d81f-bf82-3ab519cfbc2b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 01/10] page-alloc: Clamp get_free_buddy()
 to online nodes
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMDcvMjAxOSAwOToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMDcuMjAxOSAx
OTozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMzAvMDcvMjAxOSAwOTowOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyOS4wNy4yMDE5IDE5OjI2LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDI5LzA3LzIwMTkgMTY6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAy
OS4wNy4yMDE5IDE0OjExLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gKyAgICBpZiAoIGQg
KQo+Pj4+Pj4gKyAgICAgICAgbm9kZXNfYW5kKG5vZGVtYXNrLCBub2RlbWFzaywgZC0+bm9kZV9h
ZmZpbml0eSk7Cj4+Pj4+IERlc3BpdGUgbXkgZWFybGllciBhY2s6IENvZGUgZnVydGhlciBkb3du
IGFzc3VtZXMgYSBub24tZW1wdHkgbWFzaywKPj4+Pj4gd2hpY2ggaXMgbm8gbG9uZ2VyIGd1YXJh
bnRlZWQgYWZhaWNzLgo+Pj4+IE5vdGhpbmcgcHJldmlvdXMgZ3VhcmFudGVlZCB0aGF0IGQtPm5v
ZGVfYWZmaW5pdHkgaGFkIGFueSBiaXRzIHNldCBpbgo+Pj4+IGl0LCBlaXRoZXIuCj4+Pj4KPj4+
PiBUaGF0IHNhaWQsIGluIHByYWN0aWNlIGl0IGlzIGVpdGhlciBBTEwsIG9yIHNvbWV0aGluZyBk
ZXJpdmVkIGZyb20gdGhlCj4+Pj4gY3B1PT5ub2RlIG1hcHBpbmdzLCBzbyBJIGRvbid0IHRoaW5r
IHRoaXMgaXMgYSBwcm9ibGVtIGluIHByYWN0aWNlLgo+Pj4+Cj4+Pj4+IEkgdGhpbmsgeW91IHdh
bnQgdG8gYXBwZW5kIGFuCj4+Pj4+ICJpbnRlcnNlY3RzIiBjaGVjayBpbiB0aGUgaWYoKS4KPj4+
PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBhc3NlcnQgdGhhdCBjYWxsZXJzIGRvbid0
IGdpdmUgdXMgY29tcGxldGUKPj4+PiBqdW5rLgo+Pj4+Cj4+Pj4+IFdpdGggdGhhdCBmZWVsIGZy
ZWUgdG8gcHJvbW90ZSBteQo+Pj4+PiBBLWIgdG8gUi1iLgo+Pj4+IEhvdyBhYm91dDoKPj4+Pgo+
Pj4+ICAgwqDCoMKgIGlmICggZCApCj4+Pj4gICDCoMKgwqAgewo+Pj4+ICAgwqDCoMKgwqDCoMKg
wqAgaWYgKCBub2Rlc19pbnRlcnNlY3Qobm9kZW1hc2ssIGQtPm5vZGVfYWZmaW5pdHkpICkKPj4+
PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZXNfYW5kKG5vZGVtYXNrLCBub2RlbWFzaywg
ZC0+bm9kZV9hZmZpbml0eSk7Cj4+Pj4gICDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4gICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+Pj4+ICAgwqDCoMKgIH0K
Pj4+Pgo+Pj4+ID8KPj4+Pgo+Pj4+IFRoaXMgY2hhbmdlIGhhcyBwYXNzZWQgbXkgbm9ybWFsIHNl
dCBvZiBwcmVwdXNoIGNoZWNrcyAobm90IG5vdCB0aGF0Cj4+Pj4gdGhlcmUgaXMgYW55dGhpbmcg
aW50ZXJlc3RpbmcgTlVNQS13aXNlIGluIHRoZXJlKS4KPj4+IGRvbWFpbl91cGRhdGVfbm9kZV9h
ZmZpbml0eSgpIG1lYW5zIHRvIGd1YXJhbnRlZSBhIG5vbi1lbXB0eSBtYXNrIChieQo+Pj4gd2F5
IG9mIGEgc2ltaWxhciBhc3NlcnRpb24pLCB3aGVuIC0+YXV0b19ub2RlX2FmZmluaXR5IGlzIHNl
dC4gT3RvaAo+Pj4gZG9tYWluX3NldF9ub2RlX2FmZmluaXR5KCkgbWF5IGNsZWFyIHRoYXQgZmxh
ZywgYXQgd2hpY2ggcG9pbnQgSSBjYW4ndAo+Pj4gc2VlIHdoYXQgd291bGQgZ3VhcmFudGVlIHRo
YXQgdGhlIGludGVyc2VjdGlvbiB3b3VsZCByZW1haW4gbm9uLWVtcHR5Cj4+PiBhcyBDUFVzIGdl
dCBvZmZsaW5lZC4KPj4gSSBkb24ndCBzZWUgd2hhdCBDUFUgb2ZmbGluaW5nIGhhcyB0byBkbyB3
aXRoIGFueXRoaW5nLsKgIFRoZXJlIGlzIG5vCj4+IHN1Y2ggdGhpbmcgYXMgdGFraW5nIGEgbm9k
ZSBvdXQgb2YgdGhlIG5vZGVfb25saW5lX21hcCwgbm9yIHNob3VsZCB0aGVyZQo+PiBiZSAtIGV2
ZW4gaWYgd2Ugb2ZmbGluZSBhbiBlbnRpcmUgc29ja2V0J3Mgd29ydGggb2YgQ1BVcywgdGhlIG1l
bW9yeQo+PiBjb250cm9sbGVyIGlzIHN0aWxsIGFjdGl2ZSBhbmQgYXZhaWxhYmxlIGZvciB1c2Uu
Cj4+Cj4+IFRoZSBkb21haW4gYWx3YXlzIGhhcyBub24temVybyB2Q1BVcywgd2hpY2ggd2lsbCBh
bHdheXMgcmVzdWx0IGluIGFuCj4+IGludGVyc2VjdGlvbiB3aXRoIG5vZGVfb25saW5lX21hcC4K
PiBPaCwgcmlnaHQgLSBJIGZvcmdvdCB0aGF0IHdlIChhbG1vc3QpIG5ldmVyIGNsZWFyIGJpdHMg
ZnJvbQo+IG5vZGVfb25saW5lX21hcC4gVGhlcmUncyBvbmUgdXNlIG9mIG5vZGVfc2V0X29mZmxp
bmUoKSBpbgo+IG1lbW9yeV9hZGQoKSAtIEkgd29uZGVyIHdoZXRoZXIgd2Ugc2hvdWxkbid0IGRp
dGNoCj4gbm9kZV9zZXRfb2ZmbGluZSgpIHRvIG1ha2UgbW9yZSB2aXNpYmxlIHRoYXQgd2UgZG9u
J3QgbWVhbgo+IHRvIGV2ZXIgY2xlYXIgYml0cyB0aGVyZS4KPgo+PiBXaGF0IGlzIGEgcHJvYmxl
bSBpcyBYRU5fRE9NQ1RMX3NldG5vZGVhZmZpbml0eSBiZWluZyBjYWxsZWQgd2l0aCBub2RlCj4+
IG1hc2sgd2hpY2ggaXMgZGlzam9pbnQgdG8gbm9kZV9vbmxpbmVfbWFwIHRvIGJlZ2luIHdpdGgu
Cj4+Cj4+IFRoaXMgcHJvYmxlbWF0aWMgYmVoYXZpb3VyIGFscmVhZHkgZXhpc3RzIHRvZGF5LCBh
bmQgSSBiZXQgdGhlcmUgaXMgYQo+PiBsb3Qgb2YgZnVuIHRvIGhhZCB3aXRoIHRoYXQgaHlwZXJj
YWxsLgo+Pgo+PiBBcyBhIGZpcnN0IHBhc3MsCj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwo+PiBpbmRleCA5YWVmYzJhNjgwLi41N2M4
NGNkYzQyIDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4+ICsrKyBiL3hlbi9j
b21tb24vZG9tYWluLmMKPj4gQEAgLTYzMSw4ICs2MzEsOSBAQCB2b2lkIGRvbWFpbl91cGRhdGVf
bm9kZV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQo+PiAgIAo+PiAgwqBpbnQgZG9tYWluX3Nl
dF9ub2RlX2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IG5vZGVtYXNrX3QgKmFmZmlu
aXR5KQo+PiAgwqB7Cj4+IC3CoMKgwqAgLyogQmVpbmcgYWZmaW5lIHdpdGggbm8gbm9kZXMgaXMg
anVzdCB3cm9uZyAqLwo+PiAtwqDCoMKgIGlmICggbm9kZXNfZW1wdHkoKmFmZmluaXR5KSApCj4+
ICvCoMKgwqAgLyogQmVpbmcgYWZmaW5lIHdpdGggbm8gbm9kZXMsIG9yIGRpc2pvaW50IHdpdGgg
dGhlIHN5c3RlbSwgaXMgd3JvbmcuICovCj4+ICvCoMKgwqAgaWYgKCBub2Rlc19lbXB0eSgqYWZm
aW5pdHkpIHx8Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICFub2Rlc19pbnRlcnNlY3RzKCphZmZpbml0
eSwgbm9kZV9vbmxpbmVfbWFwKSApCj4+ICDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+IFJpZ2h0LCBhbmQgdGhlbiB5b3UgZG9uJ3QgbmVlZCB0aGUgbm9kZXNfZW1wdHkoKSBwYXJ0
IGFueW1vcmUuCgpHb29kIHBvaW50LgoKPiBXaXRoIHRoaXMgY2hhbmdlIGZvbGRlZCBpbiAob3Ig
YXMgYSBwcmVyZXEgb25lIHRvIGFsbG93IGJhY2twb3J0aW5nKSB5b3UKPiBjYW4gYWRkIG15IFIt
YiB3aXRoIHRoZSBhZGp1c3RtZW50IGZ1cnRoZXIgdXAgaW4gcGxhY2UuCgpJIHRoaW5rIEknbGwg
Zm9sZCBpdCB0b2dldGhlciBpbnRvIGEgc2luZ2xlIGNoYW5nZS7CoCBJdHMgZGlyZWN0bHkKcmVs
ZXZhbnQgdG8gdGhlIHN1YmplY3QuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
