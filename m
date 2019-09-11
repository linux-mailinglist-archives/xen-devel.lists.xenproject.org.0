Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57DFAFE02
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 15:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i82vb-0001HS-7N; Wed, 11 Sep 2019 13:44:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i82vZ-0001HN-9T
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 13:44:57 +0000
X-Inumbo-ID: 55da12e0-d49a-11e9-83d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 55da12e0-d49a-11e9-83d5-12813bfff9fa;
 Wed, 11 Sep 2019 13:44:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87FE9B8AA;
 Wed, 11 Sep 2019 13:44:53 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-14-jgross@suse.com>
 <cdd95d65-ce9d-4b8c-77fc-2386cf0e65c1@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ea633104-55c3-ad8b-4afc-835744106d4e@suse.com>
Date: Wed, 11 Sep 2019 15:44:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cdd95d65-ce9d-4b8c-77fc-2386cf0e65c1@suse.com>
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

T24gMDQuMDkuMTkgMTc6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTQwNyw2ICs0MDcsOCBAQCBpbnQg
c2NoZWRfaW5pdF92Y3B1KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQo+
PiAgICAgICB7Cj4+ICAgICAgICAgICBnZXRfc2NoZWRfcmVzKHYtPnByb2Nlc3NvciktPmN1cnIg
PSB1bml0Owo+PiAgICAgICAgICAgdi0+aXNfcnVubmluZyA9IDE7Cj4+ICsgICAgICAgIHVuaXQt
PmlzX3J1bm5pbmcgPSAxOwo+PiArICAgICAgICB1bml0LT5zdGF0ZV9lbnRyeV90aW1lID0gTk9X
KCk7Cj4+ICAgICAgIH0KPj4gICAgICAgZWxzZQo+PiAgICAgICB7Cj4gCj4gQXJlIGlkbGUgdkNQ
VS1zIGFsc28gZ29pbmcgdG8gZ2V0IGdyb3VwZWQgaW50byB1bml0cyAoSSdtIHNvcnJ5LAo+IEkg
ZG9uJ3QgcmVjYWxsKT8gSWYgc28sIGp1c3QgbGlrZSBmdXJ0aGVyIGRvd24gSSdkIGJlIHB1dHRp
bmcKPiB1bmRlciBxdWVzdGlvbiB0aGUgbXVsdGlwbGUgd3JpdGluZyBvZiB0aGUgZmllbGQuIEkn
ZCBraW5kIG9mCj4gZXhwZWN0IHRoZSB1bml0IGFuZCBhbGwgdkNQVS1zIHdpdGhpbiBpdCB0byBn
ZXQgYW4gaWRlbnRpY2FsCj4gc3RhdGUgZW50cnkgdGltZSBzdG9yZWQuCgpXaGVuIGFuIGlkbGUg
dmNwdSBpcyBiZWluZyBjcmVhdGVkIGl0cyBjcHUgaXMgaW4gbm8gY3B1cG9vbCB5ZXQKKGEgZnJl
ZSBjcHUpLiBUaG9zZSBjcHVzIGFyZSBhbHdheXMgc3ViamVjdCB0byBjcHUgc2NoZWR1bGluZwoo
Z3JhbnVsYXJpdHkgMSkuIE9ubHkgd2hlbiBjcHVzIGFyZSBwdXQgaW50byBhIGNwdXBvb2wgdGhl
CmdyYW51bGFyaXR5IGlzIGFkanVzdGVkIGFjY29yZGluZ2x5IGFuZCB0aGUgaWRsZS12Y3B1cyBh
cmUKcG9zc2libHkgZ3JvdXBlZCBpbiB1bml0cyAoc2VlIHBhdGNoIDQ1KS4KClJlZ2FyZGluZyB0
aGUgc3RhdGUgZW50cnkgdGltZTogZGlmZmVyZW50IHZjcHVzIG9mIGEgdW5pdCBjYW4gYmUKaW4g
ZGlmZmVyZW50IHN0YXRlcyAoYmxvY2tlZC9ydW5uaW5nLCBldGMuKSwgc28gdGhlaXIgc3RhdGUg
ZW50cnkKdGltZXMgd2lsbCBnZW5lcmFsbHkgZGlmZmVyLiBBIHVuaXQncyBzdGF0ZSBlbnRyeSB0
aW1lIHdpbGwKcmVmbGVjdCBpdHMgc2NoZWR1bGluZyBldmVudHMgKGJlaW5nIHNjaGVkdWxlZC9k
ZXNjaGVkdWxlZCkuCgo+IEFsc28gYm90aCBoZXJlIGFuZCBmdXJ0aGVyIGRvd24gSSdtIHB1enps
ZWQgdG8gc2VlIHRoYXQgdGhlCj4gdW5pdCdzIGZpZWxkIGRvZXNuJ3QgZ2V0IHNldCBhdCB0aGUg
c2FtZSBwbGFjZSBpbiBjb2RlIHdoZXJlCj4gdGhlIHZDUFUncyBmaWVsZCBnZXRzIHNldC4KClJp
Z2h0LiBUaGUgc3RhdGVzIG9mIGEgdmNwdSBhbmQgdGhlIHVuaXQgaXQgaXMgYmVsb25naW5nIHRv
IGFyZQpjb3VwbGVkLCBidXQgbm90IGlkZW50aWNhbC4KCj4gCj4+IEBAIC0xNjYzLDggKzE2NjYs
MTAgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkKPj4gICAgICAgICogc3dpdGNoLCBlbHNl
IGxvc3RfcmVjb3JkcyByZXN1bWUgd2lsbCBub3Qgd29yayBwcm9wZXJseS4KPj4gICAgICAgICov
Cj4+ICAgCj4+IC0gICAgQVNTRVJUKCFuZXh0LT5pc19ydW5uaW5nKTsKPj4gKyAgICBBU1NFUlQo
IW5leHQtPnNjaGVkX3VuaXQtPmlzX3J1bm5pbmcpOwo+PiAgICAgICBuZXh0LT5pc19ydW5uaW5n
ID0gMTsKPj4gKyAgICBuZXh0LT5zY2hlZF91bml0LT5pc19ydW5uaW5nID0gMTsKPj4gKyAgICBu
ZXh0LT5zY2hlZF91bml0LT5zdGF0ZV9lbnRyeV90aW1lID0gbm93Owo+IAo+IElzbid0IHRoZSBB
U1NFUlQoKSB5b3UgZGVsZXRlIHN0aWxsIHN1cHBvc2VkIHRvIGJlIHRydWU/IEluIHdoaWNoIGNh
c2UKPiB3b3VsZG4ndCBpdCBiZSB3b3J0aHdoaWxlIHRvIHJldGFpbiBpdD8KCk5vLCBpdCBpcyBu
b3QgdHJ1ZSBhbnkgbG9uZ2VyLiBBbGwgYnV0IG9uZSB2Y3B1cyBvZiBhIHVuaXQgY2FuIGJlCmJs
b2NrZWQgcmVzdWx0aW5nIGluIHRoZSByZWxhdGVkIGlkbGUgdmNwdXMgdG8gYmUgcnVubmluZy4g
VGhpcyBtZWFucwp0aGF0IGV2ZW4gd2l0aCBvbmUgdW5pdCBiZWluZyByZXBsYWNlZCBieSBhbm90
aGVyIG9uZSB0aGUgdmNwdSBjYW4gYmUKdGhlIHNhbWUuCgo+IAo+PiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+PiBAQCAtMjcy
LDYgKzI3MiwxMSBAQCBzdHJ1Y3Qgc2NoZWRfdW5pdCB7Cj4+ICAgICAgIHN0cnVjdCBzY2hlZF9y
ZXNvdXJjZSAqcmVzOwo+PiAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgIHVuaXRfaWQ7Cj4+
ICAgCj4+ICsgICAgLyogTGFzdCB0aW1lIHVuaXQgZ290IChkZS0pc2NoZWR1bGVkLiAqLwo+PiAr
ICAgIHVpbnQ2NF90ICAgICAgICAgICAgICAgc3RhdGVfZW50cnlfdGltZTsKPj4gKwo+PiArICAg
IC8qIEN1cnJlbnRseSBydW5uaW5nIG9uIGEgQ1BVPyAqLwo+PiArICAgIGJvb2wgICAgICAgICAg
ICAgICAgICAgaXNfcnVubmluZzsKPj4gICAgICAgLyogRG9lcyBzb2Z0IGFmZmluaXR5IGFjdHVh
bGx5IHBsYXkgYSByb2xlIChnaXZlbiBoYXJkIGFmZmluaXR5KT8gKi8KPj4gICAgICAgYm9vbCAg
ICAgICAgICAgICAgICAgICBzb2Z0X2FmZl9lZmZlY3RpdmU7Cj4+ICAgICAgIC8qIEJpdG1hc2sg
b2YgQ1BVcyBvbiB3aGljaCB0aGlzIFZDUFUgbWF5IHJ1bi4gKi8KPiAKPiBJJ20gbm90aWNpbmcg
dGhpcyBoZXJlLCBidXQgaXQgbWF5IHdlbGwgaGF2ZSBiZWVuIGFuIGlzc3VlIGVhcmxpZXIKPiBh
bHJlYWR5IChhbmQgdGhlcmUgbWF5IHdlbGwgYmUgbGF0ZXIgYWRqdXN0bWVudHMgaW52YWxpZGF0
aW5nIG15Cj4gcmVtYXJrLCBhbmQgb2YgY291cnNlIGl0J3MgdGhlIGVuZCByZXN1bHQgb2YgdGhp
cyBzZXJpZXMgd2hpY2gKPiBtYXR0ZXJzIGluIHRoZSBsb25nIHJ1bik6IENvdWxkIHlvdSBzZWUg
YWJvdXQgYWRkaW5nL3JlbW92aW5nCj4gZmllbGRzIHRvIHRoaXMgc3RydWN0IChhbmQgZ2VuZXJh
bGx5IG9mIGNvdXJzZSBhbHNvIG90aGVycykKPiBtaW5pbWl6aW5nIHRoZSBudW1iZXIgLyBvdmVy
YWxsIHNpemUgb2YgaG9sZXM/CgpIbW0sIHllcy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
