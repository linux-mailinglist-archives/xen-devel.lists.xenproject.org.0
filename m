Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B2859F9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 07:47:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvbCK-0003cx-J2; Thu, 08 Aug 2019 05:42:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Renm=WE=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1hvbCI-0003cs-L7
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 05:42:46 +0000
X-Inumbo-ID: 57d1bf19-b99f-11e9-8980-bc764e045a96
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57d1bf19-b99f-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 05:42:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 463y252c4Xz9sN1;
 Thu,  8 Aug 2019 15:42:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20190807013340.9706-39-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <20190807013340.9706-39-jhubbard@nvidia.com>
Date: Thu, 08 Aug 2019 15:42:34 +1000
Message-ID: <87k1botdpx.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 38/41] powerpc: convert put_page() to
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0?= =?utf-8?B?bWU=?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSm9obiwKCmpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JpdGVzOgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaW9tbXVfYXBpLmMKPiBpbmRleCBiMDU2Y2FlMzM4OGIuLmUxMjYxOTNiYTI5NSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKPiArKysgYi9h
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKPiBAQCAtMjAzLDYgKzIwMiw3IEBA
IHN0YXRpYyB2b2lkIG1tX2lvbW11X3VucGluKHN0cnVjdCBtbV9pb21tdV90YWJsZV9ncm91cF9t
ZW1fdCAqbWVtKQo+ICB7Cj4gIAlsb25nIGk7Cj4gIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7
Cj4gKwlib29sIGRpcnR5ID0gZmFsc2U7CgpJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoYXQgaW5p
dGlhbGlzYXRpb24gZG8geW91PwoKPiAgCWlmICghbWVtLT5ocGFzKQo+ICAJCXJldHVybjsKPiBA
QCAtMjE1LDEwICsyMTUsOSBAQCBzdGF0aWMgdm9pZCBtbV9pb21tdV91bnBpbihzdHJ1Y3QgbW1f
aW9tbXVfdGFibGVfZ3JvdXBfbWVtX3QgKm1lbSkKPiAgCQlpZiAoIXBhZ2UpCj4gIAkJCWNvbnRp
bnVlOwo+ICAKPiAtCQlpZiAobWVtLT5ocGFzW2ldICYgTU1fSU9NTVVfVEFCTEVfR1JPVVBfUEFH
RV9ESVJUWSkKPiAtCQkJU2V0UGFnZURpcnR5KHBhZ2UpOwo+ICsJCWRpcnR5ID0gbWVtLT5ocGFz
W2ldICYgTU1fSU9NTVVfVEFCTEVfR1JPVVBfUEFHRV9ESVJUWTsKPiAtCQlwdXRfcGFnZShwYWdl
KTsKPiArCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZwYWdlLCAxLCBkaXJ0eSk7Cj4gIAkJ
bWVtLT5ocGFzW2ldID0gMDsKPiAgCX0KPiAgfQoKY2hlZXJzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
