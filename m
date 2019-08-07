Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611B84474
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 08:28:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvFP9-0007jn-5y; Wed, 07 Aug 2019 06:26:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvFP8-0007ji-GL
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 06:26:34 +0000
X-Inumbo-ID: 4b665866-b8dc-11e9-8d25-33cc46467ca4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b665866-b8dc-11e9-8d25-33cc46467ca4;
 Wed, 07 Aug 2019 06:26:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96B1DAF11;
 Wed,  7 Aug 2019 06:26:30 +0000 (UTC)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com> <87sgqegji0.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35f617e6-ccf8-3d2c-1a10-81b2e8c0b0a9@suse.com>
Date: Wed, 7 Aug 2019 08:26:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87sgqegji0.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAyMTo1MSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSGkgSmFu
LAo+IAo+IEphbiBCZXVsaWNoIHdyaXRlczoKPiAKPj4gT24gMDIuMDguMjAxOSAxODozOSwgT2xl
a3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxz
Zi5jCj4+PiArKysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCj4+PiBAQCAtNjEwLDYgKzYx
MCwyNyBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcg
YWxpZ24pCj4+PiAgICAgICAgcmV0dXJuIHAgPyBtZW1zZXQocCwgMCwgc2l6ZSkgOiBwOwo+Pj4g
ICAgfQo+Pj4gICAgCj4+PiArdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnAsIHVuc2lnbmVkIGxvbmcg
bmV3X3NpemUsIHVuc2lnbmVkIGxvbmcgYWxpZ24pCj4+PiArewo+Pj4gKyAgICB2b2lkICpuZXdf
cDsKPj4+ICsKPj4+ICsgICAgaWYgKCAhbmV3X3NpemUgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAg
ICB4ZnJlZShwKTsKPj4+ICsgICAgICAgIHJldHVybiBOVUxMOwo+Pj4gKyAgICB9Cj4+PiArCj4+
PiArICAgIG5ld19wID0gX3htYWxsb2MobmV3X3NpemUsIGFsaWduKTsKPj4+ICsKPj4+ICsgICAg
aWYgKCBuZXdfcCAmJiBwICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgbWVtY3B5KG5ld19wLCBw
LCBuZXdfc2l6ZSk7Cj4+PiArICAgICAgICB4ZnJlZShwKTsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4g
KyAgICByZXR1cm4gbmV3X3A7Cj4+PiArfQo+Pgo+PiBXaGlsZSBJIGNhbiBzZWUgd2h5IGhhdmlu
ZyBhIHJlLWFsbG9jYXRpb24gZnVuY3Rpb24gbWF5IGJlIGhhbmR5LAo+PiBleHBsaWNpdCAvIGRp
cmVjdCB1c2Ugb2YgX3htYWxsb2MoKSBhbmQgX3h6YWxsb2MoKSBhcmUgZGlzY291cmFnZWQsCj4+
IGluIGZhdm9yIG9mIHRoZSBtb3JlIHR5cGUtc2FmZSB1bmRlcnNjb3JlLWxlc3MgdmFyaWFudHMu
IEkgY2FuJ3QKPj4gc2VlIHRob3VnaCBob3cgYSB0eXBlLXNhZmUgInJlYWxsb2MiIGNvdWxkIGxv
b2sgbGlrZSwgZXhjZXB0IGZvcgo+PiBhcnJheXMuIElmIHJlc2l6aW5nIGFycmF5cyBpcyBhbGwg
eW91J3JlIGFmdGVyLCBJJ2QgbGlrZSB0bwo+PiByZWNvbW1lbmQgdG8gZ28gdGhhdCByb3V0ZSBy
YXRoZXIgdGhlbiB0aGUgc3VnZ2VzdGVkIG9uZSBoZXJlLiBJZgo+PiByZXNpemluZyBhcmJpdHJh
cnkgb2JqZWN0cyBpcyB0aGUgZ29hbCwgdGhlbiB3aGF0IHlvdSBzdWdnZXN0IG1heQo+PiBiZSB0
aGUgb25seSByb3V0ZSwgYnV0IEknZCBzdGlsbCBiZSBub3Qgb3Zlcmx5IGhhcHB5IHRvIHNlZSBz
dWNoCj4+IGFkZGVkLgo+IAo+IEkgY2FuIHNlZSAzIHVzZXMgZm9yIHJlYWxsb2M6Cj4gCj4gICBh
LiByZS1hbGxvY2F0ZSBnZW5lcmljIGRhdGEgYnVmZmVyCj4gICBiLiByZS1hbGxvY2F0ZSBhcnJh
eQo+ICAgYy4gcmUtYWxsb2NhdGUgc3RydWN0IHdpdGggZmxleGlibGUgYnVmZmVyLgo+IAo+IG9w
dGlvbiBjLiBpcyBhYm91dCBzdHJ1Y3R1cmVzIGxpa2UgdGhpczoKPiAKPiBzdHJ1Y3QgYXJybGVu
Cj4gewo+ICAgICAgICAgIHNpemVfdCBsZW47Cj4gICAgICAgICAgaW50IGRhdGFbMV07Cj4gfTsK
PiAKPiBUaGlzIGlzIE9sZWtzYW5kcidzIGNhc2UuCj4gCj4gU28gZm9yIG9wdGlvbiBhLiB3ZSBj
YW4gdXNlIF94cmVhbGxvY2F0ZShwdHIsIHNpemUsIGFsaWduKQo+IEZvciBvcHRpb24gYi4gd2Ug
Y2FuIHVzZSB4cmVhbGxvY19hcnJheShfcHRyLCBfdHlwZSwgX251bSkKPiBBbmQgZm9yIG9wdGlv
biBjLiBJIHByb3Bvc2UgdG8gaW1wbGVtZW50IHRoZSBmb2xsb3dpbmcgbWFjcm86Cj4gCj4gI2Rl
ZmluZSByZWFsbG9jX2ZsZXhfc3RydWN0KF9wdHIsIF90eXBlLCBfZmllbGQsIF9sZW4pICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICAgKChfdHlwZSAqKV94cmVhbGxvYyhfcHRyLCBvZmZzZXRv
ZihfdHlwZSwgX2ZpZWxkW19sZW5dKSAsIF9fYWxpZ25vZl9fKF90eXBlKSkpCj4gCj4gSXQgY2Fu
IGJlIHVzZWQgaW4gdGhlIGZvbGxvd2luZyB3YXk6Cj4gCj4gbmV3cHRyID0gcmVhbGxvY19mbGV4
X3N0cnVjdChwdHIsIHN0cnVjdCBhcnJsZW4sIG5ld3NpemUpOwo+IAo+IEFzIHlvdSBjYW4gc2Vl
LCB0aGlzIGFwcHJvYWNoIGlzIHR5cGUtc2FmZSBhbmQgY292ZXJzIE9sZWtzYW5yZCdzIGNhc2Uu
CgpUaGlzIGxvb2tzIGZpbmUgdG8gbWUsIGJ1dCB0aGVuIHdhbnRzIHRvIGJlIGFjY29tcGFuaWVk
IGJ5IGEKc2ltaWxhciB4bWFsbG9jX2ZsZXhfc3RydWN0KCksIHdoaWNoIGNvdWxkIGJlIHVzZWQg
cmlnaHQgYXdheQp0byByZXBsYWNlIGEgbnVtYmVyIG9mIG9wZW4tY29kZWQgaW5zdGFuY2VzIG9m
IHRoZSBhYm92ZS4KClRoZXJlJ3Mgb25lIG1vcmUgdGhpbmcgZm9yIHRoZSByZS1hbGxvYyBjYXNl
IHRob3VnaCAoYmVzaWRlcwpjb3NtZXRpYyBhc3BlY3RzKTogVGhlIGluY29taW5nIHBvaW50ZXIg
c2hvdWxkIGFsc28gYmUgdmVyaWZpZWQKdG8gYmUgb2YgY29ycmVjdCB0eXBlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
