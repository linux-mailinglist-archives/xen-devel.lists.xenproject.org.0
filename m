Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449ADBF2BD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 14:16:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDSdo-0006oC-Sw; Thu, 26 Sep 2019 12:13:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDSdn-0006o7-0Y
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:12:59 +0000
X-Inumbo-ID: f9aa4c06-e056-11e9-9650-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f9aa4c06-e056-11e9-9650-12813bfff9fa;
 Thu, 26 Sep 2019 12:12:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7DEE2B13C;
 Thu, 26 Sep 2019 12:12:56 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190926100308.33936-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdf976be-a598-2b97-6810-9080a7073957@suse.com>
Date: Thu, 26 Sep 2019 14:12:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926100308.33936-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] iommu: avoid triggering
 ASSERT_UNREACHABLE() on ARM...
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr <olekstysh@gmail.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxMjowMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLndoZW4gdGhlIElP
TU1VIGlzIG5vdCBlbmFibGVkLgo+IAo+IDgwZmYzZDMzOGRjOSAiaW9tbXU6IHRpZHkgdXAgaW9t
bXVfdXNlX2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5bmMoKQo+IG1hY3JvcyIgaW50cm9k
dWNlZCBDT05GSUdfSU9NTVVfRk9SQ0VfUFRfU0hBUkUsIHdoaWNoIGNhdXNlcyB0aGUgZ2xvYmFs
Cj4gJ2lvbW11X2hhcF9wdF9zaGFyZScgb3B0aW9uIHRvIGJlIHJlcGxhY2VkIHdpdGggYSAjZGVm
aW5lLWQgdmFsdWUgb2YgdHJ1ZS4KPiBJbiB0aGlzIGNvbmZpZ3VyYXRpb24sIGNhbGxpbmcgY2xl
YXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgd2lsbCByZXN1bHQKPiB0cmlnZ2VyIHRoZSBhZm9yZW1l
bnRpb25lZCBBU1NFUlQuCj4gCj4gQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFIGlzIGFsd2F5
cyBzZWxlY3RlZCBmb3IgQVJNIGJ1aWxkcyBhbmQsCj4gYmVjYXVzZSBjbGVhcl9pb21tdV9oYXBf
cHRfc2hhcmUoKSBpcyBjYWxsZWQgYnkgdGhlIGNvbW1vbiBpb21tdV9zZXR1cCgpCj4gZnVuY3Rp
b24gaWYgdGhlIElPTU1VIGlzIG5vdCBlbmFibGVkLCBpdCBpcyBubyBsb25nZXIgc2FmZSB0byBk
aXNhYmxlIHRoZQo+IElPTU1VIG9uIEFSTSBzeXN0ZW1zLgo+IAo+IEhvd2V2ZXIsIHJ1bm5pbmcg
d2l0aCB0aGUgSU9NTVUgZGlzYWJsZWQgaXMgYSB2YWxpZCBjb25maWd1cmF0aW9uIGZvciBBUk0K
PiBzeXN0ZW1zLCBzbyB0aGlzIHBhdGNoIHJlY3RpZmllcyB0aGUgcHJvYmxlbSBieSByZW1vdmlu
ZyB0aGUgY2FsbCB0bwo+IGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIGZyb20gY29tbW9uIGNv
ZGUuIEFzIGEgc2lkZSBlZmZlY3Qgb2YgdGhpcywKPiBob3dldmVyLCBpdCBiZWNvbWVzIHBvc3Np
YmxlIG9uIHg4NiBzeXN0ZW1zIGZvciBpb21tdV9lbmFibGVkIHRvIGJlIGZhbHNlCj4gYnV0IGlv
bW11X2hhcF9wdF9zaGFyZSB0byBiZSB0cnVlLiBUaHVzIHRoZSBjb2RlIGluIHN5c2N0bC5jCj4g
bmVlZHMgdG8gYmUgY2hhbmdlZCB0byBtYWtlIHN1cmUgdGhhdCBYRU5fU1lTQ1RMX1BIWVNDQVBf
aW9tbXVfaGFwX3B0X3NoYXJlCj4gaXMgbm90IGVycm9uZW91c2x5IGFkdmVydGlzZWQgd2hlbiB0
aGUgSU9NTVUgaGFzIGJlZW4gZGlzYWJsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXBvcnRlZC1ieTogT2xla3NhbmRyIDxv
bGVrc3R5c2hAZ21haWwuY29tPgoKUHJlZmVyYWJseSB3aXRoIHRoZSBhZGp1c3RtZW50cyBtYW50
aW9uZWQgZWxzZXdoZXJlClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
