Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3047080475
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 06:54:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htm0T-0003fk-ST; Sat, 03 Aug 2019 04:51:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vBdf=V6=kernel.org=jlayton@srs-us1.protection.inumbo.net>)
 id 1htg6K-0003sQ-SB
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 22:32:40 +0000
X-Inumbo-ID: 6ea18dca-b575-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6ea18dca-b575-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 22:32:38 +0000 (UTC)
Received: from tleilax.poochiereds.net (cpe-71-70-156-158.nc.res.rr.com
 [71.70.156.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58F57206A3;
 Fri,  2 Aug 2019 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564785158;
 bh=z6ytUlp+CIECyVYgzsmKAgNAlD3y+8CHq71PuCQ0D+c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=cpjIBy8JqGDmfo2YvJ1zHX2H3F5SzV7XyBEUvKOoDGfZiHGtVeJHlsiNF8f/o/lw/
 1IriX/50tm1jxxFU6BHxnU7AmYr31cK1qfEIW7FiUI67JvLd42gEz50jymZEZTSESa
 2e28o/zwwAXm5Iq/SkAmipJbFc8z+f7/iU9PnXtA=
Message-ID: <2f0d5993e9731808b73b0018f5fc4b3335fc6373.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 02 Aug 2019 18:32:33 -0400
In-Reply-To: <20190802022005.5117-4-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-4-jhubbard@nvidia.com>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 03 Aug 2019 04:51:00 +0000
Subject: Re: [Xen-devel] [PATCH 03/34] net/ceph: convert put_page() to
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, Sage Weil <sage@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyMDE5LTA4LTAxIGF0IDE5OjE5IC0wNzAwLCBqb2huLmh1YmJhcmRAZ21haWwuY29t
IHdyb3RlOgo+IEZyb206IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBG
b3IgcGFnZXMgdGhhdCB3ZXJlIHJldGFpbmVkIHZpYSBnZXRfdXNlcl9wYWdlcyooKSwgcmVsZWFz
ZSB0aG9zZSBwYWdlcwo+IHZpYSB0aGUgbmV3IHB1dF91c2VyX3BhZ2UqKCkgcm91dGluZXMsIGlu
c3RlYWQgb2YgdmlhIHB1dF9wYWdlKCkgb3IKPiByZWxlYXNlX3BhZ2VzKCkuCj4gCj4gVGhpcyBp
cyBwYXJ0IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFzIGRlc2NyaWJlZCBpbiBjb21taXQgZmMx
ZDhlN2NjYTJkCj4gKCJtbTogaW50cm9kdWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVy
IHZlcnNpb25zIikuCj4gCj4gQ2M6IElseWEgRHJ5b21vdiA8aWRyeW9tb3ZAZ21haWwuY29tPgo+
IENjOiBTYWdlIFdlaWwgPHNhZ2VAcmVkaGF0LmNvbT4KPiBDYzogRGF2aWQgUy4gTWlsbGVyIDxk
YXZlbUBkYXZlbWxvZnQubmV0Pgo+IENjOiBjZXBoLWRldmVsQHZnZXIua2VybmVsLm9yZwo+IENj
OiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+ICBuZXQvY2VwaC9wYWdldmVjLmMgfCA4ICstLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvbmV0L2NlcGgvcGFnZXZlYy5jIGIvbmV0L2NlcGgvcGFnZXZlYy5jCj4g
aW5kZXggNjQzMDVlNzA1NmExLi5jODhmZmYyYWI5YmQgMTAwNjQ0Cj4gLS0tIGEvbmV0L2NlcGgv
cGFnZXZlYy5jCj4gKysrIGIvbmV0L2NlcGgvcGFnZXZlYy5jCj4gQEAgLTEyLDEzICsxMiw3IEBA
Cj4gIAo+ICB2b2lkIGNlcGhfcHV0X3BhZ2VfdmVjdG9yKHN0cnVjdCBwYWdlICoqcGFnZXMsIGlu
dCBudW1fcGFnZXMsIGJvb2wgZGlydHkpCj4gIHsKPiAtCWludCBpOwo+IC0KPiAtCWZvciAoaSA9
IDA7IGkgPCBudW1fcGFnZXM7IGkrKykgewo+IC0JCWlmIChkaXJ0eSkKPiAtCQkJc2V0X3BhZ2Vf
ZGlydHlfbG9jayhwYWdlc1tpXSk7Cj4gLQkJcHV0X3BhZ2UocGFnZXNbaV0pOwo+IC0JfQo+ICsJ
cHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwYWdlcywgbnVtX3BhZ2VzLCBkaXJ0eSk7Cj4gIAlr
dmZyZWUocGFnZXMpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woY2VwaF9wdXRfcGFnZV92ZWN0b3Ip
OwoKVGhpcyBwYXRjaCBsb29rcyBzYW5lIGVub3VnaC4gQXNzdW1pbmcgdGhhdCB0aGUgZWFybGll
ciBwYXRjaGVzIGFyZSBPSzoKCkFja2VkLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwu
b3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
