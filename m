Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F047EC59
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 07:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htQRy-0008A9-F8; Fri, 02 Aug 2019 05:49:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FB0v=V6=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1htQRw-0008A4-M1
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 05:49:56 +0000
X-Inumbo-ID: 5a832e53-b4e9-11e9-8980-bc764e045a96
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5a832e53-b4e9-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 05:49:55 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d43cf030000>; Thu, 01 Aug 2019 22:49:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 01 Aug 2019 22:49:54 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 22:49:54 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 05:49:53 +0000
To: Juergen Gross <jgross@suse.com>, <john.hubbard@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-21-jhubbard@nvidia.com>
 <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d5140833-e9ee-beb5-ff0a-2d13a4fe819f@nvidia.com>
Date: Thu, 1 Aug 2019 22:48:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4471e9dc-a315-42c1-0c3c-55ba4eeeb106@suse.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564724995; bh=OWvjPY2RJnSXiNaT1G8Eyahp8MUAsm98cTkExQmaDUY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=g4+wbBM5eRNl11+v4FSAl8PrvEnWACjbjTJMUv4Ewv3g+h7PgD8hueH5dPeoF8sW5
 c20eFrVi38BUjWugKSUxA2GH7CM3A3OrXQMppFfNCHg/NTgln/g1EuAeIEfsheR70J
 47ajhTYRdBziMz0qVCHRjvKDjLN869T+rpjyKMqZQbhfLl80UOF5a6wxQMkyYeuu5C
 +SnQBQbOJUSigTfdZ2ZjmuC0GsGJhOMqTD72slI2rg2m1d7LKmLad2tBrS2UUN+9aI
 ixGXEdOyIH0YMQhEWsNGgp8xCyCNq0cOZ0EzzfGMekaZZJReXbXnLe2japHjsnQzSN
 gxuwPmkfTC8TQ==
