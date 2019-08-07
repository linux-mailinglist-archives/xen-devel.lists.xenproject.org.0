Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE584901
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 11:58:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvIfo-0001KV-7l; Wed, 07 Aug 2019 09:56:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvIfm-0001KQ-Me
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:55:58 +0000
X-Inumbo-ID: 8b8b1c3e-b8f9-11e9-8705-677071ecc80e
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b8b1c3e-b8f9-11e9-8705-677071ecc80e;
 Wed, 07 Aug 2019 09:55:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FE3AADCB;
 Wed,  7 Aug 2019 09:55:53 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-3-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d96b7a8b-4668-576f-84d2-e0a382d86c87@suse.com>
Date: Wed, 7 Aug 2019 11:55:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730134419.2739-3-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/6] use is_iommu_enabled() where
 appropriate...
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
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDcuMjAxOSAxNTo0NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L2FybS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+IEBAIC0xNTMxLDggKzE1MzEs
NyBAQCBpbnQgcDJtX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgICAgKiBzaGFyZWQgd2l0
aCB0aGUgQ1BVLCBYZW4gaGFzIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBQVCBjaGFuZ2VzIGhhdmUK
PiAgICAgICAgKiByZWFjaGVkIHRoZSBtZW1vcnkKPiAgICAgICAgKi8KPiAtICAgIHAybS0+Y2xl
YW5fcHRlID0gaW9tbXVfZW5hYmxlZCAmJgo+IC0gICAgICAgICFpb21tdV9oYXNfZmVhdHVyZShk
LCBJT01NVV9GRUFUX0NPSEVSRU5UX1dBTEspOwo+ICsgICAgcDJtLT5jbGVhbl9wdGUgPSAhaW9t
bXVfaGFzX2ZlYXR1cmUoZCwgSU9NTVVfRkVBVF9DT0hFUkVOVF9XQUxLKTsKCkkgY2FuJ3QgdGVs
bCBpZiB0aGUgb3JpZ2luYWwgY29kZSB3YXMgbWVhbnQgdG8gYmUgdGhpcyB3YXksIGJ1dCBJJ20K
YWZyYWlkIHlvdXIgdHJhbnNmb3JtYXRpb24gaXMgbm90IGNvcnJlY3Q6IFRoZSBwcmlvciBjb25z
dHJ1Y3QsCmV4cGFuZGluZyBpb21tdV9oYXNfZmVhdHVyZSgpLCB3YXMKCmlvbW11X2VuYWJsZWQg
JiYgIShpb21tdV9lbmFibGVkICYmIHRlc3RfYml0KGZlYXR1cmUsIGRvbV9pb21tdShkKS0+ZmVh
dHVyZXMpKQoKd2hpY2ggdHJhbnNmb3JtcyB0aHJvdWdoCgppb21tdV9lbmFibGVkICYmICghaW9t
bXVfZW5hYmxlZCB8fCAhdGVzdF9iaXQoZmVhdHVyZSwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykp
Cgp0bwoKKGlvbW11X2VuYWJsZWQgJiYgIWlvbW11X2VuYWJsZWQpIHx8IChpb21tdV9lbmFibGVk
ICYmICF0ZXN0X2JpdChmZWF0dXJlLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKSkKCmFuZCBoZW5j
ZQoKaW9tbXVfZW5hYmxlZCAmJiAhdGVzdF9iaXQoZmVhdHVyZSwgZG9tX2lvbW11KGQpLT5mZWF0
dXJlcykKCndoZXJlYXMgdGhlIG5ldyBjb2RlIHNpbXBseSBpcwoKIShpb21tdV9lbmFibGVkICYm
IHRlc3RfYml0KGZlYXR1cmUsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpKQoKaS5lLgoKIWlvbW11
X2VuYWJsZWQgfHwgIXRlc3RfYml0KGZlYXR1cmUsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpCgo+
IEBAIC03NjYsNyArNzY2LDcgQEAgZXB0X3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
LCBnZm5fdCBnZm5fLCBtZm5fdCBtZm4sCj4gICAgICAgICAgIG5ld19lbnRyeS5zcCA9ICEhaTsK
PiAgICAgICAgICAgbmV3X2VudHJ5LnNhX3AybXQgPSBwMm10Owo+ICAgICAgICAgICBuZXdfZW50
cnkuYWNjZXNzID0gcDJtYTsKPiAtICAgICAgICBuZXdfZW50cnkuc25wID0gKGlvbW11X2VuYWJs
ZWQgJiYgaW9tbXVfc25vb3ApOwo+ICsgICAgICAgIG5ld19lbnRyeS5zbnAgPSBpc19pb21tdV9l
bmFibGVkKHAybS0+ZG9tYWluKSAmJiBpb21tdV9zbm9vcDsKClBsZWFzZSB1c2UgZCBoZXJlLgoK
U2VlaW5nIHRoYXQgdGhpcyBpcyB0aGUgbGFzdCBjaGFuZ2UgaW4geDg2L21tLywgZGlkIHlvdSBv
dmVybG9vawp0aGUgdXNlIGluIHAybV9wdF9zZXRfZW50cnkoKT8gT3IgaXMgdGhpcyBtZWFudCB0
byBnbyBvbiB0b3Agb2YKQWxleGFuZHJ1J3MgIng4Ni9tbTogQ2xlYW4gSU9NTVUgZmxhZ3MgZnJv
bSBwMm0tcHQgY29kZSIgKHdoaWNoCnNob3VsZCB0aGVuIGJlIG5vdGVkIGluIGEgcG9zdC1jb21t
aXQtbWVzc2FnZSByZW1hcmspPwoKPiBAQCAtNTU2LDcgKzU1Niw3IEBAIGludCBpb21tdV9kb19k
b21jdGwoCj4gICB7Cj4gICAgICAgaW50IHJldCA9IC1FTk9ERVY7Cj4gICAKPiAtICAgIGlmICgg
IWlvbW11X2VuYWJsZWQgKQo+ICsgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCj4gICAg
ICAgICAgIHJldHVybiAtRU5PU1lTOwoKRU5PU1lTIHdhcyB3cm9uZyBoZXJlIGZyb20gdGhlIGJl
Z2lubmluZywgYnV0IGl0IGNlcnRhaW5seSBnZXRzCndvcnNlIHdpdGggdGhpcyBubyBsb25nZXIg
YmVpbmcgYSBzeXN0ZW0gd2lkZSBwcm9wZXJ0eS4gUGxlYXNlCmNoYW5nZSB0byBFT1BOT1RTVVBQ
IG9yIHNvbWUgb3RoZXIgc3VpdGFibGUgb25lLgoKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gQEAgLTg2
NCw3ICs4NjQsNyBAQCBzdGF0aWMgaW50IHBjaV9jbGVhbl9kcGNpX2lycXMoc3RydWN0IGRvbWFp
biAqZCkKCkFib3ZlIGhlcmUgdGhlcmUncyBhbm90aGVyIHVzZSBpbiBwY2lfZW5hYmxlX2Fjcygp
LCB3aGljaCBzaG91bGQKaW1vIGFjdCBvbiBwZGV2LT5kb21haW4uCgpUaGVyZSdzIGFub3RoZXIg
dXNlIGluIGZsYXNrX2lvbW11X3Jlc291cmNlX3VzZV9wZXJtKCkuIEFsbApjYWxsZXJzIG9mIHRo
ZSBmdW5jdGlvbiBob2xkIGEgc3RydWN0IGRvbWFpbiAqIGluIHRoZWlyIGhhbmRzLAp3aGljaCBJ
IHRoaW5rIHRoZXkgc2hvdWxkIHBhc3MgaW50byB0aGlzIGZ1bmN0aW9uIHN1Y2ggdGhhdCB0aGUK
Y29uZGl0aW9uYWwgY2FuIGJlIHJlcGxhY2VkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
