Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEEF8D136
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 12:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxqm4-0008Pl-5W; Wed, 14 Aug 2019 10:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxqm3-0008Pe-1V
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 10:44:59 +0000
X-Inumbo-ID: 8e3179ce-be80-11e9-a9f2-47ed31c8a4fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8e3179ce-be80-11e9-a9f2-47ed31c8a4fa;
 Wed, 14 Aug 2019 10:44:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFF2F28;
 Wed, 14 Aug 2019 03:44:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 765553F706;
 Wed, 14 Aug 2019 03:44:54 -0700 (PDT)
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
 <dcf5c21a-bce4-e315-9ae9-ac1f67c0c889@arm.com>
 <8e99da72bafe4b1a8a92e146b07a3082@AMSPEX02CL03.citrite.net>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <da3a819d-6f04-a002-25a8-10ad209e6bc8@arm.com>
Date: Wed, 14 Aug 2019 11:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8e99da72bafe4b1a8a92e146b07a3082@AMSPEX02CL03.citrite.net>
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

SGksCgpPbiAxNC8wOC8yMDE5IDExOjI3LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4+IFNlbnQ6IDE0IEF1Z3VzdCAyMDE5IDExOjIxCj4+IFRvOiBQYXVsIER1cnJhbnQg
PFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBCZXVsaWNoJyA8amJldWxpY2hAc3VzZS5j
b20+Cj4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubmUKPj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPjsgR2VvcmdlIER1bmxhcAo+PiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEph
Y2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkKPj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47Cj4+IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSBpb21tdTogdGlkeSB1cCBpb21t
dV91c19oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zCj4+Cj4+IEhpIFBh
dWwsCj4+Cj4+IE9uIDE0LzA4LzIwMTkgMTE6MTMsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+Pj4g
LS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L2lvbW11LmgKPj4+Pj4gQEAgLTI2OCw2ICsyNjgsMTMgQEAgc3RydWN0IGRvbWFpbl9pb21tdSB7
Cj4+Pj4+ICAgICAjZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYpICAgc2V0X2JpdChmLCBk
b21faW9tbXUoZCktPmZlYXR1cmVzKQo+Pj4+PiAgICAgI2RlZmluZSBpb21tdV9jbGVhcl9mZWF0
dXJlKGQsIGYpIGNsZWFyX2JpdChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQo+Pj4+Pgo+Pj4+
PiArLyogQXJlIHdlIHVzaW5nIHRoZSBkb21haW4gUDJNIHRhYmxlIGFzIGl0cyBJT01NVSBwYWdl
dGFibGU/ICovCj4+Pj4+ICsjZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgXAo+Pj4+PiArICAg
IChoYXBfZW5hYmxlZChkKSAmJiBpc19pb21tdV9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9wdF9z
aGFyZSkKPj4+Pgo+Pj4+IERvZXMgdGhpcyBidWlsZCBmb3IgQXJtLCBzZWVpbmcgdGhhdCB0aGVy
ZSdzIG5vIGhhcF9lbmFibGVkKCkKPj4+PiBkZWZpbml0aW9uIHRoZXJlPyBPciBoYXZlIEkgbWlz
c2VkIGl0cyBhZGRpdGlvbiBlYXJsaWVyIGluIHRoaXMKPj4+PiBzZXJpZXM/Cj4+Pgo+Pj4gSXQg
bW92ZWQgdG8gY29tbW9uIGNvZGUgc2NoZWQuaCBpbiBhbiBlYXJsaWVyIHBhdGNoLgo+Pgo+PiBJ
IHdlbnQgdGhyb3VnaCB0aGUgc2VyaWVzIGFuZCBkaWRuJ3QgZmluZCB3aGVyZSBoYXBfZW5hYmxl
ZCgpIGlzIGRlZmluZWQgZm9yIEFybQo+PiBpbiB0aGlzIHNlcmllcy4gRG8geW91IG1pbmQgcG9p
bnRpbmcgdGhlIGV4YWN0IHBhdGNoPwo+Pgo+IAo+IFNvcnJ5LCBJIHdhc24ndCBjbGVhci4uLiBU
aGUgY2hhbmdlIGlzIGluIG15IG90aGVyIHNlcmllcywgInVzZSBzdGFzaGVkIGRvbWFpbiBjcmVh
dGUgZmxhZ3MiLCB3aGljaCBpcyBhIHByZS1yZXF1aXNpdGUgZm9yIHRoaXMgc2VyaWVzIChhcyBj
YWxsZWQgb3V0IGluIHRoZSBjb3ZlciBsZXR0ZXIpLiBUaGUgY2hhbmdlIGlzIG1hZGUgaW4gcGF0
Y2ggIzIgb2YgdGhhdCBzZXJpZXM6IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMjI1Ni5odG1sLgoKT2guIEkgdW5kZXJzdGFu
ZCB0aGlzIGFkZHMgYmVuZWZpdHMgYXMgdGhlIGltcGxlbWVudGF0aW9uIGlzIG5vdyBjb21tb24u
IEJ1dCB0aGUgCmRvd25zaWRlIGlzIGhhcF9lbmFibGVkKCkgd2lsbCBub3cgcmVxdWlyZSBldmFs
dWF0aW9uIG9uIEFybSBldmVuIGl0IGlzIApldmFsdWF0ZXMgdG8gdHJ1ZS4uLiBUaGlzIHdpbGwg
cHJldmVudCB0aGUgY29tcGlsZXIgdG8gcmVtb3ZlIGFueSBub24tSEFQIGNvZGUgCnBhdGhzIChh
c3N1bWluZyB0aGVyZSBhcmUgYW55IGluIHRoZSBjb21tb24gY29kZSkuCgpGdXJ0aGVybW9yZSwg
MiBwYXJ0cyBvZiB0aGUgaW9tbXVfdXNlX2hhcF9wdCgpIGNvbmRpdGlvbiB3aWxsIGFsd2F5cyBy
ZXR1cm5pbmcgCmFsd2F5cyB0cnVlLiBCdXQgYXMgdGhleSBhcmUgbm9uLWNvbnN0YW50LCBzbyB0
aGV5IHdpbGwgYWx3YXlzIGJlIGV2YWx1YXRlZC4KCkl0IGlzIGFsc28gcHJvYmFibHkgZ29pbmcg
dG8gY29uZnVzZSBkZXZlbG9wZXIgYXMgdGhleSBtYXkgdGhpbmsgbm9uLUhBUCBpcyAKc3VwcG9y
dGVkIG9uIEFybS4gWW91IGNhbid0IGZpbmQgZWFzaWx5IHRoYXQgYm90aCBoYXBfZW5hYmxlZCgu
Li4pIGFuZCAKaW9tbXVfaGFwX3B0X3NoYXJlIHdpbGwgYWx3YXlzIGV2YWx1YXRlIHRvIHRydWUu
CgpTbyBhc2lkZSB0aGUgY29tbW9uIGltcGxlbWVudGF0aW9uLCB3aGF0IGlzIHRoZSByZWFsIGdh
aW4gZm9yIEFybT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
