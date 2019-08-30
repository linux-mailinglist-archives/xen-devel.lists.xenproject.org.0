Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC04A38D7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hZ9-0000NM-11; Fri, 30 Aug 2019 14:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hZ7-0000NH-DV
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 14:07:49 +0000
X-Inumbo-ID: 847f214a-cb2f-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 847f214a-cb2f-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 14:07:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 856C4AE14;
 Fri, 30 Aug 2019 14:07:35 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-6-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a76d459f-55dc-eee4-d6ee-b7cb9a4dd333@suse.com>
Date: Fri, 30 Aug 2019 16:07:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830082953.2192-6-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxMDoyOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCj4gQEAgLTQ5LDcgKzQ5LDExIEBAIGludDhfdCBfX2h3ZG9tX2luaXRkYXRhIGlvbW11
X2h3ZG9tX3Jlc2VydmVkID0gLTE7Cj4gICAqIGRlZmF1bHQgdW50aWwgd2UgZmluZCBhIGdvb2Qg
c29sdXRpb24gdG8gcmVzb2x2ZSBpdC4KPiAgICovCj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlv
bW11X2ludHBvc3Q7Cj4gLWJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2hhcF9wdF9zaGFyZSA9
IDE7Cj4gKwo+ICsjaWZuZGVmIENPTkZJR19BUk0KPiArYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11
X2hhcF9wdF9zaGFyZSA9IHRydWU7Cj4gKyNlbmRpZgoKVGhlICNpZGVmIGhlcmUgc2hvdWxkIGJl
IGluIGxpbmUgd2l0aCAuLi4KCj4gQEAgLTEwMiw4ICsxMDYsMTAgQEAgc3RhdGljIGludCBfX2lu
aXQgcGFyc2VfaW9tbXVfcGFyYW0oY29uc3QgY2hhciAqcykKPiAgICAgICAgICAgICAgaW9tbXVf
aHdkb21fcGFzc3Rocm91Z2ggPSB2YWw7Cj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJz
ZV9ib29sZWFuKCJkb20wLXN0cmljdCIsIHMsIHNzKSkgPj0gMCApCj4gICAgICAgICAgICAgIGlv
bW11X2h3ZG9tX3N0cmljdCA9IHZhbDsKPiArI2lmbmRlZiBpb21tdV9oYXBfcHRfc2hhcmUKPiAg
ICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInNoYXJlcHQiLCBzLCBzcykp
ID49IDAgKQo+ICAgICAgICAgICAgICBpb21tdV9oYXBfcHRfc2hhcmUgPSB2YWw7Cj4gKyNlbmRp
ZgoKLi4uIHRoZSBvbmUgaGVyZSwgaS5lLiBuZWl0aGVyIHNob3VsZCBiZSBBcm0tc3BlY2lmaWMu
IFdoYXQgYSBzcGVjaWZpYwphcmNoaXRlY3R1cmUgd2FudHMgc2hvdWxkIGJlIGNvbnRyb2xsZWQg
aW4gYSBzaW5nbGUgcGxhY2UgKGluIGEgaGVhZGVyKS4KCj4gQEAgLTI2OCw2ICsyNzQsMTcgQEAg
c3RydWN0IGRvbWFpbl9pb21tdSB7Cj4gICNkZWZpbmUgaW9tbXVfc2V0X2ZlYXR1cmUoZCwgZikg
ICBzZXRfYml0KGYsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpCj4gICNkZWZpbmUgaW9tbXVfY2xl
YXJfZmVhdHVyZShkLCBmKSBjbGVhcl9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykKPiAg
Cj4gKy8qIEFyZSB3ZSB1c2luZyB0aGUgZG9tYWluIFAyTSB0YWJsZSBhcyBpdHMgSU9NTVUgcGFn
ZXRhYmxlPyAqLwo+ICsjZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgXAo+ICsgICAgKGhhcF9l
bmFibGVkKGQpICYmIGlzX2lvbW11X2VuYWJsZWQoZCkgJiYgaW9tbXVfaGFwX3B0X3NoYXJlKQo+
ICsKPiArLyogRG9lcyB0aGUgSU9NTVUgcGFnZXRhYmxlIG5lZWQgdG8gYmUga2VwdCBzeW5jaHJv
bml6ZWQgd2l0aCB0aGUgUDJNICovCj4gKyNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdICj4g
KyNkZWZpbmUgbmVlZF9pb21tdV9wdF9zeW5jKGQpICAgICAoZG9tX2lvbW11KGQpLT5uZWVkX3N5
bmMpCj4gKyNlbHNlCj4gKyNkZWZpbmUgbmVlZF9pb21tdV9wdF9zeW5jKGQpICAgICAoeyAodm9p
ZClkOyBmYWxzZTsgfSkKCiJkIiB3YW50cyB0byBiZSBwYXJlbnRoZXNpemVkLgoKV2l0aCB0aGVz
ZSB0YWtlbiBjYXJlIG9mIChwb3NzaWJseSB3aGlsZSBjb21taXR0aW5nKQpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
