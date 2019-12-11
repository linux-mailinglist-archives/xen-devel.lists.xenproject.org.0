Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED911B1B6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 16:32:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if3vH-0001PB-Uh; Wed, 11 Dec 2019 15:29:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1if3vG-0001P6-NK
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 15:29:06 +0000
X-Inumbo-ID: f7152640-1c2a-11ea-8b7d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7152640-1c2a-11ea-8b7d-12813bfff9fa;
 Wed, 11 Dec 2019 15:29:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C36D2B048;
 Wed, 11 Dec 2019 15:29:03 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1576061451.git.hongyxia@amazon.com>
 <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2472504-72f0-dd95-a804-1353f1ece6a4@suse.com>
Date: Wed, 11 Dec 2019 16:29:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAxMTo1OCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gbWFwX3BhZ2VzX3RvX3hl
biBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyBhcmUgcGVyZm9ybWluZyBhbG1vc3QgZXhhY3RseQo+
IHRoZSBzYW1lIG9wZXJhdGlvbnMgd2hlbiBzaGF0dGVyaW5nIGFuIGwzIFBURSwgdGhlIG9ubHkg
ZGlmZmVyZW5jZQo+IGJlaW5nIHdoZXRoZXIgd2Ugd2FudCB0byBmbHVzaC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3l4aWFAYW1hem9uLmNvbT4KPiAKPiAtLS0KPiBDaGFu
Z2VzIGluIHYzOgo+IC0gc3R5bGUgYW5kIGluZGVudGF0aW9uIGNoYW5nZXMuCj4gLSByZXR1cm4g
LUVOT01FTSBpbnN0ZWFkIG9mIC0xLgo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBpbXByb3ZlIGFz
bS4KPiAtIHJlLXJlYWQgcGwzZSBmcm9tIG1lbW9yeSB3aGVuIHRha2luZyB0aGUgbG9jay4KPiAt
IG1vdmUgdGhlIGFsbG9jYXRpb24gb2YgbDJ0IGluc2lkZSB0aGUgc2hhdHRlciBmdW5jdGlvbi4K
PiAtLS0KPiAgeGVuL2FyY2gveDg2L21tLmMgfCA5OCArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygr
KSwgNDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIv
eGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCA3ZDRkZDgwYTg1Li45N2YxMWI2MDE2IDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAt
NTE1MSw2ICs1MTUxLDUyIEBAIGwxX3BnZW50cnlfdCAqdmlydF90b194ZW5fbDFlKHVuc2lnbmVk
IGxvbmcgdikKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2FyZWFfbG9jYWwoKGNv
bnN0IHZvaWQgKil2LCBmKSA6IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2Fy
ZWFfYWxsKChjb25zdCB2b2lkICopdiwgZikpCj4gIAo+ICsvKiBTaGF0dGVyIGFuIGwzIGVudHJ5
IGFuZCBwb3B1bGF0ZSBsMi4gSWYgdmlydCBpcyBwYXNzZWQgaW4sIGFsc28gZG8gZmx1c2guICov
Cj4gK3N0YXRpYyBpbnQgc2hhdHRlcl9sM2UobDNfcGdlbnRyeV90ICpwbDNlLCB1bnNpZ25lZCBs
b25nIHZpcnQsIGJvb2wgbG9ja2luZykKPiArewo+ICsgICAgdW5zaWduZWQgaW50IGk7Cj4gKyAg
ICBsM19wZ2VudHJ5X3Qgb2wzZSA9ICpwbDNlOwo+ICsgICAgbDJfcGdlbnRyeV90IGwyZSA9IGwy
ZV9mcm9tX2ludHB0ZShsM2VfZ2V0X2ludHB0ZShvbDNlKSk7Cj4gKyAgICBsMl9wZ2VudHJ5X3Qg
KmwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPiArCj4gKyAgICBpZiAoICFsMnQgKQo+ICsg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsKPiArICAgIGZvciAoIGkgPSAwOyBpIDwgTDJfUEFH
RVRBQkxFX0VOVFJJRVM7IGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgbDJlX3dyaXRlKGwydCAr
IGksIGwyZSk7Cj4gKyAgICAgICAgbDJlID0gbDJlX2Zyb21faW50cHRlKAo+ICsgICAgICAgICAg
ICAgICAgICBsMmVfZ2V0X2ludHB0ZShsMmUpICsgKFBBR0VfU0laRSA8PCBQQUdFVEFCTEVfT1JE
RVIpKTsKCkFuZHJldyAtIGlpcmMgeW91IGhhZCBzdWdnZXN0ZWQgdGhpcyAoaW4gc29tZSBkaWZm
ZXJlbnQgZm9ybSwgYnV0CnRvIHRoZSBzYW1lIGVmZmVjdCkgdG8gaW1wcm92ZSBjb2RlIGdlbmVy
YXRpb24uIElmIHlvdSdyZSBjb252aW5jZWQKdGhhdCB0aGUgZG93bnNpZGUgb2YgdGhlIGxvc3Mg
b2YgdHlwZSBzYWZldHkgaXMgd29ydGggdGhlIHdpbiBpbgpnZW5lcmF0ZWQgY29kZSwgSSdtIG5v
dCBnb2luZyB0byBzdGFuZCBpbiB0aGUgd2F5IGhlcmUsIGJ1dCBpdCdsbAp0aGVuIG5lZWQgdG8g
YmUgeW91IHRvIGFjayB0aGVzZSB0d28gcGF0Y2hlcyBpbiB0aGVpciBldmVudHVhbGx5CmZpbmFs
IHNoYXBlLgoKPiArICAgIH0KPiArCj4gKyAgICBpZiAoIGxvY2tpbmcgKQo+ICsgICAgICAgIHNw
aW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOwo+ICsgICAgaWYgKCAobDNlX2dldF9mbGFncygqcGwz
ZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgo+ICsgICAgICAgICAobDNlX2dldF9mbGFncygqcGwzZSkg
JiBfUEFHRV9QU0UpICkKPiArICAgIHsKPiArICAgICAgICBsM2Vfd3JpdGVfYXRvbWljKHBsM2Us
Cj4gKyAgICAgICAgICAgIGwzZV9mcm9tX3BhZGRyKChwYWRkcl90KXZpcnRfdG9fbWFkZHIobDJ0
KSwgX19QQUdFX0hZUEVSVklTT1IpKTsKCldoeSB0aGUgY2FzdD8gKEknbSBzb3JyeSBpZiB0aGlz
IHdhcyB0aGVyZSBvbiB2MyBhbHJlYWR5IGFuZCBJCmRpZG4ndCBzcG90IGl0LiBBbmQgaWYgdGhp
cyByZW1haW5zIHRoZSBvbmx5IHRoaW5nIHRvIGFkanVzdCwKdGhlbiBJIGd1ZXNzIHRoaXMgY291
bGQgYmUgdGFrZW4gY2FyZSBvZiB3aGlsZSBjb21taXR0aW5nLikKCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
