Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90DAFFA0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:08:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84CC-0000DL-M7; Wed, 11 Sep 2019 15:06:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84CA-0000DC-Ie
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:06:10 +0000
X-Inumbo-ID: af918650-d4a5-11e9-83d7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af918650-d4a5-11e9-83d7-12813bfff9fa;
 Wed, 11 Sep 2019 15:06:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF209C012;
 Wed, 11 Sep 2019 15:06:08 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-14-jgross@suse.com>
 <cdd95d65-ce9d-4b8c-77fc-2386cf0e65c1@suse.com>
 <ea633104-55c3-ad8b-4afc-835744106d4e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38d6b58d-00e2-9d88-e8c2-7462d330e419@suse.com>
Date: Wed, 11 Sep 2019 17:06:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ea633104-55c3-ad8b-4afc-835744106d4e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 13/48] xen/sched: add is_running
 indicator to struct sched_unit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAxNTo0NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNC4wOS4xOSAx
NzowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gQEAgLTQwNyw2ICs0MDcsOCBAQCBpbnQgc2NoZWRfaW5p
dF92Y3B1KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQo+Pj4gICAgICAg
ewo+Pj4gICAgICAgICAgIGdldF9zY2hlZF9yZXModi0+cHJvY2Vzc29yKS0+Y3VyciA9IHVuaXQ7
Cj4+PiAgICAgICAgICAgdi0+aXNfcnVubmluZyA9IDE7Cj4+PiArICAgICAgICB1bml0LT5pc19y
dW5uaW5nID0gMTsKPj4+ICsgICAgICAgIHVuaXQtPnN0YXRlX2VudHJ5X3RpbWUgPSBOT1coKTsK
Pj4+ICAgICAgIH0KPj4+ICAgICAgIGVsc2UKPj4+ICAgICAgIHsKPj4KPj4gQXJlIGlkbGUgdkNQ
VS1zIGFsc28gZ29pbmcgdG8gZ2V0IGdyb3VwZWQgaW50byB1bml0cyAoSSdtIHNvcnJ5LAo+PiBJ
IGRvbid0IHJlY2FsbCk/IElmIHNvLCBqdXN0IGxpa2UgZnVydGhlciBkb3duIEknZCBiZSBwdXR0
aW5nCj4+IHVuZGVyIHF1ZXN0aW9uIHRoZSBtdWx0aXBsZSB3cml0aW5nIG9mIHRoZSBmaWVsZC4g
SSdkIGtpbmQgb2YKPj4gZXhwZWN0IHRoZSB1bml0IGFuZCBhbGwgdkNQVS1zIHdpdGhpbiBpdCB0
byBnZXQgYW4gaWRlbnRpY2FsCj4+IHN0YXRlIGVudHJ5IHRpbWUgc3RvcmVkLgo+IAo+IFdoZW4g
YW4gaWRsZSB2Y3B1IGlzIGJlaW5nIGNyZWF0ZWQgaXRzIGNwdSBpcyBpbiBubyBjcHVwb29sIHll
dAo+IChhIGZyZWUgY3B1KS4gVGhvc2UgY3B1cyBhcmUgYWx3YXlzIHN1YmplY3QgdG8gY3B1IHNj
aGVkdWxpbmcKPiAoZ3JhbnVsYXJpdHkgMSkuIE9ubHkgd2hlbiBjcHVzIGFyZSBwdXQgaW50byBh
IGNwdXBvb2wgdGhlCj4gZ3JhbnVsYXJpdHkgaXMgYWRqdXN0ZWQgYWNjb3JkaW5nbHkgYW5kIHRo
ZSBpZGxlLXZjcHVzIGFyZQo+IHBvc3NpYmx5IGdyb3VwZWQgaW4gdW5pdHMgKHNlZSBwYXRjaCA0
NSkuCj4gCj4gUmVnYXJkaW5nIHRoZSBzdGF0ZSBlbnRyeSB0aW1lOiBkaWZmZXJlbnQgdmNwdXMg
b2YgYSB1bml0IGNhbiBiZQo+IGluIGRpZmZlcmVudCBzdGF0ZXMgKGJsb2NrZWQvcnVubmluZywg
ZXRjLiksIHNvIHRoZWlyIHN0YXRlIGVudHJ5Cj4gdGltZXMgd2lsbCBnZW5lcmFsbHkgZGlmZmVy
LiBBIHVuaXQncyBzdGF0ZSBlbnRyeSB0aW1lIHdpbGwKPiByZWZsZWN0IGl0cyBzY2hlZHVsaW5n
IGV2ZW50cyAoYmVpbmcgc2NoZWR1bGVkL2Rlc2NoZWR1bGVkKS4KCkJ1dCB0aGlzIGRvZXNuJ3Qg
KHRvIG1lKSBjbGFyaWZ5IHdoZXRoZXIgdGhlIG11bHRpcGxlIHdyaXRpbmcKKG9uY2UgcGVyIHZD
UFUpIGlzIGFjdHVhbGx5IGNvcnJlY3QuIE9idmlvdXNseSB3aGV0aGVyIHRoaXMgaXMKbWVyZWx5
IGNvc21ldGljIGRlcGVuZHMgb24gd2hhdCB0aGUgY29uc3VtZXJzIG9mIHRoaXMgZGF0YSBhcmUu
Cgo+PiBBbHNvIGJvdGggaGVyZSBhbmQgZnVydGhlciBkb3duIEknbSBwdXp6bGVkIHRvIHNlZSB0
aGF0IHRoZQo+PiB1bml0J3MgZmllbGQgZG9lc24ndCBnZXQgc2V0IGF0IHRoZSBzYW1lIHBsYWNl
IGluIGNvZGUgd2hlcmUKPj4gdGhlIHZDUFUncyBmaWVsZCBnZXRzIHNldC4KPiAKPiBSaWdodC4g
VGhlIHN0YXRlcyBvZiBhIHZjcHUgYW5kIHRoZSB1bml0IGl0IGlzIGJlbG9uZ2luZyB0byBhcmUK
PiBjb3VwbGVkLCBidXQgbm90IGlkZW50aWNhbC4KCkFuZCB0aGlzIGlzIG5vdCAoZ29pbmcgdG8g
YmUpIGEgcHJvYmxlbT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
