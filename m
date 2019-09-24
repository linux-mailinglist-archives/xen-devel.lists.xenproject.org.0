Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A05BC716
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:44:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjCH-0000HA-GC; Tue, 24 Sep 2019 11:41:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCjCG-0000H5-SI
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:41:32 +0000
X-Inumbo-ID: 4032c72c-dec0-11e9-9616-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4032c72c-dec0-11e9-9616-12813bfff9fa;
 Tue, 24 Sep 2019 11:41:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A50C9AFFC;
 Tue, 24 Sep 2019 11:41:29 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-8-jgross@suse.com>
 <19409170-4a99-e336-dae3-b439db509111@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6e7b8475-bd13-94fc-2715-1d8b4f510eb4@suse.com>
Date: Tue, 24 Sep 2019 13:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <19409170-4a99-e336-dae3-b439db509111@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 07/47] xen/sched: move per cpu scheduler
 private data into struct sched_resource
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMTkgMTc6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRoaXMgcHJlcGFyZXMgc3VwcG9ydCBvZiBsYXJn
ZXIgc2NoZWR1bGluZyBncmFudWxhcml0aWVzLCBlLmcuIGNvcmUKPj4gc2NoZWR1bGluZy4KPj4K
Pj4gV2hpbGUgYXQgaXQgbW92ZSBzY2hlZF9oYXNfdXJnZW50X3ZjcHUoKSBmcm9tIGluY2x1ZGUv
YXNtLXg4Ni9jcHVpZGxlLmgKPj4gaW50byBzY2hlZC5oIHJlbW92aW5nIHRoZSBuZWVkIGZvciBp
bmNsdWRpbmcgc2NoZWQtaWYuaCBpbiBjcHVpZGxlLmguCj4+IEZvciB0aGF0IHB1cnBvc2UgcmVt
b2JlIHVyZ2VudF9jb3VudCBmcm9tIHRoZSBzY2hlZHVsZXIgcHJpdmF0ZSBkYXRhCj4+IGFuZCBt
YWtlIGl0IGEgcGxhaW4gcGVyY3B1IHZhcmlhYmxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gRnVuZGFtZW50YWxseQo+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gYnV0IGEgY291cGxlIG9mIHJl
bWFya3M6Cj4gCj4+IEBAIC02NDMsNyArNjQzLDcgQEAgc3RhdGljIHNwaW5sb2NrX3QgKgo+PiAg
IGE2NTNfc3dpdGNoX3NjaGVkKHN0cnVjdCBzY2hlZHVsZXIgKm5ld19vcHMsIHVuc2lnbmVkIGlu
dCBjcHUsCj4+ICAgICAgICAgICAgICAgICAgICAgdm9pZCAqcGRhdGEsIHZvaWQgKnZkYXRhKQo+
PiAgIHsKPj4gLSAgICBzdHJ1Y3Qgc2NoZWR1bGVfZGF0YSAqc2QgPSAmcGVyX2NwdShzY2hlZHVs
ZV9kYXRhLCBjcHUpOwo+PiArICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqc2QgPSBnZXRfc2No
ZWRfcmVzKGNwdSk7Cj4gCj4gSSBjYW4gdW5kZXJzdGFuZCB3aHkgeW91IGtlZXAgInNkIiBhcyBh
IG5hbWUgaGVyZSBhbmQgaW4gc2ltaWxhcgo+IGNhc2VzLiBCdXQgLi4uCj4gCj4+IEBAIC0zODgx
LDYgKzM4ODEsNyBAQCBjc2NoZWQyX3N3aXRjaF9zY2hlZChzdHJ1Y3Qgc2NoZWR1bGVyICpuZXdf
b3BzLCB1bnNpZ25lZCBpbnQgY3B1LAo+PiAgIHsKPj4gICAgICAgc3RydWN0IGNzY2hlZDJfcHJp
dmF0ZSAqcHJ2ID0gY3NjaGVkMl9wcml2KG5ld19vcHMpOwo+PiAgICAgICBzdHJ1Y3QgY3NjaGVk
Ml91bml0ICpzdmMgPSB2ZGF0YTsKPj4gKyAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnNkID0g
Z2V0X3NjaGVkX3JlcyhjcHUpOwo+IAo+IC4uLiBoZXJlIChhbmQgaW4gYXQgbGVhc3Qgb25lIG1v
cmUgcGxhY2UpIHlvdSBpbnRyb2R1Y2UgYSBuZXcKPiB2YXJpYWJsZS4gV291bGRuJ3QgdGhpcyBi
ZXR0ZXIgYmUgbmFtZWQgZS5nLiAic3IiPyBGdXJ0aGVybW9yZQo+IHlvdSB1c2UgaXQganVzdCBv
bmNlIC4uLgo+IAo+PiBAQCAtMzkwNiw3ICszOTA3LDcgQEAgY3NjaGVkMl9zd2l0Y2hfc2NoZWQo
c3RydWN0IHNjaGVkdWxlciAqbmV3X29wcywgdW5zaWduZWQgaW50IGNwdSwKPj4gICAgICAgICog
dGhpcyBzY2hlZHVsZXIsIGFuZCBzbyBpdCdzIHNhZmUgdG8gaGF2ZSB0YWtlbiBpdCAvYmVmb3Jl
LyBvdXIKPj4gICAgICAgICogcHJpdmF0ZSBnbG9iYWwgbG9jay4KPj4gICAgICAgICovCj4+IC0g
ICAgQVNTRVJUKHBlcl9jcHUoc2NoZWR1bGVfZGF0YSwgY3B1KS5zY2hlZHVsZV9sb2NrICE9ICZw
cnYtPnJxZFtycWldLmxvY2spOwo+PiArICAgIEFTU0VSVChzZC0+c2NoZWR1bGVfbG9jayAhPSAm
cHJ2LT5ycWRbcnFpXS5sb2NrKTsKPiAKPiAuLi4gaGVyZTsgaXQgZG9lc24ndCBzZWVtIHdvcnRo
d2hpbGUgaGVyZSwgYnV0IEkgZ3Vlc3MKPiBzdWJzZXF1ZW50IGNoYW5nZXMgbWFrZSBtb3JlIHVz
ZSBvZiBpdD8KCkluIGZhY3QgdGhleSBkb24ndC4gSSdsbCByZW1vdmUgaXQgaGVyZS4KClJlZ2Fy
ZGluZyB0byByZW5hbWUgInNkIiB0byAic3IiOiBJIGFncmVlIHRoaXMgd291bGQgYmUgYSBzZW5z
aWJsZQpjaGFuZ2UuIE9UT0ggSSdkIGxpa2UgdG8gYmUgY29uc2lzdGVudCwgc28gSSdkIGxpa2Ug
dG8gZGVmZXIgdGhhdCB0bwp0aGUgcGxhbm5lZCBzY2hlZHVsaW5nIGNsZWFudXAgc2VyaWVzLgoK
PiAKPj4gQEAgLTM5Myw3ICszOTUsNyBAQCBpbnQgc2NoZWRfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1
ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQo+PiAgICAgICAvKiBJZGxlIFZDUFVzIGFyZSBz
Y2hlZHVsZWQgaW1tZWRpYXRlbHksIHNvIGRvbid0IHB1dCB0aGVtIGluIHJ1bnF1ZXVlLiAqLwo+
PiAgICAgICBpZiAoIGlzX2lkbGVfZG9tYWluKGQpICkKPj4gICAgICAgewo+PiAtICAgICAgICBw
ZXJfY3B1KHNjaGVkdWxlX2RhdGEsIHYtPnByb2Nlc3NvcikuY3VyciA9IHVuaXQ7Cj4+ICsgICAg
ICAgIGdldF9zY2hlZF9yZXModi0+cHJvY2Vzc29yKS0+Y3VyciA9IHVuaXQ7Cj4gCj4gQXMgbG9u
ZyBhcyBpdCdzIGEgbWFjcm8gKHNlZSBiZWxvdyksIHdoeSBub3QgdXNlIGN1cnJfb25fY3B1KCkg
aGVyZT8KClRoZXJlIHdpbGwgYmUgYW5vdGhlciBzY2hlZF9yZXNvdXJjZSBpbml0aWFsaXphdGlv
biBhZGRlZCBoZXJlCmxhdGVyLiBUaGlzIG1ha2VzIGl0IG1vcmUgb2J2aW91cy4KCj4gCj4+IEBA
IC0xOTE2LDcgKzE5MTcsNyBAQCB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lkKQo+PiAg
ICAgICBpZGxlX2RvbWFpbi0+bWF4X3ZjcHVzID0gbnJfY3B1X2lkczsKPj4gICAgICAgaWYgKCB2
Y3B1X2NyZWF0ZShpZGxlX2RvbWFpbiwgMCwgMCkgPT0gTlVMTCApCj4+ICAgICAgICAgICBCVUco
KTsKPj4gLSAgICB0aGlzX2NwdShzY2hlZHVsZV9kYXRhKS5jdXJyID0gaWRsZV92Y3B1WzBdLT5z
Y2hlZF91bml0Owo+PiArICAgIGdldF9zY2hlZF9yZXMoMCktPmN1cnIgPSBpZGxlX3ZjcHVbMF0t
PnNjaGVkX3VuaXQ7Cj4gCj4gSG1tLCB5ZXQgYW5vdGhlciBwbGFpbiAwLiBCdXQgeWVzLCB0aGVy
ZSBhcmUgcXVpdGUgYSBmZXcgb2YgdGhlbQo+IGhlcmUgYWxyZWFkeSwgc28gb25lIG1vcmUgZG9l
c24ndCByZWFsbHkgbWF0dGVyLgoKWWVzLCB3ZSBzaG91bGQgYWRkIGEgYm9vdF9jcHUgdmFyaWFi
bGUuIEJ1dCBub3QgaW4gdGhpcyBzZXJpZXMuCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
c2NoZWQtaWYuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+PiBAQCAtMzMs
MjIgKzMzLDE5IEBAIGV4dGVybiBpbnQgc2NoZWRfcmF0ZWxpbWl0X3VzOwo+PiAgICAqIEZvciBj
YWNoZSBiZXR0ZXJuZXNzLCBrZWVwIHRoZSBhY3R1YWwgbG9jayBpbiB0aGUgc2FtZSBjYWNoZSBh
cmVhCj4+ICAgICogYXMgdGhlIHJlc3Qgb2YgdGhlIHN0cnVjdC4gIEp1c3QgaGF2ZSB0aGUgc2No
ZWR1bGVyIHBvaW50IHRvIHRoZQo+PiAgICAqIG9uZSBpdCB3YW50cyAoVGhpcyBtYXkgYmUgdGhl
IG9uZSByaWdodCBpbiBmcm9udCBvZiBpdCkuKi8KPj4gLXN0cnVjdCBzY2hlZHVsZV9kYXRhIHsK
Pj4gK3N0cnVjdCBzY2hlZF9yZXNvdXJjZSB7Cj4+ICAgICAgIHNwaW5sb2NrX3QgICAgICAgICAq
c2NoZWR1bGVfbG9jaywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIF9sb2NrOwo+PiAgICAg
ICBzdHJ1Y3Qgc2NoZWRfdW5pdCAgKmN1cnI7Cj4+ICAgICAgIHZvaWQgICAgICAgICAgICAgICAq
c2NoZWRfcHJpdjsKPj4gICAgICAgc3RydWN0IHRpbWVyICAgICAgICBzX3RpbWVyOyAgICAgICAg
Lyogc2NoZWR1bGluZyB0aW1lciAgICAgICAgICAgICAgICAqLwo+PiAtICAgIGF0b21pY190ICAg
ICAgICAgICAgdXJnZW50X2NvdW50OyAgIC8qIGhvdyBtYW55IHVyZ2VudCB2Y3B1cyAgICAgICAg
ICAgKi8KPj4gLX07Cj4+IC0KPj4gLSNkZWZpbmUgY3Vycl9vbl9jcHUoYykgICAgKHBlcl9jcHUo
c2NoZWR1bGVfZGF0YSwgYykuY3VycikKPj4gICAKPj4gLXN0cnVjdCBzY2hlZF9yZXNvdXJjZSB7
Cj4+IC0gICAgdW5zaWduZWQgaW50IG1hc3Rlcl9jcHU7ICAvKiBDcHUgd2l0aCBsb3dlc3QgaWQg
aW4gc2NoZWR1bGluZyByZXNvdXJjZS4gKi8KPj4gKyAgICAvKiBDcHUgd2l0aCBsb3dlc3QgaWQg
aW4gc2NoZWR1bGluZyByZXNvdXJjZS4gKi8KPj4gKyAgICB1bnNpZ25lZCBpbnQgICAgICAgIG1h
c3Rlcl9jcHU7Cj4+ICAgfTsKPj4gICAKPj4gLURFQ0xBUkVfUEVSX0NQVShzdHJ1Y3Qgc2NoZWR1
bGVfZGF0YSwgc2NoZWR1bGVfZGF0YSk7Cj4+ICsjZGVmaW5lIGN1cnJfb25fY3B1KGMpICAgIChn
ZXRfc2NoZWRfcmVzKGMpLT5jdXJyKQo+IAo+IEJ5IG1vdmluZyB0aGlzIGEgZmV3IGxpbmVzIGRv
d24gaWYgY291bGQgYmVjb21lIGFuIGlubGluZSBmdW5jdGlvbgo+IGFzIGl0IHNlZW1zLCBpZiAo
c2VlIGFib3ZlKSBpdHMgdXNlIGFzIGFuIGx2YWx1ZSBpcyBub3QgaW50ZW5kZWQuCgpJIGxpa2Ug
dGhhdCBpZGVhLiBXaWxsIGNoYW5nZSB0byBpbmxpbmUgZnVuY3Rpb24uCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
