Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E016FE1B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:45:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v5d-000442-C8; Wed, 26 Feb 2020 11:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6v5c-00043k-89
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:42:56 +0000
X-Inumbo-ID: 209b9fdc-588d-11ea-93ff-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 209b9fdc-588d-11ea-93ff-12813bfff9fa;
 Wed, 26 Feb 2020 11:42:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 546E1ADFE;
 Wed, 26 Feb 2020 11:42:54 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <9a5742f9-7533-d9b1-b93d-a3a85e5d8c9f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60b2dc81-0ed1-ecb1-b58a-10c6d40fe755@suse.com>
Date: Wed, 26 Feb 2020 12:43:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9a5742f9-7533-d9b1-b93d-a3a85e5d8c9f@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI1LzAyLzIwMjAg
MDk6NTMsIFBhdWwgRHVycmFudCB3cm90ZToKPj4gLS0tIGEveGVuL2NvbW1vbi90aW1lLmMKPj4g
KysrIGIveGVuL2NvbW1vbi90aW1lLmMKPj4gQEAgLTk5LDYgKzk5LDkgQEAgdm9pZCB1cGRhdGVf
ZG9tYWluX3dhbGxjbG9ja190aW1lKHN0cnVjdCBkb21haW4gKmQpCj4+ICAgICAgIHVpbnQzMl90
ICp3Y192ZXJzaW9uOwo+PiAgICAgICB1aW50NjRfdCBzZWM7Cj4+ICAgCj4+ICsgICAgaWYgKCBk
LT5pc19keWluZyApCj4+ICsgICAgICAgIHJldHVybjsKPiAKPiBUaGlzIGlzIGFub3RoZXIgaW5z
dGFuY2Ugd2hlcmUgSSB0aGluayB0aGUgdXNlIG9mIGQtPmlzX2R5aW5nIGlzIG5vdCAKPiBzYWZl
LiBJIGxvb2tlZCBhdCBob3cgb3RoZXIgcGxhY2VzIGluIFhlbiBkZWFsdCB3aXRoIGQtPmlzX2R5
aW5nLgo+IAo+IFdlIGRvbid0IHNlZW0gdG8gaGF2ZSBhIGNvbW1vbiB3YXkgdG8gZGVhbCB3aXRo
IGl0Ogo+ICAgICAxKSBJdCBtYXkgYmUgY2hlY2tlZCB1bmRlciBkb21haW5fbG9jaygpIC0+IE5v
IGlzc3VlIHdpdGggdGhhdAo+ICAgICAyKSBJdCBtYXkgYmUgY2hlY2tlZCB1bmRlciBkLT5wYWdl
X2FsbG9jX2xvY2sgKGUuZyBhc3NpZ25fcGFnZXMoKSkuIAo+IFRoZSBhc3NpZ25fcGFnZXMoKSBj
YXNlIGlzIGZpbmUgYmVjYXVzZSBpdCB3aWxsIGFjdCBhcyBhIGZ1bGwgYmFycmllci4gCj4gU28g
aWYgd2UgY2FsbCBoYXBwZW4gYWZ0ZXIgcmVsaW5xdWlzaF9tZW1vcnkoKSB0aGVuIHdlIHdpbGwg
c3VyZWx5IGhhdmUgCj4gb2JzZXJ2ZWQgZC0+aXNfZHlpbmcuIEkgaGF2ZW4ndCBjaGVja2VkIHRo
ZSBvdGhlcnMuCj4gCj4gU29tZSBvZiB0aGUgaW5zdGFuY2VzIHVzZXIgbmVpdGhlciB0aGUgMiBs
b2NrcyBhYm92ZS4gV2UgcHJvYmFibHkgb3VnaHQgCj4gdG8gaW52ZXN0aWdhdGUgdGhlbSAoSSB3
aWxsIGFkZCBhIFRPRE8gaW4gbXkgbGlzdCkuCj4gCj4gUmVnYXJkaW5nIHRoZSB0d28gY2FzZXMg
aGVyZSwgZG9tYWluX2xvY2soKSBtaWdodCBiZSB0aGUgc29sdXRpb24uIElmIHdlIAo+IGFyZSBj
b25jZXJuIGFib3V0IHRoZSBjb250ZW50aW9uIChpdCBpcyBhIHNwaW5sb2NrKSwgdGhlbiB3ZSBj
b3VsZCAKPiBzd2l0Y2ggdGhlIGRvbWFpbl9sb2NrKCkgZnJvbSBzcGlubG9jayB0byByd2xvY2su
CgpUaGF0J3MgYW4gb3B0aW9uLCB5ZXMsIGJ1dCBldmVuIGJldHRlciB3b3VsZCBiZSB0byBhdm9p
ZCBzcHJlYWRpbmcKdXNlIG9mIHRoaXMgbG9jayAod2UgZGlkIHRyeSB0byByZW1vdmUgYXMgbWFu
eSBvZiB0aGUgdXNlcyBhcwpwb3NzaWJsZSBzZXZlcmFsIHllYXJzIGFnbykuIEZvciBkLT5pc19k
eWluZyBJIHRoaW5rIGl0IGlzIGEgY2FzZS0KYnktY2FzZSBqdXN0aWZpY2F0aW9uIG9mIHdoeSBh
IHVzZSBpcyBzYWZlICh0aGUgbWFpbiBwb2ludCwgYWZ0ZXIKYWxsIGJlaW5nIHRoYXQgd2hhdGV2
ZXIgY29kZSBjb21lcyBhZnRlciB0aGUgY2hlY2sgbXVzdCB3b3JrCmNvcnJlY3RseSBpZiBvbiBz
b21lIG90aGVyIENQVSB0aGUgZmxhZyBpcyBhYm91dCB0byBiZSAvIGJlaW5nIHNldC4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
