Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3EB9DFAC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 09:56:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2WIS-0005i4-Mn; Tue, 27 Aug 2019 07:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2WIR-0005hy-4E
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 07:53:43 +0000
X-Inumbo-ID: c9a622b0-c89f-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9a622b0-c89f-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 07:53:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 819F3B128;
 Tue, 27 Aug 2019 07:53:41 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-6-paul.durrant@citrix.com>
 <805cd751-819a-a7d6-0755-9e82bcde2a37@suse.com>
 <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a9f02c8-55e6-40f2-324d-5d41d5251a33@suse.com>
Date: Tue, 27 Aug 2019 09:53:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <57e844af36d449d0a8961793e8649827@AMSPEX02CL03.citrite.net>
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
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 IanJackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDguMjAxOSAxMjoxMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDA3IEF1Z3VzdCAyMDE5IDExOjQxCj4+
Cj4+IE9uIDMwLjA3LjIwMTkgMTU6NDQsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IFRoZXMgbWFj
cm9zIHJlYWxseSBvdWdodCB0byBsaXZlIGluIHRoZSBjb21tb24geGVuL2lvbW11LmggaGVhZGVy
IHJhdGhlcgo+Pj4gdGhlbiBiZWluZyBkaXN0cmlidXRlZCBhbW9uZ3N0IGFyY2hpdGVjdHVyZSBz
cGVjaWZpYyBpb21tdSBoZWFkZXJzIGFuZAo+Pj4geGVuL3NjaGVkLmguIFRoaXMgcGF0Y2ggbW92
ZXMgdGhlbSB0aGVyZS4KPj4+Cj4+PiBOT1RFOiBEaXNhYmxpbmcgJ3NoYXJlcHQnIGluIHRoZSBj
b21tYW5kIGxpbmUgaW9tbXUgb3B0aW9ucyBzaG91bGQgcmVhbGx5Cj4+PiAgICAgICAgIGJlIGhh
cmQgZXJyb3Igb24gQVJNIChhcyBvcHBvc2VkIHRvIGp1c3QgYmVpbmcgaWdub3JlZCksIHNvIGF2
b2lkCj4+PiAgICAgICAgIHBhcnNpbmcgdGhhdCBvcHRpb24gaWYgQ09ORklHX0FSTSBpcyBzZXQu
Cj4+Cj4+IEFncmVlZC4gQXQgdGhhdCBwb2ludCB0aGUgbGF0ZXN0IGl0IHdvdWxkIHBlcmhhcHMg
YmUgZ29vZCB0byBoYXZlCj4+IEFybSBoYXZlCj4+ICNkZWZpbmUgaW9tbXVfaGFwX3B0X3NoYXJl
IHRydWUKPiAKPiBJIGRvbid0IHF1aXRlIGZvbGxvdy4gaW9tbXVfaGFwX3B0X3NoYXJlIGlzIGEg
Z2xvYmFsIGJvb2xfdCBkZWZpbmVkIGluIHBhc3N0aHJvdWdoL2lvbW11LmMuLi4gSSdtIGp1c3Qg
cHJldmVudGluZyBhbiBBUk0gY29tbWFuZCBsaW5lIGZyb20gYmVpbmcgYWJsZSB0byBjaGFuZ2Ug
dGhlIHZhbHVlLi4uIHNvIGluIGVmZmVjdCBpdCB3aWxsIGFsd2F5cyBiZSB0cnVlIGZvciBBUk0u
CgpUaGUgcG9pbnQgb2YgbXkgY29tbWVudCB3YXMgdG8gYWxsb3cgdGhlIGNvbXBpbGVyIHRvIGVs
aW1pbmF0ZSBkZWFkCihvbiBBcm0pIGNvZGUuIEFsb25nIHRoZSBsaW5lcyBvZiBKdWxpZW4ncyBz
dWJzZXF1ZW50IHJlcGxpZXMsIHRoaW5ncwpsaWtlIGhhcF9lbmFibGVkKCkgYW5kIHRoZSBvbmUg
aGVyZSBzaG91bGQgaW1vIGJlIGNvbXBpbGUgdGltZQpjb25zdGFudHMgKHJhdGhlciB0aGFuIHJ1
bnRpbWUgb25lcykgZm9yIHRoaXMgcmVhc29uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
