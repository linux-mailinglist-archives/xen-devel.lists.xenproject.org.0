Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A34B002D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:35:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84bq-00043z-Cw; Wed, 11 Sep 2019 15:32:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i84bo-00043m-Di
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:32:40 +0000
X-Inumbo-ID: 62750911-d4a9-11e9-83d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62750911-d4a9-11e9-83d9-12813bfff9fa;
 Wed, 11 Sep 2019 15:32:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 449F3AFB4;
 Wed, 11 Sep 2019 15:32:38 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-14-jgross@suse.com>
 <cdd95d65-ce9d-4b8c-77fc-2386cf0e65c1@suse.com>
 <ea633104-55c3-ad8b-4afc-835744106d4e@suse.com>
 <38d6b58d-00e2-9d88-e8c2-7462d330e419@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8b3ce480-622e-d880-5ecc-2b8ce4fd1e42@suse.com>
Date: Wed, 11 Sep 2019 17:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <38d6b58d-00e2-9d88-e8c2-7462d330e419@suse.com>
Content-Language: de-DE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTc6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMTU6
NDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA0LjA5LjE5IDE3OjA2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA5LjA4LjIwMTkgMTY6NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4+Pj4gQEAgLTQwNyw2ICs0MDcsOCBAQCBpbnQgc2NoZWRfaW5pdF92Y3B1KHN0cnVj
dCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQo+Pj4+ICAgICAgICB7Cj4+Pj4gICAg
ICAgICAgICBnZXRfc2NoZWRfcmVzKHYtPnByb2Nlc3NvciktPmN1cnIgPSB1bml0Owo+Pj4+ICAg
ICAgICAgICAgdi0+aXNfcnVubmluZyA9IDE7Cj4+Pj4gKyAgICAgICAgdW5pdC0+aXNfcnVubmlu
ZyA9IDE7Cj4+Pj4gKyAgICAgICAgdW5pdC0+c3RhdGVfZW50cnlfdGltZSA9IE5PVygpOwo+Pj4+
ICAgICAgICB9Cj4+Pj4gICAgICAgIGVsc2UKPj4+PiAgICAgICAgewo+Pj4KPj4+IEFyZSBpZGxl
IHZDUFUtcyBhbHNvIGdvaW5nIHRvIGdldCBncm91cGVkIGludG8gdW5pdHMgKEknbSBzb3JyeSwK
Pj4+IEkgZG9uJ3QgcmVjYWxsKT8gSWYgc28sIGp1c3QgbGlrZSBmdXJ0aGVyIGRvd24gSSdkIGJl
IHB1dHRpbmcKPj4+IHVuZGVyIHF1ZXN0aW9uIHRoZSBtdWx0aXBsZSB3cml0aW5nIG9mIHRoZSBm
aWVsZC4gSSdkIGtpbmQgb2YKPj4+IGV4cGVjdCB0aGUgdW5pdCBhbmQgYWxsIHZDUFUtcyB3aXRo
aW4gaXQgdG8gZ2V0IGFuIGlkZW50aWNhbAo+Pj4gc3RhdGUgZW50cnkgdGltZSBzdG9yZWQuCj4+
Cj4+IFdoZW4gYW4gaWRsZSB2Y3B1IGlzIGJlaW5nIGNyZWF0ZWQgaXRzIGNwdSBpcyBpbiBubyBj
cHVwb29sIHlldAo+PiAoYSBmcmVlIGNwdSkuIFRob3NlIGNwdXMgYXJlIGFsd2F5cyBzdWJqZWN0
IHRvIGNwdSBzY2hlZHVsaW5nCj4+IChncmFudWxhcml0eSAxKS4gT25seSB3aGVuIGNwdXMgYXJl
IHB1dCBpbnRvIGEgY3B1cG9vbCB0aGUKPj4gZ3JhbnVsYXJpdHkgaXMgYWRqdXN0ZWQgYWNjb3Jk
aW5nbHkgYW5kIHRoZSBpZGxlLXZjcHVzIGFyZQo+PiBwb3NzaWJseSBncm91cGVkIGluIHVuaXRz
IChzZWUgcGF0Y2ggNDUpLgo+Pgo+PiBSZWdhcmRpbmcgdGhlIHN0YXRlIGVudHJ5IHRpbWU6IGRp
ZmZlcmVudCB2Y3B1cyBvZiBhIHVuaXQgY2FuIGJlCj4+IGluIGRpZmZlcmVudCBzdGF0ZXMgKGJs
b2NrZWQvcnVubmluZywgZXRjLiksIHNvIHRoZWlyIHN0YXRlIGVudHJ5Cj4+IHRpbWVzIHdpbGwg
Z2VuZXJhbGx5IGRpZmZlci4gQSB1bml0J3Mgc3RhdGUgZW50cnkgdGltZSB3aWxsCj4+IHJlZmxl
Y3QgaXRzIHNjaGVkdWxpbmcgZXZlbnRzIChiZWluZyBzY2hlZHVsZWQvZGVzY2hlZHVsZWQpLgo+
IAo+IEJ1dCB0aGlzIGRvZXNuJ3QgKHRvIG1lKSBjbGFyaWZ5IHdoZXRoZXIgdGhlIG11bHRpcGxl
IHdyaXRpbmcKPiAob25jZSBwZXIgdkNQVSkgaXMgYWN0dWFsbHkgY29ycmVjdC4gT2J2aW91c2x5
IHdoZXRoZXIgdGhpcyBpcwo+IG1lcmVseSBjb3NtZXRpYyBkZXBlbmRzIG9uIHdoYXQgdGhlIGNv
bnN1bWVycyBvZiB0aGlzIGRhdGEgYXJlLgoKVGhlcmUgaXMgbm8gbXVsdGlwbGUgd3JpdGluZy4g
VGhpcyBpcyBhIHByZXBhcmF0b3J5IHBhdGNoIGZvciBiZWluZwphYmxlIHRvIHJlbW92ZSB0aGUg
dmNwdSBkZXBlbmRlbmNpZXMgZnJvbSB0aGUgc2luZ2xlIHNjaGVkdWxlcnMuCgpMYXRlciB3aGVu
IG11bHRpcGxlIHZjcHVzIHBlciB1bml0IGFyZSBpbnRyb2R1Y2VkIHRoZXJlIHdpbGwgYmUgYQpj
bGVhciBkaXN0aW5jdGlvbiBiZXR3ZWVuIHZjcHUgc3dpdGNoaW5nIChjb250ZXh0IHN3aXRjaGVz
KSBhbmQKc2NoZWRfdW5pdCBzd2l0Y2hpbmcgKHNjaGVkdWxpbmcgZXZlbnRzKS4gdmNwdSBkYXRh
IHdpbGwgYmUgYWRqdXN0ZWQKYXQgY29udGV4dF9zd2l0Y2ggdGltZSwgd2hpbGUgdW5pdCBkYXRh
IHdpbGwgYmUgYWRqdXN0ZWQgb25seSB3aGVuCnNjaGVkdWxpbmcgdW5pdHMuCgo+IAo+Pj4gQWxz
byBib3RoIGhlcmUgYW5kIGZ1cnRoZXIgZG93biBJJ20gcHV6emxlZCB0byBzZWUgdGhhdCB0aGUK
Pj4+IHVuaXQncyBmaWVsZCBkb2Vzbid0IGdldCBzZXQgYXQgdGhlIHNhbWUgcGxhY2UgaW4gY29k
ZSB3aGVyZQo+Pj4gdGhlIHZDUFUncyBmaWVsZCBnZXRzIHNldC4KPj4KPj4gUmlnaHQuIFRoZSBz
dGF0ZXMgb2YgYSB2Y3B1IGFuZCB0aGUgdW5pdCBpdCBpcyBiZWxvbmdpbmcgdG8gYXJlCj4+IGNv
dXBsZWQsIGJ1dCBub3QgaWRlbnRpY2FsLgo+IAo+IEFuZCB0aGlzIGlzIG5vdCAoZ29pbmcgdG8g
YmUpIGEgcHJvYmxlbT8KCldpdGggYSBwcm9wZXIgZGlzdGluY3Rpb24gYXMgZXhwbGFpbmVkIGFi
b3ZlLCBuby4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
