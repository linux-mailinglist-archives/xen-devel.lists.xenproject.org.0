Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF936879CE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw3t9-0002Wy-0T; Fri, 09 Aug 2019 12:20:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ce4=WF=ellerman.id.au=mpe@srs-us1.protection.inumbo.net>)
 id 1hw3t7-0002Wd-Hn
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:20:53 +0000
X-Inumbo-ID: 1f85198b-baa0-11e9-8980-bc764e045a96
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1f85198b-baa0-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 12:20:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 464kpy5K69z9sBF;
 Fri,  9 Aug 2019 22:20:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <248c9ab2-93cc-6d8b-606d-d85b83e791e5@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <20190807013340.9706-39-jhubbard@nvidia.com>
 <87k1botdpx.fsf@concordia.ellerman.id.au>
 <248c9ab2-93cc-6d8b-606d-d85b83e791e5@nvidia.com>
Date: Fri, 09 Aug 2019 22:20:40 +1000
Message-ID: <875zn6ttrb.fsf@concordia.ellerman.id.au>
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
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
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

Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPiB3cml0ZXM6Cj4gT24gOC83LzE5IDEw
OjQyIFBNLCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOgo+PiBIaSBKb2huLAo+PiAKPj4gam9obi5o
dWJiYXJkQGdtYWlsLmNvbSB3cml0ZXM6Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21t
L2Jvb2szczY0L2lvbW11X2FwaS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11X2Fw
aS5jCj4+PiBpbmRleCBiMDU2Y2FlMzM4OGIuLmUxMjYxOTNiYTI5NSAxMDA2NDQKPj4+IC0tLSBh
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwo+Pj4gKysrIGIvYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L2lvbW11X2FwaS5jCj4+PiBAQCAtMjAzLDYgKzIwMiw3IEBAIHN0YXRp
YyB2b2lkIG1tX2lvbW11X3VucGluKHN0cnVjdCBtbV9pb21tdV90YWJsZV9ncm91cF9tZW1fdCAq
bWVtKQo+Pj4gIHsKPj4+ICAJbG9uZyBpOwo+Pj4gIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7
Cj4+PiArCWJvb2wgZGlydHkgPSBmYWxzZTsKPj4gCj4+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQg
dGhhdCBpbml0aWFsaXNhdGlvbiBkbyB5b3U/Cj4+IAo+Cj4gTm9wZSwgaXQgY2FuIGdvLiBGaXhl
ZCBsb2NhbGx5LCB0aGFua3MuCgpUaGFua3MuCgo+IERpZCB5b3UgZ2V0IGEgY2hhbmNlIHRvIGxv
b2sgYXQgZW5vdWdoIG9mIHRoZSBvdGhlciBiaXRzIHRvIGZlZWwgY29tZm9ydGFibGUgCj4gd2l0
aCB0aGUgcGF0Y2gsIG92ZXJhbGw/CgpNb3N0bHkgOikgSXQncyBub3QgcmVhbGx5IG15IGFyZWEs
IGJ1dCBhbGwgdGhlIGNvbnZlcnNpb25zIGxvb2tlZApjb3JyZWN0IHRvIG1lIGFzIGJlc3QgYXMg
SSBjb3VsZCB0ZWxsLgoKU28gSSdtIGZpbmUgZm9yIGl0IHRvIGdvIGluIGFzIHBhcnQgb2YgdGhl
IHNlcmllczoKCkFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+
IChwb3dlcnBjKQoKY2hlZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
