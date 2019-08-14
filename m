Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4DD8D318
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:30:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxsO8-0000vT-D0; Wed, 14 Aug 2019 12:28:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxsO6-0000vO-Qa
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:28:22 +0000
X-Inumbo-ID: ff9e29d2-be8e-11e9-92df-dbf735e1d243
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ff9e29d2-be8e-11e9-92df-dbf735e1d243;
 Wed, 14 Aug 2019 12:28:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5941D28;
 Wed, 14 Aug 2019 05:28:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD4DB3F706;
 Wed, 14 Aug 2019 05:28:17 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
 <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
 <8e99da72bafe4b1a8a92e146b07a3082@AMSPEX02CL03.citrite.net>
 <da3a819d-6f04-a002-25a8-10ad209e6bc8@arm.com>
 <6c00b9a439aa4d57b2973752c8eaf393@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bcfe1bab-fe1f-f6ae-52c9-8fa50b878963@arm.com>
Date: Wed, 14 Aug 2019 13:28:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6c00b9a439aa4d57b2973752c8eaf393@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNC8wOC8yMDE5IDEyOjExLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4+IFNlbnQ6IDE0IEF1Z3VzdCAyMDE5IDExOjQ1Cj4+IFRvOiBQYXVsIER1cnJhbnQg
PFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBCZXVsaWNoJyA8amJldWxpY2hAc3VzZS5j
b20+Cj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPjsgR2VvcmdlIER1bmxhcAo+PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEph
Y2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkKPj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47Cj4+IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSBpb21tdTogdGlkeSB1cCBpb21t
dV91c19oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zCj4+Cj4+IEhpLAo+
Pgo+PiBPbiAxNC8wOC8yMDE5IDExOjI3LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+Pj4+IFNlbnQ6IDE0IEF1Z3VzdCAyMDE5IDExOjIxCj4+Pj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyAnSmFuIEJldWxpY2gnIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPj4+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lCj4+
Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9C
YWJjaHVrQGVwYW0uY29tPjsgR2VvcmdlIER1bmxhcAo+Pj4+IDxHZW9yZ2UuRHVubGFwQGNpdHJp
eC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3Rh
YmVsbGluaQo+Pj4+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGltIChYZW4ub3JnKQo+PiA8dGltQHhlbi5v
cmc+Owo+Pj4+IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCA1
LzZdIGlvbW11OiB0aWR5IHVwIGlvbW11X3VzX2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5
bmMoKSBtYWNyb3MKPj4+Pgo+Pj4+IEhpIFBhdWwsCj4+Pj4KPj4+PiBPbiAxNC8wOC8yMDE5IDEx
OjEzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lv
bW11LmgKPj4+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+Pj4+Pj4+IEBAIC0y
NjgsNiArMjY4LDEzIEBAIHN0cnVjdCBkb21haW5faW9tbXUgewo+Pj4+Pj4+ICAgICAgI2RlZmlu
ZSBpb21tdV9zZXRfZmVhdHVyZShkLCBmKSAgIHNldF9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0
dXJlcykKPj4+Pj4+PiAgICAgICNkZWZpbmUgaW9tbXVfY2xlYXJfZmVhdHVyZShkLCBmKSBjbGVh
cl9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykKPj4+Pj4+Pgo+Pj4+Pj4+ICsvKiBBcmUg
d2UgdXNpbmcgdGhlIGRvbWFpbiBQMk0gdGFibGUgYXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8K
Pj4+Pj4+PiArI2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpIFwKPj4+Pj4+PiArICAgIChoYXBf
ZW5hYmxlZChkKSAmJiBpc19pb21tdV9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9wdF9zaGFyZSkK
Pj4+Pj4+Cj4+Pj4+PiBEb2VzIHRoaXMgYnVpbGQgZm9yIEFybSwgc2VlaW5nIHRoYXQgdGhlcmUn
cyBubyBoYXBfZW5hYmxlZCgpCj4+Pj4+PiBkZWZpbml0aW9uIHRoZXJlPyBPciBoYXZlIEkgbWlz
c2VkIGl0cyBhZGRpdGlvbiBlYXJsaWVyIGluIHRoaXMKPj4+Pj4+IHNlcmllcz8KPj4+Pj4KPj4+
Pj4gSXQgbW92ZWQgdG8gY29tbW9uIGNvZGUgc2NoZWQuaCBpbiBhbiBlYXJsaWVyIHBhdGNoLgo+
Pj4+Cj4+Pj4gSSB3ZW50IHRocm91Z2ggdGhlIHNlcmllcyBhbmQgZGlkbid0IGZpbmQgd2hlcmUg
aGFwX2VuYWJsZWQoKSBpcyBkZWZpbmVkIGZvciBBcm0KPj4+PiBpbiB0aGlzIHNlcmllcy4gRG8g
eW91IG1pbmQgcG9pbnRpbmcgdGhlIGV4YWN0IHBhdGNoPwo+Pj4+Cj4+Pgo+Pj4gU29ycnksIEkg
d2Fzbid0IGNsZWFyLi4uIFRoZSBjaGFuZ2UgaXMgaW4gbXkgb3RoZXIgc2VyaWVzLCAidXNlIHN0
YXNoZWQgZG9tYWluIGNyZWF0ZSBmbGFncyIsIHdoaWNoCj4+IGlzIGEgcHJlLXJlcXVpc2l0ZSBm
b3IgdGhpcyBzZXJpZXMgKGFzIGNhbGxlZCBvdXQgaW4gdGhlIGNvdmVyIGxldHRlcikuIFRoZSBj
aGFuZ2UgaXMgbWFkZSBpbiBwYXRjaCAjMgo+PiBvZiB0aGF0IHNlcmllczogaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAyMjU2
Lmh0bWwuCj4+Cj4+IE9oLiBJIHVuZGVyc3RhbmQgdGhpcyBhZGRzIGJlbmVmaXRzIGFzIHRoZSBp
bXBsZW1lbnRhdGlvbiBpcyBub3cgY29tbW9uLiBCdXQgdGhlCj4+IGRvd25zaWRlIGlzIGhhcF9l
bmFibGVkKCkgd2lsbCBub3cgcmVxdWlyZSBldmFsdWF0aW9uIG9uIEFybSBldmVuIGl0IGlzCj4+
IGV2YWx1YXRlcyB0byB0cnVlLi4uIFRoaXMgd2lsbCBwcmV2ZW50IHRoZSBjb21waWxlciB0byBy
ZW1vdmUgYW55IG5vbi1IQVAgY29kZQo+PiBwYXRocyAoYXNzdW1pbmcgdGhlcmUgYXJlIGFueSBp
biB0aGUgY29tbW9uIGNvZGUpLgo+IAo+IFRoZXJlIHdhcyBvbmUgaW4gdGhlIGNvbW1vbiBpb21t
dSBjb2RlIHRoYXQgdGh1cyByZXF1aXJlZCBhICNpZmRlZiBmb3IgQVJNLgoKQW55IENPTkZJR197
QVJNLCBYODZ9IGZlZWxzIGFuIGFidXNlIG9mIGNvbW1vbiBjb2RlLiBTbyBJIGFtIGFsd2F5cyBp
biBmYXZvciBvZiAKZHJvcHBpbmcgdGhlbSA6KS4gTXkgY29uY2VybiBpcyB0aGF0IGEgZmV3IG9m
IHRoZSBoZWxwZXJzIHdpbGwgbGlrZWx5IHJldHVybiBhIApzaW5nbGUgdmFsdWUgZm9yIGFueSBh
cmNoaXRlY3R1cmUgYnkgeDg2LiBCdXQgdGhhdCdzIGEgZGlmZmVyZW50IHByb2JsZW0uLi4KCj4g
Cj4+Cj4+IEZ1cnRoZXJtb3JlLCAyIHBhcnRzIG9mIHRoZSBpb21tdV91c2VfaGFwX3B0KCkgY29u
ZGl0aW9uIHdpbGwgYWx3YXlzIHJldHVybmluZwo+PiBhbHdheXMgdHJ1ZS4gQnV0IGFzIHRoZXkg
YXJlIG5vbi1jb25zdGFudCwgc28gdGhleSB3aWxsIGFsd2F5cyBiZSBldmFsdWF0ZWQuCj4+Cj4+
IEl0IGlzIGFsc28gcHJvYmFibHkgZ29pbmcgdG8gY29uZnVzZSBkZXZlbG9wZXIgYXMgdGhleSBt
YXkgdGhpbmsgbm9uLUhBUCBpcwo+PiBzdXBwb3J0ZWQgb24gQXJtLiBZb3UgY2FuJ3QgZmluZCBl
YXNpbHkgdGhhdCBib3RoIGhhcF9lbmFibGVkKC4uLikgYW5kCj4+IGlvbW11X2hhcF9wdF9zaGFy
ZSB3aWxsIGFsd2F5cyBldmFsdWF0ZSB0byB0cnVlLgo+Pgo+PiBTbyBhc2lkZSB0aGUgY29tbW9u
IGltcGxlbWVudGF0aW9uLCB3aGF0IGlzIHRoZSByZWFsIGdhaW4gZm9yIEFybT8KPiAKPiBUaGVy
ZSdzIG5vIHJlYWwgZ2FpbiBmb3IgQVJNLCB0aGUgZ2FpbiBpcyBpbiB0aGUgcmVkdWN0aW9uIGlu
IGlmZGVmLWVyeSBhbmQgdGh1cyB0aWRpbmVzcyBvZiBjb2RlLiBJIGNvdWxkIHB1dCBiYWNrIHNv
bWUgaWZkZWZzIGlmIHlvdSdkIHByZWZlciwgb3IgSSBjb3VsZCBqdXN0IHB1dCBhIGNvbW1lbnQg
c3RhdGluZyB0aGF0IGlvbW11X3VzZV9oYXBfcHQoKSB3aWxsIGFsd2F5cyBiZSB0cnVlIGZvciBB
Uk0uIFdoaWNoIHdvdWxkIHlvdSBwcmVmZXI/CgpMb29raW5nIGF0IHRoZSBwYXRjaCAjNiwgaW9t
bXVfdXNlX2hhcF9wdCgpIGlzIHJlaW1wbGVtZW50ZWQgd2l0aDoKCiNkZWZpbmUgaW9tbXVfdXNl
X2hhcF9wdChkKSAgICAgICAoZG9tX2lvbW11KGQpLT5oYXBfcHRfc2hhcmUpCgpZb3UgYWxzbyBo
YXZlIGEgY29tbWVudCBtZW50aW9uaW5nIEFybSBzeXN0ZW1zIGluIHRoZSBzYW1lIHBhdGNoLgoK
U28gSSB3b3VsZCBiZSBoYXBweSB3aXRoIHRoaXMgcGF0Y2ggYXNzdW1pbmcgdGhhdCBwYXRjaCAj
NiBkb2VzIG5vdCBjaGFuZ2UuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
