Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF0107C37
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2019 01:56:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYJgl-0002oD-GC; Sat, 23 Nov 2019 00:54:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xjRv=ZP=nvidia.com=rcampbell@srs-us1.protection.inumbo.net>)
 id 1iYJgj-0002o8-Th
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 00:54:13 +0000
X-Inumbo-ID: c3c2b72e-0d8b-11ea-b678-bc764e2007e4
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3c2b72e-0d8b-11ea-b678-bc764e2007e4;
 Sat, 23 Nov 2019 00:54:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd883360002>; Fri, 22 Nov 2019 16:54:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 22 Nov 2019 16:54:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 22 Nov 2019 16:54:11 -0800
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Sat, 23 Nov 2019 00:54:09 +0000
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@infradead.org>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca> <20191113135952.GB20531@infradead.org>
 <20191113164620.GG21728@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <cc5d4d76-df30-af7f-931c-eed8a7ada122@nvidia.com>
Date: Fri, 22 Nov 2019 16:54:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191113164620.GG21728@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574470454; bh=bqXekT37QvQAiJj5unYfuv1fXYv5e9H7W3TE2f93DwM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RbJQdgYI/dFjAHVBUW2cZh29EsZO0NHYznPqb2KeSMvLVVy+04SbUd55RqBkrkhJI
 jm/LeQz23dcFfabHtr7RQD84s0QA8rh3fsS0PRa3IJS+eqYq7MGRwyq9H+zGaLMfD3
 WqtNXVdcloKxtxdXWjpWt/eLYryP6nzidZyHs9Wc6z9xD5WKpR41oA1bXATTukQ9M6
 1cHg0E2riIVQJmWnCM05nnbGLP5OMxPkcPPjqw6VP5O8mhO6Ety7S9I+GFqlFd653y
 +sAZHnWhqHkw9LpDWRh+68ed97cLbzYBVPI8EPpFZTzn7/Bdkz3mnORzqe8mUjddCf
 k/1CQ6pwn+MUg==
Subject: Re: [Xen-devel] [PATCH v3 02/14] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDExLzEzLzE5IDg6NDYgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBXZWQsIE5v
diAxMywgMjAxOSBhdCAwNTo1OTo1MkFNIC0wODAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToK
Pj4+ICtpbnQgbW11X2ludGVydmFsX25vdGlmaWVyX2luc2VydChzdHJ1Y3QgbW11X2ludGVydmFs
X25vdGlmaWVyICptbmksCj4+PiArCQkJCSAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNp
Z25lZCBsb25nIHN0YXJ0LAo+Pj4gKwkJCQkgICAgICB1bnNpZ25lZCBsb25nIGxlbmd0aCwKPj4+
ICsJCQkJICAgICAgY29uc3Qgc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgKm9wcyk7
Cj4+PiAraW50IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnRfbG9ja2VkKAo+Pj4gKwlzdHJ1
Y3QgbW11X2ludGVydmFsX25vdGlmaWVyICptbmksIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4g
Kwl1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGxlbmd0aCwKPj4+ICsJY29uc3Qg
c3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgKm9wcyk7Cj4+Cj4+IFZlcnkgaW5jb25z
aXN0ZW50IGluZGVudGF0aW9uIGJldHdlZW4gdGhlc2UgdHdvIHJlbGF0ZWQgZnVuY3Rpb25zLgo+
IAo+IGNsYW5nLWZvcm1hdC4uIFRoZSBrZXJuZWwgY29uZmlnIGlzIHNldCB0byBwcmVmZXIgYSBs
aW5lIHVwIHVuZGVyIHRoZQo+ICggaWYgYWxsIHRoZSBhcmd1bWVudHMgd2lsbCBmaXQgd2l0aGlu
IHRoZSA4MCBjb2xzIG90aGVyd2lzZSBpdCBkb2VzIGEKPiAxIHRhYiBjb250aW51YXRpb24gaW5k
ZW50Lgo+IAo+Pj4gKwkvKgo+Pj4gKwkgKiBUaGUgaW52X2VuZCBpbmNvcnBvcmF0ZXMgYSBkZWZl
cnJlZCBtZWNoYW5pc20gbGlrZQo+Pj4gKwkgKiBydG5sX3VubG9jaygpLiBBZGRzIGFuZCByZW1v
dmVzIGFyZSBxdWV1ZWQgdW50aWwgdGhlIGZpbmFsIGludl9lbmQKPj4+ICsJICogaGFwcGVucyB0
aGVuIHRoZXkgYXJlIHByb2dyZXNzZWQuIFRoaXMgYXJyYW5nZW1lbnQgZm9yIHRyZWUgdXBkYXRl
cwo+Pj4gKwkgKiBpcyB1c2VkIHRvIGF2b2lkIHVzaW5nIGEgYmxvY2tpbmcgbG9jayBkdXJpbmcK
Pj4+ICsJICogaW52YWxpZGF0ZV9yYW5nZV9zdGFydC4KPj4KPj4gTml0cGljazogIFRoYXQgY29t
bWVudCBjYW4gYmUgY29uZGVuc2VkIGludG8gb25lIGxlc3MgbGluZToKPiAKPiBUaGUgcnRubF91
bmxvY2sgY2FuIG1vdmUgdXAgYSBsaW5lIHRvby4gTXkgZWRpdG9yIGlzIGZhaWxpbmcgbWUgb24K
PiB0aGlzLgo+IAo+Pj4gKwkvKgo+Pj4gKwkgKiBUT0RPOiBTaW5jZSB3ZSBhbHJlYWR5IGhhdmUg
YSBzcGlubG9jayBhYm92ZSwgdGhpcyB3b3VsZCBiZSBmYXN0ZXIKPj4+ICsJICogYXMgd2FrZV91
cF9xCj4+PiArCSAqLwo+Pj4gKwlpZiAobmVlZF93YWtlKQo+Pj4gKwkJd2FrZV91cF9hbGwoJm1t
bl9tbS0+d3EpOwo+Pgo+PiBTbyB3aHkgaXMgdGhpcyBpbXBvcnRhbnQgZW5vdWdoIGZvciBhIFRP
RE8gY29tbWVudCwgYnV0IG5vdCBpbXBvcnRhbnQKPj4gZW5vdWdoIHRvIGRvIHJpZ2h0IGF3YXk/
Cj4gCj4gTGV0cyBkcm9wIHRoZSBjb21tZW50LCBJJ20gbm90byBzdXJlIHdha2VfdXBfcSBpcyBl
dmVuIGEgZnVuY3Rpb24gdGhpcwo+IGxheWVyIHNob3VsZCBiZSBjYWxsaW5nLgoKQWN0dWFsbHks
IEkgdGhpbmsgeW91IGNhbiByZW1vdmUgdGhlICJuZWVkX3dha2UiIHZhcmlhYmxlIHNpbmNlIGl0
IGlzCnVuY29uZGl0aW9uYWxseSBzZXQgdG8gInRydWUiLgoKQWxzbywgdGhlIGNvbW1lbnQgaW5f
X21tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQoKSBzYXlzCiJtbmktPm1yX2ludmFsaWRhdGVf
c2VxIiBhbmQgSSB0aGluayB0aGF0IHNob3VsZCBiZQoibW5pLT5pbnZhbGlkYXRlX3NlcSIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
