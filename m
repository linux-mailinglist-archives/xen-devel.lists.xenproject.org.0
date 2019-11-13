Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30663FB20E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtBm-0004Iu-VL; Wed, 13 Nov 2019 14:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w/br=ZF=bombadil.srs.infradead.org=batv+b6a0ef5c1751a0763e03+5925+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1iUtBl-0004EQ-O2
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:00:05 +0000
X-Inumbo-ID: e30ad654-061d-11ea-9631-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e30ad654-061d-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mr4RY3jvcUlwtWVilQSRD7aASsaH0ZVmNXKgXD4ar2I=; b=L4pEOF8gToeI1wxRP1AwsUyj7
 it0aZ/H3gzMqN/frlWv7pf8ACU3+ysRk7aQMNDAwKSfgsnYZtpbRLVOgl2xWx2oZDjs6GDaFt9WvR
 l/NQ2gO/K3Ot7KXxQGR4VKhxlIaN3GUEGwzrCHmhIUE4AAL0RvwNFG3C6vKao2bg2rryraoP9pDjJ
 M9IDd6BxvnT2iTiJ3v7dvNhUY1+or3v58FJ4rYsLWxgRZsp54JWPrtILV8uaQiYhqnc+PE8/Af1RU
 FAMu2LxxYuyc1s+r4BStFsKVk8JJ0/AZtijke8xPvXEVjlaYoNKs52mvNP7KuysuicWSP/O+gJLCs
 9wgg5VPgA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iUtBY-0001WY-NU; Wed, 13 Nov 2019 13:59:52 +0000
Date: Wed, 13 Nov 2019 05:59:52 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20191113135952.GB20531@infradead.org>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112202231.3856-3-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, xen-devel@lists.xenproject.org,
 Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Felix.Kuehling@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAraW50IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9pbnNlcnQoc3RydWN0IG1tdV9pbnRlcnZhbF9u