Subject: Re: [Xen-devel] [PATCH 20/34] xen: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xLzE5IDk6MzYgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDIuMDguMTkgMDQ6
MTksIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4+IEZyb206IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KLi4uCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wcml2
Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPj4gaW5kZXggMmY1Y2U3MjMwYTQzLi4yOWU0
NjFkYmVlMmQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYwo+PiArKysgYi9k
cml2ZXJzL3hlbi9wcml2Y21kLmMKPj4gQEAgLTYxMSwxNSArNjExLDEwIEBAIHN0YXRpYyBpbnQg
bG9ja19wYWdlcygKPj4gwqAgc3RhdGljIHZvaWQgdW5sb2NrX3BhZ2VzKHN0cnVjdCBwYWdlICpw
YWdlc1tdLCB1bnNpZ25lZCBpbnQgbnJfcGFnZXMpCj4+IMKgIHsKPj4gLcKgwqDCoCB1bnNpZ25l
ZCBpbnQgaTsKPj4gLQo+PiDCoMKgwqDCoMKgIGlmICghcGFnZXMpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47Cj4+IC3CoMKgwqAgZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsK
Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChwYWdlc1tpXSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHV0X3BhZ2UocGFnZXNbaV0pOwo+PiAtwqDCoMKgIH0KPj4gK8KgwqDCoCBwdXRfdXNlcl9w
YWdlcyhwYWdlcywgbnJfcGFnZXMpOwo+IAo+IFlvdSBhcmUgbm90IGhhbmRsaW5nIHRoZSBjYXNl
IHdoZXJlIHBhZ2VzW2ldIGlzIE5VTEwgaGVyZS4gT3IgYW0gSQo+IG1pc3NpbmcgYSBwZW5kaW5n
IHBhdGNoIHRvIHB1dF91c2VyX3BhZ2VzKCkgaGVyZT8KPiAKCkhpIEp1ZXJnZW4sCgpZb3UgYXJl
IGNvcnJlY3QtLXRoaXMgbm8gbG9uZ2VyIGhhbmRsZXMgdGhlIGNhc2VzIHdoZXJlIHBhZ2VzW2ld
CmlzIE5VTEwuIEl0J3MgaW50ZW50aW9uYWwsIHRob3VnaCBwb3NzaWJseSB3cm9uZy4gOikKCkkg
c2VlIHRoYXQgSSBzaG91bGQgaGF2ZSBhZGRlZCBteSBzdGFuZGFyZCBibHVyYiB0byB0aGlzCmNv
bW1pdCBkZXNjcmlwdGlvbi4gSSBtaXNzZWQgdGhpcyBvbmUsIGJ1dCBzb21lIG9mIHRoZSBvdGhl
ciBwYXRjaGVzCmhhdmUgaXQuIEl0IG1ha2VzIHRoZSBmb2xsb3dpbmcsIHBvc3NpYmx5IGluY29y
cmVjdCBjbGFpbToKCiJUaGlzIGNoYW5nZXMgdGhlIHJlbGVhc2UgY29kZSBzbGlnaHRseSwgYmVj
YXVzZSBlYWNoIHBhZ2Ugc2xvdCBpbiB0aGUKcGFnZV9saXN0W10gYXJyYXkgaXMgbm8gbG9uZ2Vy
IGNoZWNrZWQgZm9yIE5VTEwuIEhvd2V2ZXIsIHRoYXQgY2hlY2sKd2FzIHdyb25nIGFueXdheSwg
YmVjYXVzZSB0aGUgZ2V0X3VzZXJfcGFnZXMoKSBwYXR0ZXJuIG9mIHVzYWdlIGhlcmUKbmV2ZXIg
YWxsb3dlZCBmb3IgTlVMTCBlbnRyaWVzIHdpdGhpbiBhIHJhbmdlIG9mIHBpbm5lZCBwYWdlcy4i
CgpUaGUgd2F5IEkndmUgc2VlbiB0aGVzZSBwYWdlIGFycmF5cyB1c2VkIHdpdGggZ2V0X3VzZXJf
cGFnZXMoKSwKdGhpbmdzIGFyZSBlaXRoZXIgZG9uZSBzaW5nbGUgcGFnZSwgb3Igd2l0aCBhIGNv
bnRpZ3VvdXMgcmFuZ2UuIFNvCnVubGVzcyBJJ20gbWlzc2luZyBhIGNhc2Ugd2hlcmUgc29tZW9u
ZSBpcyBlaXRoZXIKCmEpIHJlbGVhc2luZyBpbmRpdmlkdWFsIHBhZ2VzIHdpdGhpbiBhIHJhbmdl
IChhbmQgdGh1cyBsaWtlbHkgbWVzc2luZwp1cCB0aGVpciBjb3VudCBvZiBwYWdlcyB0aGV5IGhh
dmUpLCBvcgoKYikgYWxsb2NhdGluZyB0d28gZ3VwIHJhbmdlcyB3aXRoaW4gdGhlIHNhbWUgcGFn
ZXNbXSBhcnJheSwgd2l0aCBhCmdhcCBiZXR3ZWVuIHRoZSBhbGxvY2F0aW9ucywKCi4uLnRoZW4g
aXQgc2hvdWxkIGJlIGNvcnJlY3QuIElmIHNvLCB0aGVuIEknbGwgYWRkIHRoZSBhYm92ZSBibHVy
Ygp0byB0aGlzIHBhdGNoJ3MgY29tbWl0IGRlc2NyaXB0aW9uLgoKSWYgdGhhdCdzIG5vdCB0aGUg
Y2FzZSAoYm90aCBoZXJlLCBhbmQgaW4gMyBvciA0IG90aGVyIHBhdGNoZXMgaW4gdGhpcwpzZXJp
ZXMsIHRoZW4gYXMgeW91IHNhaWQsIEkgc2hvdWxkIGFkZCBOVUxMIGNoZWNrcyB0byBwdXRfdXNl
cl9wYWdlcygpCmFuZCBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuCgoKdGhhbmtzLAotLSAK
Sm9obiBIdWJiYXJkCk5WSURJQQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
