Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC04F2AEF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 10:42:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSeG1-0001f9-Ka; Thu, 07 Nov 2019 09:39:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSeFz-0001f4-Pf
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 09:39:11 +0000
X-Inumbo-ID: 72dd3c08-0142-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72dd3c08-0142-11ea-9631-bc764e2007e4;
 Thu, 07 Nov 2019 09:39:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 798AAB1B8;
 Thu,  7 Nov 2019 09:39:08 +0000 (UTC)
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-9-jgg@ziepe.ca>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8d2f67a8-7f71-9add-b130-f06b6c9227cb@suse.com>
Date: Thu, 7 Nov 2019 10:39:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028201032.6352-9-jgg@ziepe.ca>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 08/15] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
Cc: David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMTkgMjE6MTAsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBGcm9tOiBKYXNvbiBH
dW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gCj4gRE1BX1NIQVJFRF9CVUZGRVIgY2FuIG5v
dCBiZSBlbmFibGVkIGJ5IHRoZSB1c2VyIChpdCByZXByZXNlbnRzIGEgbGlicmFyeQo+IHNldCBp
biB0aGUga2VybmVsKS4gVGhlIGtjb25maWcgY29udmVudGlvbiBpcyB0byB1c2Ugc2VsZWN0IGZv
ciBzdWNoCj4gc3ltYm9scyBzbyB0aGV5IGFyZSB0dXJuZWQgb24gaW1wbGljaXRseSB3aGVuIHRo
ZSB1c2VyIGVuYWJsZXMgYSBrY29uZmlnCj4gdGhhdCBuZWVkcyB0aGVtLgo+IAo+IE90aGVyd2lz
ZSB0aGUgWEVOX0dOVERFVl9ETUFCVUYga2NvbmZpZyBpcyBvdmVybHkgZGlmZmljdWx0IHRvIGVu
YWJsZS4KPiAKPiBGaXhlczogOTMyZDY1NjIxNzllICgieGVuL2dudGRldjogQWRkIGluaXRpYWwg
c3VwcG9ydCBmb3IgZG1hLWJ1ZiBVQVBJIikKPiBDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
PG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IENjOiBCb3JpcyBPc3Ryb3Zza3kg
PGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KCkFwcGxpZWQgdG8geGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNWEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