b3RpZmllciAqbW5pLAo+ICsJCQkJIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25n
IHN0YXJ0LAo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgbGVuZ3RoLAo+ICsJCQkJIGNvbnN0IHN0cnVj
dCBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfb3BzICpvcHMpOwo+ICtpbnQgbW11X2ludGVydmFsX25v
dGlmaWVyX2luc2VydF9sb2NrZWQoCj4gKwlzdHJ1Y3QgbW11X2ludGVydmFsX25vdGlmaWVyICpt
bmksIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICsJdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWdu
ZWQgbG9uZyBsZW5ndGgsCj4gKwljb25zdCBzdHJ1Y3QgbW11X2ludGVydmFsX25vdGlmaWVyX29w
cyAqb3BzKTsKClZlcnkgaW5jb25zaXN0ZW50IGluZGVudGF0aW9uIGJldHdlZW4gdGhlc2UgdHdv
IHJlbGF0ZWQgZnVuY3Rpb25zLgoKPiArCS8qCj4gKwkgKiBUaGUgaW52X2VuZCBpbmNvcnBvcmF0
ZXMgYSBkZWZlcnJlZCBtZWNoYW5pc20gbGlrZQo+ICsJICogcnRubF91bmxvY2soKS4gQWRkcyBh
bmQgcmVtb3ZlcyBhcmUgcXVldWVkIHVudGlsIHRoZSBmaW5hbCBpbnZfZW5kCj4gKwkgKiBoYXBw
ZW5zIHRoZW4gdGhleSBhcmUgcHJvZ3Jlc3NlZC4gVGhpcyBhcnJhbmdlbWVudCBmb3IgdHJlZSB1
cGRhdGVzCj4gKwkgKiBpcyB1c2VkIHRvIGF2b2lkIHVzaW5nIGEgYmxvY2tpbmcgbG9jayBkdXJp
bmcKPiArCSAqIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQuCgpOaXRwaWNrOiAgVGhhdCBjb21tZW50
IGNhbiBiZSBjb25kZW5zZWQgaW50byBvbmUgbGVzcyBsaW5lOgoKCS8qCgkgKiBUaGUgaW52X2Vu
ZCBpbmNvcnBvcmF0ZXMgYSBkZWZlcnJlZCBtZWNoYW5pc20gbGlrZSBydG5sX3VubG9jaygpLgoJ
ICogQWRkcyBhbmQgcmVtb3ZlcyBhcmUgcXVldWVkIHVudGlsIHRoZSBmaW5hbCBpbnZfZW5kIGhh
cHBlbnMgdGhlbgoJICogdGhleSBhcmUgcHJvZ3Jlc3NlZC4gVGhpcyBhcnJhbmdlbWVudCBmb3Ig
dHJlZSB1cGRhdGVzIGlzIHVzZWQgdG8KCSAqIGF2b2lkIHVzaW5nIGEgYmxvY2tpbmcgbG9jayBk
dXJpbmcgaW52YWxpZGF0ZV9yYW5nZV9zdGFydC4KCSAqLwoKPiArCS8qCj4gKwkgKiBUT0RPOiBT
aW5jZSB3ZSBhbHJlYWR5IGhhdmUgYSBzcGlubG9jayBhYm92ZSwgdGhpcyB3b3VsZCBiZSBmYXN0
ZXIKPiArCSAqIGFzIHdha2VfdXBfcQo+ICsJICovCj4gKwlpZiAobmVlZF93YWtlKQo+ICsJCXdh
a2VfdXBfYWxsKCZtbW5fbW0tPndxKTsKClNvIHdoeSBpcyB0aGlzIGltcG9ydGFudCBlbm91Z2gg
Zm9yIGEgVE9ETyBjb21tZW50LCBidXQgbm90IGltcG9ydGFudAplbm91Z2ggdG8gZG8gcmlnaHQg
YXdheT8KCj4gKwkgKiByZWxlYXNlIHNlbWFudGljcyBvbiB0aGUgaW5pdGlhbGl6YXRpb24gb2Yg
dGhlIG1tdV9ub3RpZmllcl9tbSdzCj4gKyAgICAgICAgICogY29udGVudHMgYXJlIHByb3ZpZGVk
IGZvciB1bmxvY2tlZCByZWFkZXJzLiAgYWNxdWlyZSBjYW4gb25seSBiZQo+ICsgICAgICAgICAq
IHVzZWQgd2hpbGUgaG9sZGluZyB0aGUgbW1ncmFiIG9yIG1tZ2V0LCBhbmQgaXMgc2FmZSBiZWNh
dXNlIG9uY2UKPiArICAgICAgICAgKiBjcmVhdGVkIHRoZSBtbXVfbm90aWZpZmVyX21tIGlzIG5v
dCBmcmVlZCB1bnRpbCB0aGUgbW0gaXMKPiArICAgICAgICAgKiBkZXN0cm95ZWQuICBBcyBhYm92
ZSwgdXNlcnMgaG9sZGluZyB0aGUgbW1hcF9zZW0gb3Igb25lIG9mIHRoZQo+ICsgICAgICAgICAq
IG1tX3Rha2VfYWxsX2xvY2tzKCkgZG8gbm90IG5lZWQgdG8gdXNlIGFjcXVpcmUgc2VtYW50aWNz
Lgo+ICAJICovCgpTb21lIHNwYWNlcyBpbnN0ZWFkIG9mIHRhYnMgaGVyZS4KCj4gK3N0YXRpYyBp
bnQgX19tbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0KAo+ICsJc3RydWN0IG1tdV9pbnRlcnZh
bF9ub3RpZmllciAqbW5pLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArCXN0cnVjdCBtbXVfbm90
aWZpZXJfbW0gKm1tbl9tbSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiArCXVuc2lnbmVkIGxvbmcg
bGVuZ3RoLCBjb25zdCBzdHJ1Y3QgbW11X2ludGVydmFsX25vdGlmaWVyX29wcyAqb3BzKQoKT2Rk
IGluZGVudGF0aW9uIC0gd2UgdXN1YWxsIGRvIHR3byB0YWJzIChteSBwcmVmZXJlbmNlKSBvciBh
bGlnbiBhZnRlcgp0aGUgb3BlbmluZyBicmFjZS4KCj4gKyAqIFRoaXMgZnVuY3Rpb24gbXVzdCBi
ZSBwYWlyZWQgd2l0aCBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0KCkuIEl0IGNhbm5vdCBi
ZQoKbGluZSA+IDgwIGNoYXJzLgoKT3RoZXJ3aXNlIHRoaXMgbG9va3MgZ29vZCBhbmQgdmVyeSBz
aW1pbGFyIHRvIHdoYXQgSSByZXZpZXdlZCBlYXJsaWVyOgoKUmV2aWV3ZWQtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
